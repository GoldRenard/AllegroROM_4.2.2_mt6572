.class Lcom/android/launcher2/Workspace$12;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->removeItems(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$packageNames:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Landroid/content/Context;Ljava/util/HashSet;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3979
    iput-object p1, p0, Lcom/android/launcher2/Workspace$12;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$12;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/launcher2/Workspace$12;->val$packageNames:Ljava/util/HashSet;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 3982
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v8

    .line 3983
    .local v8, spKey:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/launcher2/Workspace$12;->val$context:Landroid/content/Context;

    invoke-virtual {v9, v8, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 3985
    .local v7, sp:Landroid/content/SharedPreferences;
    const-string v9, "apps.new.list"

    const/4 v10, 0x0

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v4

    .line 3989
    .local v4, newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v4, :cond_3

    .line 3990
    monitor-enter v4

    .line 3991
    :try_start_0
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 3992
    .local v3, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    if-eqz v9, :cond_2

    .line 3994
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    .line 3995
    .local v2, intent:Landroid/content/Intent;
    invoke-static {v2}, Lcom/android/launcher2/ItemInfo;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v5

    .line 3996
    .local v5, pn:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/launcher2/Workspace$12;->val$packageNames:Ljava/util/HashSet;

    invoke-virtual {v9, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 3997
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 4003
    :cond_1
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->getWorkspaceShortcutItemInfosWithIntent(Landroid/content/Intent;)Ljava/util/ArrayList;

    move-result-object v6

    .line 4005
    .local v6, shortcuts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 4006
    .local v1, info:Lcom/android/launcher2/ItemInfo;
    iget-object v9, p0, Lcom/android/launcher2/Workspace$12;->val$context:Landroid/content/Context;

    invoke-static {v9, v1}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 4008
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #info:Lcom/android/launcher2/ItemInfo;
    .end local v2           #intent:Landroid/content/Intent;
    .end local v5           #pn:Ljava/lang/String;
    .end local v6           #shortcuts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    :catch_0
    move-exception v9

    goto :goto_0

    .line 4010
    :cond_2
    :try_start_2
    monitor-exit v4

    .line 4012
    .end local v3           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    return-void

    .line 4010
    :catchall_0
    move-exception v9

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v9
.end method
