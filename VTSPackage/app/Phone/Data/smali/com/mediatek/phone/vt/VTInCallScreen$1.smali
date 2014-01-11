.class Lcom/mediatek/phone/vt/VTInCallScreen$1;
.super Landroid/os/Handler;
.source "VTInCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/vt/VTInCallScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/vt/VTInCallScreen;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const v8, 0x7f0d003d

    const v7, 0x7f0d003e

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 248
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VTInCallScreen Handler message:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 251
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 506
    const-string v2, "VTInCallScreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mHandler: unexpected message: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    :cond_0
    :goto_0
    return-void

    .line 255
    :sswitch_0
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_DISCONNECTED ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 257
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoConnected:Z

    .line 258
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    .line 259
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 264
    :sswitch_1
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_CONNECTED ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 266
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoConnected:Z

    .line 267
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 272
    :sswitch_2
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_START_COUNTER ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 274
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->onReceiveVTManagerStartCounter()V

    goto :goto_0

    .line 282
    :sswitch_3
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->setVTSettingToVTManager()V
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$100(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    goto :goto_0

    .line 286
    :sswitch_4
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoReady:Z

    .line 287
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 292
    :sswitch_5
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_READY ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 294
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->onReceiveVTManagerReady()V
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$200(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    goto :goto_0

    .line 299
    :sswitch_6
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_EM_INDICATION ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 301
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v3, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto :goto_0

    .line 306
    :sswitch_7
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_PEER_SNAPSHOT_OK ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 308
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d003b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 313
    :sswitch_8
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_PEER_SNAPSHOT_FAIL ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 315
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d003c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 320
    :sswitch_9
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_CALL_DISCONNECT ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 322
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_1

    .line 324
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 326
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "toast is shown, string is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v4}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 329
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 331
    :cond_1
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 333
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_ERROR_CALL_DISCONNECT) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 337
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 338
    :catch_0
    move-exception v0

    .line 340
    .local v0, e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_ERROR_CALL_DISCONNECT) - CallStateException ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 348
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_a
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_NORMAL_END_SESSION_COMMAND ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 350
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_2

    .line 352
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 354
    :cond_2
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 356
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_NORMAL_END_SESSION_COMMAND) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 360
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_1
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 361
    :catch_1
    move-exception v0

    .line 363
    .restart local v0       #e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_NORMAL_END_SESSION_COMMAND) - CallStateException ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 372
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_b
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_START_VTS_FAIL ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 374
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_3

    .line 376
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v5, v2, :cond_4

    .line 377
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0077

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 381
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 385
    :cond_3
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$500(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/phone/InCallScreen;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/InCallScreen;->internalHangupAll()V

    goto/16 :goto_0

    .line 379
    :cond_4
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto :goto_1

    .line 390
    :sswitch_c
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_CAMERA ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 392
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_5

    .line 394
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v5, v2, :cond_6

    .line 395
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0076

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 399
    :goto_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 403
    :cond_5
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_ERROR_CAMERA) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 406
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$500(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/phone/InCallScreen;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/InCallScreen;->internalHangupAll()V

    goto/16 :goto_0

    .line 397
    :cond_6
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto :goto_2

    .line 411
    :sswitch_d
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_MEDIA_SERVER_DIED ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 413
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_7

    .line 415
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 416
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 418
    :cond_7
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 420
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_ERROR_MEDIA_SERVER_DIED) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 424
    :try_start_2
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_2
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 425
    :catch_2
    move-exception v0

    .line 427
    .restart local v0       #e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : (VT_ERROR_MEDIA_SERVER_DIED) - CallStateException ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 436
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_e
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_RECEIVE_FIRSTFRAME ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 438
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->onVTReceiveFirstFrame()V
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$600(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 439
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto/16 :goto_0

    .line 444
    :sswitch_f
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_EVENT_INFO ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 447
    const/16 v2, 0x7fff

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_8

    .line 448
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0069

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 449
    :cond_8
    const/16 v2, 0x321

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_0

    .line 450
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopRecord()V

    .line 451
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$500(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/phone/InCallScreen;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/phone/InCallScreen;->handleStorageFull(Z)V

    goto/16 :goto_0

    .line 457
    :sswitch_10
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_EVENT_ERROR ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 460
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$700(Lcom/mediatek/phone/vt/VTInCallScreen;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 461
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 465
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #setter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z
    invoke-static {v2, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$702(Lcom/mediatek/phone/vt/VTInCallScreen;Z)Z

    .line 467
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopRecord()V

    goto/16 :goto_0

    .line 473
    :sswitch_11
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 476
    const/4 v1, 0x0

    .line 477
    .local v1, ok:I
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v2, :cond_9

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$700(Lcom/mediatek/phone/vt/VTInCallScreen;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 479
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is OK "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 481
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 487
    :cond_9
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #setter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z
    invoke-static {v2, v6}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$702(Lcom/mediatek/phone/vt/VTInCallScreen;Z)Z

    goto/16 :goto_0

    .line 493
    .end local v1           #ok:I
    :sswitch_12
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_PEER_CAMERA_OPEN ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 495
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0065

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 500
    :sswitch_13
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const-string v3, "- handler : VT_MSG_PEER_CAMERA_CLOSE ! "

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 502
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$1;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0066

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 251
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_4
        0x2 -> :sswitch_3
        0x3 -> :sswitch_5
        0x4 -> :sswitch_1
        0x5 -> :sswitch_0
        0x6 -> :sswitch_6
        0x7 -> :sswitch_2
        0x8 -> :sswitch_e
        0x9 -> :sswitch_12
        0x10 -> :sswitch_13
        0x7e -> :sswitch_7
        0x7f -> :sswitch_8
        0x8001 -> :sswitch_9
        0x8002 -> :sswitch_b
        0x8003 -> :sswitch_c
        0x8004 -> :sswitch_d
        0x8005 -> :sswitch_f
        0x8006 -> :sswitch_10
        0x8007 -> :sswitch_11
        0x8101 -> :sswitch_a
    .end sparse-switch
.end method
