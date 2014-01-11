.class Lcom/mediatek/settings/NetworkSettingList$1;
.super Landroid/content/BroadcastReceiver;
.source "NetworkSettingList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkSettingList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkSettingList;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkSettingList;)V
    .locals 0
    .parameter

    .prologue
    .line 150
    iput-object p1, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 153
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 155
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const-string v3, "state"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    #setter for: Lcom/mediatek/settings/NetworkSettingList;->mAirplaneModeEnabled:Z
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkSettingList;->access$002(Lcom/mediatek/settings/NetworkSettingList;Z)Z

    .line 156
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACTION_AIRPLANE_MODE_CHANGED || mAirplaneModeEnabled:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #getter for: Lcom/mediatek/settings/NetworkSettingList;->mAirplaneModeEnabled:Z
    invoke-static {v4}, Lcom/mediatek/settings/NetworkSettingList;->access$000(Lcom/mediatek/settings/NetworkSettingList;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/settings/NetworkSettingList;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkSettingList;->access$100(Lcom/mediatek/settings/NetworkSettingList;Ljava/lang/String;)V

    .line 157
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #calls: Lcom/mediatek/settings/NetworkSettingList;->setScreenEnabled(Z)V
    invoke-static {v2, v5}, Lcom/mediatek/settings/NetworkSettingList;->access$200(Lcom/mediatek/settings/NetworkSettingList;Z)V

    .line 176
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 159
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const-string v3, "mode"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    #setter for: Lcom/mediatek/settings/NetworkSettingList;->mDualSimMode:I
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkSettingList;->access$302(Lcom/mediatek/settings/NetworkSettingList;I)I

    .line 160
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #calls: Lcom/mediatek/settings/NetworkSettingList;->setScreenEnabled(Z)V
    invoke-static {v2, v5}, Lcom/mediatek/settings/NetworkSettingList;->access$200(Lcom/mediatek/settings/NetworkSettingList;Z)V

    goto :goto_0

    .line 161
    :cond_2
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 163
    const-string v2, "phone"

    const-string v3, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-static {v2}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 165
    .local v1, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_3

    .line 166
    const-string v2, "phone"

    const-string v3, "Activity finished"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goToMobileNetworkSettings(Landroid/app/Activity;)V

    goto :goto_0

    .line 168
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v5, :cond_0

    .line 169
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    iget v2, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iget-object v3, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #getter for: Lcom/mediatek/settings/NetworkSettingList;->mSimId:I
    invoke-static {v3}, Lcom/mediatek/settings/NetworkSettingList;->access$400(Lcom/mediatek/settings/NetworkSettingList;)I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 170
    const-string v2, "phone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "temp.size()="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Activity finished"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$1;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goToMobileNetworkSettings(Landroid/app/Activity;)V

    goto :goto_0
.end method
