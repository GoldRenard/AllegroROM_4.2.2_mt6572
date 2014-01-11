.class public Lcom/mediatek/settings/ext/DefaultWifiSettingsExt;
.super Ljava/lang/Object;
.source "DefaultWifiSettingsExt.java"

# interfaces
.implements Lcom/mediatek/settings/ext/IWifiSettingsExt;


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultWifiSettingsExt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adjustPriority()V
    .locals 0

    .prologue
    .line 53
    return-void
.end method

.method public disconnect(I)V
    .locals 0
    .parameter "networkId"

    .prologue
    .line 61
    return-void
.end method

.method public emptyCategory(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 39
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 40
    return-void
.end method

.method public emptyScreen(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 42
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 43
    return-void
.end method

.method public getAccessPointsCount(Landroid/preference/PreferenceScreen;)I
    .locals 1
    .parameter "screen"

    .prologue
    .line 50
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v0

    return v0
.end method

.method public isCatogoryExist()Z
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public isTustAP(Ljava/lang/String;I)Z
    .locals 1
    .parameter "ssid"
    .parameter "security"

    .prologue
    .line 45
    const/4 v0, 0x0

    return v0
.end method

.method public recordPriority(I)V
    .locals 0
    .parameter "selectPriority"

    .prologue
    .line 55
    return-void
.end method

.method public refreshCategory(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 48
    return-void
.end method

.method public registerPriorityObserver(Landroid/content/ContentResolver;Landroid/content/Context;)V
    .locals 0
    .parameter "contentResolver"
    .parameter "context"

    .prologue
    .line 20
    return-void
.end method

.method public setCategory(Landroid/preference/PreferenceCategory;Landroid/preference/PreferenceCategory;Landroid/preference/PreferenceCategory;)V
    .locals 0
    .parameter "trustPref"
    .parameter "configedPref"
    .parameter "newPref"

    .prologue
    .line 37
    return-void
.end method

.method public setLastConnectedConfig(Landroid/net/wifi/WifiConfiguration;)V
    .locals 0
    .parameter "config"

    .prologue
    .line 24
    return-void
.end method

.method public setLastPriority(I)V
    .locals 0
    .parameter "priority"

    .prologue
    .line 26
    return-void
.end method

.method public setNewPriority(Landroid/net/wifi/WifiConfiguration;)V
    .locals 0
    .parameter "config"

    .prologue
    .line 57
    return-void
.end method

.method public shouldAddDisconnectMenu()Z
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    return v0
.end method

.method public shouldAddForgetMenu(Ljava/lang/String;I)Z
    .locals 2
    .parameter "ssid"
    .parameter "security"

    .prologue
    .line 16
    const-string v0, "DefaultWifiSettingsExt"

    const-string v1, "WifiSettingsExt, shouldAddMenuForget(),return true"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    const/4 v0, 0x1

    return v0
.end method

.method public unregisterPriorityObserver(Landroid/content/ContentResolver;)V
    .locals 0
    .parameter "contentResolver"

    .prologue
    .line 22
    return-void
.end method

.method public updatePriority()V
    .locals 0

    .prologue
    .line 28
    return-void
.end method

.method public updatePriorityAfterConnect(I)V
    .locals 0
    .parameter "networkId"

    .prologue
    .line 63
    return-void
.end method

.method public updatePriorityAfterSubmit(Landroid/net/wifi/WifiConfiguration;)V
    .locals 0
    .parameter "config"

    .prologue
    .line 59
    return-void
.end method
