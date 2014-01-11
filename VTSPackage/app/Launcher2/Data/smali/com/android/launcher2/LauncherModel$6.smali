.class final Lcom/android/launcher2/LauncherModel$6;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel;->deleteFolderContentsFromDatabase(Landroid/content/Context;Lcom/android/launcher2/FolderInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$info:Lcom/android/launcher2/FolderInfo;


# direct methods
.method constructor <init>(Landroid/content/ContentResolver;Lcom/android/launcher2/FolderInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 788
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$6;->val$cr:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 790
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$6;->val$cr:Landroid/content/ContentResolver;

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-wide v3, v3, Lcom/android/launcher2/ItemInfo;->id:J

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/android/launcher2/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 792
    sget-object v3, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v3

    .line 793
    :try_start_0
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 798
    const-string v2, "Launcher.Model"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deleteFolderContentsFromDatabase sBgItemsIdMap.remove = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-wide v5, v5, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 802
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$6;->val$cr:Landroid/content/ContentResolver;

    sget-object v3, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI_NO_NOTIFICATION:Landroid/net/Uri;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "container="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-wide v5, v5, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 805
    sget-object v3, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v3

    .line 806
    :try_start_1
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$6;->val$info:Lcom/android/launcher2/FolderInfo;

    iget-object v2, v2, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 807
    .local v0, childInfo:Lcom/android/launcher2/ItemInfo;
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-wide v4, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 810
    const-string v2, "Launcher.Model"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deleteFolderContentsFromDatabase sItemsIdMap.remove = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 813
    .end local v0           #childInfo:Lcom/android/launcher2/ItemInfo;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 800
    :catchall_1
    move-exception v2

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v2

    .line 813
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 814
    return-void
.end method
