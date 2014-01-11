.class public Lcom/mediatek/FMRadio/ExtensionUtils;
.super Ljava/lang/Object;
.source "ExtensionUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getExtension(Landroid/content/Context;)Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    .locals 8
    .parameter "context"

    .prologue
    const/4 v7, 0x0

    .line 51
    const-class v5, Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Landroid/content/pm/Signature;

    invoke-static {p0, v5, v6}, Lcom/mediatek/pluginmanager/PluginManager;->create(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Lcom/mediatek/pluginmanager/PluginManager;

    move-result-object v4

    .line 52
    .local v4, pm:Lcom/mediatek/pluginmanager/PluginManager;,"Lcom/mediatek/pluginmanager/PluginManager<Lcom/mediatek/FMRadio/ext/IProjectStringExt;>;"
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/mediatek/pluginmanager/PluginManager;->getPluginCount()I

    move-result v5

    if-eqz v5, :cond_1

    .line 53
    invoke-virtual {v4, v7}, Lcom/mediatek/pluginmanager/PluginManager;->getPlugin(I)Lcom/mediatek/pluginmanager/Plugin;

    move-result-object v3

    .line 54
    .local v3, plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/FMRadio/ext/IProjectStringExt;>;"
    if-eqz v3, :cond_0

    .line 56
    :try_start_0
    invoke-virtual {v3}, Lcom/mediatek/pluginmanager/Plugin;->createObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :try_end_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_0 .. :try_end_0} :catch_0

    .local v1, ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :goto_0
    move-object v2, v1

    .line 67
    .end local v1           #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    .end local v3           #plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/FMRadio/ext/IProjectStringExt;>;"
    .local v2, ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :goto_1
    return-object v2

    .line 57
    .end local v2           #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    .restart local v3       #plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/FMRadio/ext/IProjectStringExt;>;"
    :catch_0
    move-exception v0

    .line 58
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    new-instance v1, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;

    invoke-direct {v1}, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;-><init>()V

    .restart local v1       #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    goto :goto_0

    .line 62
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    .end local v1           #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :cond_0
    new-instance v1, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;

    invoke-direct {v1}, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;-><init>()V

    .end local v3           #plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/FMRadio/ext/IProjectStringExt;>;"
    .restart local v1       #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :goto_2
    move-object v2, v1

    .line 67
    .end local v1           #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    .restart local v2       #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    goto :goto_1

    .line 65
    .end local v2           #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    :cond_1
    new-instance v1, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;

    invoke-direct {v1}, Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;-><init>()V

    .restart local v1       #ext:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    goto :goto_2
.end method
