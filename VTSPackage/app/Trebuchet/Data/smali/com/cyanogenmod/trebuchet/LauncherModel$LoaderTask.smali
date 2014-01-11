.class Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;
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

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel;Landroid/content/Context;Z)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter "isLaunching"

    .prologue
    .line 998
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 999
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1000
    iput-boolean p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLaunching:Z

    .line 1001
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    .line 1002
    return-void
.end method

.method static synthetic access$102(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 989
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z

    return p1
.end method

.method static synthetic access$1502(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 989
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    return p1
.end method

.method private bindWorkspace(I)V
    .locals 26
    .parameter "synchronizeBindPage"

    .prologue
    .line 1801
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v23

    .line 1806
    .local v23, t:J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 1807
    .local v11, oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-nez v11, :cond_0

    .line 1809
    const-string v4, "Trebuchet.LauncherModel"

    const-string v10, "LoaderTask running with no launcher"

    invoke-static {v4, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1905
    :goto_0
    return-void

    .line 1813
    :cond_0
    const/4 v4, -0x1

    move/from16 v0, p1

    if-le v0, v4, :cond_2

    const/16 v21, 0x1

    .line 1814
    .local v21, isLoadingSynchronously:Z
    :goto_1
    if-eqz v21, :cond_3

    move/from16 v5, p1

    .line 1819
    .local v5, currentScreen:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->unbindWorkspaceItemsOnMainThread()V

    .line 1820
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 1821
    .local v25, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 1823
    .local v20, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 1824
    .local v7, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1825
    .local v6, itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    sget-object v10, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v10

    .line 1826
    :try_start_0
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1827
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1828
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1829
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1830
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1832
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1833
    .local v12, currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 1834
    .local v16, otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1836
    .local v13, currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 1838
    .local v17, otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 1839
    .local v8, currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 1842
    .local v9, otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    invoke-direct {v0, v5, v1, v12, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->filterCurrentWorkspaceItems(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1844
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-direct {v0, v5, v1, v13, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->filterCurrentAppWidgets(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    move-object/from16 v4, p0

    .line 1846
    invoke-direct/range {v4 .. v9}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->filterCurrentFolders(ILjava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 1848
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V

    .line 1849
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V

    .line 1852
    new-instance v22, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$7;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$7;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)V

    .line 1860
    .local v22, r:Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v0, v22

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v4, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    .line 1863
    const/4 v15, 0x0

    move-object/from16 v10, p0

    move-object v14, v8

    invoke-direct/range {v10 .. v15}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->bindWorkspaceItems(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1865
    if-eqz v21, :cond_1

    .line 1866
    new-instance v22, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;

    .end local v22           #r:Ljava/lang/Runnable;
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v5}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$8;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;I)V

    .line 1874
    .restart local v22       #r:Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v0, v22

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v4, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    .line 1879
    :cond_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1880
    if-eqz v21, :cond_4

    sget-object v19, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    :goto_3
    move-object/from16 v14, p0

    move-object v15, v11

    move-object/from16 v18, v9

    invoke-direct/range {v14 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->bindWorkspaceItems(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1884
    new-instance v22, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$9;

    .end local v22           #r:Ljava/lang/Runnable;
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-wide/from16 v2, v23

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$9;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;J)V

    .line 1900
    .restart local v22       #r:Ljava/lang/Runnable;
    if-eqz v21, :cond_5

    .line 1901
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1813
    .end local v5           #currentScreen:I
    .end local v6           #itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .end local v7           #folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .end local v8           #currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .end local v9           #otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .end local v12           #currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .end local v13           #currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .end local v16           #otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .end local v17           #otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .end local v20           #appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .end local v21           #isLoadingSynchronously:Z
    .end local v22           #r:Ljava/lang/Runnable;
    .end local v25           #workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    :cond_2
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 1814
    .restart local v21       #isLoadingSynchronously:Z
    :cond_3
    invoke-interface {v11}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->getCurrentWorkspaceScreen()I

    move-result v5

    goto/16 :goto_2

    .line 1830
    .restart local v5       #currentScreen:I
    .restart local v6       #itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .restart local v7       #folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .restart local v20       #appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .restart local v25       #workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 1880
    .restart local v8       #currentFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .restart local v9       #otherFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .restart local v12       #currentWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .restart local v13       #currentAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .restart local v16       #otherWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .restart local v17       #otherAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .restart local v22       #r:Ljava/lang/Runnable;
    :cond_4
    const/16 v19, 0x0

    goto :goto_3

    .line 1903
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v0, v22

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v4, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method

.method private bindWorkspaceItems(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 10
    .parameter "oldCallbacks"
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1735
    .local p2, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .local p3, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .local p4, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .local p5, deferredBindRunnables:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Runnable;>;"
    if-eqz p5, :cond_0

    const/4 v8, 0x1

    .line 1737
    .local v8, postOnMainThread:Z
    :goto_0
    invoke-direct {p0, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->removeHiddenAppsWorkspaceItems(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;)V

    .line 1740
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1741
    .local v6, N:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    if-ge v7, v6, :cond_3

    .line 1742
    move v4, v7

    .line 1743
    .local v4, start:I
    add-int/lit8 v1, v7, 0x6

    if-gt v1, v6, :cond_1

    const/4 v5, 0x6

    .line 1744
    .local v5, chunkSize:I
    :goto_2
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$4;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;II)V

    .line 1753
    .local v0, r:Ljava/lang/Runnable;
    if-eqz v8, :cond_2

    .line 1754
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1741
    :goto_3
    add-int/lit8 v7, v7, 0x6

    goto :goto_1

    .line 1735
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v4           #start:I
    .end local v5           #chunkSize:I
    .end local v6           #N:I
    .end local v7           #i:I
    .end local v8           #postOnMainThread:Z
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 1743
    .restart local v4       #start:I
    .restart local v6       #N:I
    .restart local v7       #i:I
    .restart local v8       #postOnMainThread:Z
    :cond_1
    sub-int v5, v6, v7

    goto :goto_2

    .line 1756
    .restart local v0       #r:Ljava/lang/Runnable;
    .restart local v5       #chunkSize:I
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v1, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    goto :goto_3

    .line 1761
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v4           #start:I
    .end local v5           #chunkSize:I
    :cond_3
    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1762
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$5;

    invoke-direct {v0, p0, p1, p4}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$5;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/HashMap;)V

    .line 1770
    .restart local v0       #r:Ljava/lang/Runnable;
    if-eqz v8, :cond_5

    .line 1771
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1778
    .end local v0           #r:Ljava/lang/Runnable;
    :cond_4
    :goto_4
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1779
    const/4 v7, 0x0

    :goto_5
    if-ge v7, v6, :cond_7

    .line 1780
    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 1781
    .local v9, widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$6;

    invoke-direct {v0, p0, p1, v9}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$6;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V

    .line 1789
    .restart local v0       #r:Ljava/lang/Runnable;
    if-eqz v8, :cond_6

    .line 1790
    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1779
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 1773
    .end local v9           #widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    :cond_5
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v1, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    goto :goto_4

    .line 1792
    .restart local v9       #widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    :cond_6
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V
    invoke-static {v1, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V

    goto :goto_6

    .line 1795
    .end local v0           #r:Ljava/lang/Runnable;
    .end local v9           #widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    :cond_7
    return-void
.end method

.method private checkItemPlacement([[[Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)Z
    .locals 8
    .parameter "occupied"
    .parameter "item"

    .prologue
    const/4 v3, 0x1

    .line 1222
    iget v0, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 1223
    .local v0, containerIndex:I
    iget-wide v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v6, -0x65

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 1224
    add-int/lit8 v0, v0, 0x7

    .line 1231
    :cond_0
    iget v1, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .local v1, x:I
    :goto_0
    iget v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v5, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    add-int/2addr v4, v5

    if-ge v1, v4, :cond_5

    .line 1232
    iget v2, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .local v2, y:I
    :goto_1
    iget v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iget v5, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_4

    .line 1233
    aget-object v4, p1, v0

    aget-object v4, v4, v1

    aget-object v4, v4, v2

    if-eqz v4, :cond_3

    .line 1234
    const-string v3, "Trebuchet.LauncherModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error loading shortcut "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " into cell ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") occupied by "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p1, v0

    aget-object v5, v5, v1

    aget-object v5, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1239
    const/4 v3, 0x0

    .line 1249
    .end local v1           #x:I
    .end local v2           #y:I
    :cond_1
    :goto_2
    return v3

    .line 1225
    :cond_2
    iget-wide v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v6, -0x64

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    goto :goto_2

    .line 1232
    .restart local v1       #x:I
    .restart local v2       #y:I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1231
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1243
    .end local v2           #y:I
    :cond_5
    iget v1, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    :goto_3
    iget v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v5, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    add-int/2addr v4, v5

    if-ge v1, v4, :cond_1

    .line 1244
    iget v2, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .restart local v2       #y:I
    :goto_4
    iget v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iget v5, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_6

    .line 1245
    aget-object v4, p1, v0

    aget-object v4, v4, v1

    aput-object p2, v4, v2

    .line 1244
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1243
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
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
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1592
    .local p2, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .local p3, currentScreenWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .local p4, otherScreenWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    if-gez p1, :cond_0

    .line 1593
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1596
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

    check-cast v1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 1597
    .local v1, widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    if-eqz v1, :cond_1

    .line 1598
    iget-wide v2, v1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->container:J

    const-wide/16 v4, -0x64

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    iget v2, v1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->screen:I

    if-ne v2, p1, :cond_2

    .line 1600
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1602
    :cond_2
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1605
    .end local v1           #widget:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
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
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1615
    .local p2, itemsIdMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .local p3, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .local p4, currentScreenFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    .local p5, otherScreenFolders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    if-gez p1, :cond_0

    .line 1616
    invoke-virtual {p4, p3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1619
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

    .line 1620
    .local v2, id:J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1621
    .local v4, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 1622
    .local v0, folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    if-eqz v4, :cond_1

    if-eqz v0, :cond_1

    .line 1623
    iget-wide v5, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v7, -0x64

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    iget v5, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    if-ne v5, p1, :cond_2

    .line 1625
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1627
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p5, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1630
    .end local v0           #folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v2           #id:J
    .end local v4           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
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
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1539
    .local p2, allWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .local p3, currentScreenItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .local p4, otherScreenItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1540
    .local v4, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1541
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1542
    .local v0, i:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-nez v0, :cond_0

    .line 1543
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 1549
    .end local v0           #i:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_1
    if-gez p1, :cond_2

    .line 1550
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1556
    :cond_2
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1557
    .local v3, itemsOnScreen:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Long;>;"
    new-instance v5, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$2;

    invoke-direct {v5, p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$2;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)V

    invoke-static {p2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1563
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1564
    .local v2, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v7, -0x64

    cmp-long v5, v5, v7

    if-nez v5, :cond_4

    .line 1565
    iget v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    if-ne v5, p1, :cond_3

    .line 1566
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1567
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1569
    :cond_3
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1571
    :cond_4
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v7, -0x65

    cmp-long v5, v5, v7

    if-nez v5, :cond_5

    .line 1572
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1573
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1575
    :cond_5
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1576
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1577
    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1579
    :cond_6
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1583
    .end local v2           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_7
    return-void
.end method

.method private loadAllAppsByBatch()V
    .locals 22

    .prologue
    .line 1958
    const-wide/16 v16, 0x0

    .line 1962
    .local v16, t:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 1963
    .local v10, oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-nez v10, :cond_1

    .line 1965
    const-string v18, "Trebuchet.LauncherModel"

    const-string v19, "LoaderTask running with no launcher (loadAllAppsByBatch)"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2031
    :cond_0
    :goto_0
    return-void

    .line 1969
    :cond_1
    new-instance v9, Landroid/content/Intent;

    const-string v18, "android.intent.action.MAIN"

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v9, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1970
    .local v9, mainIntent:Landroid/content/Intent;
    const-string v18, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1972
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/AllAppsList;->clear()V

    .line 1973
    const-wide/16 v12, 0x0

    .line 1975
    .local v12, qiaTime:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    .line 1976
    .local v11, packageManager:Landroid/content/pm/PackageManager;
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v11, v9, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 1982
    .local v5, apps:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v5, :cond_0

    .line 1985
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    .line 1989
    .local v3, N:I
    if-eqz v3, :cond_0

    .line 1994
    const-wide/16 v14, 0x0

    .line 1995
    .local v14, sortTime:J
    new-instance v18, Lcom/cyanogenmod/trebuchet/LauncherModel$ShortcutNameComparator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v11, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$ShortcutNameComparator;-><init>(Landroid/content/pm/PackageManager;Ljava/util/HashMap;)V

    move-object/from16 v0, v18

    invoke-static {v5, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 2002
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/ResolveInfo;

    .line 2004
    .local v8, info:Landroid/content/pm/ResolveInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v18

    new-instance v19, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v20, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;
    invoke-static/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1800(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/IconCache;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v11, v8, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;-><init>(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;Lcom/cyanogenmod/trebuchet/IconCache;Ljava/util/HashMap;)V

    invoke-virtual/range {v18 .. v19}, Lcom/cyanogenmod/trebuchet/AllAppsList;->add(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V

    goto :goto_1

    .line 2008
    .end local v8           #info:Landroid/content/pm/ResolveInfo;
    :cond_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->tryGetCallbacks(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    move-result-object v6

    .line 2009
    .local v6, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    .line 2010
    .local v4, added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v18

    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    iput-object v0, v1, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    .line 2012
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v18, v0

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static/range {v18 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v18

    new-instance v19, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6, v4}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$11;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;)V

    invoke-virtual/range {v18 .. v19}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method

.method private loadAndBindAllApps()V
    .locals 2

    .prologue
    .line 1911
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$300(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1912
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAllAppsByBatch()V

    .line 1913
    monitor-enter p0

    .line 1914
    :try_start_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v0, :cond_0

    .line 1915
    monitor-exit p0

    .line 1922
    :goto_0
    return-void

    .line 1917
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v1, 0x1

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$302(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z

    .line 1918
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1920
    :cond_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->onlyBindAllApps()V

    goto :goto_0
.end method

.method private loadAndBindWorkspace()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1013
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    .line 1020
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$000(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1021
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadWorkspace()V

    .line 1022
    monitor-enter p0

    .line 1023
    :try_start_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v0, :cond_0

    .line 1024
    monitor-exit p0

    .line 1032
    :goto_0
    return-void

    .line 1026
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v1, 0x1

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$002(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z

    .line 1027
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1031
    :cond_1
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->bindWorkspace(I)V

    goto :goto_0

    .line 1027
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private loadWorkspace()V
    .locals 54

    .prologue
    .line 1253
    const-wide/16 v50, 0x0

    .line 1255
    .local v50, t:J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1256
    .local v13, context:Landroid/content/Context;
    invoke-virtual {v13}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 1257
    .local v3, contentResolver:Landroid/content/ContentResolver;
    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v43

    .line 1258
    .local v43, manager:Landroid/content/pm/PackageManager;
    invoke-static {v13}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v52

    .line 1259
    .local v52, widgets:Landroid/appwidget/AppWidgetManager;
    invoke-virtual/range {v43 .. v43}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    move-result v38

    .line 1262
    .local v38, isSafeMode:Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$800(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/LauncherApplication;

    move-result-object v4

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getLauncherProvider()Lcom/cyanogenmod/trebuchet/LauncherProvider;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->loadDefaultFavoritesIfNecessary(I)V

    .line 1264
    sget-object v53, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v53

    .line 1265
    :try_start_0
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1266
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1267
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1268
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1269
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 1271
    new-instance v41, Ljava/util/ArrayList;

    invoke-direct/range {v41 .. v41}, Ljava/util/ArrayList;-><init>()V

    .line 1273
    .local v41, itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1278
    .local v8, c:Landroid/database/Cursor;
    const/16 v4, 0xa

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$900()I

    move-result v5

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1000()I

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1100()I

    move-result v7

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1000()I

    move-result v11

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    filled-new-array {v4, v5, v7}, [I

    move-result-object v4

    const-class v5, Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v45

    check-cast v45, [[[Lcom/cyanogenmod/trebuchet/ItemInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1283
    .local v45, occupied:[[[Lcom/cyanogenmod/trebuchet/ItemInfo;
    :try_start_1
    const-string v4, "_id"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v33

    .line 1284
    .local v33, idIndex:I
    const-string v4, "intent"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v37

    .line 1286
    .local v37, intentIndex:I
    const-string v4, "title"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 1288
    .local v10, titleIndex:I
    const-string v4, "iconType"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 1290
    .local v14, iconTypeIndex:I
    const-string v4, "icon"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 1291
    .local v9, iconIndex:I
    const-string v4, "iconPackage"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 1293
    .local v15, iconPackageIndex:I
    const-string v4, "iconResource"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    .line 1295
    .local v16, iconResourceIndex:I
    const-string v4, "container"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v26

    .line 1297
    .local v26, containerIndex:I
    const-string v4, "itemType"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v40

    .line 1299
    .local v40, itemTypeIndex:I
    const-string v4, "appWidgetId"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v20

    .line 1301
    .local v20, appWidgetIdIndex:I
    const-string v4, "screen"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v47

    .line 1303
    .local v47, screenIndex:I
    const-string v4, "cellX"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    .line 1305
    .local v22, cellXIndex:I
    const-string v4, "cellY"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v23

    .line 1307
    .local v23, cellYIndex:I
    const-string v4, "spanX"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v48

    .line 1309
    .local v48, spanXIndex:I
    const-string v4, "spanY"

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v49

    .line 1317
    .local v49, spanYIndex:I
    const/4 v6, 0x0

    .line 1319
    .local v6, intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-nez v4, :cond_9

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-eqz v4, :cond_9

    .line 1321
    :try_start_2
    move/from16 v0, v40

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v39

    .line 1323
    .local v39, itemType:I
    packed-switch v39, :pswitch_data_0

    goto :goto_0

    .line 1326
    :pswitch_0
    move/from16 v0, v37

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v36

    .line 1328
    .local v36, intentDescription:Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_3
    move-object/from16 v0, v36

    invoke-static {v0, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v6

    .line 1335
    .end local v36           #intentDescription:Ljava/lang/String;
    :pswitch_1
    if-nez v39, :cond_2

    .line 1336
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLabelCache:Ljava/util/HashMap;

    move-object/from16 v5, v43

    move-object v7, v13

    invoke-virtual/range {v4 .. v11}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;Landroid/database/Cursor;IILjava/util/HashMap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v34

    .line 1371
    .local v34, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    :goto_1
    if-eqz v34, :cond_5

    .line 1372
    move-object/from16 v0, v34

    iput-object v6, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 1373
    move/from16 v0, v33

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    move-object/from16 v0, v34

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    .line 1374
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1375
    .local v25, container:I
    move/from16 v0, v25

    int-to-long v4, v0

    move-object/from16 v0, v34

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    .line 1376
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v34

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->screen:I

    .line 1377
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v34

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1378
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v34

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 1381
    move-object/from16 v0, p0

    move-object/from16 v1, v45

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1385
    packed-switch v25, :pswitch_data_1

    .line 1392
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move/from16 v0, v25

    int-to-long v11, v0

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-static {v4, v11, v12}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1300(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v29

    .line 1394
    .local v29, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    move-object/from16 v0, v29

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderInfo;->add(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1397
    .end local v29           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    :goto_2
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v34

    iget-wide v11, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v34

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1401
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    move-object/from16 v0, v34

    invoke-virtual {v4, v5, v0, v8, v9}, Lcom/cyanogenmod/trebuchet/LauncherModel;->queueIconToBeChecked(Ljava/util/HashMap;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/database/Cursor;I)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 1487
    .end local v25           #container:I
    .end local v34           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v39           #itemType:I
    :catch_0
    move-exception v27

    .line 1488
    .local v27, e:Ljava/lang/Exception;
    :goto_3
    :try_start_5
    const-string v4, "Trebuchet.LauncherModel"

    const-string v5, "Desktop items loading interrupted:"

    move-object/from16 v0, v27

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 1492
    .end local v6           #intent:Landroid/content/Intent;
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
    .end local v33           #idIndex:I
    .end local v37           #intentIndex:I
    .end local v40           #itemTypeIndex:I
    .end local v47           #screenIndex:I
    .end local v48           #spanXIndex:I
    .end local v49           #spanYIndex:I
    :catchall_0
    move-exception v4

    :try_start_6
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v4

    .line 1529
    .end local v8           #c:Landroid/database/Cursor;
    .end local v41           #itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .end local v45           #occupied:[[[Lcom/cyanogenmod/trebuchet/ItemInfo;
    :catchall_1
    move-exception v4

    monitor-exit v53
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v4

    .line 1329
    .restart local v6       #intent:Landroid/content/Intent;
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
    .restart local v33       #idIndex:I
    .restart local v36       #intentDescription:Ljava/lang/String;
    .restart local v37       #intentIndex:I
    .restart local v39       #itemType:I
    .restart local v40       #itemTypeIndex:I
    .restart local v41       #itemsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .restart local v45       #occupied:[[[Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v47       #screenIndex:I
    .restart local v48       #spanXIndex:I
    .restart local v49       #spanYIndex:I
    :catch_1
    move-exception v27

    .local v27, e:Ljava/net/URISyntaxException;
    goto/16 :goto_0

    .line 1338
    .end local v27           #e:Ljava/net/URISyntaxException;
    .end local v36           #intentDescription:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x1

    move/from16 v0, v39

    if-ne v0, v4, :cond_3

    .line 1339
    :try_start_7
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object v12, v8

    move/from16 v17, v9

    move/from16 v18, v10

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-static/range {v11 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1200(Lcom/cyanogenmod/trebuchet/LauncherModel;Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v34

    .line 1346
    .restart local v34       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
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

    .line 1350
    const/high16 v4, 0x1020

    invoke-virtual {v6, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto/16 :goto_1

    .line 1355
    .end local v34           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-object v12, v8

    move/from16 v17, v9

    move/from16 v18, v10

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-static/range {v11 .. v18}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1200(Lcom/cyanogenmod/trebuchet/LauncherModel;Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v34

    .line 1358
    .restart local v34       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    const/4 v4, 0x3

    move-object/from16 v0, v34

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    .line 1359
    move-object/from16 v0, v34

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    if-nez v4, :cond_4

    .line 1360
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    const v5, 0x7f09009c

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v34

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 1362
    :cond_4
    move/from16 v0, v37

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    move-result-object v36

    .line 1364
    .restart local v36       #intentDescription:Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_8
    move-object/from16 v0, v36

    invoke-static {v0, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    move-result-object v6

    goto/16 :goto_1

    .line 1365
    :catch_2
    move-exception v28

    .line 1366
    .local v28, ex:Ljava/lang/Exception;
    :try_start_9
    new-instance v35, Landroid/content/Intent;

    invoke-direct/range {v35 .. v35}, Landroid/content/Intent;-><init>()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 1367
    .end local v6           #intent:Landroid/content/Intent;
    .local v35, intent:Landroid/content/Intent;
    :try_start_a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v35

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    move-object/from16 v6, v35

    .end local v35           #intent:Landroid/content/Intent;
    .restart local v6       #intent:Landroid/content/Intent;
    goto/16 :goto_1

    .line 1388
    .end local v28           #ex:Ljava/lang/Exception;
    .end local v36           #intentDescription:Ljava/lang/String;
    .restart local v25       #container:I
    :pswitch_2
    :try_start_b
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 1407
    .end local v25           #container:I
    :cond_5
    move/from16 v0, v33

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v31

    .line 1408
    .local v31, id:J
    const-string v4, "Trebuchet.LauncherModel"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error loading shortcut "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v31

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ", removing it"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1409
    const/4 v4, 0x0

    move-wide/from16 v0, v31

    invoke-static {v0, v1, v4}, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1415
    .end local v31           #id:J
    .end local v34           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :pswitch_3
    move/from16 v0, v33

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v31

    .line 1416
    .restart local v31       #id:J
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move-wide/from16 v0, v31

    #calls: Lcom/cyanogenmod/trebuchet/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-static {v4, v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1300(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v29

    .line 1418
    .restart local v29       #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v29

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    .line 1419
    move-wide/from16 v0, v31

    move-object/from16 v2, v29

    iput-wide v0, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    .line 1420
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1421
    .restart local v25       #container:I
    move/from16 v0, v25

    int-to-long v4, v0

    move-object/from16 v0, v29

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    .line 1422
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v29

    iput v4, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    .line 1423
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v29

    iput v4, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    .line 1424
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v29

    iput v4, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    .line 1427
    move-object/from16 v0, p0

    move-object/from16 v1, v45

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1430
    packed-switch v25, :pswitch_data_2

    .line 1437
    :goto_4
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v29

    iget-wide v11, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v29

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1438
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    move-object/from16 v0, v29

    iget-wide v11, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v29

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1433
    :pswitch_4
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1443
    .end local v25           #container:I
    .end local v29           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v31           #id:J
    :pswitch_5
    move/from16 v0, v20

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 1444
    .local v19, appWidgetId:I
    move/from16 v0, v33

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v31

    .line 1446
    .restart local v31       #id:J
    move-object/from16 v0, v52

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v46

    .line 1449
    .local v46, provider:Landroid/appwidget/AppWidgetProviderInfo;
    if-nez v38, :cond_7

    if-eqz v46, :cond_6

    move-object/from16 v0, v46

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    if-eqz v4, :cond_6

    move-object/from16 v0, v46

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_7

    .line 1451
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleting widget that isn\'t installed anymore: id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v31

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " appWidgetId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    .line 1453
    .local v42, log:Ljava/lang/String;
    const-string v4, "Trebuchet.LauncherModel"

    move-object/from16 v0, v42

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1454
    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1455
    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, v41

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1457
    .end local v42           #log:Ljava/lang/String;
    :cond_7
    new-instance v21, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    move-object/from16 v0, v46

    iget-object v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-direct {v0, v1, v4}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;-><init>(ILandroid/content/ComponentName;)V

    .line 1459
    .local v21, appWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    move-wide/from16 v0, v31

    move-object/from16 v2, v21

    iput-wide v0, v2, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->id:J

    .line 1460
    move/from16 v0, v47

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->screen:I

    .line 1461
    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->cellX:I

    .line 1462
    move/from16 v0, v23

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->cellY:I

    .line 1463
    move/from16 v0, v48

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    .line 1464
    move/from16 v0, v49

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    .line 1465
    move-object/from16 v0, v46

    invoke-static {v13, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v44

    .line 1466
    .local v44, minSpan:[I
    const/4 v4, 0x0

    aget v4, v44, v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minSpanX:I

    .line 1467
    const/4 v4, 0x1

    aget v4, v44, v4

    move-object/from16 v0, v21

    iput v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minSpanY:I

    .line 1469
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 1470
    .restart local v25       #container:I
    const/16 v4, -0x64

    move/from16 v0, v25

    if-eq v0, v4, :cond_8

    const/16 v4, -0x65

    move/from16 v0, v25

    if-eq v0, v4, :cond_8

    .line 1472
    const-string v4, "Trebuchet.LauncherModel"

    const-string v5, "Widget found where container != CONTAINER_DESKTOP nor CONTAINER_HOTSEAT - ignoring!"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1476
    :cond_8
    move/from16 v0, v26

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v0, v21

    iput-wide v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->container:J

    .line 1479
    move-object/from16 v0, p0

    move-object/from16 v1, v45

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->checkItemPlacement([[[Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1482
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    move-object/from16 v0, v21

    iget-wide v11, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1483
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0

    goto/16 :goto_0

    .line 1492
    .end local v19           #appWidgetId:I
    .end local v21           #appWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    .end local v25           #container:I
    .end local v31           #id:J
    .end local v39           #itemType:I
    .end local v44           #minSpan:[I
    .end local v46           #provider:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_9
    :try_start_c
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1495
    invoke-virtual/range {v41 .. v41}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_a

    .line 1496
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object v24

    .line 1499
    .local v24, client:Landroid/content/ContentProviderClient;
    invoke-virtual/range {v41 .. v41}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v30

    .local v30, i$:Ljava/util/Iterator;
    :goto_5
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    move-result-wide v31

    .line 1505
    .restart local v31       #id:J
    const/4 v4, 0x0

    :try_start_d
    move-wide/from16 v0, v31

    invoke-static {v0, v1, v4}, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v0, v4, v5, v7}, Landroid/content/ContentProviderClient;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_3

    goto :goto_5

    .line 1507
    :catch_3
    move-exception v27

    .line 1508
    .local v27, e:Landroid/os/RemoteException;
    :try_start_e
    const-string v4, "Trebuchet.LauncherModel"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not remove id = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v31

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 1529
    .end local v24           #client:Landroid/content/ContentProviderClient;
    .end local v27           #e:Landroid/os/RemoteException;
    .end local v30           #i$:Ljava/util/Iterator;
    .end local v31           #id:J
    :cond_a
    monitor-exit v53
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 1530
    return-void

    .line 1487
    .end local v6           #intent:Landroid/content/Intent;
    .restart local v28       #ex:Ljava/lang/Exception;
    .restart local v34       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v35       #intent:Landroid/content/Intent;
    .restart local v36       #intentDescription:Ljava/lang/String;
    .restart local v39       #itemType:I
    :catch_4
    move-exception v27

    move-object/from16 v6, v35

    .end local v35           #intent:Landroid/content/Intent;
    .restart local v6       #intent:Landroid/content/Intent;
    goto/16 :goto_3

    .line 1323
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_5
    .end packed-switch

    .line 1385
    :pswitch_data_1
    .packed-switch -0x65
        :pswitch_2
        :pswitch_2
    .end packed-switch

    .line 1430
    :pswitch_data_2
    .packed-switch -0x65
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private onlyBindAllApps()V
    .locals 6

    .prologue
    .line 1925
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 1926
    .local v2, oldCallbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-nez v2, :cond_0

    .line 1928
    const-string v4, "Trebuchet.LauncherModel"

    const-string v5, "LoaderTask running with no launcher (onlyBindAllApps)"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1955
    :goto_0
    return-void

    .line 1934
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v4

    iget-object v4, v4, Lcom/cyanogenmod/trebuchet/AllAppsList;->data:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1936
    .local v1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    new-instance v3, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$10;

    invoke-direct {v3, p0, v2, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$10;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;)V

    .line 1949
    .local v3, r:Ljava/lang/Runnable;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1700()Landroid/os/HandlerThread;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v4

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v5

    if-eq v4, v5, :cond_1

    const/4 v0, 0x1

    .line 1950
    .local v0, isRunningOnMainThread:Z
    :goto_1
    invoke-interface {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->isAllAppsVisible()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v0, :cond_2

    .line 1951
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 1949
    .end local v0           #isRunningOnMainThread:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 1953
    .restart local v0       #isRunningOnMainThread:Z
    :cond_2
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private removeHiddenAppsWorkspaceItems(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;)V
    .locals 26
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1658
    .local p1, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    .local p2, appWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;>;"
    .local p3, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 1659
    .local v21, mHiddenApps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ComponentName;>;"
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 1660
    .local v22, mHiddenAppsPackages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getHiddenApps()Ljava/lang/String;

    move-result-object v2

    const-string v4, "\\|"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 1661
    .local v14, flattened:[Ljava/lang/String;
    move-object v11, v14

    .local v11, arr$:[Ljava/lang/String;
    array-length v0, v11

    move/from16 v20, v0

    .local v20, len$:I
    const/16 v17, 0x0

    .local v17, i$:I
    :goto_0
    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_1

    aget-object v13, v11, v17

    .line 1662
    .local v13, flat:Ljava/lang/String;
    invoke-static {v13}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v12

    .line 1663
    .local v12, cmp:Landroid/content/ComponentName;
    if-eqz v12, :cond_0

    .line 1664
    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1665
    invoke-virtual {v12}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1661
    :cond_0
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 1670
    .end local v12           #cmp:Landroid/content/ComponentName;
    .end local v13           #flat:Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getRemoveShortcutsOfHiddenApps()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1671
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v9, v2, -0x1

    .line 1672
    .local v9, N:I
    move/from16 v16, v9

    .local v16, i:I
    :goto_1
    if-ltz v16, :cond_7

    .line 1673
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1674
    .local v18, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v18

    instance-of v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v2, :cond_3

    move-object/from16 v24, v18

    .line 1675
    check-cast v24, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1676
    .local v24, shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v2, :cond_2

    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1677
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1678
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object/from16 v0, v24

    invoke-static {v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1679
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1672
    .end local v24           #shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_2
    :goto_2
    add-int/lit8 v16, v16, -0x1

    goto :goto_1

    :cond_3
    move-object/from16 v15, v18

    .line 1683
    check-cast v15, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 1684
    .local v15, folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-object v0, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    .line 1685
    .local v25, shortcuts:Ljava/util/List;,"Ljava/util/List<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v10, v2, -0x1

    .line 1686
    .local v10, NN:I
    move/from16 v19, v10

    .local v19, j:I
    :goto_3
    if-ltz v19, :cond_5

    .line 1687
    move-object/from16 v0, v25

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1688
    .local v23, sci:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    move-object/from16 v0, v23

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v2, :cond_4

    move-object/from16 v0, v23

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1689
    move-object/from16 v0, v23

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1690
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object/from16 v0, v23

    invoke-static {v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1691
    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/cyanogenmod/trebuchet/FolderInfo;->remove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1686
    :cond_4
    add-int/lit8 v19, v19, -0x1

    goto :goto_3

    .line 1696
    .end local v23           #sci:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_5
    iget-object v2, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_6

    .line 1697
    iget-object v2, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1698
    .local v3, finalItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-wide v4, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    iput-wide v4, v3, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    .line 1699
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    invoke-static {v2, v15}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1700
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    iget-wide v4, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    iget v6, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    iget v7, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    iget v8, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    invoke-static/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 1702
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1703
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1704
    move-object/from16 v0, v18

    iget-wide v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 1705
    .end local v3           #finalItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_6
    iget-object v2, v15, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 1706
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    invoke-static {v2, v15}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteFolderContentsFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 1707
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1708
    move-object/from16 v0, v18

    iget-wide v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 1715
    .end local v9           #N:I
    .end local v10           #NN:I
    .end local v15           #folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v16           #i:I
    .end local v18           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v19           #j:I
    .end local v25           #shortcuts:Ljava/util/List;,"Ljava/util/List<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
    :cond_7
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getRemoveWidgetsOfHiddenApps()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1716
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v9, v2, -0x1

    .line 1717
    .restart local v9       #N:I
    move/from16 v16, v9

    .restart local v16       #i:I
    :goto_4
    if-ltz v16, :cond_9

    .line 1718
    move-object/from16 v0, p2

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 1719
    .local v18, item:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    move-object/from16 v0, v18

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->providerName:Landroid/content/ComponentName;

    if-eqz v2, :cond_8

    .line 1720
    move-object/from16 v0, v18

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->providerName:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1721
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object/from16 v0, v18

    invoke-static {v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1722
    move-object/from16 v0, p2

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1717
    :cond_8
    add-int/lit8 v16, v16, -0x1

    goto :goto_4

    .line 1727
    .end local v9           #N:I
    .end local v16           #i:I
    .end local v18           #item:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    :cond_9
    return-void
.end method

.method private sortWorkspaceItemsSpatially(Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1636
    .local p1, workspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$3;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$3;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1650
    return-void
.end method

.method private waitForIdle()V
    .locals 4

    .prologue
    .line 1038
    monitor-enter p0

    .line 1039
    const-wide/16 v0, 0x0

    .line 1041
    .local v0, workspaceWaitTime:J
    :try_start_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v2

    new-instance v3, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;

    invoke-direct {v3, p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)V

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->postIdle(Ljava/lang/Runnable;)V

    .line 1053
    :goto_0
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 1055
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1056
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1065
    :cond_0
    :try_start_2
    monitor-exit p0

    .line 1066
    return-void

    .line 1065
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
    .line 2034
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2035
    :try_start_0
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mContext="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2036
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mIsLaunching="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLaunching:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2037
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mStopped="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2038
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mLoaderTask.mLoadAndBindStepFinished="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2039
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mItems size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2040
    monitor-exit v1

    .line 2041
    return-void

    .line 2040
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
    .line 1005
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLaunching:Z

    return v0
.end method

.method isLoadingWorkspace()Z
    .locals 1

    .prologue
    .line 1009
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z

    return v0
.end method

.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/16 v6, 0xa

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1105
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    .line 1106
    :try_start_0
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v9, 0x1

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v8, v9}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$502(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z

    .line 1107
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1111
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 1112
    .local v1, cbk:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->isAllAppsVisible()Z

    move-result v7

    if-nez v7, :cond_1

    .line 1117
    .local v4, loadWorkspaceFirst:Z
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    .line 1120
    :try_start_1
    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLaunching:Z

    if-eqz v8, :cond_2

    :goto_1
    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1122
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1123
    if-eqz v4, :cond_3

    .line 1125
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAndBindWorkspace()V

    .line 1131
    :goto_2
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v5, :cond_4

    .line 1163
    :goto_3
    sget-object v7, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v7

    .line 1164
    :try_start_2
    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1165
    .local v3, key:Ljava/lang/Object;
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    move-object v0, v3

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-object v5, v0

    sget-object v6, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    invoke-virtual {v8, v9, v5, v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateSavedIcon(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ShortcutInfo;[B)V

    goto :goto_4

    .line 1168
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #key:Ljava/lang/Object;
    :catchall_0
    move-exception v5

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 1107
    .end local v1           #cbk:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    .end local v4           #loadWorkspaceFirst:Z
    :catchall_1
    move-exception v5

    :try_start_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5

    .restart local v1       #cbk:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    :cond_1
    move v4, v5

    .line 1112
    goto :goto_0

    .restart local v4       #loadWorkspaceFirst:Z
    :cond_2
    move v5, v6

    .line 1120
    goto :goto_1

    .line 1122
    :catchall_2
    move-exception v5

    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v5

    .line 1128
    :cond_3
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAndBindAllApps()V

    goto :goto_2

    .line 1137
    :cond_4
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1138
    :try_start_5
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mIsLaunching:Z

    if-eqz v5, :cond_5

    .line 1140
    const/16 v5, 0xa

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1142
    :cond_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 1143
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->waitForIdle()V

    .line 1146
    if-eqz v4, :cond_6

    .line 1148
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAndBindAllApps()V

    .line 1155
    :goto_5
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1156
    const/4 v5, 0x0

    :try_start_6
    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1157
    monitor-exit v6

    goto :goto_3

    :catchall_3
    move-exception v5

    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v5

    .line 1142
    :catchall_4
    move-exception v5

    :try_start_7
    monitor-exit v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    throw v5

    .line 1151
    :cond_6
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->loadAndBindWorkspace()V

    goto :goto_5

    .line 1167
    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_7
    :try_start_8
    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 1168
    monitor-exit v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1172
    iput-object v10, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mContext:Landroid/content/Context;

    .line 1174
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 1176
    :try_start_9
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$700(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    move-result-object v5

    if-ne v5, p0, :cond_8

    .line 1177
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v7, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
    invoke-static {v5, v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$702(Lcom/cyanogenmod/trebuchet/LauncherModel;Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    .line 1179
    :cond_8
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v7, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v5, v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$502(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z

    .line 1180
    monitor-exit v6

    .line 1181
    return-void

    .line 1180
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
    .line 1069
    if-gez p1, :cond_0

    .line 1071
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Should not call runBindSynchronousPage() without valid page index"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1074
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$300(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$000(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1077
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Expecting AllApps and Workspace to be loaded"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1079
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1080
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mIsLoaderTaskRunning:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$500(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1083
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Error! Background loading is already running"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1085
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

    .line 1094
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->flush()V

    .line 1098
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->bindWorkspace(I)V

    .line 1101
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->onlyBindAllApps()V

    .line 1102
    return-void
.end method

.method public stopLocked()V
    .locals 1

    .prologue
    .line 1184
    monitor-enter p0

    .line 1185
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    .line 1186
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 1187
    monitor-exit p0

    .line 1188
    return-void

    .line 1187
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method tryGetCallbacks(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    .locals 5
    .parameter "oldCallbacks"

    .prologue
    const/4 v1, 0x0

    .line 1198
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1199
    :try_start_0
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mStopped:Z

    if-eqz v3, :cond_0

    .line 1200
    monitor-exit v2

    move-object v0, v1

    .line 1216
    :goto_0
    return-object v0

    .line 1203
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1204
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1207
    :cond_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 1208
    .local v0, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-eq v0, p1, :cond_2

    .line 1209
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1211
    :cond_2
    if-nez v0, :cond_3

    .line 1212
    const-string v3, "Trebuchet.LauncherModel"

    const-string v4, "no mCallbacks"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1213
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 1216
    :cond_3
    monitor-exit v2

    goto :goto_0

    .line 1217
    .end local v0           #callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
