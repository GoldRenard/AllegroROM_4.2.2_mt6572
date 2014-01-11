.class final Lcom/cyanogenmod/trebuchet/LauncherModel$5;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

.field final synthetic val$uriToDelete:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/ItemInfo;Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 687
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$cr:Landroid/content/ContentResolver;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$uriToDelete:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 689
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DbDebug    Delete item ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") from db, id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 692
    .local v3, transaction:Ljava/lang/String;
    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 693
    const-string v4, "Trebuchet.LauncherModel"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$cr:Landroid/content/ContentResolver;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$uriToDelete:Landroid/net/Uri;

    invoke-virtual {v4, v5, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 698
    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v5

    .line 699
    :try_start_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v4, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    packed-switch v4, :pswitch_data_0

    .line 723
    :goto_0
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    monitor-exit v5

    .line 726
    return-void

    .line 701
    :pswitch_0
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

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

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 703
    .local v1, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-wide v6, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v8, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    cmp-long v4, v6, v8

    if-nez v4, :cond_0

    .line 706
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deleting a folder ("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

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

    .line 708
    .local v2, msg:Ljava/lang/String;
    const-string v4, "Trebuchet.LauncherModel"

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 709
    invoke-static {}, Lcom/cyanogenmod/trebuchet/Launcher;->dumpDebugLogsToConsole()V

    goto :goto_1

    .line 725
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v2           #msg:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 712
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 717
    .end local v0           #i$:Ljava/util/Iterator;
    :pswitch_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 720
    :pswitch_2
    sget-object v6, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$5;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    check-cast v4, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 699
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
