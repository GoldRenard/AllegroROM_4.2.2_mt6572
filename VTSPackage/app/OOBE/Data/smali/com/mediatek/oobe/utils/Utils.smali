.class public Lcom/mediatek/oobe/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final COLORNUM:I = 0x7

.field private static final TAG:Ljava/lang/String; = "OOBE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSimManagmentExtPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/ISimManagementExt;
    .locals 4
    .parameter "context"

    .prologue
    .line 169
    :try_start_0
    const-class v2, Lcom/mediatek/oobe/ext/ISimManagementExt;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v2, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/oobe/ext/ISimManagementExt;
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    .local v1, ext:Lcom/mediatek/oobe/ext/ISimManagementExt;
    :goto_0
    return-object v1

    .line 171
    .end local v1           #ext:Lcom/mediatek/oobe/ext/ISimManagementExt;
    :catch_0
    move-exception v0

    .line 172
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    const-string v2, "OOBE"

    const-string v3, "Enter the default ISimManagementExt"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    new-instance v1, Lcom/mediatek/oobe/ext/DefaultSimManagementExt;

    invoke-direct {v1}, Lcom/mediatek/oobe/ext/DefaultSimManagementExt;-><init>()V

    .restart local v1       #ext:Lcom/mediatek/oobe/ext/ISimManagementExt;
    goto :goto_0
.end method

.method public static getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;
    .locals 5
    .parameter "context"

    .prologue
    .line 134
    :try_start_0
    const-class v2, Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v2, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/oobe/ext/IWifiExt;

    .line 136
    .local v1, ext:Lcom/mediatek/oobe/ext/IWifiExt;
    const-string v2, "OOBE"

    const-string v3, "IWifiExt plugin object created"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_0
    return-object v1

    .line 137
    .end local v1           #ext:Lcom/mediatek/oobe/ext/IWifiExt;
    :catch_0
    move-exception v0

    .line 138
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    new-instance v1, Lcom/mediatek/oobe/ext/DefaultWifiExt;

    invoke-direct {v1, p0}, Lcom/mediatek/oobe/ext/DefaultWifiExt;-><init>(Landroid/content/Context;)V

    .line 139
    .restart local v1       #ext:Lcom/mediatek/oobe/ext/IWifiExt;
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DefaultWifiExt plugin object created, e = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getWifiSettingsPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiSettingsExt;
    .locals 5
    .parameter "context"

    .prologue
    .line 151
    :try_start_0
    const-class v2, Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v2, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    .line 153
    .local v1, ext:Lcom/mediatek/oobe/ext/IWifiSettingsExt;
    const-string v2, "OOBE"

    const-string v3, "IWifiSettingsExt Plugin object created"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :goto_0
    return-object v1

    .line 154
    .end local v1           #ext:Lcom/mediatek/oobe/ext/IWifiSettingsExt;
    :catch_0
    move-exception v0

    .line 155
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    new-instance v1, Lcom/mediatek/oobe/ext/DefaultWifiSettingsExt;

    invoke-direct {v1, p0}, Lcom/mediatek/oobe/ext/DefaultWifiSettingsExt;-><init>(Landroid/content/Context;)V

    .line 156
    .restart local v1       #ext:Lcom/mediatek/oobe/ext/IWifiSettingsExt;
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DefaultWifiSettingsExt Plugin object created, e = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static isGemini()Z
    .locals 5

    .prologue
    const/16 v4, 0xc

    .line 109
    const-string v1, "persist.radio.default_sim_mode"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 110
    .local v0, networkMode:I
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " isGemini() networkMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    if-ne v0, v4, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isWifiOnly(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 122
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 123
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method
