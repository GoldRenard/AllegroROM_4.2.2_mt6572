.class public Lcom/android/browser/BrowserSettings;
.super Ljava/lang/Object;
.source "BrowserSettings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Lcom/android/browser/PreferenceKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/BrowserSettings$2;
    }
.end annotation


# static fields
.field private static final DEAULT_PRELOAD_SECURE_SETTING_KEY:Ljava/lang/String; = "browser_default_preload_setting"

.field public static final DEFAULT_DOWNLOAD_DIRECTORY_OP01:Ljava/lang/String; = "/storage/sdcard0/MyFavorite"

.field public static final DEFAULT_DOWNLOAD_SDCARD2_DIRECTORY_OP01:Ljava/lang/String; = "/storage/sdcard1/MyFavorite"

.field private static final DEFAULT_FONT_FAMILY:Ljava/lang/String; = "Sans-serif"

.field private static final DEFAULT_LINK_PREFETCH_SECURE_SETTING_KEY:Ljava/lang/String; = "browser_default_link_prefetch_setting"

.field public static final DEFAULT_MY_FAVORITE_FOLDER_OP01:Ljava/lang/String; = "/MyFavorite"

.field private static final DESKTOP_USERAGENT:Ljava/lang/String; = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.34 Safari/534.24"

.field private static final DOUBLE_TAP_ZOOM_START_VAL:I = 0x5

.field private static final DOUBLE_TAP_ZOOM_STEP:I = 0x5

.field private static final FROYO_USERAGENT:Ljava/lang/String; = "Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

.field public static final GAMELOFT_UA_STRING:Ljava/lang/String; = "Mozilla/5.0 (Linux; U; Android 4.1.1; zh-cn; 158; mt6575; 480*800; 4G+4G; Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"

.field private static final GOOGLE:Ljava/lang/String; = "google"

.field private static final HONEYCOMB_USERAGENT:Ljava/lang/String; = "Mozilla/5.0 (Linux; U; Android 3.1; en-us; Xoom Build/HMJ25) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13"

.field private static final IPAD_USERAGENT:Ljava/lang/String; = "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10"

.field private static final IPHONE_USERAGENT:Ljava/lang/String; = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"

.field private static final MIN_FONT_SIZE_OFFSET:I = 0x5

.field private static final TEXT_ZOOM_START_VAL:I = 0xa

.field private static final TEXT_ZOOM_STEP:I = 0x5

.field private static final USER_AGENTS:[Ljava/lang/String; = null

.field public static final XLOGTAG:Ljava/lang/String; = "Browser/Settings"

.field private static sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private static sFactoryResetUrl:Ljava/lang/String;

.field private static sInitialized:Z

.field private static sInstance:Lcom/android/browser/BrowserSettings;


# instance fields
.field private mAppCachePath:Ljava/lang/String;

.field private mAutofillHandler:Lcom/android/browser/AutofillHandler;

.field private mContext:Landroid/content/Context;

.field private mController:Lcom/android/browser/Controller;

.field private mCustomUserAgents:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/webkit/WebSettings;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFontSizeMult:F

.field private mLinkPrefetchAllowed:Z

.field private mManagedSettings:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/webkit/WebSettings;",
            ">;>;"
        }
    .end annotation
.end field

.field private mNeedsSharedSync:Z

.field private mPageCacheCapacity:I

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mSearchEngine:Lcom/android/browser/search/SearchEngine;

.field private mSetup:Ljava/lang/Runnable;

.field private mWebStorageSizeManager:Lcom/android/browser/WebStorageSizeManager;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 106
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    aput-object v4, v0, v3

    const/4 v1, 0x1

    const-string v2, "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.34 Safari/534.24"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Mozilla/5.0 (Linux; U; Android 3.1; en-us; Xoom Build/HMJ25) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/browser/BrowserSettings;->USER_AGENTS:[Ljava/lang/String;

    .line 142
    sput-boolean v3, Lcom/android/browser/BrowserSettings;->sInitialized:Z

    .line 215
    sput-object v4, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    .line 178
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-boolean v1, p0, Lcom/android/browser/BrowserSettings;->mNeedsSharedSync:Z

    .line 144
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/android/browser/BrowserSettings;->mFontSizeMult:F

    .line 147
    iput-boolean v1, p0, Lcom/android/browser/BrowserSettings;->mLinkPrefetchAllowed:Z

    .line 150
    iput v1, p0, Lcom/android/browser/BrowserSettings;->mPageCacheCapacity:I

    .line 228
    new-instance v0, Lcom/android/browser/BrowserSettings$1;

    invoke-direct {v0, p0}, Lcom/android/browser/BrowserSettings$1;-><init>(Lcom/android/browser/BrowserSettings;)V

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mSetup:Ljava/lang/Runnable;

    .line 179
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    .line 180
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    .line 181
    new-instance v0, Lcom/android/browser/AutofillHandler;

    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/browser/AutofillHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mAutofillHandler:Lcom/android/browser/AutofillHandler;

    .line 182
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    .line 183
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    .line 184
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mAutofillHandler:Lcom/android/browser/AutofillHandler;

    invoke-virtual {v0}, Lcom/android/browser/AutofillHandler;->asyncLoadFromDb()V

    .line 185
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mSetup:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/android/browser/BackgroundHandler;->execute(Ljava/lang/Runnable;)V

    .line 186
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/BrowserSettings;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/browser/BrowserSettings;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    iput p1, p0, Lcom/android/browser/BrowserSettings;->mFontSizeMult:F

    return p1
.end method

.method static synthetic access$202(Lcom/android/browser/BrowserSettings;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    iput p1, p0, Lcom/android/browser/BrowserSettings;->mPageCacheCapacity:I

    return p1
.end method

.method static synthetic access$302(Lcom/android/browser/BrowserSettings;Lcom/android/browser/WebStorageSizeManager;)Lcom/android/browser/WebStorageSizeManager;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    iput-object p1, p0, Lcom/android/browser/BrowserSettings;->mWebStorageSizeManager:Lcom/android/browser/WebStorageSizeManager;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/browser/BrowserSettings;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->getAppCachePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/browser/BrowserSettings;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/browser/BrowserSettings;)Landroid/webkit/WebSettings$TextSize;
    .locals 1
    .parameter "x0"

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->getTextSize()Landroid/webkit/WebSettings$TextSize;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"

    .prologue
    .line 82
    sput-object p0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$802(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 82
    sput-boolean p0, Lcom/android/browser/BrowserSettings;->sInitialized:Z

    return p0
.end method

.method public static getAdjustedMinimumFontSize(I)I
    .locals 1
    .parameter "rawValue"

    .prologue
    .line 713
    add-int/lit8 p0, p0, 0x1

    .line 714
    const/4 v0, 0x1

    if-le p0, v0, :cond_0

    .line 715
    add-int/lit8 p0, p0, 0x3

    .line 717
    :cond_0
    return p0
.end method

.method private getAppCachePath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 580
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mAppCachePath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 581
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v1, "appcache"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserSettings;->mAppCachePath:Ljava/lang/String;

    .line 583
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mAppCachePath:Ljava/lang/String;

    return-object v0
.end method

.method public static getFactoryResetHomeUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "context"

    .prologue
    .line 532
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 533
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    return-object v0
.end method

.method public static getFactoryResetUrlFromRes(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 315
    invoke-static {p0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    sput-object v0, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 316
    sget-object v0, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getCustomerHomepage()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    .line 318
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 319
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c015d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    .line 322
    :cond_0
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    const-string v1, "{CID}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 323
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    const-string v1, "{CID}"

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2}, Lcom/android/browser/provider/BrowserProvider;->getClientId(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    .line 326
    :cond_1
    sget-object v0, Lcom/android/browser/BrowserSettings;->sFactoryResetUrl:Ljava/lang/String;

    return-object v0
.end method

.method public static getInstance()Lcom/android/browser/BrowserSettings;
    .locals 1

    .prologue
    .line 175
    sget-object v0, Lcom/android/browser/BrowserSettings;->sInstance:Lcom/android/browser/BrowserSettings;

    return-object v0
.end method

.method public static getLinkPrefetchAlwaysPreferenceString(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 1121
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c013d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLinkPrefetchOnWifiOnlyPreferenceString(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 1117
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c013c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPreloadAlwaysPreferenceString(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 1097
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0137

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPreloadOnWifiOnlyPreferenceString(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 1093
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0136

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getRawDoubleTapZoom(I)I
    .locals 1
    .parameter "percent"

    .prologue
    .line 735
    add-int/lit8 v0, p0, -0x64

    div-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x5

    return v0
.end method

.method static getRawTextZoom(I)I
    .locals 1
    .parameter "percent"

    .prologue
    .line 726
    add-int/lit8 v0, p0, -0x64

    div-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method private getTextSize()Landroid/webkit/WebSettings$TextSize;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 779
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "text_size"

    const-string v3, "NORMAL"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 780
    .local v0, textSize:Ljava/lang/String;
    invoke-static {v0}, Landroid/webkit/WebSettings$TextSize;->valueOf(Ljava/lang/String;)Landroid/webkit/WebSettings$TextSize;

    move-result-object v1

    return-object v1
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 171
    new-instance v0, Lcom/android/browser/BrowserSettings;

    invoke-direct {v0, p0}, Lcom/android/browser/BrowserSettings;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/browser/BrowserSettings;->sInstance:Lcom/android/browser/BrowserSettings;

    .line 172
    return-void
.end method

.method private static requireInitialization()V
    .locals 2

    .prologue
    .line 331
    const-class v1, Lcom/android/browser/BrowserSettings;

    monitor-enter v1

    .line 332
    :goto_0
    :try_start_0
    sget-boolean v0, Lcom/android/browser/BrowserSettings;->sInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 334
    :try_start_1
    const-class v0, Lcom/android/browser/BrowserSettings;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 335
    :catch_0
    move-exception v0

    goto :goto_0

    .line 338
    :cond_0
    :try_start_2
    monitor-exit v1

    .line 339
    return-void

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method private resetCachedValues()V
    .locals 1

    .prologue
    .line 674
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/browser/BrowserSettings;->updateSearchEngine(Z)V

    .line 675
    return-void
.end method

.method private syncManagedSettings()V
    .locals 5

    .prologue
    .line 478
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncSharedSettings()V

    .line 479
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    monitor-enter v4

    .line 480
    :try_start_0
    iget-object v3, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 481
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 482
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 483
    .local v1, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebSettingsClassic;

    .line 484
    .local v2, settings:Landroid/webkit/WebSettingsClassic;
    if-nez v2, :cond_0

    .line 485
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 490
    .end local v0           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;>;"
    .end local v1           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    .end local v2           #settings:Landroid/webkit/WebSettingsClassic;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 488
    .restart local v0       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;>;"
    .restart local v1       #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    .restart local v2       #settings:Landroid/webkit/WebSettingsClassic;
    :cond_0
    :try_start_1
    invoke-direct {p0, v2}, Lcom/android/browser/BrowserSettings;->syncSetting(Landroid/webkit/WebSettingsClassic;)V

    goto :goto_0

    .line 490
    .end local v1           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    .end local v2           #settings:Landroid/webkit/WebSettingsClassic;
    :cond_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 491
    return-void
.end method

.method private syncSetting(Landroid/webkit/WebSettingsClassic;)V
    .locals 6
    .parameter "settings"

    .prologue
    .line 345
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableGeolocation()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setGeolocationEnabled(Z)V

    .line 346
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableJavascript()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setJavaScriptEnabled(Z)V

    .line 347
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableLightTouch()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setLightTouchEnabled(Z)V

    .line 348
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableNavDump()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setNavDump(Z)V

    .line 349
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isSkiaHardwareAccelerated()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setHardwareAccelSkiaEnabled(Z)V

    .line 350
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableVisualIndicator()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setShowVisualIndicator(Z)V

    .line 351
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDefaultTextEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setDefaultTextEncodingName(Ljava/lang/String;)V

    .line 352
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDefaultZoom()Landroid/webkit/WebSettings$ZoomDensity;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setDefaultZoom(Landroid/webkit/WebSettings$ZoomDensity;)V

    .line 353
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getMinimumFontSize()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setMinimumFontSize(I)V

    .line 354
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getMinimumFontSize()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setMinimumLogicalFontSize(I)V

    .line 355
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->forceEnableUserScalable()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setForceUserScalable(Z)V

    .line 356
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getPluginState()Landroid/webkit/WebSettings$PluginState;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 357
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getTextZoom()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setTextZoom(I)V

    .line 358
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDoubleTapZoom()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setDoubleTapZoom(I)V

    .line 359
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isAutofillEnabled()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setAutoFillEnabled(Z)V

    .line 360
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getLayoutAlgorithm()Landroid/webkit/WebSettings$LayoutAlgorithm;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 361
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->blockPopupWindows()Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v4, 0x1

    :goto_0
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 362
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->loadImages()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setLoadsImagesAutomatically(Z)V

    .line 363
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->loadPageInOverviewMode()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setLoadWithOverviewMode(Z)V

    .line 364
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->rememberPasswords()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setSavePassword(Z)V

    .line 365
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->saveFormdata()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setSaveFormData(Z)V

    .line 366
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isWideViewport()Z

    move-result v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setUseWideViewPort(Z)V

    .line 367
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getAutoFillProfile()Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setAutoFillProfile(Landroid/webkit/WebSettingsClassic$AutoFillProfile;)V

    .line 370
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getNotificationState()Landroid/webkit/WebSettings$NotificationState;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setNotificationState(Landroid/webkit/WebSettings$NotificationState;)V

    .line 375
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v4

    sput-object v4, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 376
    sget-object v4, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getFontFamily()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, p1, v5}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->setStandardFontFamily(Landroid/webkit/WebSettings;Ljava/lang/String;)V

    .line 378
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 379
    .local v2, ua:Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 380
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettingsClassic;->setUserAgentString(Ljava/lang/String;)V

    .line 405
    :goto_1
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->useInvertedRendering()Z

    move-result v3

    .line 407
    .local v3, useInverted:Z
    const-string v5, "inverted"

    if-eqz v3, :cond_8

    const-string v4, "true"

    :goto_2
    invoke-virtual {p1, v5, v4}, Landroid/webkit/WebSettingsClassic;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    if-eqz v3, :cond_0

    .line 410
    const-string v4, "inverted_contrast"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getInvertedContrast()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/webkit/WebSettingsClassic;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 415
    const-string v5, "enable_cpu_upload_path"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableCpuUploadPath()Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, "true"

    :goto_3
    invoke-virtual {p1, v5, v4}, Landroid/webkit/WebSettingsClassic;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    :cond_1
    iget-boolean v4, p0, Lcom/android/browser/BrowserSettings;->mLinkPrefetchAllowed:Z

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setLinkPrefetchEnabled(Z)V

    .line 420
    return-void

    .line 361
    .end local v2           #ua:Ljava/lang/String;
    .end local v3           #useInverted:Z
    :cond_2
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 383
    .restart local v2       #ua:Ljava/lang/String;
    :cond_3
    const-string v4, "browser"

    const-string v5, "UserAgent"

    invoke-static {v4, v5}, Lcom/mediatek/custom/CustomProperties;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, operatorUA:Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_5

    .line 386
    :cond_4
    sget-object v4, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-virtual {p1}, Landroid/webkit/WebSettingsClassic;->getUserAgentString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getOperatorUA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 387
    .local v1, pluginUA:Ljava/lang/String;
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    .line 388
    move-object v0, v1

    .line 391
    .end local v1           #pluginUA:Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getUserAgent()I

    move-result v4

    if-nez v4, :cond_6

    if-eqz v0, :cond_6

    .line 392
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_1

    .line 393
    :cond_6
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getUserAgent()I

    move-result v4

    if-nez v4, :cond_7

    .line 397
    const-string v4, "Mozilla/5.0 (Linux; U; Android 4.1.1; zh-cn; 158; mt6575; 480*800; 4G+4G; Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_1

    .line 400
    :cond_7
    sget-object v4, Lcom/android/browser/BrowserSettings;->USER_AGENTS:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getUserAgent()I

    move-result v5

    aget-object v4, v4, v5

    invoke-virtual {p1, v4}, Landroid/webkit/WebSettingsClassic;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_1

    .line 407
    .end local v0           #operatorUA:Ljava/lang/String;
    .restart local v3       #useInverted:Z
    :cond_8
    const-string v4, "false"

    goto :goto_2

    .line 415
    :cond_9
    const-string v4, "false"

    goto :goto_3
.end method

.method private syncSharedSettings()V
    .locals 2

    .prologue
    .line 470
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/BrowserSettings;->mNeedsSharedSync:Z

    .line 471
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->acceptCookies()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 472
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-eqz v0, :cond_0

    .line 473
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->enableJavascriptConsole()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/Controller;->setShouldShowErrorConsole(Z)V

    .line 475
    :cond_0
    return-void
.end method

.method private syncStaticSettings(Landroid/webkit/WebSettingsClassic;)V
    .locals 4
    .parameter "settings"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 427
    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setDefaultFontSize(I)V

    .line 428
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setDefaultFixedFontSize(I)V

    .line 429
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getPageCacheCapacity()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setPageCacheCapacity(I)V

    .line 432
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettingsClassic;->setNeedInitialFocus(Z)V

    .line 434
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setSupportMultipleWindows(Z)V

    .line 437
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setEnableSmoothTransition(Z)V

    .line 444
    const-string v0, "use_minimal_memory"

    const-string v1, "false"

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebSettingsClassic;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettingsClassic;->setAllowContentAccess(Z)V

    .line 449
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setAppCacheEnabled(Z)V

    .line 450
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setDatabaseEnabled(Z)V

    .line 451
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setDomStorageEnabled(Z)V

    .line 452
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettingsClassic;->setWorkersEnabled(Z)V

    .line 455
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getWebStorageSizeManager()Lcom/android/browser/WebStorageSizeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/WebStorageSizeManager;->getAppCacheMaxSize()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebSettingsClassic;->setAppCacheMaxSize(J)V

    .line 456
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->getAppCachePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setAppCachePath(Ljava/lang/String;)V

    .line 457
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v1, "databases"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setDatabasePath(Ljava/lang/String;)V

    .line 458
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v1, "geolocation"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setGeolocationDatabasePath(Ljava/lang/String;)V

    .line 460
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettingsClassic;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 461
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettingsClassic;->setAllowFileAccessFromFileURLs(Z)V

    .line 464
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v1, "webnotification"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettingsClassic;->setWebNotificationDatabasePath(Ljava/lang/String;)V

    .line 467
    return-void
.end method

.method private updateSearchEngine(Z)V
    .locals 2
    .parameter "force"

    .prologue
    .line 587
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getSearchEngineName()Ljava/lang/String;

    move-result-object v0

    .line 588
    .local v0, searchEngineName:Ljava/lang/String;
    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mSearchEngine:Lcom/android/browser/search/SearchEngine;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mSearchEngine:Lcom/android/browser/search/SearchEngine;

    invoke-interface {v1}, Lcom/android/browser/search/SearchEngine;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 590
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/android/browser/search/SearchEngines;->get(Landroid/content/Context;Ljava/lang/String;)Lcom/android/browser/search/SearchEngine;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BrowserSettings;->mSearchEngine:Lcom/android/browser/search/SearchEngine;

    .line 592
    :cond_1
    return-void
.end method


# virtual methods
.method public acceptCookies()Z
    .locals 3

    .prologue
    .line 1073
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "accept_cookies"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public allowAppTabs()Z
    .locals 3

    .prologue
    .line 834
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "allow_apptabs"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public autofitPages()Z
    .locals 3

    .prologue
    .line 862
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "autofit_pages"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public blockPopupWindows()Z
    .locals 3

    .prologue
    .line 866
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "block_popup_windows"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public clearCache()V
    .locals 2

    .prologue
    .line 617
    invoke-static {}, Landroid/webkit/WebIconDatabase;->getInstance()Landroid/webkit/WebIconDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebIconDatabase;->removeAllIcons()V

    .line 618
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-eqz v1, :cond_0

    .line 619
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 620
    .local v0, current:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 621
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 624
    .end local v0           #current:Landroid/webkit/WebView;
    :cond_0
    return-void
.end method

.method public clearCookies()V
    .locals 1

    .prologue
    .line 627
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 628
    return-void
.end method

.method public clearDatabases()V
    .locals 1

    .prologue
    .line 655
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebStorage;->deleteAllData()V

    .line 656
    return-void
.end method

.method public clearFormData()V
    .locals 2

    .prologue
    .line 639
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/webkit/WebViewDatabase;->getInstance(Landroid/content/Context;)Landroid/webkit/WebViewDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebViewDatabase;->clearFormData()V

    .line 640
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-eqz v1, :cond_0

    .line 641
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 642
    .local v0, currentTopView:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearFormData()V

    .line 646
    .end local v0           #currentTopView:Landroid/webkit/WebView;
    :cond_0
    return-void
.end method

.method public clearHistory()V
    .locals 3

    .prologue
    .line 631
    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 632
    .local v1, resolver:Landroid/content/ContentResolver;
    new-instance v0, Lcom/android/browser/BrowserHistoryPage$ClearHistoryTask;

    invoke-direct {v0, v1}, Lcom/android/browser/BrowserHistoryPage$ClearHistoryTask;-><init>(Landroid/content/ContentResolver;)V

    .line 633
    .local v0, clear:Lcom/android/browser/BrowserHistoryPage$ClearHistoryTask;
    invoke-virtual {v0}, Lcom/android/browser/BrowserHistoryPage$ClearHistoryTask;->isAlive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 634
    invoke-virtual {v0}, Lcom/android/browser/BrowserHistoryPage$ClearHistoryTask;->start()V

    .line 636
    :cond_0
    return-void
.end method

.method public clearLocationAccess()V
    .locals 1

    .prologue
    .line 659
    invoke-static {}, Landroid/webkit/GeolocationPermissions;->getInstance()Landroid/webkit/GeolocationPermissions;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/GeolocationPermissions;->clearAll()V

    .line 660
    return-void
.end method

.method public clearPasswords()V
    .locals 2

    .prologue
    .line 649
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/webkit/WebViewDatabase;->getInstance(Landroid/content/Context;)Landroid/webkit/WebViewDatabase;

    move-result-object v0

    .line 650
    .local v0, db:Landroid/webkit/WebViewDatabase;
    invoke-virtual {v0}, Landroid/webkit/WebViewDatabase;->clearUsernamePassword()V

    .line 651
    invoke-virtual {v0}, Landroid/webkit/WebViewDatabase;->clearHttpAuthUsernamePassword()V

    .line 652
    return-void
.end method

.method public clearWebNotifications()V
    .locals 2

    .prologue
    .line 573
    const-string v0, "Browser/Settings"

    const-string v1, "clearWebNotifications()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    invoke-static {}, Landroid/webkit/NotificationPermissions;->getInstance()Landroid/webkit/NotificationPermissions;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/NotificationPermissions;->clearAll()V

    .line 575
    return-void
.end method

.method public enableCpuUploadPath()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 967
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 970
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_cpu_upload_path"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public enableGeolocation()Z
    .locals 3

    .prologue
    .line 1081
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enable_geolocation"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public enableJavascript()Z
    .locals 3

    .prologue
    .line 842
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enable_javascript"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public enableJavascriptConsole()Z
    .locals 3

    .prologue
    .line 974
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 975
    const/4 v0, 0x0

    .line 977
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "javascript_console"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public enableLightTouch()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1009
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1012
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_light_touch"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public enableNavDump()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1016
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1019
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_nav_dump"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public enableVisualIndicator()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 960
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 963
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_visual_indicator"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public forceEnableUserScalable()Z
    .locals 3

    .prologue
    .line 789
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "force_userscalable"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getAdjustedDoubleTapZoom(I)I
    .locals 2
    .parameter "rawValue"

    .prologue
    .line 730
    add-int/lit8 v0, p1, -0x5

    mul-int/lit8 p1, v0, 0x5

    .line 731
    add-int/lit8 v0, p1, 0x64

    int-to-float v0, v0

    iget v1, p0, Lcom/android/browser/BrowserSettings;->mFontSizeMult:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getAdjustedTextZoom(I)I
    .locals 2
    .parameter "rawValue"

    .prologue
    .line 721
    add-int/lit8 v0, p1, -0xa

    mul-int/lit8 p1, v0, 0x5

    .line 722
    add-int/lit8 v0, p1, 0x64

    int-to-float v0, v0

    iget v1, p0, Lcom/android/browser/BrowserSettings;->mFontSizeMult:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getAutoFillProfile()Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    .locals 1

    .prologue
    .line 678
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mAutofillHandler:Lcom/android/browser/AutofillHandler;

    invoke-virtual {v0}, Lcom/android/browser/AutofillHandler;->getAutoFillProfile()Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultDownloadPathWithMultiSDcard()Ljava/lang/String;
    .locals 5

    .prologue
    .line 892
    const-string v0, "/storage/sdcard0/MyFavorite"

    .line 893
    .local v0, defaultDownloadPath:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v1

    .line 894
    .local v1, defaultStorage:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 895
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/MyFavorite"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 898
    :cond_0
    const-string v2, "Browser/Settings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "BrowserSettings: device default storage is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " defaultPath is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 900
    return-object v0
.end method

.method public getDefaultLinkPrefetchSetting()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1128
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "browser_default_link_prefetch_setting"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1130
    .local v0, preload:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1131
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c013e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1133
    :cond_0
    return-object v0
.end method

.method public getDefaultPreloadSetting()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1104
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "browser_default_preload_setting"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1106
    .local v0, preload:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1107
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0138

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1109
    :cond_0
    return-object v0
.end method

.method public getDefaultTextEncoding()Ljava/lang/String;
    .locals 3

    .prologue
    .line 874
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "default_text_encoding"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultZoom()Landroid/webkit/WebSettings$ZoomDensity;
    .locals 4

    .prologue
    .line 853
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "default_zoom"

    const-string v3, "MEDIUM"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 854
    .local v0, zoom:Ljava/lang/String;
    invoke-static {v0}, Landroid/webkit/WebSettings$ZoomDensity;->valueOf(Ljava/lang/String;)Landroid/webkit/WebSettings$ZoomDensity;

    move-result-object v1

    return-object v1
.end method

.method public getDoubleTapZoom()I
    .locals 4

    .prologue
    .line 807
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 808
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "double_tap_zoom"

    const/4 v3, 0x5

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 809
    .local v0, doubleTapZoom:I
    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserSettings;->getAdjustedDoubleTapZoom(I)I

    move-result v1

    return v1
.end method

.method public getDownloadPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 883
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "download_directory_setting"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDefaultDownloadPathWithMultiSDcard()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFontFamily()Ljava/lang/String;
    .locals 3

    .prologue
    .line 799
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "font_family"

    const-string v2, "Sans-serif"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHomePage()Ljava/lang/String;
    .locals 3

    .prologue
    .line 908
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "homepage"

    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/browser/BrowserSettings;->getFactoryResetHomeUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInvertedContrast()F
    .locals 4

    .prologue
    .line 1061
    const/high16 v0, 0x3f80

    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "inverted_contrast"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4120

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public getJsEngineFlags()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1023
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1024
    const-string v0, ""

    .line 1026
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "js_engine_flags"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getLastRecovered()J
    .locals 4

    .prologue
    .line 1149
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "last_recovered"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLayoutAlgorithm()Landroid/webkit/WebSettings$LayoutAlgorithm;
    .locals 2

    .prologue
    .line 537
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    .line 538
    .local v0, layoutAlgorithm:Landroid/webkit/WebSettings$LayoutAlgorithm;
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->autofitPages()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 539
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->NARROW_COLUMNS:Landroid/webkit/WebSettings$LayoutAlgorithm;

    .line 541
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 542
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isSmallScreen()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 543
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->SINGLE_COLUMN:Landroid/webkit/WebSettings$LayoutAlgorithm;

    .line 552
    :cond_1
    :goto_0
    return-object v0

    .line 545
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isNormalLayout()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 546
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    goto :goto_0

    .line 548
    :cond_3
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->NARROW_COLUMNS:Landroid/webkit/WebSettings$LayoutAlgorithm;

    goto :goto_0
.end method

.method public getLinkPrefetchEnabled()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1137
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "link_prefetch_when"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDefaultLinkPrefetchSetting()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMinimumFontSize()I
    .locals 4

    .prologue
    .line 784
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "min_font_size"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 785
    .local v0, minFont:I
    invoke-static {v0}, Lcom/android/browser/BrowserSettings;->getAdjustedMinimumFontSize(I)I

    move-result v1

    return v1
.end method

.method public getNotificationState()Landroid/webkit/WebSettings$NotificationState;
    .locals 4

    .prologue
    .line 567
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "notification_state"

    const-string v3, "ON"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 568
    .local v0, notificationState:Ljava/lang/String;
    const-string v1, "Browser/Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getNotificationState()"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    invoke-static {v0}, Landroid/webkit/WebSettings$NotificationState;->valueOf(Ljava/lang/String;)Landroid/webkit/WebSettings$NotificationState;

    move-result-object v1

    return-object v1
.end method

.method public getPageCacheCapacity()I
    .locals 1

    .prologue
    .line 556
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 557
    iget v0, p0, Lcom/android/browser/BrowserSettings;->mPageCacheCapacity:I

    return v0
.end method

.method public getPluginState()Landroid/webkit/WebSettings$PluginState;
    .locals 4

    .prologue
    .line 847
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "plugin_state"

    const-string v3, "ON"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 848
    .local v0, state:Ljava/lang/String;
    invoke-static {v0}, Landroid/webkit/WebSettings$PluginState;->valueOf(Ljava/lang/String;)Landroid/webkit/WebSettings$PluginState;

    move-result-object v1

    return-object v1
.end method

.method public getPreferences()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 739
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public getPreloadEnabled()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1113
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "preload_when"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getDefaultPreloadSetting()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSearchEngine()Lcom/android/browser/search/SearchEngine;
    .locals 1

    .prologue
    .line 595
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mSearchEngine:Lcom/android/browser/search/SearchEngine;

    if-nez v0, :cond_0

    .line 596
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/browser/BrowserSettings;->updateSearchEngine(Z)V

    .line 598
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mSearchEngine:Lcom/android/browser/search/SearchEngine;

    return-object v0
.end method

.method public getSearchEngineName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 823
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v1

    sput-object v1, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 824
    sget-object v1, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1, v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getSearchEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v0

    .line 825
    .local v0, searchEngine:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 826
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "search_engine"

    const-string v3, "google"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 828
    .end local v0           #searchEngine:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public getTextZoom()I
    .locals 4

    .prologue
    .line 793
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 794
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "text_zoom"

    const/16 v3, 0xa

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 795
    .local v0, textZoom:I
    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserSettings;->getAdjustedTextZoom(I)I

    move-result v1

    return v1
.end method

.method public getUserAgent()I
    .locals 3

    .prologue
    .line 949
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 950
    const/4 v0, 0x0

    .line 952
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "user_agent"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public getWebStorageSizeManager()Lcom/android/browser/WebStorageSizeManager;
    .locals 1

    .prologue
    .line 561
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 562
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mWebStorageSizeManager:Lcom/android/browser/WebStorageSizeManager;

    return-object v0
.end method

.method public hasDesktopUseragent(Landroid/webkit/WebView;)Z
    .locals 2
    .parameter "view"

    .prologue
    .line 695
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isAutofillEnabled()Z
    .locals 3

    .prologue
    .line 923
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "autofill_enabled"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isDebugEnabled()Z
    .locals 3

    .prologue
    .line 602
    invoke-static {}, Lcom/android/browser/BrowserSettings;->requireInitialization()V

    .line 603
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debug_menu"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isHardwareAccelerated()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 935
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 938
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_hardware_accel"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public isNormalLayout()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 995
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 998
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "normal_layout"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public isSkiaHardwareAccelerated()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 942
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 945
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_hardware_accel_skia"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public isSmallScreen()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 981
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 984
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "small_screen"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public isTracing()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1002
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1005
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "enable_tracing"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public isWideViewport()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 988
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 991
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "wide_viewport"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method

.method public loadImages()Z
    .locals 3

    .prologue
    .line 870
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "load_images"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public loadPageInOverviewMode()Z
    .locals 3

    .prologue
    .line 858
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "load_page"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 15
    .parameter "config"

    .prologue
    .line 1186
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v12

    sput-object v12, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 1187
    sget-object v12, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    iget-object v13, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v12, v13}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getSearchEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v9

    .line 1188
    .local v9, searchEngineName:Ljava/lang/String;
    if-nez v9, :cond_0

    .line 1189
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v13, "search_engine"

    const-string v14, "google"

    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1191
    :cond_0
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/android/browser/preferences/SearchEngineSettings;->getSearchEngineInfos(Landroid/content/Context;)Ljava/util/List;

    move-result-object v10

    .line 1192
    .local v10, searchEngines:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/search/SearchEngineInfo;>;"
    const/4 v4, 0x0

    .line 1193
    .local v4, len:I
    const/4 v11, -0x1

    .line 1194
    .local v11, selectedItem:I
    if-eqz v10, :cond_1

    .line 1195
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v4

    .line 1197
    :cond_1
    if-lez v4, :cond_9

    .line 1198
    new-array v2, v4, [Ljava/lang/String;

    .line 1199
    .local v2, entryValues:[Ljava/lang/String;
    new-array v1, v4, [Ljava/lang/String;

    .line 1201
    .local v1, entryFavicon:[Ljava/lang/String;
    const/4 v5, 0x0

    .line 1202
    .local v5, need_refresh:Z
    const-string v6, ""

    .line 1203
    .local v6, searchEngineFavicon:Ljava/lang/String;
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v13, "search_engine"

    invoke-virtual {v12, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/common/search/ISearchEngineManager;

    .line 1205
    .local v8, searchEngineManager:Lcom/mediatek/common/search/ISearchEngineManager;
    invoke-interface {v8, v9}, Lcom/mediatek/common/search/ISearchEngineManager;->getSearchEngineByName(Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v7

    .line 1206
    .local v7, searchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    if-eqz v7, :cond_4

    .line 1207
    invoke-virtual {v7}, Lcom/mediatek/common/search/SearchEngineInfo;->getFaviconUri()Ljava/lang/String;

    move-result-object v6

    .line 1212
    :goto_0
    const-string v12, ""

    invoke-interface {v8, v12, v6}, Lcom/mediatek/common/search/ISearchEngineManager;->getBestMatchSearchEngine(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v7

    .line 1213
    if-eqz v7, :cond_2

    .line 1214
    invoke-virtual {v7}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 1215
    invoke-virtual {v7}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v9

    .line 1216
    const/4 v5, 0x1

    .line 1220
    :cond_2
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v4, :cond_5

    .line 1221
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v12}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v2, v3

    .line 1222
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v12}, Lcom/mediatek/common/search/SearchEngineInfo;->getFaviconUri()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v1, v3

    .line 1223
    aget-object v12, v2, v3

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 1224
    move v11, v3

    .line 1220
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1209
    .end local v3           #i:I
    :cond_4
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v13, "search_engine_favicon"

    const-string v14, ""

    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 1227
    .restart local v3       #i:I
    :cond_5
    const/4 v12, -0x1

    if-ne v11, v12, :cond_8

    if-lez v4, :cond_8

    .line 1228
    const/4 v11, 0x0

    .line 1229
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v4, :cond_7

    .line 1230
    aget-object v12, v2, v3

    const-string v13, "google"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 1231
    move v11, v3

    .line 1229
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1234
    :cond_7
    const/4 v5, 0x1

    .line 1237
    :cond_8
    if-eqz v5, :cond_9

    const/4 v12, -0x1

    if-eq v11, v12, :cond_9

    .line 1238
    iget-object v12, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1239
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v12, "search_engine"

    aget-object v13, v2, v11

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1240
    const-string v12, "search_engine_favicon"

    aget-object v13, v1, v11

    invoke-interface {v0, v12, v13}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1241
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1244
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #entryFavicon:[Ljava/lang/String;
    .end local v2           #entryValues:[Ljava/lang/String;
    .end local v3           #i:I
    .end local v5           #need_refresh:Z
    .end local v6           #searchEngineFavicon:Ljava/lang/String;
    .end local v7           #searchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    .end local v8           #searchEngineManager:Lcom/mediatek/common/search/ISearchEngineManager;
    :cond_9
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 4
    .parameter "sharedPreferences"
    .parameter "key"

    .prologue
    const/4 v1, 0x0

    .line 496
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncManagedSettings()V

    .line 497
    const-string v0, "search_engine"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 498
    invoke-direct {p0, v1}, Lcom/android/browser/BrowserSettings;->updateSearchEngine(Z)V

    .line 503
    :cond_0
    const-string v2, "Browser/Settings"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BrowserSettings.onSharedPreferenceChanged:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " mControll is null:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-nez v0, :cond_3

    .line 529
    :cond_1
    :goto_1
    return-void

    :cond_2
    move v0, v1

    .line 503
    goto :goto_0

    .line 508
    :cond_3
    const-string v0, "fullscreen"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 509
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getUi()Lcom/android/browser/UI;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 510
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getUi()Lcom/android/browser/UI;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->useFullscreen()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->setFullscreen(Z)V

    goto :goto_1

    .line 512
    :cond_4
    const-string v0, "enable_quick_controls"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 513
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getUi()Lcom/android/browser/UI;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 514
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getUi()Lcom/android/browser/UI;

    move-result-object v0

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->setUseQuickControls(Z)V

    goto :goto_1

    .line 516
    :cond_5
    const-string v0, "link_prefetch_when"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 517
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->updateConnectionType()V

    goto :goto_1

    .line 519
    :cond_6
    const-string v0, "landscape_only"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 520
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    sput-object v0, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 521
    sget-object v0, Lcom/android/browser/BrowserSettings;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0, p1}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldOnlyLandscape(Landroid/content/SharedPreferences;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 522
    const-string v0, "Browser/Settings"

    const-string v2, "Activity.setRequestedOrientation()"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto/16 :goto_1

    .line 524
    :cond_7
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 525
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto/16 :goto_1
.end method

.method public openInBackground()Z
    .locals 3

    .prologue
    .line 838
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "open_in_background"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public rememberPasswords()Z
    .locals 3

    .prologue
    .line 1085
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "remember_passwords"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public resetDefaultPreferences()V
    .locals 6

    .prologue
    .line 664
    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_autologin_time"

    const-wide/16 v4, -0x1

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 665
    .local v0, gal:J
    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "last_autologin_time"

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 669
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->resetCachedValues()V

    .line 670
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncManagedSettings()V

    .line 671
    return-void
.end method

.method public saveFormdata()Z
    .locals 3

    .prologue
    .line 1077
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "save_formdata"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setAutoFillProfile(Landroid/webkit/WebSettingsClassic$AutoFillProfile;Landroid/os/Message;)V
    .locals 1
    .parameter "profile"
    .parameter "msg"

    .prologue
    .line 682
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mAutofillHandler:Lcom/android/browser/AutofillHandler;

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/AutofillHandler;->setAutoFillProfile(Landroid/webkit/WebSettingsClassic$AutoFillProfile;Landroid/os/Message;)V

    .line 687
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncManagedSettings()V

    .line 688
    return-void
.end method

.method public setAutofillEnabled(Z)V
    .locals 2
    .parameter "value"

    .prologue
    .line 927
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "autofill_enabled"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 928
    return-void
.end method

.method public setController(Lcom/android/browser/Controller;)V
    .locals 3
    .parameter "controller"

    .prologue
    .line 189
    iput-object p1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    .line 190
    sget-boolean v1, Lcom/android/browser/BrowserSettings;->sInitialized:Z

    if-eqz v1, :cond_0

    .line 191
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncSharedSettings()V

    .line 193
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    .line 194
    .local v0, browserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, v1}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldOnlyLandscape(Landroid/content/SharedPreferences;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 195
    const-string v1, "Browser/Settings"

    const-string v2, "Activity.setRequestedOrientation()"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 200
    :cond_1
    :goto_0
    return-void

    .line 197
    :cond_2
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 198
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public setDebugEnabled(Z)V
    .locals 3
    .parameter "value"

    .prologue
    .line 607
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 608
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v1, "debug_menu"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 609
    if-nez p1, :cond_0

    .line 611
    const-string v1, "enable_hardware_accel_skia"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 613
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 614
    return-void
.end method

.method public setDoubleTapZoom(I)V
    .locals 3
    .parameter "percent"

    .prologue
    .line 813
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "double_tap_zoom"

    invoke-static {p1}, Lcom/android/browser/BrowserSettings;->getRawDoubleTapZoom(I)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 814
    return-void
.end method

.method public setHomePage(Ljava/lang/String;)V
    .locals 3
    .parameter "value"

    .prologue
    .line 912
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homepage"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 913
    const-string v0, "Browser/Settings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BrowserSettings: setHomePage : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 914
    return-void
.end method

.method public setHomePagePicker(Ljava/lang/String;)V
    .locals 3
    .parameter "value"

    .prologue
    .line 917
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homepage_picker"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 918
    const-string v0, "Browser/Settings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BrowserSettings: setHomePagePicker : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
    return-void
.end method

.method public setLastRecovered(J)V
    .locals 2
    .parameter "time"

    .prologue
    .line 1158
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_recovered"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1161
    return-void
.end method

.method public setLastRunPaused(Z)V
    .locals 2
    .parameter "isPaused"

    .prologue
    .line 1179
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_paused"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1182
    return-void
.end method

.method public setTextZoom(I)V
    .locals 3
    .parameter "percent"

    .prologue
    .line 803
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "text_zoom"

    invoke-static {p1}, Lcom/android/browser/BrowserSettings;->getRawTextZoom(I)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 804
    return-void
.end method

.method public showSecurityWarnings()Z
    .locals 3

    .prologue
    .line 1069
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "show_security_warnings"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public startManagingSettings(Landroid/webkit/WebSettings;)V
    .locals 4
    .parameter "settings"

    .prologue
    .line 203
    move-object v0, p1

    check-cast v0, Landroid/webkit/WebSettingsClassic;

    .line 204
    .local v0, settingsClassic:Landroid/webkit/WebSettingsClassic;
    iget-boolean v1, p0, Lcom/android/browser/BrowserSettings;->mNeedsSharedSync:Z

    if-eqz v1, :cond_0

    .line 205
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncSharedSettings()V

    .line 207
    :cond_0
    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    monitor-enter v2

    .line 208
    :try_start_0
    invoke-direct {p0, v0}, Lcom/android/browser/BrowserSettings;->syncStaticSettings(Landroid/webkit/WebSettingsClassic;)V

    .line 209
    invoke-direct {p0, v0}, Lcom/android/browser/BrowserSettings;->syncSetting(Landroid/webkit/WebSettingsClassic;)V

    .line 210
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 211
    monitor-exit v2

    .line 212
    return-void

    .line 211
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stopManagingSettings(Landroid/webkit/WebSettings;)V
    .locals 3
    .parameter "settings"

    .prologue
    .line 218
    iget-object v2, p0, Lcom/android/browser/BrowserSettings;->mManagedSettings:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 219
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 220
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 221
    .local v1, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 222
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 226
    .end local v1           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/webkit/WebSettings;>;"
    :cond_1
    return-void
.end method

.method public toggleDebugSettings()V
    .locals 1

    .prologue
    .line 691
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserSettings;->setDebugEnabled(Z)V

    .line 692
    return-void

    .line 691
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toggleDesktopUseragent(Landroid/webkit/WebView;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 699
    if-nez p1, :cond_0

    .line 710
    :goto_0
    return-void

    .line 702
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 703
    .local v0, settings:Landroid/webkit/WebSettings;
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 704
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    sget-object v1, Lcom/android/browser/BrowserSettings;->USER_AGENTS:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getUserAgent()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_0

    .line 707
    :cond_1
    iget-object v1, p0, Lcom/android/browser/BrowserSettings;->mCustomUserAgents:Ljava/util/WeakHashMap;

    const-string v2, "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.34 Safari/534.24"

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    const-string v1, "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.34 Safari/534.24"

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public updateConnectionType()V
    .locals 6

    .prologue
    .line 744
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    const-string v5, "connectivity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 746
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getLinkPrefetchEnabled()Ljava/lang/String;

    move-result-object v2

    .line 747
    .local v2, linkPrefetchPreference:Ljava/lang/String;
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/android/browser/BrowserSettings;->getLinkPrefetchAlwaysPreferenceString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 749
    .local v1, linkPrefetchAllowed:Z
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 750
    .local v3, ni:Landroid/net/NetworkInfo;
    if-eqz v3, :cond_0

    .line 751
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    .line 767
    :cond_0
    :goto_0
    iget-boolean v4, p0, Lcom/android/browser/BrowserSettings;->mLinkPrefetchAllowed:Z

    if-eq v4, v1, :cond_1

    .line 768
    iput-boolean v1, p0, Lcom/android/browser/BrowserSettings;->mLinkPrefetchAllowed:Z

    .line 769
    invoke-direct {p0}, Lcom/android/browser/BrowserSettings;->syncManagedSettings()V

    .line 771
    :cond_1
    return-void

    .line 755
    :sswitch_0
    iget-object v4, p0, Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/android/browser/BrowserSettings;->getLinkPrefetchOnWifiOnlyPreferenceString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v1, v4

    .line 757
    goto :goto_0

    .line 751
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x7 -> :sswitch_0
        0x9 -> :sswitch_0
    .end sparse-switch
.end method

.method public useFullscreen()Z
    .locals 3

    .prologue
    .line 1053
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "fullscreen"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public useInvertedRendering()Z
    .locals 3

    .prologue
    .line 1057
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "inverted"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public useMostVisitedHomepage()Z
    .locals 2

    .prologue
    .line 1038
    const-string v0, "content://com.android.browser.home/"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public useQuickControls()Z
    .locals 3

    .prologue
    .line 1034
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enable_quick_controls"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public useSiteNavigationHomepage()Z
    .locals 2

    .prologue
    .line 1046
    const-string v0, "content://com.android.browser.site_navigation/websites"

    invoke-virtual {p0}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public wasLastRunPaused()Z
    .locals 3

    .prologue
    .line 1170
    iget-object v0, p0, Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "last_paused"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
