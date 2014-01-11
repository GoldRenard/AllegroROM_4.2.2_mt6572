.class public Lcom/android/browser/Controller;
.super Ljava/lang/Object;
.source "Controller.java"

# interfaces
.implements Lcom/android/browser/WebViewController;
.implements Lcom/android/browser/UiController;
.implements Lcom/android/browser/ActivityController;
.implements Lcom/mediatek/browser/ext/IBrowserControllerEx;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/Controller$SelectText;,
        Lcom/android/browser/Controller$Download;,
        Lcom/android/browser/Controller$Copy;,
        Lcom/android/browser/Controller$SaveSnapshotTask;,
        Lcom/android/browser/Controller$PruneThumbnails;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ABOUT_BLANK_URL:Ljava/lang/String; = "about:blank"

.field static final AUTOFILL_SETUP:I = 0x5

.field static final COMBO_VIEW:I = 0x1

.field private static final EMPTY_MENU:I = -0x1

.field static final FILE_SELECTED:I = 0x4

.field private static final FOCUS_NODE_HREF:I = 0x66

.field static final GOOGLE_SEARCH_SOURCE_SEARCHKEY:Ljava/lang/String; = "browser-key"

.field static final GOOGLE_SEARCH_SOURCE_TYPE:Ljava/lang/String; = "browser-type"

.field private static final INCOGNITO_URI:Ljava/lang/String; = "browser:incognito"

.field public static final LOAD_URL:I = 0x3e9

.field private static final LOGTAG:Ljava/lang/String; = "Controller"

.field private static final MAX_TITLE_LENGTH:I = 0x80

.field static final NO_CRASH_RECOVERY:Ljava/lang/String; = "no-crash-recovery"

.field private static final OPEN_BOOKMARKS:I = 0xc9

.field static final PREFERENCES_PAGE:I = 0x3

.field private static final RELEASE_MEMORY:I = 0x12d

.field private static final RELEASE_WAKELOCK:I = 0x6b

.field private static final SEND_APP_ID_EXTRA:Ljava/lang/String; = "android.speech.extras.SEND_APPLICATION_ID_EXTRA"

.field public static final SITE_NAVIGATION_ADD_DIALOG:I = 0x7

.field private static final STATE_FILE:Ljava/lang/String; = "browser_state.parcel"

.field public static final STOP_LOAD:I = 0x3ea

.field static final UPDATE_BOOKMARK_THUMBNAIL:I = 0x6c

.field static final VOICE_RESULT:I = 0x6

.field private static final WAKELOCK_TIMEOUT:I = 0x493e0

.field private static final WINDOW_SHORTCUT_ID_ARRAY:[I = null

.field private static final XLOGTAG:Ljava/lang/String; = "browser/Controller"

.field private static sBrowserProcessNetworkEx:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

.field private static sThumbnailBitmap:Landroid/graphics/Bitmap;


# instance fields
.field private mActionMode:Landroid/view/ActionMode;

.field private mActivity:Landroid/app/Activity;

.field private mActivityPaused:Z

.field private mAutoFillSetupMessage:Landroid/os/Message;

.field private mBlockEvents:Z

.field private mBookmarksObserver:Landroid/database/ContentObserver;

.field private mCachedMenu:Landroid/view/Menu;

.field private mConfigChanged:Z

.field private mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

.field private mCurrentMenuState:I

.field private mExtendedMenuOpen:Z

.field private mFactory:Lcom/android/browser/WebViewFactory;

.field private mHandler:Landroid/os/Handler;

.field private mIntentHandler:Lcom/android/browser/IntentHandler;

.field private mLoadStopped:Z

.field private mMenuIsDown:Z

.field private mMenuState:I

.field private mNeedUpdateThumbnail:Z

.field private mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

.field private mNm:Lcom/mediatek/notification/NotificationManagerPlus;

.field private mOldMenuState:I

.field private mOptionsMenuOpen:Z

.field private mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

.field private mSettings:Lcom/android/browser/BrowserSettings;

.field private mShouldShowErrorConsole:Z

.field private mSiteNavigationObserver:Landroid/database/ContentObserver;

.field private mSystemAllowGeolocationOrigins:Lcom/android/browser/SystemAllowGeolocationOrigins;

.field private mTabControl:Lcom/android/browser/TabControl;

.field private mUi:Lcom/android/browser/UI;

.field private mUploadHandler:Lcom/android/browser/UploadHandler;

.field private mUrlHandler:Lcom/android/browser/UrlHandler;

.field private mUrlNeedUpdateThumbnail:Ljava/lang/String;

.field private mVoiceResult:Ljava/lang/String;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 118
    const-class v0, Lcom/android/browser/Controller;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/browser/Controller;->$assertionsDisabled:Z

    .line 155
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/browser/Controller;->WINDOW_SHORTCUT_ID_ARRAY:[I

    .line 242
    const/4 v0, 0x0

    sput-object v0, Lcom/android/browser/Controller;->sBrowserProcessNetworkEx:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    return-void

    .line 118
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 155
    :array_0
    .array-data 0x4
        0xc9t 0x0t 0xdt 0x7ft
        0xcat 0x0t 0xdt 0x7ft
        0xcbt 0x0t 0xdt 0x7ft
        0xcct 0x0t 0xdt 0x7ft
        0xcdt 0x0t 0xdt 0x7ft
        0xcet 0x0t 0xdt 0x7ft
        0xcft 0x0t 0xdt 0x7ft
        0xd0t 0x0t 0xdt 0x7ft
    .end array-data
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 4
    .parameter "browser"

    .prologue
    const/4 v3, 0x1

    .line 244
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 194
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/browser/Controller;->mCurrentMenuState:I

    .line 195
    const v0, 0x7f0d00ab

    iput v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    .line 196
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/Controller;->mOldMenuState:I

    .line 226
    iput-boolean v3, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    .line 245
    iput-object p1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    .line 246
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    .line 247
    new-instance v0, Lcom/android/browser/TabControl;

    invoke-direct {v0, p0}, Lcom/android/browser/TabControl;-><init>(Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    .line 248
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v0, p0}, Lcom/android/browser/BrowserSettings;->setController(Lcom/android/browser/Controller;)V

    .line 249
    invoke-static {p0}, Lcom/android/browser/CrashRecoveryHandler;->initialize(Lcom/android/browser/Controller;)Lcom/android/browser/CrashRecoveryHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    .line 250
    iget-object v0, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v0}, Lcom/android/browser/CrashRecoveryHandler;->preloadCrashState()V

    .line 251
    new-instance v0, Lcom/android/browser/BrowserWebViewFactory;

    invoke-direct {v0, p1}, Lcom/android/browser/BrowserWebViewFactory;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mFactory:Lcom/android/browser/WebViewFactory;

    .line 253
    new-instance v0, Lcom/android/browser/UrlHandler;

    invoke-direct {v0, p0}, Lcom/android/browser/UrlHandler;-><init>(Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mUrlHandler:Lcom/android/browser/UrlHandler;

    .line 254
    new-instance v0, Lcom/android/browser/IntentHandler;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/android/browser/IntentHandler;-><init>(Landroid/app/Activity;Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mIntentHandler:Lcom/android/browser/IntentHandler;

    .line 255
    new-instance v0, Lcom/android/browser/PageDialogsHandler;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/android/browser/PageDialogsHandler;-><init>(Landroid/content/Context;Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    .line 256
    new-instance v0, Lcom/mediatek/notification/NotificationManagerPlus$ManagerBuilder;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/mediatek/notification/NotificationManagerPlus$ManagerBuilder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/mediatek/notification/NotificationManagerPlus$ManagerBuilder;->create()Lcom/mediatek/notification/NotificationManagerPlus;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller;->mNm:Lcom/mediatek/notification/NotificationManagerPlus;

    .line 257
    invoke-direct {p0}, Lcom/android/browser/Controller;->startHandler()V

    .line 258
    new-instance v0, Lcom/android/browser/Controller$1;

    iget-object v1, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/browser/Controller$1;-><init>(Lcom/android/browser/Controller;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mBookmarksObserver:Landroid/database/ContentObserver;

    .line 269
    new-instance v0, Lcom/android/browser/Controller$2;

    iget-object v1, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/browser/Controller$2;-><init>(Lcom/android/browser/Controller;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mSiteNavigationObserver:Landroid/database/ContentObserver;

    .line 281
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/browser/Controller;->mBookmarksObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 283
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/browser/Controller;->mSiteNavigationObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 286
    new-instance v0, Lcom/android/browser/NetworkStateHandler;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/android/browser/NetworkStateHandler;-><init>(Landroid/app/Activity;Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    .line 288
    new-instance v0, Lcom/android/browser/SystemAllowGeolocationOrigins;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/browser/SystemAllowGeolocationOrigins;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mSystemAllowGeolocationOrigins:Lcom/android/browser/SystemAllowGeolocationOrigins;

    .line 290
    iget-object v0, p0, Lcom/android/browser/Controller;->mSystemAllowGeolocationOrigins:Lcom/android/browser/SystemAllowGeolocationOrigins;

    invoke-virtual {v0}, Lcom/android/browser/SystemAllowGeolocationOrigins;->start()V

    .line 292
    invoke-direct {p0}, Lcom/android/browser/Controller;->openIconDatabase()V

    .line 293
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/Controller;)Lcom/android/browser/TabControl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/browser/Controller;Landroid/os/Bundle;Landroid/content/Intent;JZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 118
    invoke-direct/range {p0 .. p5}, Lcom/android/browser/Controller;->onPreloginFinished(Landroid/os/Bundle;Landroid/content/Intent;JZ)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/browser/Controller;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->deleteSiteNavigationItem(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/browser/Controller;)Lcom/android/browser/UI;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/browser/Controller;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z

    return v0
.end method

.method static synthetic access$1302(Lcom/android/browser/Controller;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z

    return p1
.end method

.method static synthetic access$1402(Lcom/android/browser/Controller;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    iput-object p1, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/browser/Controller;)Lcom/android/browser/BrowserSettings;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/browser/Controller;Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->copy(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/browser/Controller;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/browser/Controller;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->updateScreenshot(Lcom/android/browser/Tab;)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/browser/Controller;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/browser/Controller;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->getNameFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/browser/Controller;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->showSiteNavigationDeleteDialog(Ljava/lang/String;)V

    return-void
.end method

.method private copy(Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "text"

    .prologue
    .line 655
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-string v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 657
    .local v0, cm:Landroid/content/ClipboardManager;
    invoke-virtual {v0, p1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 658
    return-void
.end method

.method private createNewTab(ZZZ)Lcom/android/browser/Tab;
    .locals 5
    .parameter "incognito"
    .parameter "setActive"
    .parameter "useCurrent"

    .prologue
    .line 3067
    const/4 v0, 0x0

    .line 3068
    .local v0, tab:Lcom/android/browser/Tab;
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3069
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1, p1}, Lcom/android/browser/TabControl;->createNewTab(Z)Lcom/android/browser/Tab;

    move-result-object v0

    .line 3070
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->addTab(Lcom/android/browser/Tab;)V

    .line 3071
    if-eqz p2, :cond_0

    .line 3072
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 3075
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/Controller;->canAllocateMemory()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3076
    iget-object v1, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x12d

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 3087
    :cond_1
    :goto_0
    return-object v0

    .line 3080
    :cond_2
    if-eqz p3, :cond_3

    .line 3081
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 3082
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/Controller;->reuseTab(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    goto :goto_0

    .line 3084
    :cond_3
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1}, Lcom/android/browser/UI;->showMaxTabsWarning()V

    goto :goto_0
.end method

.method static createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;
    .locals 12
    .parameter "view"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v9, 0x0

    .line 2643
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {p0}, Landroid/webkit/WebView;->getContentWidth()I

    move-result v8

    if-nez v8, :cond_1

    :cond_0
    move-object v5, v9

    .line 2680
    .end local p0
    :goto_0
    return-object v5

    .line 2650
    .restart local p0
    :cond_1
    const/4 v3, 0x2

    .line 2651
    .local v3, filter_scale:I
    mul-int/lit8 v7, p1, 0x2

    .line 2652
    .local v7, scaledWidth:I
    mul-int/lit8 v6, p2, 0x2

    .line 2653
    .local v6, scaledHeight:I
    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    if-eqz v8, :cond_2

    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    if-ne v8, v7, :cond_2

    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    if-eq v8, v6, :cond_4

    .line 2655
    :cond_2
    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    if-eqz v8, :cond_3

    .line 2656
    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V

    .line 2657
    sput-object v9, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 2659
    :cond_3
    sget-object v8, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    sput-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 2662
    :cond_4
    new-instance v0, Landroid/graphics/Canvas;

    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 2663
    .local v0, canvas:Landroid/graphics/Canvas;
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContentWidth()I

    move-result v1

    .line 2664
    .local v1, contentWidth:I
    int-to-float v8, v7

    invoke-virtual {p0}, Landroid/webkit/WebView;->getScale()F

    move-result v10

    int-to-float v11, v1

    mul-float/2addr v10, v11

    div-float v4, v8, v10

    .line 2665
    .local v4, overviewScale:F
    instance-of v8, p0, Lcom/android/browser/BrowserWebView;

    if-eqz v8, :cond_5

    move-object v8, p0

    .line 2666
    check-cast v8, Lcom/android/browser/BrowserWebView;

    invoke-virtual {v8}, Lcom/android/browser/BrowserWebView;->getTitleHeight()I

    move-result v8

    neg-int v2, v8

    .line 2667
    .local v2, dy:I
    const/4 v8, 0x0

    int-to-float v10, v2

    mul-float/2addr v10, v4

    invoke-virtual {v0, v8, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2670
    .end local v2           #dy:I
    :cond_5
    invoke-virtual {v0, v4, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 2672
    instance-of v8, p0, Lcom/android/browser/BrowserWebView;

    if-eqz v8, :cond_6

    .line 2673
    check-cast p0, Lcom/android/browser/BrowserWebView;

    .end local p0
    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserWebView;->drawContent(Landroid/graphics/Canvas;)V

    .line 2677
    :goto_1
    sget-object v8, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    const/4 v10, 0x1

    invoke-static {v8, p1, p2, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 2679
    .local v5, ret:Landroid/graphics/Bitmap;
    invoke-virtual {v0, v9}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 2675
    .end local v5           #ret:Landroid/graphics/Bitmap;
    .restart local p0
    :cond_6
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1
.end method

.method private deleteSiteNavigationItem(Ljava/lang/String;)V
    .locals 12
    .parameter "itemUrl"

    .prologue
    .line 1787
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1788
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v7, 0x0

    .line 1790
    .local v7, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "url = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1792
    if-eqz v7, :cond_2

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1793
    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v10

    .line 1795
    .local v10, uri:Landroid/net/Uri;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1796
    .local v11, values:Landroid/content/ContentValues;
    const-string v1, "title"

    const-string v2, "about:blank"

    invoke-virtual {v11, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1797
    const-string v1, "url"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "about:blank"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1798
    const-string v1, "website"

    const-string v2, "0"

    invoke-virtual {v11, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1799
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1800
    .local v9, os:Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07002f

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 1802
    .local v6, bm:Landroid/graphics/Bitmap;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {v6, v1, v2, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1803
    const-string v1, "thumbnail"

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1804
    const-string v1, "browser/Controller"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Controller deleteSiteNavigationItem uri is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1805
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v10, v11, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1812
    .end local v6           #bm:Landroid/graphics/Bitmap;
    .end local v9           #os:Ljava/io/ByteArrayOutputStream;
    .end local v10           #uri:Landroid/net/Uri;
    .end local v11           #values:Landroid/content/ContentValues;
    :goto_0
    if-eqz v7, :cond_0

    .line 1813
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1818
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1819
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->reload()V

    .line 1821
    :cond_1
    return-void

    .line 1807
    :cond_2
    :try_start_1
    const-string v1, "Controller"

    const-string v2, "deleteSiteNavigationItem the item does not exist!"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1809
    :catch_0
    move-exception v8

    .line 1810
    .local v8, e:Ljava/lang/IllegalStateException;
    :try_start_2
    const-string v1, "Controller"

    const-string v2, "deleteSiteNavigationItem"

    invoke-static {v1, v2, v8}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1812
    if-eqz v7, :cond_0

    .line 1813
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1812
    .end local v8           #e:Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v1

    if-eqz v7, :cond_3

    .line 1813
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method static getDesiredThumbnailHeight(Landroid/content/Context;)I
    .locals 2
    .parameter "context"

    .prologue
    .line 2638
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0008

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    return v0
.end method

.method static getDesiredThumbnailWidth(Landroid/content/Context;)I
    .locals 2
    .parameter "context"

    .prologue
    .line 2627
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0007

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    return v0
.end method

.method private getNameFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "itemUrl"

    .prologue
    .line 1827
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1828
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 1829
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 1831
    .local v8, name:Ljava/lang/String;
    :try_start_0
    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const-string v3, "url = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1833
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1834
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 1841
    :goto_0
    if-eqz v6, :cond_0

    .line 1842
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1845
    :cond_0
    :goto_1
    const-string v1, "browser/Controller"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sitenavigation getNameFromUrl url is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", will return name : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1846
    return-object v8

    .line 1836
    :cond_1
    :try_start_1
    const-string v1, "Controller"

    const-string v2, "saveSiteNavigationItem the item does not exist!"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1838
    :catch_0
    move-exception v7

    .line 1839
    .local v7, e:Ljava/lang/IllegalStateException;
    :try_start_2
    const-string v1, "Controller"

    const-string v2, "saveSiteNavigationItem"

    invoke-static {v1, v2, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1841
    if-eqz v6, :cond_0

    .line 1842
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1841
    .end local v7           #e:Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_2

    .line 1842
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v1
.end method

.method private getNextTab()Lcom/android/browser/Tab;
    .locals 2

    .prologue
    .line 3285
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 3286
    .local v0, pos:I
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 3287
    const/4 v0, 0x0

    .line 3289
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1, v0}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v1

    return-object v1
.end method

.method private getPrevTab()Lcom/android/browser/Tab;
    .locals 2

    .prologue
    .line 3297
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 3298
    .local v0, pos:I
    if-gez v0, :cond_0

    .line 3299
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 3301
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1, v0}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v1

    return-object v1
.end method

.method private goLive()V
    .locals 3

    .prologue
    .line 2328
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 2329
    .local v0, t:Lcom/android/browser/Tab;
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/Tab;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 2330
    return-void
.end method

.method private isSiteNavigationAboutBlankUrl(Ljava/lang/String;)Z
    .locals 4
    .parameter "url"

    .prologue
    .line 1897
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xc

    if-ne v2, v3, :cond_0

    const-string v2, "about:blank"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1898
    const-string v2, "about:blank"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1899
    .local v1, sub:Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1900
    .local v0, index:I
    if-ltz v0, :cond_0

    const/16 v2, 0x9

    if-gt v0, v2, :cond_0

    .line 1901
    const-string v2, "browser/Controller"

    const-string v3, "isSiteNavigationAboutBlankUrl will return true."

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1902
    const/4 v2, 0x1

    .line 1906
    .end local v0           #index:I
    .end local v1           #sub:Ljava/lang/String;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private maybeUpdateFavicon(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "tab"
    .parameter "originalUrl"
    .parameter "url"
    .parameter "favicon"

    .prologue
    .line 1177
    if-nez p4, :cond_1

    .line 1184
    :cond_0
    :goto_0
    return-void

    .line 1180
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1181
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p2, p3, p4}, Lcom/android/browser/Bookmarks;->updateFavicon(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method private onPreloginFinished(Landroid/os/Bundle;Landroid/content/Intent;JZ)V
    .locals 16
    .parameter "icicle"
    .parameter "intent"
    .parameter "currentTabId"
    .parameter "restoreIncognitoTabs"

    .prologue
    .line 338
    const-wide/16 v1, -0x1

    cmp-long v1, p3, v1

    if-nez v1, :cond_8

    .line 339
    new-instance v1, Lcom/android/browser/Controller$PruneThumbnails;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/android/browser/Controller$PruneThumbnails;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-static {v1}, Lcom/android/browser/BackgroundHandler;->execute(Ljava/lang/Runnable;)V

    .line 340
    if-nez p2, :cond_4

    .line 343
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->openTabToHomePage()Lcom/android/browser/Tab;

    .line 375
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getTabs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/browser/UI;->updateTabs(Ljava/util/List;)V

    .line 399
    :cond_1
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getSettings()Lcom/android/browser/BrowserSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getJsEngineFlags()Ljava/lang/String;

    move-result-object v9

    .line 400
    .local v9, jsFlags:Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    .line 401
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-static {v1}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/webkit/WebViewClassic;->setJsFlags(Ljava/lang/String;)V

    .line 403
    :cond_2
    if-eqz p2, :cond_3

    const-string v1, "show_bookmarks"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 405
    sget-object v1, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    .line 407
    :cond_3
    return-void

    .line 345
    .end local v9           #jsFlags:Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    .line 350
    .local v7, extra:Landroid/os/Bundle;
    const/4 v14, 0x0

    .line 351
    .local v14, urlData:Lcom/android/browser/IntentHandler$UrlData;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_6

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "content://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 354
    new-instance v14, Lcom/android/browser/IntentHandler$UrlData;

    .end local v14           #urlData:Lcom/android/browser/IntentHandler$UrlData;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v14, v1}, Lcom/android/browser/IntentHandler$UrlData;-><init>(Ljava/lang/String;)V

    .line 358
    .restart local v14       #urlData:Lcom/android/browser/IntentHandler$UrlData;
    :goto_2
    const/4 v12, 0x0

    .line 359
    .local v12, t:Lcom/android/browser/Tab;
    invoke-virtual {v14}, Lcom/android/browser/IntentHandler$UrlData;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 360
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->openTabToHomePage()Lcom/android/browser/Tab;

    move-result-object v12

    .line 364
    :goto_3
    if-eqz v12, :cond_5

    .line 365
    const-string v1, "com.android.browser.application_id"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/android/browser/Tab;->setAppId(Ljava/lang/String;)V

    .line 367
    :cond_5
    invoke-virtual {v12}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v15

    .line 368
    .local v15, webView:Landroid/webkit/WebView;
    if-eqz v7, :cond_0

    .line 369
    const-string v1, "browser.initialZoomLevel"

    const/4 v2, 0x0

    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 370
    .local v11, scale:I
    if-lez v11, :cond_0

    const/16 v1, 0x3e8

    if-gt v11, v1, :cond_0

    .line 371
    invoke-virtual {v15, v11}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto/16 :goto_0

    .line 356
    .end local v11           #scale:I
    .end local v12           #t:Lcom/android/browser/Tab;
    .end local v15           #webView:Landroid/webkit/WebView;
    :cond_6
    invoke-static/range {p2 .. p2}, Lcom/android/browser/IntentHandler;->getUrlDataFromIntent(Landroid/content/Intent;)Lcom/android/browser/IntentHandler$UrlData;

    move-result-object v14

    goto :goto_2

    .line 362
    .restart local v12       #t:Lcom/android/browser/Tab;
    :cond_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/android/browser/Controller;->openTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;

    move-result-object v12

    goto :goto_3

    .line 377
    .end local v7           #extra:Landroid/os/Bundle;
    .end local v12           #t:Lcom/android/browser/Tab;
    .end local v14           #urlData:Lcom/android/browser/IntentHandler$UrlData;
    :cond_8
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v2}, Lcom/android/browser/UI;->needsRestoreAllTabs()Z

    move-result v6

    move-object/from16 v2, p1

    move-wide/from16 v3, p3

    move/from16 v5, p5

    invoke-virtual/range {v1 .. v6}, Lcom/android/browser/TabControl;->restoreState(Landroid/os/Bundle;JZZ)V

    .line 379
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getTabs()Ljava/util/List;

    move-result-object v13

    .line 380
    .local v13, tabs:Ljava/util/List;,"Ljava/util/List<Lcom/android/browser/Tab;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v10, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 381
    .local v10, restoredTabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/browser/Tab;

    .line 382
    .restart local v12       #t:Lcom/android/browser/Tab;
    invoke-virtual {v12}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 384
    .end local v12           #t:Lcom/android/browser/Tab;
    :cond_9
    new-instance v1, Lcom/android/browser/Controller$PruneThumbnails;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2, v10}, Lcom/android/browser/Controller$PruneThumbnails;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-static {v1}, Lcom/android/browser/BackgroundHandler;->execute(Ljava/lang/Runnable;)V

    .line 385
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_a

    .line 386
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->openTabToHomePage()Lcom/android/browser/Tab;

    .line 388
    :cond_a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1, v13}, Lcom/android/browser/UI;->updateTabs(Ljava/util/List;)V

    .line 391
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 394
    if-eqz p2, :cond_1

    .line 395
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/browser/Controller;->mIntentHandler:Lcom/android/browser/IntentHandler;

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lcom/android/browser/IntentHandler;->onNewIntent(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method

.method private openIconDatabase()V
    .locals 2

    .prologue
    .line 506
    invoke-static {}, Landroid/webkit/WebIconDatabase;->getInstance()Landroid/webkit/WebIconDatabase;

    move-result-object v0

    .line 507
    .local v0, instance:Landroid/webkit/WebIconDatabase;
    new-instance v1, Lcom/android/browser/Controller$4;

    invoke-direct {v1, p0, v0}, Lcom/android/browser/Controller$4;-><init>(Lcom/android/browser/Controller;Landroid/webkit/WebIconDatabase;)V

    invoke-static {v1}, Lcom/android/browser/BackgroundHandler;->execute(Ljava/lang/Runnable;)V

    .line 514
    return-void
.end method

.method private pauseWebViewTimers(Lcom/android/browser/Tab;)Z
    .locals 3
    .parameter "tab"

    .prologue
    const/4 v0, 0x1

    .line 801
    if-nez p1, :cond_0

    .line 808
    :goto_0
    return v0

    .line 803
    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v1

    if-nez v1, :cond_1

    .line 804
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieSyncManager;->stopSync()V

    .line 805
    invoke-static {}, Lcom/android/browser/WebViewTimersControl;->getInstance()Lcom/android/browser/WebViewTimersControl;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/browser/WebViewTimersControl;->onBrowserActivityPause(Landroid/webkit/WebView;)V

    goto :goto_0

    .line 808
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private releaseWakeLock()V
    .locals 2

    .prologue
    .line 776
    iget-object v0, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 777
    iget-object v0, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x6b

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 778
    iget-object v0, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 780
    :cond_0
    return-void
.end method

.method private resumeWebViewTimers(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 787
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v0

    .line 788
    .local v0, inLoad:Z
    iget-boolean v2, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-nez v2, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v2, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    .line 789
    :cond_1
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/CookieSyncManager;->startSync()V

    .line 790
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 791
    .local v1, w:Landroid/webkit/WebView;
    invoke-static {}, Lcom/android/browser/WebViewTimersControl;->getInstance()Lcom/android/browser/WebViewTimersControl;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/browser/WebViewTimersControl;->onBrowserActivityResume(Landroid/webkit/WebView;)V

    .line 793
    .end local v1           #w:Landroid/webkit/WebView;
    :cond_2
    return-void
.end method

.method private shareCurrentPage(Lcom/android/browser/Tab;)V
    .locals 7
    .parameter "tab"

    .prologue
    .line 616
    if-eqz p1, :cond_0

    .line 617
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v5}, Lcom/android/browser/Controller;->getDesiredThumbnailWidth(Landroid/content/Context;)I

    move-result v5

    iget-object v6, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v6}, Lcom/android/browser/Controller;->getDesiredThumbnailHeight(Landroid/content/Context;)I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/browser/Controller;->sharePage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 623
    :cond_0
    return-void
.end method

.method static final sharePage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "c"
    .parameter "title"
    .parameter "url"
    .parameter "favicon"
    .parameter "screenshot"

    .prologue
    .line 640
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 641
    .local v0, send:Landroid/content/Intent;
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 642
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 643
    const-string v1, "android.intent.extra.SUBJECT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 644
    const-string v1, "share_favicon"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 645
    const-string v1, "share_screenshot"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 647
    const v1, 0x7f0c00af

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 652
    :goto_0
    return-void

    .line 649
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private showCloseSelectionDialog()V
    .locals 4

    .prologue
    .line 2336
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/CharSequence;

    .line 2337
    .local v0, items:[Ljava/lang/CharSequence;
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0c0011

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 2338
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0c0012

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 2339
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0c0010

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/browser/Controller$16;

    invoke-direct {v2, p0}, Lcom/android/browser/Controller$16;-><init>(Lcom/android/browser/Controller;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2362
    return-void
.end method

.method private showPreloadedTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;
    .locals 6
    .parameter "urlData"

    .prologue
    const/4 v2, 0x0

    .line 2984
    invoke-virtual {p1}, Lcom/android/browser/IntentHandler$UrlData;->isPreloaded()Z

    move-result v4

    if-nez v4, :cond_0

    .line 3008
    :goto_0
    return-object v2

    .line 2987
    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/IntentHandler$UrlData;->getPreloadedTab()Lcom/android/browser/PreloadedTabControl;

    move-result-object v3

    .line 2988
    .local v3, tabControl:Lcom/android/browser/PreloadedTabControl;
    invoke-virtual {p1}, Lcom/android/browser/IntentHandler$UrlData;->getSearchBoxQueryToSubmit()Ljava/lang/String;

    move-result-object v1

    .line 2989
    .local v1, sbQuery:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 2990
    iget-object v4, p1, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    iget-object v5, p1, Lcom/android/browser/IntentHandler$UrlData;->mHeaders:Ljava/util/Map;

    invoke-virtual {v3, v1, v4, v5}, Lcom/android/browser/PreloadedTabControl;->searchBoxSubmit(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 2992
    invoke-virtual {v3}, Lcom/android/browser/PreloadedTabControl;->destroy()V

    goto :goto_0

    .line 2997
    :cond_1
    iget-object v4, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v4}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v4

    if-nez v4, :cond_2

    .line 2998
    iget-object v4, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/browser/TabControl;->getLeastUsedTab(Lcom/android/browser/Tab;)Lcom/android/browser/Tab;

    move-result-object v0

    .line 2999
    .local v0, leastUsed:Lcom/android/browser/Tab;
    if-eqz v0, :cond_2

    .line 3000
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->closeTab(Lcom/android/browser/Tab;)V

    .line 3003
    .end local v0           #leastUsed:Lcom/android/browser/Tab;
    :cond_2
    invoke-virtual {v3}, Lcom/android/browser/PreloadedTabControl;->getTab()Lcom/android/browser/Tab;

    move-result-object v2

    .line 3004
    .local v2, t:Lcom/android/browser/Tab;
    invoke-virtual {v2}, Lcom/android/browser/Tab;->refreshIdAfterPreload()V

    .line 3005
    iget-object v4, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v4, v2}, Lcom/android/browser/TabControl;->addPreloadedTab(Lcom/android/browser/Tab;)V

    .line 3006
    invoke-virtual {p0, v2}, Lcom/android/browser/Controller;->addTab(Lcom/android/browser/Tab;)V

    .line 3007
    invoke-virtual {p0, v2}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method private showSiteNavigationDeleteDialog(Ljava/lang/String;)V
    .locals 5
    .parameter "itemUrl"

    .prologue
    .line 1769
    const v1, 0x7f0c002a

    .line 1770
    .local v1, title:I
    const v0, 0x7f0c002d

    .line 1771
    .local v0, msg:I
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1080027

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c0058

    new-instance v4, Lcom/android/browser/Controller$14;

    invoke-direct {v4, p0, p1}, Lcom/android/browser/Controller$14;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c0057

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1783
    return-void
.end method

.method private startHandler()V
    .locals 1

    .prologue
    .line 517
    new-instance v0, Lcom/android/browser/Controller$5;

    invoke-direct {v0, p0}, Lcom/android/browser/Controller$5;-><init>(Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    .line 603
    return-void
.end method

.method private updateScreenshot(Lcom/android/browser/Tab;)V
    .locals 12
    .parameter "tab"

    .prologue
    .line 2689
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v10

    .line 2690
    .local v10, view:Landroid/webkit/WebView;
    if-nez v10, :cond_1

    .line 2786
    :cond_0
    :goto_0
    return-void

    .line 2694
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v5

    .line 2695
    .local v5, url:Ljava/lang/String;
    invoke-virtual {v10}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v3

    .line 2696
    .local v3, originalUrl:Ljava/lang/String;
    iget-object v4, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    .line 2697
    .local v4, thumbnailUrl:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2702
    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2704
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v0, v5}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->isSiteNavigationUrl(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v8

    .line 2705
    .local v8, isSNUrl:Z
    if-eqz v8, :cond_2

    .line 2706
    invoke-direct {p0, v5, v10}, Lcom/android/browser/Controller;->updateSiteNavigationThumbnail(Ljava/lang/String;Landroid/webkit/WebView;)V

    .line 2714
    .end local v8           #isSNUrl:Z
    :cond_2
    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isBookmarkedSite()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2718
    :cond_3
    const-string v0, "Controller"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "need update: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v11, p0, Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, " update bookmark url: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v11, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, " originalUrl: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, " url: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2721
    if-eqz v5, :cond_4

    iget-object v0, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    if-eqz v0, :cond_4

    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    iget-object v1, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2724
    new-instance v0, Landroid/net/WebAddress;

    invoke-direct {v0, v5}, Landroid/net/WebAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/net/WebAddress;->getHost()Ljava/lang/String;

    move-result-object v9

    .line 2725
    .local v9, urlHost:Ljava/lang/String;
    new-instance v0, Landroid/net/WebAddress;

    iget-object v1, p0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/net/WebAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/net/WebAddress;->getHost()Ljava/lang/String;

    move-result-object v7

    .line 2727
    .local v7, bookmarkHost:Ljava/lang/String;
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 2740
    .end local v7           #bookmarkHost:Ljava/lang/String;
    .end local v9           #urlHost:Ljava/lang/String;
    :cond_4
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/browser/Controller;->getDesiredThumbnailWidth(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/android/browser/Controller;->getDesiredThumbnailHeight(Landroid/content/Context;)I

    move-result v1

    invoke-static {v10, v0, v1}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 2742
    .local v6, bm:Landroid/graphics/Bitmap;
    if-eqz v6, :cond_0

    .line 2746
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 2747
    .local v2, cr:Landroid/content/ContentResolver;
    new-instance v0, Lcom/android/browser/Controller$17;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/browser/Controller$17;-><init>(Lcom/android/browser/Controller;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/browser/Controller$17;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0
.end method

.method private updateShareMenuItems(Landroid/view/Menu;Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "menu"
    .parameter "tab"

    .prologue
    const/4 v4, 0x0

    .line 1916
    const-string v2, "browser/Controller"

    const-string v3, "updateShareMenuItems start"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1917
    if-nez p1, :cond_0

    .line 1936
    :goto_0
    return-void

    .line 1921
    :cond_0
    const v2, 0x7f0d00b5

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1922
    .local v0, shareItem:Landroid/view/MenuItem;
    if-nez p2, :cond_1

    .line 1923
    const-string v2, "browser/Controller"

    const-string v3, "tab == null"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1924
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1935
    :goto_1
    const-string v2, "browser/Controller"

    const-string v3, "updateShareMenuItems end"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1926
    :cond_1
    invoke-virtual {p2}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 1927
    .local v1, url:Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 1928
    :cond_2
    const-string v2, "browser/Controller"

    const-string v3, "url == null||url.length() == 0"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1929
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_1

    .line 1931
    :cond_3
    const-string v2, "browser/Controller"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "url :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1932
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_1
.end method

.method private updateSiteNavigationThumbnail(Ljava/lang/String;Landroid/webkit/WebView;)V
    .locals 6
    .parameter "itemUrl"
    .parameter "webView"

    .prologue
    .line 1851
    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0009

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 1852
    .local v3, width:I
    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b000a

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    .line 1854
    .local v2, height:I
    invoke-static {p2, v3, v2}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1856
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 1857
    const-string v4, "Controller"

    const-string v5, "updateSiteNavigationThumbnail bm is null!"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1893
    :goto_0
    return-void

    .line 1861
    :cond_0
    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1862
    .local v1, cr:Landroid/content/ContentResolver;
    new-instance v4, Lcom/android/browser/Controller$15;

    invoke-direct {v4, p0, p1, v0}, Lcom/android/browser/Controller$15;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lcom/android/browser/Controller$15;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method


# virtual methods
.method protected addTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 2907
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->addTab(Lcom/android/browser/Tab;)V

    .line 2908
    return-void
.end method

.method public attachSubWindow(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 2977
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2978
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSubViewContainer()Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->attachSubWindow(Landroid/view/View;)V

    .line 2979
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z

    .line 2981
    :cond_0
    return-void
.end method

.method public bookmarkCurrentPage()V
    .locals 2

    .prologue
    .line 2321
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/browser/Controller;->createBookmarkCurrentPageIntent(Z)Landroid/content/Intent;

    move-result-object v0

    .line 2322
    .local v0, bookmarkIntent:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 2323
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 2325
    :cond_0
    return-void
.end method

.method public bookmarkedStatusHasChanged(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 1189
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->bookmarkedStatusHasChanged(Lcom/android/browser/Tab;)V

    .line 1190
    return-void
.end method

.method public bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V
    .locals 3
    .parameter "startView"

    .prologue
    .line 1315
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1327
    :goto_0
    return-void

    .line 1319
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInCustomActionMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1320
    invoke-virtual {p0}, Lcom/android/browser/Controller;->endActionMode()V

    .line 1322
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1324
    .local v0, extras:Landroid/os/Bundle;
    const-string v2, "disable_new_window"

    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1326
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1, p1, v0}, Lcom/android/browser/UI;->showComboView(Lcom/android/browser/UI$ComboViews;Landroid/os/Bundle;)V

    goto :goto_0

    .line 1324
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public canAllocateMemory()Z
    .locals 5

    .prologue
    .line 3569
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 3570
    .local v0, memInfo:Landroid/app/ActivityManager$MemoryInfo;
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 3571
    .local v1, mgr:Landroid/app/ActivityManager;
    invoke-virtual {v1, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 3572
    iget-boolean v2, v0, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    if-eqz v2, :cond_0

    .line 3573
    const-string v2, "Controller"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Low memory checked: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, v0, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3574
    const/4 v2, 0x0

    .line 3576
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public closeCurrentTab()V
    .locals 1

    .prologue
    .line 3123
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->closeCurrentTab(Z)V

    .line 3124
    return-void
.end method

.method protected closeCurrentTab(Z)V
    .locals 5
    .parameter "andQuit"

    .prologue
    .line 3127
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 3128
    iget-object v3, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v3}, Lcom/android/browser/CrashRecoveryHandler;->clearState()V

    .line 3129
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/browser/TabControl;->removeTab(Lcom/android/browser/Tab;)Z

    .line 3130
    iget-object v3, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    .line 3149
    :cond_0
    :goto_0
    return-void

    .line 3133
    :cond_1
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 3134
    .local v0, current:Lcom/android/browser/Tab;
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v2

    .line 3135
    .local v2, pos:I
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v1

    .line 3136
    .local v1, newTab:Lcom/android/browser/Tab;
    if-nez v1, :cond_2

    .line 3137
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v1

    .line 3138
    if-nez v1, :cond_2

    .line 3139
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v4}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v1

    .line 3142
    :cond_2
    if-eqz p1, :cond_3

    .line 3143
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3, v1}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;)Z

    .line 3144
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->closeTab(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 3145
    :cond_3
    invoke-virtual {p0, v1}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3147
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->closeTab(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method protected closeEmptyTab()V
    .locals 2

    .prologue
    .line 2927
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 2928
    .local v0, current:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebBackForwardList;->getSize()I

    move-result v1

    if-nez v1, :cond_0

    .line 2930
    invoke-virtual {p0}, Lcom/android/browser/Controller;->closeCurrentTab()V

    .line 2932
    :cond_0
    return-void
.end method

.method public closeOtherTabs()V
    .locals 4

    .prologue
    .line 3169
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 3170
    .local v1, inactiveTabs:I
    move v0, v1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 3171
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3, v0}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v2

    .line 3172
    .local v2, tab:Lcom/android/browser/Tab;
    iget-object v3, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v3}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v3

    if-eq v2, v3, :cond_0

    .line 3173
    invoke-virtual {p0, v2}, Lcom/android/browser/Controller;->removeTab(Lcom/android/browser/Tab;)V

    .line 3170
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 3176
    .end local v2           #tab:Lcom/android/browser/Tab;
    :cond_1
    return-void
.end method

.method public closeTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 3157
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 3158
    invoke-virtual {p0}, Lcom/android/browser/Controller;->closeCurrentTab()V

    .line 3162
    :goto_0
    return-void

    .line 3160
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->removeTab(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method public createBookmarkCurrentPageIntent(Z)Landroid/content/Intent;
    .locals 7
    .parameter "editExisting"

    .prologue
    .line 2541
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v3

    .line 2542
    .local v3, w:Landroid/webkit/WebView;
    if-nez v3, :cond_0

    .line 2543
    const/4 v0, 0x0

    .line 2568
    :goto_0
    return-object v0

    .line 2545
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-class v5, Lcom/android/browser/AddBookmarkPage;

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2547
    .local v0, i:Landroid/content/Intent;
    const-string v4, "url"

    invoke-virtual {v3}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2548
    const-string v4, "title"

    invoke-virtual {v3}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2549
    invoke-virtual {v3}, Landroid/webkit/WebView;->getTouchIconUrl()Ljava/lang/String;

    move-result-object v2

    .line 2550
    .local v2, touchIconUrl:Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 2551
    const-string v4, "touch_icon_url"

    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2552
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 2553
    .local v1, settings:Landroid/webkit/WebSettings;
    if-eqz v1, :cond_1

    .line 2554
    const-string v4, "user_agent"

    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2558
    .end local v1           #settings:Landroid/webkit/WebSettings;
    :cond_1
    const-string v4, "thumbnail"

    iget-object v5, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v5}, Lcom/android/browser/Controller;->getDesiredThumbnailWidth(Landroid/content/Context;)I

    move-result v5

    iget-object v6, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v6}, Lcom/android/browser/Controller;->getDesiredThumbnailHeight(Landroid/content/Context;)I

    move-result v6

    invoke-static {v3, v5, v6}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2561
    const-string v4, "favicon"

    invoke-virtual {v3}, Landroid/webkit/WebView;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2562
    if-eqz p1, :cond_2

    .line 2563
    const-string v4, "check_for_dupe"

    const/4 v5, 0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2567
    :cond_2
    const-string v4, "gravity"

    const/16 v5, 0x35

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0
.end method

.method public createBookmarkLinkIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 7
    .parameter "url"

    .prologue
    .line 2584
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v3

    .line 2585
    .local v3, w:Landroid/webkit/WebView;
    if-nez v3, :cond_0

    .line 2586
    const/4 v0, 0x0

    .line 2608
    :goto_0
    return-object v0

    .line 2588
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-class v5, Lcom/android/browser/AddBookmarkPage;

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2590
    .local v0, i:Landroid/content/Intent;
    const-string v4, "url"

    invoke-virtual {v0, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2591
    const-string v4, "title"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2592
    invoke-virtual {v3}, Landroid/webkit/WebView;->getTouchIconUrl()Ljava/lang/String;

    move-result-object v2

    .line 2593
    .local v2, touchIconUrl:Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 2594
    const-string v4, "touch_icon_url"

    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2595
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 2596
    .local v1, settings:Landroid/webkit/WebSettings;
    if-eqz v1, :cond_1

    .line 2597
    const-string v4, "user_agent"

    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2601
    .end local v1           #settings:Landroid/webkit/WebSettings;
    :cond_1
    const-string v4, "thumbnail"

    iget-object v5, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v5}, Lcom/android/browser/Controller;->getDesiredThumbnailWidth(Landroid/content/Context;)I

    move-result v5

    iget-object v6, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v6}, Lcom/android/browser/Controller;->getDesiredThumbnailHeight(Landroid/content/Context;)I

    move-result v6

    invoke-static {v3, v5, v6}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2604
    const-string v4, "favicon"

    invoke-virtual {v3}, Landroid/webkit/WebView;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2607
    const-string v4, "gravity"

    const/16 v5, 0x35

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0
.end method

.method public createNewSnapshotTab(JZ)Lcom/android/browser/SnapshotTab;
    .locals 2
    .parameter "snapshotId"
    .parameter "setActive"

    .prologue
    .line 3092
    const/4 v0, 0x0

    .line 3093
    .local v0, tab:Lcom/android/browser/SnapshotTab;
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3094
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1, p1, p2}, Lcom/android/browser/TabControl;->createSnapshotTab(J)Lcom/android/browser/SnapshotTab;

    move-result-object v0

    .line 3095
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->addTab(Lcom/android/browser/Tab;)V

    .line 3096
    if-eqz p3, :cond_0

    .line 3097
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 3102
    :cond_0
    :goto_0
    return-object v0

    .line 3100
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1}, Lcom/android/browser/UI;->showMaxTabsWarning()V

    goto :goto_0
.end method

.method createSaveState()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 738
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 739
    .local v0, saveState:Landroid/os/Bundle;
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1, v0}, Lcom/android/browser/TabControl;->saveState(Landroid/os/Bundle;)V

    .line 740
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 742
    const-string v1, "lastActiveDate"

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 744
    :cond_0
    return-object v0
.end method

.method public createSubWindow(Lcom/android/browser/Tab;)V
    .locals 4
    .parameter "tab"

    .prologue
    .line 453
    invoke-virtual {p0}, Lcom/android/browser/Controller;->endActionMode()V

    .line 454
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 455
    .local v0, mainView:Landroid/webkit/WebView;
    iget-object v3, p0, Lcom/android/browser/Controller;->mFactory:Lcom/android/browser/WebViewFactory;

    if-nez v0, :cond_0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v3, v2}, Lcom/android/browser/WebViewFactory;->createWebView(Z)Landroid/webkit/WebView;

    move-result-object v1

    .line 458
    .local v1, subView:Landroid/webkit/WebView;
    iget-object v2, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v2, p1, v1}, Lcom/android/browser/UI;->createSubWindow(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V

    .line 459
    return-void

    .line 455
    .end local v1           #subView:Landroid/webkit/WebView;
    :cond_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v2

    goto :goto_0
.end method

.method didUserStopLoading()Z
    .locals 1

    .prologue
    .line 880
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mLoadStopped:Z

    return v0
.end method

.method public dismissSubWindow(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 2959
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->removeSubWindow(Lcom/android/browser/Tab;)V

    .line 2961
    invoke-virtual {p1}, Lcom/android/browser/Tab;->dismissSubWindow()V

    .line 2962
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 2963
    .local v0, wv:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 2964
    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z

    .line 2966
    :cond_0
    return-void
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 3552
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 3532
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    return v0
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 3537
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    return v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 3542
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    return v0
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 3547
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    return v0
.end method

.method doStart(Landroid/os/Bundle;Landroid/content/Intent;)V
    .locals 11
    .parameter "icicle"
    .parameter "intent"

    .prologue
    .line 306
    if-eqz p1, :cond_1

    const-string v0, "lastActiveDate"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    move-object v7, v0

    .line 308
    .local v7, lastActiveDate:Ljava/util/Calendar;
    :goto_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    .line 309
    .local v8, today:Ljava/util/Calendar;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v9

    .line 310
    .local v9, yesterday:Ljava/util/Calendar;
    const/4 v0, 0x5

    const/4 v1, -0x1

    invoke-virtual {v9, v0, v1}, Ljava/util/Calendar;->add(II)V

    .line 312
    if-eqz v7, :cond_2

    invoke-virtual {v7, v9}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v6, 0x1

    .line 317
    .local v6, restoreIncognitoTabs:Z
    :goto_1
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0, p1, v6}, Lcom/android/browser/TabControl;->canRestoreState(Landroid/os/Bundle;Z)J

    move-result-wide v4

    .line 320
    .local v4, currentTabId:J
    const-wide/16 v0, -0x1

    cmp-long v0, v4, v0

    if-nez v0, :cond_0

    .line 324
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieManager;->removeSessionCookie()V

    .line 327
    :cond_0
    iget-object v10, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    new-instance v0, Lcom/android/browser/Controller$3;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/browser/Controller$3;-><init>(Lcom/android/browser/Controller;Landroid/os/Bundle;Landroid/content/Intent;JZ)V

    invoke-static {v10, v0}, Lcom/android/browser/GoogleAccountLogin;->startLoginIfNeeded(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 334
    return-void

    .line 306
    .end local v4           #currentTabId:J
    .end local v6           #restoreIncognitoTabs:Z
    .end local v7           #lastActiveDate:Ljava/util/Calendar;
    .end local v8           #today:Ljava/util/Calendar;
    .end local v9           #yesterday:Ljava/util/Calendar;
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 312
    .restart local v7       #lastActiveDate:Ljava/util/Calendar;
    .restart local v8       #today:Ljava/util/Calendar;
    .restart local v9       #yesterday:Ljava/util/Calendar;
    :cond_2
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public doUpdateVisitedHistory(Lcom/android/browser/Tab;Z)V
    .locals 6
    .parameter "tab"
    .parameter "isReload"

    .prologue
    const/4 v2, 0x0

    .line 1064
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1073
    :cond_0
    :goto_0
    return-void

    .line 1065
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    .line 1067
    .local v0, url:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    const-string v3, "about:"

    const/4 v5, 0x6

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1071
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/browser/DataController;->updateVisitedHistory(Ljava/lang/String;)V

    .line 1072
    iget-object v1, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v1}, Lcom/android/browser/CrashRecoveryHandler;->backupState()V

    goto :goto_0
.end method

.method public editUrl()V
    .locals 3

    .prologue
    .line 1205
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mOptionsMenuOpen:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->closeOptionsMenu()V

    .line 1206
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/browser/UI;->editUrl(ZZ)V

    .line 1207
    return-void
.end method

.method public endActionMode()V
    .locals 1

    .prologue
    .line 2508
    iget-object v0, p0, Lcom/android/browser/Controller;->mActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    .line 2509
    iget-object v0, p0, Lcom/android/browser/Controller;->mActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    .line 2511
    :cond_0
    return-void
.end method

.method public findOnPage()V
    .locals 3

    .prologue
    .line 2308
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->showFindDialog(Ljava/lang/String;Z)Z

    .line 2309
    return-void
.end method

.method getActionModeHeight()I
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 2480
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, 0x10102eb

    aput v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 2482
    .local v0, actionBarSizeTypedArray:Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v1, v2

    .line 2483
    .local v1, size:I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 2484
    return v1
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 468
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 463
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getCurrentTab()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 607
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentTopWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 2461
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 2466
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 1142
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->getDefaultVideoPoster()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method getIntentHandler()Lcom/android/browser/IntentHandler;
    .locals 1

    .prologue
    .line 481
    iget-object v0, p0, Lcom/android/browser/Controller;->mIntentHandler:Lcom/android/browser/IntentHandler;

    return-object v0
.end method

.method getMaxTabs()I
    .locals 2

    .prologue
    .line 490
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0
.end method

.method public getSettings()Lcom/android/browser/BrowserSettings;
    .locals 1

    .prologue
    .line 477
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    return-object v0
.end method

.method public getTabControl()Lcom/android/browser/TabControl;
    .locals 1

    .prologue
    .line 495
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    return-object v0
.end method

.method public getTabs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation

    .prologue
    .line 500
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getTabs()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUi()Lcom/android/browser/UI;
    .locals 1

    .prologue
    .line 486
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    return-object v0
.end method

.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 1

    .prologue
    .line 1147
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->getVideoLoadingProgressView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getVisitedHistory(Landroid/webkit/ValueCallback;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1077
    .local p1, callback:Landroid/webkit/ValueCallback;,"Landroid/webkit/ValueCallback<[Ljava/lang/String;>;"
    new-instance v0, Lcom/android/browser/Controller$6;

    invoke-direct {v0, p0, p1}, Lcom/android/browser/Controller$6;-><init>(Lcom/android/browser/Controller;Landroid/webkit/ValueCallback;)V

    .line 1088
    .local v0, task:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;[Ljava/lang/String;>;"
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1089
    return-void
.end method

.method public getWebViewFactory()Lcom/android/browser/WebViewFactory;
    .locals 1

    .prologue
    .line 443
    iget-object v0, p0, Lcom/android/browser/Controller;->mFactory:Lcom/android/browser/WebViewFactory;

    return-object v0
.end method

.method goBackOnePageOrQuit()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 3242
    iget-object v2, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 3243
    .local v0, current:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 3251
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    .line 3278
    :goto_0
    return-void

    .line 3254
    :cond_0
    invoke-virtual {v0}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3255
    invoke-virtual {v0}, Lcom/android/browser/Tab;->goBack()V

    goto :goto_0

    .line 3259
    :cond_1
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v1

    .line 3260
    .local v1, parent:Lcom/android/browser/Tab;
    if-eqz v1, :cond_2

    .line 3261
    invoke-virtual {p0, v1}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 3263
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->closeTab(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 3265
    :cond_2
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getAppId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Lcom/android/browser/Tab;->closeOnBack()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3266
    :cond_3
    invoke-virtual {p0, v3}, Lcom/android/browser/Controller;->closeCurrentTab(Z)V

    .line 3275
    :cond_4
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    goto :goto_0
.end method

.method public handleNewIntent(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 677
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->isWebShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 678
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->showWeb(Z)V

    .line 680
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mIntentHandler:Lcom/android/browser/IntentHandler;

    invoke-virtual {v0, p1}, Lcom/android/browser/IntentHandler;->onNewIntent(Landroid/content/Intent;)V

    .line 681
    return-void
.end method

.method public hideAutoLogin(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 1165
    sget-boolean v0, Lcom/android/browser/Controller;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1166
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->hideAutoLogin(Lcom/android/browser/Tab;)V

    .line 1167
    return-void
.end method

.method public hideCustomView()V
    .locals 1

    .prologue
    .line 1228
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->isCustomViewShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1229
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->onHideCustomView()V

    .line 1231
    iget v0, p0, Lcom/android/browser/Controller;->mOldMenuState:I

    iput v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    .line 1232
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/Controller;->mOldMenuState:I

    .line 1233
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 1235
    :cond_0
    return-void
.end method

.method protected isActivityPaused()Z
    .locals 1

    .prologue
    .line 841
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    return v0
.end method

.method public isInCustomActionMode()Z
    .locals 1

    .prologue
    .line 2500
    iget-object v0, p0, Lcom/android/browser/Controller;->mActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isInLoad()Z
    .locals 2

    .prologue
    .line 2525
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 2526
    .local v0, tab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isMenuDown()Z
    .locals 1

    .prologue
    .line 3482
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    return v0
.end method

.method isMenuOrCtrlKey(I)Z
    .locals 1
    .parameter "keyCode"

    .prologue
    .line 3305
    const/16 v0, 0x52

    if-eq v0, p1, :cond_0

    const/16 v0, 0x71

    if-eq v0, p1, :cond_0

    const/16 v0, 0x72

    if-ne v0, p1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V
    .locals 1
    .parameter "tab"
    .parameter "url"

    .prologue
    .line 3201
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/util/Map;)V

    .line 3202
    return-void
.end method

.method protected loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .parameter "tab"
    .parameter "url"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/browser/Tab;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3205
    .local p3, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 3206
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    .line 3207
    invoke-virtual {p1, p2, p3}, Lcom/android/browser/Tab;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 3208
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 3210
    :cond_0
    return-void
.end method

.method protected loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V
    .locals 2
    .parameter "t"
    .parameter "data"

    .prologue
    .line 3219
    if-eqz p2, :cond_0

    .line 3220
    invoke-virtual {p2}, Lcom/android/browser/IntentHandler$UrlData;->isPreloaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3229
    :cond_0
    :goto_0
    return-void

    .line 3223
    :cond_1
    if-eqz p1, :cond_2

    iget-boolean v0, p2, Lcom/android/browser/IntentHandler$UrlData;->mDisableUrlOverride:Z

    if-eqz v0, :cond_2

    .line 3224
    invoke-virtual {p1}, Lcom/android/browser/Tab;->disableUrlOverridingForLoad()V

    .line 3226
    :cond_2
    iget-object v0, p2, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/browser/IntentHandler$UrlData;->mHeaders:Ljava/util/Map;

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method protected loadUrlFromContext(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 3180
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 3181
    .local v0, tab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 3183
    .local v1, view:Landroid/webkit/WebView;
    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 3184
    invoke-static {p1}, Lcom/android/browser/UrlUtils;->smartUrlFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3185
    invoke-static {v1}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebViewClassic;->getWebViewClient()Landroid/webkit/WebViewClient;

    move-result-object v2

    invoke-virtual {v2, v1, p1}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3187
    invoke-virtual {p0, v0, p1}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V

    .line 3190
    :cond_0
    return-void

    .line 3181
    .end local v1           #view:Landroid/webkit/WebView;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 2519
    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInCustomActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2522
    :goto_0
    return-void

    .line 2520
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInLoad()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->onActionModeFinished(Z)V

    .line 2521
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/Controller;->mActionMode:Landroid/view/ActionMode;

    goto :goto_0
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 2491
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 2492
    iput-object p1, p0, Lcom/android/browser/Controller;->mActionMode:Landroid/view/ActionMode;

    .line 2493
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 18
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 1240
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v15

    if-nez v15, :cond_0

    .line 1306
    :goto_0
    return-void

    .line 1241
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 1305
    :cond_1
    :goto_1
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v15

    invoke-virtual {v15}, Landroid/webkit/WebView;->requestFocus()Z

    goto :goto_0

    .line 1243
    :pswitch_1
    const/4 v15, -0x1

    move/from16 v0, p2

    if-ne v0, v15, :cond_1

    if-eqz p3, :cond_1

    .line 1244
    const-string v15, "android.intent.extra.TEXT"

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1245
    .local v3, action:Ljava/lang/String;
    const-string v15, "privacy_clear_history"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 1246
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v15}, Lcom/android/browser/TabControl;->removeParentChildRelationShips()V

    goto :goto_1

    .line 1252
    .end local v3           #action:Ljava/lang/String;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    if-eqz v15, :cond_1

    .line 1253
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    move/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v15, v0, v1}, Lcom/android/browser/UploadHandler;->onResult(ILandroid/content/Intent;)V

    goto :goto_1

    .line 1259
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getSettings()Lcom/android/browser/BrowserSettings;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/browser/BrowserSettings;->getAutoFillProfile()Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-result-object v15

    if-eqz v15, :cond_1

    .line 1260
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mAutoFillSetupMessage:Landroid/os/Message;

    invoke-virtual {v15}, Landroid/os/Message;->sendToTarget()V

    .line 1261
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/browser/Controller;->mAutoFillSetupMessage:Landroid/os/Message;

    goto :goto_1

    .line 1265
    :pswitch_4
    if-eqz p3, :cond_1

    const/4 v15, -0x1

    move/from16 v0, p2

    if-ne v0, v15, :cond_1

    .line 1268
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Lcom/android/browser/UI;->showWeb(Z)V

    .line 1269
    const-string v15, "android.intent.action.VIEW"

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 1270
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v11

    .line 1271
    .local v11, t:Lcom/android/browser/Tab;
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v12

    .line 1272
    .local v12, uri:Landroid/net/Uri;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z

    .line 1273
    invoke-virtual {v12}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;

    .line 1274
    invoke-virtual {v12}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v15}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1275
    .end local v11           #t:Lcom/android/browser/Tab;
    .end local v12           #uri:Landroid/net/Uri;
    :cond_2
    const-string v15, "open_all"

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 1276
    const-string v15, "open_all"

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 1278
    .local v14, urls:[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v9

    .line 1279
    .local v9, parent:Lcom/android/browser/Tab;
    move-object v4, v14

    .local v4, arr$:[Ljava/lang/String;
    array-length v8, v4

    .local v8, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_2
    if-ge v5, v8, :cond_1

    aget-object v13, v4, v5

    .line 1280
    .local v13, url:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v15}, Lcom/android/browser/BrowserSettings;->openInBackground()Z

    move-result v15

    if-nez v15, :cond_3

    const/4 v15, 0x1

    :goto_3
    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v13, v9, v15, v1}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;Lcom/android/browser/Tab;ZZ)Lcom/android/browser/Tab;

    move-result-object v9

    .line 1279
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1280
    :cond_3
    const/4 v15, 0x0

    goto :goto_3

    .line 1283
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v8           #len$:I
    .end local v9           #parent:Lcom/android/browser/Tab;
    .end local v13           #url:Ljava/lang/String;
    .end local v14           #urls:[Ljava/lang/String;
    :cond_4
    const-string v15, "snapshot_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 1284
    const-string v15, "snapshot_id"

    const-wide/16 v16, -0x1

    move-object/from16 v0, p3

    move-wide/from16 v1, v16

    invoke-virtual {v0, v15, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    .line 1286
    .local v6, id:J
    const-wide/16 v15, 0x0

    cmp-long v15, v6, v15

    if-ltz v15, :cond_1

    .line 1287
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v7, v15}, Lcom/android/browser/Controller;->createNewSnapshotTab(JZ)Lcom/android/browser/SnapshotTab;

    goto/16 :goto_1

    .line 1292
    .end local v6           #id:J
    :pswitch_5
    const/4 v15, -0x1

    move/from16 v0, p2

    if-ne v0, v15, :cond_1

    if-eqz p3, :cond_1

    .line 1293
    const-string v15, "android.speech.extra.RESULTS"

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1295
    .local v10, results:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-lt v15, v0, :cond_1

    .line 1296
    const/4 v15, 0x0

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/browser/Controller;->mVoiceResult:Ljava/lang/String;

    goto/16 :goto_1

    .line 1241
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_0
    .end packed-switch
.end method

.method public onBackKey()V
    .locals 2

    .prologue
    .line 1333
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1}, Lcom/android/browser/UI;->onBackKey()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1334
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentSubWindow()Landroid/webkit/WebView;

    move-result-object v0

    .line 1335
    .local v0, subwindow:Landroid/webkit/WebView;
    if-eqz v0, :cond_2

    .line 1336
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1337
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 1345
    .end local v0           #subwindow:Landroid/webkit/WebView;
    :cond_0
    :goto_0
    return-void

    .line 1339
    .restart local v0       #subwindow:Landroid/webkit/WebView;
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 1342
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/Controller;->goBackOnePageOrQuit()V

    goto :goto_0
.end method

.method public onConfgurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "config"

    .prologue
    .line 664
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/Controller;->mConfigChanged:Z

    .line 666
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 667
    iget-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    if-eqz v0, :cond_0

    .line 668
    iget-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    invoke-virtual {v0, p1}, Lcom/android/browser/PageDialogsHandler;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 670
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 672
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v0, p1}, Lcom/android/browser/BrowserSettings;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 673
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .parameter "item"

    .prologue
    const/4 v5, 0x0

    .line 2372
    invoke-interface {p1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v6

    const v7, 0x7f0d00f3

    if-ne v6, v7, :cond_0

    move v3, v5

    .line 2401
    :goto_0
    return v3

    .line 2376
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 2377
    .local v1, id:I
    const/4 v3, 0x1

    .line 2378
    .local v3, result:Z
    sparse-switch v1, :sswitch_data_0

    .line 2399
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    goto :goto_0

    .line 2384
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v4

    .line 2385
    .local v4, webView:Landroid/webkit/WebView;
    if-nez v4, :cond_1

    .line 2386
    const/4 v3, 0x0

    .line 2387
    goto :goto_0

    .line 2389
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2391
    .local v0, hrefMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Landroid/webkit/WebView;>;"
    const-string v6, "webview"

    invoke-virtual {v0, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2392
    iget-object v6, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v7, 0x66

    invoke-virtual {v6, v7, v1, v5, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 2394
    .local v2, msg:Landroid/os/Message;
    invoke-virtual {v4, v2}, Landroid/webkit/WebView;->requestFocusNodeHref(Landroid/os/Message;)V

    goto :goto_0

    .line 2378
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0d0021 -> :sswitch_0
        0x7f0d00e3 -> :sswitch_0
        0x7f0d00e4 -> :sswitch_0
        0x7f0d00e5 -> :sswitch_0
    .end sparse-switch
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 2455
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInLoad()Z

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/android/browser/UI;->onContextMenuClosed(Landroid/view/Menu;Z)V

    .line 2456
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 24
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    .line 1370
    move-object/from16 v0, p2

    instance-of v0, v0, Lcom/android/browser/TitleBar;

    move/from16 v19, v0

    if-eqz v19, :cond_1

    .line 1765
    :cond_0
    :goto_0
    return-void

    .line 1373
    :cond_1
    move-object/from16 v0, p2

    instance-of v0, v0, Landroid/webkit/WebView;

    move/from16 v19, v0

    if-eqz v19, :cond_0

    move-object/from16 v18, p2

    .line 1376
    check-cast v18, Landroid/webkit/WebView;

    .line 1377
    .local v18, webview:Landroid/webkit/WebView;
    invoke-virtual/range {v18 .. v18}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v12

    .line 1378
    .local v12, result:Landroid/webkit/WebView$HitTestResult;
    if-eqz v12, :cond_0

    .line 1382
    invoke-virtual {v12}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v16

    .line 1383
    .local v16, type:I
    if-nez v16, :cond_2

    .line 1384
    const-string v19, "Controller"

    const-string v20, "We should not show context menu when nothing is touched"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1388
    :cond_2
    const/16 v19, 0x9

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_0

    .line 1396
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v8

    .line 1397
    .local v8, inflater:Landroid/view/MenuInflater;
    const v19, 0x7f100004

    move/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v8, v0, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1400
    invoke-virtual {v12}, Landroid/webkit/WebView$HitTestResult;->getExtra()Ljava/lang/String;

    move-result-object v5

    .line 1403
    .local v5, extra:Ljava/lang/String;
    invoke-virtual {v12}, Landroid/webkit/WebView$HitTestResult;->getImageAnchorUrlExtra()Ljava/lang/String;

    move-result-object v7

    .line 1404
    .local v7, imageAnchorUrlExtra:Ljava/lang/String;
    const-string v19, "browser/Controller"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "sitenavigation onCreateContextMenu imageAnchorUrlExtra is : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1407
    const/16 v17, 0x0

    .line 1408
    .local v17, url:Ljava/lang/String;
    const/4 v9, 0x0

    .line 1410
    .local v9, itemUrl:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v19

    const-string v20, "phone"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/telephony/TelephonyManager;

    .line 1411
    .local v15, telephony:Landroid/telephony/TelephonyManager;
    const/4 v10, 0x0

    .line 1413
    .local v10, mIsVoiceCapable:Z
    if-eqz v15, :cond_3

    .line 1414
    invoke-virtual {v15}, Landroid/telephony/TelephonyManager;->isVoiceCapable()Z

    move-result v10

    .line 1418
    :cond_3
    invoke-virtual/range {v18 .. v18}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v17

    .line 1419
    if-eqz v17, :cond_a

    const-string v19, "content://com.android.browser.site_navigation/websites"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 1420
    invoke-static {v7}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1422
    if-eqz v9, :cond_9

    .line 1423
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/browser/Controller;->isSiteNavigationAboutBlankUrl(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 1424
    const v20, 0x7f0d00ef

    const/16 v19, 0x8

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_6

    const/16 v19, 0x1

    :goto_1
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1425
    const v19, 0x7f0d00ec

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1432
    :goto_2
    const v19, 0x7f0d00d4

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1433
    const v19, 0x7f0d00d8

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1434
    const v19, 0x7f0d00db

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1435
    const v19, 0x7f0d00de

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1436
    const v19, 0x7f0d00e6

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1437
    const v19, 0x7f0d00e1

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1438
    const v19, 0x7f0d00ea

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1529
    :cond_4
    :goto_3
    packed-switch v16, :pswitch_data_0

    .line 1760
    :pswitch_0
    const-string v19, "Controller"

    const-string v20, "We should not get here."

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1764
    :cond_5
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->onContextMenuCreated(Landroid/view/Menu;)V

    goto/16 :goto_0

    .line 1424
    :cond_6
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 1427
    :cond_7
    const v19, 0x7f0d00ef

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1428
    const v20, 0x7f0d00ec

    const/16 v19, 0x8

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_8

    const/16 v19, 0x1

    :goto_5
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    goto/16 :goto_2

    :cond_8
    const/16 v19, 0x0

    goto :goto_5

    .line 1440
    :cond_9
    const-string v19, "browser/Controller"

    const-string v20, "sitenavigation onCreateContextMenu itemUrl is null! Anchor text selected."

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1441
    const v19, 0x7f0d00ef

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1442
    const v19, 0x7f0d00ec

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1443
    const v19, 0x7f0d00d4

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1444
    const v19, 0x7f0d00d8

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1445
    const v19, 0x7f0d00db

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1446
    const v19, 0x7f0d00de

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1447
    const v19, 0x7f0d00e6

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1448
    const v19, 0x7f0d00e1

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1449
    const v19, 0x7f0d00ea

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    goto/16 :goto_3

    .line 1453
    :cond_a
    const v19, 0x7f0d00ec

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1454
    const v19, 0x7f0d00ef

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1457
    if-eqz v10, :cond_f

    .line 1458
    const v20, 0x7f0d00d4

    const/16 v19, 0x2

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_e

    const/16 v19, 0x1

    :goto_6
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1460
    const v19, 0x7f0d00d8

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1469
    :goto_7
    const v20, 0x7f0d00db

    const/16 v19, 0x4

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_10

    const/16 v19, 0x1

    :goto_8
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1471
    const v20, 0x7f0d00de

    const/16 v19, 0x3

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_11

    const/16 v19, 0x1

    :goto_9
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1473
    const v20, 0x7f0d00e6

    const/16 v19, 0x5

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_b

    const/16 v19, 0x8

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_12

    :cond_b
    const/16 v19, 0x1

    :goto_a
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1476
    const v20, 0x7f0d00e1

    const/16 v19, 0x7

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_c

    const/16 v19, 0x8

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_13

    :cond_c
    const/16 v19, 0x1

    :goto_b
    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1479
    const/16 v19, 0x7

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_d

    const/16 v19, 0x2

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_d

    const/16 v19, 0x4

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_d

    const/16 v19, 0x3

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_14

    :cond_d
    const/4 v6, 0x1

    .line 1483
    .local v6, hitText:Z
    :goto_c
    const v19, 0x7f0d00ea

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1, v6}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1484
    if-eqz v6, :cond_4

    .line 1485
    const v19, 0x7f0d00eb

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$SelectText;

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/browser/Controller$SelectText;-><init>(Landroid/webkit/WebView;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_3

    .line 1458
    .end local v6           #hitText:Z
    :cond_e
    const/16 v19, 0x0

    goto/16 :goto_6

    .line 1463
    :cond_f
    const v19, 0x7f0d00d4

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 1465
    const v19, 0x7f0d00d8

    const/16 v20, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    goto/16 :goto_7

    .line 1469
    :cond_10
    const/16 v19, 0x0

    goto/16 :goto_8

    .line 1471
    :cond_11
    const/16 v19, 0x0

    goto/16 :goto_9

    .line 1473
    :cond_12
    const/16 v19, 0x0

    goto/16 :goto_a

    .line 1476
    :cond_13
    const/16 v19, 0x0

    goto :goto_b

    .line 1479
    :cond_14
    const/4 v6, 0x0

    goto :goto_c

    .line 1531
    :pswitch_1
    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_15

    .line 1532
    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1536
    :goto_d
    const v19, 0x7f0d00d5

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Landroid/content/Intent;

    const-string v21, "android.intent.action.VIEW"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "tel:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 1539
    new-instance v4, Landroid/content/Intent;

    const-string v19, "android.intent.action.INSERT_OR_EDIT"

    move-object/from16 v0, v19

    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1540
    .local v4, addIntent:Landroid/content/Intent;
    const-string v19, "phone"

    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1541
    const-string v19, "vnd.android.cursor.item/contact"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1543
    if-eqz v10, :cond_16

    .line 1544
    const v19, 0x7f0d00d6

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 1546
    const v19, 0x7f0d00d7

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$Copy;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$Copy;-><init>(Lcom/android/browser/Controller;Ljava/lang/CharSequence;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 1534
    .end local v4           #addIntent:Landroid/content/Intent;
    :cond_15
    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x80

    invoke-virtual/range {v19 .. v21}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto/16 :goto_d

    .line 1550
    .restart local v4       #addIntent:Landroid/content/Intent;
    :cond_16
    const v19, 0x7f0d00d9

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 1552
    const v19, 0x7f0d00da

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$Copy;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$Copy;-><init>(Lcom/android/browser/Controller;Ljava/lang/CharSequence;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 1560
    .end local v4           #addIntent:Landroid/content/Intent;
    :pswitch_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_17

    .line 1561
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1565
    :goto_e
    const v19, 0x7f0d00dc

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Landroid/content/Intent;

    const-string v21, "android.intent.action.VIEW"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "mailto:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 1568
    const v19, 0x7f0d00dd

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$Copy;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$Copy;-><init>(Lcom/android/browser/Controller;Ljava/lang/CharSequence;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 1563
    :cond_17
    const/16 v19, 0x0

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto :goto_e

    .line 1574
    :pswitch_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_18

    .line 1575
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1579
    :goto_f
    const v19, 0x7f0d00df

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Landroid/content/Intent;

    const-string v21, "android.intent.action.VIEW"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "geo:0,0?q="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-static {v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 1583
    const v19, 0x7f0d00e0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$Copy;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$Copy;-><init>(Lcom/android/browser/Controller;Ljava/lang/CharSequence;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 1577
    :cond_18
    const/16 v19, 0x0

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto :goto_f

    .line 1590
    :pswitch_4
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_1d

    .line 1591
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1596
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v14

    .line 1597
    .local v14, showNewTab:Z
    const v19, 0x7f0d00e2

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    .line 1599
    .local v11, newTabItem:Landroid/view/MenuItem;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->getSettings()Lcom/android/browser/BrowserSettings;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->openInBackground()Z

    move-result v19

    if-eqz v19, :cond_1e

    const v19, 0x7f0c00a3

    :goto_11
    move/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1602
    invoke-interface {v11, v14}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1603
    if-eqz v14, :cond_19

    .line 1604
    const/16 v19, 0x8

    move/from16 v0, v19

    move/from16 v1, v16

    if-ne v0, v1, :cond_1f

    .line 1605
    new-instance v19, Lcom/android/browser/Controller$7;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/android/browser/Controller$7;-><init>(Lcom/android/browser/Controller;Landroid/webkit/WebView;)V

    move-object/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1645
    :cond_19
    :goto_12
    if-eqz v17, :cond_1b

    const-string v19, "content://com.android.browser.site_navigation/websites"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1b

    .line 1647
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/browser/Controller;->isSiteNavigationAboutBlankUrl(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_20

    .line 1648
    const-string v19, "about:blank"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1658
    :cond_1a
    :goto_13
    const v19, 0x7f0d00e2

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    const/16 v20, 0x0

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1660
    if-eqz v9, :cond_23

    .line 1661
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/android/browser/Controller;->isSiteNavigationAboutBlankUrl(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_22

    .line 1663
    const v19, 0x7f0d00f0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$9;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7}, Lcom/android/browser/Controller$9;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1719
    :cond_1b
    :goto_14
    const/16 v19, 0x7

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_5

    .line 1724
    .end local v11           #newTabItem:Landroid/view/MenuItem;
    .end local v14           #showNewTab:Z
    :pswitch_5
    const v19, 0x7f0d00a6

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v13

    .line 1725
    .local v13, shareItem:Landroid/view/MenuItem;
    const/16 v19, 0x5

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_24

    const/16 v19, 0x1

    :goto_15
    move/from16 v0, v19

    invoke-interface {v13, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1726
    const/16 v19, 0x5

    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_1c

    .line 1727
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_25

    .line 1728
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 1732
    :goto_16
    new-instance v19, Lcom/android/browser/Controller$12;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$12;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1743
    :cond_1c
    const v19, 0x7f0d00e8

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$13;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$13;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1751
    const v19, 0x7f0d00e7

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$Download;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    move-object/from16 v21, v0

    invoke-virtual/range {v18 .. v18}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v22

    invoke-virtual/range {v18 .. v18}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/android/browser/Controller$Download;-><init>(Landroid/app/Activity;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1754
    const v19, 0x7f0d00e9

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/WallpaperHandler;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v5}, Lcom/android/browser/WallpaperHandler;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_4

    .line 1593
    .end local v13           #shareItem:Landroid/view/MenuItem;
    :cond_1d
    const/16 v19, 0x0

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto/16 :goto_10

    .line 1599
    .restart local v11       #newTabItem:Landroid/view/MenuItem;
    .restart local v14       #showNewTab:Z
    :cond_1e
    const v19, 0x7f0c00a2

    goto/16 :goto_11

    .line 1621
    :cond_1f
    new-instance v19, Lcom/android/browser/Controller$8;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/android/browser/Controller$8;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_12

    .line 1649
    :cond_20
    if-eqz v7, :cond_1a

    .line 1650
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_21

    .line 1651
    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto/16 :goto_13

    .line 1653
    :cond_21
    const/16 v19, 0x0

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v7, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto/16 :goto_13

    .line 1683
    :cond_22
    const v19, 0x7f0d00ed

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$10;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7}, Lcom/android/browser/Controller$10;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 1702
    const v19, 0x7f0d00ee

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v19

    new-instance v20, Lcom/android/browser/Controller$11;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7}, Lcom/android/browser/Controller$11;-><init>(Lcom/android/browser/Controller;Ljava/lang/String;)V

    invoke-interface/range {v19 .. v20}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto/16 :goto_14

    .line 1714
    :cond_23
    const-string v19, "Controller"

    const-string v20, "sitenavigation onCreateContextMenu itemUrl is null!"

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_14

    .line 1725
    .end local v11           #newTabItem:Landroid/view/MenuItem;
    .end local v14           #showNewTab:Z
    .restart local v13       #shareItem:Landroid/view/MenuItem;
    :cond_24
    const/16 v19, 0x0

    goto/16 :goto_15

    .line 1730
    :cond_25
    const/16 v19, 0x0

    const/16 v20, 0x80

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    goto/16 :goto_16

    .line 1529
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    .line 1356
    iget v1, p0, Lcom/android/browser/Controller;->mMenuState:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1357
    const/4 v1, 0x0

    .line 1361
    :goto_0
    return v1

    .line 1359
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 1360
    .local v0, inflater:Landroid/view/MenuInflater;
    const v1, 0x7f100003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1361
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 814
    iget-object v1, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    if-eqz v1, :cond_0

    .line 815
    iget-object v1, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    invoke-virtual {v1}, Lcom/android/browser/PageDialogsHandler;->destroyDialogs()V

    .line 818
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    invoke-virtual {v1}, Lcom/android/browser/UploadHandler;->handled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 819
    iget-object v1, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/browser/UploadHandler;->onResult(ILandroid/content/Intent;)V

    .line 820
    iput-object v3, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    .line 822
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    if-nez v1, :cond_2

    .line 838
    :goto_0
    return-void

    .line 823
    :cond_2
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1}, Lcom/android/browser/UI;->onDestroy()V

    .line 825
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 826
    .local v0, t:Lcom/android/browser/Tab;
    if-eqz v0, :cond_3

    .line 827
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    .line 828
    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->removeTab(Lcom/android/browser/Tab;)V

    .line 830
    :cond_3
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/Controller;->mBookmarksObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 831
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/Controller;->mSiteNavigationObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 833
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->destroy()V

    .line 834
    invoke-static {}, Landroid/webkit/WebIconDatabase;->getInstance()Landroid/webkit/WebIconDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebIconDatabase;->close()V

    .line 836
    iget-object v1, p0, Lcom/android/browser/Controller;->mSystemAllowGeolocationOrigins:Lcom/android/browser/SystemAllowGeolocationOrigins;

    invoke-virtual {v1}, Lcom/android/browser/SystemAllowGeolocationOrigins;->stop()V

    .line 837
    iput-object v3, p0, Lcom/android/browser/Controller;->mSystemAllowGeolocationOrigins:Lcom/android/browser/SystemAllowGeolocationOrigins;

    goto :goto_0
.end method

.method public onDownloadStart(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10
    .parameter "tab"
    .parameter "url"
    .parameter "userAgent"
    .parameter "contentDisposition"
    .parameter "mimetype"
    .parameter "referer"
    .parameter "contentLength"

    .prologue
    .line 1124
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v9

    .line 1125
    .local v9, w:Landroid/webkit/WebView;
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v6

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object/from16 v5, p6

    move-wide/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/android/browser/DownloadHandler;->onDownloadStart(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 1127
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Landroid/webkit/WebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getSize()I

    move-result v0

    if-nez v0, :cond_0

    .line 1130
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 1135
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->closeTab(Lcom/android/browser/Tab;)V

    .line 1138
    :cond_0
    return-void
.end method

.method public onFavicon(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "tab"
    .parameter "view"
    .parameter "icon"

    .prologue
    .line 1026
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 1027
    invoke-virtual {p2}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p3}, Lcom/android/browser/Controller;->maybeUpdateFavicon(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 1028
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 8
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 3319
    invoke-virtual {p2}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v1

    .line 3322
    .local v1, noModifiers:Z
    if-nez v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->isMenuOrCtrlKey(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 3323
    iput-boolean v6, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    .line 3444
    :cond_0
    :goto_0
    return v5

    .line 3327
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v4

    .line 3328
    .local v4, webView:Landroid/webkit/WebView;
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v3

    .line 3329
    .local v3, tab:Lcom/android/browser/Tab;
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    .line 3331
    const/16 v5, 0x1000

    invoke-virtual {p2, v5}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v0

    .line 3332
    .local v0, ctrl:Z
    invoke-virtual {p2, v6}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v2

    .line 3334
    .local v2, shift:Z
    sparse-switch p1, :sswitch_data_0

    .line 3444
    :cond_2
    :goto_1
    iget-object v5, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v5, p1, p2}, Lcom/android/browser/UI;->dispatchKey(ILandroid/view/KeyEvent;)Z

    move-result v5

    goto :goto_0

    .line 3344
    :sswitch_0
    iget-object v5, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_1

    .line 3348
    :sswitch_1
    iget-object v5, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v5}, Lcom/android/browser/UI;->isWebShowing()Z

    move-result v5

    if-nez v5, :cond_2

    move v5, v6

    .line 3349
    goto :goto_0

    .line 3354
    :sswitch_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3355
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 3357
    invoke-direct {p0}, Lcom/android/browser/Controller;->getPrevTab()Lcom/android/browser/Tab;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    :goto_2
    move v5, v6

    .line 3362
    goto :goto_0

    .line 3360
    :cond_3
    invoke-direct {p0}, Lcom/android/browser/Controller;->getNextTab()Lcom/android/browser/Tab;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    goto :goto_2

    .line 3369
    :sswitch_3
    if-eqz v2, :cond_5

    .line 3370
    invoke-virtual {p0}, Lcom/android/browser/Controller;->pageUp()V

    :cond_4
    :goto_3
    move v5, v6

    .line 3374
    goto :goto_0

    .line 3371
    :cond_5
    if-eqz v1, :cond_4

    .line 3372
    invoke-virtual {p0}, Lcom/android/browser/Controller;->pageDown()V

    goto :goto_3

    .line 3376
    :sswitch_4
    if-eqz v1, :cond_2

    .line 3377
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    move v5, v6

    .line 3378
    goto :goto_0

    .line 3380
    :sswitch_5
    if-eqz v1, :cond_2

    .line 3381
    invoke-virtual {v3}, Lcom/android/browser/Tab;->goForward()V

    move v5, v6

    .line 3382
    goto :goto_0

    .line 3384
    :sswitch_6
    if-eqz v0, :cond_2

    .line 3385
    invoke-virtual {v3}, Lcom/android/browser/Tab;->goBack()V

    move v5, v6

    .line 3386
    goto :goto_0

    .line 3390
    :sswitch_7
    if-eqz v0, :cond_2

    .line 3391
    invoke-virtual {v3}, Lcom/android/browser/Tab;->goForward()V

    move v5, v6

    .line 3392
    goto :goto_0

    .line 3396
    :sswitch_8
    if-eqz v0, :cond_2

    .line 3397
    invoke-static {v4}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebViewClassic;->selectAll()V

    move v5, v6

    .line 3398
    goto/16 :goto_0

    .line 3403
    :sswitch_9
    if-eqz v0, :cond_2

    .line 3404
    invoke-static {v4}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebViewClassic;->copySelection()Z

    move v5, v6

    .line 3405
    goto/16 :goto_0

    .line 3427
    :sswitch_a
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3428
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 3429
    invoke-virtual {p0}, Lcom/android/browser/Controller;->openIncognitoTab()Lcom/android/browser/Tab;

    :goto_4
    move v5, v6

    .line 3433
    goto/16 :goto_0

    .line 3431
    :cond_6
    invoke-virtual {p0}, Lcom/android/browser/Controller;->openTabToHomePage()Lcom/android/browser/Tab;

    goto :goto_4

    .line 3334
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_4
        0x15 -> :sswitch_6
        0x16 -> :sswitch_7
        0x1d -> :sswitch_8
        0x1f -> :sswitch_9
        0x30 -> :sswitch_a
        0x3d -> :sswitch_2
        0x3e -> :sswitch_3
        0x52 -> :sswitch_0
        0x54 -> :sswitch_1
        0x7d -> :sswitch_5
    .end sparse-switch
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 3449
    packed-switch p1, :pswitch_data_0

    .line 3457
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 3451
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->isWebShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3452
    sget-object v0, Lcom/android/browser/UI$ComboViews;->History:Lcom/android/browser/UI$ComboViews;

    invoke-virtual {p0, v0}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    .line 3453
    const/4 v0, 0x1

    goto :goto_0

    .line 3449
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    .line 3462
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->isMenuOrCtrlKey(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3463
    iput-boolean v0, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    .line 3464
    const/16 v1, 0x52

    if-ne v1, p1, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3466
    invoke-virtual {p0}, Lcom/android/browser/Controller;->onMenuKey()Z

    move-result v0

    .line 3478
    :cond_0
    :goto_0
    return v0

    .line 3469
    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3470
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 3472
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3473
    invoke-virtual {p0}, Lcom/android/browser/Controller;->onBackKey()V

    .line 3474
    const/4 v0, 0x1

    goto :goto_0

    .line 3470
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 846
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->freeMemory()V

    .line 847
    return-void
.end method

.method protected onMenuKey()Z
    .locals 1

    .prologue
    .line 1348
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->onMenuKey()Z

    move-result v0

    return v0
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 3
    .parameter "featureId"
    .parameter "menu"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2420
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mOptionsMenuOpen:Z

    if-eqz v0, :cond_2

    .line 2421
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mConfigChanged:Z

    if-eqz v0, :cond_0

    .line 2425
    iput-boolean v1, p0, Lcom/android/browser/Controller;->mConfigChanged:Z

    .line 2444
    :goto_0
    return v2

    .line 2427
    :cond_0
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mExtendedMenuOpen:Z

    if-nez v0, :cond_1

    .line 2428
    iput-boolean v2, p0, Lcom/android/browser/Controller;->mExtendedMenuOpen:Z

    .line 2429
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->onExtendedMenuOpened()V

    goto :goto_0

    .line 2433
    :cond_1
    iput-boolean v1, p0, Lcom/android/browser/Controller;->mExtendedMenuOpen:Z

    .line 2434
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInLoad()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->onExtendedMenuClosed(Z)V

    goto :goto_0

    .line 2439
    :cond_2
    iput-boolean v2, p0, Lcom/android/browser/Controller;->mOptionsMenuOpen:Z

    .line 2440
    iput-boolean v1, p0, Lcom/android/browser/Controller;->mConfigChanged:Z

    .line 2441
    iput-boolean v1, p0, Lcom/android/browser/Controller;->mExtendedMenuOpen:Z

    .line 2442
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->onOptionsMenuOpened()V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .parameter "item"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 2061
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v8

    if-nez v8, :cond_1

    .line 2233
    :cond_0
    :goto_0
    return v6

    .line 2064
    :cond_1
    iget-boolean v8, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    if-eqz v8, :cond_2

    .line 2069
    iput-boolean v6, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    .line 2071
    :cond_2
    iget-object v8, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v8, p1}, Lcom/android/browser/UI;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v8

    if-eqz v8, :cond_3

    move v6, v7

    .line 2073
    goto :goto_0

    .line 2075
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 2106
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/browser/Controller;->bookmarkCurrentPage()V

    :cond_4
    :goto_1
    move v6, v7

    .line 2233
    goto :goto_0

    .line 2078
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/browser/Controller;->openTabToHomePage()Lcom/android/browser/Tab;

    goto :goto_1

    .line 2082
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/browser/Controller;->openIncognitoTab()Lcom/android/browser/Tab;

    goto :goto_1

    .line 2086
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/browser/Controller;->closeOtherTabs()V

    goto :goto_1

    .line 2090
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/browser/Controller;->editUrl()V

    goto :goto_1

    .line 2094
    :pswitch_6
    sget-object v6, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    invoke-virtual {p0, v6}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    goto :goto_1

    .line 2098
    :pswitch_7
    sget-object v6, Lcom/android/browser/UI$ComboViews;->History:Lcom/android/browser/UI$ComboViews;

    invoke-virtual {p0, v6}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    goto :goto_1

    .line 2102
    :pswitch_8
    sget-object v6, Lcom/android/browser/UI$ComboViews;->Snapshots:Lcom/android/browser/UI$ComboViews;

    invoke-virtual {p0, v6}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    goto :goto_1

    .line 2119
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 2120
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/webkit/WebView;->reload()V

    goto :goto_1

    .line 2125
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/browser/Controller;->stopLoading()V

    goto :goto_1

    .line 2129
    :pswitch_b
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/browser/Tab;->goBack()V

    goto :goto_1

    .line 2133
    :pswitch_c
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/browser/Tab;->goForward()V

    goto :goto_1

    .line 2138
    :pswitch_d
    iget-object v6, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v6}, Lcom/android/browser/TabControl;->getCurrentSubWindow()Landroid/webkit/WebView;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 2139
    iget-object v6, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v6}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    goto :goto_1

    .line 2142
    :cond_5
    invoke-virtual {p0}, Lcom/android/browser/Controller;->closeCurrentTab()V

    goto :goto_1

    .line 2148
    :pswitch_e
    iget-object v6, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v6}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 2149
    .local v0, current:Lcom/android/browser/Tab;
    iget-object v6, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v6}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v0, v6}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V

    goto :goto_1

    .line 2153
    .end local v0           #current:Lcom/android/browser/Tab;
    :pswitch_f
    invoke-virtual {p0}, Lcom/android/browser/Controller;->openPreferences()V

    goto :goto_1

    .line 2157
    :pswitch_10
    invoke-virtual {p0}, Lcom/android/browser/Controller;->findOnPage()V

    goto :goto_1

    .line 2161
    :pswitch_11
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v5

    .line 2162
    .local v5, source:Lcom/android/browser/Tab;
    if-eqz v5, :cond_4

    .line 2163
    new-instance v8, Lcom/android/browser/Controller$SaveSnapshotTask;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v5, v9}, Lcom/android/browser/Controller$SaveSnapshotTask;-><init>(Lcom/android/browser/Controller;Lcom/android/browser/Tab;Lcom/android/browser/Controller$1;)V

    new-array v6, v6, [Ljava/lang/Void;

    invoke-virtual {v8, v6}, Lcom/android/browser/Controller$SaveSnapshotTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_1

    .line 2168
    .end local v5           #source:Lcom/android/browser/Tab;
    :pswitch_12
    invoke-direct {p0}, Lcom/android/browser/Controller;->showCloseSelectionDialog()V

    goto/16 :goto_1

    .line 2172
    :pswitch_13
    invoke-virtual {p0}, Lcom/android/browser/Controller;->showPageInfo()V

    goto/16 :goto_1

    .line 2176
    :pswitch_14
    invoke-direct {p0}, Lcom/android/browser/Controller;->goLive()V

    move v6, v7

    .line 2177
    goto/16 :goto_0

    .line 2180
    :pswitch_15
    iget-object v8, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v8}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    .line 2181
    .local v1, currentTab:Lcom/android/browser/Tab;
    if-eqz v1, :cond_0

    .line 2184
    invoke-direct {p0, v1}, Lcom/android/browser/Controller;->shareCurrentPage(Lcom/android/browser/Tab;)V

    goto/16 :goto_1

    .line 2188
    .end local v1           #currentTab:Lcom/android/browser/Tab;
    :pswitch_16
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/webkit/WebView;->debugDump()V

    goto/16 :goto_1

    .line 2192
    :pswitch_17
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/webkit/WebView;->zoomIn()Z

    goto/16 :goto_1

    .line 2196
    :pswitch_18
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/webkit/WebView;->zoomOut()Z

    goto/16 :goto_1

    .line 2200
    :pswitch_19
    invoke-virtual {p0}, Lcom/android/browser/Controller;->viewDownloads()V

    goto/16 :goto_1

    .line 2204
    :pswitch_1a
    invoke-virtual {p0}, Lcom/android/browser/Controller;->toggleUserAgent()V

    goto/16 :goto_1

    .line 2216
    :pswitch_1b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    .line 2217
    .local v4, menuid:I
    const/4 v3, 0x0

    .local v3, id:I
    :goto_2
    sget-object v6, Lcom/android/browser/Controller;->WINDOW_SHORTCUT_ID_ARRAY:[I

    array-length v6, v6

    if-ge v3, v6, :cond_4

    .line 2218
    sget-object v6, Lcom/android/browser/Controller;->WINDOW_SHORTCUT_ID_ARRAY:[I

    aget v6, v6, v3

    if-ne v6, v4, :cond_6

    .line 2219
    iget-object v6, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v6, v3}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v2

    .line 2220
    .local v2, desiredTab:Lcom/android/browser/Tab;
    if-eqz v2, :cond_4

    iget-object v6, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v6}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v6

    if-eq v2, v6, :cond_4

    .line 2222
    invoke-virtual {p0, v2}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    goto/16 :goto_1

    .line 2217
    .end local v2           #desiredTab:Lcom/android/browser/Tab;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2075
    nop

    :pswitch_data_0
    .packed-switch 0x7f0d00a1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_c
        :pswitch_a
        :pswitch_e
        :pswitch_12
        :pswitch_3
        :pswitch_0
        :pswitch_11
        :pswitch_15
        :pswitch_10
        :pswitch_1a
        :pswitch_6
        :pswitch_2
        :pswitch_13
        :pswitch_f
        :pswitch_0
        :pswitch_14
        :pswitch_0
        :pswitch_4
        :pswitch_7
        :pswitch_8
        :pswitch_16
        :pswitch_0
        :pswitch_0
        :pswitch_19
        :pswitch_e
        :pswitch_17
        :pswitch_18
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_b
        :pswitch_5
        :pswitch_d
    .end packed-switch
.end method

.method public onOptionsMenuClosed(Landroid/view/Menu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 2449
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/Controller;->mOptionsMenuOpen:Z

    .line 2450
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p0}, Lcom/android/browser/Controller;->isInLoad()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->onOptionsMenuClosed(Z)V

    .line 2451
    return-void
.end method

.method public onPageFinished(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 935
    iget-object v3, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v3}, Lcom/android/browser/CrashRecoveryHandler;->backupState()V

    .line 936
    iget-object v3, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v3, p1}, Lcom/android/browser/UI;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 940
    iget-boolean v3, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-eqz v3, :cond_0

    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->pauseWebViewTimers(Lcom/android/browser/Tab;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 941
    invoke-direct {p0}, Lcom/android/browser/Controller;->releaseWakeLock()V

    .line 944
    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 945
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->canScrollVertically(I)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/webkit/WebView;->canScrollVertically(I)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_1
    move v0, v2

    .line 947
    .local v0, pageCanScroll:Z
    :goto_0
    iget-object v3, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v4

    if-eqz v4, :cond_3

    :cond_2
    move v1, v2

    :cond_3
    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v2

    invoke-interface {v3, v0, v1, v2}, Lcom/android/browser/UI;->updateBottomBarState(ZZZ)V

    .line 954
    .end local v0           #pageCanScroll:Z
    :cond_4
    invoke-static {}, Lcom/android/browser/Performance;->tracePageFinished()V

    .line 955
    return-void

    :cond_5
    move v0, v1

    .line 945
    goto :goto_0
.end method

.method public onPageStarted(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 6
    .parameter "tab"
    .parameter "view"
    .parameter "favicon"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 892
    iget-object v3, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x6c

    invoke-virtual {v3, v4, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 896
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/CookieSyncManager;->resetSync()V

    .line 899
    iget-object v3, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/mediatek/browser/ext/Extensions;->getProcessNetworkPlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    move-result-object v3

    sput-object v3, Lcom/android/browser/Controller;->sBrowserProcessNetworkEx:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    .line 900
    sget-object v3, Lcom/android/browser/Controller;->sBrowserProcessNetworkEx:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    iget-object v4, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    invoke-virtual {v4}, Lcom/android/browser/NetworkStateHandler;->isNetworkUp()Z

    move-result v4

    invoke-interface {v3, v4}, Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;->shouldProcessNetworkNotify(Z)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 901
    sget-object v3, Lcom/android/browser/Controller;->sBrowserProcessNetworkEx:Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;

    iget-object v4, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    iget-object v5, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    invoke-virtual {v5}, Lcom/android/browser/NetworkStateHandler;->isNetworkUp()Z

    move-result v5

    invoke-interface {v3, p2, v4, v5, p0}, Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;->processNetworkNotify(Landroid/webkit/WebView;Landroid/content/Context;ZLcom/mediatek/browser/ext/IBrowserControllerEx;)V

    .line 911
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-eqz v3, :cond_1

    .line 912
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->resumeWebViewTimers(Lcom/android/browser/Tab;)V

    .line 914
    :cond_1
    iput-boolean v1, p0, Lcom/android/browser/Controller;->mLoadStopped:Z

    .line 915
    invoke-virtual {p0}, Lcom/android/browser/Controller;->endActionMode()V

    .line 917
    iget-object v3, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v3, p1}, Lcom/android/browser/UI;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 919
    iget-object v3, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v4

    if-eqz v4, :cond_3

    :cond_2
    move v1, v2

    :cond_3
    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v4

    invoke-interface {v3, v2, v1, v4}, Lcom/android/browser/UI;->updateBottomBarState(ZZZ)V

    .line 920
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 922
    .local v0, url:Ljava/lang/String;
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0, p3}, Lcom/android/browser/Controller;->maybeUpdateFavicon(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 924
    invoke-static {v0}, Lcom/android/browser/Performance;->tracePageStart(Ljava/lang/String;)V

    .line 931
    return-void

    .line 902
    .end local v0           #url:Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    invoke-virtual {v3}, Lcom/android/browser/NetworkStateHandler;->isNetworkUp()Z

    move-result v3

    if-nez v3, :cond_0

    .line 903
    invoke-virtual {p2, v1}, Landroid/webkit/WebView;->setNetworkAvailable(Z)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 6

    .prologue
    const/4 v4, 0x1

    .line 685
    iget-object v2, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v2}, Lcom/android/browser/UI;->isCustomViewShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 686
    invoke-virtual {p0}, Lcom/android/browser/Controller;->hideCustomView()V

    .line 688
    :cond_0
    iget-boolean v2, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-eqz v2, :cond_1

    .line 689
    const-string v2, "Controller"

    const-string v3, "BrowserActivity is already paused."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    :goto_0
    return-void

    .line 692
    :cond_1
    iput-boolean v4, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    .line 693
    iget-object v2, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    .line 694
    .local v1, tab:Lcom/android/browser/Tab;
    if-eqz v1, :cond_3

    .line 695
    invoke-virtual {v1}, Lcom/android/browser/Tab;->pause()V

    .line 696
    invoke-direct {p0, v1}, Lcom/android/browser/Controller;->pauseWebViewTimers(Lcom/android/browser/Tab;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 697
    iget-object v2, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v2, :cond_2

    .line 698
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 700
    .local v0, pm:Landroid/os/PowerManager;
    const-string v2, "Browser"

    invoke-virtual {v0, v4, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 702
    .end local v0           #pm:Landroid/os/PowerManager;
    :cond_2
    iget-object v2, p0, Lcom/android/browser/Controller;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 703
    iget-object v2, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x6b

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    const-wide/32 v4, 0x493e0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 707
    :cond_3
    iget-object v2, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v2}, Lcom/android/browser/UI;->onPause()V

    .line 708
    iget-object v2, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    invoke-virtual {v2}, Lcom/android/browser/NetworkStateHandler;->onPause()V

    .line 710
    invoke-static {}, Landroid/webkit/WebView;->disablePlatformNotifications()V

    .line 711
    iget-object v2, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/android/browser/NfcHandler;->unregister(Landroid/app/Activity;)V

    .line 712
    sget-object v2, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_4

    .line 713
    sget-object v2, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 714
    const/4 v2, 0x0

    sput-object v2, Lcom/android/browser/Controller;->sThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 716
    :cond_4
    iget-object v2, p0, Lcom/android/browser/Controller;->mNm:Lcom/mediatek/notification/NotificationManagerPlus;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v2}, Lcom/android/browser/BrowserSettings;->useFullscreen()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 717
    iget-object v2, p0, Lcom/android/browser/Controller;->mNm:Lcom/mediatek/notification/NotificationManagerPlus;

    invoke-virtual {v2}, Lcom/mediatek/notification/NotificationManagerPlus;->stopListening()V

    .line 719
    :cond_5
    iget-object v2, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x12d

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 6
    .parameter "menu"

    .prologue
    const v5, 0x7f0d00c4

    const/4 v4, 0x1

    const/4 v3, 0x0

    const v2, 0x7f0d00ab

    .line 1967
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1968
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/Controller;->updateShareMenuItems(Landroid/view/Menu;Lcom/android/browser/Tab;)V

    .line 1970
    :cond_0
    iput-object p1, p0, Lcom/android/browser/Controller;->mCachedMenu:Landroid/view/Menu;

    .line 1974
    iget v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    packed-switch v0, :pswitch_data_0

    .line 1983
    iget v0, p0, Lcom/android/browser/Controller;->mCurrentMenuState:I

    iget v1, p0, Lcom/android/browser/Controller;->mMenuState:I

    if-eq v0, v1, :cond_1

    .line 1984
    invoke-interface {p1, v2, v4}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 1985
    invoke-interface {p1, v2, v4}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 1986
    invoke-interface {p1, v5, v4}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 1988
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/android/browser/Controller;->updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V

    .line 1991
    :cond_2
    :goto_0
    iget v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    iput v0, p0, Lcom/android/browser/Controller;->mCurrentMenuState:I

    .line 1992
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    .line 1976
    :pswitch_0
    iget v0, p0, Lcom/android/browser/Controller;->mCurrentMenuState:I

    iget v1, p0, Lcom/android/browser/Controller;->mMenuState:I

    if-eq v0, v1, :cond_2

    .line 1977
    invoke-interface {p1, v2, v3}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 1978
    invoke-interface {p1, v2, v3}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 1979
    invoke-interface {p1, v5, v3}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    goto :goto_0

    .line 1974
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onProgressChanged(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    const/16 v4, 0x6c

    const/4 v3, 0x0

    .line 959
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getLoadProgress()I

    move-result v0

    .line 961
    .local v0, newProgress:I
    const/16 v1, 0x64

    if-ne v0, v1, :cond_2

    .line 962
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 975
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v1

    if-nez v1, :cond_2

    .line 981
    invoke-virtual {p1}, Lcom/android/browser/Tab;->shouldUpdateThumbnail()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/Controller;->didUserStopLoading()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v1

    if-nez v1, :cond_2

    .line 984
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4, p1}, Landroid/os/Handler;->hasMessages(ILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 985
    iget-object v1, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/browser/Controller;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v4, v3, v3, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1002
    :cond_2
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1, p1}, Lcom/android/browser/UI;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 1003
    return-void
.end method

.method public onReceivedHttpAuthRequest(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "tab"
    .parameter "view"
    .parameter "handler"
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 1095
    const/4 v3, 0x0

    .line 1096
    .local v3, username:Ljava/lang/String;
    const/4 v1, 0x0

    .line 1098
    .local v1, password:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/webkit/HttpAuthHandler;->useHttpAuthUsernamePassword()Z

    move-result v2

    .line 1101
    .local v2, reuseHttpAuthUsernamePassword:Z
    if-eqz v2, :cond_0

    if-eqz p2, :cond_0

    .line 1102
    invoke-virtual {p2, p4, p5}, Landroid/webkit/WebView;->getHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1103
    .local v0, credentials:[Ljava/lang/String;
    if-eqz v0, :cond_0

    array-length v4, v0

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 1104
    const/4 v4, 0x0

    aget-object v3, v0, v4

    .line 1105
    const/4 v4, 0x1

    aget-object v1, v0, v4

    .line 1109
    .end local v0           #credentials:[Ljava/lang/String;
    :cond_0
    if-eqz v3, :cond_1

    if-eqz v1, :cond_1

    .line 1110
    invoke-virtual {p3, v3, v1}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 1118
    :goto_0
    return-void

    .line 1112
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p3}, Landroid/webkit/HttpAuthHandler;->suppressDialog()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1113
    iget-object v4, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    invoke-virtual {v4, p1, p3, p4, p5}, Lcom/android/browser/PageDialogsHandler;->showHttpAuthentication(Lcom/android/browser/Tab;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1115
    :cond_2
    invoke-virtual {p3}, Landroid/webkit/HttpAuthHandler;->cancel()V

    goto :goto_0
.end method

.method public onReceivedTitle(Lcom/android/browser/Tab;Ljava/lang/String;)V
    .locals 3
    .parameter "tab"
    .parameter "title"

    .prologue
    .line 1012
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1, p1}, Lcom/android/browser/UI;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 1013
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getOriginalUrl()Ljava/lang/String;

    move-result-object v0

    .line 1014
    .local v0, pageUrl:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0xc350

    if-lt v1, v2, :cond_1

    .line 1022
    :cond_0
    :goto_0
    return-void

    .line 1019
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1020
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/android/browser/DataController;->updateHistoryTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 749
    iget-boolean v1, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    if-nez v1, :cond_1

    .line 750
    const-string v1, "Controller"

    const-string v2, "BrowserActivity is already resumed."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    :cond_0
    :goto_0
    return-void

    .line 753
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setLastRunPaused(Z)V

    .line 754
    iput-boolean v2, p0, Lcom/android/browser/Controller;->mActivityPaused:Z

    .line 755
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 756
    .local v0, current:Lcom/android/browser/Tab;
    if-eqz v0, :cond_2

    .line 757
    invoke-virtual {v0}, Lcom/android/browser/Tab;->resume()V

    .line 758
    invoke-direct {p0, v0}, Lcom/android/browser/Controller;->resumeWebViewTimers(Lcom/android/browser/Tab;)V

    .line 760
    :cond_2
    invoke-direct {p0}, Lcom/android/browser/Controller;->releaseWakeLock()V

    .line 762
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1}, Lcom/android/browser/UI;->onResume()V

    .line 763
    iget-object v1, p0, Lcom/android/browser/Controller;->mNetworkHandler:Lcom/android/browser/NetworkStateHandler;

    invoke-virtual {v1}, Lcom/android/browser/NetworkStateHandler;->onResume()V

    .line 764
    invoke-static {}, Landroid/webkit/WebView;->enablePlatformNotifications()V

    .line 765
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-static {v1, p0}, Lcom/android/browser/NfcHandler;->register(Landroid/app/Activity;Lcom/android/browser/Controller;)V

    .line 766
    iget-object v1, p0, Lcom/android/browser/Controller;->mVoiceResult:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 767
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    iget-object v2, p0, Lcom/android/browser/Controller;->mVoiceResult:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/android/browser/UI;->onVoiceResult(Ljava/lang/String;)V

    .line 768
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/browser/Controller;->mVoiceResult:Ljava/lang/String;

    .line 770
    :cond_3
    iget-object v1, p0, Lcom/android/browser/Controller;->mNm:Lcom/mediatek/notification/NotificationManagerPlus;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->useFullscreen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 771
    iget-object v1, p0, Lcom/android/browser/Controller;->mNm:Lcom/mediatek/notification/NotificationManagerPlus;

    invoke-virtual {v1}, Lcom/mediatek/notification/NotificationManagerPlus;->startListening()V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "outState"

    .prologue
    .line 725
    invoke-virtual {p0}, Lcom/android/browser/Controller;->createSaveState()Landroid/os/Bundle;

    move-result-object v0

    .line 728
    .local v0, saveState:Landroid/os/Bundle;
    iget-object v1, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v1, v0}, Lcom/android/browser/CrashRecoveryHandler;->writeState(Landroid/os/Bundle;)V

    .line 729
    iget-object v1, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setLastRunPaused(Z)V

    .line 730
    return-void
.end method

.method public onSearchRequested()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3499
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    const/4 v1, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/browser/UI;->editUrl(ZZ)V

    .line 3500
    return v2
.end method

.method public onSetWebView(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V
    .locals 1
    .parameter "tab"
    .parameter "view"

    .prologue
    .line 448
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1, p2}, Lcom/android/browser/UI;->onSetWebView(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V

    .line 449
    return-void
.end method

.method public onShowPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V
    .locals 1
    .parameter "tab"
    .parameter "dialog"
    .parameter "resultMsg"

    .prologue
    .line 3563
    iget-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/browser/PageDialogsHandler;->showPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V

    .line 3564
    return-void
.end method

.method public onUnhandledKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    .line 1051
    invoke-virtual {p0}, Lcom/android/browser/Controller;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1052
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 1053
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 1058
    :goto_0
    return v0

    .line 1055
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 1058
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onUpdatedSecurityState(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 1007
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 1008
    return-void
.end method

.method public onUserCanceledSsl(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 3234
    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3235
    invoke-virtual {p1}, Lcom/android/browser/Tab;->goBack()V

    .line 3239
    :goto_0
    return-void

    .line 3237
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/android/browser/Tab;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public openContextMenu(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 2408
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->openContextMenu(Landroid/view/View;)V

    .line 2409
    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "acceptType"
    .parameter "capture"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2614
    .local p1, uploadMsg:Landroid/webkit/ValueCallback;,"Landroid/webkit/ValueCallback<Landroid/net/Uri;>;"
    new-instance v0, Lcom/android/browser/UploadHandler;

    invoke-direct {v0, p0}, Lcom/android/browser/UploadHandler;-><init>(Lcom/android/browser/Controller;)V

    iput-object v0, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    .line 2615
    iget-object v0, p0, Lcom/android/browser/Controller;->mUploadHandler:Lcom/android/browser/UploadHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/browser/UploadHandler;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V

    .line 2616
    return-void
.end method

.method public openIncognitoTab()Lcom/android/browser/Tab;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3031
    const-string v0, "browser:incognito"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v2, v2, v1}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;ZZZ)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public openOptionsMenu()V
    .locals 1

    .prologue
    .line 2415
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->openOptionsMenu()V

    .line 2416
    return-void
.end method

.method public openPreferences()V
    .locals 3

    .prologue
    .line 2313
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-class v2, Lcom/android/browser/BrowserPreferencesPage;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2314
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "currentPage"

    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2316
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2317
    return-void
.end method

.method public openTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;
    .locals 3
    .parameter "urlData"

    .prologue
    const/4 v2, 0x1

    .line 3014
    invoke-direct {p0, p1}, Lcom/android/browser/Controller;->showPreloadedTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;

    move-result-object v0

    .line 3015
    .local v0, tab:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 3016
    const/4 v1, 0x0

    invoke-direct {p0, v1, v2, v2}, Lcom/android/browser/Controller;->createNewTab(ZZZ)Lcom/android/browser/Tab;

    move-result-object v0

    .line 3017
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/IntentHandler$UrlData;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3018
    invoke-virtual {p0, v0, p1}, Lcom/android/browser/Controller;->loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    .line 3021
    :cond_0
    return-object v0
.end method

.method public openTab(Ljava/lang/String;Lcom/android/browser/Tab;ZZ)Lcom/android/browser/Tab;
    .locals 6
    .parameter "url"
    .parameter "parent"
    .parameter "setActive"
    .parameter "useCurrent"

    .prologue
    .line 3043
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move v4, p4

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;ZZZLcom/android/browser/Tab;)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public openTab(Ljava/lang/String;ZZZ)Lcom/android/browser/Tab;
    .locals 6
    .parameter "url"
    .parameter "incognito"
    .parameter "setActive"
    .parameter "useCurrent"

    .prologue
    .line 3037
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;ZZZLcom/android/browser/Tab;)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public openTab(Ljava/lang/String;ZZZLcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 1
    .parameter "url"
    .parameter "incognito"
    .parameter "setActive"
    .parameter "useCurrent"
    .parameter "parent"

    .prologue
    .line 3049
    invoke-direct {p0, p2, p3, p4}, Lcom/android/browser/Controller;->createNewTab(ZZZ)Lcom/android/browser/Tab;

    move-result-object v0

    .line 3050
    .local v0, tab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_1

    .line 3051
    if-eqz p5, :cond_0

    if-eq p5, v0, :cond_0

    .line 3052
    invoke-virtual {p5, v0}, Lcom/android/browser/Tab;->addChildTab(Lcom/android/browser/Tab;)V

    .line 3054
    :cond_0
    if-eqz p1, :cond_1

    .line 3055
    invoke-virtual {p0, v0, p1}, Lcom/android/browser/Controller;->loadUrl(Lcom/android/browser/Tab;Ljava/lang/String;)V

    .line 3058
    :cond_1
    return-object v0
.end method

.method public openTabToHomePage()Lcom/android/browser/Tab;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 3026
    iget-object v0, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1, v2}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;ZZZ)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method protected pageDown()V
    .locals 2

    .prologue
    .line 1199
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->pageDown(Z)Z

    .line 1200
    return-void
.end method

.method protected pageUp()V
    .locals 2

    .prologue
    .line 1195
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->pageUp(Z)Z

    .line 1196
    return-void
.end method

.method public removeSubWindow(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "t"

    .prologue
    .line 2970
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2971
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSubViewContainer()Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/browser/UI;->removeSubWindow(Landroid/view/View;)V

    .line 2973
    :cond_0
    return-void
.end method

.method protected removeTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 2911
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->removeTab(Lcom/android/browser/Tab;)V

    .line 2912
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabControl;->removeTab(Lcom/android/browser/Tab;)Z

    .line 2913
    iget-object v0, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v0}, Lcom/android/browser/CrashRecoveryHandler;->backupState()V

    .line 2914
    return-void
.end method

.method protected reuseTab(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V
    .locals 1
    .parameter "appTab"
    .parameter "urlData"

    .prologue
    .line 2936
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    .line 2939
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->detachTab(Lcom/android/browser/Tab;)V

    .line 2941
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabControl;->recreateWebView(Lcom/android/browser/Tab;)V

    .line 2943
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->attachTab(Lcom/android/browser/Tab;)V

    .line 2944
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 2945
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 2946
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/Controller;->loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    .line 2953
    :goto_0
    return-void

    .line 2950
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 2951
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/Controller;->loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    goto :goto_0
.end method

.method public setActiveTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 2919
    if-eqz p1, :cond_0

    .line 2920
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabControl;->setCurrentTab(Lcom/android/browser/Tab;)Z

    .line 2922
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 2924
    :cond_0
    return-void
.end method

.method public setBlockEvents(Z)V
    .locals 0
    .parameter "block"

    .prologue
    .line 3527
    iput-boolean p1, p0, Lcom/android/browser/Controller;->mBlockEvents:Z

    .line 3528
    return-void
.end method

.method protected setShouldShowErrorConsole(Z)V
    .locals 2
    .parameter "show"

    .prologue
    .line 855
    iget-boolean v1, p0, Lcom/android/browser/Controller;->mShouldShowErrorConsole:Z

    if-ne p1, v1, :cond_1

    .line 866
    :cond_0
    :goto_0
    return-void

    .line 859
    :cond_1
    iput-boolean p1, p0, Lcom/android/browser/Controller;->mShouldShowErrorConsole:Z

    .line 860
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 861
    .local v0, t:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    .line 865
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v1, v0, p1}, Lcom/android/browser/UI;->setShouldShowErrorConsole(Lcom/android/browser/Tab;Z)V

    goto :goto_0
.end method

.method setUi(Lcom/android/browser/UI;)V
    .locals 0
    .parameter "ui"

    .prologue
    .line 472
    iput-object p1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    .line 473
    return-void
.end method

.method public setupAutoFill(Landroid/os/Message;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 3490
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-class v2, Lcom/android/browser/BrowserPreferencesPage;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 3491
    .local v0, intent:Landroid/content/Intent;
    const-string v1, ":android:show_fragment"

    const-class v2, Lcom/android/browser/AutoFillSettingsFragment;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3493
    iput-object p1, p0, Lcom/android/browser/Controller;->mAutoFillSetupMessage:Landroid/os/Message;

    .line 3494
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x5

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 3495
    return-void
.end method

.method public shareCurrentPage()V
    .locals 1

    .prologue
    .line 612
    iget-object v0, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/browser/Controller;->shareCurrentPage(Lcom/android/browser/Tab;)V

    .line 613
    return-void
.end method

.method public shouldCaptureThumbnails()Z
    .locals 1

    .prologue
    .line 3505
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->shouldCaptureThumbnails()Z

    move-result v0

    return v0
.end method

.method public shouldOverrideKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    .line 1040
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mMenuIsDown:Z

    if-eqz v0, :cond_0

    .line 1042
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/view/Window;->isShortcutKey(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 1045
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Lcom/android/browser/Tab;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5
    .parameter "tab"
    .parameter "view"
    .parameter "url"

    .prologue
    .line 1032
    iget-object v1, p0, Lcom/android/browser/Controller;->mUrlHandler:Lcom/android/browser/UrlHandler;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/browser/UrlHandler;->shouldOverrideUrlLoading(Lcom/android/browser/Tab;Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    .line 1034
    .local v0, ret:Z
    iget-object v1, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    const/4 v2, 0x1

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v4

    invoke-interface {v1, v2, v3, v4}, Lcom/android/browser/UI;->updateBottomBarState(ZZZ)V

    .line 1035
    return v0
.end method

.method public shouldShowErrorConsole()Z
    .locals 1

    .prologue
    .line 851
    iget-boolean v0, p0, Lcom/android/browser/Controller;->mShouldShowErrorConsole:Z

    return v0
.end method

.method public showAutoLogin(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 1158
    sget-boolean v0, Lcom/android/browser/Controller;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1160
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p1}, Lcom/android/browser/UI;->showAutoLogin(Lcom/android/browser/Tab;)V

    .line 1161
    return-void
.end method

.method public showCustomView(Lcom/android/browser/Tab;Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 1
    .parameter "tab"
    .parameter "view"
    .parameter "requestedOrientation"
    .parameter "callback"

    .prologue
    .line 1212
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1213
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0}, Lcom/android/browser/UI;->isCustomViewShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1214
    invoke-interface {p4}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 1224
    :cond_0
    :goto_0
    return-void

    .line 1217
    :cond_1
    iget-object v0, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v0, p2, p3, p4}, Lcom/android/browser/UI;->showCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    .line 1220
    iget v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    iput v0, p0, Lcom/android/browser/Controller;->mOldMenuState:I

    .line 1221
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/browser/Controller;->mMenuState:I

    .line 1222
    iget-object v0, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_0
.end method

.method public showNetworkUnavilableDialog()V
    .locals 3

    .prologue
    .line 3556
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const-class v2, Lcom/android/browser/DataConnectionDialog;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 3557
    .local v0, dlg:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 3558
    return-void
.end method

.method public showPageInfo()V
    .locals 4

    .prologue
    .line 2366
    iget-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/PageDialogsHandler;->showPageInfo(Lcom/android/browser/Tab;ZLjava/lang/String;)V

    .line 2367
    return-void
.end method

.method public showSslCertificateOnError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1
    .parameter "view"
    .parameter "handler"
    .parameter "error"

    .prologue
    .line 1153
    iget-object v0, p0, Lcom/android/browser/Controller;->mPageDialogsHandler:Lcom/android/browser/PageDialogsHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/browser/PageDialogsHandler;->showSSLCertificateOnError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 1154
    return-void
.end method

.method public start(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 297
    invoke-static {}, Landroid/webkit/WebViewClassic;->setShouldMonitorWebCoreThread()V

    .line 299
    iget-object v0, p0, Lcom/android/browser/Controller;->mCrashRecoveryHandler:Lcom/android/browser/CrashRecoveryHandler;

    invoke-virtual {v0, p1}, Lcom/android/browser/CrashRecoveryHandler;->startRecovery(Landroid/content/Intent;)V

    .line 300
    return-void
.end method

.method public startVoiceRecognizer()V
    .locals 3

    .prologue
    .line 3518
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3519
    .local v0, voice:Landroid/content/Intent;
    const-string v1, "android.speech.extra.LANGUAGE_MODEL"

    const-string v2, "free_form"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3521
    const-string v1, "android.speech.extra.MAX_RESULTS"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3522
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x6

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 3523
    return-void
.end method

.method public stopLoading()V
    .locals 3

    .prologue
    .line 870
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/browser/Controller;->mLoadStopped:Z

    .line 871
    iget-object v2, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 872
    .local v0, tab:Lcom/android/browser/Tab;
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 873
    .local v1, w:Landroid/webkit/WebView;
    if-eqz v1, :cond_0

    .line 874
    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V

    .line 875
    iget-object v2, p0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    invoke-interface {v2, v0}, Lcom/android/browser/UI;->onPageStopped(Lcom/android/browser/Tab;)V

    .line 877
    :cond_0
    return-void
.end method

.method public supportsVoice()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 3510
    iget-object v3, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 3511
    .local v1, pm:Landroid/content/pm/PackageManager;
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 3513
    .local v0, activities:Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public switchToTab(Lcom/android/browser/Tab;)Z
    .locals 2
    .parameter "tab"

    .prologue
    .line 3113
    iget-object v1, p0, Lcom/android/browser/Controller;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 3114
    .local v0, currentTab:Lcom/android/browser/Tab;
    if-eqz p1, :cond_0

    if-ne p1, v0, :cond_1

    .line 3115
    :cond_0
    const/4 v1, 0x0

    .line 3118
    :goto_0
    return v1

    .line 3117
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 3118
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public toggleUserAgent()V
    .locals 2

    .prologue
    .line 2301
    invoke-virtual {p0}, Lcom/android/browser/Controller;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 2302
    .local v0, web:Landroid/webkit/WebView;
    iget-object v1, p0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1, v0}, Lcom/android/browser/BrowserSettings;->toggleDesktopUseragent(Landroid/webkit/WebView;)V

    .line 2303
    invoke-virtual {v0}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 2304
    return-void
.end method

.method public updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V
    .locals 21
    .parameter "tab"
    .parameter "menu"

    .prologue
    .line 1997
    const/4 v4, 0x0

    .line 1998
    .local v4, canGoBack:Z
    const/4 v5, 0x0

    .line 1999
    .local v5, canGoForward:Z
    const/4 v9, 0x0

    .line 2000
    .local v9, isHome:Z
    const/4 v8, 0x0

    .line 2001
    .local v8, isDesktopUa:Z
    const/4 v10, 0x0

    .line 2002
    .local v10, isLive:Z
    if-eqz p1, :cond_0

    .line 2003
    invoke-virtual/range {p1 .. p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v4

    .line 2004
    invoke-virtual/range {p1 .. p1}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v5

    .line 2005
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 2006
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/android/browser/BrowserSettings;->hasDesktopUseragent(Landroid/webkit/WebView;)Z

    move-result v8

    .line 2007
    invoke-virtual/range {p1 .. p1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v19

    if-nez v19, :cond_2

    const/4 v10, 0x1

    .line 2009
    :cond_0
    :goto_0
    const v19, 0x7f0d00d1

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 2010
    .local v3, back:Landroid/view/MenuItem;
    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2012
    const v19, 0x7f0d00c6

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 2013
    .local v7, home:Landroid/view/MenuItem;
    if-nez v9, :cond_3

    const/16 v19, 0x1

    :goto_1
    move/from16 v0, v19

    invoke-interface {v7, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2015
    const v19, 0x7f0d00ae

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 2025
    .local v6, forward:Landroid/view/MenuItem;
    const v19, 0x7f0d00af

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v17

    .line 2026
    .local v17, stop:Landroid/view/MenuItem;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/Controller;->isInLoad()Z

    move-result v19

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2028
    const v19, 0x7f0d00ac

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1, v10}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 2030
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->useFullscreen()Z

    move-result v19

    if-nez v19, :cond_1

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->useQuickControls()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 2031
    :cond_1
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-interface {v6, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2032
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2037
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 2038
    .local v13, pm:Landroid/content/pm/PackageManager;
    new-instance v15, Landroid/content/Intent;

    const-string v19, "android.intent.action.SEND"

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2039
    .local v15, send:Landroid/content/Intent;
    const-string v19, "text/plain"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2040
    const/high16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v13, v15, v0}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v14

    .line 2042
    .local v14, ri:Landroid/content/pm/ResolveInfo;
    const v19, 0x7f0d00b5

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v20

    if-eqz v14, :cond_5

    const/16 v19, 0x1

    :goto_3
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2044
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->enableNavDump()Z

    move-result v11

    .line 2045
    .local v11, isNavDump:Z
    const v19, 0x7f0d00c2

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v12

    .line 2046
    .local v12, nav:Landroid/view/MenuItem;
    invoke-interface {v12, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2047
    invoke-interface {v12, v11}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2049
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mSettings:Lcom/android/browser/BrowserSettings;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/browser/BrowserSettings;->isDebugEnabled()Z

    move-result v16

    .line 2050
    .local v16, showDebugSettings:Z
    const v19, 0x7f0d00b7

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v18

    .line 2051
    .local v18, uaSwitcher:Landroid/view/MenuItem;
    move-object/from16 v0, v18

    invoke-interface {v0, v8}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 2052
    const v19, 0x7f0d00b3

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-interface {v0, v1, v10}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 2053
    const v20, 0x7f0d00bc

    if-nez v10, :cond_6

    const/16 v19, 0x1

    :goto_4
    move-object/from16 v0, p2

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 2054
    const v19, 0x7f0d00be

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 2056
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-interface {v0, v1, v2}, Lcom/android/browser/UI;->updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V

    .line 2057
    return-void

    .line 2007
    .end local v3           #back:Landroid/view/MenuItem;
    .end local v6           #forward:Landroid/view/MenuItem;
    .end local v7           #home:Landroid/view/MenuItem;
    .end local v11           #isNavDump:Z
    .end local v12           #nav:Landroid/view/MenuItem;
    .end local v13           #pm:Landroid/content/pm/PackageManager;
    .end local v14           #ri:Landroid/content/pm/ResolveInfo;
    .end local v15           #send:Landroid/content/Intent;
    .end local v16           #showDebugSettings:Z
    .end local v17           #stop:Landroid/view/MenuItem;
    .end local v18           #uaSwitcher:Landroid/view/MenuItem;
    :cond_2
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 2013
    .restart local v3       #back:Landroid/view/MenuItem;
    .restart local v7       #home:Landroid/view/MenuItem;
    :cond_3
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 2034
    .restart local v6       #forward:Landroid/view/MenuItem;
    .restart local v17       #stop:Landroid/view/MenuItem;
    :cond_4
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-interface {v6, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 2042
    .restart local v13       #pm:Landroid/content/pm/PackageManager;
    .restart local v14       #ri:Landroid/content/pm/ResolveInfo;
    .restart local v15       #send:Landroid/content/Intent;
    :cond_5
    const/16 v19, 0x0

    goto/16 :goto_3

    .line 2053
    .restart local v11       #isNavDump:Z
    .restart local v12       #nav:Landroid/view/MenuItem;
    .restart local v16       #showDebugSettings:Z
    .restart local v18       #uaSwitcher:Landroid/view/MenuItem;
    :cond_6
    const/16 v19, 0x0

    goto :goto_4
.end method

.method viewDownloads()V
    .locals 2

    .prologue
    .line 2475
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW_DOWNLOADS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2476
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 2477
    return-void
.end method
