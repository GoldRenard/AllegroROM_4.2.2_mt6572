.class public Lcom/mediatek/systemui/ext/PluginFactory;
.super Ljava/lang/Object;
.source "PluginFactory.java"


# static fields
.field private static mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    .locals 6
    .parameter "context"

    .prologue
    .line 16
    const-class v2, Lcom/mediatek/systemui/ext/PluginFactory;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 18
    :try_start_1
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
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 24
    :cond_0
    :goto_0
    :try_start_2
    sget-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v2

    return-object v1

    .line 20
    :catch_0
    move-exception v0

    .line 21
    .local v0, e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :try_start_3
    new-instance v1, Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;

    invoke-direct {v1, p0}, Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/mediatek/systemui/ext/PluginFactory;->mStatusBarPlugin:Lcom/mediatek/systemui/ext/IStatusBarPlugin;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 16
    .end local v0           #e:Lcom/mediatek/pluginmanager/Plugin$ObjectCreationException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
