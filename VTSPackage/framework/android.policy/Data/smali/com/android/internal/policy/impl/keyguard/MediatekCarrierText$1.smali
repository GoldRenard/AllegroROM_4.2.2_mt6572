.class Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;
.super Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;
.source "MediatekCarrierText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final DEFAULT_SIM_ID:I


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)V
    .locals 0
    .parameter

    .prologue
    .line 50
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 5
    .parameter "plmn"
    .parameter "spn"

    .prologue
    const/4 v4, 0x0

    .line 54
    const-string v0, "MediatekCarrierText"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRefreshCarrierInfo plmn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", spn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v0

    aput-object p1, v0, v4

    .line 56
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v0

    aput-object p2, v0, v4

    .line 57
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v1

    aget-object v1, v1, v4

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, v4

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V

    .line 58
    return-void
.end method

.method public onRefreshCarrierInfoGemini(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V
    .locals 4
    .parameter "plmn"
    .parameter "spn"
    .parameter "simId"

    .prologue
    .line 71
    const-string v0, "MediatekCarrierText"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRefreshCarrierInfoGemini plmn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", spn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", simId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-static {p3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->isValidSimId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v0

    aput-object p1, v0, p3

    .line 74
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v0

    aput-object p2, v0, p3

    .line 75
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v1

    aget-object v1, v1, p3

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, p3

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, p3

    invoke-virtual {v0, v1, v2, v3, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V

    .line 77
    :cond_0
    return-void
.end method

.method public onSearchNetworkUpdate(IZ)V
    .locals 5
    .parameter "simId"
    .parameter "switchOn"

    .prologue
    .line 91
    const-string v1, "MediatekCarrierText"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSearchNetworkUpdate simId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", switchOn="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-static {p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->isValidSimId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 93
    const/4 p1, 0x0

    .line 95
    :cond_0
    if-eqz p2, :cond_1

    .line 96
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x205009b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, carrierText:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$300(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v1

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;->NetworkSearching:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    aput-object v2, v1, p1

    .line 98
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #calls: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGeminiForSearchNetwork(Ljava/lang/String;I)V
    invoke-static {v1, v0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$400(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;Ljava/lang/String;I)V

    .line 103
    .end local v0           #carrierText:Ljava/lang/String;
    :goto_0
    return-void

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mStatusMode:[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$300(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v3

    aget-object v3, v3, p1

    #calls: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->getStatusForIccState(Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;
    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$500(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;Lcom/android/internal/telephony/IccCardConstants$State;)Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode;

    move-result-object v2

    aput-object v2, v1, p1

    .line 101
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v2

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, p1

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v4}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-virtual {v1, v2, v3, v4, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V

    goto :goto_0
.end method

.method public onSimStateChanged(Lcom/android/internal/telephony/IccCardConstants$State;)V
    .locals 5
    .parameter "simState"

    .prologue
    const/4 v4, 0x0

    .line 62
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v0

    aput-object p1, v0, v4

    .line 63
    const-string v0, "MediatekCarrierText"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSimStateChanged mSimState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v1

    aget-object v1, v1, v4

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, v4

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V

    .line 65
    return-void
.end method

.method public onSimStateChangedGemini(Lcom/android/internal/telephony/IccCardConstants$State;I)V
    .locals 4
    .parameter "simState"
    .parameter "simId"

    .prologue
    .line 82
    const-string v0, "MediatekCarrierText"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSimStateChangedGemini simId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mSimState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-static {p2}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->isValidSimId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v0

    aput-object p1, v0, p2

    .line 85
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v1

    aget-object v1, v1, p2

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mPlmn:[Ljava/lang/CharSequence;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$000(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, p2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText$1;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;

    #getter for: Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->mSpn:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->access$100(Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;)[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, p2

    invoke-virtual {v0, v1, v2, v3, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekCarrierText;->updateCarrierTextGemini(Lcom/android/internal/telephony/IccCardConstants$State;Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V

    .line 87
    :cond_0
    return-void
.end method
