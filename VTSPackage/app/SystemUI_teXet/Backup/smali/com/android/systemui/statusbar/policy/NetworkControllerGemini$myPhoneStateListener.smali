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
    .registers 2
    .parameter

    .prologue
    .line 585
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 585
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 7
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 618
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 619
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

    .line 620
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

    .line 622
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 623
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 624
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 625
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 632
    :cond_5b
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 633
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 634
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    .line 636
    const-string v1, "NetworkControllerGemini"

    const-string v2, "PhoneStateListener:onCallStateChanged, sim1 after."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    return-void
.end method

.method public onDataActivity(I)V
    .registers 6
    .parameter "direction"

    .prologue
    .line 654
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 655
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

    .line 656
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

    .line 657
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 658
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 659
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 660
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

    .line 661
    return-void
.end method

.method public onDataConnectionStateChanged(II)V
    .registers 7
    .parameter "state"
    .parameter "networkType"

    .prologue
    .line 641
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 642
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

    .line 643
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

    .line 644
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p1, v1, v0

    .line 645
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v1

    aput p2, v1, v0

    .line 646
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 647
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 648
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 649
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

    .line 650
    return-void
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .registers 7
    .parameter "state"

    .prologue
    .line 600
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 601
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

    .line 602
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

    .line 603
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/ServiceState;

    move-result-object v2

    aput-object p1, v2, v0

    .line 605
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 606
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v2

    invoke-virtual {v1, v0}, Landroid/telephony/TelephonyManager;->getNetworkTypeGemini(I)I

    move-result v3

    aput v3, v2, v0

    .line 607
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

    invoke-static {v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I

    move-result-object v4

    aget v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 610
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 611
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 612
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 613
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

    .line 614
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .registers 6
    .parameter "signalStrength"

    .prologue
    .line 588
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 589
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

    .line 590
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

    .line 591
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/SignalStrength;

    move-result-object v1

    aput-object p1, v1, v0

    .line 592
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 593
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V

    .line 594
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 595
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

    .line 596
    return-void
.end method
