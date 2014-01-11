.class public abstract Lcom/android/launcher2/SmoothPagedView;
.super Lcom/android/launcher2/PagedView;
.source "SmoothPagedView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;
    }
.end annotation


# static fields
.field static final DEFAULT_MODE:I = 0x0

#the value of this static final field might be set in the static constructor
.field private static final SMOOTHING_CONSTANT:F = 0.0f

.field private static final SMOOTHING_SPEED:F = 0.75f

.field static final X_LARGE_MODE:I = 0x1


# instance fields
.field private mBaseLineFlingVelocity:F

.field private mFlingVelocityInfluence:F

.field private mScrollInterpolator:Landroid/view/animation/Interpolator;

.field mScrollMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 26
    const-wide v0, 0x3f90624dd2f1a9fcL

    const-wide/high16 v2, 0x3fe8

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    double-to-float v0, v0

    sput v0, Lcom/android/launcher2/SmoothPagedView;->SMOOTHING_CONSTANT:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/SmoothPagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 82
    iput-boolean v1, p0, Lcom/android/launcher2/PagedView;->mUsePagingTouchSlop:Z

    .line 86
    iget v2, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    if-eq v2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mDeferScrollUpdate:Z

    .line 87
    return-void

    :cond_0
    move v0, v1

    .line 86
    goto :goto_0
.end method

.method private snapToPageWithVelocity(IIZ)V
    .locals 8
    .parameter "whichPage"
    .parameter "velocity"
    .parameter "settle"

    .prologue
    .line 130
    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {p1, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 132
    const/4 v4, 0x1

    iget v5, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    sub-int v5, p1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 133
    .local v3, screenDelta:I
    invoke-virtual {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->getChildOffset(I)I

    move-result v4

    invoke-virtual {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->getRelativeChildOffset(I)I

    move-result v5

    sub-int v2, v4, v5

    .line 134
    .local v2, newX:I
    iget v4, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    sub-int v0, v2, v4

    .line 135
    .local v0, delta:I
    add-int/lit8 v4, v3, 0x1

    mul-int/lit8 v1, v4, 0x64

    .line 137
    .local v1, duration:I
    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->isFinished()Z

    move-result v4

    if-nez v4, :cond_0

    .line 138
    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->abortAnimation()V

    .line 141
    :cond_0
    if-eqz p3, :cond_1

    .line 142
    iget-object v4, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    check-cast v4, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;

    invoke-virtual {v4, v3}, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->setDistance(I)V

    .line 147
    :goto_0
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 148
    if-lez p2, :cond_2

    .line 149
    int-to-float v4, v1

    int-to-float v5, v1

    int-to-float v6, p2

    iget v7, p0, Lcom/android/launcher2/SmoothPagedView;->mBaseLineFlingVelocity:F

    div-float/2addr v6, v7

    div-float/2addr v5, v6

    iget v6, p0, Lcom/android/launcher2/SmoothPagedView;->mFlingVelocityInfluence:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v1, v4

    .line 154
    :goto_1
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher2/SmoothPagedView;->snapToPage(III)V

    .line 155
    return-void

    .line 144
    :cond_1
    iget-object v4, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    check-cast v4, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;

    invoke-virtual {v4}, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->disableSettle()V

    goto :goto_0

    .line 151
    :cond_2
    add-int/lit8 v1, v1, 0x64

    goto :goto_1
.end method


# virtual methods
.method public computeScroll()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 168
    iget v4, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    if-ne v4, v5, :cond_1

    .line 169
    invoke-super {p0}, Lcom/android/launcher2/PagedView;->computeScroll()V

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->computeScrollHelper()Z

    move-result v3

    .line 173
    .local v3, scrollComputed:Z
    if-nez v3, :cond_0

    iget v4, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-ne v4, v5, :cond_0

    .line 174
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    long-to-float v4, v4

    const v5, 0x4e6e6b28

    div-float v2, v4, v5

    .line 175
    .local v2, now:F
    iget v4, p0, Lcom/android/launcher2/PagedView;->mSmoothingTime:F

    sub-float v4, v2, v4

    sget v5, Lcom/android/launcher2/SmoothPagedView;->SMOOTHING_CONSTANT:F

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->exp(D)D

    move-result-wide v4

    double-to-float v1, v4

    .line 177
    .local v1, e:F
    iget v4, p0, Lcom/android/launcher2/PagedView;->mTouchX:F

    iget v5, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    int-to-float v5, v5

    sub-float v0, v4, v5

    .line 178
    .local v0, dx:F
    iget v4, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    int-to-float v4, v4

    mul-float v5, v0, v1

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->getScrollY()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/android/launcher2/SmoothPagedView;->scrollTo(II)V

    .line 179
    iput v2, p0, Lcom/android/launcher2/PagedView;->mSmoothingTime:F

    .line 182
    const/high16 v4, 0x3f80

    cmpl-float v4, v0, v4

    if-gtz v4, :cond_2

    const/high16 v4, -0x4080

    cmpg-float v4, v0, v4

    if-gez v4, :cond_0

    .line 183
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->invalidate()V

    goto :goto_0
.end method

.method protected getScrollMode()I
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method protected init()V
    .locals 3

    .prologue
    .line 98
    invoke-super {p0}, Lcom/android/launcher2/PagedView;->init()V

    .line 100
    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->getScrollMode()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    .line 101
    iget v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    if-nez v0, :cond_0

    .line 102
    const v0, 0x451c4000

    iput v0, p0, Lcom/android/launcher2/SmoothPagedView;->mBaseLineFlingVelocity:F

    .line 103
    const v0, 0x3ecccccd

    iput v0, p0, Lcom/android/launcher2/SmoothPagedView;->mFlingVelocityInfluence:F

    .line 104
    new-instance v0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;

    invoke-direct {v0}, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    .line 105
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v0, v1, v2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    .line 107
    :cond_0
    return-void
.end method

.method protected snapToDestination()V
    .locals 2

    .prologue
    .line 111
    iget v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 112
    invoke-super {p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/SmoothPagedView;->getPageNearestToCenterOfScreen()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/SmoothPagedView;->snapToPageWithVelocity(II)V

    goto :goto_0
.end method

.method protected snapToPage(I)V
    .locals 3
    .parameter "whichPage"

    .prologue
    const/4 v2, 0x0

    .line 159
    iget v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 160
    invoke-super {p0, p1}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-direct {p0, p1, v2, v2}, Lcom/android/launcher2/SmoothPagedView;->snapToPageWithVelocity(IIZ)V

    goto :goto_0
.end method

.method protected snapToPageWithVelocity(II)V
    .locals 2
    .parameter "whichPage"
    .parameter "velocity"

    .prologue
    const/4 v1, 0x1

    .line 120
    iget v0, p0, Lcom/android/launcher2/SmoothPagedView;->mScrollMode:I

    if-ne v0, v1, :cond_0

    .line 121
    invoke-super {p0, p1, p2}, Lcom/android/launcher2/PagedView;->snapToPageWithVelocity(II)V

    .line 125
    :goto_0
    return-void

    .line 123
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher2/SmoothPagedView;->snapToPageWithVelocity(IIZ)V

    goto :goto_0
.end method
