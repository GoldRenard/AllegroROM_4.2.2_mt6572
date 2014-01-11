.class public Lcom/cyanogenmod/trebuchet/LauncherApplication;
.super Landroid/app/Application;
.source "LauncherApplication.java"


# static fields
.field private static sIsScreenLarge:Z = false

.field private static sLongPressTimeout:I = 0x0

.field private static sScreenDensity:F = 0.0f

.field private static final sSharedPreferencesKey:Ljava/lang/String; = "com.cyanogenmod.trebuchet.prefs"


# instance fields
.field private final mFavoritesObserver:Landroid/database/ContentObserver;

.field public mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field mLauncherProvider:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/cyanogenmod/trebuchet/LauncherProvider;",
            ">;"
        }
    .end annotation
.end field

.field public mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/16 v0, 0x12c

    sput v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sLongPressTimeout:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 94
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherApplication$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/trebuchet/LauncherApplication$1;-><init>(Lcom/cyanogenmod/trebuchet/LauncherApplication;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method public static getLongPressTimeout()I
    .locals 1

    .prologue
    .line 143
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sLongPressTimeout:I

    return v0
.end method

.method public static getScreenDensity()F
    .locals 1

    .prologue
    .line 139
    sget v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sScreenDensity:F

    return v0
.end method

.method public static getSharedPreferencesKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    const-string v0, "com.cyanogenmod.trebuchet.prefs"

    return-object v0
.end method

.method public static isScreenLandscape(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 134
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
    .line 130
    sget-boolean v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sIsScreenLarge:Z

    return v0
.end method


# virtual methods
.method getIconCache()Lcom/cyanogenmod/trebuchet/IconCache;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    return-object v0
.end method

.method getLauncherProvider()Lcom/cyanogenmod/trebuchet/LauncherProvider;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mLauncherProvider:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherProvider;

    return-object v0
.end method

.method getModel()Lcom/cyanogenmod/trebuchet/LauncherModel;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    return-object v0
.end method

.method public onCreate()V
    .locals 5

    .prologue
    .line 44
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 47
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0001

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    sput-boolean v2, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sIsScreenLarge:Z

    .line 48
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    sput v2, Lcom/cyanogenmod/trebuchet/LauncherApplication;->sScreenDensity:F

    .line 50
    new-instance v2, Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/IconCache;-><init>(Lcom/cyanogenmod/trebuchet/LauncherApplication;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 51
    new-instance v2, Lcom/cyanogenmod/trebuchet/LauncherModel;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-direct {v2, p0, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;-><init>(Lcom/cyanogenmod/trebuchet/LauncherApplication;Lcom/cyanogenmod/trebuchet/IconCache;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    .line 54
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 55
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 56
    const-string v2, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 57
    const-string v2, "package"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 58
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 59
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 60
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 61
    const-string v2, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 62
    const-string v2, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 63
    const-string v2, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 64
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 65
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 66
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v2, "android.search.action.GLOBAL_SEARCH_ACTIVITY_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 67
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 68
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 69
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v2, "android.search.action.SEARCHABLES_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 70
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 74
    .local v1, resolver:Landroid/content/ContentResolver;
    sget-object v2, Lcom/cyanogenmod/trebuchet/LauncherSettings$Favorites;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 76
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .prologue
    .line 83
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 85
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 87
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 88
    .local v0, resolver:Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mFavoritesObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 89
    return-void
.end method

.method setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/LauncherModel;
    .locals 1
    .parameter "launcher"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->initialize(Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)V

    .line 106
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    return-object v0
.end method

.method setLauncherProvider(Lcom/cyanogenmod/trebuchet/LauncherProvider;)V
    .locals 1
    .parameter "provider"

    .prologue
    .line 118
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherApplication;->mLauncherProvider:Ljava/lang/ref/WeakReference;

    .line 119
    return-void
.end method
