.class final Lcom/cyanogenmod/trebuchet/LauncherModel$4;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$container:J

.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

.field final synthetic val$notify:Z

.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/ItemInfo;JLandroid/content/ContentResolver;ZLandroid/content/ContentValues;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 596
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-wide p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$container:J

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$cr:Landroid/content/ContentResolver;

    iput-boolean p5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$notify:Z

    iput-object p6, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$values:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 598
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DbDebug    Add item ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") to db, id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$container:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 601
    .local v1, transaction:Ljava/lang/String;
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    const-string v2, "Trebuchet.LauncherModel"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$cr:Landroid/content/ContentResolver;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$notify:Z

    if-eqz v2, :cond_1

    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    :goto_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$values:Landroid/content/ContentValues;

    invoke-virtual {v3, v2, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 608
    sget-object v3, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v3

    .line 609
    :try_start_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v4, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v6, 0x0

    invoke-static {v4, v5, v2, v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->checkItemInfoLocked(JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 610
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v4, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    packed-switch v2, :pswitch_data_0

    .line 635
    :cond_0
    :goto_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 636
    return-void

    .line 604
    :cond_1
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI_NO_NOTIFICATION:Landroid/net/Uri;

    goto :goto_0

    .line 613
    :pswitch_0
    :try_start_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    check-cast v2, Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v4, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    :pswitch_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v4, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v6, -0x64

    cmp-long v2, v4, v6

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v4, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v6, -0x65

    cmp-long v2, v4, v6

    if-nez v2, :cond_3

    .line 620
    :cond_2
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 635
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 622
    :cond_3
    :try_start_2
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v4, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 624
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "adding item: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

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

    .line 626
    .local v0, msg:Ljava/lang/String;
    const-string v2, "Trebuchet.LauncherModel"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    invoke-static {}, Lcom/cyanogenmod/trebuchet/Launcher;->dumpDebugLogsToConsole()V

    goto :goto_1

    .line 632
    .end local v0           #msg:Ljava/lang/String;
    :pswitch_2
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$4;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    check-cast v2, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 611
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
