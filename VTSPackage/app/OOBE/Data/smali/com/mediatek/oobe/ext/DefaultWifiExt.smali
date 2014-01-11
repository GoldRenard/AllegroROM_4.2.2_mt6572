.class public Lcom/mediatek/oobe/ext/DefaultWifiExt;
.super Ljava/lang/Object;
.source "DefaultWifiExt.java"

# interfaces
.implements Lcom/mediatek/oobe/ext/IWifiExt;


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultWifiExt"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 18
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/mediatek/oobe/ext/DefaultWifiExt;->mContext:Landroid/content/Context;

    .line 20
    const-string v0, "DefaultWifiExt"

    const-string v1, "DefaultWifiExt"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    return-void
.end method


# virtual methods
.method public getApOrder(Ljava/lang/String;ILjava/lang/String;I)I
    .locals 2
    .parameter "currentSsid"
    .parameter "currentSecurity"
    .parameter "otherSsid"
    .parameter "otherSecurity"

    .prologue
    .line 54
    const-string v0, "DefaultWifiExt"

    const-string v1, "getApOrder(),return 0"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    const/4 v0, 0x0

    return v0
.end method

.method public getSecurityText(I)Ljava/lang/String;
    .locals 1
    .parameter "security"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mediatek/oobe/ext/DefaultWifiExt;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSwitchState()Z
    .locals 2

    .prologue
    .line 28
    const-string v0, "DefaultWifiExt"

    const-string v1, "getSwitchState(), return true"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    const/4 v0, 0x1

    return v0
.end method

.method public initSwitchState(Landroid/preference/SwitchPreference;)V
    .locals 0
    .parameter "tempSwitch"

    .prologue
    .line 32
    return-void
.end method

.method public registerAirplaneModeObserver(Landroid/preference/SwitchPreference;)V
    .locals 0
    .parameter "tempSwitch"

    .prologue
    .line 24
    return-void
.end method

.method public setProxyText(Landroid/widget/TextView;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 50
    return-void
.end method

.method public setSecurityText(Landroid/widget/TextView;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 40
    return-void
.end method

.method public shouldAddForgetButton(Ljava/lang/String;I)Z
    .locals 1
    .parameter "ssid"
    .parameter "security"

    .prologue
    .line 36
    const/4 v0, 0x1

    return v0
.end method

.method public shouldSetDisconnectButton()Z
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public unRegisterAirplaneObserver()V
    .locals 0

    .prologue
    .line 26
    return-void
.end method
