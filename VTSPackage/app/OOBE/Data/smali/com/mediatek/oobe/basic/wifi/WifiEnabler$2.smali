.class Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;
.super Ljava/lang/Object;
.source "WifiEnabler.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/wifi/WifiEnabler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 136
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "wifi_switch"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 137
    const-string v4, "OOBE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "wifi enabler switch change:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 141
    .local v0, isChecked:Z
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mStateMachineEvent:Z
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$300(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 142
    const-string v4, "OOBE"

    const-string v5, "OOBE wifi mStateMachineEvent: is true ,return"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #setter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mStateMachineEvent:Z
    invoke-static {v4, v3}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$302(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;Z)Z

    .line 175
    .end local v0           #isChecked:Z
    :goto_0
    return v2

    .line 147
    .restart local v0       #isChecked:Z
    :cond_0
    if-eqz v0, :cond_1

    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$400(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/content/Context;

    move-result-object v4

    const-string v5, "wifi"

    invoke-static {v4, v5}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->isRadioAllowed(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 148
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$400(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0900a5

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 150
    const-string v3, "OOBE"

    const-string v4, "OOBE wifi isRadioAllowed:"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 156
    :cond_1
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$500(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/net/wifi/WifiManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v1

    .line 157
    .local v1, wifiApState:I
    if-eqz v0, :cond_3

    const/16 v4, 0xc

    if-eq v1, v4, :cond_2

    const/16 v4, 0xd

    if-ne v1, v4, :cond_3

    .line 160
    :cond_2
    const-string v4, "OOBE"

    const-string v5, "OOBE wifi getWifiApState:"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$500(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/net/wifi/WifiManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v3}, Landroid/net/wifi/WifiManager;->setWifiApEnabled(Landroid/net/wifi/WifiConfiguration;Z)Z

    .line 165
    :cond_3
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$500(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/net/wifi/WifiManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 167
    const-string v4, "OOBE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "OOBE wifi setWifiEnabled:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$600(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/preference/SwitchPreference;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    goto :goto_0

    .line 171
    :cond_4
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->access$400(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0900a2

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .end local v0           #isChecked:Z
    .end local v1           #wifiApState:I
    .restart local p2
    :cond_5
    move v2, v3

    .line 175
    goto/16 :goto_0
.end method
