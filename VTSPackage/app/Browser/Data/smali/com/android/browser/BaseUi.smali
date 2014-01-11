.class public abstract Lcom/android/browser/BaseUi;
.super Ljava/lang/Object;
.source "BaseUi.java"

# interfaces
.implements Lcom/android/browser/UI;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/BaseUi$FullscreenHolder;
    }
.end annotation


# static fields
.field protected static final COVER_SCREEN_GRAVITY_CENTER:Landroid/widget/FrameLayout$LayoutParams; = null

.field protected static final COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams; = null

.field public static final HIDE_TITLEBAR_DELAY:I = 0x7d0

.field private static final LOGTAG:Ljava/lang/String; = "BaseUi"

.field private static final MSG_HIDE_BOTTOMBAR:I = 0x2

.field private static final MSG_HIDE_TITLEBAR:I = 0x1


# instance fields
.field protected mActiveTab:Lcom/android/browser/Tab;

.field mActivity:Landroid/app/Activity;

.field private mActivityPaused:Z

.field private mBlockFocusAnimations:Z

.field protected mBottomBar:Lcom/android/browser/BottomBar;

.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field protected mContentView:Landroid/widget/FrameLayout;

.field private mCustomView:Landroid/view/View;

.field private mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field protected mCustomViewContainer:Landroid/widget/FrameLayout;

.field private mDefaultVideoPoster:Landroid/graphics/Bitmap;

.field private mErrorConsoleContainer:Landroid/widget/LinearLayout;

.field private mFixedTitlebarContainer:Landroid/widget/FrameLayout;

.field protected mFrameLayout:Landroid/widget/FrameLayout;

.field protected mFullscreenContainer:Landroid/widget/FrameLayout;

.field protected mGenericFavicon:Landroid/graphics/drawable/Drawable;

.field protected mHandler:Landroid/os/Handler;

.field private mInputManager:Landroid/view/inputmethod/InputMethodManager;

.field private mInputUrlFlag:Z

.field private mLockIconMixed:Landroid/graphics/drawable/Drawable;

.field private mLockIconSecure:Landroid/graphics/drawable/Drawable;

.field private mNavigationBar:Lcom/android/browser/NavigationBarBase;

.field protected mNeedBottomBar:Z

.field private mOriginalOrientation:I

.field protected mPieControl:Lcom/android/browser/PieControl;

.field private mStopToast:Landroid/widget/Toast;

.field mTabControl:Lcom/android/browser/TabControl;

.field protected mTitleBar:Lcom/android/browser/TitleBar;

.field mUiController:Lcom/android/browser/UiController;

.field private mUrlBarAutoShowManager:Lcom/android/browser/UrlBarAutoShowManager;

.field protected mUseQuickControls:Z

.field private mVideoProgressView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 72
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    sput-object v0, Lcom/android/browser/BaseUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    invoke-direct {v0, v2, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    sput-object v0, Lcom/android/browser/BaseUi;->COVER_SCREEN_GRAVITY_CENTER:Landroid/widget/FrameLayout$LayoutParams;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V
    .locals 7
    .parameter "browser"
    .parameter "controller"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 131
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object v0, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    .line 130
    iput-boolean v1, p0, Lcom/android/browser/BaseUi;->mInputUrlFlag:Z

    .line 709
    iput-object v0, p0, Lcom/android/browser/BaseUi;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 937
    new-instance v0, Lcom/android/browser/BaseUi$2;

    invoke-direct {v0, p0}, Lcom/android/browser/BaseUi$2;-><init>(Lcom/android/browser/BaseUi;)V

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    .line 132
    iput-object p1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    .line 133
    iput-object p2, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    .line 134
    invoke-interface {p2}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    .line 135
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 136
    .local v6, res:Landroid/content/res/Resources;
    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    .line 138
    const v0, 0x7f02004e

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mLockIconSecure:Landroid/graphics/drawable/Drawable;

    .line 139
    const v0, 0x7f02004f

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mLockIconMixed:Landroid/graphics/drawable/Drawable;

    .line 140
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const v2, 0x1020002

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    .line 142
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f040016

    iget-object v3, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 144
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f0d0047

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mFixedTitlebarContainer:Landroid/widget/FrameLayout;

    .line 146
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f0d0048

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    .line 148
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f0d0044

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    .line 150
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mFrameLayout:Landroid/widget/FrameLayout;

    const v2, 0x7f0d0046

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    .line 152
    const v0, 0x7f020001

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mGenericFavicon:Landroid/graphics/drawable/Drawable;

    .line 154
    new-instance v0, Lcom/android/browser/TitleBar;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-direct {v0, v2, v3, p0, v4}, Lcom/android/browser/TitleBar;-><init>(Landroid/content/Context;Lcom/android/browser/UiController;Lcom/android/browser/BaseUi;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    .line 157
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    .line 158
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    .line 159
    new-instance v0, Lcom/android/browser/BottomBar;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    iget-object v5, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/browser/BottomBar;-><init>(Landroid/content/Context;Lcom/android/browser/UiController;Lcom/android/browser/BaseUi;Lcom/android/browser/TabControl;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    .line 163
    :cond_0
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->useFullscreen()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/BaseUi;->setFullscreen(Z)V

    .line 164
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setProgress(I)V

    .line 165
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getNavigationBar()Lcom/android/browser/NavigationBarBase;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    .line 166
    new-instance v0, Lcom/android/browser/UrlBarAutoShowManager;

    invoke-direct {v0, p0}, Lcom/android/browser/UrlBarAutoShowManager;-><init>(Lcom/android/browser/BaseUi;)V

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mUrlBarAutoShowManager:Lcom/android/browser/UrlBarAutoShowManager;

    .line 167
    return-void

    :cond_1
    move v0, v1

    .line 157
    goto :goto_0
.end method

.method private cancelStopToast()V
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mStopToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mStopToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 172
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mStopToast:Landroid/widget/Toast;

    .line 174
    :cond_0
    return-void
.end method

.method private removeTabFromContentView(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    .line 397
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->hideTitleBar()V

    .line 399
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    .line 400
    .local v2, mainView:Landroid/webkit/WebView;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getViewContainer()Landroid/view/View;

    move-result-object v0

    .line 401
    .local v0, container:Landroid/view/View;
    if-nez v2, :cond_1

    .line 417
    :cond_0
    :goto_0
    return-void

    .line 407
    :cond_1
    const v4, 0x7f0d0078

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    .line 409
    .local v3, wrapper:Landroid/widget/FrameLayout;
    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 410
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 411
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v4}, Lcom/android/browser/UiController;->endActionMode()V

    .line 412
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v4, p1}, Lcom/android/browser/UiController;->removeSubWindow(Lcom/android/browser/Tab;)V

    .line 413
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/android/browser/Tab;->getErrorConsole(Z)Lcom/android/browser/ErrorConsoleView;

    move-result-object v1

    .line 414
    .local v1, errorConsole:Lcom/android/browser/ErrorConsoleView;
    if-eqz v1, :cond_0

    .line 415
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto :goto_0
.end method

.method private updateLockIconImage(Lcom/android/browser/Tab$SecurityState;)V
    .locals 2
    .parameter "securityState"

    .prologue
    .line 696
    const/4 v0, 0x0

    .line 697
    .local v0, d:Landroid/graphics/drawable/Drawable;
    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_SECURE:Lcom/android/browser/Tab$SecurityState;

    if-ne p1, v1, :cond_1

    .line 698
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mLockIconSecure:Landroid/graphics/drawable/Drawable;

    .line 705
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v1, v0}, Lcom/android/browser/NavigationBarBase;->setLock(Landroid/graphics/drawable/Drawable;)V

    .line 706
    return-void

    .line 699
    :cond_1
    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_MIXED:Lcom/android/browser/Tab$SecurityState;

    if-eq p1, v1, :cond_2

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_BAD_CERTIFICATE:Lcom/android/browser/Tab$SecurityState;

    if-ne p1, v1, :cond_0

    .line 703
    :cond_2
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mLockIconMixed:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method


# virtual methods
.method public addFixedTitleBar(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 983
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mFixedTitlebarContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 984
    return-void
.end method

.method public addTab(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 289
    return-void
.end method

.method public attachSubWindow(Landroid/view/View;)V
    .locals 2
    .parameter "container"

    .prologue
    .line 479
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 481
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    sget-object v1, Lcom/android/browser/BaseUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, p1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 484
    return-void
.end method

.method public attachTab(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 366
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->attachTabToContentView(Lcom/android/browser/Tab;)V

    .line 367
    return-void
.end method

.method protected attachTabToContentView(Lcom/android/browser/Tab;)V
    .locals 6
    .parameter "tab"

    .prologue
    .line 370
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v4

    if-nez v4, :cond_1

    .line 394
    :cond_0
    :goto_0
    return-void

    .line 373
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getViewContainer()Landroid/view/View;

    move-result-object v0

    .line 374
    .local v0, container:Landroid/view/View;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 377
    .local v1, mainView:Landroid/webkit/WebView;
    const v4, 0x7f0d0078

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    .line 379
    .local v3, wrapper:Landroid/widget/FrameLayout;
    invoke-virtual {v1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 380
    .local v2, parent:Landroid/view/ViewGroup;
    if-eq v2, v3, :cond_3

    .line 381
    if-eqz v2, :cond_2

    .line 382
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 384
    :cond_2
    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 386
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .end local v2           #parent:Landroid/view/ViewGroup;
    check-cast v2, Landroid/view/ViewGroup;

    .line 387
    .restart local v2       #parent:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    if-eq v2, v4, :cond_5

    .line 388
    if-eqz v2, :cond_4

    .line 389
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 391
    :cond_4
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    sget-object v5, Lcom/android/browser/BaseUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v4, v0, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 393
    :cond_5
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v4, p1}, Lcom/android/browser/UiController;->attachSubWindow(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method public blockFocusAnimations()Z
    .locals 1

    .prologue
    .line 1006
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mBlockFocusAnimations:Z

    return v0
.end method

.method public bookmarkedStatusHasChanged(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 266
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    invoke-virtual {p1}, Lcom/android/browser/Tab;->isBookmarkedSite()Z

    move-result v0

    .line 268
    .local v0, isBookmark:Z
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v1, v0}, Lcom/android/browser/NavigationBarBase;->setCurrentUrlIsBookmark(Z)V

    .line 270
    .end local v0           #isBookmark:Z
    :cond_0
    return-void
.end method

.method canShowTitleBar()Z
    .locals 1

    .prologue
    .line 504
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->isTitleBarShowing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->isInCustomActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public createSubWindow(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V
    .locals 8
    .parameter "tab"
    .parameter "subView"

    .prologue
    const/4 v7, -0x1

    .line 446
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f040014

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 448
    .local v3, subViewContainer:Landroid/view/View;
    const v4, 0x7f0d0042

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 450
    .local v2, inner:Landroid/view/ViewGroup;
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 452
    const v4, 0x7f0d0041

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 454
    .local v0, cancel:Landroid/widget/ImageButton;
    move-object v1, p2

    .line 455
    .local v1, cancelSubView:Landroid/webkit/WebView;
    new-instance v4, Lcom/android/browser/BaseUi$1;

    invoke-direct {v4, p0, v1}, Lcom/android/browser/BaseUi$1;-><init>(Lcom/android/browser/BaseUi;Landroid/webkit/WebView;)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 461
    invoke-virtual {p1, p2}, Lcom/android/browser/Tab;->setSubWebView(Landroid/webkit/WebView;)V

    .line 462
    invoke-virtual {p1, v3}, Lcom/android/browser/Tab;->setSubViewContainer(Landroid/view/View;)V

    .line 463
    return-void
.end method

.method public detachTab(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 361
    invoke-direct {p0, p1}, Lcom/android/browser/BaseUi;->removeTabFromContentView(Lcom/android/browser/Tab;)V

    .line 362
    return-void
.end method

.method protected dismissIME()V
    .locals 3

    .prologue
    .line 653
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 654
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 657
    :cond_0
    return-void
.end method

.method public editUrl(ZZ)V
    .locals 1
    .parameter "clearInput"
    .parameter "forceIME"

    .prologue
    .line 494
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->isInCustomActionMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 495
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->endActionMode()V

    .line 497
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->showTitleBar()V

    .line 498
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v0

    if-nez v0, :cond_1

    .line 499
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/NavigationBarBase;->startEditingUrl(ZZ)V

    .line 501
    :cond_1
    return-void
.end method

.method getActiveTab()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    return-object v0
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 827
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 828
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020016

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    .line 831
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 9
    .parameter "icon"

    .prologue
    const/4 v1, 0x1

    const/4 v8, 0x2

    .line 887
    const/4 v2, 0x3

    new-array v6, v2, [Landroid/graphics/drawable/Drawable;

    .line 888
    .local v6, array:[Landroid/graphics/drawable/Drawable;
    const/4 v2, 0x0

    new-instance v3, Landroid/graphics/drawable/PaintDrawable;

    const/high16 v4, -0x100

    invoke-direct {v3, v4}, Landroid/graphics/drawable/PaintDrawable;-><init>(I)V

    aput-object v3, v6, v2

    .line 889
    new-instance v7, Landroid/graphics/drawable/PaintDrawable;

    const/4 v2, -0x1

    invoke-direct {v7, v2}, Landroid/graphics/drawable/PaintDrawable;-><init>(I)V

    .line 890
    .local v7, p:Landroid/graphics/drawable/PaintDrawable;
    aput-object v7, v6, v1

    .line 891
    if-nez p1, :cond_0

    .line 892
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mGenericFavicon:Landroid/graphics/drawable/Drawable;

    aput-object v2, v6, v8

    .line 896
    :goto_0
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v0, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .local v0, d:Landroid/graphics/drawable/LayerDrawable;
    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    .line 897
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    move v1, v8

    move v2, v8

    move v3, v8

    move v4, v8

    move v5, v8

    .line 898
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 899
    return-object v0

    .line 894
    .end local v0           #d:Landroid/graphics/drawable/LayerDrawable;
    :cond_0
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    aput-object v2, v6, v8

    goto :goto_0
.end method

.method getInputUrlFlag()Z
    .locals 1

    .prologue
    .line 980
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mInputUrlFlag:Z

    return v0
.end method

.method protected getMenu()Landroid/view/Menu;
    .locals 3

    .prologue
    .line 861
    new-instance v0, Lcom/android/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/android/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 862
    .local v0, menu:Lcom/android/internal/view/menu/MenuBuilder;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f100003

    invoke-virtual {v1, v2, v0}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 863
    return-object v0
.end method

.method public getTitleBar()Lcom/android/browser/TitleBar;
    .locals 1

    .prologue
    .line 572
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    return-object v0
.end method

.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 3

    .prologue
    .line 836
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mVideoProgressView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 837
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 838
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v1, 0x7f04003a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BaseUi;->mVideoProgressView:Landroid/view/View;

    .line 841
    .end local v0           #inflater:Landroid/view/LayoutInflater;
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mVideoProgressView:Landroid/view/View;

    return-object v1
.end method

.method protected getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 853
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eqz v0, :cond_0

    .line 854
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 856
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected handleMessage(Landroid/os/Message;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 954
    return-void
.end method

.method public hideAutoLogin(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 671
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/browser/BaseUi;->updateAutoLogin(Lcom/android/browser/Tab;Z)V

    .line 672
    return-void
.end method

.method protected hideBottomBar()V
    .locals 1

    .prologue
    .line 553
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 554
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->hide()V

    .line 556
    :cond_0
    return-void
.end method

.method protected hideTitleBar()V
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 528
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->hide()V

    .line 531
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->hideBottomBar()V

    .line 532
    return-void
.end method

.method protected hideTitleBarOnly()V
    .locals 1

    .prologue
    .line 521
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 522
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->hide()V

    .line 524
    :cond_0
    return-void
.end method

.method protected isActivityPaused()Z
    .locals 1

    .prologue
    .line 198
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mActivityPaused:Z

    return v0
.end method

.method public isCustomViewShowing()Z
    .locals 1

    .prologue
    .line 649
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEditingUrl()Z
    .locals 1

    .prologue
    .line 564
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isEditingUrl()Z

    move-result v0

    return v0
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 903
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isTitleBarShowing()Z
    .locals 1

    .prologue
    .line 560
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isShowing()Z

    move-result v0

    return v0
.end method

.method public isWebShowing()Z
    .locals 1

    .prologue
    .line 661
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public needsRestoreAllTabs()Z
    .locals 1

    .prologue
    .line 284
    const/4 v0, 0x1

    return v0
.end method

.method public onActionModeFinished(Z)V
    .locals 0
    .parameter "inLoad"

    .prologue
    .line 741
    return-void
.end method

.method public onBackKey()Z
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->hideCustomView()V

    .line 214
    const/4 v0, 0x1

    .line 216
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "config"

    .prologue
    .line 202
    return-void
.end method

.method public onContextMenuClosed(Landroid/view/Menu;Z)V
    .locals 0
    .parameter "menu"
    .parameter "inLoad"

    .prologue
    .line 792
    return-void
.end method

.method public onContextMenuCreated(Landroid/view/Menu;)V
    .locals 0
    .parameter "menu"

    .prologue
    .line 788
    return-void
.end method

.method public onExtendedMenuClosed(Z)V
    .locals 0
    .parameter "inLoad"

    .prologue
    .line 784
    return-void
.end method

.method public onExtendedMenuOpened()V
    .locals 0

    .prologue
    .line 771
    return-void
.end method

.method public onHideCustomView()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 634
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    check-cast v1, Lcom/android/browser/BrowserWebView;

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserWebView;->setVisibility(I)V

    .line 635
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 645
    :goto_0
    return-void

    .line 637
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/browser/BaseUi;->setFullscreen(Z)V

    .line 638
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 639
    .local v0, decor:Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mFullscreenContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 640
    iput-object v3, p0, Lcom/android/browser/BaseUi;->mFullscreenContainer:Landroid/widget/FrameLayout;

    .line 641
    iput-object v3, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    .line 642
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v1}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 644
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget v2, p0, Lcom/android/browser/BaseUi;->mOriginalOrientation:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public onMenuKey()Z
    .locals 1

    .prologue
    .line 221
    const/4 v0, 0x0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 775
    const/4 v0, 0x0

    return v0
.end method

.method public onOptionsMenuClosed(Z)V
    .locals 0
    .parameter "inLoad"

    .prologue
    .line 780
    return-void
.end method

.method public onOptionsMenuOpened()V
    .locals 0

    .prologue
    .line 767
    return-void
.end method

.method public onPageStopped(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/android/browser/BaseUi;->cancelStopToast()V

    .line 275
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    const v1, 0x7f0c0069

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mStopToast:Landroid/widget/Toast;

    .line 278
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mStopToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 280
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->isCustomViewShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->onHideCustomView()V

    .line 182
    :cond_0
    invoke-direct {p0}, Lcom/android/browser/BaseUi;->cancelStopToast()V

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/BaseUi;->mActivityPaused:Z

    .line 184
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 758
    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 258
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getLoadProgress()I

    move-result v0

    .line 259
    .local v0, progress:I
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 260
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v0}, Lcom/android/browser/TitleBar;->setProgress(I)V

    .line 262
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 187
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/browser/BaseUi;->mActivityPaused:Z

    .line 190
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 191
    .local v0, ct:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {p0, v0}, Lcom/android/browser/BaseUi;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 194
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->onResume()V

    .line 195
    return-void
.end method

.method public onSetWebView(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V
    .locals 6
    .parameter "tab"
    .parameter "webView"

    .prologue
    .line 421
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getViewContainer()Landroid/view/View;

    move-result-object v0

    .line 422
    .local v0, container:Landroid/view/View;
    if-nez v0, :cond_0

    .line 425
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f040033

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 427
    invoke-virtual {p1, v0}, Lcom/android/browser/Tab;->setViewContainer(Landroid/view/View;)V

    .line 429
    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    if-eq v2, p2, :cond_1

    .line 431
    const v2, 0x7f0d0078

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 433
    .local v1, wrapper:Landroid/widget/FrameLayout;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 435
    .end local v1           #wrapper:Landroid/widget/FrameLayout;
    :cond_1
    return-void
.end method

.method public onTabDataChanged(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 247
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->setUrlTitle(Lcom/android/browser/Tab;)V

    .line 248
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->setFavicon(Lcom/android/browser/Tab;)V

    .line 249
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->updateLockIconToLatest(Lcom/android/browser/Tab;)V

    .line 250
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->updateNavigationState(Lcom/android/browser/Tab;)V

    .line 251
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, p1}, Lcom/android/browser/TitleBar;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 252
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0, p1}, Lcom/android/browser/NavigationBarBase;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 253
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 254
    return-void
.end method

.method public onVoiceResult(Ljava/lang/String;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 1011
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0, p1}, Lcom/android/browser/NavigationBarBase;->onVoiceResult(Ljava/lang/String;)V

    .line 1012
    return-void
.end method

.method protected refreshWebView()V
    .locals 1

    .prologue
    .line 487
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 488
    .local v0, web:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 489
    invoke-virtual {v0}, Landroid/webkit/WebView;->invalidate()V

    .line 491
    :cond_0
    return-void
.end method

.method public removeActiveTabsPage()V
    .locals 0

    .prologue
    .line 752
    return-void
.end method

.method public removeSubWindow(Landroid/view/View;)V
    .locals 1
    .parameter "subviewContainer"

    .prologue
    .line 470
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 471
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->endActionMode()V

    .line 472
    return-void
.end method

.method public removeTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 353
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-ne v0, p1, :cond_0

    .line 354
    invoke-direct {p0, p1}, Lcom/android/browser/BaseUi;->removeTabFromContentView(Lcom/android/browser/Tab;)V

    .line 355
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    .line 357
    :cond_0
    return-void
.end method

.method public revertVoiceTitleBar(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 584
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 585
    .local v1, url:Ljava/lang/String;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 589
    .local v0, title:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/BaseUi;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 590
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldSetNavigationBarTitle()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 591
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v2, v0}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 597
    :goto_0
    return-void

    .line 593
    :cond_0
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v2, v1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setActiveTab(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 293
    if-nez p1, :cond_0

    .line 332
    :goto_0
    return-void

    .line 295
    :cond_0
    iput-boolean v2, p0, Lcom/android/browser/BaseUi;->mBlockFocusAnimations:Z

    .line 296
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 297
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eq p1, v1, :cond_1

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eqz v1, :cond_1

    .line 298
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-direct {p0, v1}, Lcom/android/browser/BaseUi;->removeTabFromContentView(Lcom/android/browser/Tab;)V

    .line 299
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 300
    .local v0, web:Landroid/webkit/WebView;
    if-eqz v0, :cond_1

    .line 301
    invoke-virtual {v0, v4}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 304
    .end local v0           #web:Landroid/webkit/WebView;
    :cond_1
    iput-object p1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    .line 305
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserWebView;

    .line 306
    .local v0, web:Lcom/android/browser/BrowserWebView;
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->updateUrlBarAutoShowManagerTarget()V

    .line 307
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->attachTabToContentView(Lcom/android/browser/Tab;)V

    .line 308
    if-eqz v0, :cond_2

    .line 310
    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v1, :cond_4

    .line 311
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Lcom/android/browser/PieControl;->forceToTop(Landroid/widget/FrameLayout;)V

    .line 312
    invoke-virtual {v0, v4}, Lcom/android/browser/BrowserWebView;->setTitleBar(Lcom/android/browser/TitleBar;)V

    .line 313
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->hide()V

    .line 319
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->bringToFront()V

    .line 321
    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v1, :cond_3

    .line 322
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v1}, Lcom/android/browser/BottomBar;->bringToFront()V

    .line 325
    :cond_3
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTopWindow()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->requestFocus()Z

    .line 326
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->shouldShowErrorConsole()Z

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/android/browser/BaseUi;->setShouldShowErrorConsole(Lcom/android/browser/Tab;Z)V

    .line 327
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 328
    invoke-virtual {p0, p1}, Lcom/android/browser/BaseUi;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 329
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/browser/NavigationBarBase;->setIncognitoMode(Z)V

    .line 330
    invoke-virtual {p0, p1, v3}, Lcom/android/browser/BaseUi;->updateAutoLogin(Lcom/android/browser/Tab;Z)V

    .line 331
    iput-boolean v3, p0, Lcom/android/browser/BaseUi;->mBlockFocusAnimations:Z

    goto :goto_0

    .line 315
    :cond_4
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserWebView;->setTitleBar(Lcom/android/browser/TitleBar;)V

    .line 316
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->onScrollChanged()V

    goto :goto_1
.end method

.method public setContentViewMarginBottom(I)V
    .locals 2
    .parameter "margin"

    .prologue
    .line 996
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 998
    .local v0, params:Landroid/widget/LinearLayout$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v1, p1, :cond_0

    .line 999
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 1000
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1002
    :cond_0
    return-void
.end method

.method public setContentViewMarginTop(I)V
    .locals 2
    .parameter "margin"

    .prologue
    .line 987
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 989
    .local v0, params:Landroid/widget/LinearLayout$LayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v1, p1, :cond_0

    .line 990
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 991
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 993
    :cond_0
    return-void
.end method

.method protected setFavicon(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 733
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 734
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 735
    .local v0, icon:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v1, v0}, Lcom/android/browser/NavigationBarBase;->setFavicon(Landroid/graphics/Bitmap;)V

    .line 737
    .end local v0           #icon:Landroid/graphics/Bitmap;
    :cond_0
    return-void
.end method

.method public setFullscreen(Z)V
    .locals 5
    .parameter "enabled"

    .prologue
    const/4 v4, 0x0

    .line 867
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 868
    .local v1, win:Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 869
    .local v2, winParams:Landroid/view/WindowManager$LayoutParams;
    const/16 v0, 0x400

    .line 870
    .local v0, bits:I
    if-eqz p1, :cond_1

    .line 871
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v3, v3, 0x400

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 880
    :goto_0
    iget-boolean v3, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v3, :cond_0

    .line 881
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v3, p1}, Lcom/android/browser/BottomBar;->setFullScreen(Z)V

    .line 883
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 884
    return-void

    .line 873
    :cond_1
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v3, v3, -0x401

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 874
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-eqz v3, :cond_2

    .line 875
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 877
    :cond_2
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setSystemUiVisibility(I)V

    goto :goto_0
.end method

.method setInputUrlFlag(Z)V
    .locals 0
    .parameter "flag"

    .prologue
    .line 976
    iput-boolean p1, p0, Lcom/android/browser/BaseUi;->mInputUrlFlag:Z

    .line 977
    return-void
.end method

.method public setShouldShowErrorConsole(Lcom/android/browser/Tab;Z)V
    .locals 5
    .parameter "tab"
    .parameter "flag"

    .prologue
    .line 798
    if-nez p1, :cond_0

    .line 819
    :goto_0
    return-void

    .line 799
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/android/browser/Tab;->getErrorConsole(Z)Lcom/android/browser/ErrorConsoleView;

    move-result-object v0

    .line 800
    .local v0, errorConsole:Lcom/android/browser/ErrorConsoleView;
    if-eqz p2, :cond_3

    .line 803
    invoke-virtual {v0}, Lcom/android/browser/ErrorConsoleView;->numberOfErrors()I

    move-result v1

    if-lez v1, :cond_2

    .line 804
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/ErrorConsoleView;->showConsole(I)V

    .line 808
    :goto_1
    invoke-virtual {v0}, Lcom/android/browser/ErrorConsoleView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 809
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 812
    :cond_1
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 806
    :cond_2
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/browser/ErrorConsoleView;->showConsole(I)V

    goto :goto_1

    .line 817
    :cond_3
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mErrorConsoleContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto :goto_0
.end method

.method protected setUrlTitle(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    .line 712
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 713
    .local v1, url:Ljava/lang/String;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 714
    .local v0, title:Ljava/lang/String;
    const-string v2, "BaseUi"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Load Progress: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getLoadProgress()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "inPageLoad: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0c0059

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 717
    :cond_0
    move-object v0, v1

    .line 719
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 721
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/BaseUi;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 722
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldSetNavigationBarTitle()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 723
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v2, v0}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 729
    :cond_2
    :goto_0
    return-void

    .line 725
    :cond_3
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v2, v1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setUseQuickControls(Z)V
    .locals 3
    .parameter "useQuickControls"

    .prologue
    .line 226
    iput-boolean p1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    .line 227
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setUseQuickControls(Z)V

    .line 229
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    invoke-virtual {v0, v1}, Lcom/android/browser/BottomBar;->setUseQuickControls(Z)V

    .line 233
    :cond_0
    if-eqz p1, :cond_2

    .line 234
    new-instance v0, Lcom/android/browser/PieControl;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-direct {v0, v1, v2, p0}, Lcom/android/browser/PieControl;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;Lcom/android/browser/BaseUi;)V

    iput-object v0, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    .line 235
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/android/browser/PieControl;->attachToContainer(Landroid/widget/FrameLayout;)V

    .line 241
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->updateUrlBarAutoShowManagerTarget()V

    .line 242
    return-void

    .line 237
    :cond_2
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    if-eqz v0, :cond_1

    .line 238
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/android/browser/PieControl;->removeFromContainer(Landroid/widget/FrameLayout;)V

    goto :goto_0
.end method

.method public showActiveTabsPage()V
    .locals 0

    .prologue
    .line 746
    return-void
.end method

.method public showAutoLogin(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 666
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/browser/BaseUi;->updateAutoLogin(Lcom/android/browser/Tab;Z)V

    .line 667
    return-void
.end method

.method protected showBottomBar()V
    .locals 1

    .prologue
    .line 536
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 537
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 539
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->hide()V

    .line 544
    :cond_0
    :goto_0
    return-void

    .line 541
    :cond_1
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->show()V

    goto :goto_0
.end method

.method protected final showBottomBarForDuration(J)V
    .locals 3
    .parameter "duration"

    .prologue
    const/4 v2, 0x2

    .line 929
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 930
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 931
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->showBottomBarMust()V

    .line 932
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 933
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 935
    .end local v0           #msg:Landroid/os/Message;
    :cond_0
    return-void
.end method

.method protected showBottomBarMust()V
    .locals 1

    .prologue
    .line 547
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 548
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0}, Lcom/android/browser/BottomBar;->show()V

    .line 550
    :cond_0
    return-void
.end method

.method public showComboView(Lcom/android/browser/UI$ComboViews;Landroid/os/Bundle;)V
    .locals 4
    .parameter "startingView"
    .parameter "extras"

    .prologue
    .line 601
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    const-class v3, Lcom/android/browser/ComboViewActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 602
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "initial_view"

    invoke-virtual {p1}, Lcom/android/browser/UI$ComboViews;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 603
    const-string v2, "combo_args"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 604
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v1

    .line 605
    .local v1, t:Lcom/android/browser/Tab;
    if-eqz v1, :cond_0

    .line 606
    const-string v2, "url"

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 608
    :cond_0
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 609
    return-void
.end method

.method public showCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 3
    .parameter "view"
    .parameter "requestedOrientation"
    .parameter "callback"

    .prologue
    .line 615
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 616
    invoke-interface {p3}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 630
    :goto_0
    return-void

    .line 620
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    iput v1, p0, Lcom/android/browser/BaseUi;->mOriginalOrientation:I

    .line 621
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 622
    .local v0, decor:Landroid/widget/FrameLayout;
    new-instance v1, Lcom/android/browser/BaseUi$FullscreenHolder;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/android/browser/BaseUi$FullscreenHolder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/browser/BaseUi;->mFullscreenContainer:Landroid/widget/FrameLayout;

    .line 623
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mFullscreenContainer:Landroid/widget/FrameLayout;

    sget-object v2, Lcom/android/browser/BaseUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v1, p1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 624
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mFullscreenContainer:Landroid/widget/FrameLayout;

    sget-object v2, Lcom/android/browser/BaseUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 625
    iput-object p1, p0, Lcom/android/browser/BaseUi;->mCustomView:Landroid/view/View;

    .line 626
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/browser/BaseUi;->setFullscreen(Z)V

    .line 627
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    check-cast v1, Lcom/android/browser/BrowserWebView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserWebView;->setVisibility(I)V

    .line 628
    iput-object p3, p0, Lcom/android/browser/BaseUi;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 629
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, p2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public showMaxTabsWarning()V
    .locals 4

    .prologue
    .line 846
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0c018f

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 849
    .local v0, warning:Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 850
    return-void
.end method

.method protected showTitleBar()V
    .locals 2

    .prologue
    .line 512
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 513
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->canShowTitleBar()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 514
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->show()V

    .line 517
    :cond_0
    const-wide/16 v0, 0xfa0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/BaseUi;->showBottomBarForDuration(J)V

    .line 518
    return-void
.end method

.method protected final showTitleBarForDuration()V
    .locals 2

    .prologue
    .line 919
    const-wide/16 v0, 0x7d0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/BaseUi;->showTitleBarForDuration(J)V

    .line 920
    return-void
.end method

.method protected final showTitleBarForDuration(J)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 923
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->showTitleBar()V

    .line 924
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 925
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 926
    return-void
.end method

.method public showVoiceTitleBar(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .parameter "title"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 578
    .local p2, results:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0, p1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 579
    return-void
.end method

.method public showWeb(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 958
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->hideCustomView()V

    .line 959
    return-void
.end method

.method public stopEditingUrl()V
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getNavigationBar()Lcom/android/browser/NavigationBarBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/NavigationBarBase;->stopEditingUrl()V

    .line 569
    return-void
.end method

.method public suggestHideTitleBar()V
    .locals 1

    .prologue
    .line 912
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->isLoading()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->wantsToBeVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BaseUi;->mNavigationBar:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0}, Lcom/android/browser/NavigationBarBase;->isMenuShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 914
    invoke-virtual {p0}, Lcom/android/browser/BaseUi;->hideTitleBarOnly()V

    .line 916
    :cond_0
    return-void
.end method

.method protected updateAutoLogin(Lcom/android/browser/Tab;Z)V
    .locals 1
    .parameter "tab"
    .parameter "animate"

    .prologue
    .line 680
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/TitleBar;->updateAutoLogin(Lcom/android/browser/Tab;Z)V

    .line 681
    return-void
.end method

.method public updateBottomBarState(ZZZ)V
    .locals 0
    .parameter "pageCanScroll"
    .parameter "back"
    .parameter "forward"

    .prologue
    .line 1017
    return-void
.end method

.method protected updateLockIconToLatest(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "t"

    .prologue
    .line 687
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 688
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSecurityState()Lcom/android/browser/Tab$SecurityState;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/browser/BaseUi;->updateLockIconImage(Lcom/android/browser/Tab$SecurityState;)V

    .line 690
    :cond_0
    return-void
.end method

.method public updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V
    .locals 0
    .parameter "tab"
    .parameter "menu"

    .prologue
    .line 763
    return-void
.end method

.method protected updateNavigationState(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 677
    return-void
.end method

.method public updateTabs(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/Tab;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 349
    .local p1, tabs:Ljava/util/List;,"Ljava/util/List<Lcom/android/browser/Tab;>;"
    return-void
.end method

.method protected updateUrlBarAutoShowManagerTarget()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 335
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 336
    .local v0, web:Landroid/webkit/WebView;
    :goto_0
    iget-boolean v2, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-nez v2, :cond_1

    instance-of v2, v0, Lcom/android/browser/BrowserWebView;

    if-eqz v2, :cond_1

    .line 337
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUrlBarAutoShowManager:Lcom/android/browser/UrlBarAutoShowManager;

    check-cast v0, Lcom/android/browser/BrowserWebView;

    .end local v0           #web:Landroid/webkit/WebView;
    invoke-virtual {v1, v0}, Lcom/android/browser/UrlBarAutoShowManager;->setTarget(Lcom/android/browser/BrowserWebView;)V

    .line 341
    :goto_1
    return-void

    :cond_0
    move-object v0, v1

    .line 335
    goto :goto_0

    .line 339
    .restart local v0       #web:Landroid/webkit/WebView;
    :cond_1
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mUrlBarAutoShowManager:Lcom/android/browser/UrlBarAutoShowManager;

    invoke-virtual {v2, v1}, Lcom/android/browser/UrlBarAutoShowManager;->setTarget(Lcom/android/browser/BrowserWebView;)V

    goto :goto_1
.end method
