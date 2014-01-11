.class Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "NetworkControllerGemini.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "myPhoneStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;


# direct methods
.method private constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .locals 0
    .parameter

    .prologue
    .line 556
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 556
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 4
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 589
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 590
    .local v0, slotId:I
    const-string v1, "NetworkControllerGemini"

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

    .line 591
    const-string v1, "NetworkControllerGemini"

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

    .line 593
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 594
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 595
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 596
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 603
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon()V
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 604
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 605
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    .line 607
    const-string v1, "NetworkControllerGemini"

    const-string v2, "PhoneStateListener:onCallStateChanged, sim1 after."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    return-void
.end method

.method public onDataActivity(I)V
    .locals 4
    .parameter "direction"

    .prologue
    .line 625
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 626
    .local v0, slotId:I
    const-string v1, "NetworkControllerGemini"

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

    .line 627
    const-string v1, "NetworkControllerGemini"

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

    .line 628
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 629
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 630
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 631
    const-string v1, "NetworkControllerGemini"

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

    .line 632
    return-void
.end method

.method public onDataConnectionStateChanged(II)V
    .locals 4
    .parameter "state"
    .parameter "networkType"

    .prologue
    .line 612
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 613
    .local v0, slotId:I
    const-string v1, "NetworkControllerGemini"

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

    .line 614
    const-string v1, "NetworkControllerGemini"

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

    .line 615
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 616
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p2, v1, v0

    .line 617
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 618
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 619
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 620
    const-string v1, "NetworkControllerGemini"

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

    .line 621
    return-void
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 5
    .parameter "state"

    .prologue
    .line 571
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 572
    .local v0, slotId:I
    const-string v2, "NetworkControllerGemini"

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

    .line 573
    const-string v2, "NetworkControllerGemini"

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

    .line 574
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/ServiceState;

    move-result-object v2

    aput-object p1, v2, v0

    .line 576
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 577
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I
    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v2

    invoke-virtual {v1, v0}, Landroid/telephony/TelephonyManager;->getNetworkTypeGemini(I)I

    move-result v3

    aput v3, v2, v0

    .line 578
    const-string v2, "NetworkControllerGemini"

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

    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I
    invoke-static {v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v4

    aget v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 580
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 581
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 582
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V
    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 583
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 584
    const-string v2, "NetworkControllerGemini"

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

    .line 585
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 4
    .parameter "signalStrength"

    .prologue
    .line 559
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 560
    .local v0, slotId:I
    const-string v1, "NetworkControllerGemini"

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

    .line 561
    const-string v1, "NetworkControllerGemini"

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

    .line 562
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/SignalStrength;

    move-result-object v1

    aput-object p1, v1, v0

    .line 563
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 564
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #calls: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 565
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 566
    const-string v1, "NetworkControllerGemini"

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

    .line 567
    return-void
.end method
