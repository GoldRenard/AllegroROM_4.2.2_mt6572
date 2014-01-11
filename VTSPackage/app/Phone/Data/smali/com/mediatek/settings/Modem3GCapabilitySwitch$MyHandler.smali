.class Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;
.super Landroid/os/Handler;
.source "Modem3GCapabilitySwitch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/Modem3GCapabilitySwitch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# static fields
.field private static final MESSAGE_GET_PREFERRED_NETWORK_TYPE:I = 0x0

.field private static final MESSAGE_SET_PREFERRED_NETWORK_TYPE:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter

    .prologue
    .line 371
    iput-object p1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 371
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;-><init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    return-void
.end method

.method private handleGetPreferredNetworkTypeResponse(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 392
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    const-string v4, "[handleGetPreferredNetworkTypeResponse]"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/app/ProgressDialog;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v7, :cond_0

    .line 395
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 398
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 399
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_5

    .line 400
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    aget v1, v3, v6

    .line 403
    .local v1, modemNetworkMode:I
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGetPreferredNetworkTypeResponse: modemNetworkMode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "preferred_network_mode"

    invoke-static {v3, v4, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 413
    .local v2, settingsNetworkMode:I
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGetPreferredNetworkTypeReponse: settingsNetworkMode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    if-eqz v1, :cond_1

    if-eq v1, v7, :cond_1

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    if-eq v1, v8, :cond_1

    const/4 v3, 0x4

    if-eq v1, v3, :cond_1

    const/4 v3, 0x5

    if-eq v1, v3, :cond_1

    const/4 v3, 0x6

    if-eq v1, v3, :cond_1

    const/4 v3, 0x7

    if-ne v1, v3, :cond_4

    .line 427
    :cond_1
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGetPreferredNetworkTypeResponse: if 1: modemNetworkMode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    if-eq v1, v2, :cond_2

    .line 434
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    const-string v4, "handleGetPreferredNetworkTypeResponse: if 2: modemNetworkMode != settingsNetworkMode"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    move v2, v1

    .line 441
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGetPreferredNetworkTypeResponse: if 2: settingsNetworkMode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "preferred_network_mode"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 451
    :cond_2
    if-ne v1, v8, :cond_3

    .line 452
    const/4 v1, 0x0

    .line 453
    const/4 v2, 0x0

    .line 455
    :cond_3
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;
    invoke-static {v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$500(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/preference/ListPreference;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 456
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updatePreferredNetworkModeSummary(I)V
    invoke-static {v3, v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$600(Lcom/mediatek/settings/Modem3GCapabilitySwitch;I)V

    .line 467
    .end local v1           #modemNetworkMode:I
    .end local v2           #settingsNetworkMode:I
    :goto_0
    return-void

    .line 460
    .restart local v1       #modemNetworkMode:I
    .restart local v2       #settingsNetworkMode:I
    :cond_4
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    const-string v4, "handleGetPreferredNetworkTypeResponse: else: reset to default"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->resetNetworkModeToDefault()V

    goto :goto_0

    .line 465
    .end local v1           #modemNetworkMode:I
    .end local v2           #settingsNetworkMode:I
    :cond_5
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    const-string v4, "handleGetPreferredNetworkTypeResponse(), response exist exception"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private handleSetPreferredNetworkTypeResponse(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x3e9

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 470
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "-------------[handleSetPreferredNetworkTypeResponse]--------------"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 473
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    iget-object v2, v2, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v1

    .line 474
    .local v1, slot:I
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 475
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$700(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/gemini/GeminiPhone;

    move-result-object v2

    invoke-virtual {p0, v4, v6, v5, v7}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPreferredNetworkTypeGemini(Landroid/os/Message;I)V

    .line 483
    :goto_0
    return-void

    .line 479
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-virtual {p0, v4, v6, v5, v7}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/Phone;->getPreferredNetworkType(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private resetNetworkModeToDefault()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 487
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;
    invoke-static {v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$500(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/preference/ListPreference;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 489
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "preferred_network_mode"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 493
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    iget-object v1, v1, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v1}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v0

    .line 494
    .local v0, slot:I
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 495
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-static {v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$700(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/gemini/GeminiPhone;

    move-result-object v1

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v3, v2, v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPreferredNetworkTypeGemini(ILandroid/os/Message;I)V

    .line 501
    :goto_0
    return-void

    .line 498
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 378
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 389
    :goto_0
    return-void

    .line 380
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->handleGetPreferredNetworkTypeResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 384
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->handleSetPreferredNetworkTypeResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 378
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
