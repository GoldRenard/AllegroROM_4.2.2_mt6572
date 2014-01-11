.class Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "NetworkControllerCoolpad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "myPhoneStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;


# direct methods
.method private constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V
    .locals 0
    .parameter

    .prologue
    .line 547
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 547
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 4
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 580
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 581
    .local v0, slotId:I
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onCallStateChanged, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " before."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onCallStateChanged, state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isCdma(I)Z
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 585
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 586
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 587
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 594
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon()V
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V

    .line 595
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType()V
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V

    .line 596
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    .line 598
    const-string v1, "NetworkControllerCoolpad"

    const-string v2, "PhoneStateListener:onCallStateChanged, sim1 after."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    return-void
.end method

.method public onDataActivity(I)V
    .locals 4
    .parameter "direction"

    .prologue
    .line 616
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 617
    .local v0, slotId:I
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataActivity, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " before."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 618
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataActivity, direction="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 620
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 621
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 622
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataActivity, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " after."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    return-void
.end method

.method public onDataConnectionStateChanged(II)V
    .locals 4
    .parameter "state"
    .parameter "networkType"

    .prologue
    .line 603
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 604
    .local v0, slotId:I
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataConnectionStateChanged, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " before."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataConnectionStateChanged, state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 607
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I

    move-result-object v1

    aput p2, v1, v0

    .line 608
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 609
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 610
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 611
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onDataConnectionStateChanged, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " after."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    return-void
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 5
    .parameter "state"

    .prologue
    .line 562
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 563
    .local v0, slotId:I
    const-string v2, "NetworkControllerCoolpad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneStateListener:onServiceStateChanged, sim"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " before."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    const-string v2, "NetworkControllerCoolpad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneStateListener:onServiceStateChanged, state="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getState()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 565
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Landroid/telephony/ServiceState;

    move-result-object v2

    aput-object p1, v2, v0

    .line 567
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 568
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I

    move-result-object v2

    invoke-virtual {v1, v0}, Landroid/telephony/TelephonyManager;->getNetworkTypeGemini(I)I

    move-result v3

    aput v3, v2, v0

    .line 569
    const-string v2, "NetworkControllerCoolpad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneStateListener:onServiceStateChanged sim"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mDataNetType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I
    invoke-static {v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I

    move-result-object v4

    aget v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 572
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 573
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 574
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 575
    const-string v2, "NetworkControllerCoolpad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneStateListener:onServiceStateChanged, sim"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " after."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 4
    .parameter "signalStrength"

    .prologue
    .line 550
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 551
    .local v0, slotId:I
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onSignalStrengthsChanged, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " before."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onSignalStrengthsChanged, signalStrength="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 553
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Landroid/telephony/SignalStrength;

    move-result-object v1

    aput-object p1, v1, v0

    .line 554
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 555
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V

    .line 556
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 557
    const-string v1, "NetworkControllerCoolpad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneStateListener:onSignalStrengthsChanged, sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " after."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    return-void
.end method
