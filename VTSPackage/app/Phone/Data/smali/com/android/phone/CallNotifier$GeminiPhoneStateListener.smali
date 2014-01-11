.class final Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "CallNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/CallNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "GeminiPhoneStateListener"
.end annotation


# instance fields
.field inAirplaneMode:Z

.field mSlotId:I

.field final synthetic this$0:Lcom/android/phone/CallNotifier;


# direct methods
.method public constructor <init>(Lcom/android/phone/CallNotifier;I)V
    .locals 1
    .parameter
    .parameter "slotId"

    .prologue
    .line 3383
    iput-object p1, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 3380
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->inAirplaneMode:Z

    .line 3384
    iput p2, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    .line 3385
    return-void
.end method


# virtual methods
.method public onCallForwardingIndicatorChanged(Z)V
    .locals 3
    .parameter "cfi"

    .prologue
    .line 3395
    const-string v0, "CallNotifier"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PhoneStateListener.onCallForwardingIndicatorChanged: cfi="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3396
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    #getter for: Lcom/android/phone/CallNotifier;->mCfiStatus:[Z
    invoke-static {v0}, Lcom/android/phone/CallNotifier;->access$1300(Lcom/android/phone/CallNotifier;)[Z

    move-result-object v0

    iget v1, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    aput-boolean p1, v0, v1

    .line 3398
    iget-boolean v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->inAirplaneMode:Z

    if-nez v0, :cond_0

    .line 3399
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    iget v1, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    #calls: Lcom/android/phone/CallNotifier;->onCfiChanged(ZI)V
    invoke-static {v0, p1, v1}, Lcom/android/phone/CallNotifier;->access$1400(Lcom/android/phone/CallNotifier;ZI)V

    .line 3401
    :cond_0
    return-void
.end method

.method public onMessageWaitingIndicatorChanged(Z)V
    .locals 3
    .parameter "mwi"

    .prologue
    .line 3389
    const-string v0, "CallNotifier"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PhoneStateListener.onMessageWaitingIndicatorChanged: mwi="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3390
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    iget v1, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    #calls: Lcom/android/phone/CallNotifier;->onMwiChanged(ZI)V
    invoke-static {v0, p1, v1}, Lcom/android/phone/CallNotifier;->access$1200(Lcom/android/phone/CallNotifier;ZI)V

    .line 3391
    return-void
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 5
    .parameter "serviceState"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 3405
    const-string v0, "CallNotifier"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneStateListener.onServiceStateChanged: serviceState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3407
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getState()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->inAirplaneMode:Z

    .line 3408
    iget-boolean v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->inAirplaneMode:Z

    if-ne v0, v1, :cond_2

    .line 3409
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    iget v1, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    #calls: Lcom/android/phone/CallNotifier;->onCfiChanged(ZI)V
    invoke-static {v0, v2, v1}, Lcom/android/phone/CallNotifier;->access$1400(Lcom/android/phone/CallNotifier;ZI)V

    .line 3415
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v2

    .line 3407
    goto :goto_0

    .line 3411
    :cond_2
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    #getter for: Lcom/android/phone/CallNotifier;->mCfiStatus:[Z
    invoke-static {v0}, Lcom/android/phone/CallNotifier;->access$1300(Lcom/android/phone/CallNotifier;)[Z

    move-result-object v0

    iget v2, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getState()I

    move-result v0

    if-nez v0, :cond_0

    .line 3412
    iget-object v0, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->this$0:Lcom/android/phone/CallNotifier;

    iget v2, p0, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;->mSlotId:I

    #calls: Lcom/android/phone/CallNotifier;->onCfiChanged(ZI)V
    invoke-static {v0, v1, v2}, Lcom/android/phone/CallNotifier;->access$1400(Lcom/android/phone/CallNotifier;ZI)V

    goto :goto_1
.end method
