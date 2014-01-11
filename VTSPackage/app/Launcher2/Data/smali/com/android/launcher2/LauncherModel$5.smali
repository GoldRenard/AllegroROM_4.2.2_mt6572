.class final Lcom/android/launcher2/LauncherModel$5;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$item:Lcom/android/launcher2/ItemInfo;

.field final synthetic val$uriToDelete:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/android/launcher2/ItemInfo;Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 731
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$5;->val$cr:Landroid/content/ContentResolver;

    iput-object p3, p0, Lcom/android/launcher2/LauncherModel$5;->val$uriToDelete:Landroid/net/Uri;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 733
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DbDebug    Delete item ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-object v5, v5, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") from db, id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v5, v5, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v5, v5, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 736
    .local v3, transaction:Ljava/lang/String;
    sget-object v4, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 737
    const-string v4, "Launcher.Model"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$5;->val$cr:Landroid/content/ContentResolver;

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$5;->val$uriToDelete:Landroid/net/Uri;

    invoke-virtual {v4, v5, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 742
    sget-object v5, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v5

    .line 743
    :try_start_0
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v4, v4, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v4, :pswitch_data_0

    .line 766
    :goto_0
    :pswitch_0
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v6, v6, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 767
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 768
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 770
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleteItemFromDatabase sAppWidgets.remove = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", sItemsIdMap.remove = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v6, v6, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    return-void

    .line 745
    :pswitch_1
    :try_start_1
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v6, v6, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 747
    .local v1, info:Lcom/android/launcher2/ItemInfo;
    iget-wide v6, v1, Lcom/android/launcher2/ItemInfo;->container:J

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v8, v4, Lcom/android/launcher2/ItemInfo;->id:J

    cmp-long v4, v6, v8

    if-nez v4, :cond_0

    .line 750
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleting a folder ("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ") which still "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "contains items ("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ")"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 752
    .local v2, msg:Ljava/lang/String;
    const-string v4, "Launcher.Model"

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    invoke-static {}, Lcom/android/launcher2/Launcher;->dumpDebugLogsToConsole()V

    goto :goto_1

    .line 768
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #info:Lcom/android/launcher2/ItemInfo;
    .end local v2           #msg:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 756
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_2
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 760
    .end local v0           #i$:Ljava/util/Iterator;
    :pswitch_2
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 763
    :pswitch_3
    sget-object v6, Lcom/android/launcher2/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$5;->val$item:Lcom/android/launcher2/ItemInfo;

    check-cast v4, Lcom/android/launcher2/LauncherAppWidgetInfo;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 743
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
