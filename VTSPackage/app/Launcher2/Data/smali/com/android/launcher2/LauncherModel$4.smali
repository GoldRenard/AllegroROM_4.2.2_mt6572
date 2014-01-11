.class final Lcom/android/launcher2/LauncherModel$4;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cellX:I

.field final synthetic val$cellY:I

.field final synthetic val$container:J

.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$item:Lcom/android/launcher2/ItemInfo;

.field final synthetic val$notify:Z

.field final synthetic val$screen:I

.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lcom/android/launcher2/ItemInfo;JIIILandroid/content/ContentResolver;ZLandroid/content/ContentValues;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 643
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iput-wide p2, p0, Lcom/android/launcher2/LauncherModel$4;->val$container:J

    iput p4, p0, Lcom/android/launcher2/LauncherModel$4;->val$screen:I

    iput p5, p0, Lcom/android/launcher2/LauncherModel$4;->val$cellX:I

    iput p6, p0, Lcom/android/launcher2/LauncherModel$4;->val$cellY:I

    iput-object p7, p0, Lcom/android/launcher2/LauncherModel$4;->val$cr:Landroid/content/ContentResolver;

    iput-boolean p8, p0, Lcom/android/launcher2/LauncherModel$4;->val$notify:Z

    iput-object p9, p0, Lcom/android/launcher2/LauncherModel$4;->val$values:Landroid/content/ContentValues;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 645
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DbDebug    Add item ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-object v3, v3, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") to db, id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v3, v3, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$container:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$screen:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$cellX:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$cellY:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 648
    .local v1, transaction:Ljava/lang/String;
    sget-object v2, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    const-string v2, "Launcher.Model"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$4;->val$cr:Landroid/content/ContentResolver;

    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$notify:Z

    if-eqz v2, :cond_1

    sget-object v2, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    :goto_0
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$4;->val$values:Landroid/content/ContentValues;

    invoke-virtual {v3, v2, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 655
    sget-object v3, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v3

    .line 656
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->id:J

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    const/4 v6, 0x0

    invoke-static {v4, v5, v2, v6}, Lcom/android/launcher2/LauncherModel;->checkItemInfoLocked(JLcom/android/launcher2/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 657
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    const-string v2, "Launcher.Model"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addItemToDatabase sBgItemsIdMap.put = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v5, v5, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", item = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget v2, v2, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v2, :pswitch_data_0

    .line 687
    :cond_0
    :goto_1
    :pswitch_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 688
    return-void

    .line 651
    :cond_1
    sget-object v2, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI_NO_NOTIFICATION:Landroid/net/Uri;

    goto :goto_0

    .line 663
    :pswitch_1
    :try_start_1
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    check-cast v2, Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v4, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    :pswitch_2
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v6, -0x64

    cmp-long v2, v4, v6

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v6, -0x65

    cmp-long v2, v4, v6

    if-nez v2, :cond_3

    .line 669
    :cond_2
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 687
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 671
    :cond_3
    :try_start_2
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 673
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "adding item: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " to a folder that "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " doesn\'t exist"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 675
    .local v0, msg:Ljava/lang/String;
    const-string v2, "Launcher.Model"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    invoke-static {}, Lcom/android/launcher2/Launcher;->dumpDebugLogsToConsole()V

    goto :goto_1

    .line 681
    .end local v0           #msg:Ljava/lang/String;
    :pswitch_3
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    check-cast v2, Lcom/android/launcher2/LauncherAppWidgetInfo;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    const-string v2, "Launcher.Model"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addItemToDatabase sAppWidgets.add = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$4;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_1

    .line 661
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
