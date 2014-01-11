.class Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FMRadioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FMServiceBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioService;


# direct methods
.method private constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;)V
    .locals 0
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;Lcom/mediatek/FMRadio/FMRadioService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 243
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v12, 0x0

    const/4 v11, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 247
    const-string v8, "FmRx/Service"

    const-string v9, ">>> FMRadioService.onReceive"

    invoke-static {v8, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, action:Ljava/lang/String;
    const-string v8, "command"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 250
    .local v1, command:Ljava/lang/String;
    const-string v8, "FmRx/Service"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Action/Command: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " / "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    const-string v8, "com.mediatek.FMRadio.FMRadioService.ACTION_TOFMSERVICE_POWERDOWN"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "com.mediatek.app.mtv.POWER_ON"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "com.android.music.musicservicecommand"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v8, "pause"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 255
    :cond_0
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 256
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->stopFMFocusLoss(I)V
    invoke-static {v6, v11}, Lcom/mediatek/FMRadio/FMRadioService;->access$100(Lcom/mediatek/FMRadio/FMRadioService;I)V

    .line 258
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v6, v6, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    if-eqz v6, :cond_1

    .line 259
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v6, v6, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRecorder;->getState()I

    move-result v6

    const/4 v7, 0x7

    if-ne v6, v7, :cond_1

    .line 262
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    const/16 v7, 0x18

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeMessages(I)V

    .line 263
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    const/16 v7, 0x19

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeMessages(I)V

    .line 264
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    const/16 v7, 0x16

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeMessages(I)V

    .line 265
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    const/16 v7, 0x17

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeMessages(I)V

    .line 266
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v6, v6, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRecorder;->stopPlayback()V

    .line 344
    :cond_1
    :goto_0
    const-string v6, "FmRx/Service"

    const-string v7, "<<< FMRadioService.onReceive"

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    :goto_1
    return-void

    .line 270
    :cond_2
    const-string v8, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 276
    :cond_3
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mFmServiceHandler:Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$000(Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/mediatek/FMRadio/FMRadioService$FmRadioServiceHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 277
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->exitFM()V
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$200(Lcom/mediatek/FMRadio/FMRadioService;)V

    goto :goto_0

    .line 279
    :cond_4
    const-string v8, "android.intent.action.SCREEN_ON"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 281
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService;->setRDSAsync(Z)V

    goto :goto_0

    .line 283
    :cond_5
    const-string v8, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 285
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v7, v6}, Lcom/mediatek/FMRadio/FMRadioService;->setRDSAsync(Z)V

    goto :goto_0

    .line 287
    :cond_6
    const-string v8, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 293
    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const-string v9, "state"

    invoke-virtual {p2, v9, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    if-ne v9, v7, :cond_8

    :goto_2
    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mValueHeadSetPlug:I
    invoke-static {v8, v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$302(Lcom/mediatek/FMRadio/FMRadioService;I)I

    .line 296
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mValueHeadSetPlug:I
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$300(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v6

    if-ne v6, v7, :cond_7

    .line 297
    new-instance v4, Landroid/content/Intent;

    const-string v6, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE"

    invoke-direct {v4, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 298
    .local v4, it:Landroid/content/Intent;
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6, v4}, Lcom/mediatek/FMRadio/FMRadioService;->sendBroadcast(Landroid/content/Intent;)V

    .line 299
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->isAntennaAvailable()Z
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$400(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v6

    if-nez v6, :cond_7

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isDeviceOpen()Z

    move-result v6

    if-eqz v6, :cond_7

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 300
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->stopSelf()V

    .line 304
    .end local v4           #it:Landroid/content/Intent;
    :cond_7
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mValueHeadSetPlug:I
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$300(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService;->switchAntennaAsync(I)V

    goto/16 :goto_0

    :cond_8
    move v6, v7

    .line 293
    goto :goto_2

    .line 305
    :cond_9
    const-string v8, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 309
    const-string v7, "android.bluetooth.profile.extra.STATE"

    invoke-virtual {p2, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 310
    .local v2, connectState:I
    const-string v6, "FmRx/Service"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ACTION_CONNECTION_STATE_CHANGED: connectState="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", ispowerup="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsPowerUp:Z
    invoke-static {v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$500(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->handleBtConnectState(I)V
    invoke-static {v6, v2}, Lcom/mediatek/FMRadio/FMRadioService;->access$600(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto/16 :goto_0

    .line 314
    .end local v2           #connectState:I
    :cond_a
    const-string v8, "android.server.a2dp.action.FM_OVER_BT_CONTROLLER"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 317
    const-string v7, "android.bluetooth.a2dp.extra.RESULT_STATE"

    invoke-virtual {p2, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 319
    .local v3, fmOverBTState:I
    const-string v6, "FmRx/Service"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handling ACTION_FM_OVER_BT_CONTROLLER: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->fmOverBtController(I)V
    invoke-static {v6, v3}, Lcom/mediatek/FMRadio/FMRadioService;->access$700(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto/16 :goto_0

    .line 321
    .end local v3           #fmOverBTState:I
    :cond_b
    const-string v8, "android.server.a2dp.action.FM_OVER_BT_HOST"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 324
    const-string v8, "FmRx/Service"

    const-string v9, "ACTION_FM_OVER_BT_HOST"

    invoke-static {v8, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioNative;->setFMViaBTController(Z)Z

    move-result v8

    if-nez v8, :cond_c

    .line 326
    const-string v6, "FmRx/Service"

    const-string v7, "failed to set FM over BT via Host!!"

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 329
    :cond_c
    const-string v8, "FmRx/Service"

    const-string v9, "setFMViaBTController(false) succeeded!!"

    invoke-static {v8, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mUsingFMViaBTController:Z
    invoke-static {v8, v6}, Lcom/mediatek/FMRadio/FMRadioService;->access$802(Lcom/mediatek/FMRadio/FMRadioService;Z)Z

    .line 331
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->enableFMAudio(Z)V
    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$900(Lcom/mediatek/FMRadio/FMRadioService;Z)V

    goto/16 :goto_0

    .line 334
    :cond_d
    const-string v6, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 335
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->stopSelf()V

    .line 336
    new-instance v5, Landroid/content/Intent;

    const-string v6, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE_AIEPLANE"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 337
    .local v5, it_airPlane:Landroid/content/Intent;
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioService$FMServiceBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6, v5}, Lcom/mediatek/FMRadio/FMRadioService;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 342
    .end local v5           #it_airPlane:Landroid/content/Intent;
    :cond_e
    const-string v6, "FmRx/Service"

    const-string v7, "Error: undefined action."

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
