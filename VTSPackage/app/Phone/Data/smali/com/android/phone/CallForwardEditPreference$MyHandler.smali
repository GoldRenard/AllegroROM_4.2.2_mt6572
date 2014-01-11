.class Lcom/android/phone/CallForwardEditPreference$MyHandler;
.super Landroid/os/Handler;
.source "CallForwardEditPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/CallForwardEditPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# static fields
.field private static final MESSAGE_GET_CF:I = 0x0

.field private static final MESSAGE_SET_CF:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/android/phone/CallForwardEditPreference;


# direct methods
.method private constructor <init>(Lcom/android/phone/CallForwardEditPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 291
    iput-object p1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/CallForwardEditPreference;Lcom/android/phone/CallForwardEditPreference$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 291
    invoke-direct {p0, p1}, Lcom/android/phone/CallForwardEditPreference$MyHandler;-><init>(Lcom/android/phone/CallForwardEditPreference;)V

    return-void
.end method

.method private handleGetCFResponse(Landroid/os/Message;)V
    .locals 12
    .parameter "msg"

    .prologue
    .line 311
    const-string v9, "Settings/CallForwardEditPreference"

    const-string v10, "handleGetCFResponse: done"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    const/4 v3, 0x0

    .line 315
    .local v3, foundServiceClass:Z
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 316
    .local v0, ar:Landroid/os/AsyncResult;
    const/4 v6, 0x0

    .line 317
    .local v6, isUserException:Z
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    iput-object v10, v9, Lcom/android/phone/CallForwardEditPreference;->mCallForwardInfo:Lcom/android/internal/telephony/CallForwardInfo;

    .line 318
    iget-object v9, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v9, :cond_3

    .line 320
    const-string v9, "Settings/CallForwardEditPreference"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "handleGetCFResponse: ar.exception="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->setEnabled(Z)V

    .line 323
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    #setter for: Lcom/android/phone/CallForwardEditPreference;->mResult:Z
    invoke-static {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->access$102(Lcom/android/phone/CallForwardEditPreference;Z)Z

    .line 324
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v10, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v11, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v9, Lcom/android/internal/telephony/CommandException;

    invoke-interface {v10, v11, v9}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onException(Landroid/preference/Preference;Lcom/android/internal/telephony/CommandException;)V

    .line 391
    :cond_0
    :goto_0
    if-nez v3, :cond_1

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->isToggled()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 392
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->setToggled(Z)Lcom/android/phone/EditPhoneNumberPreference;

    .line 396
    :cond_1
    const-string v9, "Settings/CallForwardEditPreference"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "tcpListener2 ="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v11, v11, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    iget v9, p1, Landroid/os/Message;->arg2:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_7

    .line 398
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v10, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onFinished(Landroid/preference/Preference;Z)V

    .line 403
    :goto_1
    iget v9, p1, Landroid/os/Message;->arg2:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v9, v9, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    if-nez v9, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->isToggled()Z

    move-result v9

    if-nez v9, :cond_2

    .line 405
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    instance-of v9, v9, Lcom/android/phone/GsmUmtsCallForwardOptions;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mLastCallForwardInfo:Lcom/android/internal/telephony/CallForwardInfo;
    invoke-static {v9}, Lcom/android/phone/CallForwardEditPreference;->access$300(Lcom/android/phone/CallForwardEditPreference;)Lcom/android/internal/telephony/CallForwardInfo;

    move-result-object v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mLastCallForwardInfo:Lcom/android/internal/telephony/CallForwardInfo;
    invoke-static {v9}, Lcom/android/phone/CallForwardEditPreference;->access$300(Lcom/android/phone/CallForwardEditPreference;)Lcom/android/internal/telephony/CallForwardInfo;

    move-result-object v9

    iget v9, v9, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mCallForwardInfo:Lcom/android/internal/telephony/CallForwardInfo;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mCallForwardInfo:Lcom/android/internal/telephony/CallForwardInfo;

    iget v9, v9, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-nez v9, :cond_2

    .line 408
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    check-cast v9, Lcom/android/phone/GsmUmtsCallForwardOptions;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/android/phone/GsmUmtsCallForwardOptions;->refreshSettings(Z)V

    .line 415
    :cond_2
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #calls: Lcom/android/phone/CallForwardEditPreference;->updateSummaryText()V
    invoke-static {v9}, Lcom/android/phone/CallForwardEditPreference;->access$400(Lcom/android/phone/CallForwardEditPreference;)V

    .line 416
    return-void

    .line 327
    :cond_3
    iget-object v9, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v9, v9, Ljava/lang/Throwable;

    if-eqz v9, :cond_4

    .line 329
    const-string v9, "Settings/CallForwardEditPreference"

    const-string v10, "userObj == Throwable"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const/4 v6, 0x1

    .line 332
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v10, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/16 v11, 0x190

    invoke-interface {v9, v10, v11}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    .line 333
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v10, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v10, v10, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v9, v10, v6}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onUpdate(Lcom/mediatek/phone/TimeConsumingPreferenceListener;Z)V

    .line 335
    :cond_4
    iget-object v9, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v9, [Lcom/android/internal/telephony/CallForwardInfo;

    move-object v2, v9

    check-cast v2, [Lcom/android/internal/telephony/CallForwardInfo;

    .line 336
    .local v2, cfInfoArray:[Lcom/android/internal/telephony/CallForwardInfo;
    array-length v9, v2

    if-nez v9, :cond_5

    .line 338
    const-string v9, "Settings/CallForwardEditPreference"

    const-string v10, "handleGetCFResponse: cfInfoArray.length==0"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->setEnabled(Z)V

    .line 341
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x0

    #setter for: Lcom/android/phone/CallForwardEditPreference;->mResult:Z
    invoke-static {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->access$102(Lcom/android/phone/CallForwardEditPreference;Z)Z

    .line 342
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v10, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/16 v11, 0x190

    invoke-interface {v9, v10, v11}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    goto/16 :goto_0

    .line 344
    :cond_5
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x1

    #setter for: Lcom/android/phone/CallForwardEditPreference;->mResult:Z
    invoke-static {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->access$102(Lcom/android/phone/CallForwardEditPreference;Z)Z

    .line 346
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/android/phone/CallForwardEditPreference;->setEnabled(Z)V

    .line 348
    const/4 v4, 0x0

    .local v4, i:I
    array-length v7, v2

    .local v7, length:I
    :goto_2
    if-ge v4, v7, :cond_0

    .line 350
    const-string v9, "Settings/CallForwardEditPreference"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "handleGetCFResponse, cfInfoArray["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "]="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-object v11, v2, v4

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mServiceClass:I
    invoke-static {v9}, Lcom/android/phone/CallForwardEditPreference;->access$200(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v9

    aget-object v10, v2, v4

    iget v10, v10, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    and-int/2addr v9, v10

    if-eqz v9, :cond_6

    .line 356
    const/4 v3, 0x1

    .line 358
    aget-object v5, v2, v4

    .line 359
    .local v5, info:Lcom/android/internal/telephony/CallForwardInfo;
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9, v5}, Lcom/android/phone/CallForwardEditPreference;->handleCallForwardResult(Lcom/android/internal/telephony/CallForwardInfo;)V

    .line 365
    iget v9, p1, Landroid/os/Message;->arg2:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_6

    iget v9, p1, Landroid/os/Message;->arg1:I

    if-nez v9, :cond_6

    iget v9, v5, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_6

    .line 369
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v9, v9, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    packed-switch v9, :pswitch_data_0

    .line 377
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f0d01db

    invoke-virtual {v9, v10}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 379
    .local v8, s:Ljava/lang/CharSequence;
    :goto_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v1, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 380
    .local v1, builder:Landroid/app/AlertDialog$Builder;
    const v9, 0x7f0d01e5

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 381
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f0d01dd

    invoke-virtual {v9, v10}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 382
    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 383
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 384
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 348
    .end local v1           #builder:Landroid/app/AlertDialog$Builder;
    .end local v5           #info:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v8           #s:Ljava/lang/CharSequence;
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2

    .line 371
    .restart local v5       #info:Lcom/android/internal/telephony/CallForwardInfo;
    :pswitch_0
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f0d01d1

    invoke-virtual {v9, v10}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 372
    .restart local v8       #s:Ljava/lang/CharSequence;
    goto :goto_3

    .line 374
    .end local v8           #s:Ljava/lang/CharSequence;
    :pswitch_1
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    invoke-virtual {v9}, Lcom/android/phone/CallForwardEditPreference;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f0d01d6

    invoke-virtual {v9, v10}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 375
    .restart local v8       #s:Ljava/lang/CharSequence;
    goto :goto_3

    .line 400
    .end local v2           #cfInfoArray:[Lcom/android/internal/telephony/CallForwardInfo;
    .end local v4           #i:I
    .end local v5           #info:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v7           #length:I
    .end local v8           #s:Ljava/lang/CharSequence;
    :cond_7
    iget-object v9, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v9, v9, Lcom/android/phone/CallForwardEditPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    iget-object v10, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    const/4 v11, 0x1

    invoke-interface {v9, v10, v11}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onFinished(Landroid/preference/Preference;Z)V

    goto/16 :goto_1

    .line 369
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private handleSetCFResponse(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    const/16 v4, 0x200

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 419
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 421
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 423
    const-string v1, "Settings/CallForwardEditPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleSetCFResponse: ar.exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    :cond_0
    const-string v1, "Settings/CallForwardEditPreference"

    const-string v2, "handleSetCFResponse: re get"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    const-string v1, "Settings/CallForwardEditPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mSimdId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mSimId:I
    invoke-static {v3}, Lcom/android/phone/CallForwardEditPreference;->access$500(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 433
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mServiceClass:I
    invoke-static {v1}, Lcom/android/phone/CallForwardEditPreference;->access$200(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v1

    if-ne v1, v4, :cond_1

    .line 434
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v1, v1, Lcom/android/phone/CallForwardEditPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v2, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v2, v2, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p0, v5, v3, v6, v4}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mSimId:I
    invoke-static {v4}, Lcom/android/phone/CallForwardEditPreference;->access$500(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVtCallForwardingOptionGemini(ILandroid/os/Message;I)V

    .line 449
    :goto_0
    return-void

    .line 437
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v1, v1, Lcom/android/phone/CallForwardEditPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v2, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v2, v2, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p0, v5, v3, v6, v4}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mSimId:I
    invoke-static {v4}, Lcom/android/phone/CallForwardEditPreference;->access$500(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCallForwardingOptionGemini(ILandroid/os/Message;I)V

    goto :goto_0

    .line 441
    :cond_2
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    #getter for: Lcom/android/phone/CallForwardEditPreference;->mServiceClass:I
    invoke-static {v1}, Lcom/android/phone/CallForwardEditPreference;->access$200(Lcom/android/phone/CallForwardEditPreference;)I

    move-result v1

    if-ne v1, v4, :cond_3

    .line 442
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v1, v1, Lcom/android/phone/CallForwardEditPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v2, v2, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p0, v5, v3, v6, v4}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/Phone;->getVtCallForwardingOption(ILandroid/os/Message;)V

    goto :goto_0

    .line 445
    :cond_3
    iget-object v1, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget-object v1, v1, Lcom/android/phone/CallForwardEditPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/CallForwardEditPreference$MyHandler;->this$0:Lcom/android/phone/CallForwardEditPreference;

    iget v2, v2, Lcom/android/phone/CallForwardEditPreference;->mReason:I

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p0, v5, v3, v6, v4}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/Phone;->getCallForwardingOption(ILandroid/os/Message;)V

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 297
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 307
    :goto_0
    return-void

    .line 299
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->handleGetCFResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 302
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/android/phone/CallForwardEditPreference$MyHandler;->handleSetCFResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 297
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
