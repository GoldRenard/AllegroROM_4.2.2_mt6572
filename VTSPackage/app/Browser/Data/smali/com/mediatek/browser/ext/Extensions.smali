.class public Lcom/mediatek/browser/ext/Extensions;
.super Ljava/lang/Object;
.source "Extensions.java"


# static fields
.field private static volatile sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

.field private static volatile sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

.field private static volatile sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private static volatile sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 10
    sput-object v0, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    .line 11
    sput-object v0, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    .line 12
    sput-object v0, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDownloadPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserDownloadEx;
    .locals 4
    .parameter "context"

    .prologue
    .line 32
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    if-nez v1, :cond_1

    .line 33
    const-class v2, Lcom/mediatek/browser/ext/Extensions;

    monitor-enter v2

    .line 34
    :try_start_0
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 36
    :try_start_1
    const-class v1, Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 42
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    :cond_1
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    return-object v1

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/browser/ext/BrowserDownloadEx;

    invoke-direct {v1}, Lcom/mediatek/browser/ext/BrowserDownloadEx;-><init>()V

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sDownloadPlugin:Lcom/mediatek/browser/ext/IBrowserDownloadEx;

    goto :goto_0

    .line 42
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static getProcessNetworkPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;
    .locals 4
    .parameter "context"

    .prologue
    .line 48
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    if-nez v1, :cond_1

    .line 49
    const-class v2, Lcom/mediatek/browser/ext/Extensions;

    monitor-enter v2

    .line 50
    :try_start_0
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 52
    :try_start_1
    const-class v1, Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    :cond_1
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    return-object v1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/browser/ext/BrowserProcessNetworkEx;

    invoke-direct {v1}, Lcom/mediatek/browser/ext/BrowserProcessNetworkEx;-><init>()V

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sProcessNetworkPlugin:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    goto :goto_0

    .line 58
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    .locals 4
    .parameter "context"

    .prologue
    .line 16
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    if-nez v1, :cond_1

    .line 17
    const-class v2, Lcom/mediatek/browser/ext/Extensions;

    monitor-enter v2

    .line 18
    :try_start_0
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 20
    :try_start_1
    const-class v1, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 26
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 28
    :cond_1
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-object v1

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/browser/ext/BrowserSmallFeatureEx;

    invoke-direct {v1, p0}, Lcom/mediatek/browser/ext/BrowserSmallFeatureEx;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmallFeaturePlugin:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    goto :goto_0

    .line 26
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static getSmsHandlerPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;
    .locals 4
    .parameter "context"

    .prologue
    .line 64
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    if-nez v1, :cond_1

    .line 65
    const-class v2, Lcom/mediatek/browser/ext/Extensions;

    monitor-enter v2

    .line 66
    :try_start_0
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 68
    :try_start_1
    const-class v1, Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 74
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    :cond_1
    sget-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    return-object v1

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/browser/ext/BrowserSmsHandlerEx;

    invoke-direct {v1}, Lcom/mediatek/browser/ext/BrowserSmsHandlerEx;-><init>()V

    sput-object v1, Lcom/mediatek/browser/ext/Extensions;->sSmsHandlerPlugin:Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;

    goto :goto_0

    .line 74
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method
