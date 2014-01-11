.class public Lcom/android/browser/NavScreen;
.super Landroid/widget/RelativeLayout;
.source "NavScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Lcom/android/browser/TabControl$OnThumbnailUpdatedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/NavScreen$TabAdapter;
    }
.end annotation


# instance fields
.field mActivity:Landroid/app/Activity;

.field mAdapter:Lcom/android/browser/NavScreen$TabAdapter;

.field mBookmarks:Landroid/widget/ImageButton;

.field mCloseTab:Landroid/widget/ImageButton;

.field mFavicon:Landroid/widget/ImageView;

.field mForward:Landroid/widget/ImageButton;

.field mHolder:Landroid/widget/FrameLayout;

.field mMore:Landroid/widget/ImageButton;

.field mNeedsMenu:Z

.field mNewTab:Landroid/widget/ImageButton;

.field mOrientation:I

.field mPopup:Landroid/widget/PopupMenu;

.field mRefresh:Landroid/widget/ImageButton;

.field mScroller:Lcom/android/browser/NavTabScroller;

.field mTab:Lcom/android/browser/Tab;

.field mTabViews:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/browser/Tab;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field mTitle:Landroid/widget/TextView;

.field mUi:Lcom/android/browser/PhoneUi;

.field mUiController:Lcom/android/browser/UiController;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/browser/UiController;Lcom/android/browser/PhoneUi;)V
    .locals 1
    .parameter "activity"
    .parameter "ctl"
    .parameter "ui"

    .prologue
    .line 75
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 76
    iput-object p1, p0, Lcom/android/browser/NavScreen;->mActivity:Landroid/app/Activity;

    .line 77
    iput-object p2, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    .line 78
    iput-object p3, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    .line 79
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/android/browser/NavScreen;->mOrientation:I

    .line 80
    invoke-direct {p0}, Lcom/android/browser/NavScreen;->init()V

    .line 81
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/NavScreen;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/android/browser/NavScreen;->onCloseTab(Lcom/android/browser/Tab;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/browser/NavScreen;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/android/browser/NavScreen;->switchToTab(Lcom/android/browser/Tab;)V

    return-void
.end method

.method private init()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 139
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v4, 0x7f040021

    invoke-virtual {v1, v4, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 140
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0c0046

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/NavScreen;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 142
    const v1, 0x7f0d002d

    invoke-virtual {p0, v1}, Lcom/android/browser/NavScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mBookmarks:Landroid/widget/ImageButton;

    .line 143
    const v1, 0x7f0d005e

    invoke-virtual {p0, v1}, Lcom/android/browser/NavScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mNewTab:Landroid/widget/ImageButton;

    .line 144
    const v1, 0x7f0d005f

    invoke-virtual {p0, v1}, Lcom/android/browser/NavScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mMore:Landroid/widget/ImageButton;

    .line 145
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mBookmarks:Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mNewTab:Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mMore:Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    const v1, 0x7f0d005c

    invoke-virtual {p0, v1}, Lcom/android/browser/NavScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/browser/NavTabScroller;

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    .line 149
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    .line 150
    .local v0, tc:Lcom/android/browser/TabControl;
    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mTabViews:Ljava/util/HashMap;

    .line 151
    new-instance v1, Lcom/android/browser/NavScreen$TabAdapter;

    iget-object v4, p0, Lcom/android/browser/NavScreen;->mContext:Landroid/content/Context;

    invoke-direct {v1, p0, v4, v0}, Lcom/android/browser/NavScreen$TabAdapter;-><init>(Lcom/android/browser/NavScreen;Landroid/content/Context;Lcom/android/browser/TabControl;)V

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mAdapter:Lcom/android/browser/NavScreen$TabAdapter;

    .line 152
    iget-object v4, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    iget v1, p0, Lcom/android/browser/NavScreen;->mOrientation:I

    const/4 v5, 0x2

    if-ne v1, v5, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Lcom/android/browser/NavTabScroller;->setOrientation(I)V

    .line 155
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    iget-object v4, p0, Lcom/android/browser/NavScreen;->mAdapter:Lcom/android/browser/NavScreen$TabAdapter;

    iget-object v5, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v5}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v5

    iget-object v6, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    invoke-virtual {v6}, Lcom/android/browser/PhoneUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Lcom/android/browser/NavTabScroller;->setAdapter(Landroid/widget/BaseAdapter;I)V

    .line 157
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    new-instance v4, Lcom/android/browser/NavScreen$1;

    invoke-direct {v4, p0}, Lcom/android/browser/NavScreen$1;-><init>(Lcom/android/browser/NavScreen;)V

    invoke-virtual {v1, v4}, Lcom/android/browser/NavTabScroller;->setOnRemoveListener(Lcom/android/browser/NavTabScroller$OnRemoveListener;)V

    .line 163
    invoke-virtual {p0}, Lcom/android/browser/NavScreen;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v1

    if-nez v1, :cond_2

    :goto_1
    iput-boolean v3, p0, Lcom/android/browser/NavScreen;->mNeedsMenu:Z

    .line 164
    iget-boolean v1, p0, Lcom/android/browser/NavScreen;->mNeedsMenu:Z

    if-nez v1, :cond_0

    .line 165
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mMore:Landroid/widget/ImageButton;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 167
    :cond_0
    return-void

    :cond_1
    move v1, v3

    .line 152
    goto :goto_0

    :cond_2
    move v3, v2

    .line 163
    goto :goto_1
.end method

.method private onCloseTab(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "tab"

    .prologue
    .line 181
    if-eqz p1, :cond_1

    .line 182
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    if-ne p1, v1, :cond_2

    .line 183
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->closeCurrentTab()V

    .line 189
    :goto_0
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mTabViews:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 190
    .local v0, image:Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 191
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 193
    :cond_0
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mTabViews:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .end local v0           #image:Landroid/widget/ImageView;
    :cond_1
    return-void

    .line 185
    :cond_2
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1, p1}, Lcom/android/browser/UiController;->closeTab(Lcom/android/browser/Tab;)V

    goto :goto_0
.end method

.method private openNewTab()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 200
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v4, v4, v4}, Lcom/android/browser/UiController;->openTab(Ljava/lang/String;ZZZ)Lcom/android/browser/Tab;

    move-result-object v0

    .line 202
    .local v0, tab:Lcom/android/browser/Tab;
    if-eqz v0, :cond_0

    .line 203
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/android/browser/UiController;->setBlockEvents(Z)V

    .line 204
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    iget-object v2, v2, Lcom/android/browser/BaseUi;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v2, v0}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v1

    .line 205
    .local v1, tix:I
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    new-instance v3, Lcom/android/browser/NavScreen$2;

    invoke-direct {v3, p0, v1, v0}, Lcom/android/browser/NavScreen$2;-><init>(Lcom/android/browser/NavScreen;ILcom/android/browser/Tab;)V

    invoke-virtual {v2, v3}, Lcom/android/browser/NavTabScroller;->setOnLayoutListener(Lcom/android/browser/NavTabScroller$OnLayoutListener;)V

    .line 213
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v2, v1}, Lcom/android/browser/NavTabScroller;->handleDataChanged(I)V

    .line 214
    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v2, v4}, Lcom/android/browser/UiController;->setBlockEvents(Z)V

    .line 216
    .end local v1           #tix:I
    :cond_0
    return-void
.end method

.method private switchToTab(Lcom/android/browser/Tab;)V
    .locals 1
    .parameter "tab"

    .prologue
    .line 219
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    invoke-virtual {v0}, Lcom/android/browser/PhoneUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0, p1}, Lcom/android/browser/UiController;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 222
    :cond_0
    return-void
.end method


# virtual methods
.method protected close(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 225
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/browser/NavScreen;->close(IZ)V

    .line 226
    return-void
.end method

.method protected close(IZ)V
    .locals 1
    .parameter "position"
    .parameter "animate"

    .prologue
    .line 229
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/PhoneUi;->hideNavScreen(IZ)V

    .line 230
    return-void
.end method

.method protected getTabView(I)Lcom/android/browser/NavTabView;
    .locals 1
    .parameter "pos"

    .prologue
    .line 233
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v0, p1}, Lcom/android/browser/NavTabScroller;->getTabView(I)Lcom/android/browser/NavTabView;

    move-result-object v0

    return-object v0
.end method

.method protected getToolbarHeight()F
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b002f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 171
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mBookmarks:Landroid/widget/ImageButton;

    if-ne v0, p1, :cond_1

    .line 172
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    sget-object v1, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    invoke-interface {v0, v1}, Lcom/android/browser/UiController;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 173
    :cond_1
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mNewTab:Landroid/widget/ImageButton;

    if-ne v0, p1, :cond_2

    .line 174
    invoke-direct {p0}, Lcom/android/browser/NavScreen;->openNewTab()V

    goto :goto_0

    .line 175
    :cond_2
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mMore:Landroid/widget/ImageButton;

    if-ne v0, p1, :cond_0

    .line 176
    invoke-virtual {p0}, Lcom/android/browser/NavScreen;->showMenu()V

    goto :goto_0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .parameter "newconfig"

    .prologue
    .line 119
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iget v2, p0, Lcom/android/browser/NavScreen;->mOrientation:I

    if-eq v1, v2, :cond_1

    .line 120
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v1}, Lcom/android/browser/NavTabScroller;->getScrollValue()I

    move-result v0

    .line 121
    .local v0, sv:I
    invoke-virtual {p0}, Lcom/android/browser/NavScreen;->removeAllViews()V

    .line 122
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->dismiss()V

    .line 126
    :cond_0
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iput v1, p0, Lcom/android/browser/NavScreen;->mOrientation:I

    .line 127
    invoke-direct {p0}, Lcom/android/browser/NavScreen;->init()V

    .line 128
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v1, v0}, Lcom/android/browser/NavTabScroller;->setScrollValue(I)V

    .line 129
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mAdapter:Lcom/android/browser/NavScreen$TabAdapter;

    invoke-virtual {v1}, Lcom/android/browser/NavScreen$TabAdapter;->notifyDataSetChanged()V

    .line 131
    .end local v0           #sv:I
    :cond_1
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0, p1}, Lcom/android/browser/UiController;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onThumbnailUpdated(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "t"

    .prologue
    .line 289
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mTabViews:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 290
    .local v0, v:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 291
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 293
    :cond_0
    return-void
.end method

.method public refreshAdapter()V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v1}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUi:Lcom/android/browser/PhoneUi;

    invoke-virtual {v2}, Lcom/android/browser/PhoneUi;->getActiveTab()Lcom/android/browser/Tab;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/NavTabScroller;->handleDataChanged(I)V

    .line 136
    return-void
.end method

.method public reload()V
    .locals 2

    .prologue
    .line 87
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v1}, Lcom/android/browser/NavTabScroller;->getScrollValue()I

    move-result v0

    .line 88
    .local v0, sv:I
    invoke-virtual {p0}, Lcom/android/browser/NavScreen;->removeAllViews()V

    .line 89
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    if-eqz v1, :cond_0

    .line 91
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->dismiss()V

    .line 93
    :cond_0
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    iput v1, p0, Lcom/android/browser/NavScreen;->mOrientation:I

    .line 94
    invoke-direct {p0}, Lcom/android/browser/NavScreen;->init()V

    .line 95
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mScroller:Lcom/android/browser/NavTabScroller;

    invoke-virtual {v1, v0}, Lcom/android/browser/NavTabScroller;->setScrollValue(I)V

    .line 96
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mAdapter:Lcom/android/browser/NavScreen$TabAdapter;

    invoke-virtual {v1}, Lcom/android/browser/NavScreen$TabAdapter;->notifyDataSetChanged()V

    .line 97
    return-void
.end method

.method protected showMenu()V
    .locals 4

    .prologue
    .line 100
    new-instance v1, Landroid/widget/PopupMenu;

    iget-object v2, p0, Lcom/android/browser/NavScreen;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/browser/NavScreen;->mMore:Landroid/widget/ImageButton;

    invoke-direct {v1, v2, v3}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    .line 101
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 102
    .local v0, menu:Landroid/view/Menu;
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f100003

    invoke-virtual {v1, v2, v0}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 103
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    iget-object v2, p0, Lcom/android/browser/NavScreen;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v2}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lcom/android/browser/UiController;->updateMenuState(Lcom/android/browser/Tab;Landroid/view/Menu;)V

    .line 104
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 105
    iget-object v1, p0, Lcom/android/browser/NavScreen;->mPopup:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->show()V

    .line 106
    return-void
.end method
