.class public Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
.super Landroid/widget/TabHost;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/LauncherTransitionable;
.implements Landroid/widget/TabHost$OnTabChangeListener;


# static fields
.field private static final APPS_TAB_TAG:Ljava/lang/String; = "APPS"

.field private static final TAG:Ljava/lang/String; = "Trebuchet.AppsCustomizeTabHost"

.field private static final WIDGETS_TAB_TAG:Ljava/lang/String; = "WIDGETS"


# instance fields
.field private mAnimationBuffer:Landroid/widget/FrameLayout;

.field private mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

.field private mContent:Landroid/widget/LinearLayout;

.field private mFadeScrollingIndicator:Z

.field private mInTransition:Z

.field private mJoinWidgetsApps:Z

.field private final mLayoutInflater:Landroid/view/LayoutInflater;

.field private mRelayoutAndMakeVisible:Ljava/lang/Runnable;

.field private mResetAfterTransition:Z

.field private mTabs:Landroid/view/ViewGroup;

.field private mTabsContainer:Landroid/view/ViewGroup;

.field private mTransitioningToWorkspace:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 67
    new-instance v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mRelayoutAndMakeVisible:Ljava/lang/Runnable;

    .line 75
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getJoinWidgetsApps()Z

    move-result v0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mJoinWidgetsApps:Z

    .line 76
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Indicator;->getFadeScrollingIndicator()Z

    move-result v0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mFadeScrollingIndicator:Z

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/view/ViewGroup;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/view/ViewGroup;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabsContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->reloadCurrentPage()V

    return-void
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedStart()V

    return-void
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedEnd(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    return-void
.end method

.method private enableAndBuildHardwareLayer()V
    .locals 2

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 375
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setLayerType(ILandroid/graphics/Paint;)V

    .line 379
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->buildLayer()V

    .line 381
    :cond_0
    return-void
.end method

.method private onTabChangedEnd(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    .locals 1
    .parameter "type"

    .prologue
    .line 217
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 218
    return-void
.end method

.method private onTabChangedStart()V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->hideScrollingIndicator(Z)V

    .line 206
    return-void
.end method

.method private reloadCurrentPage()V
    .locals 2

    .prologue
    .line 209
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->flashScrollingIndicator(Z)V

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(I)V

    .line 213
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->requestFocus()Z

    .line 214
    return-void
.end method

.method private setVisibilityOfSiblingsWithLowerZOrder(I)V
    .locals 6
    .parameter "visibility"

    .prologue
    .line 461
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 462
    .local v3, parent:Landroid/view/ViewGroup;
    if-nez v3, :cond_1

    .line 480
    :cond_0
    return-void

    .line 464
    :cond_1
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 465
    .local v1, count:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->isChildrenDrawingOrderEnabled()Z

    move-result v4

    if-nez v4, :cond_3

    .line 466
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 467
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 468
    .local v0, child:Landroid/view/View;
    if-eq v0, p0, :cond_0

    .line 471
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_2

    .line 466
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 474
    :cond_2
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 478
    .end local v0           #child:Landroid/view/View;
    .end local v2           #i:I
    :cond_3
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Failed; can\'t get z-order of views"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mContent:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public getContentTypeForTabTag(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;
    .locals 1
    .parameter "tag"

    .prologue
    .line 328
    const-string v0, "APPS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    .line 333
    :goto_0
    return-object v0

    .line 330
    :cond_0
    const-string v0, "WIDGETS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 331
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    goto :goto_0

    .line 333
    :cond_1
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    goto :goto_0
.end method

.method public getDescendantFocusability()I
    .locals 1

    .prologue
    .line 353
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 354
    const/high16 v0, 0x6

    .line 356
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Landroid/widget/TabHost;->getDescendantFocusability()I

    move-result v0

    goto :goto_0
.end method

.method public getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 340
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-ne p1, v0, :cond_0

    .line 341
    const-string v0, "APPS"

    .line 345
    :goto_0
    return-object v0

    .line 342
    :cond_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-ne p1, v0, :cond_1

    .line 343
    const-string v0, "WIDGETS"

    goto :goto_0

    .line 345
    :cond_1
    const-string v0, "APPS"

    goto :goto_0
.end method

.method isTransitioning()Z
    .locals 1

    .prologue
    .line 500
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    return v0
.end method

.method protected onFinishInflate()V
    .locals 14

    .prologue
    const v13, 0x7f04001e

    const/4 v12, 0x0

    .line 106
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setup()V

    .line 108
    const v10, 0x7f070009

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    .line 109
    .local v9, tabsContainer:Landroid/view/ViewGroup;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v8

    .line 110
    .local v8, tabs:Landroid/widget/TabWidget;
    const v10, 0x7f07000c

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    .line 112
    .local v0, appsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;

    .line 113
    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabsContainer:Landroid/view/ViewGroup;

    .line 114
    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    .line 115
    const v10, 0x7f07000d

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout;

    iput-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAnimationBuffer:Landroid/widget/FrameLayout;

    .line 116
    const v10, 0x7f070008

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/LinearLayout;

    iput-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mContent:Landroid/widget/LinearLayout;

    .line 117
    if-eqz v8, :cond_0

    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-nez v10, :cond_1

    :cond_0
    new-instance v10, Landroid/content/res/Resources$NotFoundException;

    invoke-direct {v10}, Landroid/content/res/Resources$NotFoundException;-><init>()V

    throw v10

    .line 121
    :cond_1
    new-instance v1, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;

    invoke-direct {v1, p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V

    .line 130
    .local v1, contentFactory:Landroid/widget/TabHost$TabContentFactory;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContext()Landroid/content/Context;

    move-result-object v10

    const v11, 0x7f09009c

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 131
    .local v3, label:Ljava/lang/String;
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mLayoutInflater:Landroid/view/LayoutInflater;

    invoke-virtual {v10, v13, v8, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 132
    .local v7, tabView:Landroid/widget/TextView;
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 134
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContext()Landroid/content/Context;

    move-result-object v10

    instance-of v10, v10, Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v10, :cond_2

    .line 135
    new-instance v10, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$3;

    invoke-direct {v10, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$3;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 142
    :cond_2
    const-string v10, "APPS"

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {v10, v7}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {v10, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 143
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContext()Landroid/content/Context;

    move-result-object v10

    const v11, 0x7f090083

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 144
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mLayoutInflater:Landroid/view/LayoutInflater;

    invoke-virtual {v10, v13, v8, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    .end local v7           #tabView:Landroid/widget/TextView;
    check-cast v7, Landroid/widget/TextView;

    .line 145
    .restart local v7       #tabView:Landroid/widget/TextView;
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 147
    const-string v10, "WIDGETS"

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {v10, v7}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {v10, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 148
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 151
    new-instance v2, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabKeyEventListener;

    invoke-direct {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabKeyEventListener;-><init>()V

    .line 152
    .local v2, keyListener:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabKeyEventListener;
    invoke-virtual {v8}, Landroid/widget/TabWidget;->getTabCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v8, v10}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v4

    .line 153
    .local v4, lastTab:Landroid/view/View;
    invoke-virtual {v4, v2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 154
    const v10, 0x7f07000b

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 155
    .local v6, shopButton:Landroid/view/View;
    invoke-virtual {v6, v2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 158
    const v10, 0x7f07000a

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 159
    .local v5, overflowMenuButton:Landroid/view/View;
    invoke-virtual {v5, v2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 162
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabsContainer:Landroid/view/ViewGroup;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 163
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTransitioningToWorkspace:Z

    if-nez v0, :cond_1

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TabHost;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onLauncherTransitionEnd(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 3
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 434
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onLauncherTransitionEnd(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V

    .line 435
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    .line 436
    if-eqz p2, :cond_0

    .line 437
    invoke-virtual {p0, v2, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setLayerType(ILandroid/graphics/Paint;)V

    .line 440
    :cond_0
    if-nez p3, :cond_2

    .line 442
    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissWorkspaceCling(Landroid/view/View;)V

    .line 444
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->showAllAppsCling()V

    .line 447
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(I)V

    .line 449
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_1

    .line 450
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->hideScrollingIndicator(Z)V

    .line 456
    :cond_1
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibilityOfSiblingsWithLowerZOrder(I)V

    .line 458
    :cond_2
    return-void
.end method

.method public onLauncherTransitionPrepare(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 4
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 391
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onLauncherTransitionPrepare(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V

    .line 392
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    .line 393
    iput-boolean p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTransitioningToWorkspace:Z

    .line 395
    if-eqz p3, :cond_2

    .line 397
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibilityOfSiblingsWithLowerZOrder(I)V

    .line 400
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelScrollingIndicatorAnimations()V

    .line 414
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mResetAfterTransition:Z

    if-eqz v0, :cond_1

    .line 415
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->reset()V

    .line 416
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mResetAfterTransition:Z

    .line 418
    :cond_1
    return-void

    .line 403
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 407
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(IZ)V

    .line 409
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_0

    .line 410
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->showScrollingIndicator(Z)V

    goto :goto_0
.end method

.method public onLauncherTransitionStart(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 0
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 422
    if-eqz p2, :cond_0

    .line 423
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->enableAndBuildHardwareLayer()V

    .line 425
    :cond_0
    return-void
.end method

.method public onLauncherTransitionStep(Lcom/cyanogenmod/trebuchet/Launcher;F)V
    .locals 0
    .parameter "l"
    .parameter "t"

    .prologue
    .line 430
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 167
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-gtz v2, :cond_2

    const/4 v1, 0x1

    .line 168
    .local v1, remeasureTabWidth:Z
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/TabHost;->onMeasure(II)V

    .line 171
    if-eqz v1, :cond_1

    .line 172
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageContentWidth()I

    move-result v0

    .line 173
    .local v0, contentWidth:I
    if-lez v0, :cond_0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v2, v0, :cond_0

    .line 175
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 176
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mRelayoutAndMakeVisible:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 179
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/TabHost;->onMeasure(II)V

    .line 181
    .end local v0           #contentWidth:I
    :cond_1
    return-void

    .line 167
    .end local v1           #remeasureTabWidth:Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 4
    .parameter "tabId"

    .prologue
    .line 222
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContentTypeForTabTag(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    move-result-object v2

    .line 224
    .local v2, type:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->isContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mJoinWidgetsApps:Z

    if-eqz v3, :cond_1

    .line 227
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 228
    .local v1, res:Landroid/content/res/Resources;
    const v3, 0x7f0c000c

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 232
    .local v0, duration:I
    new-instance v3, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    invoke-direct {v3, p0, v2, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;I)V

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    .line 316
    .end local v0           #duration:I
    .end local v1           #res:Landroid/content/res/Resources;
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    .line 192
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTransitioningToWorkspace:Z

    if-eqz v0, :cond_0

    .line 193
    invoke-super {p0, p1}, Landroid/widget/TabHost;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 201
    :goto_0
    return v0

    .line 198
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getBottom()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 199
    const/4 v0, 0x1

    goto :goto_0

    .line 201
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/TabHost;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onTrimMemory()V
    .locals 2

    .prologue
    .line 493
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mContent:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 496
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->clearAllWidgetPages()V

    .line 497
    return-void
.end method

.method public onWindowVisible()V
    .locals 3

    .prologue
    .line 483
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mContent:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 487
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(IZ)V

    .line 488
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(I)V

    .line 490
    :cond_0
    return-void
.end method

.method reset()V
    .locals 1

    .prologue
    .line 360
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mInTransition:Z

    if-eqz v0, :cond_0

    .line 362
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mResetAfterTransition:Z

    .line 367
    :goto_0
    return-void

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->reset()V

    goto :goto_0
.end method

.method selectAppsTab()V
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setContentTypeImmediate(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 94
    return-void
.end method

.method selectWidgetsTab()V
    .locals 1

    .prologue
    .line 96
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setContentTypeImmediate(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 97
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mAppsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setCurrentPageToWidgets()V

    .line 98
    return-void
.end method

.method setContentTypeImmediate(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    .locals 1
    .parameter "type"

    .prologue
    .line 86
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 87
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedStart()V

    .line 88
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTabChangedEnd(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 89
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 91
    return-void
.end method

.method public setCurrentTabFromContent(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    .locals 1
    .parameter "type"

    .prologue
    .line 319
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 320
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    .line 321
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 322
    return-void
.end method
