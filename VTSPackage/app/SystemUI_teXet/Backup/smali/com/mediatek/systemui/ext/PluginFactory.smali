.class public Lcom/mediatek/systemui/ext/PluginFactory;
.super Ljava/lang/Object;
.source "PluginFactory.java"


# static fields
.field private static isDefaultStatusBarPlugin:Z

.field private static mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    .line 14
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/systemui/ext/PluginFactory;->isDefaultStatusBarPlugin:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    .registers 7
    .parameter "context"

    .prologue
    .line 17
    const-class v2, Lcom/mediatek/systemui/ext/PluginFactory;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2f

    if-nez v1, :cond_1f

    .line 19
    :try_start_7
    const-class v1, Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "1.0.0"

    const-string v4, "class"

    const/4 v5, 0x0

    new-array v5, v5, [Landroid/content/pm/Signature;

    invoke-static {p0, v1, v3, v4, v5}, Lcom/mediatek/pluginmanager/PluginManager;->createPluginObject(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Landroid/content/pm/Signature;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    sput-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    .line 21
    const/4 v1, 0x0

    sput-boolean v1, Lcom/mediatek/systemui/ext/PluginFactory;->isDefaultStatusBarPlugin:Z
    :try_end_1f
    .catchall {:try_start_7 .. :try_end_1f} :catchall_2f
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_7 .. :try_end_1f} :catch_23

    .line 27
    :cond_1f
    :goto_1f
    :try_start_1f
    sget-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    :try_end_21
    .catchall {:try_start_1f .. :try_end_21} :catchall_2f

    monitor-exit v2

    return-object v1

    .line 22
    :catch_23
    move-exception v0

    .line 23
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_24
    new-instance v1, Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;

    invoke-direct {v1, p0}, Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    .line 24
    const/4 v1, 0x1

    sput-boolean v1, Lcom/mediatek/systemui/ext/PluginFactory;->isDefaultStatusBarPlugin:Z
    :try_end_2e
    .catchall {:try_start_24 .. :try_end_2e} :catchall_2f

    goto :goto_1f

    .line 17
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_2f
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized isDefaultStatusBarPlugin()Z
    .registers 2

    .prologue
    .line 31
    const-class v0, Lcom/mediatek/systemui/ext/PluginFactory;

    monitor-enter v0

    :try_start_3
    sget-boolean v1, Lcom/mediatek/systemui/ext/PluginFactory;->isDefaultStatusBarPlugin:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method
