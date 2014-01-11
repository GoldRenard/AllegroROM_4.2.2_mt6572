.class public Lcom/android/browser/PhoneUi;
.super Lcom/android/browser/BaseUi;
.source "PhoneUi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/PhoneUi$AnimScreen;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "PhoneUi"

.field private static final MSG_INIT_NAVSCREEN:I = 0x64


# instance fields
.field private mActionBarHeight:I

.field private mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

.field mAnimating:Z

.field private mNavScreen:Lcom/android/browser/NavScreen;

.field private mNavigationBar:Lcom/android/browser/NavigationBarPhone;

.field mShowNav:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V
    .locals 4
    .parameter "browser"
    .parameter "controller"

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/android/browser/BaseUi;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V

    .line 63
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/browser/PhoneUi;->mShowNav:Z

    .line 71
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->useQuickControls()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/browser/PhoneUi;->setUseQuickControls(Z)V

    .line 72
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->getNavigationBar()Lcom/android/browser/NavigationBarBase;

    move-result-object v1

    check-cast v1, Lcom/android/browser/NavigationBarPhone;

    iput-object v1, p0, Lcom/android/browser/PhoneUi;->mNavigationBar:Lcom/android/browser/NavigationBarPhone;

    .line 73
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 74
    .local v0, heightValue:Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 76
    iget v1, v0, Landroid/util/TypedValue;->data:I

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v1

    iput v1, p0, Lcom/android/browser/PhoneUi;->mActionBarHeight:I

    .line 78
    return-void
.end method

.method static synthetic access$400(Lcom/android/browser/PhoneUi;)Lcom/android/browser/PhoneUi$AnimScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/browser/PhoneUi;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->finishAnimationIn()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/browser/PhoneUi;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->finishAnimateOut()V

    return-void
.end method

.method private finishAnimateOut()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 536
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->setOnThumbnailUpdatedListener(Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;)V

    .line 537
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    invoke-virtual {v0, v2}, Lcom/android/browser/NavScreen;->setVisibility(I)V

    .line 538
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 539
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 540
    return-void
.end method

.method private finishAnimationIn()V
    .locals 2

    .prologue
    .line 438
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/android/browser/NavScreen;->sendAccessibilityEvent(I)V

    .line 441
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    iget-object v1, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->setOnThumbnailUpdatedListener(Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;)V

    .line 443
    :cond_0
    return-void
.end method

.method private showingNavScreen()Z
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    invoke-virtual {v0}, Lcom/android/browser/NavScreen;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public dispatchKey(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "code"
    .parameter "event"

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public editUrl(ZZ)V
    .locals 2
    .parameter "clearInput"
    .parameter "forceIME"

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setShowProgressOnly(Z)V

    .line 91
    :cond_0
    iget-boolean v0, p0, Lcom/android/browser/PhoneUi;->mShowNav:Z

    if-eqz v0, :cond_1

    .line 93
    :goto_0
    return-void

    .line 92
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/browser/BaseUi;->editUrl(ZZ)V

    goto :goto_0
.end method

.method protected handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 140
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->handleMessage(Landroid/os/Message;)V

    .line 141
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_1

    .line 142
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Lcom/android/browser/NavScreen;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-direct {v0, v1, v2, p0}, Lcom/android/browser/NavScreen;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;Lcom/android/browser/PhoneUi;)V

    iput-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    .line 144
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    sget-object v2, Lcom/android/browser/PhoneUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/browser/NavScreen;->setVisibility(I)V

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    if-nez v0, :cond_1

    .line 148
    new-instance v0, Lcom/android/browser/PhoneUi$AnimScreen;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/android/browser/PhoneUi$AnimScreen;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    .line 150
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->getTitleBar()Lcom/android/browser/TitleBar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/PhoneUi$AnimScreen;->set(Lcom/android/browser/TitleBar;Landroid/webkit/WebView;)V

    .line 153
    :cond_1
    return-void
.end method

.method hideNavScreen(IZ)V
    .locals 33
    .parameter "position"
    .parameter "animate"

    .prologue
    .line 446
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/PhoneUi;->mShowNav:Z

    .line 447
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v28

    if-nez v28, :cond_0

    .line 533
    :goto_0
    return-void

    .line 448
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v20

    .line 449
    .local v20, tab:Lcom/android/browser/Tab;
    if-eqz v20, :cond_1

    if-nez p2, :cond_4

    .line 450
    :cond_1
    if-eqz v20, :cond_3

    .line 451
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/browser/PhoneUi;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 456
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 457
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->finishAnimateOut()V

    goto :goto_0

    .line 452
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v28

    if-lez v28, :cond_2

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/browser/PhoneUi;->setActiveTab(Lcom/android/browser/Tab;)V

    goto :goto_1

    .line 460
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/android/browser/NavScreen;->getTabView(I)Lcom/android/browser/NavTabView;

    move-result-object v21

    .line 461
    .local v21, tabview:Lcom/android/browser/NavTabView;
    if-nez v21, :cond_6

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v28

    if-lez v28, :cond_5

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/browser/PhoneUi;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 466
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 467
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->finishAnimateOut()V

    goto/16 :goto_0

    .line 470
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Lcom/android/browser/UiController;->setBlockEvents(Z)V

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/browser/UiController;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    if-nez v28, :cond_7

    .line 474
    new-instance v28, Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Lcom/android/browser/PhoneUi$AnimScreen;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    .line 476
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/browser/Tab;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Lcom/android/browser/PhoneUi$AnimScreen;->set(Landroid/graphics/Bitmap;)V

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v28

    if-nez v28, :cond_8

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v29, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v29 .. v29}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v29

    sget-object v30, Lcom/android/browser/PhoneUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual/range {v28 .. v30}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 482
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v28

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v32

    invoke-virtual/range {v28 .. v32}, Landroid/view/View;->layout(IIII)V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/android/browser/NavTabScroller;->finishScroller()V

    .line 485
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    move-object/from16 v22, v0

    .line 486
    .local v22, target:Landroid/widget/ImageView;
    const/16 v24, 0x0

    .line 487
    .local v24, toLeft:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v28

    if-eqz v28, :cond_9

    invoke-virtual/range {v20 .. v20}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/webkit/WebView;->getVisibleTitleHeight()I

    move-result v26

    .line 488
    .local v26, toTop:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v25

    .line 489
    .local v25, toRight:I
    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v27

    .line 490
    .local v27, width:I
    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    .line 491
    .local v11, height:I
    invoke-virtual/range {v21 .. v21}, Lcom/android/browser/NavTabView;->getLeft()I

    move-result v28

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getLeft()I

    move-result v29

    add-int v28, v28, v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/android/browser/NavTabScroller;->getScrollX()I

    move-result v29

    sub-int v8, v28, v29

    .line 492
    .local v8, fromLeft:I
    invoke-virtual/range {v21 .. v21}, Lcom/android/browser/NavTabView;->getTop()I

    move-result v28

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getTop()I

    move-result v29

    add-int v28, v28, v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/android/browser/NavTabScroller;->getScrollY()I

    move-result v29

    sub-int v10, v28, v29

    .line 493
    .local v10, fromTop:I
    add-int v9, v8, v27

    .line 494
    .local v9, fromRight:I
    add-int v7, v10, v11

    .line 495
    .local v7, fromBottom:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v28

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v29, v0

    div-float v16, v28, v29

    .line 496
    .local v16, scaleFactor:F
    int-to-float v0, v11

    move/from16 v28, v0

    mul-float v28, v28, v16

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    add-int v23, v26, v28

    .line 497
    .local v23, toBottom:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setLeft(I)V

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Landroid/widget/ImageView;->setTop(I)V

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setRight(I)V

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setBottom(I)V

    .line 501
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    const/high16 v29, 0x3f80

    #calls: Lcom/android/browser/PhoneUi$AnimScreen;->setScaleFactor(F)V
    invoke-static/range {v28 .. v29}, Lcom/android/browser/PhoneUi$AnimScreen;->access$200(Lcom/android/browser/PhoneUi$AnimScreen;F)V

    .line 502
    new-instance v17, Landroid/animation/AnimatorSet;

    invoke-direct/range {v17 .. v17}, Landroid/animation/AnimatorSet;-><init>()V

    .line 503
    .local v17, set1:Landroid/animation/AnimatorSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v28

    const-string v29, "alpha"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [F

    move-object/from16 v30, v0

    fill-array-data v30, :array_0

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 504
    .local v6, fade2:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v28, v0

    const-string v29, "alpha"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [F

    move-object/from16 v30, v0

    fill-array-data v30, :array_1

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 505
    .local v5, fade1:Landroid/animation/ObjectAnimator;
    const/16 v28, 0x2

    move/from16 v0, v28

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v5, v28, v29

    const/16 v29, 0x1

    aput-object v6, v28, v29

    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 506
    const-wide/16 v28, 0x64

    move-object/from16 v0, v17

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 507
    new-instance v18, Landroid/animation/AnimatorSet;

    invoke-direct/range {v18 .. v18}, Landroid/animation/AnimatorSet;-><init>()V

    .line 508
    .local v18, set2:Landroid/animation/AnimatorSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    const-string v29, "left"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput v8, v30, v31

    const/16 v31, 0x1

    aput v24, v30, v31

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v12

    .line 510
    .local v12, l:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    const-string v29, "top"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput v10, v30, v31

    const/16 v31, 0x1

    aput v26, v30, v31

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v19

    .line 512
    .local v19, t:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    const-string v29, "right"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput v9, v30, v31

    const/16 v31, 0x1

    aput v25, v30, v31

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v14

    .line 514
    .local v14, r:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v28 .. v28}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v28

    const-string v29, "bottom"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput v7, v30, v31

    const/16 v31, 0x1

    aput v23, v30, v31

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 516
    .local v3, b:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v28, v0

    const-string v29, "scaleFactor"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [F

    move-object/from16 v30, v0

    const/16 v31, 0x0

    const/high16 v32, 0x3f80

    aput v32, v30, v31

    const/16 v31, 0x1

    aput v16, v30, v31

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v15

    .line 518
    .local v15, scale:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    const-string v29, "alpha"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [F

    move-object/from16 v30, v0

    fill-array-data v30, :array_2

    invoke-static/range {v28 .. v30}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    .line 519
    .local v13, otheralpha:Landroid/animation/ObjectAnimator;
    const-wide/16 v28, 0x64

    move-wide/from16 v0, v28

    invoke-virtual {v13, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 520
    const/16 v28, 0x5

    move/from16 v0, v28

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v12, v28, v29

    const/16 v29, 0x1

    aput-object v19, v28, v29

    const/16 v29, 0x2

    aput-object v14, v28, v29

    const/16 v29, 0x3

    aput-object v3, v28, v29

    const/16 v29, 0x4

    aput-object v15, v28, v29

    move-object/from16 v0, v18

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 521
    const-wide/16 v28, 0xc8

    move-object/from16 v0, v18

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 522
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 523
    .local v4, combo:Landroid/animation/AnimatorSet;
    const/16 v28, 0x3

    move/from16 v0, v28

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v17, v28, v29

    const/16 v29, 0x1

    aput-object v18, v28, v29

    const/16 v29, 0x2

    aput-object v13, v28, v29

    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 524
    new-instance v28, Lcom/android/browser/PhoneUi$5;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/browser/PhoneUi$5;-><init>(Lcom/android/browser/PhoneUi;)V

    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 532
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0

    .line 487
    .end local v3           #b:Landroid/animation/ObjectAnimator;
    .end local v4           #combo:Landroid/animation/AnimatorSet;
    .end local v5           #fade1:Landroid/animation/ObjectAnimator;
    .end local v6           #fade2:Landroid/animation/ObjectAnimator;
    .end local v7           #fromBottom:I
    .end local v8           #fromLeft:I
    .end local v9           #fromRight:I
    .end local v10           #fromTop:I
    .end local v11           #height:I
    .end local v12           #l:Landroid/animation/ObjectAnimator;
    .end local v13           #otheralpha:Landroid/animation/ObjectAnimator;
    .end local v14           #r:Landroid/animation/ObjectAnimator;
    .end local v15           #scale:Landroid/animation/ObjectAnimator;
    .end local v16           #scaleFactor:F
    .end local v17           #set1:Landroid/animation/AnimatorSet;
    .end local v18           #set2:Landroid/animation/AnimatorSet;
    .end local v19           #t:Landroid/animation/ObjectAnimator;
    .end local v23           #toBottom:I
    .end local v25           #toRight:I
    .end local v26           #toTop:I
    .end local v27           #width:I
    :cond_9
    const/16 v26, 0x0

    goto/16 :goto_2

    .line 503
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data

    .line 504
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 518
    :array_2
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public isWebShowing()Z
    .locals 1

    .prologue
    .line 346
    invoke-super {p0}, Lcom/android/browser/BaseUi;->isWebShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v0

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
    .line 544
    const/4 v0, 0x0

    return v0
.end method

.method public onActionModeFinished(Z)V
    .locals 8
    .parameter "inLoad"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 294
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->isEditingUrl()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 295
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const-string v2, "y"

    const/4 v3, 0x2

    new-array v3, v3, [F

    const/4 v4, 0x0

    iget v5, p0, Lcom/android/browser/PhoneUi;->mActionBarHeight:I

    int-to-float v5, v5

    aput v5, v3, v4

    aput v6, v3, v7

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 296
    .local v0, anim1:Landroid/animation/ObjectAnimator;
    new-instance v1, Lcom/android/browser/PhoneUi$1;

    invoke-direct {v1, p0}, Lcom/android/browser/PhoneUi$1;-><init>(Lcom/android/browser/PhoneUi;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 321
    new-instance v1, Lcom/android/browser/PhoneUi$2;

    invoke-direct {v1, p0}, Lcom/android/browser/PhoneUi$2;-><init>(Lcom/android/browser/PhoneUi;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 327
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/browser/PhoneUi$3;

    invoke-direct {v2, p0, v0}, Lcom/android/browser/PhoneUi$3;-><init>(Lcom/android/browser/PhoneUi;Landroid/animation/ObjectAnimator;)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 336
    .end local v0           #anim1:Landroid/animation/ObjectAnimator;
    :goto_0
    if-eqz p1, :cond_1

    .line 337
    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v1, :cond_0

    .line 338
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v7}, Lcom/android/browser/TitleBar;->setShowProgressOnly(Z)V

    .line 340
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->showTitleBar()V

    .line 342
    :cond_1
    return-void

    .line 333
    :cond_2
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    goto :goto_0
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 285
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->hideTitleBar()V

    .line 290
    :goto_0
    return-void

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lcom/android/browser/PhoneUi;->mActionBarHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    goto :goto_0
.end method

.method public onBackKey()Z
    .locals 2

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/NavScreen;->close(I)V

    .line 99
    const/4 v0, 0x1

    .line 101
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/android/browser/BaseUi;->onBackKey()Z

    move-result v0

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .parameter "config"

    .prologue
    .line 123
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 125
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 126
    .local v0, heightValue:Landroid/util/TypedValue;
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 128
    iget v1, v0, Landroid/util/TypedValue;->data:I

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v1

    iput v1, p0, Lcom/android/browser/PhoneUi;->mActionBarHeight:I

    .line 132
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->isEditingUrl()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->isInCustomActionMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget v2, p0, Lcom/android/browser/PhoneUi;->mActionBarHeight:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 136
    :cond_0
    return-void
.end method

.method public onContextMenuClosed(Landroid/view/Menu;Z)V
    .locals 0
    .parameter "menu"
    .parameter "inLoad"

    .prologue
    .line 276
    if-eqz p2, :cond_0

    .line 277
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->showTitleBar()V

    .line 279
    :cond_0
    return-void
.end method

.method public onContextMenuCreated(Landroid/view/Menu;)V
    .locals 0
    .parameter "menu"

    .prologue
    .line 271
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->hideTitleBar()V

    .line 272
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->hideTitleBar()V

    .line 83
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    .line 261
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0d00c0

    if-eq v0, v1, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0d00c1

    if-eq v0, v1, :cond_0

    .line 264
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v0

    invoke-virtual {p0, v0, v2}, Lcom/android/browser/PhoneUi;->hideNavScreen(IZ)V

    .line 266
    :cond_0
    return v2
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 204
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {p0, v0, p1}, Lcom/android/browser/PhoneUi;->updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V

    .line 205
    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 116
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->getTitleBar()Lcom/android/browser/TitleBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 119
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 357
    invoke-super {p0}, Lcom/android/browser/BaseUi;->onResume()V

    .line 358
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    invoke-virtual {v0}, Lcom/android/browser/NavScreen;->reload()V

    .line 361
    :cond_0
    return-void
.end method

.method public setActiveTab(Lcom/android/browser/Tab;)V
    .locals 5
    .parameter "tab"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 171
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v3}, Lcom/android/browser/TitleBar;->cancelTitleBarAnimation(Z)V

    .line 172
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v3}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    .line 173
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 175
    iget-boolean v1, p0, Lcom/android/browser/PhoneUi;->mShowNav:Z

    if-eqz v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {p0, v1}, Lcom/android/browser/PhoneUi;->detachTab(Lcom/android/browser/Tab;)V

    .line 179
    :cond_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserWebView;

    .line 182
    .local v0, view:Lcom/android/browser/BrowserWebView;
    if-nez v0, :cond_1

    .line 183
    const-string v1, "PhoneUi"

    const-string v2, "active tab with no webview detected"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    :goto_0
    return-void

    .line 187
    :cond_1
    iget-boolean v1, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v1, :cond_2

    .line 188
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mPieControl:Lcom/android/browser/PieControl;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Lcom/android/browser/PieControl;->forceToTop(Landroid/widget/FrameLayout;)V

    .line 189
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserWebView;->setTitleBar(Lcom/android/browser/TitleBar;)V

    .line 190
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v3}, Lcom/android/browser/TitleBar;->setShowProgressOnly(Z)V

    .line 195
    :goto_1
    iget-object v1, p0, Lcom/android/browser/PhoneUi;->mNavigationBar:Lcom/android/browser/NavigationBarPhone;

    invoke-virtual {v1, v4}, Lcom/android/browser/NavigationBarPhone;->onStateChanged(I)V

    .line 196
    invoke-virtual {p0, p1}, Lcom/android/browser/PhoneUi;->updateLockIconToLatest(Lcom/android/browser/Tab;)V

    .line 197
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v4}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    goto :goto_0

    .line 192
    :cond_2
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserWebView;->setTitleBar(Lcom/android/browser/TitleBar;)V

    goto :goto_1
.end method

.method public shouldCaptureThumbnails()Z
    .locals 1

    .prologue
    .line 557
    const/4 v0, 0x1

    return v0
.end method

.method showNavScreen()V
    .locals 30

    .prologue
    .line 365
    const/16 v25, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/PhoneUi;->mShowNav:Z

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    invoke-interface/range {v25 .. v26}, Lcom/android/browser/UiController;->setBlockEvents(Z)V

    .line 367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v25, v0

    if-nez v25, :cond_1

    .line 368
    new-instance v25, Lcom/android/browser/NavScreen;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    move-object/from16 v27, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    move-object/from16 v3, p0

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/NavScreen;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;Lcom/android/browser/PhoneUi;)V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v26, v0

    sget-object v27, Lcom/android/browser/PhoneUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual/range {v25 .. v27}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 375
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/android/browser/Tab;->capture()V

    .line 376
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    if-nez v25, :cond_2

    .line 377
    new-instance v25, Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v26, v0

    invoke-direct/range {v25 .. v26}, Lcom/android/browser/PhoneUi$AnimScreen;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    .line 383
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->getTitleBar()Lcom/android/browser/TitleBar;

    move-result-object v26

    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v27

    invoke-virtual/range {v25 .. v27}, Lcom/android/browser/PhoneUi$AnimScreen;->set(Lcom/android/browser/TitleBar;Landroid/webkit/WebView;)V

    .line 384
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v25

    if-nez v25, :cond_0

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v26, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v26 .. v26}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v26

    sget-object v27, Lcom/android/browser/PhoneUi;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual/range {v25 .. v27}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 387
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual/range {v25 .. v26}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mCustomViewContainer:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v25

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v29

    invoke-virtual/range {v25 .. v29}, Landroid/view/View;->layout(IIII)V

    .line 391
    const/4 v6, 0x0

    .line 392
    .local v6, fromLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/PhoneUi;->getTitleBar()Lcom/android/browser/TitleBar;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lcom/android/browser/TitleBar;->getHeight()I

    move-result v8

    .line 393
    .local v8, fromTop:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v7

    .line 394
    .local v7, fromRight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v5

    .line 395
    .local v5, fromBottom:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const v26, 0x7f0b0032

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v24

    .line 396
    .local v24, width:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const v26, 0x7f0b0033

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 397
    .local v9, height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const v26, 0x7f0b0034

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 398
    .local v11, ntth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v25

    sub-int v25, v25, v24

    div-int/lit8 v18, v25, 0x2

    .line 399
    .local v18, toLeft:I
    add-int v25, v11, v9

    sub-int v25, v5, v25

    div-int/lit8 v25, v25, 0x2

    add-int v20, v25, v11

    .line 400
    .local v20, toTop:I
    add-int v19, v18, v24

    .line 401
    .local v19, toRight:I
    add-int v17, v20, v9

    .line 402
    .local v17, toBottom:I
    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v26

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    div-float v12, v25, v26

    .line 403
    .local v12, scaleFactor:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/browser/PhoneUi;->detachTab(Lcom/android/browser/Tab;)V

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    const/16 v26, 0x8

    invoke-virtual/range {v25 .. v26}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 405
    new-instance v13, Landroid/animation/AnimatorSet;

    invoke-direct {v13}, Landroid/animation/AnimatorSet;-><init>()V

    .line 406
    .local v13, set1:Landroid/animation/AnimatorSet;
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 407
    .local v10, inanim:Landroid/animation/AnimatorSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const-string v26, "left"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput v6, v27, v28

    const/16 v28, 0x1

    aput v18, v27, v28

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v22

    .line 409
    .local v22, tx:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const-string v26, "top"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput v8, v27, v28

    const/16 v28, 0x1

    aput v20, v27, v28

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v23

    .line 411
    .local v23, ty:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const-string v26, "right"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput v7, v27, v28

    const/16 v28, 0x1

    aput v19, v27, v28

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v21

    .line 413
    .local v21, tr:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mContent:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$300(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const-string v26, "bottom"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput v5, v27, v28

    const/16 v28, 0x1

    aput v17, v27, v28

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v15

    .line 415
    .local v15, tb:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mTitle:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$100(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const-string v26, "alpha"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [F

    move-object/from16 v27, v0

    fill-array-data v27, :array_0

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v16

    .line 417
    .local v16, title:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    const-string v26, "scaleFactor"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [F

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/high16 v29, 0x3f80

    aput v29, v27, v28

    const/16 v28, 0x1

    aput v12, v27, v28

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v14

    .line 419
    .local v14, sx:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v25

    const-string v26, "alpha"

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [F

    move-object/from16 v27, v0

    fill-array-data v27, :array_1

    invoke-static/range {v25 .. v27}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 421
    .local v4, blend1:Landroid/animation/ObjectAnimator;
    const-wide/16 v25, 0x64

    move-wide/from16 v0, v25

    invoke-virtual {v4, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 423
    const/16 v25, 0x6

    move/from16 v0, v25

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v22, v25, v26

    const/16 v26, 0x1

    aput-object v23, v25, v26

    const/16 v26, 0x2

    aput-object v21, v25, v26

    const/16 v26, 0x3

    aput-object v15, v25, v26

    const/16 v26, 0x4

    aput-object v14, v25, v26

    const/16 v26, 0x5

    aput-object v16, v25, v26

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 424
    const-wide/16 v25, 0xc8

    move-wide/from16 v0, v25

    invoke-virtual {v10, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 425
    new-instance v25, Lcom/android/browser/PhoneUi$4;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/browser/PhoneUi$4;-><init>(Lcom/android/browser/PhoneUi;)V

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 433
    const/16 v25, 0x2

    move/from16 v0, v25

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v10, v25, v26

    const/16 v26, 0x1

    aput-object v4, v25, v26

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 434
    invoke-virtual {v13}, Landroid/animation/AnimatorSet;->start()V

    .line 435
    return-void

    .line 371
    .end local v4           #blend1:Landroid/animation/ObjectAnimator;
    .end local v5           #fromBottom:I
    .end local v6           #fromLeft:I
    .end local v7           #fromRight:I
    .end local v8           #fromTop:I
    .end local v9           #height:I
    .end local v10           #inanim:Landroid/animation/AnimatorSet;
    .end local v11           #ntth:I
    .end local v12           #scaleFactor:F
    .end local v13           #set1:Landroid/animation/AnimatorSet;
    .end local v14           #sx:Landroid/animation/ObjectAnimator;
    .end local v15           #tb:Landroid/animation/ObjectAnimator;
    .end local v16           #title:Landroid/animation/ObjectAnimator;
    .end local v17           #toBottom:I
    .end local v18           #toLeft:I
    .end local v19           #toRight:I
    .end local v20           #toTop:I
    .end local v21           #tr:Landroid/animation/ObjectAnimator;
    .end local v22           #tx:Landroid/animation/ObjectAnimator;
    .end local v23           #ty:Landroid/animation/ObjectAnimator;
    .end local v24           #width:I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual/range {v25 .. v26}, Lcom/android/browser/NavScreen;->setVisibility(I)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v25, v0

    const/high16 v26, 0x3f80

    invoke-virtual/range {v25 .. v26}, Lcom/android/browser/NavScreen;->setAlpha(F)V

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mNavScreen:Lcom/android/browser/NavScreen;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/android/browser/NavScreen;->refreshAdapter()V

    goto/16 :goto_0

    .line 379
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mMain:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$000(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/view/View;

    move-result-object v25

    const/high16 v26, 0x3f80

    invoke-virtual/range {v25 .. v26}, Landroid/view/View;->setAlpha(F)V

    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    #getter for: Lcom/android/browser/PhoneUi$AnimScreen;->mTitle:Landroid/widget/ImageView;
    invoke-static/range {v25 .. v25}, Lcom/android/browser/PhoneUi$AnimScreen;->access$100(Lcom/android/browser/PhoneUi$AnimScreen;)Landroid/widget/ImageView;

    move-result-object v25

    const/high16 v26, 0x3f80

    invoke-virtual/range {v25 .. v26}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/PhoneUi;->mAnimScreen:Lcom/android/browser/PhoneUi$AnimScreen;

    move-object/from16 v25, v0

    const/high16 v26, 0x3f80

    #calls: Lcom/android/browser/PhoneUi$AnimScreen;->setScaleFactor(F)V
    invoke-static/range {v25 .. v26}, Lcom/android/browser/PhoneUi$AnimScreen;->access$200(Lcom/android/browser/PhoneUi$AnimScreen;F)V

    goto/16 :goto_1

    .line 415
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 419
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public showWeb(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 351
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->showWeb(Z)V

    .line 352
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/android/browser/PhoneUi;->hideNavScreen(IZ)V

    .line 353
    return-void
.end method

.method public toggleNavScreen()V
    .locals 2

    .prologue
    .line 548
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 549
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->showNavScreen()V

    .line 553
    :goto_0
    return-void

    .line 551
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/PhoneUi;->hideNavScreen(IZ)V

    goto :goto_0
.end method

.method public updateBottomBarState(ZZZ)V
    .locals 2
    .parameter "pageCanScroll"
    .parameter "back"
    .parameter "forward"

    .prologue
    .line 158
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mNeedBottomBar:Z

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mBottomBar:Lcom/android/browser/BottomBar;

    invoke-virtual {v0, p2, p3}, Lcom/android/browser/BottomBar;->changeBottomBarState(ZZ)V

    .line 160
    if-nez p1, :cond_1

    .line 161
    invoke-virtual {p0}, Lcom/android/browser/PhoneUi;->hideBottomBar()V

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 163
    :cond_1
    const-wide/16 v0, 0x7d0

    invoke-virtual {p0, v0, v1}, Lcom/android/browser/PhoneUi;->showBottomBarForDuration(J)V

    goto :goto_0
.end method

.method public updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V
    .locals 12
    .parameter "tab"
    .parameter "menu"

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 210
    const v9, 0x7f0d00b8

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 211
    .local v1, bm:Landroid/view/MenuItem;
    if-eqz v1, :cond_0

    .line 212
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-nez v9, :cond_b

    move v9, v10

    :goto_0
    invoke-interface {v1, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 214
    :cond_0
    const v9, 0x7f0d00a1

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 215
    .local v0, abm:Landroid/view/MenuItem;
    if-eqz v0, :cond_1

    .line 216
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v9

    if-nez v9, :cond_c

    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-nez v9, :cond_c

    move v9, v10

    :goto_1
    invoke-interface {v0, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 218
    :cond_1
    const v9, 0x7f0d00ba

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 219
    .local v6, info:Landroid/view/MenuItem;
    if-eqz v6, :cond_2

    .line 220
    invoke-interface {v6, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 222
    :cond_2
    const v9, 0x7f0d00b9

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    .line 223
    .local v8, newtab:Landroid/view/MenuItem;
    if-eqz v8, :cond_3

    iget-boolean v9, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-nez v9, :cond_3

    .line 224
    invoke-interface {v8, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 226
    :cond_3
    const v9, 0x7f0d00b2

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 227
    .local v5, incognito:Landroid/view/MenuItem;
    if-eqz v5, :cond_5

    .line 228
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-nez v9, :cond_4

    iget-boolean v9, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v9, :cond_d

    :cond_4
    move v9, v10

    :goto_2
    invoke-interface {v5, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 232
    :cond_5
    const v9, 0x7f0d00b0

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 233
    .local v4, home:Landroid/view/MenuItem;
    if-eqz v4, :cond_6

    .line 234
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isSnapshot()Z

    move-result v9

    if-nez v9, :cond_e

    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-nez v9, :cond_e

    move v9, v10

    :goto_3
    invoke-interface {v4, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 238
    :cond_6
    const v9, 0x7f0d00b1

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 239
    .local v2, close:Landroid/view/MenuItem;
    if-eqz v2, :cond_7

    .line 240
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-nez v9, :cond_f

    move v9, v10

    :goto_4
    invoke-interface {v2, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 243
    :cond_7
    const v9, 0x7f0d00bf

    invoke-interface {p2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 244
    .local v3, closeOthers:Landroid/view/MenuItem;
    if-eqz v3, :cond_9

    .line 245
    const/4 v7, 0x1

    .line 246
    .local v7, isLastTab:Z
    if-eqz p1, :cond_8

    .line 247
    iget-object v9, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v9}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v9

    if-gt v9, v10, :cond_10

    move v7, v10

    .line 249
    :cond_8
    :goto_5
    if-nez v7, :cond_11

    move v9, v10

    :goto_6
    invoke-interface {v3, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 251
    .end local v7           #isLastTab:Z
    :cond_9
    invoke-direct {p0}, Lcom/android/browser/PhoneUi;->showingNavScreen()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 252
    const v9, 0x7f0d00b3

    invoke-interface {p2, v9, v11}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 253
    const v9, 0x7f0d00bc

    invoke-interface {p2, v9, v11}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 254
    const v9, 0x7f0d00ac

    invoke-interface {p2, v9, v11}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 255
    const v9, 0x7f0d00be

    invoke-interface {p2, v9, v10}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 257
    :cond_a
    return-void

    .end local v0           #abm:Landroid/view/MenuItem;
    .end local v2           #close:Landroid/view/MenuItem;
    .end local v3           #closeOthers:Landroid/view/MenuItem;
    .end local v4           #home:Landroid/view/MenuItem;
    .end local v5           #incognito:Landroid/view/MenuItem;
    .end local v6           #info:Landroid/view/MenuItem;
    .end local v8           #newtab:Landroid/view/MenuItem;
    :cond_b
    move v9, v11

    .line 212
    goto/16 :goto_0

    .restart local v0       #abm:Landroid/view/MenuItem;
    :cond_c
    move v9, v11

    .line 216
    goto/16 :goto_1

    .restart local v5       #incognito:Landroid/view/MenuItem;
    .restart local v6       #info:Landroid/view/MenuItem;
    .restart local v8       #newtab:Landroid/view/MenuItem;
    :cond_d
    move v9, v11

    .line 228
    goto :goto_2

    .restart local v4       #home:Landroid/view/MenuItem;
    :cond_e
    move v9, v11

    .line 234
    goto :goto_3

    .restart local v2       #close:Landroid/view/MenuItem;
    :cond_f
    move v9, v11

    .line 240
    goto :goto_4

    .restart local v3       #closeOthers:Landroid/view/MenuItem;
    .restart local v7       #isLastTab:Z
    :cond_10
    move v7, v11

    .line 247
    goto :goto_5

    :cond_11
    move v9, v11

    .line 249
    goto :goto_6
.end method
