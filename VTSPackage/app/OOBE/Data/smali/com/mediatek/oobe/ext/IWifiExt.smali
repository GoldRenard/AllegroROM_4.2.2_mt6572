.class public interface abstract Lcom/mediatek/oobe/ext/IWifiExt;
.super Ljava/lang/Object;
.source "IWifiExt.java"


# virtual methods
.method public abstract getApOrder(Ljava/lang/String;ILjava/lang/String;I)I
.end method

.method public abstract getSecurityText(I)Ljava/lang/String;
.end method

.method public abstract getSwitchState()Z
.end method

.method public abstract initSwitchState(Landroid/preference/SwitchPreference;)V
.end method

.method public abstract registerAirplaneModeObserver(Landroid/preference/SwitchPreference;)V
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
