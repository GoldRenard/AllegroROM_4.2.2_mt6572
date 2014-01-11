.class Lcom/android/phone/PhoneGlobals$1;
.super Landroid/os/Handler;
.source "PhoneGlobals.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneGlobals;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/PhoneGlobals;


# direct methods
.method constructor <init>(Lcom/android/phone/PhoneGlobals;)V
    .locals 0
    .parameter

    .prologue
    .line 354
    iput-object p1, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13
    .parameter "msg"

    .prologue
    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v10, 0x0

    .line 358
    iget v9, p1, Landroid/os/Message;->what:I

    sparse-switch v9, :sswitch_data_0

    .line 558
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 365
    :sswitch_1
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/android/server/sip/SipService;->start(Landroid/content/Context;)V

    goto :goto_0

    .line 374
    :sswitch_2
    const-string v9, "PhoneGlobals"

    const-string v10, "- updating in-call notification from handler..."

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v9}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    goto :goto_0

    .line 379
    :sswitch_3
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget v10, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v9, v10}, Lcom/android/phone/NotificationMgr;->showDataDisconnectedRoaming(I)V

    goto :goto_0

    .line 383
    :sswitch_4
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v9}, Lcom/android/phone/NotificationMgr;->hideDataDisconnectedRoaming()V

    goto :goto_0

    .line 390
    :sswitch_5
    iget v9, p1, Landroid/os/Message;->what:I

    sget-object v10, Lcom/android/phone/PhoneGlobals;->MMI_INITIATE_GEMINI:[I

    invoke-static {v9, v10}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v6

    .line 391
    .local v6, mmiInitiateSlot:I
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$200(Lcom/android/phone/PhoneGlobals;)Lcom/android/phone/InCallScreen;

    move-result-object v9

    if-nez v9, :cond_0

    .line 392
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v10, v9, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v11, v9, Lcom/android/phone/PhoneGlobals;->mHandler:Landroid/os/Handler;

    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Landroid/os/AsyncResult;

    invoke-static {v11, v6, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v10, v9}, Lcom/android/phone/InCallUiState;->setPendingUssdMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 401
    .end local v6           #mmiInitiateSlot:I
    :sswitch_6
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v9, v11}, Lcom/android/phone/InCallUiState;->setPendingUssdMessage(Landroid/os/Message;)V

    .line 402
    iget v9, p1, Landroid/os/Message;->what:I

    sget-object v10, Lcom/android/phone/PhoneGlobals;->MMI_COMPLETE_GEMINI:[I

    invoke-static {v9, v10}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v5

    .line 403
    .local v5, mmiCompleteSlot:I
    iget-object v10, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Landroid/os/AsyncResult;

    #calls: Lcom/android/phone/PhoneGlobals;->onMMIComplete(Landroid/os/AsyncResult;I)V
    invoke-static {v10, v9, v5}, Lcom/android/phone/PhoneGlobals;->access$300(Lcom/android/phone/PhoneGlobals;Landroid/os/AsyncResult;I)V

    goto :goto_0

    .line 410
    .end local v5           #mmiCompleteSlot:I
    :sswitch_7
    iget v9, p1, Landroid/os/Message;->what:I

    sget-object v10, Lcom/android/phone/PhoneGlobals;->MMI_CANCEL_GEMINI:[I

    invoke-static {v9, v10}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v4

    .line 411
    .local v4, mmiCancelSlot:I
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-static {v9, v4}, Lcom/android/phone/PhoneUtils;->cancelMmiCodeExt(Lcom/android/internal/telephony/Phone;I)Z

    goto :goto_0

    .line 420
    .end local v4           #mmiCancelSlot:I
    :sswitch_8
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    .line 422
    .local v7, phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v9, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v7, v9, :cond_1

    .line 423
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isShowingCallScreen()Z

    move-result v9

    if-nez v9, :cond_1

    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isBluetoothHeadsetAudioOn()Z

    move-result v9

    if-nez v9, :cond_1

    .line 424
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v9

    if-nez v9, :cond_3

    .line 432
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTDialWithSpeakerOff()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 433
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v12, v12}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 434
    invoke-static {v10}, Lcom/mediatek/phone/vt/VTCallUtils;->setVTDialWithSpeakerOff(Z)V

    .line 447
    :cond_1
    :goto_1
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9, v7}, Lcom/android/phone/PhoneGlobals;->updateProximitySensorMode(Lcom/android/internal/telephony/PhoneConstants$State;)V

    .line 450
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mTtyEnabled:Z
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$400(Lcom/android/phone/PhoneGlobals;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 451
    const/16 v9, 0xe

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {p0, v9, v10}, Lcom/android/phone/PhoneGlobals$1;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/phone/PhoneGlobals$1;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 437
    :cond_2
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->restoreSpeakerMode(Landroid/content/Context;)V

    goto :goto_1

    .line 442
    :cond_3
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v10, v10}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    goto :goto_1

    .line 459
    .end local v7           #phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    :sswitch_9
    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    const-string v10, "READY"

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 463
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryActivity:Landroid/app/Activity;
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$500(Lcom/android/phone/PhoneGlobals;)Landroid/app/Activity;

    move-result-object v9

    if-eqz v9, :cond_4

    .line 464
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryActivity:Landroid/app/Activity;
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$500(Lcom/android/phone/PhoneGlobals;)Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->finish()V

    .line 465
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #setter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryActivity:Landroid/app/Activity;
    invoke-static {v9, v11}, Lcom/android/phone/PhoneGlobals;->access$502(Lcom/android/phone/PhoneGlobals;Landroid/app/Activity;)Landroid/app/Activity;

    .line 467
    :cond_4
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$600(Lcom/android/phone/PhoneGlobals;)Landroid/app/ProgressDialog;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 468
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$600(Lcom/android/phone/PhoneGlobals;)Landroid/app/ProgressDialog;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/ProgressDialog;->dismiss()V

    .line 469
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #setter for: Lcom/android/phone/PhoneGlobals;->mPUKEntryProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v9, v11}, Lcom/android/phone/PhoneGlobals;->access$602(Lcom/android/phone/PhoneGlobals;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    goto/16 :goto_0

    .line 481
    :sswitch_a
    const/4 v2, 0x0

    .line 482
    .local v2, inDockMode:Z
    sget v9, Lcom/android/phone/PhoneGlobals;->mDockState:I

    if-eqz v9, :cond_5

    .line 483
    const/4 v2, 0x1

    .line 485
    :cond_5
    const-string v9, "PhoneGlobals"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "received EVENT_DOCK_STATE_CHANGED. Phone inDock = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    .line 489
    .restart local v7       #phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v9, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v7, v9, :cond_0

    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v9

    if-nez v9, :cond_0

    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isBluetoothHeadsetAudioOn()Z

    move-result v9

    if-nez v9, :cond_0

    .line 491
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v2, v12}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 492
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->updateInCallScreen()V

    goto/16 :goto_0

    .line 499
    .end local v2           #inDockMode:Z
    .end local v7           #phoneState:Lcom/android/internal/telephony/PhoneConstants$State;
    :sswitch_b
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 500
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #getter for: Lcom/android/phone/PhoneGlobals;->mPreferredTtyMode:I
    invoke-static {v9}, Lcom/android/phone/PhoneGlobals;->access$700(Lcom/android/phone/PhoneGlobals;)I

    move-result v8

    .line 506
    .local v8, ttyMode:I
    :goto_2
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #calls: Lcom/android/phone/PhoneGlobals;->setTTYMode(I)V
    invoke-static {v9, v8}, Lcom/android/phone/PhoneGlobals;->access$800(Lcom/android/phone/PhoneGlobals;I)V

    goto/16 :goto_0

    .line 502
    .end local v8           #ttyMode:I
    :cond_6
    const/4 v8, 0x0

    .restart local v8       #ttyMode:I
    goto :goto_2

    .line 511
    .end local v8           #ttyMode:I
    :sswitch_c
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #calls: Lcom/android/phone/PhoneGlobals;->handleQueryTTYModeResponse(Landroid/os/Message;)V
    invoke-static {v9, p1}, Lcom/android/phone/PhoneGlobals;->access$900(Lcom/android/phone/PhoneGlobals;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 515
    :sswitch_d
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    #calls: Lcom/android/phone/PhoneGlobals;->handleSetTTYModeResponse(Landroid/os/Message;)V
    invoke-static {v9, p1}, Lcom/android/phone/PhoneGlobals;->access$1000(Lcom/android/phone/PhoneGlobals;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 519
    :sswitch_e
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    iget v10, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v9, v10}, Lcom/android/phone/PhoneGlobals;->handleTimeout(I)V

    goto/16 :goto_0

    .line 523
    :sswitch_f
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 524
    .local v0, ar:Landroid/os/AsyncResult;
    new-instance v3, Landroid/content/Intent;

    const-string v9, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 525
    .local v3, it:Landroid/content/Intent;
    iget-object v9, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v9, :cond_7

    .line 526
    const-string v9, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v3, v9, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 527
    const-string v9, "NEW_NETWORK_MODE"

    iget v10, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 532
    :goto_3
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9, v3}, Lcom/android/phone/PhoneGlobals;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 529
    :cond_7
    const-string v9, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 530
    const-string v9, "com.android.phone.OLD_NETWORK_MODE"

    iget v10, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_3

    .line 537
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v3           #it:Landroid/content/Intent;
    :sswitch_10
    const-string v9, "PhoneGlobals"

    const-string v10, "mHandler.handleMessage() : EVENT_TOUCH_ANSWER_VT"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 540
    :try_start_0
    iget-object v9, p0, Lcom/android/phone/PhoneGlobals$1;->this$0:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v9}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/phone/InCallScreen;->internalAnswerCall()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 541
    :catch_0
    move-exception v1

    .line 543
    .local v1, e:Ljava/lang/Exception;
    const-string v9, "PhoneGlobals"

    const-string v10, "mHandler.handleMessage() : the InCallScreen Instance is null , so cannot answer incoming VT call"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 550
    .end local v1           #e:Ljava/lang/Exception;
    :sswitch_11
    invoke-static {}, Lcom/android/phone/PhoneUtils;->showIncomingCallUi()V

    goto/16 :goto_0

    .line 555
    :sswitch_12
    const-string v9, "PhoneGlobals"

    const-string v10, "handle EVENT_TRIGGER_MAINTHREAD_LOOPER"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 358
    :sswitch_data_0
    .sparse-switch
        0x7 -> :sswitch_8
        0x8 -> :sswitch_9
        0x9 -> :sswitch_2
        0xa -> :sswitch_3
        0xb -> :sswitch_4
        0xc -> :sswitch_0
        0xd -> :sswitch_a
        0xe -> :sswitch_b
        0xf -> :sswitch_c
        0x10 -> :sswitch_d
        0x11 -> :sswitch_1
        0x12 -> :sswitch_e
        0x1e -> :sswitch_10
        0x1f -> :sswitch_12
        0x33 -> :sswitch_5
        0x34 -> :sswitch_6
        0x35 -> :sswitch_7
        0x39 -> :sswitch_11
        0x97 -> :sswitch_5
        0x98 -> :sswitch_6
        0x99 -> :sswitch_7
        0xfb -> :sswitch_5
        0xfc -> :sswitch_6
        0xfd -> :sswitch_7
        0x15f -> :sswitch_5
        0x160 -> :sswitch_6
        0x161 -> :sswitch_7
        0x271b -> :sswitch_f
    .end sparse-switch
.end method
