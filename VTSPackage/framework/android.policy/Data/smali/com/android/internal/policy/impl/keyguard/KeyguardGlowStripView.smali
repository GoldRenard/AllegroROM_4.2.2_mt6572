.class public Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;
.super Landroid/widget/LinearLayout;
.source "KeyguardGlowStripView.java"


# static fields
.field private static final DURATION:I = 0x1f4

.field private static final SLIDING_WINDOW_SIZE:F = 0.4f


# instance fields
.field private mAnimationProgress:F

.field private mAnimator:Landroid/animation/ValueAnimator;

.field private mDotAlphaInterpolator:Landroid/view/animation/Interpolator;

.field private mDotDrawable:Landroid/graphics/drawable/Drawable;

.field private mDotSize:I

.field private mDotStripTop:I

.field private mDrawDots:Z

.field private mHorizontalDotGap:I

.field private mLeftToRight:Z

.field private mNumDots:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 56
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mLeftToRight:Z

    .line 50
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimationProgress:F

    .line 51
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDrawDots:Z

    .line 53
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3f00

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotAlphaInterpolator:Landroid/view/animation/Interpolator;

    .line 66
    sget-object v1, Lcom/android/internal/R$styleable;->KeyguardGlowStripView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 67
    .local v0, a:Landroid/content/res/TypedArray;
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    .line 68
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    invoke-virtual {v0, v4, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    .line 69
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotDrawable:Landroid/graphics/drawable/Drawable;

    .line 70
    const/4 v1, 0x3

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mLeftToRight:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mLeftToRight:Z

    .line 71
    return-void
.end method

.method static synthetic access$002(Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDrawDots:Z

    return p1
.end method

.method static synthetic access$102(Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimationProgress:F

    return p1
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .parameter "canvas"

    .prologue
    const/4 v10, 0x0

    const/high16 v9, 0x3f80

    const v8, 0x3e4ccccd

    .line 82
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 84
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDrawDots:Z

    if-nez v5, :cond_1

    .line 106
    :cond_0
    return-void

    .line 86
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->getPaddingLeft()I

    move-result v4

    .line 87
    .local v4, xOffset:I
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotDrawable:Landroid/graphics/drawable/Drawable;

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    invoke-virtual {v5, v10, v10, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 89
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    if-ge v2, v5, :cond_0

    .line 92
    int-to-float v5, v2

    mul-float/2addr v5, v9

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    add-int/lit8 v6, v6, -0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    const v6, 0x3f19999a

    mul-float/2addr v5, v6

    add-float v3, v8, v5

    .line 94
    .local v3, relativeDotPosition:F
    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimationProgress:F

    sub-float v5, v3, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 95
    .local v1, distance:F
    const/4 v5, 0x0

    div-float v6, v1, v8

    sub-float v6, v9, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 97
    .local v0, alpha:F
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotAlphaInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v5, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    .line 99
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 100
    int-to-float v5, v4

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotStripTop:I

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 101
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotDrawable:Landroid/graphics/drawable/Drawable;

    const/high16 v6, 0x437f

    mul-float/2addr v6, v0

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 102
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 103
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 104
    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mHorizontalDotGap:I

    add-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 89
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public makeEmGo()V
    .locals 5

    .prologue
    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    .line 109
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_0

    .line 110
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 112
    :cond_0
    iget-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mLeftToRight:Z

    if-eqz v4, :cond_1

    move v0, v2

    .line 113
    .local v0, from:F
    :goto_0
    iget-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mLeftToRight:Z

    if-eqz v4, :cond_2

    move v1, v3

    .line 114
    .local v1, to:F
    :goto_1
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v3, 0x1

    aput v1, v2, v3

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 115
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 116
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v3, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 117
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView$1;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 130
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView$2;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView$2;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 137
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 138
    return-void

    .end local v0           #from:F
    .end local v1           #to:F
    :cond_1
    move v0, v3

    .line 112
    goto :goto_0

    .restart local v0       #from:F
    :cond_2
    move v1, v2

    .line 113
    goto :goto_1
.end method

.method protected onSizeChanged(IIII)V
    .locals 3
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->getPaddingLeft()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->getPaddingRight()I

    move-result v2

    sub-int v0, v1, v2

    .line 75
    .local v0, availableWidth:I
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotSize:I

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    mul-int/2addr v1, v2

    sub-int v1, v0, v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mNumDots:I

    add-int/lit8 v2, v2, -0x1

    div-int/2addr v1, v2

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mHorizontalDotGap:I

    .line 76
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->getPaddingTop()I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->mDotStripTop:I

    .line 77
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardGlowStripView;->invalidate()V

    .line 78
    return-void
.end method
