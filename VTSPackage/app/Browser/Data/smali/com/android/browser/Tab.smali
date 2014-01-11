.class Lcom/android/browser/Tab;
.super Ljava/lang/Object;
.source "Tab.java"

# interfaces
.implements Landroid/webkit/WebView$PictureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/Tab$10;,
        Lcom/android/browser/Tab$SaveCallback;,
        Lcom/android/browser/Tab$SubWindowChromeClient;,
        Lcom/android/browser/Tab$SubWindowClient;,
        Lcom/android/browser/Tab$ErrorDialog;,
        Lcom/android/browser/Tab$PageState;,
        Lcom/android/browser/Tab$SecurityState;
    }
.end annotation


# static fields
.field static final APPID:Ljava/lang/String; = "appid"

.field private static final CAPTURE_DELAY:I = 0x64

.field static final CLOSEFLAG:Ljava/lang/String; = "closeOnBack"

.field private static final CONSOLE_LOGTAG:Ljava/lang/String; = "browser"

.field static final CURRTITLE:Ljava/lang/String; = "currentTitle"

.field static final CURRURL:Ljava/lang/String; = "currentUrl"

.field static final ID:Ljava/lang/String; = "ID"

.field static final INCOGNITO:Ljava/lang/String; = "privateBrowsingEnabled"

.field private static final INITIAL_PROGRESS:I = 0x5

.field private static final LOGD_ENABLED:Z = true

.field private static final LOGTAG:Ljava/lang/String; = "Tab"

.field private static final MSG_CAPTURE:I = 0x2a

.field static final PARENTTAB:Ljava/lang/String; = "parentTab"

.field static final USERAGENT:Ljava/lang/String; = "useragent"

.field private static mTabPosition:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/browser/Tab;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sAlphaPaint:Landroid/graphics/Paint;

.field private static sDefaultFavicon:Landroid/graphics/Bitmap;


# instance fields
.field private mAppId:Ljava/lang/String;

.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private mCapture:Landroid/graphics/Bitmap;

.field private mCaptureHeight:I

.field private mCaptureWidth:I

.field private mChildren:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation
.end field

.field private mClearHistoryUrlPattern:Ljava/util/regex/Pattern;

.field private mCloseOnBack:Z

.field private mContainer:Landroid/view/View;

.field mContext:Landroid/content/Context;

.field protected mCurrentState:Lcom/android/browser/Tab$PageState;

.field private mDataController:Lcom/android/browser/DataController;

.field private mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;

.field private mDialogListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mDisableOverrideUrlLoading:Z

.field private final mDownloadListener:Landroid/webkit/BrowserDownloadListener;

.field private mErrorConsole:Lcom/android/browser/ErrorConsoleView;

.field private mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

.field private mHandler:Landroid/os/Handler;

.field private mId:J

.field private mInForeground:Z

.field private mInPageLoad:Z

.field private mIsBookmarkCallback:Lcom/android/browser/DataController$OnQueryUrlIsBookmark;

.field private mIsDebuggable:Z

.field private mLoadStartTime:J

.field private mMainView:Landroid/webkit/WebView;

.field private mManager:Landroid/app/NotificationManager;

.field private mNotification:Landroid/app/Notification;

.field private mNotificationID:I

.field private mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;

.field private mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;

.field private mPageLoadProgress:I

.field private mParent:Lcom/android/browser/Tab;

.field private mPointer:I

.field private mQueuedErrors:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/android/browser/Tab$ErrorDialog;",
            ">;"
        }
    .end annotation
.end field

.field private mSavedState:Landroid/os/Bundle;

.field private mSettings:Lcom/android/browser/BrowserSettings;

.field private mSubView:Landroid/webkit/WebView;

.field private mSubViewContainer:Landroid/view/View;

.field mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

.field private mUpdateThumbnail:Z

.field private final mWebBackForwardListClient:Landroid/webkit/WebBackForwardListClient;

.field private final mWebChromeClient:Landroid/webkit/WebChromeClient;

.field private final mWebViewClient:Landroid/webkit/WebViewClientClassicExt;

.field protected mWebViewController:Lcom/android/browser/WebViewController;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 133
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    .line 135
    sget-object v0, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 136
    sget-object v0, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 228
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    return-void
.end method

.method constructor <init>(Lcom/android/browser/WebViewController;Landroid/os/Bundle;)V
    .locals 1
    .parameter "wvcontroller"
    .parameter "state"

    .prologue
    .line 1280
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/android/browser/Tab;-><init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;Landroid/os/Bundle;)V

    .line 1281
    return-void
.end method

.method constructor <init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;)V
    .locals 1
    .parameter "wvcontroller"
    .parameter "w"

    .prologue
    .line 1276
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/browser/Tab;-><init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;Landroid/os/Bundle;)V

    .line 1277
    return-void
.end method

.method constructor <init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;Landroid/os/Bundle;)V
    .locals 6
    .parameter "wvcontroller"
    .parameter "w"
    .parameter "state"

    .prologue
    const-wide/16 v4, -0x1

    const/4 v1, 0x0

    .line 1283
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 131
    const-string v0, "ro.debuggable"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/browser/Tab;->mIsDebuggable:Z

    .line 159
    iput-wide v4, p0, Lcom/android/browser/Tab;->mId:J

    .line 223
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    iput-object v0, p0, Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;

    .line 319
    new-instance v0, Lcom/android/browser/Tab$1;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$1;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mDialogListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 366
    new-instance v0, Lcom/android/browser/Tab$2;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$2;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mWebViewClient:Landroid/webkit/WebViewClientClassicExt;

    .line 756
    new-instance v0, Lcom/android/browser/Tab$3;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$3;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mWebChromeClient:Landroid/webkit/WebChromeClient;

    .line 1965
    new-instance v0, Lcom/android/browser/Tab$9;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$9;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mIsBookmarkCallback:Lcom/android/browser/DataController$OnQueryUrlIsBookmark;

    .line 2072
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/Tab;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 1284
    iput-object p1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    .line 1285
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    .line 1286
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    .line 1287
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Tab;->mDataController:Lcom/android/browser/DataController;

    .line 1288
    new-instance v2, Lcom/android/browser/Tab$PageState;

    iget-object v3, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v0

    :goto_0
    invoke-direct {v2, v3, v0}, Lcom/android/browser/Tab$PageState;-><init>(Landroid/content/Context;Z)V

    iput-object v2, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    .line 1290
    iput-boolean v1, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    .line 1291
    iput-boolean v1, p0, Lcom/android/browser/Tab;->mInForeground:Z

    .line 1293
    new-instance v0, Lcom/android/browser/Tab$4;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$4;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mDownloadListener:Landroid/webkit/BrowserDownloadListener;

    .line 1301
    new-instance v0, Lcom/android/browser/Tab$5;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$5;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mWebBackForwardListClient:Landroid/webkit/WebBackForwardListClient;

    .line 1322
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0030

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/browser/Tab;->mCaptureWidth:I

    .line 1324
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0031

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/browser/Tab;->mCaptureHeight:I

    .line 1326
    invoke-virtual {p0}, Lcom/android/browser/Tab;->updateShouldCaptureThumbnails()V

    .line 1327
    invoke-direct {p0, p3}, Lcom/android/browser/Tab;->restoreState(Landroid/os/Bundle;)V

    .line 1328
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-nez v0, :cond_0

    .line 1329
    invoke-static {}, Lcom/android/browser/TabControl;->getNextId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/browser/Tab;->mId:J

    .line 1331
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/browser/Tab;->setWebView(Landroid/webkit/WebView;)V

    .line 1332
    new-instance v0, Lcom/android/browser/Tab$6;

    invoke-direct {v0, p0}, Lcom/android/browser/Tab$6;-><init>(Lcom/android/browser/Tab;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mHandler:Landroid/os/Handler;

    .line 1342
    return-void

    :cond_1
    move v0, v1

    .line 1288
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/android/browser/Tab;->processNextError()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/browser/Tab;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mIsDebuggable:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/android/browser/Tab;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInForeground:Z

    return v0
.end method

.method static synthetic access$1100(Lcom/android/browser/Tab;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 114
    invoke-direct {p0, p1, p2}, Lcom/android/browser/Tab;->queueError(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/browser/Tab;Lcom/android/browser/Tab$SecurityState;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/android/browser/Tab;->setSecurityState(Lcom/android/browser/Tab$SecurityState;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/browser/Tab;)Lcom/android/browser/BrowserSettings;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/browser/Tab;Landroid/net/http/SslError;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/android/browser/Tab;->handleProceededAfterSslError(Landroid/net/http/SslError;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/browser/Tab;)Landroid/webkit/WebView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/browser/Tab;)Lcom/android/browser/GeolocationPermissionsPrompt;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/android/browser/Tab;)Landroid/app/NotificationManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/android/browser/Tab;Landroid/app/NotificationManager;)Landroid/app/NotificationManager;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/browser/Tab;->mManager:Landroid/app/NotificationManager;

    return-object p1
.end method

.method static synthetic access$202(Lcom/android/browser/Tab;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-boolean p1, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/android/browser/Tab;)Landroid/webkit/NotificationPermissions$Callback;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/android/browser/Tab;Landroid/webkit/NotificationPermissions$Callback;)Landroid/webkit/NotificationPermissions$Callback;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/android/browser/Tab;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget v0, p0, Lcom/android/browser/Tab;->mNotificationID:I

    return v0
.end method

.method static synthetic access$2202(Lcom/android/browser/Tab;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput p1, p0, Lcom/android/browser/Tab;->mNotificationID:I

    return p1
.end method

.method static synthetic access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;

    return-object v0
.end method

.method static synthetic access$2400()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/android/browser/Tab;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget v0, p0, Lcom/android/browser/Tab;->mPointer:I

    return v0
.end method

.method static synthetic access$2600(Lcom/android/browser/Tab;)Lcom/android/browser/NotificationPermissionsPrompt;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/android/browser/Tab;)Ljava/util/regex/Pattern;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mClearHistoryUrlPattern:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$2702(Lcom/android/browser/Tab;Ljava/util/regex/Pattern;)Ljava/util/regex/Pattern;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/browser/Tab;->mClearHistoryUrlPattern:Ljava/util/regex/Pattern;

    return-object p1
.end method

.method static synthetic access$2800(Lcom/android/browser/Tab;)Landroid/webkit/WebView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/browser/Tab;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mUpdateThumbnail:Z

    return v0
.end method

.method static synthetic access$302(Lcom/android/browser/Tab;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-boolean p1, p0, Lcom/android/browser/Tab;->mUpdateThumbnail:Z

    return p1
.end method

.method static synthetic access$402(Lcom/android/browser/Tab;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput p1, p0, Lcom/android/browser/Tab;->mPageLoadProgress:I

    return p1
.end method

.method static synthetic access$500(Lcom/android/browser/Tab;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 114
    iget-wide v0, p0, Lcom/android/browser/Tab;->mLoadStartTime:J

    return-wide v0
.end method

.method static synthetic access$502(Lcom/android/browser/Tab;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-wide p1, p0, Lcom/android/browser/Tab;->mLoadStartTime:J

    return-wide p1
.end method

.method static synthetic access$600(Lcom/android/browser/Tab;)Lcom/android/browser/ErrorConsoleView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/browser/Tab;)Lcom/android/browser/DeviceAccountLogin;
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/browser/Tab;Lcom/android/browser/DeviceAccountLogin;)Lcom/android/browser/DeviceAccountLogin;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;

    return-object p1
.end method

.method static synthetic access$800(Lcom/android/browser/Tab;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mDisableOverrideUrlLoading:Z

    return v0
.end method

.method static synthetic access$802(Lcom/android/browser/Tab;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 114
    iput-boolean p1, p0, Lcom/android/browser/Tab;->mDisableOverrideUrlLoading:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/browser/Tab;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 114
    invoke-direct {p0, p1, p2}, Lcom/android/browser/Tab;->syncCurrentState(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method private static declared-synchronized getDefaultFavicon(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "context"

    .prologue
    .line 237
    const-class v1, Lcom/android/browser/Tab;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/android/browser/Tab;->sDefaultFavicon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 238
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f020001

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/android/browser/Tab;->sDefaultFavicon:Landroid/graphics/Bitmap;

    .line 241
    :cond_0
    sget-object v0, Lcom/android/browser/Tab;->sDefaultFavicon:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 237
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private handleProceededAfterSslError(Landroid/net/http/SslError;)V
    .locals 2
    .parameter "error"

    .prologue
    .line 2224
    invoke-virtual {p1}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v1, v1, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2226
    sget-object v0, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_BAD_CERTIFICATE:Lcom/android/browser/Tab$SecurityState;

    invoke-direct {p0, v0}, Lcom/android/browser/Tab;->setSecurityState(Lcom/android/browser/Tab$SecurityState;)V

    .line 2227
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iput-object p1, v0, Lcom/android/browser/Tab$PageState;->mSslCertificateError:Landroid/net/http/SslError;

    .line 2233
    :cond_0
    :goto_0
    return-void

    .line 2228
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getSecurityState()Lcom/android/browser/Tab$SecurityState;

    move-result-object v0

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_SECURE:Lcom/android/browser/Tab$SecurityState;

    if-ne v0, v1, :cond_0

    .line 2231
    sget-object v0, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_MIXED:Lcom/android/browser/Tab$SecurityState;

    invoke-direct {p0, v0}, Lcom/android/browser/Tab;->setSecurityState(Lcom/android/browser/Tab$SecurityState;)V

    goto :goto_0
.end method

.method private postCapture()V
    .locals 4

    .prologue
    const/16 v3, 0x2a

    .line 2139
    iget-object v0, p0, Lcom/android/browser/Tab;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2140
    iget-object v0, p0, Lcom/android/browser/Tab;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 2142
    :cond_0
    return-void
.end method

.method private processNextError()V
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 317
    :goto_0
    return-void

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 312
    iget-object v0, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 313
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    goto :goto_0

    .line 316
    :cond_1
    iget-object v0, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/Tab$ErrorDialog;

    invoke-direct {p0, v0}, Lcom/android/browser/Tab;->showError(Lcom/android/browser/Tab$ErrorDialog;)V

    goto :goto_0
.end method

.method private queueError(ILjava/lang/String;)V
    .locals 5
    .parameter "err"
    .parameter "desc"

    .prologue
    .line 328
    iget-object v3, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    if-nez v3, :cond_0

    .line 329
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    .line 331
    :cond_0
    iget-object v3, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/Tab$ErrorDialog;

    .line 332
    .local v0, d:Lcom/android/browser/Tab$ErrorDialog;
    iget v3, v0, Lcom/android/browser/Tab$ErrorDialog;->mError:I

    if-ne v3, p1, :cond_1

    .line 348
    .end local v0           #d:Lcom/android/browser/Tab$ErrorDialog;
    :cond_2
    :goto_0
    return-void

    .line 337
    :cond_3
    new-instance v1, Lcom/android/browser/Tab$ErrorDialog;

    const/16 v3, -0xe

    if-ne p1, v3, :cond_4

    const v3, 0x7f0c0140

    :goto_1
    invoke-direct {v1, p0, v3, p2, p1}, Lcom/android/browser/Tab$ErrorDialog;-><init>(Lcom/android/browser/Tab;ILjava/lang/String;I)V

    .line 342
    .local v1, errDialog:Lcom/android/browser/Tab$ErrorDialog;
    iget-object v3, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 345
    iget-object v3, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    iget-boolean v3, p0, Lcom/android/browser/Tab;->mInForeground:Z

    if-eqz v3, :cond_2

    .line 346
    invoke-direct {p0, v1}, Lcom/android/browser/Tab;->showError(Lcom/android/browser/Tab$ErrorDialog;)V

    goto :goto_0

    .line 337
    .end local v1           #errDialog:Lcom/android/browser/Tab$ErrorDialog;
    :cond_4
    const v3, 0x7f0c013f

    goto :goto_1
.end method

.method private restoreState(Landroid/os/Bundle;)V
    .locals 6
    .parameter "b"

    .prologue
    .line 1923
    iput-object p1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    .line 1924
    iget-object v3, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    if-nez v3, :cond_0

    .line 1943
    :goto_0
    return-void

    .line 1929
    :cond_0
    const-string v3, "ID"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/browser/Tab;->mId:J

    .line 1930
    const-string v3, "appid"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/Tab;->mAppId:Ljava/lang/String;

    .line 1931
    const-string v3, "closeOnBack"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/browser/Tab;->mCloseOnBack:Z

    .line 1932
    invoke-direct {p0}, Lcom/android/browser/Tab;->restoreUserAgent()V

    .line 1933
    const-string v3, "currentUrl"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1934
    .local v2, url:Ljava/lang/String;
    const-string v3, "currentTitle"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1935
    .local v1, title:Ljava/lang/String;
    const-string v3, "privateBrowsingEnabled"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 1936
    .local v0, incognito:Z
    new-instance v3, Lcom/android/browser/Tab$PageState;

    iget-object v4, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v0, v2, v5}, Lcom/android/browser/Tab$PageState;-><init>(Landroid/content/Context;ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    .line 1937
    iget-object v3, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iput-object v1, v3, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    .line 1938
    monitor-enter p0

    .line 1939
    :try_start_0
    iget-object v3, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_1

    .line 1940
    iget-object v3, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/android/browser/DataController;->loadThumbnail(Lcom/android/browser/Tab;)V

    .line 1942
    :cond_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private restoreUserAgent()V
    .locals 3

    .prologue
    .line 1946
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    if-nez v0, :cond_1

    .line 1953
    :cond_0
    :goto_0
    return-void

    .line 1949
    :cond_1
    iget-object v0, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v1, "useragent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->hasDesktopUseragent(Landroid/webkit/WebView;)Z

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1951
    iget-object v0, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->toggleDesktopUseragent(Landroid/webkit/WebView;)V

    goto :goto_0
.end method

.method private setSecurityState(Lcom/android/browser/Tab$SecurityState;)V
    .locals 2
    .parameter "securityState"

    .prologue
    .line 1845
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iput-object p1, v0, Lcom/android/browser/Tab$PageState;->mSecurityState:Lcom/android/browser/Tab$SecurityState;

    .line 1846
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mSslCertificateError:Landroid/net/http/SslError;

    .line 1847
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p0}, Lcom/android/browser/WebViewController;->onUpdatedSecurityState(Lcom/android/browser/Tab;)V

    .line 1848
    return-void
.end method

.method private setupHwAcceleration(Landroid/view/View;)V
    .locals 3
    .parameter "web"

    .prologue
    const/4 v2, 0x0

    .line 1632
    if-nez p1, :cond_0

    .line 1639
    :goto_0
    return-void

    .line 1633
    :cond_0
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    .line 1634
    .local v0, settings:Lcom/android/browser/BrowserSettings;
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1635
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_0

    .line 1637
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method private showError(Lcom/android/browser/Tab$ErrorDialog;)V
    .locals 4
    .parameter "errDialog"

    .prologue
    .line 351
    iget-boolean v1, p0, Lcom/android/browser/Tab;->mInForeground:Z

    if-eqz v1, :cond_0

    .line 352
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget v2, p1, Lcom/android/browser/Tab$ErrorDialog;->mTitle:I

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p1, Lcom/android/browser/Tab$ErrorDialog;->mDescription:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0058

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 357
    .local v0, d:Landroid/app/AlertDialog;
    iget-object v1, p0, Lcom/android/browser/Tab;->mDialogListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 358
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 360
    .end local v0           #d:Landroid/app/AlertDialog;
    :cond_0
    return-void
.end method

.method private syncCurrentState(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 725
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    .line 726
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 727
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    const-string v1, ""

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    .line 729
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getOriginalUrl()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mOriginalUrl:Ljava/lang/String;

    .line 730
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    .line 731
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mFavicon:Landroid/graphics/Bitmap;

    .line 732
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 735
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_NOT_SECURE:Lcom/android/browser/Tab$SecurityState;

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mSecurityState:Lcom/android/browser/Tab$SecurityState;

    .line 736
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mSslCertificateError:Landroid/net/http/SslError;

    .line 738
    :cond_1
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    invoke-virtual {p1}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v1

    iput-boolean v1, v0, Lcom/android/browser/Tab$PageState;->mIncognito:Z

    .line 739
    return-void
.end method


# virtual methods
.method public OnResponseBack(Ljava/lang/String;I)V
    .locals 3
    .parameter "event"
    .parameter "pointer"

    .prologue
    .line 1346
    const-string v0, "Tab"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inside OnResponseBack for event "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1347
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;

    invoke-interface {v0, p1, p2}, Landroid/webkit/NotificationPermissions$Callback;->invokeEvent(Ljava/lang/String;I)V

    .line 1348
    return-void
.end method

.method addChildTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "child"

    .prologue
    .line 1610
    iget-object v0, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 1611
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    .line 1613
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 1614
    invoke-virtual {p1, p0}, Lcom/android/browser/Tab;->setParent(Lcom/android/browser/Tab;)V

    .line 1615
    return-void
.end method

.method public canGoBack()Z
    .locals 1

    .prologue
    .line 2145
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canGoForward()Z
    .locals 1

    .prologue
    .line 2149
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected capture()V
    .locals 12

    .prologue
    .line 2096
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    if-nez v1, :cond_1

    .line 2131
    :cond_0
    :goto_0
    return-void

    .line 2097
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getContentWidth()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v1

    if-lez v1, :cond_0

    .line 2100
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 2101
    .local v0, c:Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getScrollX()I

    move-result v6

    .line 2102
    .local v6, left:I
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getScrollY()I

    move-result v1

    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getVisibleTitleHeight()I

    move-result v2

    add-int v10, v1, v2

    .line 2103
    .local v10, top:I
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 2104
    .local v8, state:I
    neg-int v1, v6

    int-to-float v1, v1

    neg-int v2, v10

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2105
    iget v1, p0, Lcom/android/browser/Tab;->mCaptureWidth:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v7, v1, v2

    .line 2106
    .local v7, scale:F
    int-to-float v1, v6

    int-to-float v2, v10

    invoke-virtual {v0, v7, v7, v1, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 2107
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    instance-of v1, v1, Lcom/android/browser/BrowserWebView;

    if-eqz v1, :cond_2

    .line 2108
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    check-cast v1, Lcom/android/browser/BrowserWebView;

    invoke-virtual {v1, v0}, Lcom/android/browser/BrowserWebView;->drawContent(Landroid/graphics/Canvas;)V

    .line 2112
    :goto_1
    invoke-virtual {v0, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2114
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    iget-object v4, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sget-object v5, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 2115
    iget-object v1, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sget-object v5, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 2117
    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f80

    sget-object v5, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 2118
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sget-object v5, Lcom/android/browser/Tab;->sAlphaPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 2120
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2121
    iget-object v1, p0, Lcom/android/browser/Tab;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 2122
    invoke-virtual {p0}, Lcom/android/browser/Tab;->persistThumbnail()V

    .line 2123
    iget-object v1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v9

    .line 2124
    .local v9, tc:Lcom/android/browser/TabControl;
    if-eqz v9, :cond_0

    .line 2125
    invoke-virtual {v9}, Lcom/android/browser/TabControl;->getOnThumbnailUpdatedListener()Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;

    move-result-object v11

    .line 2127
    .local v11, updateListener:Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;
    if-eqz v11, :cond_0

    .line 2128
    invoke-interface {v11, p0}, Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;->onThumbnailUpdated(Lcom/android/browser/Tab;)V

    goto/16 :goto_0

    .line 2110
    .end local v9           #tc:Lcom/android/browser/TabControl;
    .end local v11           #updateListener:Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;
    :cond_2
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_1
.end method

.method public clearBackStackWhenItemAdded(Ljava/util/regex/Pattern;)V
    .locals 0
    .parameter "urlPattern"

    .prologue
    .line 2172
    iput-object p1, p0, Lcom/android/browser/Tab;->mClearHistoryUrlPattern:Ljava/util/regex/Pattern;

    .line 2173
    return-void
.end method

.method closeOnBack()Z
    .locals 1

    .prologue
    .line 1782
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mCloseOnBack:Z

    return v0
.end method

.method public compressBitmap(Landroid/graphics/Bitmap;)[B
    .locals 3
    .parameter "bitmap"

    .prologue
    .line 2063
    if-nez p1, :cond_0

    .line 2064
    const/4 v1, 0x0

    .line 2068
    :goto_0
    return-object v1

    .line 2066
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2067
    .local v0, stream:Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2068
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    goto :goto_0
.end method

.method public createSnapshotValues()Landroid/content/ContentValues;
    .locals 6

    .prologue
    .line 2003
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v2

    .line 2004
    .local v2, web:Landroid/webkit/WebViewClassic;
    if-nez v2, :cond_0

    const/4 v1, 0x0

    .line 2015
    :goto_0
    return-object v1

    .line 2005
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 2006
    .local v1, values:Landroid/content/ContentValues;
    const-string v3, "title"

    iget-object v4, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v4, v4, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2007
    const-string v3, "url"

    iget-object v4, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v4, v4, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2008
    const-string v3, "background"

    invoke-virtual {v2}, Landroid/webkit/WebViewClassic;->getPageBackgroundColor()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2009
    const-string v3, "date_created"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2010
    const-string v3, "favicon"

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/browser/Tab;->compressBitmap(Landroid/graphics/Bitmap;)[B

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2011
    iget-object v3, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v4, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/android/browser/Controller;->getDesiredThumbnailWidth(Landroid/content/Context;)I

    move-result v4

    iget-object v5, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/android/browser/Controller;->getDesiredThumbnailHeight(Landroid/content/Context;)I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/android/browser/Controller;->createScreenshot(Landroid/webkit/WebView;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2014
    .local v0, screenshot:Landroid/graphics/Bitmap;
    const-string v3, "thumbnail"

    invoke-virtual {p0, v0}, Lcom/android/browser/Tab;->compressBitmap(Landroid/graphics/Bitmap;)[B

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    goto :goto_0
.end method

.method createSubWindow()Z
    .locals 4

    .prologue
    .line 1524
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    .line 1525
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p0}, Lcom/android/browser/WebViewController;->createSubWindow(Lcom/android/browser/Tab;)V

    .line 1526
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    new-instance v1, Lcom/android/browser/Tab$SubWindowClient;

    iget-object v2, p0, Lcom/android/browser/Tab;->mWebViewClient:Landroid/webkit/WebViewClientClassicExt;

    iget-object v3, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-direct {v1, v2, v3}, Lcom/android/browser/Tab$SubWindowClient;-><init>(Landroid/webkit/WebViewClientClassicExt;Lcom/android/browser/WebViewController;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 1528
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    new-instance v1, Lcom/android/browser/Tab$SubWindowChromeClient;

    iget-object v2, p0, Lcom/android/browser/Tab;->mWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-direct {v1, p0, v2}, Lcom/android/browser/Tab$SubWindowChromeClient;-><init>(Lcom/android/browser/Tab;Landroid/webkit/WebChromeClient;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 1532
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    new-instance v1, Lcom/android/browser/Tab$8;

    invoke-direct {v1, p0}, Lcom/android/browser/Tab$8;-><init>(Lcom/android/browser/Tab;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 1545
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 1546
    const/4 v0, 0x1

    .line 1548
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected deleteThumbnail()V
    .locals 1

    .prologue
    .line 2180
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/browser/DataController;->deleteThumbnail(Lcom/android/browser/Tab;)V

    .line 2181
    return-void
.end method

.method destroy()V
    .locals 7

    .prologue
    .line 1479
    iget-object v4, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v4, :cond_2

    .line 1482
    sget-object v4, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1483
    iget-object v4, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const-string v5, "notification"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 1484
    .local v2, notificationManager:Landroid/app/NotificationManager;
    const-string v4, "Tab"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mTabPosition size is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1485
    sget-object v4, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1486
    .local v1, localList:Ljava/util/List;
    const-string v4, "Tab"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "List size is  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1487
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 1488
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1487
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1490
    :cond_0
    sget-object v4, Lcom/android/browser/Tab;->mTabPosition:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1494
    .end local v0           #i:I
    .end local v1           #localList:Ljava/util/List;
    .end local v2           #notificationManager:Landroid/app/NotificationManager;
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Tab;->dismissSubWindow()V

    .line 1496
    iget-object v3, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    .line 1497
    .local v3, webView:Landroid/webkit/WebView;
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/android/browser/Tab;->setWebView(Landroid/webkit/WebView;)V

    .line 1498
    invoke-virtual {v3}, Landroid/webkit/WebView;->destroy()V

    .line 1500
    .end local v3           #webView:Landroid/webkit/WebView;
    :cond_2
    return-void
.end method

.method public disableUrlOverridingForLoad()V
    .locals 1

    .prologue
    .line 2092
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/Tab;->mDisableOverrideUrlLoading:Z

    .line 2093
    return-void
.end method

.method dismissSubWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1555
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1556
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->endActionMode()V

    .line 1557
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 1558
    iput-object v1, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    .line 1559
    iput-object v1, p0, Lcom/android/browser/Tab;->mSubViewContainer:Landroid/view/View;

    .line 1561
    :cond_0
    return-void
.end method

.method getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1770
    iget-object v0, p0, Lcom/android/browser/Tab;->mAppId:Ljava/lang/String;

    return-object v0
.end method

.method getChildren()Ljava/util/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Lcom/android/browser/Tab;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1618
    iget-object v0, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    return-object v0
.end method

.method getDeviceAccountLogin()Lcom/android/browser/DeviceAccountLogin;
    .locals 1

    .prologue
    .line 749
    iget-object v0, p0, Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;

    return-object v0
.end method

.method getErrorConsole(Z)Lcom/android/browser/ErrorConsoleView;
    .locals 2
    .parameter "createIfNecessary"

    .prologue
    .line 1833
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;

    if-nez v0, :cond_0

    .line 1834
    new-instance v0, Lcom/android/browser/ErrorConsoleView;

    iget-object v1, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/browser/ErrorConsoleView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;

    .line 1835
    iget-object v0, p0, Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;

    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Lcom/android/browser/ErrorConsoleView;->setWebView(Landroid/webkit/WebView;)V

    .line 1837
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;

    return-object v0
.end method

.method getFavicon()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 1814
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mFavicon:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 1815
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mFavicon:Landroid/graphics/Bitmap;

    .line 1817
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/browser/Tab;->getDefaultFavicon(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method getGeolocationPermissionsPrompt()Lcom/android/browser/GeolocationPermissionsPrompt;
    .locals 3

    .prologue
    .line 1757
    iget-object v1, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    if-nez v1, :cond_0

    .line 1758
    iget-object v1, p0, Lcom/android/browser/Tab;->mContainer:Landroid/view/View;

    const v2, 0x7f0d0079

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    .line 1760
    .local v0, stub:Landroid/view/ViewStub;
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/browser/GeolocationPermissionsPrompt;

    iput-object v1, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    .line 1763
    .end local v0           #stub:Landroid/view/ViewStub;
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    return-object v1
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 1414
    iget-wide v0, p0, Lcom/android/browser/Tab;->mId:J

    return-wide v0
.end method

.method getLoadProgress()I
    .locals 1

    .prologue
    .line 1867
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    if-eqz v0, :cond_0

    .line 1868
    iget v0, p0, Lcom/android/browser/Tab;->mPageLoadProgress:I

    .line 1870
    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method getNotificationPermissionsPrompt()Lcom/android/browser/NotificationPermissionsPrompt;
    .locals 2

    .prologue
    .line 1366
    const-string v0, "Tab"

    const-string v1, "Inside tab.java getNotificationPermissionsPrompt"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1367
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;

    if-nez v0, :cond_0

    .line 1368
    iget-object v0, p0, Lcom/android/browser/Tab;->mContainer:Landroid/view/View;

    const v1, 0x7f0d007a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/browser/NotificationPermissionsPrompt;

    iput-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;

    .line 1370
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;

    return-object v0
.end method

.method getOriginalUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1794
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mOriginalUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1795
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 1797
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mOriginalUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/browser/UrlUtils;->filteredUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getParent()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 1601
    iget-object v0, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    return-object v0
.end method

.method public getScreenshot()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 1977
    monitor-enter p0

    .line 1978
    :try_start_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    monitor-exit p0

    return-object v0

    .line 1979
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getSecurityState()Lcom/android/browser/Tab$SecurityState;
    .locals 1

    .prologue
    .line 1854
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mSecurityState:Lcom/android/browser/Tab$SecurityState;

    return-object v0
.end method

.method getSslCertificateError()Landroid/net/http/SslError;
    .locals 1

    .prologue
    .line 1863
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mSslCertificateError:Landroid/net/http/SslError;

    return-object v0
.end method

.method getSubViewContainer()Landroid/view/View;
    .locals 1

    .prologue
    .line 1746
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubViewContainer:Landroid/view/View;

    return-object v0
.end method

.method getSubWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 1738
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    return-object v0
.end method

.method getTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1804
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    if-eqz v0, :cond_0

    .line 1805
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const v1, 0x7f0c0059

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1807
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    goto :goto_0
.end method

.method getTopWindow()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 1691
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1692
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    .line 1694
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    goto :goto_0
.end method

.method getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1790
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/browser/UrlUtils;->filteredUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getViewContainer()Landroid/view/View;
    .locals 1

    .prologue
    .line 1721
    iget-object v0, p0, Lcom/android/browser/Tab;->mContainer:Landroid/view/View;

    return-object v0
.end method

.method getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 1704
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    return-object v0
.end method

.method getWebViewClassic()Landroid/webkit/WebViewClassic;
    .locals 1

    .prologue
    .line 1713
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-static {v0}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v0

    return-object v0
.end method

.method public goBack()V
    .locals 1

    .prologue
    .line 2153
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 2154
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 2156
    :cond_0
    return-void
.end method

.method public goForward()V
    .locals 1

    .prologue
    .line 2159
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 2160
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    .line 2162
    :cond_0
    return-void
.end method

.method inForeground()Z
    .locals 1

    .prologue
    .line 1682
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInForeground:Z

    return v0
.end method

.method inPageLoad()Z
    .locals 1

    .prologue
    .line 1878
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    return v0
.end method

.method public isBookmarkedSite()Z
    .locals 1

    .prologue
    .line 1821
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-boolean v0, v0, Lcom/android/browser/Tab$PageState;->mIsBookmarkedSite:Z

    return v0
.end method

.method isPrivateBrowsingEnabled()Z
    .locals 1

    .prologue
    .line 1730
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-boolean v0, v0, Lcom/android/browser/Tab$PageState;->mIncognito:Z

    return v0
.end method

.method public isSnapshot()Z
    .locals 1

    .prologue
    .line 1983
    const/4 v0, 0x0

    return v0
.end method

.method public loadUrl(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .parameter "url"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 2075
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    .line 2078
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Tab;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 2079
    iget-object v0, p0, Lcom/android/browser/Tab;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldCheckUrlLengthLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2080
    iget-object v0, p0, Lcom/android/browser/Tab;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0, p1}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->checkAndTrimUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2083
    :cond_0
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/browser/Tab;->mPageLoadProgress:I

    .line 2084
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/Tab;->mInPageLoad:Z

    .line 2085
    new-instance v0, Lcom/android/browser/Tab$PageState;

    iget-object v1, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/browser/Tab$PageState;-><init>(Landroid/content/Context;ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    .line 2086
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-interface {v0, p0, v1, v3}, Lcom/android/browser/WebViewController;->onPageStarted(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 2087
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 2089
    :cond_1
    return-void
.end method

.method public onNewPicture(Landroid/webkit/WebView;Landroid/graphics/Picture;)V
    .locals 0
    .parameter "view"
    .parameter "picture"

    .prologue
    .line 2135
    invoke-direct {p0}, Lcom/android/browser/Tab;->postCapture()V

    .line 2136
    return-void
.end method

.method public onTest(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .parameter "title"
    .parameter "body"
    .parameter "pointer"

    .prologue
    .line 1351
    const-string v0, "Tab"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inside on TEST pointer is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1352
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0058

    new-instance v2, Lcom/android/browser/Tab$7;

    invoke-direct {v2, p0, p3}, Lcom/android/browser/Tab$7;-><init>(Lcom/android/browser/Tab;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1362
    const-string v0, "display"

    invoke-virtual {p0, v0, p3}, Lcom/android/browser/Tab;->OnResponseBack(Ljava/lang/String;I)V

    .line 1363
    return-void
.end method

.method pause()V
    .locals 1

    .prologue
    .line 1642
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1643
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 1644
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1645
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 1648
    :cond_0
    return-void
.end method

.method protected persistThumbnail()V
    .locals 1

    .prologue
    .line 2176
    iget-object v0, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/browser/DataController;->getInstance(Landroid/content/Context;)Lcom/android/browser/DataController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/browser/DataController;->saveThumbnail(Lcom/android/browser/Tab;)V

    .line 2177
    return-void
.end method

.method putInBackground()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1669
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInForeground:Z

    if-nez v0, :cond_1

    .line 1679
    :cond_0
    :goto_0
    return-void

    .line 1672
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Tab;->capture()V

    .line 1673
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/Tab;->mInForeground:Z

    .line 1674
    invoke-virtual {p0}, Lcom/android/browser/Tab;->pause()V

    .line 1675
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 1676
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1677
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    goto :goto_0
.end method

.method putInForeground()V
    .locals 2

    .prologue
    .line 1651
    iget-boolean v1, p0, Lcom/android/browser/Tab;->mInForeground:Z

    if-eqz v1, :cond_0

    .line 1666
    :goto_0
    return-void

    .line 1654
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/browser/Tab;->mInForeground:Z

    .line 1655
    invoke-virtual {p0}, Lcom/android/browser/Tab;->resume()V

    .line 1656
    iget-object v1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1657
    .local v0, activity:Landroid/app/Activity;
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 1658
    iget-object v1, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v1, :cond_1

    .line 1659
    iget-object v1, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 1662
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 1663
    iget-object v1, p0, Lcom/android/browser/Tab;->mQueuedErrors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab$ErrorDialog;

    invoke-direct {p0, v1}, Lcom/android/browser/Tab;->showError(Lcom/android/browser/Tab$ErrorDialog;)V

    .line 1665
    :cond_2
    iget-object v1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1, p0}, Lcom/android/browser/WebViewController;->bookmarkedStatusHasChanged(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method public refreshIdAfterPreload()V
    .locals 2

    .prologue
    .line 1385
    invoke-static {}, Lcom/android/browser/TabControl;->getNextId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/browser/Tab;->mId:J

    .line 1386
    return-void
.end method

.method removeFromTree()V
    .locals 3

    .prologue
    .line 1507
    iget-object v2, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    if-eqz v2, :cond_0

    .line 1508
    iget-object v2, p0, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 1509
    .local v1, t:Lcom/android/browser/Tab;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/Tab;->setParent(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 1513
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    if-eqz v2, :cond_1

    .line 1514
    iget-object v2, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mChildren:Ljava/util/Vector;

    invoke-virtual {v2, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 1516
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Tab;->deleteThumbnail()V

    .line 1517
    return-void
.end method

.method resume()V
    .locals 1

    .prologue
    .line 1622
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1623
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-direct {p0, v0}, Lcom/android/browser/Tab;->setupHwAcceleration(Landroid/view/View;)V

    .line 1624
    iget-object v0, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 1625
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1626
    iget-object v0, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 1629
    :cond_0
    return-void
.end method

.method public saveState()Landroid/os/Bundle;
    .locals 5

    .prologue
    .line 1887
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-nez v1, :cond_0

    .line 1888
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    .line 1916
    :goto_0
    return-object v1

    .line 1891
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v1, v1, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1892
    const/4 v1, 0x0

    goto :goto_0

    .line 1895
    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    .line 1896
    iget-object v1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    move-result-object v0

    .line 1897
    .local v0, savedList:Landroid/webkit/WebBackForwardList;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getSize()I

    move-result v1

    if-nez v1, :cond_3

    .line 1898
    :cond_2
    const-string v1, "Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to save back/forward list for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v3, v3, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1902
    :cond_3
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "ID"

    iget-wide v3, p0, Lcom/android/browser/Tab;->mId:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1903
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "currentUrl"

    iget-object v3, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v3, v3, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1904
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "currentTitle"

    iget-object v3, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v3, v3, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1905
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "privateBrowsingEnabled"

    iget-object v3, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1906
    iget-object v1, p0, Lcom/android/browser/Tab;->mAppId:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 1907
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "appid"

    iget-object v3, p0, Lcom/android/browser/Tab;->mAppId:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1909
    :cond_4
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "closeOnBack"

    iget-boolean v3, p0, Lcom/android/browser/Tab;->mCloseOnBack:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1911
    iget-object v1, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    if-eqz v1, :cond_5

    .line 1912
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "parentTab"

    iget-object v3, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    iget-wide v3, v3, Lcom/android/browser/Tab;->mId:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1914
    :cond_5
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v2, "useragent"

    iget-object v3, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/browser/BrowserSettings;->hasDesktopUseragent(Landroid/webkit/WebView;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1916
    iget-object v1, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    goto/16 :goto_0
.end method

.method public saveViewState(Landroid/content/ContentValues;)Z
    .locals 13
    .parameter "values"

    .prologue
    const/4 v10, 0x0

    .line 2022
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    .line 2023
    .local v9, web:Landroid/webkit/WebViewClassic;
    if-nez v9, :cond_1

    .line 2059
    :cond_0
    :goto_0
    return v10

    .line 2024
    :cond_1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2025
    .local v4, path:Ljava/lang/String;
    new-instance v0, Lcom/android/browser/Tab$SaveCallback;

    const/4 v11, 0x0

    invoke-direct {v0, v11}, Lcom/android/browser/Tab$SaveCallback;-><init>(Lcom/android/browser/Tab$1;)V

    .line 2026
    .local v0, callback:Lcom/android/browser/Tab$SaveCallback;
    const/4 v3, 0x0

    .line 2028
    .local v3, outs:Ljava/io/OutputStream;
    :try_start_0
    iget-object v11, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const/4 v12, 0x0

    invoke-virtual {v11, v4, v12}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    .line 2029
    new-instance v8, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v8, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 2030
    .local v8, stream:Ljava/util/zip/GZIPOutputStream;
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2031
    :try_start_1
    invoke-virtual {v9, v8, v0}, Landroid/webkit/WebViewClassic;->saveViewState(Ljava/io/OutputStream;Landroid/webkit/ValueCallback;)V

    .line 2032
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 2033
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2034
    :try_start_2
    invoke-virtual {v8}, Ljava/util/zip/GZIPOutputStream;->flush()V

    .line 2035
    invoke-virtual {v8}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 2049
    iget-object v11, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v4}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 2050
    .local v5, savedFile:Ljava/io/File;
    iget-boolean v11, v0, Lcom/android/browser/Tab$SaveCallback;->mResult:Z

    if-nez v11, :cond_3

    .line 2051
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v11

    if-nez v11, :cond_0

    .line 2052
    invoke-virtual {v5}, Ljava/io/File;->deleteOnExit()V

    goto :goto_0

    .line 2033
    .end local v5           #savedFile:Ljava/io/File;
    :catchall_0
    move-exception v11

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v11
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 2036
    .end local v8           #stream:Ljava/util/zip/GZIPOutputStream;
    :catch_0
    move-exception v1

    .line 2037
    .local v1, e:Ljava/lang/Exception;
    const-string v11, "Tab"

    const-string v12, "Failed to save view state"

    invoke-static {v11, v12, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2038
    if-eqz v3, :cond_2

    .line 2040
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 2043
    :cond_2
    :goto_1
    iget-object v11, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v4}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 2044
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v11

    if-nez v11, :cond_0

    .line 2045
    invoke-virtual {v2}, Ljava/io/File;->deleteOnExit()V

    goto :goto_0

    .line 2056
    .end local v1           #e:Ljava/lang/Exception;
    .end local v2           #file:Ljava/io/File;
    .restart local v5       #savedFile:Ljava/io/File;
    .restart local v8       #stream:Ljava/util/zip/GZIPOutputStream;
    :cond_3
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 2057
    .local v6, size:J
    const-string v10, "viewstate_path"

    invoke-virtual {p1, v10, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2058
    const-string v10, "viewstate_size"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {p1, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2059
    const/4 v10, 0x1

    goto :goto_0

    .line 2041
    .end local v5           #savedFile:Ljava/io/File;
    .end local v6           #size:J
    .end local v8           #stream:Ljava/util/zip/GZIPOutputStream;
    .restart local v1       #e:Ljava/lang/Exception;
    :catch_1
    move-exception v11

    goto :goto_1
.end method

.method setAppId(Ljava/lang/String;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 1778
    iput-object p1, p0, Lcom/android/browser/Tab;->mAppId:Ljava/lang/String;

    .line 1779
    return-void
.end method

.method setCloseOnBack(Z)V
    .locals 0
    .parameter "close"

    .prologue
    .line 1786
    iput-boolean p1, p0, Lcom/android/browser/Tab;->mCloseOnBack:Z

    .line 1787
    return-void
.end method

.method public setController(Lcom/android/browser/WebViewController;)V
    .locals 0
    .parameter "ctl"

    .prologue
    .line 1409
    iput-object p1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    .line 1410
    invoke-virtual {p0}, Lcom/android/browser/Tab;->updateShouldCaptureThumbnails()V

    .line 1411
    return-void
.end method

.method setDeviceAccountLogin(Lcom/android/browser/DeviceAccountLogin;)V
    .locals 0
    .parameter "login"

    .prologue
    .line 744
    iput-object p1, p0, Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;

    .line 745
    return-void
.end method

.method setParent(Lcom/android/browser/Tab;)V
    .locals 4
    .parameter "parent"

    .prologue
    .line 1568
    if-ne p1, p0, :cond_0

    .line 1569
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set parent to self!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1571
    :cond_0
    iput-object p1, p0, Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;

    .line 1576
    iget-object v0, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    if-eqz v0, :cond_1

    .line 1577
    if-nez p1, :cond_3

    .line 1578
    iget-object v0, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v1, "parentTab"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 1585
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->hasDesktopUseragent(Landroid/webkit/WebView;)Z

    move-result v0

    iget-object v1, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->hasDesktopUseragent(Landroid/webkit/WebView;)Z

    move-result v1

    if-eq v0, v1, :cond_2

    .line 1587
    iget-object v0, p0, Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->toggleDesktopUseragent(Landroid/webkit/WebView;)V

    .line 1590
    :cond_2
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    .line 1591
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Parent has same ID as child!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1580
    :cond_3
    iget-object v0, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    const-string v1, "parentTab"

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_0

    .line 1593
    :cond_4
    return-void
.end method

.method setSubViewContainer(Landroid/view/View;)V
    .locals 0
    .parameter "subViewContainer"

    .prologue
    .line 1750
    iput-object p1, p0, Lcom/android/browser/Tab;->mSubViewContainer:Landroid/view/View;

    .line 1751
    return-void
.end method

.method setSubWebView(Landroid/webkit/WebView;)V
    .locals 0
    .parameter "subView"

    .prologue
    .line 1742
    iput-object p1, p0, Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;

    .line 1743
    return-void
.end method

.method setViewContainer(Landroid/view/View;)V
    .locals 0
    .parameter "container"

    .prologue
    .line 1717
    iput-object p1, p0, Lcom/android/browser/Tab;->mContainer:Landroid/view/View;

    .line 1718
    return-void
.end method

.method setWebView(Landroid/webkit/WebView;)V
    .locals 1
    .parameter "w"

    .prologue
    .line 1418
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/browser/Tab;->setWebView(Landroid/webkit/WebView;Z)V

    .line 1419
    return-void
.end method

.method setWebView(Landroid/webkit/WebView;Z)V
    .locals 6
    .parameter "w"
    .parameter "restore"

    .prologue
    const/4 v5, 0x0

    .line 1426
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-ne v2, p1, :cond_1

    .line 1473
    :cond_0
    :goto_0
    return-void

    .line 1432
    :cond_1
    iget-object v2, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    if-eqz v2, :cond_2

    .line 1433
    iget-object v2, p0, Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;

    invoke-virtual {v2}, Lcom/android/browser/GeolocationPermissionsPrompt;->hide()V

    .line 1436
    :cond_2
    iget-object v2, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v2, p0, p1}, Lcom/android/browser/WebViewController;->onSetWebView(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V

    .line 1438
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v2, :cond_3

    .line 1439
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v2, v5}, Landroid/webkit/WebView;->setPictureListener(Landroid/webkit/WebView$PictureListener;)V

    .line 1440
    if-eqz p1, :cond_7

    .line 1441
    invoke-direct {p0, p1, v5}, Lcom/android/browser/Tab;->syncCurrentState(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 1447
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    .line 1449
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    if-eqz v2, :cond_0

    .line 1450
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/android/browser/Tab;->mWebViewClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 1451
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/android/browser/Tab;->mWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 1456
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/android/browser/Tab;->mDownloadListener:Landroid/webkit/BrowserDownloadListener;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 1457
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/Tab;->mWebBackForwardListClient:Landroid/webkit/WebBackForwardListClient;

    invoke-virtual {v2, v3}, Landroid/webkit/WebViewClassic;->setWebBackForwardListClient(Landroid/webkit/WebBackForwardListClient;)V

    .line 1458
    iget-object v2, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v2}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v1

    .line 1459
    .local v1, tc:Lcom/android/browser/TabControl;
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getOnThumbnailUpdatedListener()Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1460
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    invoke-virtual {v2, p0}, Landroid/webkit/WebView;->setPictureListener(Landroid/webkit/WebView$PictureListener;)V

    .line 1462
    :cond_4
    if-eqz p2, :cond_0

    iget-object v2, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    if-eqz v2, :cond_0

    .line 1463
    invoke-direct {p0}, Lcom/android/browser/Tab;->restoreUserAgent()V

    .line 1464
    iget-object v2, p0, Lcom/android/browser/Tab;->mMainView:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    move-result-object v0

    .line 1466
    .local v0, restoredState:Landroid/webkit/WebBackForwardList;
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getSize()I

    move-result v2

    if-nez v2, :cond_6

    .line 1467
    :cond_5
    const-string v2, "Tab"

    const-string v3, "Failed to restore WebView state!"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1468
    iget-object v2, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v2, v2, Lcom/android/browser/Tab$PageState;->mOriginalUrl:Ljava/lang/String;

    invoke-virtual {p0, v2, v5}, Lcom/android/browser/Tab;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 1470
    :cond_6
    iput-object v5, p0, Lcom/android/browser/Tab;->mSavedState:Landroid/os/Bundle;

    goto :goto_0

    .line 1443
    .end local v0           #restoredState:Landroid/webkit/WebBackForwardList;
    .end local v1           #tc:Lcom/android/browser/TabControl;
    :cond_7
    new-instance v2, Lcom/android/browser/Tab$PageState;

    iget-object v3, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/android/browser/Tab$PageState;-><init>(Landroid/content/Context;Z)V

    iput-object v2, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    goto :goto_1
.end method

.method public shouldUpdateThumbnail()Z
    .locals 1

    .prologue
    .line 1376
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mUpdateThumbnail:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 2202
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2203
    .local v0, builder:Ljava/lang/StringBuilder;
    iget-wide v1, p0, Lcom/android/browser/Tab;->mId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 2204
    const-string v1, ") has parent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2205
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2206
    const-string v1, "true["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2207
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 2208
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2212
    :goto_0
    const-string v1, ", incog: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2213
    invoke-virtual {p0}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 2214
    invoke-virtual {p0}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2215
    const-string v1, ", title: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2216
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2217
    const-string v1, ", url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2218
    invoke-virtual {p0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2220
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 2210
    :cond_1
    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public updateBookmarkedStatus()V
    .locals 3

    .prologue
    .line 1957
    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mUrl:Ljava/lang/String;

    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1958
    iget-object v0, p0, Lcom/android/browser/Tab;->mDataController:Lcom/android/browser/DataController;

    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/Tab;->mIsBookmarkCallback:Lcom/android/browser/DataController$OnQueryUrlIsBookmark;

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/DataController;->queryBookmarkStatus(Ljava/lang/String;Lcom/android/browser/DataController$OnQueryUrlIsBookmark;)V

    .line 1963
    :goto_0
    return-void

    .line 1960
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mDataController:Lcom/android/browser/DataController;

    invoke-virtual {p0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/Tab;->mIsBookmarkCallback:Lcom/android/browser/DataController$OnQueryUrlIsBookmark;

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/DataController;->queryBookmarkStatus(Ljava/lang/String;Lcom/android/browser/DataController$OnQueryUrlIsBookmark;)V

    goto :goto_0
.end method

.method updateCaptureFromBlob([B)V
    .locals 5
    .parameter "blob"

    .prologue
    .line 2184
    monitor-enter p0

    .line 2185
    :try_start_0
    iget-object v2, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    if-nez v2, :cond_0

    .line 2186
    monitor-exit p0

    .line 2198
    :goto_0
    return-void

    .line 2188
    :cond_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 2190
    .local v0, buffer:Ljava/nio/ByteBuffer;
    :try_start_1
    iget-object v2, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2197
    :try_start_2
    monitor-exit p0

    goto :goto_0

    .end local v0           #buffer:Ljava/nio/ByteBuffer;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 2191
    .restart local v0       #buffer:Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v1

    .line 2192
    .local v1, rex:Ljava/lang/RuntimeException;
    :try_start_3
    const-string v2, "Tab"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Load capture has mismatched sizes; buffer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " blob: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "capture: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2195
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public updateShouldCaptureThumbnails()V
    .locals 3

    .prologue
    .line 1389
    iget-object v0, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->shouldCaptureThumbnails()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1390
    monitor-enter p0

    .line 1391
    :try_start_0
    iget-object v0, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 1392
    iget v0, p0, Lcom/android/browser/Tab;->mCaptureWidth:I

    iget v1, p0, Lcom/android/browser/Tab;->mCaptureHeight:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    .line 1394
    iget-object v0, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 1395
    iget-boolean v0, p0, Lcom/android/browser/Tab;->mInForeground:Z

    if-eqz v0, :cond_0

    .line 1396
    invoke-direct {p0}, Lcom/android/browser/Tab;->postCapture()V

    .line 1399
    :cond_0
    monitor-exit p0

    .line 1406
    :goto_0
    return-void

    .line 1399
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1401
    :cond_1
    monitor-enter p0

    .line 1402
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lcom/android/browser/Tab;->mCapture:Landroid/graphics/Bitmap;

    .line 1403
    invoke-virtual {p0}, Lcom/android/browser/Tab;->deleteThumbnail()V

    .line 1404
    monitor-exit p0

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0
.end method
