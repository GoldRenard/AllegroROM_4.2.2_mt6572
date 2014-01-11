.class public Lcom/android/browser/view/PieMenu;
.super Landroid/widget/FrameLayout;
.source "PieMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/view/PieMenu$PieView;,
        Lcom/android/browser/view/PieMenu$PieController;
    }
.end annotation


# static fields
.field private static final ANIMATION:J = 0x50L

.field private static final MAX_LEVELS:I = 0x5


# instance fields
.field private mAnimating:Z

.field private mBackground:Landroid/graphics/drawable/Drawable;

.field private mCenter:Landroid/graphics/Point;

.field private mController:Lcom/android/browser/view/PieMenu$PieController;

.field private mCounts:[I

.field private mCurrentItem:Lcom/android/browser/view/PieItem;

.field private mCurrentItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/view/PieItem;",
            ">;"
        }
    .end annotation
.end field

.field private mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/view/PieItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLevels:I

.field private mNormalPaint:Landroid/graphics/Paint;

.field private mOpen:Z

.field private mOpenItem:Lcom/android/browser/view/PieItem;

.field private mPath:Landroid/graphics/Path;

.field private mPieView:Lcom/android/browser/view/PieMenu$PieView;

.field private mRadius:I

.field private mRadiusInc:I

.field private mSelectedPaint:Landroid/graphics/Paint;

.field private mSlop:I

.field private mSubPaint:Landroid/graphics/Paint;

.field private mTouchOffset:I

.field private mUseBackground:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 134
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 135
    invoke-direct {p0, p1}, Lcom/android/browser/view/PieMenu;->init(Landroid/content/Context;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 126
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 127
    invoke-direct {p0, p1}, Lcom/android/browser/view/PieMenu;->init(Landroid/content/Context;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 117
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 118
    invoke-direct {p0, p1}, Lcom/android/browser/view/PieMenu;->init(Landroid/content/Context;)V

    .line 119
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/view/PieMenu;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/browser/view/PieMenu;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/browser/view/PieMenu;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/view/PieMenu;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->layoutPie()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/browser/view/PieMenu;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/android/browser/view/PieMenu;->animateIn(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method static synthetic access$502(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieMenu$PieView;)Lcom/android/browser/view/PieMenu$PieView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/browser/view/PieMenu;)Lcom/android/browser/view/PieItem;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    return-object v0
.end method

.method static synthetic access$602(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)Lcom/android/browser/view/PieItem;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    return-object p1
.end method

.method static synthetic access$702(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)Lcom/android/browser/view/PieItem;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    return-object p1
.end method

.method private animateIn(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V
    .locals 4
    .parameter "fixed"
    .parameter "listener"

    .prologue
    .line 517
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    if-eqz v2, :cond_0

    if-nez p1, :cond_1

    .line 537
    :cond_0
    :goto_0
    return-void

    .line 518
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v1

    .line 519
    .local v1, target:F
    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 520
    .local v0, anim:Landroid/animation/ValueAnimator;
    new-instance v2, Lcom/android/browser/view/PieMenu$3;

    invoke-direct {v2, p0, p1, v1}, Lcom/android/browser/view/PieMenu$3;-><init>(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;F)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 534
    const-wide/16 v2, 0x50

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 535
    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 536
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 519
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private animateOpen()V
    .locals 3

    .prologue
    .line 228
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 229
    .local v0, anim:Landroid/animation/ValueAnimator;
    new-instance v1, Lcom/android/browser/view/PieMenu$1;

    invoke-direct {v1, p0}, Lcom/android/browser/view/PieMenu$1;-><init>(Lcom/android/browser/view/PieMenu;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 239
    const-wide/16 v1, 0xa0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 240
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 241
    return-void

    .line 228
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private animateOut(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V
    .locals 4
    .parameter "fixed"
    .parameter "listener"

    .prologue
    .line 496
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    if-eqz v2, :cond_0

    if-nez p1, :cond_1

    .line 514
    :cond_0
    :goto_0
    return-void

    .line 497
    :cond_1
    invoke-virtual {p1}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v1

    .line 498
    .local v1, target:F
    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 499
    .local v0, anim:Landroid/animation/ValueAnimator;
    new-instance v2, Lcom/android/browser/view/PieMenu$2;

    invoke-direct {v2, p0, p1, v1}, Lcom/android/browser/view/PieMenu$2;-><init>(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;F)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 511
    const-wide/16 v2, 0x50

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 512
    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 513
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 498
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private closeSub()V
    .locals 2

    .prologue
    .line 570
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    .line 571
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/view/PieItem;->setSelected(Z)V

    .line 574
    :cond_0
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    new-instance v1, Lcom/android/browser/view/PieMenu$5;

    invoke-direct {v1, p0}, Lcom/android/browser/view/PieMenu$5;-><init>(Lcom/android/browser/view/PieMenu;)V

    invoke-direct {p0, v0, v1}, Lcom/android/browser/view/PieMenu;->animateOut(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V

    .line 593
    return-void
.end method

.method private deselect()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 596
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    if-eqz v0, :cond_0

    .line 597
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/view/PieItem;->setSelected(Z)V

    .line 599
    :cond_0
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    if-eqz v0, :cond_1

    .line 600
    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    .line 601
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    iput-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    .line 603
    :cond_1
    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    .line 604
    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 605
    return-void
.end method

.method private drawItem(Landroid/graphics/Canvas;Lcom/android/browser/view/PieItem;)V
    .locals 6
    .parameter "canvas"
    .parameter "item"

    .prologue
    .line 340
    invoke-virtual {p2}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 341
    invoke-virtual {p2}, Lcom/android/browser/view/PieItem;->isSelected()Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mSelectedPaint:Landroid/graphics/Paint;

    .line 342
    .local v0, p:Landroid/graphics/Paint;
    :goto_0
    iget-object v4, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    invoke-interface {v4, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 343
    invoke-virtual {p2}, Lcom/android/browser/view/PieItem;->isSelected()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mSelectedPaint:Landroid/graphics/Paint;

    .line 345
    :cond_0
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 346
    .local v2, state:I
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->onTheLeft()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 347
    const/high16 v4, -0x4080

    const/high16 v5, 0x3f80

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->scale(FF)V

    .line 349
    :cond_1
    invoke-virtual {p2}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v4

    float-to-double v4, v4

    invoke-direct {p0, v4, v5}, Lcom/android/browser/view/PieMenu;->getDegrees(D)F

    move-result v4

    const/high16 v5, 0x4387

    sub-float v1, v4, v5

    .line 350
    .local v1, r:F
    iget-object v4, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    invoke-virtual {p1, v1, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 351
    iget-object v4, p0, Lcom/android/browser/view/PieMenu;->mPath:Landroid/graphics/Path;

    invoke-virtual {p1, v4, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 352
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 354
    invoke-virtual {p2}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v3

    .line 355
    .local v3, view:Landroid/view/View;
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 356
    invoke-virtual {v3}, Landroid/view/View;->getX()F

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getY()F

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 357
    invoke-virtual {v3, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 358
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 360
    .end local v0           #p:Landroid/graphics/Paint;
    .end local v1           #r:F
    .end local v2           #state:I
    .end local v3           #view:Landroid/view/View;
    :cond_2
    return-void

    .line 341
    :cond_3
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mNormalPaint:Landroid/graphics/Paint;

    goto :goto_0

    .line 343
    .restart local v0       #p:Landroid/graphics/Paint;
    :cond_4
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mSubPaint:Landroid/graphics/Paint;

    goto :goto_1
.end method

.method private findItem(Landroid/graphics/PointF;)Lcom/android/browser/view/PieItem;
    .locals 3
    .parameter "polar"

    .prologue
    .line 632
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/view/PieItem;

    .line 633
    .local v1, item:Lcom/android/browser/view/PieItem;
    iget v2, p0, Lcom/android/browser/view/PieMenu;->mTouchOffset:I

    int-to-float v2, v2

    invoke-direct {p0, p1, v2, v1}, Lcom/android/browser/view/PieMenu;->inside(Landroid/graphics/PointF;FLcom/android/browser/view/PieItem;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 637
    .end local v1           #item:Lcom/android/browser/view/PieItem;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getDegrees(D)F
    .locals 6
    .parameter "angle"

    .prologue
    .line 300
    const-wide v0, 0x4070e00000000000L

    const-wide v2, 0x4066800000000000L

    mul-double/2addr v2, p1

    const-wide v4, 0x400921fb54442d18L

    div-double/2addr v2, v4

    sub-double/2addr v0, v2

    double-to-float v0, v0

    return v0
.end method

.method private getPolar(FF)Landroid/graphics/PointF;
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v3, 0x0

    .line 608
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 610
    .local v0, res:Landroid/graphics/PointF;
    const v1, 0x3fc90fdb

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 611
    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    sub-float p1, v1, p1

    .line 612
    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    iget v2, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    if-ge v1, v2, :cond_0

    .line 613
    neg-float p1, p1

    .line 615
    :cond_0
    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    sub-float p2, v1, p2

    .line 616
    mul-float v1, p1, p1

    mul-float v2, p2, p2

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 617
    cmpl-float v1, p2, v3

    if-lez v1, :cond_2

    .line 618
    iget v1, v0, Landroid/graphics/PointF;->y:F

    div-float v1, p1, v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->asin(D)D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 622
    :cond_1
    :goto_0
    return-object v0

    .line 619
    :cond_2
    cmpg-float v1, p2, v3

    if-gez v1, :cond_1

    .line 620
    const-wide v1, 0x400921fb54442d18L

    iget v3, v0, Landroid/graphics/PointF;->y:F

    div-float v3, p1, v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->asin(D)D

    move-result-wide v3

    sub-double/2addr v1, v3

    double-to-float v1, v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 6
    .parameter "ctx"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    .line 140
    iput v4, p0, Lcom/android/browser/view/PieMenu;->mLevels:I

    .line 141
    const/4 v3, 0x5

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mCounts:[I

    .line 142
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 143
    .local v1, res:Landroid/content/res/Resources;
    const v3, 0x7f0b000f

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/browser/view/PieMenu;->mRadius:I

    .line 144
    const v3, 0x7f0b0010

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/browser/view/PieMenu;->mRadiusInc:I

    .line 145
    const v3, 0x7f0b0011

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    .line 146
    const v3, 0x7f0b0012

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/browser/view/PieMenu;->mTouchOffset:I

    .line 147
    iput-boolean v4, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    .line 148
    invoke-virtual {p0, v4}, Lcom/android/browser/view/PieMenu;->setWillNotDraw(Z)V

    .line 149
    invoke-virtual {p0, v4}, Lcom/android/browser/view/PieMenu;->setDrawingCacheEnabled(Z)V

    .line 150
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v4, v4}, Landroid/graphics/Point;-><init>(II)V

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    .line 151
    const v3, 0x7f02005f

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 153
    const v3, 0x7f0a000b

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 155
    .local v0, color:I
    invoke-virtual {v1}, Landroid/content/res/Resources;->getThemeMainColor()I

    move-result v2

    .line 156
    .local v2, tempColor:I
    if-eqz v2, :cond_0

    .line 157
    move v0, v2

    .line 161
    :cond_0
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mNormalPaint:Landroid/graphics/Paint;

    .line 163
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mNormalPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 164
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mNormalPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 165
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mSelectedPaint:Landroid/graphics/Paint;

    .line 166
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mSelectedPaint:Landroid/graphics/Paint;

    const v4, 0x7f0a000c

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 167
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mSelectedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 168
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mSubPaint:Landroid/graphics/Paint;

    .line 169
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mSubPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 170
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mSubPaint:Landroid/graphics/Paint;

    const v4, 0x7f0a000d

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 171
    return-void
.end method

.method private inside(Landroid/graphics/PointF;FLcom/android/browser/view/PieItem;)Z
    .locals 2
    .parameter "polar"
    .parameter "offset"
    .parameter "item"

    .prologue
    .line 641
    invoke-virtual {p3}, Lcom/android/browser/view/PieItem;->getInnerRadius()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, p2

    iget v1, p1, Landroid/graphics/PointF;->y:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p3}, Lcom/android/browser/view/PieItem;->getOuterRadius()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, p2

    iget v1, p1, Landroid/graphics/PointF;->y:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p3}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v0

    iget v1, p1, Landroid/graphics/PointF;->x:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p3}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v0

    invoke-virtual {p3}, Lcom/android/browser/view/PieItem;->getSweep()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p1, Landroid/graphics/PointF;->x:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private layoutPie()V
    .locals 27

    .prologue
    .line 253
    const v10, 0x3e490fdb

    .line 254
    .local v10, emptyangle:F
    const/16 v19, 0x2

    .line 255
    .local v19, rgap:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/browser/view/PieMenu;->mRadius:I

    add-int v7, v3, v19

    .line 256
    .local v7, inner:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/browser/view/PieMenu;->mRadius:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/browser/view/PieMenu;->mRadiusInc:I

    add-int/2addr v3, v4

    sub-int v6, v3, v19

    .line 257
    .local v6, outer:I
    const/4 v11, 0x1

    .line 258
    .local v11, gap:I
    const/4 v13, 0x0

    .local v13, i:I
    :goto_0
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/browser/view/PieMenu;->mLevels:I

    if-ge v13, v3, :cond_4

    .line 259
    add-int/lit8 v17, v13, 0x1

    .line 260
    .local v17, level:I
    const-wide v3, 0x400921fb54442d18L

    const/high16 v5, 0x4000

    mul-float/2addr v5, v10

    float-to-double v0, v5

    move-wide/from16 v25, v0

    sub-double v3, v3, v25

    double-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/browser/view/PieMenu;->mCounts:[I

    aget v4, v4, v17

    int-to-float v4, v4

    div-float v20, v3, v4

    .line 261
    .local v20, sweep:F
    const/high16 v3, 0x4000

    div-float v3, v20, v3

    add-float v9, v10, v3

    .line 262
    .local v9, angle:F
    const-wide/16 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/android/browser/view/PieMenu;->getDegrees(D)F

    move-result v3

    int-to-float v4, v11

    sub-float v4, v3, v4

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v25, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v25

    invoke-direct {v0, v1, v2}, Lcom/android/browser/view/PieMenu;->getDegrees(D)F

    move-result v3

    int-to-float v5, v11

    add-float/2addr v5, v3

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/android/browser/view/PieMenu;->makeSlice(FFIILandroid/graphics/Point;)Landroid/graphics/Path;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/browser/view/PieMenu;->mPath:Landroid/graphics/Path;

    .line 263
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/browser/view/PieItem;

    .line 264
    .local v15, item:Lcom/android/browser/view/PieItem;
    invoke-virtual {v15}, Lcom/android/browser/view/PieItem;->getLevel()I

    move-result v3

    move/from16 v0, v17

    if-ne v3, v0, :cond_0

    .line 265
    invoke-virtual {v15}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v21

    .line 266
    .local v21, view:Landroid/view/View;
    if-eqz v21, :cond_1

    .line 267
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    move-object/from16 v0, v21

    invoke-virtual {v0, v3, v4}, Landroid/view/View;->measure(II)V

    .line 269
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredWidth()I

    move-result v22

    .line 270
    .local v22, w:I
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    .line 271
    .local v12, h:I
    sub-int v3, v6, v7

    mul-int/lit8 v3, v3, 0x2

    div-int/lit8 v3, v3, 0x3

    add-int v18, v7, v3

    .line 272
    .local v18, r:I
    move/from16 v0, v18

    int-to-double v3, v0

    float-to-double v0, v9

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->sin(D)D

    move-result-wide v25

    mul-double v3, v3, v25

    double-to-int v0, v3

    move/from16 v23, v0

    .line 273
    .local v23, x:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    move/from16 v0, v18

    int-to-double v4, v0

    float-to-double v0, v9

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->cos(D)D

    move-result-wide v25

    mul-double v4, v4, v25

    double-to-int v4, v4

    sub-int/2addr v3, v4

    div-int/lit8 v4, v12, 0x2

    sub-int v24, v3, v4

    .line 274
    .local v24, y:I
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/view/PieMenu;->onTheLeft()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 275
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    add-int v3, v3, v23

    div-int/lit8 v4, v22, 0x2

    sub-int v23, v3, v4

    .line 279
    :goto_2
    add-int v3, v23, v22

    add-int v4, v24, v12

    move-object/from16 v0, v21

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 281
    .end local v12           #h:I
    .end local v18           #r:I
    .end local v22           #w:I
    .end local v23           #x:I
    .end local v24           #y:I
    :cond_1
    const/high16 v3, 0x4000

    div-float v3, v20, v3

    sub-float v16, v9, v3

    .line 282
    .local v16, itemstart:F
    move/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v15, v0, v1, v7, v6}, Lcom/android/browser/view/PieItem;->setGeometry(FFII)V

    .line 283
    add-float v9, v9, v20

    goto/16 :goto_1

    .line 277
    .end local v16           #itemstart:F
    .restart local v12       #h:I
    .restart local v18       #r:I
    .restart local v22       #w:I
    .restart local v23       #x:I
    .restart local v24       #y:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    sub-int v3, v3, v23

    div-int/lit8 v4, v22, 0x2

    sub-int v23, v3, v4

    goto :goto_2

    .line 286
    .end local v12           #h:I
    .end local v15           #item:Lcom/android/browser/view/PieItem;
    .end local v18           #r:I
    .end local v21           #view:Landroid/view/View;
    .end local v22           #w:I
    .end local v23           #x:I
    .end local v24           #y:I
    :cond_3
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/browser/view/PieMenu;->mRadiusInc:I

    add-int/2addr v7, v3

    .line 287
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/browser/view/PieMenu;->mRadiusInc:I

    add-int/2addr v6, v3

    .line 258
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 289
    .end local v9           #angle:F
    .end local v14           #i$:Ljava/util/Iterator;
    .end local v17           #level:I
    .end local v20           #sweep:F
    :cond_4
    return-void
.end method

.method private layoutPieView(Lcom/android/browser/view/PieMenu$PieView;IIF)V
    .locals 6
    .parameter "pv"
    .parameter "x"
    .parameter "y"
    .parameter "angle"

    .prologue
    .line 466
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->onTheLeft()Z

    move-result v3

    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->getHeight()I

    move-result v5

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v4, p4

    invoke-interface/range {v0 .. v5}, Lcom/android/browser/view/PieMenu$PieView;->layout(IIZFI)V

    .line 467
    return-void
.end method

.method private makeSlice(FFIILandroid/graphics/Point;)Landroid/graphics/Path;
    .locals 7
    .parameter "start"
    .parameter "end"
    .parameter "outer"
    .parameter "inner"
    .parameter "center"

    .prologue
    .line 363
    new-instance v0, Landroid/graphics/RectF;

    iget v3, p5, Landroid/graphics/Point;->x:I

    sub-int/2addr v3, p3

    int-to-float v3, v3

    iget v4, p5, Landroid/graphics/Point;->y:I

    sub-int/2addr v4, p3

    int-to-float v4, v4

    iget v5, p5, Landroid/graphics/Point;->x:I

    add-int/2addr v5, p3

    int-to-float v5, v5

    iget v6, p5, Landroid/graphics/Point;->y:I

    add-int/2addr v6, p3

    int-to-float v6, v6

    invoke-direct {v0, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 366
    .local v0, bb:Landroid/graphics/RectF;
    new-instance v1, Landroid/graphics/RectF;

    iget v3, p5, Landroid/graphics/Point;->x:I

    sub-int/2addr v3, p4

    int-to-float v3, v3

    iget v4, p5, Landroid/graphics/Point;->y:I

    sub-int/2addr v4, p4

    int-to-float v4, v4

    iget v5, p5, Landroid/graphics/Point;->x:I

    add-int/2addr v5, p4

    int-to-float v5, v5

    iget v6, p5, Landroid/graphics/Point;->y:I

    add-int/2addr v6, p4

    int-to-float v6, v6

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 369
    .local v1, bbi:Landroid/graphics/RectF;
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 370
    .local v2, path:Landroid/graphics/Path;
    sub-float v3, p2, p1

    const/4 v4, 0x1

    invoke-virtual {v2, v0, p1, v3, v4}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 371
    sub-float v3, p1, p2

    invoke-virtual {v2, v1, p2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 372
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 373
    return-object v2
.end method

.method private onEnter(Lcom/android/browser/view/PieItem;)V
    .locals 3
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 476
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    if-eqz v0, :cond_0

    .line 477
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    invoke-virtual {v0, v1}, Lcom/android/browser/view/PieItem;->setSelected(Z)V

    .line 479
    :cond_0
    if-eqz p1, :cond_2

    .line 481
    invoke-virtual {p0, v1}, Lcom/android/browser/view/PieMenu;->playSoundEffect(I)V

    .line 482
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/browser/view/PieItem;->setSelected(Z)V

    .line 483
    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 484
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    .line 485
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    invoke-virtual {v0}, Lcom/android/browser/view/PieItem;->hasItems()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 486
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    invoke-direct {p0, v0}, Lcom/android/browser/view/PieMenu;->openSub(Lcom/android/browser/view/PieItem;)V

    .line 487
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    .line 493
    :cond_1
    :goto_0
    return-void

    .line 490
    :cond_2
    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    goto :goto_0
.end method

.method private onTheLeft()Z
    .locals 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget v1, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private openSub(Lcom/android/browser/view/PieItem;)V
    .locals 1
    .parameter "item"

    .prologue
    .line 540
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    .line 541
    new-instance v0, Lcom/android/browser/view/PieMenu$4;

    invoke-direct {v0, p0, p1}, Lcom/android/browser/view/PieMenu$4;-><init>(Lcom/android/browser/view/PieMenu;Lcom/android/browser/view/PieItem;)V

    invoke-direct {p0, p1, v0}, Lcom/android/browser/view/PieMenu;->animateOut(Lcom/android/browser/view/PieItem;Landroid/animation/Animator$AnimatorListener;)V

    .line 567
    return-void
.end method

.method private setCenter(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 244
    iget v0, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    if-ge p1, v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    const/4 v1, 0x0

    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 249
    :goto_0
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iput p2, v0, Landroid/graphics/Point;->y:I

    .line 250
    return-void

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/graphics/Point;->x:I

    goto :goto_0
.end method

.method private show(Z)V
    .locals 5
    .parameter "show"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 206
    iput-boolean p1, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    .line 207
    iget-boolean v2, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    if-eqz v2, :cond_2

    .line 209
    iput-boolean v4, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    .line 210
    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    .line 211
    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    .line 212
    iput-object v3, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 213
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mController:Lcom/android/browser/view/PieMenu$PieController;

    invoke-interface {v2}, Lcom/android/browser/view/PieMenu$PieController;->stopEditingUrl()V

    .line 214
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    iput-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    .line 215
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/view/PieItem;

    .line 216
    .local v1, item:Lcom/android/browser/view/PieItem;
    invoke-virtual {v1, v4}, Lcom/android/browser/view/PieItem;->setSelected(Z)V

    goto :goto_0

    .line 218
    .end local v1           #item:Lcom/android/browser/view/PieItem;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mController:Lcom/android/browser/view/PieMenu$PieController;

    if-eqz v2, :cond_1

    .line 219
    iget-object v2, p0, Lcom/android/browser/view/PieMenu;->mController:Lcom/android/browser/view/PieMenu$PieController;

    invoke-interface {v2}, Lcom/android/browser/view/PieMenu$PieController;->onOpen()Z

    .line 221
    :cond_1
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->layoutPie()V

    .line 222
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->animateOpen()V

    .line 224
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->invalidate()V

    .line 225
    return-void
.end method


# virtual methods
.method public addItem(Lcom/android/browser/view/PieItem;)V
    .locals 3
    .parameter "item"

    .prologue
    .line 183
    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    invoke-virtual {p1}, Lcom/android/browser/view/PieItem;->getLevel()I

    move-result v0

    .line 185
    .local v0, l:I
    iget v1, p0, Lcom/android/browser/view/PieMenu;->mLevels:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/android/browser/view/PieMenu;->mLevels:I

    .line 186
    iget-object v1, p0, Lcom/android/browser/view/PieMenu;->mCounts:[I

    aget v2, v1, v0

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, v0

    .line 187
    return-void
.end method

.method public clearItems()V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 195
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .parameter "canvas"

    .prologue
    .line 305
    iget-boolean v8, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    if-eqz v8, :cond_6

    .line 307
    iget-boolean v8, p0, Lcom/android/browser/view/PieMenu;->mUseBackground:Z

    if-eqz v8, :cond_1

    .line 308
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    .line 309
    .local v7, w:I
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 310
    .local v0, h:I
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v8, v8, Landroid/graphics/Point;->x:I

    sub-int v4, v8, v7

    .line 311
    .local v4, left:I
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mCenter:Landroid/graphics/Point;

    iget v8, v8, Landroid/graphics/Point;->y:I

    div-int/lit8 v9, v0, 0x2

    sub-int v6, v8, v9

    .line 312
    .local v6, top:I
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mBackground:Landroid/graphics/drawable/Drawable;

    add-int v9, v4, v7

    add-int v10, v6, v0

    invoke-virtual {v8, v4, v6, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 313
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v5

    .line 314
    .local v5, state:I
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->onTheLeft()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 315
    const/high16 v8, -0x4080

    const/high16 v9, 0x3f80

    invoke-virtual {p1, v8, v9}, Landroid/graphics/Canvas;->scale(FF)V

    .line 317
    :cond_0
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 318
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 321
    .end local v0           #h:I
    .end local v4           #left:I
    .end local v5           #state:I
    .end local v6           #top:I
    .end local v7           #w:I
    :cond_1
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    .line 322
    .local v3, last:Lcom/android/browser/view/PieItem;
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    if-eqz v8, :cond_2

    .line 323
    iget-object v3, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    .line 325
    :cond_2
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mCurrentItems:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/view/PieItem;

    .line 326
    .local v2, item:Lcom/android/browser/view/PieItem;
    if-eq v2, v3, :cond_3

    .line 327
    invoke-direct {p0, p1, v2}, Lcom/android/browser/view/PieMenu;->drawItem(Landroid/graphics/Canvas;Lcom/android/browser/view/PieItem;)V

    goto :goto_0

    .line 330
    .end local v2           #item:Lcom/android/browser/view/PieItem;
    :cond_4
    if-eqz v3, :cond_5

    .line 331
    invoke-direct {p0, p1, v3}, Lcom/android/browser/view/PieMenu;->drawItem(Landroid/graphics/Canvas;Lcom/android/browser/view/PieItem;)V

    .line 333
    :cond_5
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    if-eqz v8, :cond_6

    .line 334
    iget-object v8, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    invoke-interface {v8, p1}, Lcom/android/browser/view/PieMenu$PieView;->draw(Landroid/graphics/Canvas;)V

    .line 337
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #last:Lcom/android/browser/view/PieItem;
    :cond_6
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .parameter "evt"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 380
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    .line 381
    .local v7, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    .line 382
    .local v8, y:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 383
    .local v0, action:I
    if-nez v0, :cond_2

    .line 384
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->getWidth()I

    move-result v11

    iget v12, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    sub-int/2addr v11, v12

    int-to-float v11, v11

    cmpl-float v11, v7, v11

    if-gtz v11, :cond_0

    iget v11, p0, Lcom/android/browser/view/PieMenu;->mSlop:I

    int-to-float v11, v11

    cmpg-float v11, v7, v11

    if-gez v11, :cond_1

    .line 385
    :cond_0
    float-to-int v10, v7

    float-to-int v11, v8

    invoke-direct {p0, v10, v11}, Lcom/android/browser/view/PieMenu;->setCenter(II)V

    .line 386
    invoke-direct {p0, v9}, Lcom/android/browser/view/PieMenu;->show(Z)V

    move v10, v9

    .line 462
    :cond_1
    :goto_0
    return v10

    .line 389
    :cond_2
    if-ne v9, v0, :cond_7

    .line 390
    iget-boolean v11, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    if-eqz v11, :cond_1

    .line 391
    const/4 v3, 0x0

    .line 392
    .local v3, handled:Z
    iget-object v11, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    if-eqz v11, :cond_3

    .line 393
    iget-object v11, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    invoke-interface {v11, p1}, Lcom/android/browser/view/PieMenu$PieView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    .line 395
    :cond_3
    iget-object v4, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    .line 396
    .local v4, item:Lcom/android/browser/view/PieItem;
    iget-boolean v11, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    if-nez v11, :cond_4

    .line 397
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->deselect()V

    .line 399
    :cond_4
    invoke-direct {p0, v10}, Lcom/android/browser/view/PieMenu;->show(Z)V

    .line 400
    if-nez v3, :cond_6

    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_6

    .line 401
    iget-object v10, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    if-eq v4, v10, :cond_5

    iget-boolean v10, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    if-nez v10, :cond_6

    .line 402
    :cond_5
    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->performClick()Z

    :cond_6
    move v10, v9

    .line 405
    goto :goto_0

    .line 407
    .end local v3           #handled:Z
    .end local v4           #item:Lcom/android/browser/view/PieItem;
    :cond_7
    const/4 v9, 0x3

    if-ne v9, v0, :cond_9

    .line 408
    iget-boolean v9, p0, Lcom/android/browser/view/PieMenu;->mOpen:Z

    if-eqz v9, :cond_8

    .line 409
    invoke-direct {p0, v10}, Lcom/android/browser/view/PieMenu;->show(Z)V

    .line 411
    :cond_8
    iget-boolean v9, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    if-nez v9, :cond_1

    .line 412
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->deselect()V

    .line 413
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->invalidate()V

    goto :goto_0

    .line 416
    :cond_9
    const/4 v9, 0x2

    if-ne v9, v0, :cond_1

    .line 417
    iget-boolean v9, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    if-nez v9, :cond_1

    .line 418
    const/4 v3, 0x0

    .line 419
    .restart local v3       #handled:Z
    invoke-direct {p0, v7, v8}, Lcom/android/browser/view/PieMenu;->getPolar(FF)Landroid/graphics/PointF;

    move-result-object v6

    .line 420
    .local v6, polar:Landroid/graphics/PointF;
    iget v9, p0, Lcom/android/browser/view/PieMenu;->mRadius:I

    iget v11, p0, Lcom/android/browser/view/PieMenu;->mLevels:I

    iget v12, p0, Lcom/android/browser/view/PieMenu;->mRadiusInc:I

    mul-int/2addr v11, v12

    add-int/2addr v9, v11

    add-int/lit8 v5, v9, 0x32

    .line 421
    .local v5, maxr:I
    iget-object v9, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    if-eqz v9, :cond_a

    .line 422
    iget-object v9, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    invoke-interface {v9, p1}, Lcom/android/browser/view/PieMenu$PieView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    .line 424
    :cond_a
    if-eqz v3, :cond_b

    .line 425
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->invalidate()V

    goto :goto_0

    .line 428
    :cond_b
    iget v9, v6, Landroid/graphics/PointF;->y:F

    iget v11, p0, Lcom/android/browser/view/PieMenu;->mRadius:I

    int-to-float v11, v11

    cmpg-float v9, v9, v11

    if-gez v9, :cond_d

    .line 429
    iget-object v9, p0, Lcom/android/browser/view/PieMenu;->mOpenItem:Lcom/android/browser/view/PieItem;

    if-eqz v9, :cond_c

    .line 430
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->closeSub()V

    goto/16 :goto_0

    .line 431
    :cond_c
    iget-boolean v9, p0, Lcom/android/browser/view/PieMenu;->mAnimating:Z

    if-nez v9, :cond_1

    .line 432
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->deselect()V

    .line 433
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->invalidate()V

    goto/16 :goto_0

    .line 437
    :cond_d
    iget v9, v6, Landroid/graphics/PointF;->y:F

    int-to-float v11, v5

    cmpl-float v9, v9, v11

    if-lez v9, :cond_e

    .line 438
    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->deselect()V

    .line 439
    invoke-direct {p0, v10}, Lcom/android/browser/view/PieMenu;->show(Z)V

    .line 440
    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->setAction(I)V

    .line 441
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-eqz v9, :cond_1

    .line 442
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    invoke-virtual {v9, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto/16 :goto_0

    .line 446
    :cond_e
    invoke-direct {p0, v6}, Lcom/android/browser/view/PieMenu;->findItem(Landroid/graphics/PointF;)Lcom/android/browser/view/PieItem;

    move-result-object v4

    .line 447
    .restart local v4       #item:Lcom/android/browser/view/PieItem;
    if-eqz v4, :cond_1

    .line 448
    iget-object v9, p0, Lcom/android/browser/view/PieMenu;->mCurrentItem:Lcom/android/browser/view/PieItem;

    if-eq v9, v4, :cond_1

    .line 449
    invoke-direct {p0, v4}, Lcom/android/browser/view/PieMenu;->onEnter(Lcom/android/browser/view/PieItem;)V

    .line 450
    if-eqz v4, :cond_f

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->isPieView()Z

    move-result v9

    if-eqz v9, :cond_f

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 451
    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v11

    invoke-direct {p0}, Lcom/android/browser/view/PieMenu;->onTheLeft()Z

    move-result v9

    if-eqz v9, :cond_10

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v9

    :goto_1
    add-int v1, v11, v9

    .line 453
    .local v1, cx:I
    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v2

    .line 454
    .local v2, cy:I
    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getPieView()Lcom/android/browser/view/PieMenu$PieView;

    move-result-object v9

    iput-object v9, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    .line 455
    iget-object v9, p0, Lcom/android/browser/view/PieMenu;->mPieView:Lcom/android/browser/view/PieMenu$PieView;

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getStartAngle()F

    move-result v11

    invoke-virtual {v4}, Lcom/android/browser/view/PieItem;->getSweep()F

    move-result v12

    add-float/2addr v11, v12

    const/high16 v12, 0x4000

    div-float/2addr v11, v12

    invoke-direct {p0, v9, v1, v2, v11}, Lcom/android/browser/view/PieMenu;->layoutPieView(Lcom/android/browser/view/PieMenu$PieView;IIF)V

    .line 458
    .end local v1           #cx:I
    .end local v2           #cy:I
    :cond_f
    invoke-virtual {p0}, Lcom/android/browser/view/PieMenu;->invalidate()V

    goto/16 :goto_0

    :cond_10
    move v9, v10

    .line 451
    goto :goto_1
.end method

.method public removeItem(Lcom/android/browser/view/PieItem;)V
    .locals 1
    .parameter "item"

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/browser/view/PieMenu;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 191
    return-void
.end method

.method public setController(Lcom/android/browser/view/PieMenu$PieController;)V
    .locals 0
    .parameter "ctl"

    .prologue
    .line 174
    iput-object p1, p0, Lcom/android/browser/view/PieMenu;->mController:Lcom/android/browser/view/PieMenu$PieController;

    .line 175
    return-void
.end method

.method public setUseBackground(Z)V
    .locals 0
    .parameter "useBackground"

    .prologue
    .line 178
    iput-boolean p1, p0, Lcom/android/browser/view/PieMenu;->mUseBackground:Z

    .line 179
    return-void
.end method
