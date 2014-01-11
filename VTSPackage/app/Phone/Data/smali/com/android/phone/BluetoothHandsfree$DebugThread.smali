.class Lcom/android/phone/BluetoothHandsfree$DebugThread;
.super Ljava/lang/Thread;
.source "BluetoothHandsfree.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/BluetoothHandsfree;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DebugThread"
.end annotation


# static fields
.field static final DEBUG_HANDSFREE:Ljava/lang/String; = "debug.bt.hfp"

.field static final DEBUG_HANDSFREE_AUDIO:Ljava/lang/String; = "debug.bt.hfp.audio"

.field static final DEBUG_HANDSFREE_AUDIO_ANYTIME:Ljava/lang/String; = "debug.bt.hfp.audio_anytime"

.field static final DEBUG_HANDSFREE_BATTERY:Ljava/lang/String; = "debug.bt.hfp.battery"

.field static final DEBUG_HANDSFREE_CLCC:Ljava/lang/String; = "debug.bt.hfp.clcc"

.field static final DEBUG_HANDSFREE_ROAM:Ljava/lang/String; = "debug.bt.hfp.roam"

.field static final DEBUG_HANDSFREE_SERVICE:Ljava/lang/String; = "debug.bt.hfp.service"

.field static final DEBUG_HANDSFREE_SIGNAL:Ljava/lang/String; = "debug.bt.hfp.signal"

.field static final DEBUG_UNSOL_INBAND_RINGTONE:Ljava/lang/String; = "debug.bt.unsol.inband"


# instance fields
.field final synthetic this$0:Lcom/android/phone/BluetoothHandsfree;


# direct methods
.method private constructor <init>(Lcom/android/phone/BluetoothHandsfree;)V
    .locals 0
    .parameter

    .prologue
    .line 4050
    iput-object p1, p0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/BluetoothHandsfree;Lcom/android/phone/BluetoothHandsfree$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 4050
    invoke-direct {p0, p1}, Lcom/android/phone/BluetoothHandsfree$DebugThread;-><init>(Lcom/android/phone/BluetoothHandsfree;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .prologue
    .line 4089
    const/16 v18, 0x1

    .line 4090
    .local v18, oldService:Z
    const/16 v17, 0x0

    .line 4091
    .local v17, oldRoam:Z
    const/16 v16, 0x0

    .line 4093
    .local v16, oldAudio:Z
    :cond_0
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/BluetoothHandsfree$DebugThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_e

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    #calls: Lcom/android/phone/BluetoothHandsfree;->inDebug()Z
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$8400(Lcom/android/phone/BluetoothHandsfree;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 4094
    const-string v3, "debug.bt.hfp.battery"

    const/4 v4, -0x1

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 4095
    .local v11, batteryLevel:I
    if-ltz v11, :cond_1

    const/4 v3, 0x5

    if-gt v11, v3, :cond_1

    .line 4096
    new-instance v15, Landroid/content/Intent;

    invoke-direct {v15}, Landroid/content/Intent;-><init>()V

    .line 4097
    .local v15, intent:Landroid/content/Intent;
    const-string v3, "level"

    invoke-virtual {v15, v3, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4098
    const-string v3, "scale"

    const/4 v4, 0x5

    invoke-virtual {v15, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4099
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    #getter for: Lcom/android/phone/BluetoothHandsfree;->mBluetoothPhoneState:Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$5400(Lcom/android/phone/BluetoothHandsfree;)Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;

    move-result-object v3

    #calls: Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->updateBatteryState(Landroid/content/Intent;)V
    invoke-static {v3, v15}, Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->access$5500(Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;Landroid/content/Intent;)V

    .line 4102
    .end local v15           #intent:Landroid/content/Intent;
    :cond_1
    const/16 v20, 0x0

    .line 4103
    .local v20, serviceStateChanged:Z
    const-string v3, "debug.bt.hfp.service"

    const/4 v4, 0x1

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    move/from16 v0, v18

    if-eq v3, v0, :cond_2

    .line 4104
    if-nez v18, :cond_9

    const/16 v18, 0x1

    .line 4105
    :goto_1
    const/16 v20, 0x1

    .line 4107
    :cond_2
    const-string v3, "debug.bt.hfp.roam"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    move/from16 v0, v17

    if-eq v3, v0, :cond_3

    .line 4108
    if-nez v17, :cond_a

    const/16 v17, 0x1

    .line 4109
    :goto_2
    const/16 v20, 0x1

    .line 4111
    :cond_3
    if-eqz v20, :cond_4

    .line 4112
    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 4113
    .local v10, b:Landroid/os/Bundle;
    const-string v4, "state"

    if-eqz v18, :cond_b

    const/4 v3, 0x0

    :goto_3
    invoke-virtual {v10, v4, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4114
    const-string v3, "roaming"

    move/from16 v0, v17

    invoke-virtual {v10, v3, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 4115
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    #getter for: Lcom/android/phone/BluetoothHandsfree;->mBluetoothPhoneState:Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$5400(Lcom/android/phone/BluetoothHandsfree;)Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v10}, Landroid/telephony/ServiceState;->newFromBundle(Landroid/os/Bundle;)Landroid/telephony/ServiceState;

    move-result-object v5

    #calls: Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->updateServiceState(ZLandroid/telephony/ServiceState;)V
    invoke-static {v3, v4, v5}, Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->access$800(Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;ZLandroid/telephony/ServiceState;)V

    .line 4118
    .end local v10           #b:Landroid/os/Bundle;
    :cond_4
    const-string v3, "debug.bt.hfp.audio"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    move/from16 v0, v16

    if-eq v3, v0, :cond_5

    .line 4119
    if-nez v16, :cond_c

    const/16 v16, 0x1

    .line 4120
    :goto_4
    if-eqz v16, :cond_d

    .line 4121
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    invoke-virtual {v3}, Lcom/android/phone/BluetoothHandsfree;->audioOn()Z

    .line 4127
    :cond_5
    :goto_5
    const-string v3, "debug.bt.hfp.signal"

    const/4 v4, -0x1

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 4128
    .local v2, signalLevel:I
    if-ltz v2, :cond_6

    const/16 v3, 0x1f

    if-gt v2, v3, :cond_6

    .line 4129
    new-instance v1, Landroid/telephony/SignalStrength;

    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/4 v9, 0x1

    invoke-direct/range {v1 .. v9}, Landroid/telephony/SignalStrength;-><init>(IIIIIIIZ)V

    .line 4131
    .local v1, signalStrength:Landroid/telephony/SignalStrength;
    new-instance v15, Landroid/content/Intent;

    invoke-direct {v15}, Landroid/content/Intent;-><init>()V

    .line 4132
    .restart local v15       #intent:Landroid/content/Intent;
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 4133
    .local v12, data:Landroid/os/Bundle;
    invoke-virtual {v1, v12}, Landroid/telephony/SignalStrength;->fillInNotifierBundle(Landroid/os/Bundle;)V

    .line 4134
    invoke-virtual {v15, v12}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 4135
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    #getter for: Lcom/android/phone/BluetoothHandsfree;->mBluetoothPhoneState:Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$5400(Lcom/android/phone/BluetoothHandsfree;)Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;

    move-result-object v3

    #calls: Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->updateSignalState(Landroid/content/Intent;)V
    invoke-static {v3, v15}, Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;->access$5600(Lcom/android/phone/BluetoothHandsfree$BluetoothPhoneState;Landroid/content/Intent;)V

    .line 4138
    .end local v1           #signalStrength:Landroid/telephony/SignalStrength;
    .end local v12           #data:Landroid/os/Bundle;
    .end local v15           #intent:Landroid/content/Intent;
    :cond_6
    const-string v3, "debug.bt.hfp.clcc"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 4139
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    #calls: Lcom/android/phone/BluetoothHandsfree;->gsmGetClccResult()Landroid/bluetooth/AtCommandResult;
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$7400(Lcom/android/phone/BluetoothHandsfree;)Landroid/bluetooth/AtCommandResult;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/AtCommandResult;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/phone/BluetoothHandsfree;->log(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/android/phone/BluetoothHandsfree;->access$300(Ljava/lang/String;)V

    .line 4142
    :cond_7
    const-wide/16 v3, 0x3e8

    :try_start_0
    invoke-static {v3, v4}, Lcom/android/phone/BluetoothHandsfree$DebugThread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4147
    const-string v3, "debug.bt.unsol.inband"

    const/4 v4, -0x1

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v14

    .line 4149
    .local v14, inBandRing:I
    if-eqz v14, :cond_8

    const/4 v3, 0x1

    if-ne v14, v3, :cond_0

    .line 4150
    :cond_8
    new-instance v19, Landroid/bluetooth/AtCommandResult;

    const/4 v3, 0x2

    move-object/from16 v0, v19

    invoke-direct {v0, v3}, Landroid/bluetooth/AtCommandResult;-><init>(I)V

    .line 4152
    .local v19, result:Landroid/bluetooth/AtCommandResult;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "+BSIR: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Landroid/bluetooth/AtCommandResult;->addResponse(Ljava/lang/String;)V

    .line 4153
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    invoke-virtual/range {v19 .. v19}, Landroid/bluetooth/AtCommandResult;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/phone/BluetoothHandsfree;->sendURC(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/android/phone/BluetoothHandsfree;->access$400(Lcom/android/phone/BluetoothHandsfree;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4104
    .end local v2           #signalLevel:I
    .end local v14           #inBandRing:I
    .end local v19           #result:Landroid/bluetooth/AtCommandResult;
    :cond_9
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 4108
    :cond_a
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 4113
    .restart local v10       #b:Landroid/os/Bundle;
    :cond_b
    const/4 v3, 0x1

    goto/16 :goto_3

    .line 4119
    .end local v10           #b:Landroid/os/Bundle;
    :cond_c
    const/16 v16, 0x0

    goto/16 :goto_4

    .line 4123
    :cond_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/BluetoothHandsfree$DebugThread;->this$0:Lcom/android/phone/BluetoothHandsfree;

    invoke-virtual {v3}, Lcom/android/phone/BluetoothHandsfree;->audioOff()V

    goto/16 :goto_5

    .line 4143
    .restart local v2       #signalLevel:I
    :catch_0
    move-exception v13

    .line 4156
    .end local v2           #signalLevel:I
    .end local v11           #batteryLevel:I
    .end local v20           #serviceStateChanged:Z
    :cond_e
    return-void
.end method
