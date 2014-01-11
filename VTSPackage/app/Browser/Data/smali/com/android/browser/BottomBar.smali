.class public Lcom/android/browser/BottomBar;
.super Landroid/widget/LinearLayout;
.source "BottomBar.java"


# static fields
.field private static final ANIM_TITLEBAR_DECELERATE:F = 2.5f

.field private static final TAG:Ljava/lang/String; = "BottomBar"


# instance fields
.field private mBaseUi:Lcom/android/browser/BaseUi;

.field protected mBottomBar:Landroid/widget/LinearLayout;

.field private mBottomBarAnimator:Landroid/animation/Animator;

.field protected mBottomBarBack:Landroid/widget/ImageView;

.field protected mBottomBarBookmarks:Landroid/widget/ImageView;

.field protected mBottomBarForward:Landroid/widget/ImageView;

.field protected mBottomBarTabCount:Landroid/widget/TextView;

.field protected mBottomBarTabs:Landroid/widget/ImageView;

.field private mContentView:Landroid/widget/FrameLayout;

.field private mContentViewHeight:I

.field private mContext:Landroid/content/Context;

.field private mHideBottomBarAnimatorListener:Landroid/animation/Animator$AnimatorListener;

.field private mShowing:Z

.field private mTabControl:Lcom/android/browser/TabControl;

.field private mUiController:Lcom/android/browser/UiController;

.field private mUseFullScreen:Z

.field private mUseQuickControls:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/browser/UiController;Lcom/android/browser/BaseUi;Lcom/android/browser/TabControl;Landroid/widget/FrameLayout;)V
    .locals 1
    .parameter "context"
    .parameter "controller"
    .parameter "ui"
    .parameter "tabControl"
    .parameter "contentView"

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 265
    new-instance v0, Lcom/android/browser/BottomBar$10;

    invoke-direct {v0, p0}, Lcom/android/browser/BottomBar$10;-><init>(Lcom/android/browser/BottomBar;)V

    iput-object v0, p0, Lcom/android/browser/BottomBar;->mHideBottomBarAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 78
    iput-object p1, p0, Lcom/android/browser/BottomBar;->mContext:Landroid/content/Context;

    .line 79
    iput-object p2, p0, Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;

    .line 80
    iput-object p3, p0, Lcom/android/browser/BottomBar;->mBaseUi:Lcom/android/browser/BaseUi;

    .line 81
    iput-object p4, p0, Lcom/android/browser/BottomBar;->mTabControl:Lcom/android/browser/TabControl;

    .line 82
    iput-object p5, p0, Lcom/android/browser/BottomBar;->mContentView:Landroid/widget/FrameLayout;

    .line 83
    invoke-direct {p0, p1}, Lcom/android/browser/BottomBar;->initLayout(Landroid/content/Context;)V

    .line 84
    invoke-direct {p0}, Lcom/android/browser/BottomBar;->setupBottomBar()V

    .line 85
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/BottomBar;)Lcom/android/browser/UiController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/browser/BottomBar;)Lcom/android/browser/BaseUi;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBaseUi:Lcom/android/browser/BaseUi;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/BottomBar;)Lcom/android/browser/TabControl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mTabControl:Lcom/android/browser/TabControl;

    return-object v0
.end method

.method private getVisibleBottomHeight()I
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    return v0
.end method

.method private initLayout(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 88
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 89
    .local v0, factory:Landroid/view/LayoutInflater;
    const v1, 0x7f040011

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 90
    const v1, 0x7f0d0028

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBar:Landroid/widget/LinearLayout;

    .line 92
    const v1, 0x7f0d0029

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBack:Landroid/widget/ImageView;

    .line 94
    const v1, 0x7f0d002a

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarForward:Landroid/widget/ImageView;

    .line 96
    const v1, 0x7f0d002b

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarTabs:Landroid/widget/ImageView;

    .line 98
    const v1, 0x7f0d002d

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBookmarks:Landroid/widget/ImageView;

    .line 100
    const v1, 0x7f0d002c

    invoke-virtual {p0, v1}, Lcom/android/browser/BottomBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarTabCount:Landroid/widget/TextView;

    .line 103
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBack:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$1;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$1;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBack:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$2;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$2;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 117
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarForward:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$3;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$3;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarForward:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$4;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$4;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 132
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarTabs:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$5;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$5;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarTabs:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$6;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$6;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 145
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBookmarks:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$7;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$7;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarBookmarks:Landroid/widget/ImageView;

    new-instance v2, Lcom/android/browser/BottomBar$8;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$8;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 158
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBottomBarTabCount:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v2}, Lcom/android/browser/UiController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mTabControl:Lcom/android/browser/TabControl;

    new-instance v2, Lcom/android/browser/BottomBar$9;

    invoke-direct {v2, p0}, Lcom/android/browser/BottomBar$9;-><init>(Lcom/android/browser/BottomBar;)V

    invoke-virtual {v1, v2}, Lcom/android/browser/TabControl;->setOnTabCountChangedListener(Lcom/android/browser/TabControl$OnTabCountChangedListener;)V

    .line 166
    return-void
.end method

.method private makeLayoutParams()Landroid/view/ViewGroup$MarginLayoutParams;
    .locals 3

    .prologue
    .line 295
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 297
    .local v0, params:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x50

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 298
    return-object v0
.end method

.method private setupBottomBar()V
    .locals 3

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 170
    .local v0, parent:Landroid/view/ViewGroup;
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->show()V

    .line 171
    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 174
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mContentView:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Lcom/android/browser/BottomBar;->makeLayoutParams()Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    iget-object v1, p0, Lcom/android/browser/BottomBar;->mBaseUi:Lcom/android/browser/BaseUi;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/BaseUi;->setContentViewMarginBottom(I)V

    .line 176
    return-void
.end method


# virtual methods
.method cancelBottomBarAnimation()V
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 261
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    .line 263
    :cond_0
    return-void
.end method

.method public changeBottomBarState(ZZ)V
    .locals 1
    .parameter "back"
    .parameter "forward"

    .prologue
    .line 308
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBarBack:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 309
    iget-object v0, p0, Lcom/android/browser/BottomBar;->mBottomBarForward:Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 310
    return-void
.end method

.method hide()V
    .locals 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 225
    const-string v2, "BottomBar"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bottom bar hide(), showing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    iget-boolean v2, p0, Lcom/android/browser/BottomBar;->mUseQuickControls:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/browser/BottomBar;->mUseFullScreen:Z

    if-eqz v2, :cond_1

    .line 227
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->cancelBottomBarAnimation()V

    .line 228
    invoke-direct {p0}, Lcom/android/browser/BottomBar;->getVisibleBottomHeight()I

    move-result v1

    .line 229
    .local v1, visibleHeight:I
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->getTranslationY()F

    move-result v0

    .line 230
    .local v0, startPos:F
    const-string v2, "translationY"

    new-array v3, v7, [F

    aput v0, v3, v5

    int-to-float v4, v1

    add-float/2addr v4, v0

    aput v4, v3, v6

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    .line 232
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    iget-object v3, p0, Lcom/android/browser/BottomBar;->mHideBottomBarAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 233
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {p0, v2}, Lcom/android/browser/BottomBar;->setupBottomBarAnimator(Landroid/animation/Animator;)V

    .line 234
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 235
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 236
    iput-boolean v5, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    .line 252
    :goto_0
    return-void

    .line 239
    .end local v0           #startPos:F
    .end local v1           #visibleHeight:I
    :cond_1
    invoke-virtual {p0, v5}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 240
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->cancelBottomBarAnimation()V

    .line 241
    invoke-direct {p0}, Lcom/android/browser/BottomBar;->getVisibleBottomHeight()I

    move-result v1

    .line 242
    .restart local v1       #visibleHeight:I
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->getTranslationY()F

    move-result v0

    .line 243
    .restart local v0       #startPos:F
    const-string v2, "BottomBar"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hide(): visibleHeight: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const-string v2, "BottomBar"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hide(): startPos: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    const-string v2, "translationY"

    new-array v3, v7, [F

    aput v0, v3, v5

    int-to-float v4, v1

    add-float/2addr v4, v0

    aput v4, v3, v6

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    .line 247
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    iget-object v3, p0, Lcom/android/browser/BottomBar;->mHideBottomBarAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 248
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {p0, v2}, Lcom/android/browser/BottomBar;->setupBottomBarAnimator(Landroid/animation/Animator;)V

    .line 249
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 251
    iput-boolean v5, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    goto :goto_0
.end method

.method isShowing()Z
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    return v0
.end method

.method public onScrollChanged()V
    .locals 1

    .prologue
    .line 302
    iget-boolean v0, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    if-nez v0, :cond_0

    .line 303
    invoke-direct {p0}, Lcom/android/browser/BottomBar;->getVisibleBottomHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/browser/BottomBar;->setTranslationY(F)V

    .line 305
    :cond_0
    return-void
.end method

.method public setFullScreen(Z)V
    .locals 1
    .parameter "use"

    .prologue
    .line 179
    iput-boolean p1, p0, Lcom/android/browser/BottomBar;->mUseFullScreen:Z

    .line 180
    if-eqz p1, :cond_0

    .line 181
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    goto :goto_0
.end method

.method public setUseQuickControls(Z)V
    .locals 1
    .parameter "use"

    .prologue
    .line 188
    iput-boolean p1, p0, Lcom/android/browser/BottomBar;->mUseQuickControls:Z

    .line 189
    if-eqz p1, :cond_0

    .line 190
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 194
    :goto_0
    return-void

    .line 192
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    goto :goto_0
.end method

.method setupBottomBarAnimator(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animator"

    .prologue
    .line 197
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 198
    .local v1, res:Landroid/content/res/Resources;
    const v2, 0x7f0e0008

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 199
    .local v0, duration:I
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x4020

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 201
    int-to-long v2, v0

    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 202
    return-void
.end method

.method show()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 206
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->cancelBottomBarAnimation()V

    .line 207
    iget-boolean v2, p0, Lcom/android/browser/BottomBar;->mUseQuickControls:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/browser/BottomBar;->mUseFullScreen:Z

    if-eqz v2, :cond_2

    .line 208
    :cond_0
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 209
    iput-boolean v5, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    .line 222
    :cond_1
    :goto_0
    return-void

    .line 211
    :cond_2
    iget-boolean v2, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    if-nez v2, :cond_1

    .line 212
    invoke-virtual {p0, v5}, Lcom/android/browser/BottomBar;->setVisibility(I)V

    .line 213
    invoke-direct {p0}, Lcom/android/browser/BottomBar;->getVisibleBottomHeight()I

    move-result v1

    .line 214
    .local v1, visibleHeight:I
    invoke-virtual {p0}, Lcom/android/browser/BottomBar;->getTranslationY()F

    move-result v0

    .line 215
    .local v0, startPos:F
    const-string v2, "BottomBar"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bottombar show(): visibleHeight: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " show(): startPos: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    const-string v2, "translationY"

    const/4 v3, 0x2

    new-array v3, v3, [F

    aput v0, v3, v5

    int-to-float v4, v1

    sub-float v4, v0, v4

    aput v4, v3, v6

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    .line 218
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {p0, v2}, Lcom/android/browser/BottomBar;->setupBottomBarAnimator(Landroid/animation/Animator;)V

    .line 219
    iget-object v2, p0, Lcom/android/browser/BottomBar;->mBottomBarAnimator:Landroid/animation/Animator;

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 220
    iput-boolean v6, p0, Lcom/android/browser/BottomBar;->mShowing:Z

    goto :goto_0
.end method

.method public useQuickControls()Z
    .locals 1

    .prologue
    .line 291
    iget-boolean v0, p0, Lcom/android/browser/BottomBar;->mUseQuickControls:Z

    return v0
.end method
