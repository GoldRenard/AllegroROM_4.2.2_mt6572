.class Lcom/mediatek/settings/NetworkEditor$2;
.super Landroid/content/BroadcastReceiver;
.source "NetworkEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkEditor;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 102
    iput-object p1, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 105
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 107
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    const-string v3, "state"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    #setter for: Lcom/mediatek/settings/NetworkEditor;->mAirplaneModeEnabled:Z
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkEditor;->access$102(Lcom/mediatek/settings/NetworkEditor;Z)Z

    .line 108
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #calls: Lcom/mediatek/settings/NetworkEditor;->setScreenEnabled()V
    invoke-static {v2}, Lcom/mediatek/settings/NetworkEditor;->access$000(Lcom/mediatek/settings/NetworkEditor;)V

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 110
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    const-string v3, "mode"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    #setter for: Lcom/mediatek/settings/NetworkEditor;->mDualSimMode:I
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkEditor;->access$202(Lcom/mediatek/settings/NetworkEditor;I)I

    .line 111
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #calls: Lcom/mediatek/settings/NetworkEditor;->setScreenEnabled()V
    invoke-static {v2}, Lcom/mediatek/settings/NetworkEditor;->access$000(Lcom/mediatek/settings/NetworkEditor;)V

    goto :goto_0

    .line 112
    :cond_2
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 114
    const-string v2, "NetworkEditor"

    const-string v3, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    invoke-static {v2}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 116
    .local v1, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    iget v2, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iget-object v3, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #getter for: Lcom/mediatek/settings/NetworkEditor;->mSlotId:I
    invoke-static {v3}, Lcom/mediatek/settings/NetworkEditor;->access$300(Lcom/mediatek/settings/NetworkEditor;)I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 117
    :cond_3
    const-string v2, "NetworkEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sim card number is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$2;->this$0:Lcom/mediatek/settings/NetworkEditor;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goToMobileNetworkSettings(Landroid/app/Activity;)V

    goto :goto_0
.end method
