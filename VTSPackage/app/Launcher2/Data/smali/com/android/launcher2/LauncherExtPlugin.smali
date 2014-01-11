.class public Lcom/android/launcher2/LauncherExtPlugin;
.super Ljava/lang/Object;
.source "LauncherExtPlugin.java"


# static fields
.field private static sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;

.field private static sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 54
    sput-object v0, Lcom/android/launcher2/LauncherExtPlugin;->sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;

    .line 55
    sput-object v0, Lcom/android/launcher2/LauncherExtPlugin;->sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getAllAppsListExt(Landroid/content/Context;)Lcom/mediatek/launcher2/ext/IAllAppsListExt;
    .locals 4
    .parameter "context"

    .prologue
    .line 58
    const-class v2, Lcom/android/launcher2/LauncherExtPlugin;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 60
    :try_start_1
    const-class v1, Lcom/mediatek/launcher2/ext/IAllAppsListExt;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/launcher2/ext/IAllAppsListExt;

    sput-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 66
    :cond_0
    :goto_0
    :try_start_2
    sget-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v2

    return-object v1

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/launcher2/ext/AllAppsListExt;

    invoke-direct {v1}, Lcom/mediatek/launcher2/ext/AllAppsListExt;-><init>()V

    sput-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sAllAppsListExt:Lcom/mediatek/launcher2/ext/IAllAppsListExt;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 58
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized getSearchButtonExt(Landroid/content/Context;)Lcom/mediatek/launcher2/ext/ISearchButtonExt;
    .locals 4
    .parameter "context"

    .prologue
    .line 70
    const-class v2, Lcom/android/launcher2/LauncherExtPlugin;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 72
    :try_start_1
    const-class v1, Lcom/mediatek/launcher2/ext/ISearchButtonExt;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/launcher2/ext/ISearchButtonExt;

    sput-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 78
    :cond_0
    :goto_0
    :try_start_2
    sget-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v2

    return-object v1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/launcher2/ext/SearchButtonExt;

    invoke-direct {v1}, Lcom/mediatek/launcher2/ext/SearchButtonExt;-><init>()V

    sput-object v1, Lcom/android/launcher2/LauncherExtPlugin;->sSearchButtonExt:Lcom/mediatek/launcher2/ext/ISearchButtonExt;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 70
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
