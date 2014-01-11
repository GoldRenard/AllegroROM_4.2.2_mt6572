.class public interface abstract Lcom/mediatek/settings/ext/IWifiExt;
.super Ljava/lang/Object;
.source "IWifiExt.java"


# virtual methods
.method public abstract closeSpinnerDialog()V
.end method

.method public abstract getApOrder(Ljava/lang/String;ILjava/lang/String;I)I
.end method

.method public abstract getPriority()I
.end method

.method public abstract getPriorityView()Landroid/view/View;
.end method

.method public abstract getSecurityText(I)Ljava/lang/String;
.end method

.method public abstract getSleepPolicy(Landroid/content/ContentResolver;)I
.end method

.method public abstract getSwitchState()Z
.end method

.method public abstract getWifiApSsid()Ljava/lang/String;
.end method

.method public abstract initConnectView(Landroid/app/Activity;Landroid/preference/PreferenceScreen;)V
.end method

.method public abstract initNetworkInfoView(Landroid/preference/PreferenceScreen;)V
.end method

.method public abstract initPreference(Landroid/content/ContentResolver;)V
.end method

.method public abstract initSwitchState(Landroid/widget/Switch;)V
.end method

.method public abstract refreshNetworkInfoView()V
.end method

.method public abstract registerAirplaneModeObserver(Landroid/widget/Switch;)V
.end method

.method public abstract setAPNetworkId(I)V
.end method

.method public abstract setAPPriority(I)V
.end method

.method public abstract setProxyText(Landroid/widget/TextView;)V
.end method

.method public abstract setSecurityText(Landroid/widget/TextView;)V
.end method

.method public abstract shouldAddForgetButton(Ljava/lang/String;I)Z
.end method

.method public abstract shouldSetDisconnectButton()Z
.end method

.method public abstract unRegisterAirplaneObserver()V
.end method
