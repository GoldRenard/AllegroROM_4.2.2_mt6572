.class public Lcom/mediatek/oobe/ext/DefaultWifiSettingsExt;
.super Ljava/lang/Object;
.source "DefaultWifiSettingsExt.java"

# interfaces
.implements Lcom/mediatek/oobe/ext/IWifiSettingsExt;


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultWifiSettingsExt"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 13
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, "DefaultWifiSettingsExt"

    const-string v1, "DefaultWifiSettingsExt"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    return-void
.end method


# virtual methods
.method public emptyCategory(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 32
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 33
    return-void
.end method

.method public emptyScreen(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 35
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 36
    return-void
.end method

.method public getAccessPointsCount(Landroid/preference/PreferenceScreen;)I
    .locals 1
    .parameter "screen"

    .prologue
    .line 43
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v0

    return v0
.end method

.method public isCatogoryExist()Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    return v0
.end method

.method public isTustAP(Ljava/lang/String;I)Z
    .locals 1
    .parameter "ssid"
    .parameter "security"

    .prologue
    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public refreshCategory(Landroid/preference/PreferenceScreen;)V
    .locals 0
    .parameter "screen"

    .prologue
    .line 41
    return-void
.end method

.method public setCategory(Landroid/preference/PreferenceCategory;Landroid/preference/PreferenceCategory;Landroid/preference/PreferenceCategory;)V
    .locals 0
    .parameter "trustPref"
    .parameter "configedPref"
    .parameter "newPref"

    .prologue
    .line 30
    return-void
.end method

.method public shouldAddDisconnectMenu()Z
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method public shouldAddForgetMenu(Ljava/lang/String;I)Z
    .locals 2
    .parameter "ssid"
    .parameter "security"

    .prologue
    .line 18
    const-string v0, "DefaultWifiSettingsExt"

    const-string v1, "WifiSettingsExt, shouldAddMenuForget(),return true"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    const/4 v0, 0x1

    return v0
.end method
