.class public Lcom/android/browser/NavigationBarTablet;
.super Lcom/android/browser/NavigationBarBase;
.source "NavigationBarTablet.java"

# interfaces
.implements Lcom/android/browser/UrlInputView$StateListener;


# instance fields
.field private mAllButton:Landroid/view/View;

.field private mAnimation:Landroid/animation/AnimatorSet;

.field private mBackButton:Landroid/widget/ImageButton;

.field private mClearButton:Landroid/view/View;

.field private mFaviconDrawable:Landroid/graphics/drawable/Drawable;

.field private mFocusDrawable:Landroid/graphics/drawable/Drawable;

.field private mForwardButton:Landroid/widget/ImageButton;

.field private mHideNavButtons:Z

.field private mNavButtons:Landroid/view/View;

.field private mRefreshDescription:Ljava/lang/String;

.field private mReloadDrawable:Landroid/graphics/drawable/Drawable;

.field private mSearchButton:Landroid/widget/ImageView;

.field private mStar:Landroid/widget/ImageView;

.field private mStopButton:Landroid/widget/ImageView;

.field private mStopDescription:Ljava/lang/String;

.field private mStopDrawable:Landroid/graphics/drawable/Drawable;

.field private mUnfocusDrawable:Landroid/graphics/drawable/Drawable;

.field private mUrlContainer:Landroid/view/View;

.field private mUrlIcon:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;)V

    .line 62
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarTablet;->init(Landroid/content/Context;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarTablet;->init(Landroid/content/Context;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 72
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarTablet;->init(Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/NavigationBarTablet;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/browser/NavigationBarTablet;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    iput-object p1, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    return-object p1
.end method

.method private clearOrClose()V
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->clearFocus()V

    .line 197
    :goto_0
    return-void

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private hideNavButtons()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 268
    iget-object v4, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v4}, Lcom/android/browser/BaseUi;->blockFocusAnimations()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 269
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 288
    :goto_0
    return-void

    .line 272
    :cond_0
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 273
    .local v3, awidth:I
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v6, v8, [F

    const/4 v7, 0x0

    aput v7, v6, v9

    neg-int v7, v3

    int-to-float v7, v7

    aput v7, v6, v10

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 274
    .local v0, anim1:Landroid/animation/Animator;
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    const-string v5, "left"

    new-array v6, v8, [I

    iget-object v7, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v7

    aput v7, v6, v9

    iget-object v7, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getPaddingLeft()I

    move-result v7

    aput v7, v6, v10

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 276
    .local v1, anim2:Landroid/animation/Animator;
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v8, [F

    fill-array-data v6, :array_0

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 277
    .local v2, anim3:Landroid/animation/Animator;
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    .line 278
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/Animator;

    aput-object v0, v5, v9

    aput-object v1, v5, v10

    aput-object v2, v5, v8

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 279
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    new-instance v5, Lcom/android/browser/NavigationBarTablet$1;

    invoke-direct {v5, p0}, Lcom/android/browser/NavigationBarTablet$1;-><init>(Lcom/android/browser/NavigationBarTablet;)V

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 286
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    const-wide/16 v5, 0x96

    invoke-virtual {v4, v5, v6}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 287
    iget-object v4, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0

    .line 276
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private init(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 77
    .local v0, resources:Landroid/content/res/Resources;
    const v1, 0x7f020052

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStopDrawable:Landroid/graphics/drawable/Drawable;

    .line 78
    const v1, 0x7f020048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mReloadDrawable:Landroid/graphics/drawable/Drawable;

    .line 79
    const v1, 0x7f0c019b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStopDescription:Ljava/lang/String;

    .line 80
    const v1, 0x7f0c019a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mRefreshDescription:Ljava/lang/String;

    .line 81
    const v1, 0x7f020062

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mFocusDrawable:Landroid/graphics/drawable/Drawable;

    .line 83
    const v1, 0x7f020063

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mUnfocusDrawable:Landroid/graphics/drawable/Drawable;

    .line 85
    const v1, 0x7f090002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    .line 86
    return-void
.end method

.method private showHideStar(Lcom/android/browser/Tab;)V
    .locals 3
    .parameter "tab"

    .prologue
    .line 313
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/browser/Tab;->inForeground()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 314
    const/4 v0, 0x0

    .line 315
    .local v0, starVisibility:I
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 316
    .local v1, url:Ljava/lang/String;
    invoke-static {v1}, Lcom/android/browser/DataUri;->isDataUri(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 317
    const/16 v0, 0x8

    .line 319
    :cond_0
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    .end local v0           #starVisibility:I
    .end local v1           #url:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private showNavButtons()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x2

    const/4 v9, 0x0

    .line 291
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    if-eqz v5, :cond_0

    .line 292
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->cancel()V

    .line 294
    :cond_0
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v5, v9}, Landroid/view/View;->setVisibility(I)V

    .line 295
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 296
    iget-object v5, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v5}, Lcom/android/browser/BaseUi;->blockFocusAnimations()Z

    move-result v5

    if-nez v5, :cond_1

    .line 297
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 298
    .local v3, awidth:I
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    sget-object v6, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v7, v10, [F

    neg-int v8, v3

    int-to-float v8, v8

    aput v8, v7, v9

    aput v12, v7, v11

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 300
    .local v0, anim1:Landroid/animation/Animator;
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    const-string v6, "left"

    new-array v7, v10, [I

    aput v9, v7, v9

    aput v3, v7, v11

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 302
    .local v1, anim2:Landroid/animation/Animator;
    iget-object v5, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v10, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 304
    .local v2, anim3:Landroid/animation/Animator;
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 305
    .local v4, combo:Landroid/animation/AnimatorSet;
    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/Animator;

    aput-object v0, v5, v9

    aput-object v1, v5, v11

    aput-object v2, v5, v10

    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 306
    const-wide/16 v5, 0x96

    invoke-virtual {v4, v5, v6}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 307
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 309
    .end local v0           #anim1:Landroid/animation/Animator;
    .end local v1           #anim2:Landroid/animation/Animator;
    .end local v2           #anim3:Landroid/animation/Animator;
    .end local v3           #awidth:I
    .end local v4           #combo:Landroid/animation/AnimatorSet;
    :cond_1
    return-void

    .line 302
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private stopOrRefresh()V
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    if-nez v0, :cond_1

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 244
    :cond_1
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->isInLoad()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 245
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->stopLoading()V

    goto :goto_0

    .line 247
    :cond_2
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x1

    .line 165
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mBackButton:Landroid/widget/ImageButton;

    if-ne v1, p1, :cond_1

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 166
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/Tab;->goBack()V

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 167
    :cond_1
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mForwardButton:Landroid/widget/ImageButton;

    if-ne v1, p1, :cond_2

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 168
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/Tab;->goForward()V

    goto :goto_0

    .line 169
    :cond_2
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    if-ne v1, p1, :cond_3

    .line 170
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1, v2}, Lcom/android/browser/UiController;->createBookmarkCurrentPageIntent(Z)Landroid/content/Intent;

    move-result-object v0

    .line 171
    .local v0, intent:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarTablet;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 174
    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mAllButton:Landroid/view/View;

    if-ne v1, p1, :cond_4

    .line 175
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    sget-object v2, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    invoke-interface {v1, v2}, Lcom/android/browser/UiController;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    goto :goto_0

    .line 176
    :cond_4
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    if-ne v1, p1, :cond_5

    .line 177
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1, v2, v2}, Lcom/android/browser/BaseUi;->editUrl(ZZ)V

    goto :goto_0

    .line 178
    :cond_5
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    if-ne v1, p1, :cond_6

    .line 179
    invoke-direct {p0}, Lcom/android/browser/NavigationBarTablet;->stopOrRefresh()V

    goto :goto_0

    .line 180
    :cond_6
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    if-ne v1, p1, :cond_7

    .line 181
    invoke-direct {p0}, Lcom/android/browser/NavigationBarTablet;->clearOrClose()V

    goto :goto_0

    .line 185
    :cond_7
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .parameter "config"

    .prologue
    const/16 v3, 0x8

    const/4 v4, 0x0

    .line 117
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 118
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 119
    .local v1, res:Landroid/content/res/Resources;
    const v2, 0x7f090002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    .line 120
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 121
    iget-boolean v2, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    .line 122
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 123
    .local v0, aw:I
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 124
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 125
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    neg-int v3, v0

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 132
    .end local v0           #aw:I
    :cond_0
    :goto_0
    return-void

    .line 126
    :cond_1
    iget-boolean v2, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 127
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 128
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    const/high16 v3, 0x3f80

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 129
    iget-object v2, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 90
    invoke-super {p0}, Lcom/android/browser/NavigationBarBase;->onFinishInflate()V

    .line 91
    const v0, 0x7f0d0094

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mAllButton:Landroid/view/View;

    .line 94
    const v0, 0x7f0d0090

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mNavButtons:Landroid/view/View;

    .line 95
    const v0, 0x7f0d0029

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mBackButton:Landroid/widget/ImageButton;

    .line 96
    const v0, 0x7f0d002a

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mForwardButton:Landroid/widget/ImageButton;

    .line 97
    const v0, 0x7f0d0092

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUrlIcon:Landroid/widget/ImageView;

    .line 98
    const v0, 0x7f0d0057

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    .line 99
    const v0, 0x7f0d008c

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    .line 100
    const v0, 0x7f0d0093

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    .line 101
    const v0, 0x7f0d008e

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    .line 103
    const v0, 0x7f0d0091

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarTablet;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    .line 104
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mBackButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mForwardButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mAllButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setContainer(Landroid/view/View;)V

    .line 113
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0, p0}, Lcom/android/browser/UrlInputView;->setStateListener(Lcom/android/browser/UrlInputView$StateListener;)V

    .line 114
    return-void
.end method

.method public onProgressStarted()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStopDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 256
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mStopDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 257
    return-void
.end method

.method public onProgressStopped()V
    .locals 2

    .prologue
    .line 261
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mReloadDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 262
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mRefreshDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 263
    return-void
.end method

.method public onStateChanged(I)V
    .locals 2
    .parameter "state"

    .prologue
    const/16 v1, 0x8

    .line 326
    packed-switch p1, :pswitch_data_0

    .line 341
    :cond_0
    :goto_0
    return-void

    .line 328
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 332
    :pswitch_1
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 333
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->supportsVoice()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 338
    :pswitch_2
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mClearButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 326
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onTabDataChanged(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "tab"

    .prologue
    .line 154
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 155
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarTablet;->showHideStar(Lcom/android/browser/Tab;)V

    .line 156
    return-void
.end method

.method public setCurrentUrlIsBookmark(Z)V
    .locals 1
    .parameter "isBookmark"

    .prologue
    .line 160
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setActivated(Z)V

    .line 161
    return-void
.end method

.method public setFavicon(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "icon"

    .prologue
    .line 201
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v0, p1}, Lcom/android/browser/BaseUi;->getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mFaviconDrawable:Landroid/graphics/drawable/Drawable;

    .line 202
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarTablet;->updateUrlIcon()V

    .line 203
    return-void
.end method

.method protected setFocusState(Z)V
    .locals 2
    .parameter "focus"

    .prologue
    const/16 v1, 0x8

    .line 218
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->setFocusState(Z)V

    .line 219
    if-eqz p1, :cond_1

    .line 220
    iget-boolean v0, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    if-eqz v0, :cond_0

    .line 221
    invoke-direct {p0}, Lcom/android/browser/NavigationBarTablet;->hideNavButtons()V

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 224
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mStar:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 225
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUrlIcon:Landroid/widget/ImageView;

    const v1, 0x7f02004d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 238
    :goto_0
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mUrlContainer:Landroid/view/View;

    if-eqz p1, :cond_4

    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mFocusDrawable:Landroid/graphics/drawable/Drawable;

    :goto_1
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 240
    return-void

    .line 227
    :cond_1
    iget-boolean v0, p0, Lcom/android/browser/NavigationBarTablet;->mHideNavButtons:Z

    if-eqz v0, :cond_2

    .line 228
    invoke-direct {p0}, Lcom/android/browser/NavigationBarTablet;->showNavButtons()V

    .line 230
    :cond_2
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/browser/NavigationBarTablet;->showHideStar(Lcom/android/browser/Tab;)V

    .line 231
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->useQuickControls()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 232
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 236
    :goto_2
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarTablet;->updateUrlIcon()V

    goto :goto_0

    .line 234
    :cond_3
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mSearchButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 238
    :cond_4
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUnfocusDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1
.end method

.method public setTitleBar(Lcom/android/browser/TitleBar;)V
    .locals 0
    .parameter "titleBar"

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->setTitleBar(Lcom/android/browser/TitleBar;)V

    .line 138
    return-void
.end method

.method updateNavigationState(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 141
    if-eqz p1, :cond_0

    .line 142
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mBackButton:Landroid/widget/ImageButton;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f02001d

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 145
    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mForwardButton:Landroid/widget/ImageButton;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f020032

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 149
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarTablet;->updateUrlIcon()V

    .line 150
    return-void

    .line 142
    :cond_1
    const v0, 0x7f02001b

    goto :goto_0

    .line 145
    :cond_2
    const v0, 0x7f020031

    goto :goto_1
.end method

.method updateUrlIcon()V
    .locals 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUrlIcon:Landroid/widget/ImageView;

    const v1, 0x7f02004d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 214
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mFaviconDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/BaseUi;->getFaviconDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mFaviconDrawable:Landroid/graphics/drawable/Drawable;

    .line 212
    :cond_1
    iget-object v0, p0, Lcom/android/browser/NavigationBarTablet;->mUrlIcon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarTablet;->mFaviconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method
