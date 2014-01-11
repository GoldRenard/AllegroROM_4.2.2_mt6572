.class public Lcom/android/launcher2/LauncherApplication;
.super Landroid/app/Application;
.source "LauncherApplication.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LauncherApplication"

.field private static sIsScreenLarge:Z = false

.field private static sLongPressTimeout:I = 0x0

.field private static sScreenDensity:F = 0.0f

.field private static final sSharedPreferencesKey:Ljava/lang/String; = "com.android.launcher2.prefs"


# instance fields
.field private mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

.field private final mFavoritesObserver:Landroid/database/ContentObserver;

.field public mIconCache:Lcom/android/launcher2/IconCache;

.field mLauncherProvider:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/launcher2/LauncherProvider;",
            ">;"
        }
    .end annotation
.end field

.field public mModel:Lcom/android/launcher2/LauncherModel;

.field private mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const/16 v0, 0x12c

    sput v0, Lcom/android/launcher2/LauncherApplication;->sLongPressTimeout:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 142
    new-instance v0, Lcom/android/launcher2/LauncherApplication$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/launcher2/LauncherApplication$1;-><init>(Lcom/android/launcher2/LauncherApplication;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method public static getLongPressTimeout()I
    .locals 1

    .prologue
    .line 211
    sget v0, Lcom/android/launcher2/LauncherApplication;->sLongPressTimeout:I

    return v0
.end method

.method public static getScreenDensity()F
    .locals 1

    .prologue
    .line 207
    sget v0, Lcom/android/launcher2/LauncherApplication;->sScreenDensity:F

    return v0
.end method

.method public static getSharedPreferencesKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    const-string v0, "com.android.launcher2.prefs"

    return-object v0
.end method

.method public static isScreenLandscape(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 202
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isScreenLarge()Z
    .locals 1

    .prologue
    .line 198
    sget-boolean v0, Lcom/android/launcher2/LauncherApplication;->sIsScreenLarge:Z

    return v0
.end method


# virtual methods
.method public getCurrentScene()Lcom/android/launcher2/SceneChooser$SceneMetaData;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

    if-nez v0, :cond_0

    .line 237
    new-instance v0, Lcom/android/launcher2/SceneChooser$SceneMetaData;

    invoke-direct {v0}, Lcom/android/launcher2/SceneChooser$SceneMetaData;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

    .line 238
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

    invoke-static {p0, v0}, Lcom/android/launcher2/SceneChooser;->getSceneSetting(Landroid/content/Context;Lcom/android/launcher2/SceneChooser$SceneMetaData;)V

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

    return-object v0
.end method

.method public getCurrentSceneName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getCurrentScene()Lcom/android/launcher2/SceneChooser$SceneMetaData;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher2/SceneChooser$SceneMetaData;->sceneNameResId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getIconCache()Lcom/android/launcher2/IconCache;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mIconCache:Lcom/android/launcher2/IconCache;

    return-object v0
.end method

.method getLauncherProvider()Lcom/android/launcher2/LauncherProvider;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mLauncherProvider:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherProvider;

    return-object v0
.end method

.method getModel()Lcom/android/launcher2/LauncherModel;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    return-object v0
.end method

.method public getUnreadLoader()Lcom/android/launcher2/MTKUnreadLoader;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    return-object v0
.end method

.method public onCreate()V
    .locals 11

    .prologue
    .line 58
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 61
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090001

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    sput-boolean v8, Lcom/android/launcher2/LauncherApplication;->sIsScreenLarge:Z

    .line 62
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    sput v8, Lcom/android/launcher2/LauncherApplication;->sScreenDensity:F

    .line 64
    new-instance v8, Lcom/android/launcher2/IconCache;

    invoke-direct {v8, p0}, Lcom/android/launcher2/IconCache;-><init>(Lcom/android/launcher2/LauncherApplication;)V

    iput-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mIconCache:Lcom/android/launcher2/IconCache;

    .line 65
    new-instance v8, Lcom/android/launcher2/LauncherModel;

    iget-object v9, p0, Lcom/android/launcher2/LauncherApplication;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-direct {v8, p0, v9}, Lcom/android/launcher2/LauncherModel;-><init>(Lcom/android/launcher2/LauncherApplication;Lcom/android/launcher2/IconCache;)V

    iput-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    .line 68
    new-instance v1, Landroid/content/IntentFilter;

    const-string v8, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v1, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v8, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 70
    const-string v8, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 71
    const-string v8, "package"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 72
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 74
    .restart local v1       #filter:Landroid/content/IntentFilter;
    const-string v8, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 75
    const-string v8, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 76
    const-string v8, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 77
    const-string v8, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 78
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 79
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 80
    .restart local v1       #filter:Landroid/content/IntentFilter;
    const-string v8, "android.search.action.GLOBAL_SEARCH_ACTIVITY_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 81
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 82
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 83
    .restart local v1       #filter:Landroid/content/IntentFilter;
    const-string v8, "android.search.action.SEARCHABLES_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 84
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 88
    const-string v7, "com.android.launcher:wallpaper_chooser"

    .line 89
    .local v7, wallPaperChooserProcessName:Ljava/lang/String;
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    .line 90
    .local v3, myPid:I
    const-string v8, "activity"

    invoke-virtual {p0, v8}, Lcom/android/launcher2/LauncherApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 91
    .local v0, actvityManager:Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v5

    .line 92
    .local v5, procInfoLists:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 93
    .local v4, procInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v8, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v3, v8, :cond_0

    .line 94
    iget-object v8, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    const-string v9, "com.android.launcher:wallpaper_chooser"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 95
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 96
    .restart local v1       #filter:Landroid/content/IntentFilter;
    const-string v8, "com.mediatek.intent.action.SWITCH_SCENE"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 97
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_0

    .line 104
    .end local v4           #procInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_1
    new-instance v8, Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/launcher2/MTKUnreadLoader;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    .line 106
    new-instance v1, Landroid/content/IntentFilter;

    .end local v1           #filter:Landroid/content/IntentFilter;
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 107
    .restart local v1       #filter:Landroid/content/IntentFilter;
    const-string v8, "com.mediatek.action.UNREAD_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 108
    iget-object v8, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {p0, v8, v1}, Lcom/android/launcher2/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 112
    const-string v8, "LauncherApplication"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LauncherApplication onCreate: mIconCache = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/launcher2/LauncherApplication;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", mModel = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", mUnreadLoader = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", this = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 118
    .local v6, resolver:Landroid/content/ContentResolver;
    sget-object v8, Lcom/android/launcher2/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v9, 0x1

    iget-object v10, p0, Lcom/android/launcher2/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    invoke-virtual {v6, v8, v9, v10}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 120
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .prologue
    .line 127
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 129
    iget-object v1, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/LauncherApplication;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 132
    iget-object v1, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/LauncherApplication;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 135
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherApplication;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 136
    .local v0, resolver:Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/android/launcher2/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 137
    return-void
.end method

.method public setCurrentScene(Lcom/android/launcher2/SceneChooser$SceneMetaData;)V
    .locals 0
    .parameter "curScene"

    .prologue
    .line 249
    iput-object p1, p0, Lcom/android/launcher2/LauncherApplication;->mCurrentScene:Lcom/android/launcher2/SceneChooser$SceneMetaData;

    .line 250
    return-void
.end method

.method setLauncher(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/LauncherModel;
    .locals 1
    .parameter "launcher"

    .prologue
    .line 169
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/LauncherModel;->initialize(Lcom/android/launcher2/LauncherModel$Callbacks;)V

    .line 172
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/MTKUnreadLoader;->initialize(Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;)V

    .line 174
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    return-object v0
.end method

.method setLauncherProvider(Lcom/android/launcher2/LauncherProvider;)V
    .locals 1
    .parameter "provider"

    .prologue
    .line 186
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mLauncherProvider:Ljava/lang/ref/WeakReference;

    .line 187
    return-void
.end method

.method public triggerLoadingDatabaseManually()V
    .locals 3

    .prologue
    .line 255
    const-string v0, "LauncherApplication"

    const-string v1, "triggerLoadingDatabaseManually"

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/LauncherModel;->resetLoadedState(ZZ)V

    .line 258
    iget-object v0, p0, Lcom/android/launcher2/LauncherApplication;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v0}, Lcom/android/launcher2/LauncherModel;->startLoaderFromBackground()V

    .line 259
    return-void
.end method
