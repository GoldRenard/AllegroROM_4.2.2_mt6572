.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;
.super Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitorCallback;
.source "KeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;)V
    .locals 0
    .parameter

    .prologue
    .line 621
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitorCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPhoneStateChanged(I)V
    .locals 1
    .parameter "phoneState"

    .prologue
    .line 647
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    iput p1, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mPhoneState:I

    .line 648
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->updateEmergencyCallButtonState(I)V
    invoke-static {v0, p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$1100(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;I)V

    .line 649
    return-void
.end method

.method public onRefreshBatteryInfo(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;)V
    .locals 4
    .parameter "status"

    .prologue
    const/4 v2, 0x0

    .line 624
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isPluggedIn()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isBatteryLow()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mShowingBatteryInfo:Z
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$402(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Z)Z

    .line 625
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isPluggedIn()Z

    move-result v3

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mPluggedIn:Z
    invoke-static {v1, v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$502(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Z)Z

    .line 626
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    iget v3, p1, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->level:I

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mBatteryLevel:I
    invoke-static {v1, v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$602(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;I)I

    .line 627
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isCharged()Z

    move-result v3

    iput-boolean v3, v1, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mBatteryCharged:Z

    .line 628
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;->isBatteryLow()Z

    move-result v3

    iput-boolean v3, v1, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mBatteryIsLow:Z

    .line 629
    new-instance v0, Llibcore/util/MutableInt;

    invoke-direct {v0, v2}, Llibcore/util/MutableInt;-><init>(I)V

    .line 630
    .local v0, tmpIcon:Llibcore/util/MutableInt;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    const/16 v2, 0xf

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->getAltTextMessage(Llibcore/util/MutableInt;)Ljava/lang/CharSequence;
    invoke-static {v3, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Llibcore/util/MutableInt;)Ljava/lang/CharSequence;

    move-result-object v3

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->update(ILjava/lang/CharSequence;)V
    invoke-static {v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$700(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;ILjava/lang/CharSequence;)V

    .line 631
    return-void

    .end local v0           #tmpIcon:Llibcore/util/MutableInt;
    :cond_1
    move v1, v2

    .line 624
    goto :goto_0
.end method

.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "plmn"
    .parameter "spn"

    .prologue
    .line 640
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mPlmn:Ljava/lang/CharSequence;
    invoke-static {v0, p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$802(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 641
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mSpn:Ljava/lang/CharSequence;
    invoke-static {v0, p2}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$902(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 642
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->mSimState:Lcom/android/internal/telephony/IccCardConstants$State;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCardConstants$State;)V
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$1000(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Lcom/android/internal/telephony/IccCardConstants$State;)V

    .line 643
    return-void
.end method

.method public onSimStateChanged(Lcom/android/internal/telephony/IccCardConstants$State;)V
    .locals 1
    .parameter "simState"

    .prologue
    .line 653
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCardConstants$State;)V
    invoke-static {v0, p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->access$1000(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;Lcom/android/internal/telephony/IccCardConstants$State;)V

    .line 654
    return-void
.end method

.method public onTimeChanged()V
    .locals 1

    .prologue
    .line 635
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager;->refreshDate()V

    .line 636
    return-void
.end method
