.class Lcom/mediatek/settings/PLMNListPreference$MyHandler;
.super Landroid/os/Handler;
.source "PLMNListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/PLMNListPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# static fields
.field private static final MESSAGE_GET_PLMN_CAPIBILITY:I = 0x2

.field private static final MESSAGE_GET_PLMN_LIST:I = 0x0

.field private static final MESSAGE_SET_PLMN_LIST:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/PLMNListPreference;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/PLMNListPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 515
    iput-object p1, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/PLMNListPreference;Lcom/mediatek/settings/PLMNListPreference$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 515
    invoke-direct {p0, p1}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    return-void
.end method


# virtual methods
.method public handleGetPLMNCapibilityResponse(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 591
    const-string v1, "Settings/PLMNListPreference"

    const-string v2, "handleGetPLMNCapibilityResponse: done"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 596
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 597
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleGetPLMNCapibilityResponse with exception = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    :goto_0
    return-void

    .line 599
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mCapability:Lcom/mediatek/settings/PLMNListPreference$SIMCapability;
    invoke-static {v1}, Lcom/mediatek/settings/PLMNListPreference;->access$1200(Lcom/mediatek/settings/PLMNListPreference;)Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

    move-result-object v2

    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, [I

    check-cast v1, [I

    invoke-virtual {v2, v1}, Lcom/mediatek/settings/PLMNListPreference$SIMCapability;->setCapability([I)V

    goto :goto_0
.end method

.method public handleGetPLMNResponse(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 539
    const-string v2, "Settings/PLMNListPreference"

    const-string v3, "handleGetPLMNResponse: done"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-nez v2, :cond_1

    .line 543
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$600(Lcom/mediatek/settings/PLMNListPreference;)Landroid/preference/PreferenceScreen;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/settings/PLMNListPreference;->onFinished(Landroid/preference/Preference;Z)V

    .line 548
    :goto_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 549
    .local v0, ar:Landroid/os/AsyncResult;
    const/4 v1, 0x0

    .line 550
    .local v1, isUserException:Z
    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_2

    .line 551
    const-string v2, "Settings/PLMNListPreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleGetPLMNResponse with exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;
    invoke-static {v2}, Lcom/mediatek/settings/PLMNListPreference;->access$700(Lcom/mediatek/settings/PLMNListPreference;)Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_0

    .line 553
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    #setter for: Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;
    invoke-static {v2, v3}, Lcom/mediatek/settings/PLMNListPreference;->access$702(Lcom/mediatek/settings/PLMNListPreference;Ljava/util/List;)Ljava/util/List;

    .line 558
    :cond_0
    :goto_1
    return-void

    .line 545
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #isUserException:Z
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$600(Lcom/mediatek/settings/PLMNListPreference;)Landroid/preference/PreferenceScreen;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/settings/PLMNListPreference;->onFinished(Landroid/preference/Preference;Z)V

    goto :goto_0

    .line 556
    .restart local v0       #ar:Landroid/os/AsyncResult;
    .restart local v1       #isUserException:Z
    :cond_2
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    iget-object v2, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    #calls: Lcom/mediatek/settings/PLMNListPreference;->refreshPreference(Ljava/util/ArrayList;)V
    invoke-static {v3, v2}, Lcom/mediatek/settings/PLMNListPreference;->access$800(Lcom/mediatek/settings/PLMNListPreference;Ljava/util/ArrayList;)V

    goto :goto_1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 521
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 535
    :goto_0
    return-void

    .line 523
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->handleGetPLMNResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 526
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->handleSetPLMNResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 530
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->handleGetPLMNCapibilityResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 521
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public handleSetPLMNResponse(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 562
    const-string v3, "Settings/PLMNListPreference"

    const-string v4, "handleSetPLMNResponse: done"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$910(Lcom/mediatek/settings/PLMNListPreference;)I

    .line 566
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 567
    .local v0, ar:Landroid/os/AsyncResult;
    const/4 v2, 0x0

    .line 568
    .local v2, isUserException:Z
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_1

    .line 569
    const-string v3, "Settings/PLMNListPreference"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleSetPLMNResponse with exception = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    :goto_0
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$900(Lcom/mediatek/settings/PLMNListPreference;)I

    move-result v3

    if-nez v3, :cond_0

    .line 577
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 578
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$1000(Lcom/mediatek/settings/PLMNListPreference;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 579
    .local v1, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$400(Lcom/mediatek/settings/PLMNListPreference;)I

    move-result v3

    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;
    invoke-static {v4}, Lcom/mediatek/settings/PLMNListPreference;->access$1100(Lcom/mediatek/settings/PLMNListPreference;)Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I
    invoke-static {v5}, Lcom/mediatek/settings/PLMNListPreference;->access$400(Lcom/mediatek/settings/PLMNListPreference;)I

    move-result v5

    invoke-virtual {v4, v6, v5, v7}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPreferedOperatorListGemini(ILandroid/os/Message;)V

    .line 587
    .end local v1           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    :goto_1
    return-void

    .line 572
    :cond_1
    const-string v3, "Settings/PLMNListPreference"

    const-string v4, "handleSetPLMNResponse: with OK result!"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 583
    :cond_2
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v3}, Lcom/mediatek/settings/PLMNListPreference;->access$1000(Lcom/mediatek/settings/PLMNListPreference;)Lcom/android/internal/telephony/Phone;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;
    invoke-static {v4}, Lcom/mediatek/settings/PLMNListPreference;->access$1100(Lcom/mediatek/settings/PLMNListPreference;)Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #getter for: Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I
    invoke-static {v5}, Lcom/mediatek/settings/PLMNListPreference;->access$400(Lcom/mediatek/settings/PLMNListPreference;)I

    move-result v5

    invoke-virtual {v4, v6, v5, v7}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/android/internal/telephony/Phone;->getPreferedOperatorList(Landroid/os/Message;)V

    goto :goto_1
.end method
