.class public Lcom/android/browser/NavigationBarPhone;
.super Lcom/android/browser/NavigationBarBase;
.source "NavigationBarPhone.java"

# interfaces
.implements Lcom/android/browser/UrlInputView$StateListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Landroid/widget/PopupMenu$OnDismissListener;


# static fields
.field private static mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;


# instance fields
.field private mClearButton:Landroid/widget/ImageView;

.field private mComboIcon:Landroid/view/View;

.field private mIncognitoIcon:Landroid/view/View;

.field private mMagnify:Landroid/widget/ImageView;

.field private mMore:Landroid/view/View;

.field private mNeedsMenu:Z

.field private mOverflowMenuShowing:Z

.field private mPopupMenu:Landroid/widget/PopupMenu;

.field private mRefreshDescription:Ljava/lang/String;

.field private mRefreshDrawable:Landroid/graphics/drawable/Drawable;

.field private mStopButton:Landroid/widget/ImageView;

.field private mStopDescription:Ljava/lang/String;

.field private mStopDrawable:Landroid/graphics/drawable/Drawable;

.field private mTabSwitcher:Landroid/view/View;

.field private mTextfieldBgDrawable:Landroid/graphics/drawable/Drawable;

.field private mTitleContainer:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/android/browser/NavigationBarPhone;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/android/browser/NavigationBarBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    return-void
.end method

.method private onMenuHidden()V
    .locals 1

    .prologue
    .line 210
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/NavigationBarPhone;->mOverflowMenuShowing:Z

    .line 211
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v0}, Lcom/android/browser/BaseUi;->showTitleBarForDuration()V

    .line 212
    return-void
.end method


# virtual methods
.method public isMenuShowing()Z
    .locals 1

    .prologue
    .line 181
    invoke-super {p0}, Lcom/android/browser/NavigationBarBase;->isMenuShowing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/browser/NavigationBarPhone;->mOverflowMenuShowing:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 154
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_2

    .line 155
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v1}, Lcom/android/browser/TitleBar;->isInLoad()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 156
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->stopLoading()V

    .line 177
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v1}, Lcom/android/browser/BaseUi;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 159
    .local v0, web:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarPhone;->stopEditingUrl()V

    .line 161
    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    goto :goto_0

    .line 164
    .end local v0           #web:Landroid/webkit/WebView;
    :cond_2
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    if-ne p1, v1, :cond_3

    .line 165
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    check-cast v1, Lcom/android/browser/PhoneUi;

    invoke-virtual {v1}, Lcom/android/browser/PhoneUi;->toggleNavScreen()V

    goto :goto_0

    .line 166
    :cond_3
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    if-ne v1, p1, :cond_4

    .line 167
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->showMenu(Landroid/view/View;)V

    goto :goto_0

    .line 168
    :cond_4
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    if-ne v1, p1, :cond_5

    .line 169
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 170
    :cond_5
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    if-ne v1, p1, :cond_6

    .line 171
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->showPageInfo()V

    goto :goto_0

    .line 175
    :cond_6
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 204
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    if-ne p1, v0, :cond_0

    .line 205
    invoke-direct {p0}, Lcom/android/browser/NavigationBarPhone;->onMenuHidden()V

    .line 207
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 74
    invoke-super {p0}, Lcom/android/browser/NavigationBarBase;->onFinishInflate()V

    .line 75
    const v1, 0x7f0d008c

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    .line 76
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    const v1, 0x7f0d008e

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    .line 78
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    const v1, 0x7f0d0089

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mMagnify:Landroid/widget/ImageView;

    .line 82
    const v1, 0x7f0d008f

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    .line 83
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    const v1, 0x7f0d005f

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    .line 85
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    const v1, 0x7f0d008b

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    .line 87
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    const v1, 0x7f0d0088

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTitleContainer:Landroid/view/View;

    .line 89
    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarPhone;->setFocusState(Z)V

    .line 90
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarPhone;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 91
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x7f020052

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopDrawable:Landroid/graphics/drawable/Drawable;

    .line 92
    const v1, 0x7f020048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mRefreshDrawable:Landroid/graphics/drawable/Drawable;

    .line 93
    const v1, 0x7f0c019b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopDescription:Ljava/lang/String;

    .line 94
    const v1, 0x7f0c019a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mRefreshDescription:Ljava/lang/String;

    .line 95
    const v1, 0x7f020062

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTextfieldBgDrawable:Landroid/graphics/drawable/Drawable;

    .line 96
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1, p0}, Lcom/android/browser/UrlInputView;->setContainer(Landroid/view/View;)V

    .line 97
    iget-object v1, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v1, p0}, Lcom/android/browser/UrlInputView;->setStateListener(Lcom/android/browser/UrlInputView$StateListener;)V

    .line 98
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarPhone;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/android/browser/NavigationBarPhone;->mNeedsMenu:Z

    .line 99
    const v1, 0x7f0d008a

    invoke-virtual {p0, v1}, Lcom/android/browser/NavigationBarPhone;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mIncognitoIcon:Landroid/view/View;

    .line 100
    return-void

    :cond_0
    move v1, v2

    .line 98
    goto :goto_0
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 5
    .parameter "view"
    .parameter "hasFocus"

    .prologue
    const/4 v4, 0x0

    .line 216
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    if-ne p1, v2, :cond_1

    .line 218
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v2}, Lcom/android/browser/UiController;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v2

    sput-object v2, Lcom/android/browser/NavigationBarPhone;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 219
    sget-object v2, Lcom/android/browser/NavigationBarPhone;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldOverrideFocusContent()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 220
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    invoke-virtual {v2}, Lcom/android/browser/BaseUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 221
    .local v0, activeTab:Lcom/android/browser/Tab;
    if-nez v0, :cond_0

    .line 222
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mBaseUi:Lcom/android/browser/BaseUi;

    iget-object v2, v2, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    .line 224
    :cond_0
    if-eqz v0, :cond_1

    .line 225
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, url:Ljava/lang/String;
    if-eqz p2, :cond_3

    .line 227
    const-string v2, "about:blank"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 228
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v3, "about:blank"

    invoke-virtual {v2, v3, v4}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    .line 233
    :goto_0
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->selectAll()V

    .line 248
    .end local v0           #activeTab:Lcom/android/browser/Tab;
    .end local v1           #url:Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/android/browser/NavigationBarBase;->onFocusChange(Landroid/view/View;Z)V

    .line 249
    return-void

    .line 231
    .restart local v0       #activeTab:Lcom/android/browser/Tab;
    .restart local v1       #url:Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2, v1, v4}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    goto :goto_0

    .line 235
    :cond_3
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarPhone;->setDisplayTitle(Ljava/lang/String;)V

    goto :goto_1

    .line 239
    .end local v0           #activeTab:Lcom/android/browser/Tab;
    .end local v1           #url:Ljava/lang/String;
    :cond_4
    if-eqz p2, :cond_5

    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v3}, Lcom/android/browser/UrlInputView;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 241
    iget-object v3, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    .line 242
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->selectAll()V

    goto :goto_1

    .line 244
    :cond_5
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v2}, Lcom/android/browser/UrlInputView;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/browser/NavigationBarPhone;->setDisplayTitle(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 298
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0, p1}, Lcom/android/browser/UiController;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onProgressStarted()V
    .locals 2

    .prologue
    .line 104
    invoke-super {p0}, Lcom/android/browser/NavigationBarBase;->onProgressStarted()V

    .line 105
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_0

    .line 106
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mStopDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 110
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 113
    :cond_0
    return-void
.end method

.method public onProgressStopped()V
    .locals 2

    .prologue
    .line 117
    invoke-super {p0}, Lcom/android/browser/NavigationBarBase;->onProgressStopped()V

    .line 118
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mRefreshDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mRefreshDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 120
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarPhone;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->getState()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/NavigationBarPhone;->onStateChanged(I)V

    .line 124
    return-void
.end method

.method public onStateChanged(I)V
    .locals 4
    .parameter "state"

    .prologue
    const/4 v0, 0x0

    const/16 v1, 0x8

    .line 254
    packed-switch p1, :pswitch_data_0

    .line 287
    :goto_0
    return-void

    .line 256
    :pswitch_0
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 257
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 258
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 259
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mMagnify:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 260
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 261
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mTitleContainer:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 262
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    iget-boolean v3, p0, Lcom/android/browser/NavigationBarPhone;->mNeedsMenu:Z

    if-eqz v3, :cond_0

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    .line 265
    :pswitch_1
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 266
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 267
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 271
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mMagnify:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 272
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 273
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 274
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mTitleContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTextfieldBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 277
    :pswitch_2
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mComboIcon:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 278
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mStopButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 279
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mClearButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 281
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mMagnify:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 282
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mTabSwitcher:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 283
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mMore:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 284
    iget-object v0, p0, Lcom/android/browser/NavigationBarPhone;->mTitleContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mTextfieldBgDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 254
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onTabDataChanged(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 291
    invoke-super {p0, p1}, Lcom/android/browser/NavigationBarBase;->onTabDataChanged(Lcom/android/browser/Tab;)V

    .line 292
    iget-object v1, p0, Lcom/android/browser/NavigationBarPhone;->mIncognitoIcon:Landroid/view/View;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 294
    return-void

    .line 292
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method setDisplayTitle(Ljava/lang/String;)V
    .locals 3
    .parameter "title"

    .prologue
    const/4 v2, 0x0

    .line 133
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0, p1}, Lcom/android/browser/UrlInputView;->setTag(Ljava/lang/Object;)V

    .line 134
    invoke-virtual {p0}, Lcom/android/browser/NavigationBarPhone;->isEditingUrl()Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    if-nez p1, :cond_1

    .line 136
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const v1, 0x7f0c004a

    invoke-virtual {v0, v1}, Lcom/android/browser/UrlInputView;->setText(I)V

    .line 148
    :goto_0
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-virtual {v0, v2}, Lcom/android/browser/UrlInputView;->setSelection(I)V

    .line 150
    :cond_0
    return-void

    .line 141
    :cond_1
    const-string v0, "about:blank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 142
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    const-string v1, "about:blank"

    invoke-static {v1}, Lcom/android/browser/UrlUtils;->stripUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    goto :goto_0

    .line 144
    :cond_2
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase;->mUrlInput:Lcom/android/browser/UrlInputView;

    invoke-static {p1}, Lcom/android/browser/UrlUtils;->stripUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/UrlInputView;->setText(Ljava/lang/CharSequence;Z)V

    goto :goto_0
.end method

.method showMenu(Landroid/view/View;)V
    .locals 4
    .parameter "anchor"

    .prologue
    .line 185
    iget-object v2, p0, Lcom/android/browser/NavigationBarBase;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v2}, Lcom/android/browser/UiController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 186
    .local v0, activity:Landroid/app/Activity;
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    if-nez v2, :cond_1

    .line 187
    new-instance v2, Landroid/widget/PopupMenu;

    iget-object v3, p0, Lcom/android/browser/NavigationBarBase;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 188
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 189
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2, p0}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 190
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 191
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 200
    :cond_0
    :goto_0
    return-void

    .line 195
    :cond_1
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    .line 196
    .local v1, menu:Landroid/view/Menu;
    invoke-virtual {v0, v1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/browser/NavigationBarPhone;->mOverflowMenuShowing:Z

    .line 198
    iget-object v2, p0, Lcom/android/browser/NavigationBarPhone;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->show()V

    goto :goto_0
.end method
