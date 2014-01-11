.class public Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;
.super Landroid/widget/FrameLayout;
.source "SearchDropTargetBar.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/DragController$DragListener;


# static fields
.field private static final sAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator; = null

.field private static final sTransitionInDuration:I = 0xc8

.field private static final sTransitionOutDuration:I = 0xaf


# instance fields
.field private mBarHeight:I

.field private mDeferOnDragEnd:Z

.field private mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

.field private mDropTargetBar:Landroid/view/View;

.field private mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

.field private mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

.field private mEnableDropDownDropTargets:Z

.field private mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

.field private mIsSearchBarHidden:Z

.field private mPreviousBackground:Landroid/graphics/drawable/Drawable;

.field private mQSBSearchBar:Landroid/view/View;

.field private mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

.field private mShowQSBSearchBar:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->sAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeferOnDragEnd:Z

    .line 68
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getShowSearchBar()Z

    move-result v0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    .line 69
    return-void
.end method

.method private prepareStartAnimation(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 88
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 89
    invoke-virtual {p1}, Landroid/view/View;->buildLayer()V

    .line 90
    return-void
.end method

.method private setupAnimation(Landroid/animation/ObjectAnimator;Landroid/view/View;)V
    .locals 2
    .parameter "anim"
    .parameter "v"

    .prologue
    .line 93
    sget-object v0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->sAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 94
    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 95
    new-instance v0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;

    invoke-direct {v0, p0, p2}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar$1;-><init>(Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 101
    return-void
.end method


# virtual methods
.method public deferOnDragEnd()V
    .locals 1

    .prologue
    .line 212
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeferOnDragEnd:Z

    .line 213
    return-void
.end method

.method public finishAnimations()V
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 144
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 145
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 146
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 147
    return-void
.end method

.method public getSearchBarBounds()Landroid/graphics/Rect;
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 245
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 246
    const/4 v2, 0x2

    new-array v0, v2, [I

    .line 247
    .local v0, pos:[I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 249
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 250
    .local v1, rect:Landroid/graphics/Rect;
    aget v2, v0, v3

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 251
    aget v2, v0, v4

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 252
    aget v2, v0, v3

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 253
    aget v2, v0, v4

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 256
    .end local v0           #pos:[I
    .end local v1           #rect:Landroid/graphics/Rect;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getTransitionInDuration()I
    .locals 1

    .prologue
    .line 191
    const/16 v0, 0xc8

    return v0
.end method

.method public getTransitionOutDuration()I
    .locals 1

    .prologue
    .line 194
    const/16 v0, 0xaf

    return v0
.end method

.method public hideSearchBar(Z)V
    .locals 2
    .parameter "animated"

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    if-eqz v0, :cond_0

    .line 185
    :goto_0
    return-void

    .line 171
    :cond_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    if-eqz v0, :cond_1

    .line 172
    if-eqz p1, :cond_2

    .line 173
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 174
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 184
    :cond_1
    :goto_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    goto :goto_0

    .line 176
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 177
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEnableDropDownDropTargets:Z

    if-eqz v0, :cond_3

    .line 178
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mBarHeight:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 180
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1
.end method

.method public onDragEnd()V
    .locals 1

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeferOnDragEnd:Z

    if-nez v0, :cond_1

    .line 219
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 220
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 221
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 223
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 228
    :cond_0
    :goto_0
    return-void

    .line 226
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeferOnDragEnd:Z

    goto :goto_0
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 1
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 203
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 204
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 205
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 207
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 209
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 105
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 108
    const v0, 0x7f070038

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    .line 109
    const v0, 0x7f070039

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    .line 110
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    const v1, 0x7f07001f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    .line 111
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    const v1, 0x7f07001e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    .line 112
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    const v1, 0x7f070020

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    .line 113
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0007

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mBarHeight:I

    .line 115
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setSearchDropTargetBar(Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;)V

    .line 116
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setSearchDropTargetBar(Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;)V

    .line 117
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setSearchDropTargetBar(Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;)V

    .line 119
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEnableDropDownDropTargets:Z

    .line 122
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    if-nez v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 127
    :cond_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEnableDropDownDropTargets:Z

    if-eqz v0, :cond_1

    .line 128
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mBarHeight:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 129
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    const-string v1, "translationY"

    new-array v2, v4, [F

    iget v3, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mBarHeight:I

    neg-int v3, v3

    int-to-float v3, v3

    aput v3, v2, v6

    aput v5, v2, v7

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    .line 131
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const-string v1, "translationY"

    new-array v2, v4, [F

    aput v5, v2, v6

    iget v3, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mBarHeight:I

    neg-int v3, v3

    int-to-float v3, v3

    aput v3, v2, v7

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    .line 138
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->setupAnimation(Landroid/animation/ObjectAnimator;Landroid/view/View;)V

    .line 139
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->setupAnimation(Landroid/animation/ObjectAnimator;Landroid/view/View;)V

    .line 140
    return-void

    .line 134
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    .line 135
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBar:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v4, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDropTargetBarAnim:Landroid/animation/ObjectAnimator;

    .line 136
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v4, [F

    fill-array-data v2, :array_1

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    goto :goto_0

    .line 135
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data

    .line 136
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public onSearchPackagesChanged(ZZ)V
    .locals 3
    .parameter "searchVisible"
    .parameter "voiceVisible"

    .prologue
    .line 231
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 233
    .local v0, bg:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    .line 235
    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mPreviousBackground:Landroid/graphics/drawable/Drawable;

    .line 236
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 242
    .end local v0           #bg:Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    return-void

    .line 237
    .restart local v0       #bg:Landroid/graphics/drawable/Drawable;
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mPreviousBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    if-nez p1, :cond_2

    if-eqz p2, :cond_0

    .line 239
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mPreviousBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 1
    .parameter "launcher"
    .parameter "dragController"

    .prologue
    .line 72
    invoke-virtual {p2, p0}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 73
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 74
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 75
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 76
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 77
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 78
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->setFlingToDeleteDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 80
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mInfoDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 81
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mDeleteDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 82
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEditDropTarget:Lcom/cyanogenmod/trebuchet/ButtonDropTarget;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 83
    return-void
.end method

.method public showSearchBar(Z)V
    .locals 2
    .parameter "animated"

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    if-nez v0, :cond_0

    .line 168
    :goto_0
    return-void

    .line 154
    :cond_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mShowQSBSearchBar:Z

    if-eqz v0, :cond_1

    .line 155
    if-eqz p1, :cond_2

    .line 156
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->prepareStartAnimation(Landroid/view/View;)V

    .line 157
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->reverse()V

    .line 167
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mIsSearchBarHidden:Z

    goto :goto_0

    .line 159
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBarAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 160
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mEnableDropDownDropTargets:Z

    if-eqz v0, :cond_3

    .line 161
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 163
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->mQSBSearchBar:Landroid/view/View;

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1
.end method
