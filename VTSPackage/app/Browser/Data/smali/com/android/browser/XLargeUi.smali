.class public Lcom/android/browser/XLargeUi;
.super Lcom/android/browser/BaseUi;
.source "XLargeUi.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "XLargeUi"


# instance fields
.field private mActionBar:Landroid/app/ActionBar;

.field private mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

.field private mHandler:Landroid/os/Handler;

.field private mNavBar:Lcom/android/browser/NavigationBarTablet;

.field private mTabBar:Lcom/android/browser/TabBar;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V
    .locals 3
    .parameter "browser"
    .parameter "controller"

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/android/browser/BaseUi;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/browser/XLargeUi;->mHandler:Landroid/os/Handler;

    .line 62
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getNavigationBar()Lcom/android/browser/NavigationBarBase;

    move-result-object v0

    check-cast v0, Lcom/android/browser/NavigationBarTablet;

    iput-object v0, p0, Lcom/android/browser/XLargeUi;->mNavBar:Lcom/android/browser/NavigationBarTablet;

    .line 63
    new-instance v0, Lcom/android/browser/TabBar;

    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-direct {v0, v1, v2, p0}, Lcom/android/browser/TabBar;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;Lcom/android/browser/XLargeUi;)V

    iput-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    .line 64
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    .line 65
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->setupActionBar()V

    .line 66
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->useQuickControls()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/XLargeUi;->setUseQuickControls(Z)V

    .line 67
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/XLargeUi;)Landroid/app/ActionBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    return-object v0
.end method

.method private checkHideActionBar()V
    .locals 2

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/browser/XLargeUi$1;

    invoke-direct {v1, p0}, Lcom/android/browser/XLargeUi$1;-><init>(Lcom/android/browser/XLargeUi;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 104
    :cond_0
    return-void
.end method

.method private getFaviconBackground()Landroid/graphics/drawable/Drawable;
    .locals 3

    .prologue
    .line 282
    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

    if-nez v1, :cond_0

    .line 283
    new-instance v1, Landroid/graphics/drawable/PaintDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/PaintDrawable;-><init>()V

    iput-object v1, p0, Lcom/android/browser/XLargeUi;->mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

    .line 284
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 285
    .local v0, res:Landroid/content/res/Resources;
    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/PaintDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    const v2, 0x7f0a0008

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 287
    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

    const v2, 0x7f0b0021

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/PaintDrawable;->setCornerRadius(F)V

    .line 290
    .end local v0           #res:Landroid/content/res/Resources;
    :cond_0
    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mFaviconBackground:Landroid/graphics/drawable/PaintDrawable;

    return-object v1
.end method

.method private isTypingKey(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "evt"

    .prologue
    .line 269
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setupActionBar()V
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 71
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 72
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 73
    return-void
.end method


# virtual methods
.method public addTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabBar;->onNewTab(Lcom/android/browser/Tab;)V

    .line 140
    return-void
.end method

.method public dispatchKey(ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "code"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 246
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    if-eqz v4, :cond_1

    .line 247
    iget-object v4, p0, Lcom/android/browser/BaseUi;->mActiveTab:Lcom/android/browser/Tab;

    invoke-virtual {v4}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    .line 248
    .local v1, web:Landroid/webkit/WebView;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_1

    .line 249
    sparse-switch p1, :sswitch_data_0

    .line 258
    :cond_0
    const/16 v4, 0x1000

    invoke-virtual {p2, v4}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v0

    .line 259
    .local v0, ctrl:Z
    if-nez v0, :cond_1

    invoke-direct {p0, p2}, Lcom/android/browser/XLargeUi;->isTypingKey(Landroid/view/KeyEvent;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v4}, Lcom/android/browser/TitleBar;->isEditingUrl()Z

    move-result v4

    if-nez v4, :cond_1

    .line 260
    invoke-virtual {p0, v2, v3}, Lcom/android/browser/XLargeUi;->editUrl(ZZ)V

    .line 261
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v2, p2}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    .line 265
    .end local v0           #ctrl:Z
    .end local v1           #web:Landroid/webkit/WebView;
    :goto_0
    return v2

    .line 253
    .restart local v1       #web:Landroid/webkit/WebView;
    :sswitch_0
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/webkit/WebView;->hasFocus()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v4}, Lcom/android/browser/TitleBar;->hasFocus()Z

    move-result v4

    if-nez v4, :cond_0

    .line 254
    invoke-virtual {p0, v3, v3}, Lcom/android/browser/XLargeUi;->editUrl(ZZ)V

    goto :goto_0

    .end local v1           #web:Landroid/webkit/WebView;
    :cond_1
    move v2, v3

    .line 265
    goto :goto_0

    .line 249
    nop

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_0
        0x15 -> :sswitch_0
        0x3d -> :sswitch_0
    .end sparse-switch
.end method

.method public editUrl(ZZ)V
    .locals 2
    .parameter "clearInput"
    .parameter "forceIME"

    .prologue
    .line 191
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setShowProgressOnly(Z)V

    .line 194
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/browser/BaseUi;->editUrl(ZZ)V

    .line 195
    return-void
.end method

.method getContentWidth()I
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    .line 186
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 7
    .parameter "icon"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x2

    .line 295
    new-array v6, v2, [Landroid/graphics/drawable/Drawable;

    .line 296
    .local v6, array:[Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->getFaviconBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aput-object v4, v6, v3

    .line 297
    if-nez p1, :cond_0

    .line 298
    iget-object v3, p0, Lcom/android/browser/BaseUi;->mGenericFavicon:Landroid/graphics/drawable/Drawable;

    aput-object v3, v6, v1

    .line 302
    :goto_0
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v0, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .local v0, d:Landroid/graphics/drawable/LayerDrawable;
    move v3, v2

    move v4, v2

    move v5, v2

    .line 303
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 304
    return-object v0

    .line 300
    .end local v0           #d:Landroid/graphics/drawable/LayerDrawable;
    :cond_0
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v4, p0, Lcom/android/browser/BaseUi;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    aput-object v3, v6, v1

    goto :goto_0
.end method

.method getTabBar()Lcom/android/browser/TabBar;
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    return-object v0
.end method

.method public onActionModeFinished(Z)V
    .locals 2
    .parameter "inLoad"

    .prologue
    .line 209
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 210
    if-eqz p1, :cond_1

    .line 213
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setShowProgressOnly(Z)V

    .line 216
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/XLargeUi;->showTitleBar()V

    .line 218
    :cond_1
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 201
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    .line 203
    invoke-virtual {p0}, Lcom/android/browser/XLargeUi;->hideTitleBar()V

    .line 205
    :cond_0
    return-void
.end method

.method protected onAddTabCompleted(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 143
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 144
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 115
    invoke-virtual {p0}, Lcom/android/browser/XLargeUi;->hideTitleBar()V

    .line 116
    return-void
.end method

.method public onHideCustomView()V
    .locals 0

    .prologue
    .line 240
    invoke-super {p0}, Lcom/android/browser/BaseUi;->onHideCustomView()V

    .line 241
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 242
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 127
    const v1, 0x7f0d00b8

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 128
    .local v0, bm:Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 129
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 131
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method protected onRemoveTabCompleted(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 179
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 180
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 108
    invoke-super {p0}, Lcom/android/browser/BaseUi;->onResume()V

    .line 109
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mNavBar:Lcom/android/browser/NavigationBarTablet;

    invoke-virtual {v0}, Lcom/android/browser/NavigationBarTablet;->clearCompletions()V

    .line 110
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 111
    return-void
.end method

.method public removeTab(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    const/4 v1, 0x1

    .line 171
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->cancelTitleBarAnimation(Z)V

    .line 172
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    .line 173
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->removeTab(Lcom/android/browser/Tab;)V

    .line 174
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabBar;->onRemoveTab(Lcom/android/browser/Tab;)V

    .line 175
    iget-object v0, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    .line 176
    return-void
.end method

.method public setActiveTab(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    const/4 v2, 0x1

    .line 148
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v2}, Lcom/android/browser/TitleBar;->cancelTitleBarAnimation(Z)V

    .line 149
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1, v2}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    .line 150
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 151
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserWebView;

    .line 154
    .local v0, view:Lcom/android/browser/BrowserWebView;
    if-nez v0, :cond_0

    .line 155
    const-string v1, "XLargeUi"

    const-string v2, "active tab with no webview detected"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    :goto_0
    return-void

    .line 158
    :cond_0
    iget-object v1, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {v1, p1}, Lcom/android/browser/TabBar;->onSetActiveTab(Lcom/android/browser/Tab;)V

    .line 159
    invoke-virtual {p0, p1}, Lcom/android/browser/XLargeUi;->updateLockIconToLatest(Lcom/android/browser/Tab;)V

    .line 160
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/TitleBar;->setSkipTitleBarAnimations(Z)V

    goto :goto_0
.end method

.method public setFavicon(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 234
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->setFavicon(Lcom/android/browser/Tab;)V

    .line 235
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getFavicon()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/android/browser/TabBar;->onFavicon(Lcom/android/browser/Tab;Landroid/graphics/Bitmap;)V

    .line 236
    return-void
.end method

.method public setUrlTitle(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 227
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->setUrlTitle(Lcom/android/browser/Tab;)V

    .line 228
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/android/browser/TabBar;->onUrlAndTitle(Lcom/android/browser/Tab;Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method public setUseQuickControls(Z)V
    .locals 4
    .parameter "useQuickControls"

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/android/browser/BaseUi;->setUseQuickControls(Z)V

    .line 85
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 86
    if-nez p1, :cond_0

    .line 87
    iget-object v2, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v2}, Landroid/app/ActionBar;->show()V

    .line 89
    :cond_0
    iget-object v2, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    iget-boolean v3, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    invoke-virtual {v2, v3}, Lcom/android/browser/TabBar;->setUseQuickControls(Z)V

    .line 91
    iget-object v2, p0, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getTabs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/Tab;

    .line 92
    .local v1, t:Lcom/android/browser/Tab;
    invoke-virtual {v1}, Lcom/android/browser/Tab;->updateShouldCaptureThumbnails()V

    goto :goto_0

    .line 94
    .end local v1           #t:Lcom/android/browser/Tab;
    :cond_1
    return-void
.end method

.method public shouldCaptureThumbnails()Z
    .locals 1

    .prologue
    .line 278
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    return v0
.end method

.method public showComboView(Lcom/android/browser/UI$ComboViews;Landroid/os/Bundle;)V
    .locals 1
    .parameter "startWith"
    .parameter "extras"

    .prologue
    .line 76
    invoke-super {p0, p1, p2}, Lcom/android/browser/BaseUi;->showComboView(Lcom/android/browser/UI$ComboViews;Landroid/os/Bundle;)V

    .line 77
    iget-boolean v0, p0, Lcom/android/browser/BaseUi;->mUseQuickControls:Z

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mActionBar:Landroid/app/ActionBar;

    invoke-virtual {v0}, Landroid/app/ActionBar;->show()V

    .line 80
    :cond_0
    return-void
.end method

.method stopWebViewScrolling()V
    .locals 2

    .prologue
    .line 119
    iget-object v1, p0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BrowserWebView;

    .line 120
    .local v0, web:Lcom/android/browser/BrowserWebView;
    if-eqz v0, :cond_0

    .line 121
    invoke-static {v0}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebViewClassic;->stopScroll()V

    .line 123
    :cond_0
    return-void
.end method

.method protected updateNavigationState(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 222
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mNavBar:Lcom/android/browser/NavigationBarTablet;

    invoke-virtual {v0, p1}, Lcom/android/browser/NavigationBarTablet;->updateNavigationState(Lcom/android/browser/Tab;)V

    .line 223
    return-void
.end method

.method public updateTabs(Ljava/util/List;)V
    .locals 1
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
    .line 165
    .local p1, tabs:Ljava/util/List;,"Ljava/util/List<Lcom/android/browser/Tab;>;"
    iget-object v0, p0, Lcom/android/browser/XLargeUi;->mTabBar:Lcom/android/browser/TabBar;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabBar;->updateTabs(Ljava/util/List;)V

    .line 166
    invoke-direct {p0}, Lcom/android/browser/XLargeUi;->checkHideActionBar()V

    .line 167
    return-void
.end method
