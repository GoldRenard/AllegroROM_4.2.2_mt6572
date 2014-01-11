.class Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhoneGlobals.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneGlobals;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhoneGlobalsBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/PhoneGlobals;


# direct methods
.method private constructor <init>(Lcom/android/phone/PhoneGlobals;)V
    .locals 0
    .parameter

    .prologue
    .line 1764
    iput-object p1, p0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/PhoneGlobals;Lcom/android/phone/PhoneGlobals$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1764
    invoke-direct {p0, p1}, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;-><init>(Lcom/android/phone/PhoneGlobals;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 32
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 1767
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lcom/mediatek/phone/ext/ExtensionManager;->getPhoneGlobalsBroadcastReceiverExtension()Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/phone/ext/PhoneGlobalsBroadcastReceiverExtension;->onReceive(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v28

    if-eqz v28, :cond_1

    .line 2092
    :cond_0
    :goto_0
    return-void

    .line 1771
    :cond_1
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    .line 1772
    .local v3, action:Ljava/lang/String;
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "PhoneGlobalsBroadcastReceiver -----action="

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1773
    const-string v28, "android.intent.action.AIRPLANE_MODE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_7

    .line 1774
    const-string v28, "state"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v11

    .line 1775
    .local v11, enabled:Z
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "PhoneGlobalsBroadcastReceiver ------ AIRPLANEMODE enabled="

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1776
    if-eqz v11, :cond_2

    .line 1777
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dismissMMIDialog()V

    .line 1782
    :cond_2
    if-eqz v11, :cond_3

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v28

    sget-object v29, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    if-eq v0, v1, :cond_3

    .line 1783
    const-string v28, "PhoneGlobals"

    const-string v29, "Hangup all calls before turning on airplane mode"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1784
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/CallManager;->hangupAllEx()Z
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1793
    :cond_3
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v28

    if-eqz v28, :cond_5

    .line 1794
    if-eqz v11, :cond_4

    .line 1795
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    check-cast v28, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/16 v29, -0x1

    invoke-virtual/range {v28 .. v29}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setRadioMode(I)V

    goto/16 :goto_0

    .line 1786
    :catch_0
    move-exception v10

    .line 1787
    .local v10, e:Lcom/android/internal/telephony/CallStateException;
    const-string v28, "PhoneGlobals"

    const-string v29, "CallStateException when mCM.hangupAllEx() in PhoneGlobalsBroadcastReceiver.onReceive(...)."

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1797
    .end local v10           #e:Lcom/android/internal/telephony/CallStateException;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    check-cast v28, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setRadioPowerOn()V

    goto/16 :goto_0

    .line 1800
    :cond_5
    if-eqz v11, :cond_6

    .line 1801
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x1

    invoke-interface/range {v28 .. v30}, Lcom/android/internal/telephony/Phone;->setRadioPower(ZZ)V

    goto/16 :goto_0

    .line 1803
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lcom/android/internal/telephony/Phone;->setRadioPowerOn()V

    goto/16 :goto_0

    .line 1832
    .end local v11           #enabled:Z
    :cond_7
    const-string v28, "android.intent.action.DUAL_SIM_MODE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_a

    .line 1833
    const-string v28, "mode"

    const/16 v29, 0x3

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    .line 1834
    .local v13, mode:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v28

    if-eqz v28, :cond_8

    .line 1835
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    check-cast v28, Lcom/android/internal/telephony/gemini/GeminiPhone;

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setRadioMode(I)V

    goto/16 :goto_0

    .line 1837
    :cond_8
    if-nez v13, :cond_9

    const/16 v19, 0x0

    .line 1838
    .local v19, radioStatus:Z
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    goto/16 :goto_0

    .line 1837
    .end local v19           #radioStatus:Z
    :cond_9
    const/16 v19, 0x1

    goto :goto_2

    .line 1840
    .end local v13           #mode:I
    :cond_a
    const-string v28, "android.intent.action.CONFIGURATION_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_c

    .line 1841
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v28

    if-eqz v28, :cond_b

    .line 1842
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    check-cast v28, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/gemini/GeminiPhone;->refreshSpnDisplay()V

    goto/16 :goto_0

    .line 1844
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lcom/android/internal/telephony/Phone;->refreshSpnDisplay()V

    goto/16 :goto_0

    .line 1846
    :cond_c
    const-string v28, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_d

    .line 1847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    const-string v29, "android.bluetooth.profile.extra.STATE"

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, v28

    iput v0, v1, Lcom/android/phone/PhoneGlobals;->mBluetoothHeadsetState:I

    .line 1849
    const-string v28, "PhoneGlobals"

    const-string v29, "mReceiver: HEADSET_STATE_CHANGED_ACTION"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1850
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "==> new state: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/phone/PhoneGlobals;->mBluetoothHeadsetState:I

    move/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1851
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    invoke-virtual/range {v28 .. v29}, Lcom/android/phone/PhoneGlobals;->updateBluetoothIndication(Z)V

    goto/16 :goto_0

    .line 1852
    :cond_d
    const-string v28, "android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_e

    .line 1853
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    const-string v29, "android.bluetooth.profile.extra.STATE"

    const/16 v30, 0xa

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    move/from16 v0, v29

    move-object/from16 v1, v28

    iput v0, v1, Lcom/android/phone/PhoneGlobals;->mBluetoothHeadsetAudioState:I

    .line 1856
    const-string v28, "PhoneGlobals"

    const-string v29, "mReceiver: HEADSET_AUDIO_STATE_CHANGED_ACTION"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1857
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "==> new state: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/phone/PhoneGlobals;->mBluetoothHeadsetAudioState:I

    move/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1858
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    invoke-virtual/range {v28 .. v29}, Lcom/android/phone/PhoneGlobals;->updateBluetoothIndication(Z)V

    goto/16 :goto_0

    .line 1859
    :cond_e
    const-string v28, "android.intent.action.ANY_DATA_STATE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_11

    .line 1860
    const-string v28, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1861
    .local v25, state:Ljava/lang/String;
    const-string v28, "reason"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1862
    .local v20, reason:Ljava/lang/String;
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "mReceiver: ACTION_ANY_DATA_CONNECTION_STATE_CHANGED state:"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " reason:"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1868
    const-string v28, "apnType"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1869
    .local v4, apnType:Ljava/lang/String;
    const-string v28, "default"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_0

    .line 1870
    const-string v28, "PhoneGlobals"

    const-string v29, "APN Type default."

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1874
    const-string v28, "DISCONNECTED"

    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_f

    const-string v28, "roamingOn"

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lcom/android/internal/telephony/Phone;->getDataRoamingEnabled()Z

    move-result v28

    if-nez v28, :cond_f

    const/4 v8, 0x1

    .line 1878
    .local v8, disconnectedDueToRoaming:Z
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    if-eqz v8, :cond_10

    const/16 v28, 0xa

    :goto_4
    move-object/from16 v0, v29

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 1874
    .end local v8           #disconnectedDueToRoaming:Z
    :cond_f
    const/4 v8, 0x0

    goto :goto_3

    .line 1878
    .restart local v8       #disconnectedDueToRoaming:Z
    :cond_10
    const/16 v28, 0xb

    goto :goto_4

    .line 1883
    .end local v4           #apnType:Ljava/lang/String;
    .end local v8           #disconnectedDueToRoaming:Z
    .end local v20           #reason:Ljava/lang/String;
    .end local v25           #state:Ljava/lang/String;
    :cond_11
    const-string v28, "android.intent.action.HEADSET_PLUG"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_13

    .line 1884
    const-string v28, "PhoneGlobals"

    const-string v29, "mReceiver: ACTION_HEADSET_PLUG"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1885
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "    state: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "state"

    const/16 v31, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1886
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "    name: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1887
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    const-string v28, "state"

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v28

    const/16 v30, 0x1

    move/from16 v0, v28

    move/from16 v1, v30

    if-ne v0, v1, :cond_12

    const/16 v28, 0x1

    :goto_5
    move-object/from16 v0, v29

    move/from16 v1, v28

    #setter for: Lcom/android/phone/PhoneGlobals;->mIsHeadsetPlugged:Z
    invoke-static {v0, v1}, Lcom/android/phone/PhoneGlobals;->access$1102(Lcom/android/phone/PhoneGlobals;Z)Z

    .line 1888
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    const/16 v30, 0x7

    const/16 v31, 0x0

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-virtual/range {v29 .. v31}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 1887
    :cond_12
    const/16 v28, 0x0

    goto :goto_5

    .line 1889
    :cond_13
    const-string v28, "android.intent.action.SIM_STATE_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_15

    .line 1895
    const-string v28, "simId"

    const/16 v29, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v26

    .line 1896
    .local v26, unlockSIMID:I
    const-string v28, "ss"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1898
    .local v27, unlockSIMStatus:Ljava/lang/String;
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "[unlock SIM card NO switched. Now] "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " is active."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1899
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "[unlockSIMStatus] : "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1901
    const-string v28, "READY"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_14

    .line 1902
    const/16 v7, 0x7d0

    .line 1903
    .local v7, delaySendMessage:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    const-string v31, "READY"

    invoke-virtual/range {v29 .. v31}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v29

    int-to-long v0, v7

    move-wide/from16 v30, v0

    invoke-virtual/range {v28 .. v31}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_0

    .line 1906
    .end local v7           #delaySendMessage:I
    :cond_14
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "[unlockSIMID : Other information]: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1908
    .end local v26           #unlockSIMID:I
    .end local v27           #unlockSIMStatus:Ljava/lang/String;
    :cond_15
    const-string v28, "android.intent.action.RADIO_TECHNOLOGY"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_16

    .line 1909
    const-string v28, "phoneName"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1910
    .local v15, newPhone:Ljava/lang/String;
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Radio technology switched. Now "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " is active."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1911
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    #calls: Lcom/android/phone/PhoneGlobals;->initForNewRadioTechnology()V
    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->access$1200(Lcom/android/phone/PhoneGlobals;)V

    goto/16 :goto_0

    .line 1912
    .end local v15           #newPhone:Ljava/lang/String;
    :cond_16
    const-string v28, "android.intent.action.SERVICE_STATE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_17

    .line 1913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p2

    #calls: Lcom/android/phone/PhoneGlobals;->handleServiceStateChanged(Landroid/content/Intent;)V
    invoke-static {v0, v1}, Lcom/android/phone/PhoneGlobals;->access$1300(Lcom/android/phone/PhoneGlobals;Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1914
    :cond_17
    const-string v28, "android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_19

    .line 1915
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsEcm(Lcom/android/internal/telephony/Phone;)Z

    move-result v28

    if-eqz v28, :cond_18

    .line 1916
    const-string v28, "PhoneGlobals"

    const-string v29, "Emergency Callback Mode arrived in PhoneGlobals."

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1918
    const-string v28, "phoneinECMState"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v28

    if-eqz v28, :cond_0

    .line 1919
    new-instance v28, Landroid/content/Intent;

    const-class v29, Lcom/android/phone/EmergencyCallbackModeService;

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_0

    .line 1925
    :cond_18
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Got ACTION_EMERGENCY_CALLBACK_MODE_CHANGED, but ECM isn\'t supported for phone: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Lcom/android/internal/telephony/Phone;->getPhoneName()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1928
    :cond_19
    const-string v28, "android.intent.action.DOCK_EVENT"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1a

    .line 1929
    const-string v28, "android.intent.extra.DOCK_STATE"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v28

    sput v28, Lcom/android/phone/PhoneGlobals;->mDockState:I

    .line 1931
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "ACTION_DOCK_EVENT -> mDockState = "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    sget v30, Lcom/android/phone/PhoneGlobals;->mDockState:I

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1932
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    const/16 v30, 0xd

    const/16 v31, 0x0

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-virtual/range {v29 .. v31}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 1933
    :cond_1a
    const-string v28, "com.android.internal.telephony.cdma.intent.action.TTY_PREFERRED_MODE_CHANGE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1b

    .line 1934
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    const-string v29, "ttyPreferredMode"

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    #setter for: Lcom/android/phone/PhoneGlobals;->mPreferredTtyMode:I
    invoke-static/range {v28 .. v29}, Lcom/android/phone/PhoneGlobals;->access$702(Lcom/android/phone/PhoneGlobals;I)I

    .line 1936
    const-string v28, "PhoneGlobals"

    const-string v29, "mReceiver: TTY_PREFERRED_MODE_CHANGE_ACTION"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1937
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "    mode: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v30, v0

    #getter for: Lcom/android/phone/PhoneGlobals;->mPreferredTtyMode:I
    invoke-static/range {v30 .. v30}, Lcom/android/phone/PhoneGlobals;->access$700(Lcom/android/phone/PhoneGlobals;)I

    move-result v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1938
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    const/16 v30, 0xe

    const/16 v31, 0x0

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-virtual/range {v29 .. v31}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 1939
    :cond_1b
    const-string v28, "android.media.RINGER_MODE_CHANGED"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1c

    .line 1940
    const-string v28, "android.media.EXTRA_RINGER_MODE"

    const/16 v29, 0x2

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v21

    .line 1942
    .local v21, ringerMode:I
    if-nez v21, :cond_0

    .line 1943
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/CallNotifier;->silenceRinger()V

    goto/16 :goto_0

    .line 1945
    .end local v21           #ringerMode:I
    :cond_1c
    const-string v28, "android.intent.action.ACTION_SHUTDOWN"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1d

    .line 1946
    const-string v28, "PhoneGlobals"

    const-string v29, "ACTION_SHUTDOWN received"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1947
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->addCallSync()V

    .line 1948
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/CallNotifier;->unregisterCallNotifierRegistrations()V

    goto/16 :goto_0

    .line 1949
    :cond_1d
    const-string v28, "com.android.stk.STKCALL_REGISTER_SPEECH_INFO"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1e

    .line 1950
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneUtils;->placeCallRegister(Lcom/android/internal/telephony/Phone;)V

    .line 1951
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    const/16 v29, 0x39

    const-wide/16 v30, 0xa0

    invoke-virtual/range {v28 .. v31}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 1953
    :cond_1e
    const-string v28, "com.android.phone.MISSEDCALL_DELETE_INTENT"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1f

    .line 1954
    const-string v28, "PhoneGlobals"

    const-string v29, "MISSEDCALL_DELETE_INTENT"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1955
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/NotificationMgr;->resetMissedCallNumber()V

    goto/16 :goto_0

    .line 1956
    :cond_1f
    const-string v28, "com.android.phone.NETWORK_MODE_CHANGE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_21

    .line 1957
    const-string v28, "com.android.phone.NETWORK_MODE_CHANGE"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    .line 1958
    .local v14, modemNetworkMode:I
    const-string v28, "simId"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v24

    .line 1959
    .local v24, slotId:I
    const-string v28, "com.android.phone.OLD_NETWORK_MODE"

    const/16 v29, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 1960
    .local v17, oldmode:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v28

    if-eqz v28, :cond_20

    .line 1961
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v9, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    check-cast v9, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 1962
    .local v9, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    const/16 v29, 0x271b

    move-object/from16 v0, v28

    move/from16 v1, v29

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2, v14}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, v24

    invoke-virtual {v9, v14, v0, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPreferredNetworkTypeGemini(ILandroid/os/Message;I)V

    goto/16 :goto_0

    .line 1965
    .end local v9           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v29, v0

    const/16 v30, 0x271b

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2, v14}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v29

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-interface {v0, v14, v1}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto/16 :goto_0

    .line 1968
    .end local v14           #modemNetworkMode:I
    .end local v17           #oldmode:I
    .end local v24           #slotId:I
    :cond_21
    const-string v28, "android.intent.action.ACTION_SHUTDOWN_IPO"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_25

    .line 1969
    const-string v28, "PhoneGlobals"

    const-string v29, "ACTION_SHUTDOWN_IPO received"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1970
    const-string v28, "gsm.ril.uicctype"

    const-string v29, ""

    invoke-static/range {v28 .. v29}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1971
    const-string v28, "gsm.ril.uicctype.2"

    const-string v29, ""

    invoke-static/range {v28 .. v29}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1972
    const-string v28, "ril.iccid.sim1"

    const/16 v29, 0x0

    invoke-static/range {v28 .. v29}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1973
    const-string v28, "ril.iccid.sim2"

    const/16 v29, 0x0

    invoke-static/range {v28 .. v29}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1975
    const-string v28, "sys.boot.reason"

    invoke-static/range {v28 .. v28}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1976
    .local v5, bootReason:Ljava/lang/String;
    const-string v28, "1"

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_24

    .line 1977
    const-string v28, "PhoneGlobals"

    const-string v29, "Alarm boot shutdown and not turn off radio again"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1996
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v28, v0

    if-eqz v28, :cond_22

    .line 1997
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/InCallUiState;->clearState()V

    .line 1999
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    #getter for: Lcom/android/phone/PhoneGlobals;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->access$200(Lcom/android/phone/PhoneGlobals;)Lcom/android/phone/InCallScreen;

    move-result-object v28

    if-eqz v28, :cond_23

    .line 2000
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    #getter for: Lcom/android/phone/PhoneGlobals;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->access$200(Lcom/android/phone/PhoneGlobals;)Lcom/android/phone/InCallScreen;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lcom/android/phone/InCallScreen;->internalHangupAllCalls(Lcom/android/internal/telephony/CallManager;)V

    .line 2005
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    move-object/from16 v28, v0

    if-eqz v28, :cond_0

    .line 2006
    const-string v28, "PhoneGlobals"

    const-string v29, "IPO Shutdown: call cancelMissedCallNotification()"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2007
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/NotificationMgr;->cancelMissedCallNotification()V

    goto/16 :goto_0

    .line 1979
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x1

    invoke-interface/range {v28 .. v30}, Lcom/android/internal/telephony/Phone;->setRadioPower(ZZ)V

    goto :goto_6

    .line 2010
    .end local v5           #bootReason:Ljava/lang/String;
    :cond_25
    const-string v28, "android.intent.action.ACTION_PREBOOT_IPO"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_28

    .line 2011
    const-string v28, "PhoneGlobals"

    const-string v29, "ACTION_PREBOOT_IPO received"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2012
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v28

    const-string v29, "sim_lock_state_setting"

    const-wide/16 v30, 0x0

    invoke-static/range {v28 .. v31}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 2015
    const-string v28, "sys.boot.reason"

    invoke-static/range {v28 .. v28}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2016
    .restart local v5       #bootReason:Ljava/lang/String;
    const-string v28, "1"

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_27

    .line 2017
    const-string v28, "PhoneGlobals"

    const-string v29, "Alarm boot detected"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2021
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lcom/android/internal/telephony/Phone;->setRadioPowerOn()V

    .line 2023
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v28, v0

    if-eqz v28, :cond_26

    .line 2024
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/InCallUiState;->clearState()V

    .line 2031
    :cond_26
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    move-object/from16 v28, v0

    if-eqz v28, :cond_0

    .line 2032
    const-string v28, "PhoneGlobals"

    const-string v29, "IPO Reboot: call showMissedCallNotification()"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2033
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const-wide/16 v30, 0x0

    invoke-virtual/range {v28 .. v31}, Lcom/android/phone/CallNotifier;->showMissedCallNotification(Lcom/android/internal/telephony/Connection;J)V

    goto/16 :goto_0

    .line 2019
    :cond_27
    const-string v28, "PhoneGlobals"

    const-string v29, "IPO boot up detected"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 2036
    .end local v5           #bootReason:Ljava/lang/String;
    :cond_28
    sget-object v28, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_START_MD_RESET:Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_29

    .line 2037
    const-string v28, "PhoneGlobals"

    const-string v29, "EVENT_3G_SWITCH_START_MD_RESET"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2038
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v28

    const-string v29, "sim_lock_state_setting"

    const-wide/16 v30, 0x0

    invoke-static/range {v28 .. v31}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto/16 :goto_0

    .line 2039
    :cond_29
    const-string v28, "android.intent.action.RADIO_OFF"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2a

    .line 2040
    const-string v28, "slotId"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v23

    .line 2041
    .local v23, slot:I
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "ACTION_RADIO_OFF slot = "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2042
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v23

    #calls: Lcom/android/phone/PhoneGlobals;->clearSimSettingFlag(I)V
    invoke-static {v0, v1}, Lcom/android/phone/PhoneGlobals;->access$1400(Lcom/android/phone/PhoneGlobals;I)V

    .line 2043
    const-string v28, "PhoneGlobals"

    const-string v29, "[xp Test][MODEM RESET]"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2044
    .end local v23           #slot:I
    :cond_2a
    const-string v28, "com.mtk.ACTION_MODEM_STATE"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2b

    .line 2045
    const-string v28, "md_minilog_util"

    invoke-static/range {v28 .. v28}, Landroid/os/SystemService;->start(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2061
    :cond_2b
    const-string v28, "TRIGGER_MAINTHREAD_LOOPER"

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2c

    .line 2063
    const-string v28, "PhoneGlobals"

    const-string v29, "TRIGGER_MAINTHREAD_LOOPER received"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2064
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    move-object/from16 v28, v0

    const/16 v29, 0x1f

    invoke-virtual/range {v28 .. v29}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 2065
    :cond_2c
    const-string v28, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2f

    .line 2067
    const-string v28, "showPlmn"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v28

    if-eqz v28, :cond_0

    .line 2068
    const-string v28, "plmn"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 2069
    .local v18, plmn:Ljava/lang/String;
    const-string v28, "simId"

    const/16 v29, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v22

    .line 2070
    .local v22, simId:I
    add-int/lit8 v12, v22, 0x0

    .line 2071
    .local v12, index:I
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "[SPN_STRINGS_UPDATED_ACTION]index = "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2072
    const-string v28, "PhoneGlobals"

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "[SPN_STRINGS_UPDATED_ACTION]plmn = "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2073
    const/16 v28, 0x2

    move/from16 v0, v28

    if-ge v12, v0, :cond_0

    .line 2074
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const v29, 0x10402e6

    invoke-virtual/range {v28 .. v29}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 2076
    .local v16, noServiceStr:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    #getter for: Lcom/android/phone/PhoneGlobals;->mIsNoService:[Z
    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneGlobals;->access$1500(Lcom/android/phone/PhoneGlobals;)[Z

    move-result-object v29

    if-eqz v18, :cond_2d

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2e

    :cond_2d
    const/16 v28, 0x1

    :goto_8
    aput-boolean v28, v29, v12

    goto/16 :goto_0

    :cond_2e
    const/16 v28, 0x0

    goto :goto_8

    .line 2080
    .end local v12           #index:I
    .end local v16           #noServiceStr:Ljava/lang/String;
    .end local v18           #plmn:Ljava/lang/String;
    .end local v22           #simId:I
    :cond_2f
    const-string v28, "android.intent.action.normal.boot"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_30

    .line 2081
    const-string v28, "PhoneGlobals"

    const-string v29, "receive alarm normal boot"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2084
    :cond_30
    const-string v28, "android.intent.action.CALL_SOS"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_0

    .line 2085
    const-string v28, "PhoneGlobals"

    const-string v29, "SOS call....."

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2086
    new-instance v6, Landroid/content/Intent;

    const-string v28, "android.intent.action.CALL_PRIVILEGED"

    move-object/from16 v0, v28

    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2087
    .local v6, callintent:Landroid/content/Intent;
    const-string v28, "tel"

    const-string v29, "112"

    const/16 v30, 0x0

    invoke-static/range {v28 .. v30}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v6, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2088
    const/high16 v28, 0x1000

    move/from16 v0, v28

    invoke-virtual {v6, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2089
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals$PhoneGlobalsBroadcastReceiver;->this$0:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v6}, Lcom/android/phone/PhoneGlobals;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method
