.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;
.super Landroid/os/Handler;
.source "VTInCallScreenLoopback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter

    .prologue
    .line 257
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

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

    .line 262
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VTInCallScreen Handler message:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 265
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 505
    const-string v2, "VTInCallScreenLoopback"

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

    .line 508
    :cond_0
    :goto_0
    return-void

    .line 269
    :sswitch_0
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_DISCONNECTED ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 271
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoConnected:Z

    .line 272
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    .line 273
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 278
    :sswitch_1
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_CONNECTED ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 280
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoConnected:Z

    .line 281
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 286
    :sswitch_2
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_START_COUNTER ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 288
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onReceiveVTManagerStartCounter()V

    goto :goto_0

    .line 296
    :sswitch_3
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTSettingToVTManager()V
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto :goto_0

    .line 300
    :sswitch_4
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v6, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoReady:Z

    .line 301
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 306
    :sswitch_5
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_READY ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 308
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onReceiveVTManagerReady()V
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 309
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "ready to set onConnected"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 310
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->onConnected()V

    .line 311
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "finish to set onConnect,mState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 316
    :sswitch_6
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_EM_INDICATION ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 318
    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v3, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 323
    :sswitch_7
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_PEER_SNAPSHOT_OK ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 325
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d003b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 330
    :sswitch_8
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_PEER_SNAPSHOT_FAIL ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 332
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d003c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 337
    :sswitch_9
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_CALL_DISCONNECT ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 339
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_1

    .line 341
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 343
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "toast is shown, string is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 346
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    .line 348
    :cond_1
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 350
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_ERROR_CALL_DISCONNECT) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 354
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 355
    :catch_0
    move-exception v0

    .line 357
    .local v0, e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_ERROR_CALL_DISCONNECT) - CallStateException ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 365
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_a
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_NORMAL_END_SESSION_COMMAND ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 367
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_2

    .line 369
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    .line 371
    :cond_2
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 373
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_NORMAL_END_SESSION_COMMAND) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 377
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_1
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 378
    :catch_1
    move-exception v0

    .line 380
    .restart local v0       #e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_NORMAL_END_SESSION_COMMAND) - CallStateException ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 389
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_b
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_START_VTS_FAIL ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 391
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_0

    .line 393
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v5, v2, :cond_3

    .line 394
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0077

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 398
    :goto_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    goto/16 :goto_0

    .line 396
    :cond_3
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto :goto_1

    .line 407
    :sswitch_c
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_CAMERA ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 409
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_4

    .line 411
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v5, v2, :cond_5

    .line 412
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0076

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 416
    :goto_2
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    .line 420
    :cond_4
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_ERROR_CAMERA) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 414
    :cond_5
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto :goto_2

    .line 428
    :sswitch_d
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_MEDIA_SERVER_DIED ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 430
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_6

    .line 432
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 433
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v5, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    .line 435
    :cond_6
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 437
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_ERROR_MEDIA_SERVER_DIED) - ForegroundCall exists, so hangup it ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 441
    :try_start_2
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->hangupActiveCall(Lcom/android/internal/telephony/Call;)V
    :try_end_2
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 442
    :catch_2
    move-exception v0

    .line 444
    .restart local v0       #e:Lcom/android/internal/telephony/CallStateException;
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : (VT_ERROR_MEDIA_SERVER_DIED) - CallStateException ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 453
    .end local v0           #e:Lcom/android/internal/telephony/CallStateException;
    :sswitch_e
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_RECEIVE_FIRSTFRAME ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 455
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTReceiveFirstFrame()V
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 456
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto/16 :goto_0

    .line 460
    :sswitch_f
    const/16 v2, 0x7fff

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_7

    .line 461
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0069

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 462
    :cond_7
    const/16 v2, 0x321

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_0

    .line 463
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->stopRecord()V

    goto/16 :goto_0

    .line 469
    :sswitch_10
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v2, :cond_0

    .line 470
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 471
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->stopRecord()V

    goto/16 :goto_0

    .line 476
    :sswitch_11
    const/4 v1, 0x0

    .line 477
    .local v1, ok:I
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v2, :cond_8

    .line 479
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is OK "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 481
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 484
    :cond_8
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is not OK "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 486
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 492
    .end local v1           #ok:I
    :sswitch_12
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_PEER_CAMERA_OPEN ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 494
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0065

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 499
    :sswitch_13
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "- handler : VT_MSG_PEER_CAMERA_CLOSE ! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 501
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0066

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 265
    nop

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
