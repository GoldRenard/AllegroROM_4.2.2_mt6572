.class Lcom/mediatek/hdmi/HDMILocalService$1;
.super Landroid/telephony/PhoneStateListener;
.source "HDMILocalService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/hdmi/HDMILocalService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/hdmi/HDMILocalService;


# direct methods
.method constructor <init>(Lcom/mediatek/hdmi/HDMILocalService;)V
    .locals 0
    .parameter

    .prologue
    .line 112
    iput-object p1, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 8
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 114
    const-string v3, "hdmi"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " >> HDMILocalService. Phone state changed, new state="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    if-eqz p1, :cond_0

    .line 116
    invoke-static {v6}, Lcom/mediatek/hdmi/HDMILocalService;->access$302(Z)Z

    .line 117
    iget-object v3, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    #calls: Lcom/mediatek/hdmi/HDMILocalService;->dealWithCallStateChanged()V
    invoke-static {v3}, Lcom/mediatek/hdmi/HDMILocalService;->access$400(Lcom/mediatek/hdmi/HDMILocalService;)V

    .line 141
    :goto_0
    return-void

    .line 121
    :cond_0
    iget-object v3, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    #getter for: Lcom/mediatek/hdmi/HDMILocalService;->mTelephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {v3}, Lcom/mediatek/hdmi/HDMILocalService;->access$500(Lcom/mediatek/hdmi/HDMILocalService;)Landroid/telephony/TelephonyManager;

    move-result-object v3

    if-nez v3, :cond_1

    .line 122
    iget-object v4, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    iget-object v3, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    const-string v5, "phone"

    invoke-virtual {v3, v5}, Lcom/mediatek/hdmi/HDMILocalService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    #setter for: Lcom/mediatek/hdmi/HDMILocalService;->mTelephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {v4, v3}, Lcom/mediatek/hdmi/HDMILocalService;->access$502(Lcom/mediatek/hdmi/HDMILocalService;Landroid/telephony/TelephonyManager;)Landroid/telephony/TelephonyManager;

    .line 124
    :cond_1
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v2

    .line 125
    .local v2, telephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    invoke-virtual {v2, v6}, Lcom/mediatek/telephony/TelephonyManagerEx;->getCallState(I)I

    move-result v0

    .line 126
    .local v0, sim1State:I
    invoke-virtual {v2, v7}, Lcom/mediatek/telephony/TelephonyManagerEx;->getCallState(I)I

    move-result v1

    .line 127
    .local v1, sim2State:I
    const-string v3, "hdmi"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " >> HDMILocalService.phone state change, sim1="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", sim2="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    if-nez v0, :cond_2

    if-eqz v1, :cond_3

    .line 131
    :cond_2
    const-string v3, "hdmi"

    const-string v4, " >> HDMILocalService. phone is not idle for gemini phone"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    invoke-static {v6}, Lcom/mediatek/hdmi/HDMILocalService;->access$302(Z)Z

    .line 134
    iget-object v3, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    #calls: Lcom/mediatek/hdmi/HDMILocalService;->dealWithCallStateChanged()V
    invoke-static {v3}, Lcom/mediatek/hdmi/HDMILocalService;->access$400(Lcom/mediatek/hdmi/HDMILocalService;)V

    goto :goto_0

    .line 139
    :cond_3
    invoke-static {v7}, Lcom/mediatek/hdmi/HDMILocalService;->access$302(Z)Z

    .line 140
    iget-object v3, p0, Lcom/mediatek/hdmi/HDMILocalService$1;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    #calls: Lcom/mediatek/hdmi/HDMILocalService;->dealWithCallStateChanged()V
    invoke-static {v3}, Lcom/mediatek/hdmi/HDMILocalService;->access$400(Lcom/mediatek/hdmi/HDMILocalService;)V

    goto :goto_0
.end method
