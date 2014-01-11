.class Lcom/mediatek/settings/VTAdvancedSettingEx$1;
.super Landroid/content/BroadcastReceiver;
.source "VTAdvancedSettingEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/VTAdvancedSettingEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/VTAdvancedSettingEx;)V
    .locals 0
    .parameter

    .prologue
    .line 116
    iput-object p1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 119
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 121
    invoke-static {p1}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 122
    .local v1, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 123
    const-string v2, "Settings/VTAdvancedSetting"

    const-string v3, "Activity finished"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goUpToTopLevelSetting(Landroid/app/Activity;)V

    .line 133
    .end local v1           #temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    :goto_0
    return-void

    .line 125
    .restart local v1       #temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 126
    const-string v2, "Settings/VTAdvancedSetting"

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

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goUpToTopLevelSetting(Landroid/app/Activity;)V

    goto :goto_0

    .line 129
    :cond_2
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    invoke-static {v3}, Lcom/mediatek/settings/CallSettings;->get3GSimCards(Landroid/app/Activity;)[J

    move-result-object v3

    #setter for: Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J
    invoke-static {v2, v3}, Lcom/mediatek/settings/VTAdvancedSettingEx;->access$002(Lcom/mediatek/settings/VTAdvancedSettingEx;[J)[J

    .line 130
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;->this$0:Lcom/mediatek/settings/VTAdvancedSettingEx;

    #calls: Lcom/mediatek/settings/VTAdvancedSettingEx;->setScreenEnabled()V
    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->access$100(Lcom/mediatek/settings/VTAdvancedSettingEx;)V

    goto :goto_0
.end method
