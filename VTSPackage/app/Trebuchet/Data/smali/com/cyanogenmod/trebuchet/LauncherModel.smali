.class public Lcom/cyanogenmod/trebuchet/LauncherModel;
.super Landroid/content/BroadcastReceiver;
.source "LauncherModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/LauncherModel$WidgetAndShortcutNameComparator;,
        Lcom/cyanogenmod/trebuchet/LauncherModel$ShortcutNameComparator;,
        Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;,
        Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;,
        Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    }
.end annotation


# static fields
.field public static final APP_INSTALL_TIME_COMPARATOR:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG_LOADERS:Z = false

.field private static final ITEMS_CHUNK:I = 0x6

.field private static final MAIN_THREAD_BINDING_RUNNABLE:I = 0x1

.field private static final MAIN_THREAD_NORMAL_RUNNABLE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Trebuchet.LauncherModel"

.field static final mDeferredBindRunnables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field static final sBgAppWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final sBgDbIconCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "[B>;"
        }
    .end annotation
.end field

.field static final sBgFolders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final sBgItemsIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field static final sBgLock:Ljava/lang/Object;

.field static final sBgWorkspaceItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static sHotseatCellCount:I

.field private static final sWorker:Landroid/os/Handler;

.field private static final sWorkerThread:Landroid/os/HandlerThread;

.field private static sWorkspaceCellCountX:I

.field private static sWorkspaceCellCountY:I


# instance fields
.field private mAllAppsLoaded:Z

.field private final mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;

.field private final mAppsCanBeOnExternalStorage:Z

.field private mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

.field private mCallbacks:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;",
            ">;"
        }
    .end annotation
.end field

.field private mDefaultIcon:Landroid/graphics/Bitmap;

.field private mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

.field private mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field private mIsLoaderTaskRunning:Z

.field private mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

.field private final mLock:Ljava/lang/Object;

.field protected mPreviousConfigMcc:I

.field private mWorkspaceLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 88
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "launcher-loader"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    .line 90
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 92
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorker:Landroid/os/Handler;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    .line 115
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgFolders:Ljava/util/HashMap;

    .line 134
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgDbIconCache:Ljava/util/HashMap;

    .line 2495
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$8;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$8;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->APP_INSTALL_TIME_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherApplication;Lcom/cyanogenmod/trebuchet/IconCache;)V
    .locals 3
    .parameter "app"
    .parameter "iconCache"

    .prologue
    .line 164
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 77
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    .line 78
    new-instance v2, Lcom/cyanogenmod/trebuchet/DeferredHandler;

    invoke-direct {v2}, Lcom/cyanogenmod/trebuchet/DeferredHandler;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

    .line 165
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAppsCanBeOnExternalStorage:Z

    .line 166
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 167
    new-instance v2, Lcom/cyanogenmod/trebuchet/AllAppsList;

    invoke-direct {v2, p2}, Lcom/cyanogenmod/trebuchet/AllAppsList;-><init>(Lcom/cyanogenmod/trebuchet/IconCache;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    .line 168
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 170
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDefaultIcon:Landroid/graphics/Bitmap;

    .line 173
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 174
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 175
    .local v0, config:Landroid/content/res/Configuration;
    iget v2, v0, Landroid/content/res/Configuration;->mcc:I

    iput v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mPreviousConfigMcc:I

    .line 176
    return-void

    .line 165
    .end local v0           #config:Landroid/content/res/Configuration;
    .end local v1           #res:Landroid/content/res/Resources;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z

    return v0
.end method

.method static synthetic access$002(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z

    return p1
.end method

.method static synthetic access$1000()I
    .locals 1

    .prologue
    .line 69
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sHotseatCellCount:I

    return v0
.end method

.method static synthetic access$1100()I
    .locals 1

    .prologue
    .line 69
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountY:I

    return v0
.end method

.method static synthetic access$1200(Lcom/cyanogenmod/trebuchet/LauncherModel;Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"
    .parameter "x7"

    .prologue
    .line 69
    invoke-direct/range {p0 .. p7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    invoke-static {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/lang/Runnable;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    return-object v0
.end method

.method static synthetic access$1700()Landroid/os/HandlerThread;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/IconCache;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z

    return v0
.end method

.method static synthetic access$302(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z

    return p1
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/LauncherModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIsLoaderTaskRunning:Z

    return v0
.end method

.method static synthetic access$502(Lcom/cyanogenmod/trebuchet/LauncherModel;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIsLoaderTaskRunning:Z

    return p1
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$700(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    return-object v0
.end method

.method static synthetic access$702(Lcom/cyanogenmod/trebuchet/LauncherModel;Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 69
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    return-object p1
.end method

.method static synthetic access$800(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/LauncherApplication;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    return-object v0
.end method

.method static synthetic access$900()I
    .locals 1

    .prologue
    .line 69
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountX:I

    return v0
.end method

.method static addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V
    .locals 12
    .parameter "context"
    .parameter "item"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "notify"

    .prologue
    .line 570
    move/from16 v11, p4

    .line 571
    .local v11, screenEx:I
    instance-of v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v3, :cond_0

    if-gez p4, :cond_0

    const-wide/16 v3, -0x65

    cmp-long v3, p2, v3

    if-nez v3, :cond_0

    move-object v3, p0

    .line 573
    check-cast v3, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-virtual {v3, v0, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getOrderInHotseat(II)I

    move-result v11

    .line 575
    :cond_0
    const/4 v3, 0x2

    new-array v10, v3, [I

    const/4 v3, 0x0

    aput p5, v10, v3

    const/4 v3, 0x1

    aput p6, v10, v3

    .line 576
    .local v10, cells:[I
    instance-of v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v3, :cond_1

    const-wide/16 v3, -0x65

    cmp-long v3, p2, v3

    if-nez v3, :cond_1

    move-object v3, p0

    .line 578
    check-cast v3, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput p5, v4, v5

    const/4 v5, 0x1

    aput p6, v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getDatabaseCellsFromLayout([I)[I

    move-result-object v10

    .line 582
    :cond_1
    iput-wide p2, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 583
    const/4 v3, 0x0

    aget v3, v10, v3

    iput v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 584
    const/4 v3, 0x1

    aget v3, v10, v3

    iput v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 585
    iput v11, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 587
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 588
    .local v8, values:Landroid/content/ContentValues;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 589
    .local v6, cr:Landroid/content/ContentResolver;
    invoke-virtual {p1, v8}, Lcom/cyanogenmod/trebuchet/ItemInfo;->onAddToDatabase(Landroid/content/ContentValues;)V

    .line 591
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 592
    .local v9, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getLauncherProvider()Lcom/cyanogenmod/trebuchet/LauncherProvider;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/LauncherProvider;->generateNewId()J

    move-result-wide v3

    iput-wide v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 593
    const-string v3, "_id"

    iget-wide v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v8, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 594
    iget v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {p1, v8, v3, v4}, Lcom/cyanogenmod/trebuchet/ItemInfo;->updateValuesWithCoordinates(Landroid/content/ContentValues;II)V

    .line 596
    new-instance v2, Lcom/cyanogenmod/trebuchet/LauncherModel$4;

    move-object v3, p1

    move-wide v4, p2

    move/from16 v7, p7

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/LauncherModel$4;-><init>(Lcom/cyanogenmod/trebuchet/ItemInfo;JLandroid/content/ContentResolver;ZLandroid/content/ContentValues;)V

    .line 638
    .local v2, r:Ljava/lang/Runnable;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnWorkerThread(Ljava/lang/Runnable;)V

    .line 639
    return-void
.end method

.method static addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V
    .locals 8
    .parameter "context"
    .parameter "item"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 248
    iget-wide v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 250
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-static/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V

    .line 255
    :goto_0
    return-void

    .line 253
    :cond_0
    invoke-static/range {p0 .. p6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->moveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    goto :goto_0
.end method

.method static checkItemInfo(Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 5
    .parameter "item"

    .prologue
    .line 301
    new-instance v4, Ljava/lang/Throwable;

    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 302
    .local v3, stackTrace:[Ljava/lang/StackTraceElement;
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 303
    .local v0, itemId:J
    new-instance v2, Lcom/cyanogenmod/trebuchet/LauncherModel$2;

    invoke-direct {v2, v0, v1, p0, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel$2;-><init>(JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 310
    .local v2, r:Ljava/lang/Runnable;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnWorkerThread(Ljava/lang/Runnable;)V

    .line 311
    return-void
.end method

.method static checkItemInfoLocked(JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V
    .locals 11
    .parameter "itemId"
    .parameter "item"
    .parameter "stackTrace"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 259
    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgItemsIdMap:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 260
    .local v1, modelItem:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-eqz v1, :cond_1

    if-eq p2, v1, :cond_1

    .line 262
    instance-of v5, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v5, :cond_2

    instance-of v5, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v5, :cond_2

    move-object v2, v1

    .line 263
    check-cast v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .local v2, modelShortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    move-object v4, p2

    .line 264
    check-cast v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 265
    .local v4, shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    iget-object v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v5, v6}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    iget-wide v7, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    if-ne v5, v6, :cond_2

    iget-wide v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    iget-wide v7, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->screen:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->screen:I

    if-ne v5, v6, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    if-ne v5, v6, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    if-ne v5, v6, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    if-ne v5, v6, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    if-ne v5, v6, :cond_2

    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    if-nez v5, :cond_0

    iget-object v5, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    if-eqz v5, :cond_1

    :cond_0
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    if-eqz v5, :cond_2

    iget-object v5, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    if-eqz v5, :cond_2

    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    aget v5, v5, v9

    iget-object v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    aget v6, v6, v9

    if-ne v5, v6, :cond_2

    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    aget v5, v5, v10

    iget-object v6, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    aget v6, v6, v10

    if-ne v5, v6, :cond_2

    .line 298
    .end local v2           #modelShortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v4           #shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    return-void

    .line 288
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "item: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lcom/cyanogenmod/trebuchet/ItemInfo;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_0
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "modelItem: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ItemInfo;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Error: ItemInfo passed to checkItemInfo doesn\'t match original"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 292
    .local v3, msg:Ljava/lang/String;
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 293
    .local v0, e:Ljava/lang/RuntimeException;
    if-eqz p3, :cond_3

    .line 294
    invoke-virtual {v0, p3}, Ljava/lang/RuntimeException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 296
    :cond_3
    throw v0

    .line 288
    .end local v0           #e:Ljava/lang/RuntimeException;
    .end local v3           #msg:Ljava/lang/String;
    :cond_4
    const-string v5, "null"

    goto :goto_0

    :cond_5
    const-string v5, "null"

    goto :goto_1
.end method

.method static countAllItemsOfType(Landroid/content/Context;I)I
    .locals 8
    .parameter "context"
    .parameter "itemType"

    .prologue
    const/4 v2, 0x0

    .line 766
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 767
    .local v0, cr:Landroid/content/ContentResolver;
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "itemType=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 769
    .local v6, c:Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    return v1
.end method

.method static countAllItemsOfType(Landroid/content/Context;IJ)I
    .locals 8
    .parameter "context"
    .parameter "itemType"
    .parameter "container"

    .prologue
    const/4 v2, 0x0

    .line 776
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 777
    .local v0, cr:Landroid/content/ContentResolver;
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "itemType=? and container=?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x1

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 780
    .local v6, c:Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    return v1
.end method

.method static deleteFolderContentsFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/FolderInfo;)V
    .locals 2
    .parameter "context"
    .parameter "info"

    .prologue
    .line 735
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 737
    .local v0, cr:Landroid/content/ContentResolver;
    new-instance v1, Lcom/cyanogenmod/trebuchet/LauncherModel$6;

    invoke-direct {v1, v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel$6;-><init>(Landroid/content/ContentResolver;Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 759
    .local v1, r:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnWorkerThread(Ljava/lang/Runnable;)V

    .line 760
    return-void
.end method

.method static deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 6
    .parameter "context"
    .parameter "item"

    .prologue
    .line 684
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 685
    .local v0, cr:Landroid/content/ContentResolver;
    iget-wide v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v2

    .line 687
    .local v2, uriToDelete:Landroid/net/Uri;
    new-instance v1, Lcom/cyanogenmod/trebuchet/LauncherModel$5;

    invoke-direct {v1, p1, v0, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$5;-><init>(Lcom/cyanogenmod/trebuchet/ItemInfo;Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 728
    .local v1, r:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnWorkerThread(Ljava/lang/Runnable;)V

    .line 729
    return-void
.end method

.method private static findOrMakeFolder(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    .locals 2
    .parameter
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;J)",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;"
        }
    .end annotation

    .prologue
    .line 2474
    .local p0, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 2475
    .local v0, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    if-nez v0, :cond_0

    .line 2477
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .end local v0           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/FolderInfo;-><init>()V

    .line 2478
    .restart local v0       #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2480
    :cond_0
    return-object v0
.end method

.method private forceReload()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 872
    invoke-virtual {p0, v0, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->resetLoadedState(ZZ)V

    .line 877
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoaderFromBackground()V

    .line 878
    return-void
.end method

.method public static final getAppNameComparator()Ljava/util/Comparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2484
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    .line 2485
    .local v0, collator:Ljava/text/Collator;
    new-instance v1, Lcom/cyanogenmod/trebuchet/LauncherModel$7;

    invoke-direct {v1, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$7;-><init>(Ljava/text/Collator;)V

    return-object v1
.end method

.method static getCellLayoutChildId(JIII)I
    .locals 2
    .parameter "container"
    .parameter "screen"
    .parameter "localCellX"
    .parameter "localCellY"

    .prologue
    .line 645
    long-to-int v0, p0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 v1, p3, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, p4, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method static getComponentNameFromResolveInfo(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;
    .locals 3
    .parameter "info"

    .prologue
    .line 2512
    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v0, :cond_0

    .line 2513
    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v2, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2515
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    iget-object v2, p0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v2, v2, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static getHotseatCellCount()I
    .locals 1

    .prologue
    .line 658
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sHotseatCellCount:I

    return v0
.end method

.method static getItemsInLocalCoordinates(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 18
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 480
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 481
    .local v14, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 482
    .local v1, cr:Landroid/content/ContentResolver;
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "itemType"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "container"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "screen"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "cellX"

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "cellY"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const-string v5, "spanX"

    aput-object v5, v3, v4

    const/4 v4, 0x6

    const-string v5, "spanY"

    aput-object v5, v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 487
    .local v7, c:Landroid/database/Cursor;
    const-string v2, "itemType"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    .line 488
    .local v13, itemTypeIndex:I
    const-string v2, "container"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 489
    .local v10, containerIndex:I
    const-string v2, "screen"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 490
    .local v15, screenIndex:I
    const-string v2, "cellX"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v8

    .line 491
    .local v8, cellXIndex:I
    const-string v2, "cellY"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 492
    .local v9, cellYIndex:I
    const-string v2, "spanX"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    .line 493
    .local v16, spanXIndex:I
    const-string v2, "spanY"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v17

    .line 496
    .local v17, spanYIndex:I
    :goto_0
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 497
    new-instance v12, Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-direct {v12}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    .line 498
    .local v12, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 499
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 500
    move/from16 v0, v16

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 501
    move/from16 v0, v17

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 502
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 503
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    .line 504
    invoke-interface {v7, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 506
    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 508
    .end local v12           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :catch_0
    move-exception v11

    .line 509
    .local v11, e:Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 511
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 514
    .end local v11           #e:Ljava/lang/Exception;
    :goto_1
    return-object v14

    .line 511
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v2

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v2
.end method

.method private getShortcutInfo(Landroid/database/Cursor;Landroid/content/Context;IIIII)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 11
    .parameter "c"
    .parameter "context"
    .parameter "iconTypeIndex"
    .parameter "iconPackageIndex"
    .parameter "iconResourceIndex"
    .parameter "iconIndex"
    .parameter "titleIndex"

    .prologue
    .line 2291
    const/4 v1, 0x0

    .line 2292
    .local v1, icon:Landroid/graphics/Bitmap;
    new-instance v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {v4}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;-><init>()V

    .line 2293
    .local v4, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    const/4 v9, 0x1

    iput v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    .line 2297
    move/from16 v0, p7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2299
    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 2300
    .local v2, iconType:I
    packed-switch v2, :pswitch_data_0

    .line 2338
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFallbackIcon()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2339
    const/4 v9, 0x1

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    .line 2340
    const/4 v9, 0x0

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 2343
    :cond_0
    :goto_0
    invoke-virtual {v4, v1}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setIcon(Landroid/graphics/Bitmap;)V

    .line 2344
    return-object v4

    .line 2302
    :pswitch_0
    invoke-interface {p1, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2303
    .local v6, packageName:Ljava/lang/String;
    move/from16 v0, p5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 2304
    .local v7, resourceName:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 2305
    .local v5, packageManager:Landroid/content/pm/PackageManager;
    const/4 v9, 0x0

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 2308
    :try_start_0
    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v8

    .line 2309
    .local v8, resources:Landroid/content/res/Resources;
    if-eqz v8, :cond_1

    .line 2310
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v8, v7, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 2311
    .local v3, id:I
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v9, v8, v3}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-static {v9, p2}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 2318
    .end local v3           #id:I
    .end local v8           #resources:Landroid/content/res/Resources;
    :cond_1
    :goto_1
    if-nez v1, :cond_2

    .line 2319
    move/from16 v0, p6

    invoke-virtual {p0, p1, v0, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getIconFromCursor(Landroid/database/Cursor;ILandroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2322
    :cond_2
    if-nez v1, :cond_0

    .line 2323
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFallbackIcon()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2324
    const/4 v9, 0x1

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    goto :goto_0

    .line 2328
    .end local v5           #packageManager:Landroid/content/pm/PackageManager;
    .end local v6           #packageName:Ljava/lang/String;
    .end local v7           #resourceName:Ljava/lang/String;
    :pswitch_1
    move/from16 v0, p6

    invoke-virtual {p0, p1, v0, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getIconFromCursor(Landroid/database/Cursor;ILandroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2329
    if-nez v1, :cond_3

    .line 2330
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFallbackIcon()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2331
    const/4 v9, 0x0

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 2332
    const/4 v9, 0x1

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    goto :goto_0

    .line 2334
    :cond_3
    const/4 v9, 0x1

    iput-boolean v9, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    goto :goto_0

    .line 2314
    .restart local v5       #packageManager:Landroid/content/pm/PackageManager;
    .restart local v6       #packageName:Ljava/lang/String;
    .restart local v7       #resourceName:Ljava/lang/String;
    :catch_0
    move-exception v9

    goto :goto_1

    .line 2300
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static final getWidgetNameComparator()Ljava/util/Comparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2504
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    .line 2505
    .local v0, collator:Ljava/text/Collator;
    new-instance v1, Lcom/cyanogenmod/trebuchet/LauncherModel$9;

    invoke-direct {v1, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$9;-><init>(Ljava/text/Collator;)V

    return-object v1
.end method

.method static getWorkspaceCellCountX()I
    .locals 1

    .prologue
    .line 650
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountX:I

    return v0
.end method

.method static getWorkspaceCellCountY()I
    .locals 1

    .prologue
    .line 654
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountY:I

    return v0
.end method

.method static getWorkspaceShortcutItemInfosWithIntent(Landroid/content/Intent;)Ljava/util/ArrayList;
    .locals 8
    .parameter "intent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2270
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2271
    .local v3, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    sget-object v6, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v6

    .line 2272
    :try_start_0
    sget-object v5, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2273
    .local v2, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    instance-of v5, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v5, :cond_0

    .line 2274
    move-object v0, v2

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-object v4, v0

    .line 2275
    .local v4, shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v5, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2276
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2280
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v4           #shortcut:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2281
    return-object v3
.end method

.method static modifyItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIII)V
    .locals 7
    .parameter "context"
    .parameter "item"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 414
    move v1, p4

    .line 415
    .local v1, screenEx:I
    instance-of v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v4, :cond_0

    if-gez p4, :cond_0

    const-wide/16 v4, -0x65

    cmp-long v4, p2, v4

    if-nez v4, :cond_0

    move-object v4, p0

    .line 417
    check-cast v4, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    invoke-virtual {v4, p5, p6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getOrderInHotseat(II)I

    move-result v1

    .line 419
    :cond_0
    const/4 v4, 0x2

    new-array v0, v4, [I

    const/4 v4, 0x0

    aput p5, v0, v4

    const/4 v4, 0x1

    aput p6, v0, v4

    .line 420
    .local v0, cells:[I
    instance-of v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v4, :cond_1

    const-wide/16 v4, -0x65

    cmp-long v4, p2, v4

    if-nez v4, :cond_1

    move-object v4, p0

    .line 422
    check-cast v4, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput p5, v5, v6

    const/4 v6, 0x1

    aput p6, v5, v6

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->getDatabaseCellsFromLayout([I)[I

    move-result-object v0

    .line 426
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DbDebug    Modify item ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") in db, id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") --> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    aget v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 429
    .local v2, transaction:Ljava/lang/String;
    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    const/4 v4, 0x0

    aget v4, v0, v4

    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 431
    const/4 v4, 0x1

    aget v4, v0, v4

    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 432
    iput p7, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 433
    iput p8, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 434
    iput v1, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 436
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 437
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "container"

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 438
    const-string v4, "cellX"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 439
    const-string v4, "cellY"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 440
    const-string v4, "spanX"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 441
    const-string v4, "spanY"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 442
    const-string v4, "screen"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 444
    invoke-static {p0, v3, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabaseHelper(Landroid/content/Context;Landroid/content/ContentValues;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 445
    return-void
.end method

.method static moveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V
    .locals 7
    .parameter "context"
    .parameter "item"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 376
    move v1, p4

    .line 377
    .local v1, screenEx:I
    instance-of v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v4, :cond_0

    if-gez p4, :cond_0

    const-wide/16 v4, -0x65

    cmp-long v4, p2, v4

    if-nez v4, :cond_0

    move-object v4, p0

    .line 379
    check-cast v4, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    invoke-virtual {v4, p5, p6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getOrderInHotseat(II)I

    move-result v1

    .line 381
    :cond_0
    const/4 v4, 0x2

    new-array v0, v4, [I

    const/4 v4, 0x0

    aput p5, v0, v4

    const/4 v4, 0x1

    aput p6, v0, v4

    .line 382
    .local v0, cells:[I
    instance-of v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v4, :cond_1

    const-wide/16 v4, -0x65

    cmp-long v4, p2, v4

    if-nez v4, :cond_1

    move-object v4, p0

    .line 384
    check-cast v4, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput p5, v5, v6

    const/4 v6, 0x1

    aput p6, v5, v6

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->getDatabaseCellsFromLayout([I)[I

    move-result-object v0

    .line 388
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DbDebug    Modify item ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") in db, id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") --> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    aget v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 391
    .local v2, transaction:Ljava/lang/String;
    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    iput-wide p2, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 393
    const/4 v4, 0x0

    aget v4, v0, v4

    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 394
    const/4 v4, 0x1

    aget v4, v0, v4

    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 395
    iput v1, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 397
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 398
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "container"

    iget-wide v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 399
    const-string v4, "cellX"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 400
    const-string v4, "cellY"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 401
    const-string v4, "screen"

    iget v5, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 403
    invoke-static {p0, v3, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabaseHelper(Landroid/content/Context;Landroid/content/ContentValues;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 404
    return-void
.end method

.method private runOnMainThread(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 181
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 183
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    .line 187
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private static runOnWorkerThread(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 192
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 193
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 198
    :goto_0
    return-void

    .line 196
    :cond_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorker:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method static shortcutExists(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 9
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 462
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 463
    .local v0, cr:Landroid/content/ContentResolver;
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "intent"

    aput-object v3, v2, v8

    const-string v3, "intent=?"

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {p1, v8}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 466
    .local v6, c:Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 468
    .local v7, result:Z
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 470
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 472
    return v7

    .line 470
    :catchall_0
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private stopLoaderLocked()Z
    .locals 3

    .prologue
    .line 915
    const/4 v0, 0x0

    .line 916
    .local v0, isLaunching:Z
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    .line 917
    .local v1, oldTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;
    if-eqz v1, :cond_1

    .line 918
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->isLaunching()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 919
    const/4 v0, 0x1

    .line 921
    :cond_0
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->stopLocked()V

    .line 923
    :cond_1
    return v0
.end method

.method static updateHotseatLayoutCells(I)V
    .locals 0
    .parameter "cellCount"

    .prologue
    .line 675
    sput p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sHotseatCellCount:I

    .line 676
    return-void
.end method

.method static updateItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 3
    .parameter "context"
    .parameter "item"

    .prologue
    .line 451
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 452
    .local v0, values:Landroid/content/ContentValues;
    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/ItemInfo;->onAddToDatabase(Landroid/content/ContentValues;)V

    .line 453
    iget v1, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {p1, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ItemInfo;->updateValuesWithCoordinates(Landroid/content/ContentValues;II)V

    .line 454
    invoke-static {p0, v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabaseHelper(Landroid/content/Context;Landroid/content/ContentValues;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 455
    return-void
.end method

.method static updateItemInDatabaseHelper(Landroid/content/Context;Landroid/content/ContentValues;Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 8
    .parameter "context"
    .parameter "values"
    .parameter "item"

    .prologue
    .line 315
    iget-wide v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 316
    .local v4, itemId:J
    const/4 v3, 0x0

    invoke-static {v4, v5, v3}, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->getContentUri(JZ)Landroid/net/Uri;

    move-result-object v2

    .line 317
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 319
    .local v1, cr:Landroid/content/ContentResolver;
    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    .line 320
    .local v7, stackTrace:[Ljava/lang/StackTraceElement;
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$3;

    move-object v3, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel$3;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 365
    .local v0, r:Ljava/lang/Runnable;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnWorkerThread(Ljava/lang/Runnable;)V

    .line 366
    return-void
.end method

.method static updateWorkspaceLayoutCells(II)V
    .locals 0
    .parameter "shortAxisCellCount"
    .parameter "longAxisCellCount"

    .prologue
    .line 666
    sput p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountX:I

    .line 667
    sput p1, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkspaceCellCountY:I

    .line 668
    return-void
.end method


# virtual methods
.method addShortcut(Landroid/content/Context;Landroid/content/Intent;JIIIZ)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 8
    .parameter "context"
    .parameter "data"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "notify"

    .prologue
    .line 2365
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->infoFromShortcutIntent(Landroid/content/Context;Landroid/content/Intent;Landroid/graphics/Bitmap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v1

    .line 2366
    .local v1, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-nez v1, :cond_0

    .line 2367
    const/4 v1, 0x0

    .line 2371
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :goto_0
    return-object v1

    .restart local v1       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_0
    move-object v0, p1

    move-wide v2, p3

    move v4, p5

    move v5, p6

    move v6, p7

    move/from16 v7, p8

    .line 2369
    invoke-static/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V

    goto :goto_0
.end method

.method bindRemainingSynchronousPages()V
    .locals 4

    .prologue
    .line 954
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 955
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 956
    .local v1, r:Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;I)V

    goto :goto_0

    .line 958
    .end local v1           #r:Ljava/lang/Runnable;
    :cond_0
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 960
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public dumpState()V
    .locals 3

    .prologue
    .line 2589
    const-string v0, "Trebuchet.LauncherModel"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCallbacks="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2590
    const-string v0, "Trebuchet.LauncherModel"

    const-string v1, "mAllAppsList.data"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/AllAppsList;->data:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2591
    const-string v0, "Trebuchet.LauncherModel"

    const-string v1, "mAllAppsList.added"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2592
    const-string v0, "Trebuchet.LauncherModel"

    const-string v1, "mAllAppsList.removed"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/AllAppsList;->removed:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2593
    const-string v0, "Trebuchet.LauncherModel"

    const-string v1, "mAllAppsList.modified"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/AllAppsList;->modified:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2594
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    if-eqz v0, :cond_0

    .line 2595
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->dumpState()V

    .line 2599
    :goto_0
    return-void

    .line 2597
    :cond_0
    const-string v0, "Trebuchet.LauncherModel"

    const-string v1, "mLoaderTask=null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method enqueuePackageUpdated(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;)V
    .locals 1
    .parameter "task"

    .prologue
    .line 2045
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorker:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2046
    return-void
.end method

.method public getFallbackIcon()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDefaultIcon:Landroid/graphics/Bitmap;

    invoke-static {v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method getFolderById(Landroid/content/Context;Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    .locals 17
    .parameter "context"
    .parameter
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;J)",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;"
        }
    .end annotation

    .prologue
    .line 521
    .local p2, folderList:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 522
    .local v2, cr:Landroid/content/ContentResolver;
    sget-object v3, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v5, "_id=? and (itemType=? or itemType=?)"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v6, v7

    const/4 v7, 0x1

    const/16 v16, 0x2

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 528
    .local v8, c:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 529
    const-string v3, "itemType"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    .line 530
    .local v13, itemTypeIndex:I
    const-string v3, "title"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 531
    .local v15, titleIndex:I
    const-string v3, "container"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    .line 532
    .local v11, containerIndex:I
    const-string v3, "screen"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 533
    .local v14, screenIndex:I
    const-string v3, "cellX"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 534
    .local v9, cellXIndex:I
    const-string v3, "cellY"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 536
    .local v10, cellYIndex:I
    const/4 v12, 0x0

    .line 537
    .local v12, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    invoke-interface {v8, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 543
    :goto_0
    if-eqz v12, :cond_0

    .line 544
    invoke-interface {v8, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    .line 545
    move-wide/from16 v0, p3

    iput-wide v0, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    .line 546
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    int-to-long v3, v3

    iput-wide v3, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    .line 547
    invoke-interface {v8, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    .line 548
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    .line 549
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 555
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 558
    .end local v9           #cellXIndex:I
    .end local v10           #cellYIndex:I
    .end local v11           #containerIndex:I
    .end local v12           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v13           #itemTypeIndex:I
    .end local v14           #screenIndex:I
    .end local v15           #titleIndex:I
    :goto_1
    return-object v12

    .line 539
    .restart local v9       #cellXIndex:I
    .restart local v10       #cellYIndex:I
    .restart local v11       #containerIndex:I
    .restart local v12       #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .restart local v13       #itemTypeIndex:I
    .restart local v14       #screenIndex:I
    .restart local v15       #titleIndex:I
    :pswitch_0
    :try_start_1
    invoke-static/range {p2 .. p4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->findOrMakeFolder(Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v12

    goto :goto_0

    .line 555
    .end local v9           #cellXIndex:I
    .end local v10           #cellYIndex:I
    .end local v11           #containerIndex:I
    .end local v12           #folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v13           #itemTypeIndex:I
    .end local v14           #screenIndex:I
    .end local v15           #titleIndex:I
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 558
    const/4 v12, 0x0

    goto :goto_1

    .line 555
    :catchall_0
    move-exception v3

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v3

    .line 537
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method getIconFromCursor(Landroid/database/Cursor;ILandroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "c"
    .parameter "iconIndex"
    .parameter "context"

    .prologue
    .line 2349
    const/4 v1, 0x0

    .line 2354
    .local v1, debug:Z
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    .line 2356
    .local v0, data:[B
    const/4 v3, 0x0

    :try_start_0
    array-length v4, v0

    invoke-static {v0, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3, p3}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/Bitmap;Landroid/content/Context;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 2359
    :goto_0
    return-object v3

    .line 2358
    :catch_0
    move-exception v2

    .line 2359
    .local v2, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 8
    .parameter "manager"
    .parameter "intent"
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 2168
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v6, v5

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;Landroid/database/Cursor;IILjava/util/HashMap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v0

    return-object v0
.end method

.method public getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;Landroid/database/Cursor;IILjava/util/HashMap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 20
    .parameter "manager"
    .parameter "intent"
    .parameter "context"
    .parameter "c"
    .parameter "iconIndex"
    .parameter "titleIndex"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/PackageManager;",
            "Landroid/content/Intent;",
            "Landroid/content/Context;",
            "Landroid/database/Cursor;",
            "II",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Lcom/cyanogenmod/trebuchet/ShortcutInfo;"
        }
    .end annotation

    .prologue
    .line 2178
    .local p7, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    const/4 v9, 0x0

    .line 2179
    .local v9, icon:Landroid/graphics/Bitmap;
    new-instance v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {v10}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;-><init>()V

    .line 2181
    .local v10, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v5

    .line 2182
    .local v5, componentName:Landroid/content/ComponentName;
    if-nez v5, :cond_0

    .line 2183
    const/4 v10, 0x0

    .line 2263
    .end local v10           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :goto_0
    return-object v10

    .line 2187
    .restart local v10       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_0
    :try_start_0
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v15

    .line 2188
    .local v15, pi:Landroid/content/pm/PackageInfo;
    iget-object v0, v15, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    move/from16 v17, v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v17, :cond_1

    .line 2191
    const/4 v10, 0x0

    goto :goto_0

    .line 2193
    .end local v15           #pi:Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v6

    .line 2194
    .local v6, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v17, "Trebuchet.LauncherModel"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "getPackInfo failed for package "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2208
    .end local v6           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_1
    const/16 v16, 0x0

    .line 2209
    .local v16, resolveInfo:Landroid/content/pm/ResolveInfo;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v14

    .line 2210
    .local v14, oldComponent:Landroid/content/ComponentName;
    new-instance v13, Landroid/content/Intent;

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v13, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2211
    .local v13, newIntent:Landroid/content/Intent;
    const-string v17, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2212
    invoke-virtual {v14}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2213
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v11

    .line 2214
    .local v11, infos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/ResolveInfo;

    .line 2215
    .local v7, i:Landroid/content/pm/ResolveInfo;
    new-instance v4, Landroid/content/ComponentName;

    iget-object v0, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v17, v0

    iget-object v0, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2217
    .local v4, cn:Landroid/content/ComponentName;
    invoke-virtual {v4, v14}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 2218
    move-object/from16 v16, v7

    goto :goto_1

    .line 2221
    .end local v4           #cn:Landroid/content/ComponentName;
    .end local v7           #i:Landroid/content/pm/ResolveInfo;
    :cond_3
    if-nez v16, :cond_4

    .line 2222
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v16

    .line 2224
    :cond_4
    if-eqz v16, :cond_5

    .line 2225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    move-object/from16 v2, p7

    invoke-virtual {v0, v5, v1, v2}, Lcom/cyanogenmod/trebuchet/IconCache;->getIcon(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 2228
    :cond_5
    if-nez v9, :cond_6

    .line 2229
    if-eqz p4, :cond_6

    .line 2230
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p5

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getIconFromCursor(Landroid/database/Cursor;ILandroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 2234
    :cond_6
    if-nez v9, :cond_7

    .line 2235
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFallbackIcon()Landroid/graphics/Bitmap;

    move-result-object v9

    .line 2236
    const/16 v17, 0x1

    move/from16 v0, v17

    iput-boolean v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    .line 2238
    :cond_7
    invoke-virtual {v10, v9}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setIcon(Landroid/graphics/Bitmap;)V

    .line 2241
    iget-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    move-object/from16 v17, v0

    if-nez v17, :cond_8

    .line 2242
    if-eqz p4, :cond_8

    .line 2243
    move-object/from16 v0, p4

    move/from16 v1, p6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2247
    :cond_8
    iget-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    move-object/from16 v17, v0

    if-nez v17, :cond_9

    if-eqz v16, :cond_9

    .line 2248
    invoke-static/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getComponentNameFromResolveInfo(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v12

    .line 2249
    .local v12, key:Landroid/content/ComponentName;
    if-eqz p7, :cond_b

    move-object/from16 v0, p7

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 2250
    move-object/from16 v0, p7

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/CharSequence;

    move-object/from16 v0, v17

    iput-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2259
    .end local v12           #key:Landroid/content/ComponentName;
    :cond_9
    :goto_2
    iget-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    move-object/from16 v17, v0

    if-nez v17, :cond_a

    .line 2260
    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2262
    :cond_a
    const/16 v17, 0x0

    move/from16 v0, v17

    iput v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    goto/16 :goto_0

    .line 2252
    .restart local v12       #key:Landroid/content/ComponentName;
    :cond_b
    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2253
    if-eqz p7, :cond_9

    .line 2254
    iget-object v0, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    move-object/from16 v17, v0

    move-object/from16 v0, p7

    move-object/from16 v1, v17

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method infoFromShortcutIntent(Landroid/content/Context;Landroid/content/Intent;Landroid/graphics/Bitmap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 16
    .parameter "context"
    .parameter "data"
    .parameter "fallbackIcon"

    .prologue
    .line 2375
    const-string v13, "android.intent.extra.shortcut.INTENT"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Landroid/content/Intent;

    .line 2376
    .local v9, intent:Landroid/content/Intent;
    const-string v13, "android.intent.extra.shortcut.NAME"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2377
    .local v10, name:Ljava/lang/String;
    const-string v13, "android.intent.extra.shortcut.ICON"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    .line 2379
    .local v1, bitmap:Landroid/os/Parcelable;
    if-nez v9, :cond_0

    .line 2381
    const-string v13, "Trebuchet.LauncherModel"

    const-string v14, "Can\'t construct ShorcutInfo with null intent"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2382
    const/4 v8, 0x0

    .line 2426
    .end local v1           #bitmap:Landroid/os/Parcelable;
    :goto_0
    return-object v8

    .line 2385
    .restart local v1       #bitmap:Landroid/os/Parcelable;
    :cond_0
    const/4 v5, 0x0

    .line 2386
    .local v5, icon:Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 2387
    .local v2, customIcon:Z
    const/4 v6, 0x0

    .line 2389
    .local v6, iconResource:Landroid/content/Intent$ShortcutIconResource;
    if-eqz v1, :cond_3

    instance-of v13, v1, Landroid/graphics/Bitmap;

    if-eqz v13, :cond_3

    .line 2390
    new-instance v13, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    check-cast v1, Landroid/graphics/Bitmap;

    .end local v1           #bitmap:Landroid/os/Parcelable;
    invoke-direct {v13, v1}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    move-object/from16 v0, p1

    invoke-static {v13, v0}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 2391
    const/4 v2, 0x1

    .line 2409
    :cond_1
    :goto_1
    new-instance v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {v8}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;-><init>()V

    .line 2411
    .local v8, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-nez v5, :cond_2

    .line 2412
    if-eqz p3, :cond_4

    .line 2413
    move-object/from16 v5, p3

    .line 2419
    :cond_2
    :goto_2
    invoke-virtual {v8, v5}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setIcon(Landroid/graphics/Bitmap;)V

    .line 2421
    iput-object v10, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 2422
    iput-object v9, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 2423
    iput-boolean v2, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 2424
    iput-object v6, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    goto :goto_0

    .line 2393
    .end local v8           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v1       #bitmap:Landroid/os/Parcelable;
    :cond_3
    const-string v13, "android.intent.extra.shortcut.ICON_RESOURCE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    .line 2394
    .local v4, extra:Landroid/os/Parcelable;
    if-eqz v4, :cond_1

    instance-of v13, v4, Landroid/content/Intent$ShortcutIconResource;

    if-eqz v13, :cond_1

    .line 2396
    :try_start_0
    move-object v0, v4

    check-cast v0, Landroid/content/Intent$ShortcutIconResource;

    move-object v6, v0

    .line 2397
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    .line 2398
    .local v11, packageManager:Landroid/content/pm/PackageManager;
    iget-object v13, v6, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v13}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v12

    .line 2400
    .local v12, resources:Landroid/content/res/Resources;
    iget-object v13, v6, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v12, v13, v14, v15}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 2401
    .local v7, id:I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v13, v12, v7}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-static {v13, v0}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 2403
    .end local v7           #id:I
    .end local v11           #packageManager:Landroid/content/pm/PackageManager;
    .end local v12           #resources:Landroid/content/res/Resources;
    :catch_0
    move-exception v3

    .line 2404
    .local v3, e:Ljava/lang/Exception;
    const-string v13, "Trebuchet.LauncherModel"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Could not load shortcut icon: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2415
    .end local v1           #bitmap:Landroid/os/Parcelable;
    .end local v3           #e:Ljava/lang/Exception;
    .end local v4           #extra:Landroid/os/Parcelable;
    .restart local v8       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFallbackIcon()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 2416
    const/4 v13, 0x1

    iput-boolean v13, v8, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    goto :goto_2
.end method

.method public initialize(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)V
    .locals 2
    .parameter "callbacks"

    .prologue
    .line 787
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 788
    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    .line 789
    monitor-exit v1

    .line 790
    return-void

    .line 789
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isAllAppsLoaded()Z
    .locals 1

    .prologue
    .line 971
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z

    return v0
.end method

.method isLoadingWorkspace()Z
    .locals 2

    .prologue
    .line 975
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 976
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    if-eqz v0, :cond_0

    .line 977
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->isLoadingWorkspace()Z

    move-result v0

    monitor-exit v1

    .line 980
    :goto_0
    return v0

    .line 979
    :cond_0
    monitor-exit v1

    .line 980
    const/4 v0, 0x0

    goto :goto_0

    .line 979
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 800
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 802
    .local v0, action:Ljava/lang/String;
    const-string v7, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 805
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v4

    .line 806
    .local v4, packageName:Ljava/lang/String;
    const-string v7, "android.intent.extra.REPLACING"

    invoke-virtual {p2, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    .line 808
    .local v6, replacing:Z
    const/4 v3, 0x0

    .line 810
    .local v3, op:I
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2

    .line 869
    .end local v3           #op:I
    .end local v4           #packageName:Ljava/lang/String;
    .end local v6           #replacing:Z
    :cond_1
    :goto_0
    return-void

    .line 815
    .restart local v3       #op:I
    .restart local v4       #packageName:Ljava/lang/String;
    .restart local v6       #replacing:Z
    :cond_2
    const-string v7, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 816
    const/4 v3, 0x2

    .line 831
    :cond_3
    :goto_1
    if-eqz v3, :cond_1

    .line 832
    new-instance v7, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;

    new-array v8, v8, [Ljava/lang/String;

    aput-object v4, v8, v9

    invoke-direct {v7, p0, v3, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel;I[Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->enqueuePackageUpdated(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;)V

    goto :goto_0

    .line 817
    :cond_4
    const-string v7, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 818
    if-nez v6, :cond_3

    .line 819
    const/4 v3, 0x3

    goto :goto_1

    .line 823
    :cond_5
    const-string v7, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 824
    if-nez v6, :cond_6

    .line 825
    const/4 v3, 0x1

    goto :goto_1

    .line 827
    :cond_6
    const/4 v3, 0x2

    goto :goto_1

    .line 835
    .end local v3           #op:I
    .end local v4           #packageName:Ljava/lang/String;
    .end local v6           #replacing:Z
    :cond_7
    const-string v7, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 837
    const-string v7, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 838
    .local v5, packages:[Ljava/lang/String;
    new-instance v7, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;

    invoke-direct {v7, p0, v8, v5}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel;I[Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->enqueuePackageUpdated(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;)V

    .line 840
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoaderFromBackground()V

    goto :goto_0

    .line 841
    .end local v5           #packages:[Ljava/lang/String;
    :cond_8
    const-string v7, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 842
    const-string v7, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 843
    .restart local v5       #packages:[Ljava/lang/String;
    new-instance v7, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;

    const/4 v8, 0x4

    invoke-direct {v7, p0, v8, v5}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel;I[Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->enqueuePackageUpdated(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;)V

    goto :goto_0

    .line 845
    .end local v5           #packages:[Ljava/lang/String;
    :cond_9
    const-string v7, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 847
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->forceReload()V

    goto :goto_0

    .line 848
    :cond_a
    const-string v7, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 852
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    .line 853
    .local v2, currentConfig:Landroid/content/res/Configuration;
    iget v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mPreviousConfigMcc:I

    iget v8, v2, Landroid/content/res/Configuration;->mcc:I

    if-eq v7, v8, :cond_b

    .line 854
    const-string v7, "Trebuchet.LauncherModel"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Reload apps on config change. curr_mcc:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v2, Landroid/content/res/Configuration;->mcc:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " prevmcc:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mPreviousConfigMcc:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 856
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->forceReload()V

    .line 859
    :cond_b
    iget v7, v2, Landroid/content/res/Configuration;->mcc:I

    iput v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mPreviousConfigMcc:I

    goto/16 :goto_0

    .line 860
    .end local v2           #currentConfig:Landroid/content/res/Configuration;
    :cond_c
    const-string v7, "android.search.action.GLOBAL_SEARCH_ACTIVITY_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    const-string v7, "android.search.action.SEARCHABLES_CHANGED"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 862
    :cond_d
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    if-eqz v7, :cond_1

    .line 863
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 864
    .local v1, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-eqz v1, :cond_1

    .line 865
    invoke-interface {v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->bindSearchablesChanged()V

    goto/16 :goto_0
.end method

.method queueIconToBeChecked(Ljava/util/HashMap;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/database/Cursor;I)Z
    .locals 2
    .parameter
    .parameter "info"
    .parameter "c"
    .parameter "iconIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "[B>;",
            "Lcom/cyanogenmod/trebuchet/ShortcutInfo;",
            "Landroid/database/Cursor;",
            "I)Z"
        }
    .end annotation

    .prologue
    .local p1, cache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;[B>;"
    const/4 v0, 0x0

    .line 2432
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAppsCanBeOnExternalStorage:Z

    if-nez v1, :cond_1

    .line 2445
    :cond_0
    :goto_0
    return v0

    .line 2441
    :cond_1
    iget-boolean v1, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    if-nez v1, :cond_0

    iget-boolean v1, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    if-nez v1, :cond_0

    .line 2442
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2443
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public resetLoadedState(ZZ)V
    .locals 2
    .parameter "resetAllAppsLoaded"
    .parameter "resetWorkspaceLoaded"

    .prologue
    .line 881
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 884
    :try_start_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->stopLoaderLocked()Z

    .line 885
    if-eqz p1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z

    .line 886
    :cond_0
    if-eqz p2, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z

    .line 887
    :cond_1
    monitor-exit v1

    .line 888
    return-void

    .line 887
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public startLoader(ZI)V
    .locals 3
    .parameter "isLaunching"
    .parameter "synchronousBindPage"

    .prologue
    .line 927
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 934
    :try_start_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 937
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 940
    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->stopLoaderLocked()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const/4 p1, 0x1

    .line 941
    :goto_0
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;

    invoke-direct {v0, p0, v2, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel;Landroid/content/Context;Z)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    .line 942
    const/4 v0, -0x1

    if-le p2, v0, :cond_3

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mAllAppsLoaded:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mWorkspaceLoaded:Z

    if-eqz v0, :cond_3

    .line 943
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->runBindSynchronousPage(I)V

    .line 949
    :cond_1
    :goto_1
    monitor-exit v1

    .line 950
    return-void

    .line 940
    :cond_2
    const/4 p1, 0x0

    goto :goto_0

    .line 945
    :cond_3
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Landroid/os/HandlerThread;->setPriority(I)V

    .line 946
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorker:Landroid/os/Handler;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 949
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public startLoaderFromBackground()V
    .locals 4

    .prologue
    .line 897
    const/4 v1, 0x0

    .line 898
    .local v1, runLoader:Z
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    .line 899
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    .line 900
    .local v0, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    if-eqz v0, :cond_0

    .line 902
    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;->setLoadOnResume()Z

    move-result v2

    if-nez v2, :cond_0

    .line 903
    const/4 v1, 0x1

    .line 907
    .end local v0           #callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    :cond_0
    if-eqz v1, :cond_1

    .line 908
    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-virtual {p0, v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoader(ZI)V

    .line 910
    :cond_1
    return-void
.end method

.method public stopLoader()V
    .locals 2

    .prologue
    .line 963
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 964
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    if-eqz v0, :cond_0

    .line 965
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mLoaderTask:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->stopLocked()V

    .line 967
    :cond_0
    monitor-exit v1

    .line 968
    return-void

    .line 967
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unbindItemInfosAndClearQueuedBindRunnables()V
    .locals 2

    .prologue
    .line 205
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->sWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 206
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Expected unbindLauncherItemInfos() to be called from the main thread"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mDeferredBindRunnables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 213
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->cancelAllRunnablesOfType(I)V

    .line 215
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->unbindWorkspaceItemsOnMainThread()V

    .line 216
    return-void
.end method

.method unbindWorkspaceItemsOnMainThread()V
    .locals 5

    .prologue
    .line 222
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v2, tmpWorkspaceItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v1, tmpAppWidgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v4

    .line 225
    :try_start_0
    sget-object v3, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 226
    sget-object v3, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgAppWidgets:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 227
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherModel$1;

    invoke-direct {v0, p0, v2, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$1;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 239
    .local v0, r:Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 240
    return-void

    .line 227
    .end local v0           #r:Ljava/lang/Runnable;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method updateSavedIcon(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ShortcutInfo;[B)V
    .locals 7
    .parameter "context"
    .parameter "info"
    .parameter "data"

    .prologue
    const/4 v4, 0x0

    .line 2448
    const/4 v2, 0x0

    .line 2450
    .local v2, needSave:Z
    if-eqz p3, :cond_2

    .line 2451
    const/4 v5, 0x0

    :try_start_0
    array-length v6, p3

    invoke-static {p3, v5, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 2452
    .local v3, saved:Landroid/graphics/Bitmap;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/LauncherModel;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {p2, v5}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->getIcon(Lcom/cyanogenmod/trebuchet/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 2453
    .local v1, loaded:Landroid/graphics/Bitmap;
    invoke-virtual {v3, v1}, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_1

    const/4 v2, 0x1

    .line 2460
    .end local v1           #loaded:Landroid/graphics/Bitmap;
    .end local v3           #saved:Landroid/graphics/Bitmap;
    :goto_0
    if-eqz v2, :cond_0

    .line 2461
    const-string v4, "Trebuchet.LauncherModel"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "going to save icon bitmap for info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2464
    invoke-static {p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 2466
    :cond_0
    return-void

    .restart local v1       #loaded:Landroid/graphics/Bitmap;
    .restart local v3       #saved:Landroid/graphics/Bitmap;
    :cond_1
    move v2, v4

    .line 2453
    goto :goto_0

    .line 2455
    .end local v1           #loaded:Landroid/graphics/Bitmap;
    .end local v3           #saved:Landroid/graphics/Bitmap;
    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    .line 2457
    :catch_0
    move-exception v0

    .line 2458
    .local v0, e:Ljava/lang/Exception;
    const/4 v2, 0x1

    goto :goto_0
.end method
