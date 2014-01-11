.class Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
.super Landroid/os/Handler;
.source "FMRadioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FmRadioServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioService;


# direct methods
.method public constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 2304
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    .line 2305
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2306
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 23
    .parameter "msg"

    .prologue
    .line 2311
    const/4 v8, 0x0

    .line 2312
    .local v8, isPowerup:Z
    const/4 v12, 0x1

    .line 2314
    .local v12, isSwitch:Z
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v20, v0

    packed-switch v20, :pswitch_data_0

    .line 2513
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 2318
    :pswitch_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 2319
    .local v17, time:J
    const-string v20, "FmRx/Service"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "performance test. service handler power up start:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2320
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2321
    .local v3, bundle:Landroid/os/Bundle;
    const-string v20, "frequency"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v5

    .line 2322
    .local v5, curFrequency:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->switchAntenna(I)I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2200(Lcom/mediatek/FMRadio/FMRadioService;I)I

    move-result v20

    if-nez v20, :cond_1

    const/4 v12, 0x1

    .line 2326
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->isAntennaAvailable()Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$400(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v20

    if-nez v20, :cond_2

    if-nez v12, :cond_2

    .line 2327
    const-string v20, "FmRx/Service"

    const-string v21, "call back to activity, earphone is not ready"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsShortAntennaSupport:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2302(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsPowerUping:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2402(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2330
    new-instance v3, Landroid/os/Bundle;

    .end local v3           #bundle:Landroid/os/Bundle;
    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2331
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0x4

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2332
    const-string v20, "key_is_switch_anntenna"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v12}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2322
    :cond_1
    const/4 v12, 0x0

    goto :goto_1

    .line 2337
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->powerUpFM(F)Z
    invoke-static {v0, v5}, Lcom/mediatek/FMRadio/FMRadioService;->access$2500(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 2338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->initDevice(F)Z
    invoke-static {v0, v5}, Lcom/mediatek/FMRadio/FMRadioService;->access$2600(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    move-result v8

    .line 2339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mPausedByTransientLossOfFocus:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2702(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2341
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsPowerUping:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2402(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsShortAntennaSupport:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2302(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2343
    new-instance v3, Landroid/os/Bundle;

    .end local v3           #bundle:Landroid/os/Bundle;
    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2344
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0x9

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2345
    const-string v20, "key_is_power_up"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    .line 2347
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 2348
    const-string v20, "FmRx/Service"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "performance test. service handler power up end:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2353
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v5           #curFrequency:F
    .end local v17           #time:J
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->powerDown()Z

    move-result v7

    .line 2354
    .local v7, isPowerdown:Z
    new-instance v3, Landroid/os/Bundle;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2355
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0xa

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2356
    const-string v20, "key_is_power_down"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2362
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v7           #isPowerdown:Z
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsSpeakerUsed:Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$2800(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 2363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->setSpeakerPhoneOn(Z)V

    .line 2365
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->powerDown()Z

    .line 2366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->closeDevice()Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$2900(Lcom/mediatek/FMRadio/FMRadioService;)Z

    .line 2368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFMPlayer:Landroid/media/MediaPlayer;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$1800(Lcom/mediatek/FMRadio/FMRadioService;)Landroid/media/MediaPlayer;

    move-result-object v20

    if-eqz v20, :cond_5

    .line 2369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFMPlayer:Landroid/media/MediaPlayer;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$1800(Lcom/mediatek/FMRadio/FMRadioService;)Landroid/media/MediaPlayer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaPlayer;->release()V

    .line 2370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mFMPlayer:Landroid/media/MediaPlayer;
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$1802(Lcom/mediatek/FMRadio/FMRadioService;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 2373
    :cond_5
    new-instance v3, Landroid/os/Bundle;

    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2374
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0xb

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2380
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2381
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "switch_anntenna_value"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->switchAntenna(I)I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2200(Lcom/mediatek/FMRadio/FMRadioService;I)I

    move-result v20

    if-nez v20, :cond_6

    const/4 v12, 0x1

    .line 2382
    :goto_2
    const-string v20, "FmRx/Service"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "FmServiceHandler.switch anntenna:isWitch:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2381
    :cond_6
    const/4 v12, 0x0

    goto :goto_2

    .line 2391
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_5
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2392
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "frequency"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v19

    .line 2393
    .local v19, tuneStation:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, v19

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->tuneStation(F)Z
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->access$3000(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    move-result v13

    .line 2394
    .local v13, isTune:Z
    new-instance v3, Landroid/os/Bundle;

    .end local v3           #bundle:Landroid/os/Bundle;
    const/16 v20, 0x4

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2395
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0xf

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2396
    const-string v20, "key_is_tune"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v13}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2397
    const-string v20, "key_tune_to_station"

    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 2398
    const-string v20, "key_is_power_up"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v21, v0

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsPowerUp:Z
    invoke-static/range {v21 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$500(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v21

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2404
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v13           #isTune:Z
    .end local v19           #tuneStation:F
    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2405
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "frequency"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v21

    const-string v22, "option"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v22

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->seekStation(FZ)F
    invoke-static/range {v20 .. v22}, Lcom/mediatek/FMRadio/FMRadioService;->access$3100(Lcom/mediatek/FMRadio/FMRadioService;FZ)F

    move-result v15

    .line 2407
    .local v15, seekStation:F
    const/4 v10, 0x0

    .line 2408
    .local v10, isSeekTune:Z
    invoke-static {v15}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v16

    .line 2409
    .local v16, station:I
    invoke-static/range {v16 .. v16}, Lcom/mediatek/FMRadio/FMRadioUtils;->isValidStation(I)Z

    move-result v20

    if-eqz v20, :cond_7

    .line 2410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->tuneStation(F)Z
    invoke-static {v0, v15}, Lcom/mediatek/FMRadio/FMRadioService;->access$3000(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    move-result v10

    .line 2412
    :cond_7
    new-instance v3, Landroid/os/Bundle;

    .end local v3           #bundle:Landroid/os/Bundle;
    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2413
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0xf

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2414
    const-string v20, "key_is_tune"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2415
    const-string v20, "key_tune_to_station"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v15}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 2416
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2421
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v10           #isSeekTune:Z
    .end local v15           #seekStation:F
    .end local v16           #station:I
    :pswitch_7
    const/4 v4, 0x0

    .line 2422
    .local v4, channels:[I
    const/4 v14, 0x0

    .line 2423
    .local v14, result:[I
    const/4 v9, 0x1

    .line 2424
    .local v9, isScan:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsScanning:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3202(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2425
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    sget v21, Lcom/mediatek/FMRadio/FMRadioUtils;->DEFAULT_STATION_FLOAT:F

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->powerUpFM(F)Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$2500(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 2426
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->startScan()[I
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$3300(Lcom/mediatek/FMRadio/FMRadioService;)[I

    move-result-object v4

    .line 2430
    :cond_8
    if-eqz v4, :cond_9

    const/16 v20, 0x0

    aget v20, v4, v20

    const/16 v21, -0x64

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    .line 2431
    const-string v20, "FmRx/Service"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "user canceled scan:channels[0]="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x0

    aget v22, v4, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2432
    const/4 v9, 0x0

    .line 2433
    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v14, v0, [I

    .end local v14           #result:[I
    fill-array-data v14, :array_0

    .line 2441
    .restart local v14       #result:[I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsScanning:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3202(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 2442
    new-instance v3, Landroid/os/Bundle;

    const/16 v20, 0x4

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2443
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const/16 v21, 0xd

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2444
    const-string v20, "key_tune_to_station"

    const/16 v21, 0x0

    aget v21, v14, v21

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2445
    const-string v20, "key_station_num"

    const/16 v21, 0x1

    aget v21, v14, v21

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2446
    const-string v20, "key_is_scan"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v9}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2435
    .end local v3           #bundle:Landroid/os/Bundle;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->insertSearchedStation([I)[I
    invoke-static {v0, v4}, Lcom/mediatek/FMRadio/FMRadioService;->access$3400(Lcom/mediatek/FMRadio/FMRadioService;[I)[I

    move-result-object v14

    .line 2436
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget v21, v14, v21

    invoke-static/range {v21 .. v21}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->tuneStation(F)Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3000(Lcom/mediatek/FMRadio/FMRadioService;F)Z

    .line 2438
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->resumeFMAudio()V

    .line 2439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setMute(Z)I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3500(Lcom/mediatek/FMRadio/FMRadioService;Z)I

    goto :goto_3

    .line 2452
    .end local v4           #channels:[I
    .end local v9           #isScan:Z
    .end local v14           #result:[I
    :pswitch_8
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2453
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "key_audiofocus_changed"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 2454
    .local v6, focusState:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->updateAudioFocus(I)V
    invoke-static {v0, v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$3600(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto/16 :goto_0

    .line 2458
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v6           #focusState:I
    :pswitch_9
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2459
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "option"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setRDS(Z)I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3700(Lcom/mediatek/FMRadio/FMRadioService;Z)I

    goto/16 :goto_0

    .line 2463
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_a
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2464
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "option"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setAudioChannel(Z)Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3800(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    goto/16 :goto_0

    .line 2468
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2469
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "option"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setMute(Z)I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$3500(Lcom/mediatek/FMRadio/FMRadioService;Z)I

    goto/16 :goto_0

    .line 2473
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->activeAF()I
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$3900(Lcom/mediatek/FMRadio/FMRadioService;)I

    goto/16 :goto_0

    .line 2478
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->startRecording()V
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$4000(Lcom/mediatek/FMRadio/FMRadioService;)V

    goto/16 :goto_0

    .line 2482
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->stopRecording()Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$4100(Lcom/mediatek/FMRadio/FMRadioService;)Z

    goto/16 :goto_0

    .line 2486
    :pswitch_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->startPlayback()Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$4200(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v11

    .line 2488
    .local v11, isStart:Z
    if-nez v11, :cond_0

    .line 2489
    new-instance v3, Landroid/os/Bundle;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v3, v0}, Landroid/os/Bundle;-><init>(I)V

    .line 2490
    .restart local v3       #bundle:Landroid/os/Bundle;
    const-string v20, "callback_flag"

    const v21, 0x100110

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2491
    const-string v20, "key_recording_error_type"

    const/16 v21, 0x21

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2492
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v0, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 2497
    .end local v3           #bundle:Landroid/os/Bundle;
    .end local v11           #isStart:Z
    :pswitch_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->stopPlayback()V
    invoke-static/range {v20 .. v20}, Lcom/mediatek/FMRadio/FMRadioService;->access$4300(Lcom/mediatek/FMRadio/FMRadioService;)V

    goto/16 :goto_0

    .line 2501
    :pswitch_11
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2502
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "option"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setRecordingMode(Z)V
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$4400(Lcom/mediatek/FMRadio/FMRadioService;Z)V

    goto/16 :goto_0

    .line 2506
    .end local v3           #bundle:Landroid/os/Bundle;
    :pswitch_12
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 2507
    .restart local v3       #bundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    move-object/from16 v20, v0

    const-string v21, "name"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->saveRecording(Ljava/lang/String;)V
    invoke-static/range {v20 .. v21}, Lcom/mediatek/FMRadio/FMRadioService;->access$4500(Lcom/mediatek/FMRadio/FMRadioService;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2314
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_4
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_11
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_12
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_8
    .end packed-switch

    .line 2433
    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method
