.class final Lcom/android/launcher2/LauncherModel$3;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel;->updateItemInDatabaseHelper(Landroid/content/Context;Landroid/content/ContentValues;Lcom/android/launcher2/ItemInfo;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$item:Lcom/android/launcher2/ItemInfo;

.field final synthetic val$itemId:J

.field final synthetic val$stackTrace:[Ljava/lang/StackTraceElement;

.field final synthetic val$uri:Landroid/net/Uri;

.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;JLcom/android/launcher2/ItemInfo;[Ljava/lang/StackTraceElement;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 359
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$3;->val$cr:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$3;->val$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/android/launcher2/LauncherModel$3;->val$values:Landroid/content/ContentValues;

    iput-wide p4, p0, Lcom/android/launcher2/LauncherModel$3;->val$itemId:J

    iput-object p6, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iput-object p7, p0, Lcom/android/launcher2/LauncherModel$3;->val$stackTrace:[Ljava/lang/StackTraceElement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const-wide/16 v9, -0x64

    const-wide/16 v7, -0x65

    const/4 v5, 0x0

    .line 361
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$3;->val$cr:Landroid/content/ContentResolver;

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$3;->val$uri:Landroid/net/Uri;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$values:Landroid/content/ContentValues;

    invoke-virtual {v2, v3, v4, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 364
    sget-object v3, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v3

    .line 365
    :try_start_0
    iget-wide v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$itemId:J

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-object v6, p0, Lcom/android/launcher2/LauncherModel$3;->val$stackTrace:[Ljava/lang/StackTraceElement;

    invoke-static {v4, v5, v2, v6}, Lcom/android/launcher2/LauncherModel;->checkItemInfoLocked(JLcom/android/launcher2/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 367
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->container:J

    cmp-long v2, v4, v9

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v2, Lcom/android/launcher2/ItemInfo;->container:J

    cmp-long v2, v4, v7

    if-eqz v2, :cond_0

    .line 370
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 373
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "item: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " container being set to: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$item:Lcom/android/launcher2/ItemInfo;

    iget-wide v4, v4, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", not in the list of folders"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, msg:Ljava/lang/String;
    const-string v2, "Launcher.Model"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    invoke-static {}, Lcom/android/launcher2/Launcher;->dumpDebugLogsToConsole()V

    .line 383
    .end local v1           #msg:Ljava/lang/String;
    :cond_0
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    iget-wide v4, p0, Lcom/android/launcher2/LauncherModel$3;->val$itemId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ItemInfo;

    .line 384
    .local v0, modelItem:Lcom/android/launcher2/ItemInfo;
    iget-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    cmp-long v2, v4, v9

    if-eqz v2, :cond_1

    iget-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    cmp-long v2, v4, v7

    if-nez v2, :cond_3

    .line 386
    :cond_1
    iget v2, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v2, :pswitch_data_0

    .line 400
    :cond_2
    :goto_0
    monitor-exit v3

    .line 401
    return-void

    .line 390
    :pswitch_0
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 391
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 400
    .end local v0           #modelItem:Lcom/android/launcher2/ItemInfo;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 398
    .restart local v0       #modelItem:Lcom/android/launcher2/ItemInfo;
    :cond_3
    :try_start_1
    sget-object v2, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 386
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
