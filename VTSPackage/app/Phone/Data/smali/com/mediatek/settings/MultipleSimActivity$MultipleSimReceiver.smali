.class Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MultipleSimActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/MultipleSimActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MultipleSimReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/MultipleSimActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 120
    iput-object p1, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/MultipleSimActivity;Lcom/mediatek/settings/MultipleSimActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x0

    .line 122
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, action:Ljava/lang/String;
    const-string v6, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 124
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    const/16 v7, 0x64

    invoke-virtual {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->removeDialog(I)V

    .line 125
    const-string v6, "simId"

    invoke-virtual {p2, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 126
    .local v5, slotId:I
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BroadcastReceiver  slotId = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 127
    const-string v6, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    const/4 v7, 0x1

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_2

    .line 128
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    const-string v7, "BroadcastReceiver: network mode change failed! restore the old value."

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 129
    const-string v6, "com.android.phone.OLD_NETWORK_MODE"

    invoke-virtual {p2, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 130
    .local v2, oldMode:I
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$200(Lcom/mediatek/settings/MultipleSimActivity;)Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;
    invoke-static {v7, v5}, Lcom/mediatek/settings/MultipleSimActivity;->access$300(Lcom/mediatek/settings/MultipleSimActivity;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 132
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BroadcastReceiver, oldMode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 133
    const-string v6, "NETWORK_MODE"

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;
    invoke-static {v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$400(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 134
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    const-string v7, "setValue  to oldMode "

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 135
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    invoke-virtual {v6}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 136
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    invoke-virtual {v6}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    .line 137
    .local v3, p:Landroid/preference/Preference;
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$500(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_1

    .line 138
    check-cast v3, Landroid/preference/ListPreference;

    .end local v3           #p:Landroid/preference/Preference;
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 172
    .end local v1           #i:I
    .end local v2           #oldMode:I
    .end local v5           #slotId:I
    :cond_0
    :goto_1
    return-void

    .line 135
    .restart local v1       #i:I
    .restart local v2       #oldMode:I
    .restart local v3       #p:Landroid/preference/Preference;
    .restart local v5       #slotId:I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    .end local v1           #i:I
    .end local v2           #oldMode:I
    .end local v3           #p:Landroid/preference/Preference;
    :cond_2
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    const-string v7, "BroadcastReceiver: network mode change success! set to the new value."

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 147
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BroadcastReceiver  = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "NEW_NETWORK_MODE"

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    goto :goto_1

    .line 149
    .end local v5           #slotId:I
    :cond_3
    const-string v6, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    const-string v6, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 151
    :cond_4
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceEnableState()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$600(Lcom/mediatek/settings/MultipleSimActivity;)V

    goto :goto_1

    .line 152
    :cond_5
    const-string v6, "android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 153
    const-string v6, "NETWORK_SEARCH"

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;
    invoke-static {v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$400(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 154
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$900(Lcom/mediatek/settings/MultipleSimActivity;)Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v7}, Lcom/mediatek/settings/MultipleSimActivity;->access$200(Lcom/mediatek/settings/MultipleSimActivity;)Lcom/android/internal/telephony/Phone;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;
    invoke-static {v8}, Lcom/mediatek/settings/MultipleSimActivity;->access$700(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/util/List;

    move-result-object v8

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;
    invoke-static {v9}, Lcom/mediatek/settings/MultipleSimActivity;->access$800(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v7, v8, v9}, Lcom/mediatek/phone/ext/SettingsExtension;->removeNMOpForMultiSim(Lcom/android/internal/telephony/Phone;Ljava/util/List;Ljava/lang/String;)V

    .line 155
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #getter for: Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$700(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;

    invoke-direct {v7}, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;-><init>()V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 156
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->createSubItems()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$1000(Lcom/mediatek/settings/MultipleSimActivity;)V

    goto/16 :goto_1

    .line 158
    :cond_6
    const-string v6, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 159
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceList()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$1100(Lcom/mediatek/settings/MultipleSimActivity;)V

    goto/16 :goto_1

    .line 160
    :cond_7
    const-string v6, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 162
    const-string v6, "MultipleSimActivity"

    const-string v7, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->setSimList()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$1200(Lcom/mediatek/settings/MultipleSimActivity;)V

    .line 164
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    invoke-virtual {v6}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    .line 165
    .local v4, prefSet:Landroid/preference/PreferenceScreen;
    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 166
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    const v7, 0x7f060015

    invoke-virtual {v6, v7}, Lcom/mediatek/settings/MultipleSimActivity;->addPreferencesFromResource(I)V

    .line 167
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->createSubItems()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$1000(Lcom/mediatek/settings/MultipleSimActivity;)V

    .line 168
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceList()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$1100(Lcom/mediatek/settings/MultipleSimActivity;)V

    .line 169
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceEnableState()V
    invoke-static {v6}, Lcom/mediatek/settings/MultipleSimActivity;->access$600(Lcom/mediatek/settings/MultipleSimActivity;)V

    goto/16 :goto_1
.end method
