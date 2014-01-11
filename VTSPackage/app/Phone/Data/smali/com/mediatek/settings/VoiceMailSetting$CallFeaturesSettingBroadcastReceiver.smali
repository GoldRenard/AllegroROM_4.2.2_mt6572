.class Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VoiceMailSetting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/VoiceMailSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallFeaturesSettingBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/VoiceMailSetting;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/VoiceMailSetting;)V
    .locals 0
    .parameter

    .prologue
    .line 1953
    iput-object p1, p0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;->this$0:Lcom/mediatek/settings/VoiceMailSetting;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/VoiceMailSetting;Lcom/mediatek/settings/VoiceMailSetting$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1953
    invoke-direct {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;-><init>(Lcom/mediatek/settings/VoiceMailSetting;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 1956
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1957
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "state"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "mode"

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_3

    .line 1961
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;->this$0:Lcom/mediatek/settings/VoiceMailSetting;

    invoke-virtual {v2}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    .line 1976
    :cond_2
    :goto_0
    return-void

    .line 1962
    :cond_3
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1964
    invoke-static {p1}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 1965
    .local v1, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 1966
    const-string v2, "Settings/VoiceMailSetting"

    const-string v3, "Activity finished"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1967
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;->this$0:Lcom/mediatek/settings/VoiceMailSetting;

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->goUpToTopLevelSetting(Landroid/app/Activity;)V

    goto :goto_0

    .line 1968
    :cond_4
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 1969
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    iget v2, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;->this$0:Lcom/mediatek/settings/VoiceMailSetting;

    #getter for: Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I
    invoke-static {v3}, Lcom/mediatek/settings/VoiceMailSetting;->access$800(Lcom/mediatek/settings/VoiceMailSetting;)I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 1970
    const-string v2, "Settings/VoiceMailSetting"

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

    .line 1971
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;->this$0:Lcom/mediatek/settings/VoiceMailSetting;

    invoke-virtual {v2}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    goto :goto_0
.end method
