.class Lcom/android/launcher2/LauncherModel$LoaderTask;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/LauncherModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoaderTask"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsLaunching:Z

.field private mIsLoadingAndBindingWorkspace:Z

.field private mLabelCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadAndBindStepFinished:Z

.field private mStopped:Z

.field final synthetic this$0:Lcom/android/launcher2/LauncherModel;


# direct methods
.method constructor <init>(Lcom/android/launcher2/LauncherModel;Landroid/content/Context;Z)V
    .locals 3
    .parameter
    .parameter "context"
    .parameter "isLaunching"

    .prologue
    .line 1111
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1112
    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1113
    iput-boolean p3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    .line 1114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    .line 1116
    const-string v0, "Launcher.Model"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LoaderTask construct: mLabelCache = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mIsLaunching = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1119
    return-void
.end method

.method static synthetic access$102(Lcom/android/launcher2/LauncherModel$LoaderTask;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1102
    iput-boolean p1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z

    return p1
.end method

.method static synthetic access$1502(Lcom/android/launcher2/LauncherModel$LoaderTask;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1102
    iput-boolean p1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    return p1
.end method

.method private bindWorkspace(I)V
    .locals 26
    .parameter "synchronizeBindPage"

    .prologue
    .line 1869
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v23

    .line 1874
    .local v23, t:J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v4}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/launcher2/LauncherModel$Callbacks;

    .line 1875
    .local v11, oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-nez v11, :cond_0

    .line 1877
    const-string v4, "Launcher.Model"

    const-string v10, "LoaderTask running with no launcher"

    invoke-static {v4, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1976
    :goto_0
    return-void

    .line 1881
    :cond_0
    const/4 v4, -0x1

    move/from16 v0, p1

    if-le v0, v4, :cond_2

    const/16 v21, 0x1

    .line 1882
    .local v21, isLoadingSynchronously:Z
    :goto_1
    if-eqz v21, :cond_3

    move/from16 v5, p1

    .line 1887
    .local v5, currentScreen:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v4}, Lcom/android/launcher2/LauncherModel;->unbindWorkspaceItemsOnMainThread()V

    .line 1888
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 1889
    .local v25, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 1891
    .local v20, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 1892
    .local v7, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1893
    .local v6, itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/ItemInfo;>;"
    sget-object v10, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v10

    .line 1894
    :try_start_0
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1895
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1896
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1897
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1898
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1900
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1901
    .local v12, currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 1902
    .local v16, otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1904
    .local v13, currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 1906
    .local v17, otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 1907
    .local v8, currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 1910
    .local v9, otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    invoke-direct {v0, v5, v1, v12, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->filterCurrentWorkspaceItems(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1912
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-direct {v0, v5, v1, v13, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->filterCurrentAppWidgets(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    move-object/from16 v4, p0

    .line 1914
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher2/LauncherModel$LoaderTask;->filterCurrentFolders(ILjava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 1916
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/launcher2/LauncherModel$LoaderTask;->sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V

    .line 1917
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/android/launcher2/LauncherModel$LoaderTask;->sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V

    .line 1920
    new-instance v22, Lcom/android/launcher2/LauncherModel$LoaderTask$7;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/android/launcher2/LauncherModel$LoaderTask$7;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;)V

    .line 1928
    .local v22, r:Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v10, 0x1

    move-object/from16 v0, v22

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v4, v0, v10}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    .line 1931
    const/4 v15, 0x0

    move-object/from16 v10, p0

    move-object v14, v8

    invoke-direct/range {v10 .. v15}, Lcom/android/launcher2/LauncherModel$LoaderTask;->bindWorkspaceItems(Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1933
    if-eqz v21, :cond_1

    .line 1934
    new-instance v22, Lcom/android/launcher2/LauncherModel$LoaderTask$8;

    .end local v22           #r:Ljava/lang/Runnable;
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v5}, Lcom/android/launcher2/LauncherModel$LoaderTask$8;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;I)V

    .line 1942
    .restart local v22       #r:Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v10, 0x1

    move-object/from16 v0, v22

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v4, v0, v10}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    .line 1947
    :cond_1
    sget-object v4, Lcom/android/launcher2/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1948
    if-eqz v21, :cond_4

    sget-object v19, Lcom/android/launcher2/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    :goto_3
    move-object/from16 v14, p0

    move-object v15, v11

    move-object/from16 v18, v9

    invoke-direct/range {v14 .. v19}, Lcom/android/launcher2/LauncherModel$LoaderTask;->bindWorkspaceItems(Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1952
    new-instance v22, Lcom/android/launcher2/LauncherModel$LoaderTask$9;

    .end local v22           #r:Ljava/lang/Runnable;
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-wide/from16 v2, v23

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/android/launcher2/LauncherModel$LoaderTask$9;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;J)V

    .line 1971
    .restart local v22       #r:Ljava/lang/Runnable;
    if-eqz v21, :cond_5

    .line 1972
    sget-object v4, Lcom/android/launcher2/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1881
    .end local v5           #currentScreen:I
    .end local v6           #itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/ItemInfo;>;"
    .end local v7           #folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .end local v8           #currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .end local v9           #otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .end local v12           #currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .end local v13           #currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .end local v16           #otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .end local v17           #otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .end local v20           #appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .end local v21           #isLoadingSynchronously:Z
    .end local v22           #r:Ljava/lang/Runnable;
    .end local v25           #workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    :cond_2
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 1882
    .restart local v21       #isLoadingSynchronously:Z
    :cond_3
    invoke-interface {v11}, Lcom/android/launcher2/LauncherModel$Callbacks;->getCurrentWorkspaceScreen()I

    move-result v5

    goto/16 :goto_2

    .line 1898
    .restart local v5       #currentScreen:I
    .restart local v6       #itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/ItemInfo;>;"
    .restart local v7       #folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .restart local v20       #appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .restart local v25       #workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 1948
    .restart local v8       #currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .restart local v9       #otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .restart local v12       #currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .restart local v13       #currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .restart local v16       #otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .restart local v17       #otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .restart local v22       #r:Ljava/lang/Runnable;
    :cond_4
    const/16 v19, 0x0

    goto :goto_3

    .line 1974
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v10, 0x1

    move-object/from16 v0, v22

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v4, v0, v10}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    goto/16 :goto_0
.end method

.method private bindWorkspaceItems(Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 10
    .parameter "oldCallbacks"
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/LauncherModel$Callbacks;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1805
    .local p2, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .local p3, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .local p4, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .local p5, deferredBindRunnables:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Runnable;>;"
    if-eqz p5, :cond_0

    const/4 v8, 0x1

    .line 1808
    .local v8, postOnMainThread:Z
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1809
    .local v6, N:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    if-ge v7, v6, :cond_3

    .line 1810
    move v4, v7

    .line 1811
    .local v4, start:I
    add-int/lit8 v1, v7, 0x6

    if-gt v1, v6, :cond_1

    const/4 v5, 0x6

    .line 1812
    .local v5, chunkSize:I
    :goto_2
    new-instance v0, Lcom/android/launcher2/LauncherModel$LoaderTask$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher2/LauncherModel$LoaderTask$4;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/ArrayList;II)V

    .line 1821
    .local v0, r:Ljava/lang/Runnable;
    if-eqz v8, :cond_2

    .line 1822
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1809
    :goto_3
    add-int/lit8 v7, v7, 0x6

    goto :goto_1

    .line 1805
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v4           #start:I
    .end local v5           #chunkSize:I
    .end local v6           #N:I
    .end local v7           #i:I
    .end local v8           #postOnMainThread:Z
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 1811
    .restart local v4       #start:I
    .restart local v6       #N:I
    .restart local v7       #i:I
    .restart local v8       #postOnMainThread:Z
    :cond_1
    sub-int v5, v6, v7

    goto :goto_2

    .line 1824
    .restart local v0       #r:Ljava/lang/Runnable;
    .restart local v5       #chunkSize:I
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v2, 0x1

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v1, v0, v2}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    goto :goto_3

    .line 1829
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v4           #start:I
    .end local v5           #chunkSize:I
    :cond_3
    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1830
    new-instance v0, Lcom/android/launcher2/LauncherModel$LoaderTask$5;

    invoke-direct {v0, p0, p1, p4}, Lcom/android/launcher2/LauncherModel$LoaderTask$5;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/HashMap;)V

    .line 1838
    .restart local v0       #r:Ljava/lang/Runnable;
    if-eqz v8, :cond_5

    .line 1839
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1846
    .end local v0           #r:Ljava/lang/Runnable;
    :cond_4
    :goto_4
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1847
    const/4 v7, 0x0

    :goto_5
    if-ge v7, v6, :cond_7

    .line 1848
    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/LauncherAppWidgetInfo;

    .line 1849
    .local v9, widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    new-instance v0, Lcom/android/launcher2/LauncherModel$LoaderTask$6;

    invoke-direct {v0, p0, p1, v9}, Lcom/android/launcher2/LauncherModel$LoaderTask$6;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;Lcom/android/launcher2/LauncherAppWidgetInfo;)V

    .line 1857
    .restart local v0       #r:Ljava/lang/Runnable;
    if-eqz v8, :cond_6

    .line 1858
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1847
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 1841
    .end local v9           #widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    :cond_5
    iget-object v1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v2, 0x1

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v1, v0, v2}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    goto :goto_4

    .line 1860
    .restart local v9       #widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    :cond_6
    iget-object v1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v2, 0x1

    #calls: Lcom/android/launcher2/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;I)V
    invoke-static {v1, v0, v2}, Lcom/android/launcher2/LauncherModel;->access$1400(Lcom/android/launcher2/LauncherModel;Ljava/lang/Runnable;I)V

    goto :goto_6

    .line 1863
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v9           #widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    :cond_7
    return-void
.end method

.method private checkItemPlacement([[[Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/ItemInfo;)Z
    .locals 11
    .parameter "occupied"
    .parameter "item"

    .prologue
    const/4 v10, 0x5

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1365
    iget v0, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1366
    .local v0, containerIndex:I
    iget-wide v6, p2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v8, -0x65

    cmp-long v3, v6, v8

    if-nez v3, :cond_3

    .line 1368
    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/LauncherModel$Callbacks;

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-interface {v3, v6}, Lcom/android/launcher2/LauncherModel$Callbacks;->isAllAppsButtonRank(I)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    move v3, v4

    .line 1407
    :goto_0
    return v3

    .line 1374
    :cond_1
    aget-object v3, p1, v10

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    aget-object v3, v3, v6

    aget-object v3, v3, v4

    if-eqz v3, :cond_2

    .line 1375
    const-string v3, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error loading shortcut into hotseat "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " into position ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") occupied by "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p1, v10

    iget v7, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    aget-object v6, v6, v7

    aget-object v6, v6, v4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v4

    .line 1378
    goto :goto_0

    .line 1380
    :cond_2
    aget-object v3, p1, v10

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    aget-object v3, v3, v6

    aput-object p2, v3, v4

    move v3, v5

    .line 1381
    goto :goto_0

    .line 1383
    :cond_3
    iget-wide v6, p2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v8, -0x64

    cmp-long v3, v6, v8

    if-eqz v3, :cond_4

    move v3, v5

    .line 1385
    goto :goto_0

    .line 1389
    :cond_4
    iget v1, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    .local v1, x:I
    :goto_1
    iget v3, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->spanX:I

    add-int/2addr v3, v6

    if-ge v1, v3, :cond_7

    .line 1390
    iget v2, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    .local v2, y:I
    :goto_2
    iget v3, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->spanY:I

    add-int/2addr v3, v6

    if-ge v2, v3, :cond_6

    .line 1391
    aget-object v3, p1, v0

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    if-eqz v3, :cond_5

    .line 1392
    const-string v3, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error loading shortcut "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " into cell ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") occupied by "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p1, v0

    aget-object v6, v6, v1

    aget-object v6, v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v4

    .line 1397
    goto/16 :goto_0

    .line 1390
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1389
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1401
    .end local v2           #y:I
    :cond_7
    iget v1, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    :goto_3
    iget v3, p2, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v4, p2, Lcom/android/launcher2/ItemInfo;->spanX:I

    add-int/2addr v3, v4

    if-ge v1, v3, :cond_9

    .line 1402
    iget v2, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    .restart local v2       #y:I
    :goto_4
    iget v3, p2, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v4, p2, Lcom/android/launcher2/ItemInfo;->spanY:I

    add-int/2addr v3, v4

    if-ge v2, v3, :cond_8

    .line 1403
    aget-object v3, p1, v0

    aget-object v3, v3, v1

    aput-object p2, v3, v2

    .line 1402
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1401
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .end local v2           #y:I
    :cond_9
    move v3, v5

    .line 1407
    goto/16 :goto_0
.end method

.method private filterCurrentAppWidgets(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 6
    .parameter "currentScreen"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/LauncherAppWidgetInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1739
    .local p2, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .local p3, currentScreenWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    .local p4, otherScreenWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/LauncherAppWidgetInfo;>;"
    if-gez p1, :cond_0

    .line 1740
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1743
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/LauncherAppWidgetInfo;

    .line 1744
    .local v1, widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    if-eqz v1, :cond_1

    .line 1745
    iget-wide v2, v1, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v4, -0x64

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    iget v2, v1, Lcom/android/launcher2/ItemInfo;->screen:I

    if-ne v2, p1, :cond_2

    .line 1747
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1749
    :cond_2
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1752
    .end local v1           #widget:Lcom/android/launcher2/LauncherAppWidgetInfo;
    :cond_3
    return-void
.end method

.method private filterCurrentFolders(ILjava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 9
    .parameter "currentScreen"
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/ItemInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1762
    .local p2, itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/ItemInfo;>;"
    .local p3, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .local p4, currentScreenFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    .local p5, otherScreenFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    if-gez p1, :cond_0

    .line 1763
    invoke-virtual {p4, p3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1766
    :cond_0
    invoke-virtual {p3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 1767
    .local v2, id:J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/ItemInfo;

    .line 1768
    .local v4, info:Lcom/android/launcher2/ItemInfo;
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/FolderInfo;

    .line 1769
    .local v0, folder:Lcom/android/launcher2/FolderInfo;
    if-eqz v4, :cond_1

    if-eqz v0, :cond_1

    .line 1770
    iget-wide v5, v4, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v7, -0x64

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    iget v5, v4, Lcom/android/launcher2/ItemInfo;->screen:I

    if-ne v5, p1, :cond_2

    .line 1772
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1774
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p5, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1777
    .end local v0           #folder:Lcom/android/launcher2/FolderInfo;
    .end local v2           #id:J
    .end local v4           #info:Lcom/android/launcher2/ItemInfo;
    :cond_3
    return-void
.end method

.method private filterCurrentWorkspaceItems(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 9
    .parameter "currentScreen"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1686
    .local p2, allWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .local p3, currentScreenItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    .local p4, otherScreenItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1687
    .local v4, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/ItemInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1688
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ItemInfo;

    .line 1689
    .local v0, i:Lcom/android/launcher2/ItemInfo;
    if-nez v0, :cond_0

    .line 1690
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 1696
    .end local v0           #i:Lcom/android/launcher2/ItemInfo;
    :cond_1
    if-gez p1, :cond_2

    .line 1697
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1703
    :cond_2
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1704
    .local v3, itemsOnScreen:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Long;>;"
    new-instance v5, Lcom/android/launcher2/LauncherModel$LoaderTask$2;

    invoke-direct {v5, p0}, Lcom/android/launcher2/LauncherModel$LoaderTask$2;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;)V

    invoke-static {p2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1710
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/ItemInfo;

    .line 1711
    .local v2, info:Lcom/android/launcher2/ItemInfo;
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v7, -0x64

    cmp-long v5, v5, v7

    if-nez v5, :cond_4

    .line 1712
    iget v5, v2, Lcom/android/launcher2/ItemInfo;->screen:I

    if-ne v5, p1, :cond_3

    .line 1713
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1714
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1716
    :cond_3
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1718
    :cond_4
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v7, -0x65

    cmp-long v5, v5, v7

    if-nez v5, :cond_5

    .line 1719
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1720
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1722
    :cond_5
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1723
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1724
    iget-wide v5, v2, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1726
    :cond_6
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1730
    .end local v2           #info:Lcom/android/launcher2/ItemInfo;
    :cond_7
    return-void
.end method

.method private loadAllAppsByBatch()V
    .locals 29

    .prologue
    .line 2035
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v20

    .line 2039
    .local v20, t:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/launcher2/LauncherModel$Callbacks;

    .line 2040
    .local v13, oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-nez v13, :cond_1

    .line 2042
    const-string v24, "Launcher.Model"

    const-string v25, "LoaderTask running with no launcher (loadAllAppsByBatch)"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2160
    :cond_0
    :goto_0
    return-void

    .line 2046
    :cond_1
    new-instance v12, Landroid/content/Intent;

    const-string v24, "android.intent.action.MAIN"

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v12, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2047
    .local v12, mainIntent:Landroid/content/Intent;
    const-string v24, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2049
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    .line 2050
    .local v14, packageManager:Landroid/content/pm/PackageManager;
    const/4 v6, 0x0

    .line 2052
    .local v6, apps:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const v4, 0x7fffffff

    .line 2055
    .local v4, N:I
    const/4 v10, 0x0

    .line 2056
    .local v10, i:I
    const/4 v7, -0x1

    .line 2057
    .local v7, batchSize:I
    :cond_2
    :goto_1
    if-ge v10, v4, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    move/from16 v24, v0

    if-nez v24, :cond_8

    .line 2058
    if-nez v10, :cond_3

    .line 2059
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/android/launcher2/AllAppsList;->clear()V

    .line 2060
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v15

    .line 2061
    .local v15, qiaTime:J
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v12, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v6

    .line 2063
    const-string v24, "Launcher.Model"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "queryIntentActivities took "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v26

    sub-long v26, v26, v15

    invoke-virtual/range {v25 .. v27}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "ms"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2066
    if-eqz v6, :cond_0

    .line 2069
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    .line 2071
    const-string v24, "Launcher.Model"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "queryIntentActivities got "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " apps, mBatchSize = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v26, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBatchSize:I
    invoke-static/range {v26 .. v26}, Lcom/android/launcher2/LauncherModel;->access$1800(Lcom/android/launcher2/LauncherModel;)I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ", this = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2074
    if-eqz v4, :cond_0

    .line 2078
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBatchSize:I
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1800(Lcom/android/launcher2/LauncherModel;)I

    move-result v24

    if-nez v24, :cond_4

    .line 2079
    move v7, v4

    .line 2090
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lcom/android/launcher2/LauncherModel;->flushCacheIfNeeded(Ljava/util/HashMap;)V

    .line 2091
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    .line 2092
    .local v17, sortTime:J
    new-instance v24, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v14, v1}, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;-><init>(Landroid/content/pm/PackageManager;Ljava/util/HashMap;)V

    move-object/from16 v0, v24

    invoke-static {v6, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 2095
    const-string v24, "Launcher.Model"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sort took "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v26

    sub-long v26, v26, v17

    invoke-virtual/range {v25 .. v27}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "ms"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ", this = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2100
    .end local v15           #qiaTime:J
    .end local v17           #sortTime:J
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v22

    .line 2102
    .local v22, t2:J
    move/from16 v19, v10

    .line 2103
    .local v19, startIndex:I
    const/4 v11, 0x0

    .local v11, j:I
    :goto_3
    if-ge v10, v4, :cond_5

    if-ge v11, v7, :cond_5

    .line 2105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v25

    new-instance v26, Lcom/android/launcher2/ApplicationInfo;

    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Landroid/content/pm/ResolveInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v27, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mIconCache:Lcom/android/launcher2/IconCache;
    invoke-static/range {v27 .. v27}, Lcom/android/launcher2/LauncherModel;->access$1900(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/IconCache;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v28, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v14, v1, v2, v3}, Lcom/android/launcher2/ApplicationInfo;-><init>(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;Lcom/android/launcher2/IconCache;Ljava/util/HashMap;)V

    invoke-virtual/range {v25 .. v26}, Lcom/android/launcher2/AllAppsList;->add(Lcom/android/launcher2/ApplicationInfo;)V

    .line 2107
    add-int/lit8 v10, v10, 0x1

    .line 2103
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 2081
    .end local v11           #j:I
    .end local v19           #startIndex:I
    .end local v22           #t2:J
    .restart local v15       #qiaTime:J
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBatchSize:I
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1800(Lcom/android/launcher2/LauncherModel;)I

    move-result v7

    goto/16 :goto_2

    .line 2110
    .end local v15           #qiaTime:J
    .restart local v11       #j:I
    .restart local v19       #startIndex:I
    .restart local v22       #t2:J
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mApp:Lcom/android/launcher2/LauncherApplication;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$800(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/LauncherApplication;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherExtPlugin;->getAllAppsListExt(Landroid/content/Context;)Lcom/mediatek/launcher2/ext/IAllAppsListExt;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lcom/mediatek/launcher2/ext/IAllAppsListExt;->isShowWifiSettings()Z

    move-result v24

    if-nez v24, :cond_6

    .line 2111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/android/launcher2/AllAppsList;->removeWifiSettings()V

    .line 2114
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/android/launcher2/AllAppsList;->reorderApplist()V

    .line 2116
    if-gt v10, v7, :cond_7

    const/4 v9, 0x1

    .line 2117
    .local v9, first:Z
    :goto_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/launcher2/LauncherModel$LoaderTask;->tryGetCallbacks(Lcom/android/launcher2/LauncherModel$Callbacks;)Lcom/android/launcher2/LauncherModel$Callbacks;

    move-result-object v8

    .line 2118
    .local v8, callbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v24

    move-object/from16 v0, v24

    iget-object v5, v0, Lcom/android/launcher2/AllAppsList;->added:Ljava/util/ArrayList;

    .line 2119
    .local v5, added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v24

    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/android/launcher2/AllAppsList;->added:Ljava/util/ArrayList;

    .line 2121
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mHandler:Lcom/android/launcher2/DeferredHandler;
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$200(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/DeferredHandler;

    move-result-object v24

    new-instance v25, Lcom/android/launcher2/LauncherModel$LoaderTask$11;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8, v9, v5}, Lcom/android/launcher2/LauncherModel$LoaderTask$11;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;ZLjava/util/ArrayList;)V

    invoke-virtual/range {v24 .. v25}, Lcom/android/launcher2/DeferredHandler;->post(Ljava/lang/Runnable;)V

    .line 2141
    const-string v24, "Launcher.Model"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "batch of "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sub-int v26, v10, v19

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " icons processed in "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v26

    sub-long v26, v26, v22

    invoke-virtual/range {v25 .. v27}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "ms"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoadDelay:I
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$2000(Lcom/android/launcher2/LauncherModel;)I

    move-result v24

    if-lez v24, :cond_2

    if-ge v10, v4, :cond_2

    .line 2148
    :try_start_0
    const-string v24, "Launcher.Model"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sleeping for "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v26, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoadDelay:I
    invoke-static/range {v26 .. v26}, Lcom/android/launcher2/LauncherModel;->access$2000(Lcom/android/launcher2/LauncherModel;)I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "ms"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoadDelay:I
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$2000(Lcom/android/launcher2/LauncherModel;)I

    move-result v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 2151
    :catch_0
    move-exception v24

    goto/16 :goto_1

    .line 2116
    .end local v5           #added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    .end local v8           #callbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    .end local v9           #first:Z
    :cond_7
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 2156
    .end local v11           #j:I
    .end local v19           #startIndex:I
    .end local v22           #t2:J
    :cond_8
    const-string v25, "Launcher.Model"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "cached all "

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v26, " apps in "

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v26

    sub-long v26, v26, v20

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v26, "ms"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v24, v0

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoadDelay:I
    invoke-static/range {v24 .. v24}, Lcom/android/launcher2/LauncherModel;->access$2000(Lcom/android/launcher2/LauncherModel;)I

    move-result v24

    if-lez v24, :cond_9

    const-string v24, " (including delay)"

    :goto_5
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_9
    const-string v24, ""

    goto :goto_5
.end method

.method private loadAndBindAllApps()V
    .locals 3

    .prologue
    .line 1980
    const-string v0, "Launcher.Model"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadAndBindAllApps: mAllAppsLoaded ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$300(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mStopped = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1983
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$300(Lcom/android/launcher2/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1984
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadAllAppsByBatch()V

    .line 1985
    monitor-enter p0

    .line 1986
    :try_start_0
    iget-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v0, :cond_0

    .line 1987
    const-string v0, "Launcher.Model"

    const-string v1, "loadAndBindAllApps returned by stop flag."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1988
    monitor-exit p0

    .line 1995
    :goto_0
    return-void

    .line 1990
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v1, 0x1

    #setter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherModel;->access$302(Lcom/android/launcher2/LauncherModel;Z)Z

    .line 1991
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1993
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->onlyBindAllApps()V

    goto :goto_0
.end method

.method private loadAndBindWorkspace()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 1130
    iput-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    .line 1134
    const-string v0, "Launcher.Model"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadAndBindWorkspace mWorkspaceLoaded="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$000(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$000(Lcom/android/launcher2/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1138
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadWorkspace()V

    .line 1139
    monitor-enter p0

    .line 1140
    :try_start_0
    iget-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v0, :cond_0

    .line 1141
    const-string v0, "Launcher.Model"

    const-string v1, "loadAndBindWorkspace returned by stop flag."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1142
    monitor-exit p0

    .line 1150
    :goto_0
    return-void

    .line 1144
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v1, 0x1

    #setter for: Lcom/android/launcher2/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherModel;->access$002(Lcom/android/launcher2/LauncherModel;Z)Z

    .line 1145
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1149
    :cond_1
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->bindWorkspace(I)V

    goto :goto_0

    .line 1145
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private loadWorkspace()V
    .locals 56

    .prologue
    .line 1411
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v50

    .line 1413
    .local v50, t:J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1414
    .local v13, context:Landroid/content/Context;
    invoke-virtual {v13}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 1415
    .local v3, contentResolver:Landroid/content/ContentResolver;
    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v42

    .line 1416
    .local v42, manager:Landroid/content/pm/PackageManager;
    invoke-static {v13}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v52

    .line 1417
    .local v52, widgets:Landroid/appwidget/AppWidgetManager;
    invoke-virtual/range {v42 .. v42}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    move-result v36

    .line 1420
    .local v36, isSafeMode:Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mApp:Lcom/android/launcher2/LauncherApplication;
    invoke-static {v4}, Lcom/android/launcher2/LauncherModel;->access$800(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/LauncherApplication;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/launcher2/LauncherApplication;->getLauncherProvider()Lcom/android/launcher2/LauncherProvider;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/launcher2/LauncherProvider;->loadDefaultFavoritesIfNecessary(I)V

    .line 1422
    sget-object v55, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v55

    .line 1423
    :try_start_0
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1424
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1425
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1426
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1427
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1429
    new-instance v39, Ljava/util/ArrayList;

    invoke-direct/range {v39 .. v39}, Ljava/util/ArrayList;-><init>()V

    .line 1433
    .local v39, itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    sget-object v4, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "scene = \'"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    #calls: Lcom/android/launcher2/LauncherModel;->getCurrentSceneName(Landroid/content/Context;)Ljava/lang/String;
    invoke-static {v13}, Lcom/android/launcher2/LauncherModel;->access$900(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v11, "\'"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1439
    .local v8, c:Landroid/database/Cursor;
    const/4 v4, 0x6

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->access$1000()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->access$1100()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    filled-new-array {v4, v5, v7}, [I

    move-result-object v4

    const-class v5, Lcom/android/launcher2/ItemInfo;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v44

    check-cast v44, [[[Lcom/android/launcher2/ItemInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1443
    .local v44, occupied:[[[Lcom/android/launcher2/ItemInfo;
    :try_start_1
    const-string v4, "_id"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v32

    .line 1444
    .local v32, idIndex:I
    const-string v4, "intent"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v35

    .line 1446
    .local v35, intentIndex:I
    const-string v4, "title"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 1448
    .local v10, titleIndex:I
    const-string v4, "iconType"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 1450
    .local v14, iconTypeIndex:I
    const-string v4, "icon"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 1451
    .local v9, iconIndex:I
    const-string v4, "iconPackage"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 1453
    .local v15, iconPackageIndex:I
    const-string v4, "iconResource"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    .line 1455
    .local v16, iconResourceIndex:I
    const-string v4, "container"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v26

    .line 1457
    .local v26, containerIndex:I
    const-string v4, "itemType"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v38

    .line 1459
    .local v38, itemTypeIndex:I
    const-string v4, "appWidgetId"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v20

    .line 1461
    .local v20, appWidgetIdIndex:I
    const-string v4, "screen"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v47

    .line 1463
    .local v47, screenIndex:I
    const-string v4, "cellX"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    .line 1465
    .local v22, cellXIndex:I
    const-string v4, "cellY"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v23

    .line 1467
    .local v23, cellYIndex:I
    const-string v4, "spanX"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v48

    .line 1469
    .local v48, spanXIndex:I
    const-string v4, "spanY"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v49

    .line 1482
    .local v49, spanYIndex:I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-nez v4, :cond_7

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-eqz v4, :cond_7

    .line 1484
    :try_start_2
    move/from16 v0, v38

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v37

    .line 1486
    .local v37, itemType:I
    packed-switch v37, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 1489
    :pswitch_1
    move/from16 v0, v35

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v34

    .line 1491
    .local v34, intentDescription:Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_3
    move-object/from16 v0, v34

    invoke-static {v0, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v6

    .line 1496
    .local v6, intent:Landroid/content/Intent;
    if-nez v37, :cond_2

    .line 1497
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v5, v42

    move-object v7, v13

    invoke-virtual/range {v4 .. v11}, Lcom/android/launcher2/LauncherModel;->getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;Landroid/database/Cursor;IILjava/util/HashMap;)Lcom/android/launcher2/ShortcutInfo;

    move-result-object v33

    .line 1517
    .local v33, info:Lcom/android/launcher2/ShortcutInfo;
    :cond_1
    :goto_1
    if-eqz v33, :cond_3

    .line 1518
    move-object/from16 v0, v33

    iput-object v6, v0, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 1519
    move/from16 v0, v32

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    move-object/from16 v0, v33

    iput-wide v4, v0, Lcom/android/launcher2/ItemInfo;->id:J

    .line 1520
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1521
    .local v25, container:I
    move/from16 v0, v25

    int-to-long v4, v0

    move-object/from16 v0, v33

    iput-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1522
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v33

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1523
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v33

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1524
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v33

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 1527
    move-object/from16 v0, p0

    move-object/from16 v1, v44

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1531
    packed-switch v25, :pswitch_data_1

    .line 1538
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move/from16 v0, v25

    int-to-long v11, v0

    #calls: Lcom/android/launcher2/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/android/launcher2/FolderInfo;
    invoke-static {v4, v11, v12}, Lcom/android/launcher2/LauncherModel;->access$1300(Ljava/util/HashMap;J)Lcom/android/launcher2/FolderInfo;

    move-result-object v28

    .line 1540
    .local v28, folderInfo:Lcom/android/launcher2/FolderInfo;
    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/launcher2/FolderInfo;->add(Lcom/android/launcher2/ShortcutInfo;)V

    .line 1543
    .end local v28           #folderInfo:Lcom/android/launcher2/FolderInfo;
    :goto_2
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v33

    iget-wide v11, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v33

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1547
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    sget-object v5, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    move-object/from16 v0, v33

    invoke-virtual {v4, v5, v0, v8, v9}, Lcom/android/launcher2/LauncherModel;->queueIconToBeChecked(Ljava/util/HashMap;Lcom/android/launcher2/ShortcutInfo;Landroid/database/Cursor;I)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 1634
    .end local v6           #intent:Landroid/content/Intent;
    .end local v25           #container:I
    .end local v33           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v34           #intentDescription:Ljava/lang/String;
    .end local v37           #itemType:I
    :catch_0
    move-exception v27

    .line 1635
    .local v27, e:Ljava/lang/Exception;
    :try_start_5
    const-string v4, "Launcher.Model"

    const-string v5, "Desktop items loading interrupted:"

    move-object/from16 v0, v27

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 1639
    .end local v9           #iconIndex:I
    .end local v10           #titleIndex:I
    .end local v14           #iconTypeIndex:I
    .end local v15           #iconPackageIndex:I
    .end local v16           #iconResourceIndex:I
    .end local v20           #appWidgetIdIndex:I
    .end local v22           #cellXIndex:I
    .end local v23           #cellYIndex:I
    .end local v26           #containerIndex:I
    .end local v27           #e:Ljava/lang/Exception;
    .end local v32           #idIndex:I
    .end local v35           #intentIndex:I
    .end local v38           #itemTypeIndex:I
    .end local v47           #screenIndex:I
    .end local v48           #spanXIndex:I
    .end local v49           #spanYIndex:I
    :catchall_0
    move-exception v4

    :try_start_6
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v4

    .line 1676
    .end local v8           #c:Landroid/database/Cursor;
    .end local v39           #itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v44           #occupied:[[[Lcom/android/launcher2/ItemInfo;
    :catchall_1
    move-exception v4

    monitor-exit v55
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v4

    .line 1492
    .restart local v8       #c:Landroid/database/Cursor;
    .restart local v9       #iconIndex:I
    .restart local v10       #titleIndex:I
    .restart local v14       #iconTypeIndex:I
    .restart local v15       #iconPackageIndex:I
    .restart local v16       #iconResourceIndex:I
    .restart local v20       #appWidgetIdIndex:I
    .restart local v22       #cellXIndex:I
    .restart local v23       #cellYIndex:I
    .restart local v26       #containerIndex:I
    .restart local v32       #idIndex:I
    .restart local v34       #intentDescription:Ljava/lang/String;
    .restart local v35       #intentIndex:I
    .restart local v37       #itemType:I
    .restart local v38       #itemTypeIndex:I
    .restart local v39       #itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v44       #occupied:[[[Lcom/android/launcher2/ItemInfo;
    .restart local v47       #screenIndex:I
    .restart local v48       #spanXIndex:I
    .restart local v49       #spanYIndex:I
    :catch_1
    move-exception v27

    .local v27, e:Ljava/net/URISyntaxException;
    goto/16 :goto_0

    .line 1500
    .end local v27           #e:Ljava/net/URISyntaxException;
    .restart local v6       #intent:Landroid/content/Intent;
    :cond_2
    :try_start_7
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    move-object v12, v8

    move/from16 v17, v9

    move/from16 v18, v10

    #calls: Lcom/android/launcher2/LauncherModel;->getShortcutInfo(Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/android/launcher2/ShortcutInfo;
    invoke-static/range {v11 .. v18}, Lcom/android/launcher2/LauncherModel;->access$1200(Lcom/android/launcher2/LauncherModel;Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/android/launcher2/ShortcutInfo;

    move-result-object v33

    .line 1507
    .restart local v33       #info:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v6}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const-string v5, "android.intent.action.MAIN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v6}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v4

    const-string v5, "android.intent.category.LAUNCHER"

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1511
    const/high16 v4, 0x1020

    invoke-virtual {v6, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto/16 :goto_1

    .line 1534
    .restart local v25       #container:I
    :pswitch_2
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v33

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1553
    .end local v25           #container:I
    :cond_3
    move/from16 v0, v32

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    .line 1554
    .local v30, id:J
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error loading shortcut "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v30

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ", removing it"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1555
    const/4 v4, 0x0

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4}, Lcom/android/launcher2/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1561
    .end local v6           #intent:Landroid/content/Intent;
    .end local v30           #id:J
    .end local v33           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v34           #intentDescription:Ljava/lang/String;
    :pswitch_3
    move/from16 v0, v32

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    .line 1562
    .restart local v30       #id:J
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move-wide/from16 v0, v30

    #calls: Lcom/android/launcher2/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/android/launcher2/FolderInfo;
    invoke-static {v4, v0, v1}, Lcom/android/launcher2/LauncherModel;->access$1300(Ljava/util/HashMap;J)Lcom/android/launcher2/FolderInfo;

    move-result-object v28

    .line 1564
    .restart local v28       #folderInfo:Lcom/android/launcher2/FolderInfo;
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v28

    iput-object v4, v0, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    .line 1565
    move-wide/from16 v0, v30

    move-object/from16 v2, v28

    iput-wide v0, v2, Lcom/android/launcher2/ItemInfo;->id:J

    .line 1566
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1567
    .restart local v25       #container:I
    move/from16 v0, v25

    int-to-long v4, v0

    move-object/from16 v0, v28

    iput-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1568
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v28

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1569
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v28

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1570
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v28

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 1573
    move-object/from16 v0, p0

    move-object/from16 v1, v44

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1576
    packed-switch v25, :pswitch_data_2

    .line 1582
    :goto_3
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v28

    iget-wide v11, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v28

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1583
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move-object/from16 v0, v28

    iget-wide v11, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v28

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1585
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "loadWorkspace sBgItemsIdMap.put = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v28

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1579
    :pswitch_4
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1590
    .end local v25           #container:I
    .end local v28           #folderInfo:Lcom/android/launcher2/FolderInfo;
    .end local v30           #id:J
    :pswitch_5
    move/from16 v0, v20

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 1591
    .local v19, appWidgetId:I
    move/from16 v0, v32

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    .line 1593
    .restart local v30       #id:J
    move-object/from16 v0, v52

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v45

    .line 1596
    .local v45, provider:Landroid/appwidget/AppWidgetProviderInfo;
    if-nez v36, :cond_5

    if-eqz v45, :cond_4

    move-object/from16 v0, v45

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    if-eqz v4, :cond_4

    move-object/from16 v0, v45

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5

    .line 1598
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleting widget that isn\'t installed anymore: id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v30

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " appWidgetId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v41

    .line 1600
    .local v41, log:Ljava/lang/String;
    const-string v4, "Launcher.Model"

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1601
    sget-object v4, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    move-object/from16 v0, v41

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1602
    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1604
    .end local v41           #log:Ljava/lang/String;
    :cond_5
    new-instance v21, Lcom/android/launcher2/LauncherAppWidgetInfo;

    move-object/from16 v0, v45

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-direct {v0, v1, v4}, Lcom/android/launcher2/LauncherAppWidgetInfo;-><init>(ILandroid/content/ComponentName;)V

    .line 1606
    .local v21, appWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;
    move-wide/from16 v0, v30

    move-object/from16 v2, v21

    iput-wide v0, v2, Lcom/android/launcher2/ItemInfo;->id:J

    .line 1607
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1608
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1609
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 1610
    move/from16 v0, v48

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1611
    move/from16 v0, v49

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 1612
    move-object/from16 v0, v45

    invoke-static {v13, v0}, Lcom/android/launcher2/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v43

    .line 1613
    .local v43, minSpan:[I
    const/4 v4, 0x0

    aget v4, v43, v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 1614
    const/4 v4, 0x1

    aget v4, v43, v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 1616
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1617
    .restart local v25       #container:I
    const/16 v4, -0x64

    move/from16 v0, v25

    if-eq v0, v4, :cond_6

    const/16 v4, -0x65

    move/from16 v0, v25

    if-eq v0, v4, :cond_6

    .line 1619
    const-string v4, "Launcher.Model"

    const-string v5, "Widget found where container != CONTAINER_DESKTOP nor CONTAINER_HOTSEAT - ignoring!"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1623
    :cond_6
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v0, v21

    iput-wide v4, v0, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1626
    move-object/from16 v0, p0

    move-object/from16 v1, v44

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1629
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v21

    iget-wide v11, v0, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1630
    sget-object v4, Lcom/android/launcher2/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_0

    .line 1639
    .end local v19           #appWidgetId:I
    .end local v21           #appWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;
    .end local v25           #container:I
    .end local v30           #id:J
    .end local v37           #itemType:I
    .end local v43           #minSpan:[I
    .end local v45           #provider:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_7
    :try_start_8
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1642
    invoke-virtual/range {v39 .. v39}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_8

    .line 1643
    sget-object v4, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object v24

    .line 1646
    .local v24, client:Landroid/content/ContentProviderClient;
    invoke-virtual/range {v39 .. v39}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v29

    .local v29, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v30

    .line 1648
    .restart local v30       #id:J
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removed id = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v30

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 1652
    const/4 v4, 0x0

    :try_start_9
    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4}, Lcom/android/launcher2/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v0, v4, v5, v7}, Landroid/content/ContentProviderClient;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_2

    goto :goto_4

    .line 1654
    :catch_2
    move-exception v27

    .line 1655
    .local v27, e:Landroid/os/RemoteException;
    :try_start_a
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not remove id = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v30

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 1661
    .end local v24           #client:Landroid/content/ContentProviderClient;
    .end local v27           #e:Landroid/os/RemoteException;
    .end local v29           #i$:Ljava/util/Iterator;
    .end local v30           #id:J
    :cond_8
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "loaded workspace in "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    sub-long v11, v11, v50

    invoke-virtual {v5, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "ms"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1662
    const-string v4, "Launcher.Model"

    const-string v5, "workspace layout: "

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1663
    const/16 v54, 0x0

    .local v54, y:I
    :goto_5
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->access$1100()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_d

    .line 1664
    const-string v40, ""

    .line 1665
    .local v40, line:Ljava/lang/String;
    const/16 v46, 0x0

    .local v46, s:I
    :goto_6
    const/4 v4, 0x5

    move/from16 v0, v46

    if-ge v0, v4, :cond_c

    .line 1666
    if-lez v46, :cond_9

    .line 1667
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " | "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    .line 1669
    :cond_9
    const/16 v53, 0x0

    .local v53, x:I
    :goto_7
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->access$1000()I

    move-result v4

    move/from16 v0, v53

    if-ge v0, v4, :cond_b

    .line 1670
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v4, v44, v46

    aget-object v4, v4, v53

    aget-object v4, v4, v54

    if-eqz v4, :cond_a

    const-string v4, "#"

    :goto_8
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    .line 1669
    add-int/lit8 v53, v53, 0x1

    goto :goto_7

    .line 1670
    :cond_a
    const-string v4, "."

    goto :goto_8

    .line 1665
    :cond_b
    add-int/lit8 v46, v46, 0x1

    goto :goto_6

    .line 1673
    .end local v53           #x:I
    :cond_c
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[ "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v40

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " ]"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1663
    add-int/lit8 v54, v54, 0x1

    goto :goto_5

    .line 1676
    .end local v40           #line:Ljava/lang/String;
    .end local v46           #s:I
    :cond_d
    monitor-exit v55
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 1677
    return-void

    .line 1486
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_5
    .end packed-switch

    .line 1531
    :pswitch_data_1
    .packed-switch -0x65
        :pswitch_2
        :pswitch_2
    .end packed-switch

    .line 1576
    :pswitch_data_2
    .packed-switch -0x65
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private onlyBindAllApps()V
    .locals 7

    .prologue
    .line 1998
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v4}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/LauncherModel$Callbacks;

    .line 1999
    .local v2, oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-nez v2, :cond_0

    .line 2001
    const-string v4, "Launcher.Model"

    const-string v5, "LoaderTask running with no launcher (onlyBindAllApps)"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2032
    :goto_0
    return-void

    .line 2006
    :cond_0
    const-string v4, "Launcher.Model"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onlyBindAllApps: oldCallbacks ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2011
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mBgAllAppsList:Lcom/android/launcher2/AllAppsList;
    invoke-static {v4}, Lcom/android/launcher2/LauncherModel;->access$1600(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/AllAppsList;

    move-result-object v4

    iget-object v4, v4, Lcom/android/launcher2/AllAppsList;->data:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 2013
    .local v1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    new-instance v3, Lcom/android/launcher2/LauncherModel$LoaderTask$10;

    invoke-direct {v3, p0, v2, v1}, Lcom/android/launcher2/LauncherModel$LoaderTask$10;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;Ljava/util/ArrayList;)V

    .line 2026
    .local v3, r:Ljava/lang/Runnable;
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->access$1700()Landroid/os/HandlerThread;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v4

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v5

    if-eq v4, v5, :cond_1

    const/4 v0, 0x1

    .line 2027
    .local v0, isRunningOnMainThread:Z
    :goto_1
    invoke-interface {v2}, Lcom/android/launcher2/LauncherModel$Callbacks;->isAllAppsVisible()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v0, :cond_2

    .line 2028
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 2026
    .end local v0           #isRunningOnMainThread:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 2030
    .restart local v0       #isRunningOnMainThread:Z
    :cond_2
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mHandler:Lcom/android/launcher2/DeferredHandler;
    invoke-static {v4}, Lcom/android/launcher2/LauncherModel;->access$200(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/DeferredHandler;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/android/launcher2/DeferredHandler;->post(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1783
    .local p1, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    new-instance v0, Lcom/android/launcher2/LauncherModel$LoaderTask$3;

    invoke-direct {v0, p0}, Lcom/android/launcher2/LauncherModel$LoaderTask$3;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1797
    return-void
.end method

.method private waitForIdle()V
    .locals 6

    .prologue
    .line 1156
    monitor-enter p0

    .line 1157
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1159
    .local v0, workspaceWaitTime:J
    const-string v2, "Launcher.Model"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waitForIdle start, workspaceWaitTime : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ms, Thread priority :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getPriority()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", this = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mHandler:Lcom/android/launcher2/DeferredHandler;
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$200(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/DeferredHandler;

    move-result-object v2

    new-instance v3, Lcom/android/launcher2/LauncherModel$LoaderTask$1;

    invoke-direct {v3, p0}, Lcom/android/launcher2/LauncherModel$LoaderTask$1;-><init>(Lcom/android/launcher2/LauncherModel$LoaderTask;)V

    invoke-virtual {v2, v3}, Lcom/android/launcher2/DeferredHandler;->postIdle(Ljava/lang/Runnable;)V

    .line 1175
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 1177
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1178
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1183
    :cond_0
    :try_start_2
    const-string v2, "Launcher.Model"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waited "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ms for previous step to finish binding, mStopped = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",mLoadAndBindStepFinished = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1187
    monitor-exit p0

    .line 1188
    return-void

    .line 1187
    .end local v0           #workspaceWaitTime:J
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method


# virtual methods
.method public dumpState()V
    .locals 4

    .prologue
    .line 2163
    sget-object v1, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2164
    :try_start_0
    const-string v0, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mContext="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2165
    const-string v0, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mIsLaunching="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2166
    const-string v0, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mStopped="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2167
    const-string v0, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mLoadAndBindStepFinished="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2168
    const-string v0, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mItems size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/android/launcher2/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2169
    monitor-exit v1

    .line 2170
    return-void

    .line 2169
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method isLaunching()Z
    .locals 1

    .prologue
    .line 1122
    iget-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    return v0
.end method

.method isLoadingWorkspace()Z
    .locals 1

    .prologue
    .line 1126
    iget-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    return v0
.end method

.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/16 v6, 0xa

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1234
    iget-object v7, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    .line 1236
    :try_start_0
    const-string v8, "Launcher.Model"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Set load task running flag >>>>, mIsLaunching = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ",this = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1239
    iget-object v8, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v9, 0x1

    #setter for: Lcom/android/launcher2/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v8, v9}, Lcom/android/launcher2/LauncherModel;->access$402(Lcom/android/launcher2/LauncherModel;Z)Z

    .line 1240
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1244
    iget-object v7, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v7}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/LauncherModel$Callbacks;

    .line 1245
    .local v1, cbk:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/android/launcher2/LauncherModel$Callbacks;->isAllAppsVisible()Z

    move-result v7

    if-nez v7, :cond_1

    .line 1250
    .local v4, loadWorkspaceFirst:Z
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 1251
    :try_start_1
    const-string v9, "Launcher.Model"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setting thread priority to "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v7, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    if-eqz v7, :cond_2

    const-string v7, "DEFAULT"

    :goto_1
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    iget-boolean v7, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    if-eqz v7, :cond_3

    :goto_2
    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1255
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1256
    if-eqz v4, :cond_4

    .line 1257
    const-string v5, "Launcher.Model"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "step 1: loading workspace this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1258
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadAndBindWorkspace()V

    .line 1264
    :goto_3
    iget-boolean v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v5, :cond_5

    .line 1265
    const-string v5, "Launcher.Model"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LoadTask break in the middle, this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    :goto_4
    const-string v5, "Launcher.Model"

    const-string v6, "Comparing loaded icons to database icons"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1297
    sget-object v7, Lcom/android/launcher2/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v7

    .line 1298
    :try_start_2
    sget-object v5, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1299
    .local v3, key:Ljava/lang/Object;
    iget-object v8, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    iget-object v9, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object v0, v3

    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    move-object v5, v0

    sget-object v6, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    invoke-virtual {v8, v9, v5, v6}, Lcom/android/launcher2/LauncherModel;->updateSavedIcon(Landroid/content/Context;Lcom/android/launcher2/ShortcutInfo;[B)V

    goto :goto_5

    .line 1302
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #key:Ljava/lang/Object;
    :catchall_0
    move-exception v5

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 1240
    .end local v1           #cbk:Lcom/android/launcher2/LauncherModel$Callbacks;
    .end local v4           #loadWorkspaceFirst:Z
    :catchall_1
    move-exception v5

    :try_start_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5

    .restart local v1       #cbk:Lcom/android/launcher2/LauncherModel$Callbacks;
    :cond_1
    move v4, v5

    .line 1245
    goto/16 :goto_0

    .line 1251
    .restart local v4       #loadWorkspaceFirst:Z
    :cond_2
    :try_start_4
    const-string v7, "BACKGROUND"

    goto/16 :goto_1

    :cond_3
    move v5, v6

    .line 1253
    goto :goto_2

    .line 1255
    :catchall_2
    move-exception v5

    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v5

    .line 1260
    :cond_4
    const-string v5, "Launcher.Model"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "step 1: special: loading all apps this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1261
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadAndBindAllApps()V

    goto :goto_3

    .line 1271
    :cond_5
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1272
    :try_start_5
    iget-boolean v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLaunching:Z

    if-eqz v5, :cond_6

    .line 1273
    const-string v5, "Launcher.Model"

    const-string v7, "Setting thread priority to BACKGROUND"

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1274
    const/16 v5, 0xa

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1276
    :cond_6
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 1277
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->waitForIdle()V

    .line 1280
    if-eqz v4, :cond_7

    .line 1281
    const-string v5, "Launcher.Model"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "step 2: loading all apps this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1282
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadAndBindAllApps()V

    .line 1289
    :goto_6
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1290
    const/4 v5, 0x0

    :try_start_6
    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1291
    monitor-exit v6

    goto/16 :goto_4

    :catchall_3
    move-exception v5

    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v5

    .line 1276
    :catchall_4
    move-exception v5

    :try_start_7
    monitor-exit v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    throw v5

    .line 1284
    :cond_7
    const-string v5, "Launcher.Model"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "step 2: special: loading workspace this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1285
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->loadAndBindWorkspace()V

    goto :goto_6

    .line 1301
    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_8
    :try_start_8
    sget-object v5, Lcom/android/launcher2/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 1302
    monitor-exit v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1306
    iput-object v11, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1308
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1310
    :try_start_9
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLoaderTask:Lcom/android/launcher2/LauncherModel$LoaderTask;
    invoke-static {v5}, Lcom/android/launcher2/LauncherModel;->access$700(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/LauncherModel$LoaderTask;

    move-result-object v5

    if-ne v5, p0, :cond_9

    .line 1311
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v7, 0x0

    #setter for: Lcom/android/launcher2/LauncherModel;->mLoaderTask:Lcom/android/launcher2/LauncherModel$LoaderTask;
    invoke-static {v5, v7}, Lcom/android/launcher2/LauncherModel;->access$702(Lcom/android/launcher2/LauncherModel;Lcom/android/launcher2/LauncherModel$LoaderTask;)Lcom/android/launcher2/LauncherModel$LoaderTask;

    .line 1314
    :cond_9
    const-string v5, "Launcher.Model"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Reset load task running flag <<<<, this = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1316
    iget-object v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    const/4 v7, 0x0

    #setter for: Lcom/android/launcher2/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v5, v7}, Lcom/android/launcher2/LauncherModel;->access$402(Lcom/android/launcher2/LauncherModel;Z)Z

    .line 1317
    monitor-exit v6

    .line 1318
    return-void

    .line 1317
    :catchall_5
    move-exception v5

    monitor-exit v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    throw v5
.end method

.method runBindSynchronousPage(I)V
    .locals 3
    .parameter "synchronousBindPage"

    .prologue
    .line 1192
    const-string v0, "Launcher.Model"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "runBindSynchronousPage: mAllAppsLoaded = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$300(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mWorkspaceLoaded = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$000(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",synchronousBindPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mIsLoaderTaskRunning = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$400(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mStopped = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1198
    if-gez p1, :cond_0

    .line 1200
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Should not call runBindSynchronousPage() without valid page index"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1203
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$300(Lcom/android/launcher2/LauncherModel;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$000(Lcom/android/launcher2/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1206
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Expecting AllApps and Workspace to be loaded"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1208
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1209
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$400(Lcom/android/launcher2/LauncherModel;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1212
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Error! Background loading is already running"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1214
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1223
    iget-object v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mHandler:Lcom/android/launcher2/DeferredHandler;
    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->access$200(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/DeferredHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/DeferredHandler;->flush()V

    .line 1227
    invoke-direct {p0, p1}, Lcom/android/launcher2/LauncherModel$LoaderTask;->bindWorkspace(I)V

    .line 1230
    invoke-direct {p0}, Lcom/android/launcher2/LauncherModel$LoaderTask;->onlyBindAllApps()V

    .line 1231
    return-void
.end method

.method public stopLocked()V
    .locals 3

    .prologue
    .line 1321
    monitor-enter p0

    .line 1322
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    .line 1323
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 1324
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1326
    const-string v0, "Launcher.Model"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopLocked completed, this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mLoaderTask = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLoaderTask:Lcom/android/launcher2/LauncherModel$LoaderTask;
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$700(Lcom/android/launcher2/LauncherModel;)Lcom/android/launcher2/LauncherModel$LoaderTask;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mIsLoaderTaskRunning = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$400(Lcom/android/launcher2/LauncherModel;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1330
    return-void

    .line 1324
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method tryGetCallbacks(Lcom/android/launcher2/LauncherModel$Callbacks;)Lcom/android/launcher2/LauncherModel$Callbacks;
    .locals 5
    .parameter "oldCallbacks"

    .prologue
    const/4 v1, 0x0

    .line 1340
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/launcher2/LauncherModel;->access$500(Lcom/android/launcher2/LauncherModel;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1341
    :try_start_0
    iget-boolean v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v3, :cond_0

    .line 1342
    const-string v3, "Launcher.Model"

    const-string v4, "tryGetCallbacks returned null by stop flag."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1343
    monitor-exit v2

    move-object v0, v1

    .line 1359
    :goto_0
    return-object v0

    .line 1346
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1347
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1350
    :cond_1
    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask;->this$0:Lcom/android/launcher2/LauncherModel;

    #getter for: Lcom/android/launcher2/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/android/launcher2/LauncherModel;->access$600(Lcom/android/launcher2/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherModel$Callbacks;

    .line 1351
    .local v0, callbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-eq v0, p1, :cond_2

    .line 1352
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1354
    :cond_2
    if-nez v0, :cond_3

    .line 1355
    const-string v3, "Launcher.Model"

    const-string v4, "no mCallbacks"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1356
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1359
    :cond_3
    monitor-exit v2

    goto :goto_0

    .line 1360
    .end local v0           #callbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
