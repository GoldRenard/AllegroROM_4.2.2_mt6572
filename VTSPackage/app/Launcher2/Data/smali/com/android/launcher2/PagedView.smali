.class public abstract Lcom/android/launcher2/PagedView;
.super Landroid/view/ViewGroup;
.source "PagedView.java"

# interfaces
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;
.implements Lcom/android/launcher2/ScreenEffect;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/PagedView$SavedState;,
        Lcom/android/launcher2/PagedView$ScrollInterpolator;,
        Lcom/android/launcher2/PagedView$PageSwitchListener;
    }
.end annotation


# static fields
.field protected static final ALPHA_QUANTIZE_LEVEL:F = 1.0E-4f

.field static final AUTOMATIC_PAGE_SPACING:I = -0x1

.field private static final DEBUG:Z = false

.field private static final FLING_THRESHOLD_VELOCITY:I = 0x1f4

.field protected static final INVALID_PAGE:I = -0x1

.field protected static final INVALID_POINTER:I = -0x1

.field protected static final MAX_PAGE_SNAP_DURATION:I = 0x2ee

.field private static final MIN_FLING_VELOCITY:I = 0xfa

.field private static final MIN_LENGTH_FOR_FLING:I = 0x19

.field private static final MIN_SNAP_VELOCITY:I = 0x5dc

.field protected static final NANOTIME_DIV:F = 1.0E9f

.field private static final OVERSCROLL_ACCELERATE_FACTOR:F = 2.0f

.field private static final OVERSCROLL_DAMP_FACTOR:F = 0.14f

.field protected static final PAGE_SNAP_ANIMATION_DURATION:I = 0x226

.field private static final RETURN_TO_ORIGINAL_PAGE_THRESHOLD:F = 0.33f

.field private static final SIGNIFICANT_MOVE_THRESHOLD:F = 0.4f

.field protected static final SLOW_PAGE_SNAP_ANIMATION_DURATION:I = 0x3b6

.field private static final TAG:Ljava/lang/String; = "PagedView"

.field protected static final TOUCH_STATE_NEXT_PAGE:I = 0x3

.field protected static final TOUCH_STATE_PREV_PAGE:I = 0x2

.field protected static final TOUCH_STATE_REST:I = 0x0

.field protected static final TOUCH_STATE_SCROLLING:I = 0x1

.field private static sCanCallEnterAppWidget:Z = false

.field private static sCanSendMessage:Z = false

.field protected static final sScrollIndicatorFadeInDuration:I = 0x96

.field protected static final sScrollIndicatorFadeOutDuration:I = 0x28a

.field protected static final sScrollIndicatorFlashDuration:I = 0x28a


# instance fields
.field hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

.field protected mActivePointerId:I

.field protected mAllowLongPress:Z

.field protected mAllowOverScroll:Z

.field protected mCellCountX:I

.field protected mCellCountY:I

.field protected mCenterPagesVertically:Z

.field private mChildOffsets:[I

.field private mChildOffsetsWithLayoutScale:[I

.field private mChildRelativeOffsets:[I

.field protected mContentIsRefreshable:Z

.field protected mCurrentPage:I

.field private mDeferLoadAssociatedPagesUntilScrollCompletes:Z

.field protected mDeferScrollUpdate:Z

.field protected mDensity:F

.field protected mDirtyPageContent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mDownMotionX:F

.field protected mFadeInAdjacentScreens:Z

.field protected mFirstLayout:Z

.field protected mFlingThresholdVelocity:I

.field protected mForceDrawAllChildrenNextFrame:Z

.field protected mForceScreenScrolled:Z

.field private mHasScrollIndicator:Z

.field protected mIsDataReady:Z

.field protected mIsPageMoving:Z

.field protected mLastMotionX:F

.field protected mLastMotionXRemainder:F

.field protected mLastMotionY:F

.field private mLastScreenCenter:I

.field protected mLayoutScale:F

.field protected mLongClickListener:Landroid/view/View$OnLongClickListener;

.field protected mMaxScrollX:I

.field private mMaximumVelocity:I

.field protected mMinFlingVelocity:I

.field protected mMinSnapVelocity:I

.field private mMinimumWidth:I

.field protected mNextPage:I

.field protected mOverScrollX:I

.field protected mPageLayoutHeightGap:I

.field protected mPageLayoutPaddingBottom:I

.field protected mPageLayoutPaddingLeft:I

.field protected mPageLayoutPaddingRight:I

.field protected mPageLayoutPaddingTop:I

.field protected mPageLayoutWidthGap:I

.field protected mPageSpacing:I

.field private mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

.field private mPagingTouchSlop:I

.field private mScrollIndicator:Landroid/view/View;

.field private mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

.field private mScrollIndicatorPaddingLeft:I

.field private mScrollIndicatorPaddingRight:I

.field protected mScroller:Landroid/widget/Scroller;

.field private mScrollingPaused:Z

.field private mShouldShowScrollIndicator:Z

.field private mShouldShowScrollIndicatorImmediately:Z

.field protected mSmoothingTime:F

.field protected mTempVisiblePagesRange:[I

.field protected mTotalMotionX:F

.field protected mTouchSlop:I

.field protected mTouchState:I

.field protected mTouchX:F

.field protected mUnboundedScrollX:I

.field protected mUsePagingTouchSlop:Z

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 194
    sput-boolean v0, Lcom/android/launcher2/PagedView;->sCanSendMessage:Z

    .line 196
    sput-boolean v0, Lcom/android/launcher2/PagedView;->sCanCallEnterAppWidget:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 204
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 205
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 209
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v5, 0x2

    const/4 v4, -0x1

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 212
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 92
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mFirstLayout:Z

    .line 95
    iput v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 105
    iput v4, p0, Lcom/android/launcher2/PagedView;->mLastScreenCenter:I

    .line 116
    iput v2, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 117
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mForceScreenScrolled:Z

    .line 121
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    .line 134
    iput v2, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    .line 135
    iput v2, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    .line 137
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mAllowOverScroll:Z

    .line 139
    new-array v1, v5, [I

    iput-object v1, p0, Lcom/android/launcher2/PagedView;->mTempVisiblePagesRange:[I

    .line 148
    const/high16 v1, 0x3f80

    iput v1, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 152
    iput v4, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 159
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    .line 162
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mFadeInAdjacentScreens:Z

    .line 166
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mUsePagingTouchSlop:Z

    .line 170
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mDeferScrollUpdate:Z

    .line 172
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    .line 175
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    .line 182
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mHasScrollIndicator:Z

    .line 183
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicator:Z

    .line 184
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    .line 188
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mScrollingPaused:Z

    .line 2084
    new-instance v1, Lcom/android/launcher2/PagedView$1;

    invoke-direct {v1, p0}, Lcom/android/launcher2/PagedView$1;-><init>(Lcom/android/launcher2/PagedView;)V

    iput-object v1, p0, Lcom/android/launcher2/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    .line 214
    sget-object v1, Lcom/android/launcher/R$styleable;->PagedView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 216
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->setPageSpacing(I)V

    .line 217
    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingTop:I

    .line 219
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingBottom:I

    .line 221
    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingLeft:I

    .line 223
    const/4 v1, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingRight:I

    .line 225
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutWidthGap:I

    .line 227
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPageLayoutHeightGap:I

    .line 229
    const/4 v1, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorPaddingLeft:I

    .line 231
    const/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorPaddingRight:I

    .line 233
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 235
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->setHapticFeedbackEnabled(Z)V

    .line 236
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->init()V

    .line 237
    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher2/PagedView;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    return-object v0
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 1573
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 1574
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1576
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1577
    return-void
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .locals 5
    .parameter "ev"

    .prologue
    .line 1587
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const v4, 0xff00

    and-int/2addr v3, v4

    shr-int/lit8 v2, v3, 0x8

    .line 1589
    .local v2, pointerIndex:I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 1590
    .local v1, pointerId:I
    iget v3, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    if-ne v1, v3, :cond_0

    .line 1594
    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 1595
    .local v0, newPointerIndex:I
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, p0, Lcom/android/launcher2/PagedView;->mDownMotionX:F

    iput v3, p0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    .line 1596
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    iput v3, p0, Lcom/android/launcher2/PagedView;->mLastMotionY:F

    .line 1597
    const/4 v3, 0x0

    iput v3, p0, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    .line 1598
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1599
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_0

    .line 1600
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 1603
    .end local v0           #newPointerIndex:I
    :cond_0
    return-void

    .line 1594
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private overScrollInfluenceCurve(F)F
    .locals 2
    .parameter "f"

    .prologue
    const/high16 v1, 0x3f80

    .line 1218
    sub-float/2addr p1, v1

    .line 1219
    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, v1

    return v0
.end method

.method private releaseVelocityTracker()V
    .locals 1

    .prologue
    .line 1580
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 1581
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1582
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1584
    :cond_0
    return-void
.end method

.method private searchIMTKWidget(Landroid/view/View;)Landroid/view/View;
    .locals 4
    .parameter "hostView"

    .prologue
    .line 2503
    instance-of v3, p1, Lcom/mediatek/common/widget/IMtkWidget;

    if-eqz v3, :cond_0

    .line 2514
    .end local p1
    :goto_0
    return-object p1

    .line 2505
    .restart local p1
    :cond_0
    instance-of v3, p1, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    move-object v3, p1

    .line 2506
    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 2507
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_2

    move-object v3, p1

    .line 2508
    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/launcher2/PagedView;->searchIMTKWidget(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    .line 2509
    .local v2, mtkWidgetView:Landroid/view/View;
    if-eqz v2, :cond_1

    move-object p1, v2

    .line 2510
    goto :goto_0

    .line 2507
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2514
    .end local v0           #childCount:I
    .end local v1           #i:I
    .end local v2           #mtkWidgetView:Landroid/view/View;
    :cond_2
    const/4 p1, 0x0

    goto :goto_0
.end method

.method private updateScrollingIndicator()V
    .locals 2

    .prologue
    .line 2179
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    .line 2189
    :cond_0
    :goto_0
    return-void

    .line 2180
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2182
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2183
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 2184
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->updateScrollingIndicatorPosition()V

    .line 2186
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicator:Z

    if-eqz v0, :cond_0

    .line 2187
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->showScrollingIndicator(Z)V

    goto :goto_0
.end method

.method private updateScrollingIndicatorPosition()V
    .locals 14

    .prologue
    .line 2192
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v10

    if-nez v10, :cond_1

    .line 2215
    :cond_0
    :goto_0
    return-void

    .line 2193
    :cond_1
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v10, :cond_0

    .line 2194
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v6

    .line 2195
    .local v6, numPages:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v8

    .line 2196
    .local v8, pageWidth:I
    const/4 v10, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 2197
    .local v4, lastChildIndex:I
    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v10

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v11

    sub-int v5, v10, v11

    .line 2198
    .local v5, maxScrollX:I
    iget v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorPaddingLeft:I

    sub-int v10, v8, v10

    iget v11, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorPaddingRight:I

    sub-int v9, v10, v11

    .line 2199
    .local v9, trackWidth:I
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    iget-object v11, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getPaddingLeft()I

    move-result v11

    sub-int/2addr v10, v11

    iget-object v11, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getPaddingRight()I

    move-result v11

    sub-int v3, v10, v11

    .line 2202
    .local v3, indicatorWidth:I
    const/4 v10, 0x0

    const/high16 v11, 0x3f80

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v12

    int-to-float v12, v12

    int-to-float v13, v5

    div-float/2addr v12, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 2203
    .local v7, offset:F
    div-int v2, v9, v6

    .line 2204
    .local v2, indicatorSpace:I
    sub-int v10, v9, v2

    int-to-float v10, v10

    mul-float/2addr v10, v7

    float-to-int v10, v10

    iget v11, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorPaddingLeft:I

    add-int v1, v10, v11

    .line 2205
    .local v1, indicatorPos:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->hasElasticScrollIndicator()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 2206
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    if-eq v10, v2, :cond_2

    .line 2207
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iput v2, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 2208
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->requestLayout()V

    .line 2214
    :cond_2
    :goto_1
    iget-object v10, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    int-to-float v11, v1

    invoke-virtual {v10, v11}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_0

    .line 2211
    :cond_3
    div-int/lit8 v10, v2, 0x2

    div-int/lit8 v11, v3, 0x2

    sub-int v0, v10, v11

    .line 2212
    .local v0, indicatorCenterOffset:I
    add-int/2addr v1, v0

    goto :goto_1
.end method


# virtual methods
.method protected acceleratedOverScroll(F)V
    .locals 6
    .parameter "amount"

    .prologue
    const/4 v5, 0x0

    .line 1223
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v2

    .line 1227
    .local v2, screenSize:I
    const/high16 v3, 0x4000

    int-to-float v4, v2

    div-float v4, p1, v4

    mul-float v0, v3, v4

    .line 1229
    .local v0, f:F
    cmpl-float v3, v0, v5

    if-nez v3, :cond_0

    .line 1245
    :goto_0
    return-void

    .line 1232
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f80

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_1

    .line 1233
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float/2addr v0, v3

    .line 1236
    :cond_1
    int-to-float v3, v2

    mul-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1237
    .local v1, overScrollAmount:I
    cmpg-float v3, p1, v5

    if-gez v3, :cond_2

    .line 1238
    iput v1, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 1239
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v4

    invoke-super {p0, v3, v4}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 1244
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    goto :goto_0

    .line 1241
    :cond_2
    iget v3, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 1242
    iget v3, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v4

    invoke-super {p0, v3, v4}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_1
.end method

.method public addFocusables(Ljava/util/ArrayList;II)V
    .locals 2
    .parameter
    .parameter "direction"
    .parameter "focusableMode"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 960
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 961
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 963
    :cond_0
    const/16 v0, 0x11

    if-ne p2, v0, :cond_2

    .line 964
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-lez v0, :cond_1

    .line 965
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 972
    :cond_1
    :goto_0
    return-void

    .line 967
    :cond_2
    const/16 v0, 0x42

    if-ne p2, v0, :cond_1

    .line 968
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    .line 969
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    goto :goto_0
.end method

.method public allowLongPress()Z
    .locals 1

    .prologue
    .line 1893
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    return v0
.end method

.method protected cancelCurrentPageLongPress()V
    .locals 2

    .prologue
    .line 1190
    iget-boolean v1, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    if-eqz v1, :cond_0

    .line 1191
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    .line 1195
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 1196
    .local v0, currentPage:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1197
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 1200
    .end local v0           #currentPage:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected cancelScrollingIndicatorAnimations()V
    .locals 1

    .prologue
    .line 2120
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 2121
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 2123
    :cond_0
    return-void
.end method

.method public computeScroll()V
    .locals 0

    .prologue
    .line 501
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->computeScrollHelper()Z

    .line 502
    return-void
.end method

.method protected computeScrollHelper()Z
    .locals 7

    .prologue
    const/4 v6, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 452
    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 454
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v3

    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v3

    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    if-ne v3, v4, :cond_0

    iget v3, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 457
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/android/launcher2/PagedView;->scrollTo(II)V

    .line 459
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    .line 496
    :cond_2
    :goto_0
    return v2

    .line 461
    :cond_3
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    if-eq v4, v6, :cond_7

    .line 463
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->moveInAppWidget(I)V

    .line 464
    sput-boolean v2, Lcom/android/launcher2/PagedView;->sCanCallEnterAppWidget:Z

    .line 465
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    iget v5, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-eq v4, v5, :cond_4

    .line 466
    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->leaveAppWidget(I)V

    .line 467
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->enterAppWidget(I)V

    .line 469
    :cond_4
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 470
    iput v6, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 471
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->notifyPageSwitchListener()V

    .line 474
    iget-boolean v4, p0, Lcom/android/launcher2/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    if-eqz v4, :cond_5

    .line 475
    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->loadAssociatedPages(I)V

    .line 476
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    .line 481
    :cond_5
    iget v3, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-nez v3, :cond_6

    .line 482
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->pageEndMoving()V

    .line 486
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "accessibility"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 488
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 489
    const/16 v3, 0x1000

    invoke-static {v3}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 491
    .local v1, ev:Landroid/view/accessibility/AccessibilityEvent;
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPageDescription()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 492
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_0

    .end local v0           #accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    .end local v1           #ev:Landroid/view/accessibility/AccessibilityEvent;
    :cond_7
    move v2, v3

    .line 496
    goto :goto_0
.end method

.method protected dampedOverScroll(F)V
    .locals 6
    .parameter "amount"

    .prologue
    const/4 v5, 0x0

    .line 1248
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v2

    .line 1250
    .local v2, screenSize:I
    int-to-float v3, v2

    div-float v0, p1, v3

    .line 1252
    .local v0, f:F
    cmpl-float v3, v0, v5

    if-nez v3, :cond_0

    .line 1269
    :goto_0
    return-void

    .line 1253
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float v3, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-direct {p0, v4}, Lcom/android/launcher2/PagedView;->overScrollInfluenceCurve(F)F

    move-result v4

    mul-float v0, v3, v4

    .line 1256
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f80

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_1

    .line 1257
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float/2addr v0, v3

    .line 1260
    :cond_1
    const v3, 0x3e0f5c29

    mul-float/2addr v3, v0

    int-to-float v4, v2

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1261
    .local v1, overScrollAmount:I
    cmpg-float v3, p1, v5

    if-gez v3, :cond_2

    .line 1262
    iput v1, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 1263
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v4

    invoke-super {p0, v3, v4}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 1268
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    goto :goto_0

    .line 1265
    :cond_2
    iget v3, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 1266
    iget v3, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v4

    invoke-super {p0, v3, v4}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_1
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 1146
    const/high16 v0, 0x3f80

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    .line 1147
    return-void
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;F)V
    .locals 11
    .parameter "ev"
    .parameter "touchSlopScale"

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 1158
    iget v10, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 1159
    .local v0, pointerIndex:I
    const/4 v10, -0x1

    if-ne v0, v10, :cond_1

    .line 1160
    const-string v9, "PagedView"

    const-string v10, "determineScrollingStart pointerIndex == -1."

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1187
    :cond_0
    :goto_0
    return-void

    .line 1163
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    .line 1164
    .local v2, x:F
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 1165
    .local v6, y:F
    iget v10, p0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    sub-float v10, v2, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v3, v10

    .line 1166
    .local v3, xDiff:I
    iget v10, p0, Lcom/android/launcher2/PagedView;->mLastMotionY:F

    sub-float v10, v6, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v7, v10

    .line 1168
    .local v7, yDiff:I
    iget v10, p0, Lcom/android/launcher2/PagedView;->mTouchSlop:I

    int-to-float v10, v10

    mul-float/2addr v10, p2

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1169
    .local v1, touchSlop:I
    iget v10, p0, Lcom/android/launcher2/PagedView;->mPagingTouchSlop:I

    if-le v3, v10, :cond_5

    move v5, v9

    .line 1170
    .local v5, xPaged:Z
    :goto_1
    if-le v3, v1, :cond_6

    move v4, v9

    .line 1171
    .local v4, xMoved:Z
    :goto_2
    if-le v7, v1, :cond_2

    move v8, v9

    .line 1173
    .local v8, yMoved:Z
    :cond_2
    if-nez v4, :cond_3

    if-nez v5, :cond_3

    if-eqz v8, :cond_0

    .line 1174
    :cond_3
    iget-boolean v10, p0, Lcom/android/launcher2/PagedView;->mUsePagingTouchSlop:Z

    if-eqz v10, :cond_7

    if-eqz v5, :cond_4

    .line 1176
    :goto_3
    iput v9, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1177
    iget v9, p0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    iget v10, p0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    sub-float/2addr v10, v2

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    add-float/2addr v9, v10

    iput v9, p0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    .line 1178
    iput v2, p0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    .line 1179
    const/4 v9, 0x0

    iput v9, p0, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    .line 1180
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/android/launcher2/PagedView;->mTouchX:F

    .line 1181
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    long-to-float v9, v9

    const v10, 0x4e6e6b28

    div-float/2addr v9, v10

    iput v9, p0, Lcom/android/launcher2/PagedView;->mSmoothingTime:F

    .line 1182
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->pageBeginMoving()V

    .line 1185
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->cancelCurrentPageLongPress()V

    goto :goto_0

    .end local v4           #xMoved:Z
    .end local v5           #xPaged:Z
    .end local v8           #yMoved:Z
    :cond_5
    move v5, v8

    .line 1169
    goto :goto_1

    .restart local v5       #xPaged:Z
    :cond_6
    move v4, v8

    .line 1170
    goto :goto_2

    .line 1174
    .restart local v4       #xMoved:Z
    .restart local v8       #yMoved:Z
    :cond_7
    if-eqz v4, :cond_4

    goto :goto_3
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 18
    .parameter "canvas"

    .prologue
    .line 852
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v13

    div-int/lit8 v4, v13, 0x2

    .line 855
    .local v4, halfScreenSize:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    add-int v10, v13, v4

    .line 857
    .local v10, screenCenter:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mLastScreenCenter:I

    if-ne v10, v13, :cond_0

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/launcher2/PagedView;->mForceScreenScrolled:Z

    if-eqz v13, :cond_1

    .line 860
    :cond_0
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/launcher2/PagedView;->mForceScreenScrolled:Z

    .line 861
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/launcher2/PagedView;->screenScrolled(I)V

    .line 862
    move-object/from16 v0, p0

    iput v10, v0, Lcom/android/launcher2/PagedView;->mLastScreenCenter:I

    .line 866
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v8

    .line 873
    .local v8, pageCount:I
    if-lez v8, :cond_3

    .line 874
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/PagedView;->mTempVisiblePagesRange:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/launcher2/PagedView;->getVisiblePages([I)V

    .line 875
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/PagedView;->mTempVisiblePagesRange:[I

    const/4 v14, 0x0

    aget v6, v13, v14

    .line 876
    .local v6, leftScreen:I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/PagedView;->mTempVisiblePagesRange:[I

    const/4 v14, 0x1

    aget v9, v13, v14

    .line 877
    .local v9, rightScreen:I
    const/4 v13, -0x1

    if-eq v6, v13, :cond_3

    const/4 v13, -0x1

    if-eq v9, v13, :cond_3

    .line 878
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getDrawingTime()J

    move-result-wide v2

    .line 880
    .local v2, drawingTime:J
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v13

    if-eqz v13, :cond_5

    if-ge v9, v6, :cond_5

    .line 881
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 882
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v12

    .line 883
    .local v12, width:I
    mul-int v7, v8, v12

    .line 884
    .local v7, offset:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v13, v14, :cond_4

    .line 885
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13, v2, v3}, Lcom/android/launcher2/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 886
    int-to-float v13, v7

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    .line 887
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13, v2, v3}, Lcom/android/launcher2/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 895
    :cond_2
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 915
    .end local v2           #drawingTime:J
    .end local v6           #leftScreen:I
    .end local v7           #offset:I
    .end local v9           #rightScreen:I
    .end local v12           #width:I
    :cond_3
    :goto_1
    return-void

    .line 889
    .restart local v2       #drawingTime:J
    .restart local v6       #leftScreen:I
    .restart local v7       #offset:I
    .restart local v9       #rightScreen:I
    .restart local v12       #width:I
    :cond_4
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    if-gez v13, :cond_2

    .line 890
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13, v2, v3}, Lcom/android/launcher2/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 891
    neg-int v13, v7

    int-to-float v13, v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    .line 892
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13, v2, v3}, Lcom/android/launcher2/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    goto :goto_0

    .line 898
    .end local v7           #offset:I
    .end local v12           #width:I
    :cond_5
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 899
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v13

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getRight()I

    move-result v16

    add-int v15, v15, v16

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getLeft()I

    move-result v16

    sub-int v15, v15, v16

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v16

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getBottom()I

    move-result v17

    add-int v16, v16, v17

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getTop()I

    move-result v17

    sub-int v16, v16, v17

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v13, v14, v15, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 903
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v13

    add-int/lit8 v5, v13, -0x1

    .local v5, i:I
    :goto_2
    if-ltz v5, :cond_8

    .line 904
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    .line 905
    .local v11, v:Landroid/view/View;
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/launcher2/PagedView;->mForceDrawAllChildrenNextFrame:Z

    if-nez v13, :cond_6

    if-gt v6, v5, :cond_7

    if-gt v5, v9, :cond_7

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/PagedView;->shouldDrawChild(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 907
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v11, v2, v3}, Lcom/android/launcher2/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 903
    :cond_7
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 910
    .end local v11           #v:Landroid/view/View;
    :cond_8
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/launcher2/PagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 911
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_1
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 3
    .parameter "focused"
    .parameter "direction"

    .prologue
    const/4 v0, 0x1

    .line 944
    const/16 v1, 0x11

    if-ne p2, v1, :cond_0

    .line 945
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    if-lez v1, :cond_1

    .line 946
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 955
    :goto_0
    return v0

    .line 949
    :cond_0
    const/16 v1, 0x42

    if-ne p2, v1, :cond_1

    .line 950
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    .line 951
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 955
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    goto :goto_0
.end method

.method distanceInfluenceForSnapDuration(F)F
    .locals 4
    .parameter "f"

    .prologue
    .line 1687
    const/high16 v0, 0x3f00

    sub-float/2addr p1, v0

    .line 1688
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 1689
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public enterAppWidget(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2285
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2286
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2287
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1}, Lcom/mediatek/common/widget/IMtkWidget;->enterAppwidgetScreen()V

    .line 2289
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "action_move: enterAppWidgetScreen whichMtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2293
    :cond_0
    return-void
.end method

.method protected flashScrollingIndicator(Z)V
    .locals 3
    .parameter "animated"

    .prologue
    .line 2091
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2092
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->showScrollingIndicator(Z)V

    .line 2093
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x28a

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher2/PagedView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2094
    return-void

    .line 2092
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public focusableViewAvailable(Landroid/view/View;)V
    .locals 4
    .parameter "focused"

    .prologue
    .line 983
    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 984
    .local v0, current:Landroid/view/View;
    move-object v2, p1

    .line 986
    .local v2, v:Landroid/view/View;
    :goto_0
    if-ne v2, v0, :cond_1

    .line 987
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->focusableViewAvailable(Landroid/view/View;)V

    .line 997
    :cond_0
    return-void

    .line 990
    :cond_1
    if-eq v2, p0, :cond_0

    .line 993
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 994
    .local v1, parent:Landroid/view/ViewParent;
    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_0

    .line 995
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .end local v2           #v:Landroid/view/View;
    check-cast v2, Landroid/view/View;

    .restart local v2       #v:Landroid/view/View;
    goto :goto_0
.end method

.method protected getAssociatedLowerPageBound(I)I
    .locals 2
    .parameter "page"

    .prologue
    .line 1981
    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected getAssociatedUpperPageBound(I)I
    .locals 3
    .parameter "page"

    .prologue
    .line 1984
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 1985
    .local v0, count:I
    add-int/lit8 v1, p1, 0x1

    add-int/lit8 v2, v0, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    return v1
.end method

.method protected getChildIndexForRelativeOffset(I)I
    .locals 7
    .parameter "relativeOffset"

    .prologue
    .line 1617
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 1620
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1621
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 1622
    .local v2, left:I
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v4

    add-int v3, v2, v4

    .line 1623
    .local v3, right:I
    if-gt v2, p1, :cond_0

    if-gt p1, v3, :cond_0

    .line 1625
    const-string v4, "PagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getChildIndexForRelativeOffset i = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1630
    .end local v1           #i:I
    .end local v2           #left:I
    .end local v3           #right:I
    :goto_1
    return v1

    .line 1620
    .restart local v1       #i:I
    .restart local v2       #left:I
    .restart local v3       #right:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1630
    .end local v2           #left:I
    .end local v3           #right:I
    :cond_1
    const/4 v1, -0x1

    goto :goto_1
.end method

.method protected getChildOffset(I)I
    .locals 5
    .parameter "index"

    .prologue
    const/4 v2, 0x0

    .line 758
    iget v3, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    const/high16 v4, 0x3f80

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mChildOffsets:[I

    .line 761
    .local v0, childOffsets:[I
    :goto_0
    if-eqz v0, :cond_2

    aget v3, v0, p1

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    .line 762
    aget v2, v0, p1

    .line 774
    :cond_0
    :goto_1
    return v2

    .line 758
    .end local v0           #childOffsets:[I
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mChildOffsetsWithLayoutScale:[I

    goto :goto_0

    .line 764
    .restart local v0       #childOffsets:[I
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v3

    if-eqz v3, :cond_0

    .line 767
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 768
    .local v2, offset:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    if-ge v1, p1, :cond_3

    .line 769
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v3

    iget v4, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 768
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 771
    :cond_3
    if-eqz v0, :cond_0

    .line 772
    aput v2, v0, p1

    goto :goto_1
.end method

.method protected getChildWidth(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 1636
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 1641
    .local v0, measuredWidth:I
    iget v1, p0, Lcom/android/launcher2/PagedView;->mMinimumWidth:I

    .line 1642
    .local v1, minWidth:I
    if-le v1, v0, :cond_0

    .end local v1           #minWidth:I
    :goto_0
    return v1

    .restart local v1       #minWidth:I
    :cond_0
    move v1, v0

    goto :goto_0
.end method

.method getCurrentPage()I
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    return v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 4

    .prologue
    .line 2270
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0d0055

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getNextPage()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMTKWidgetView(I)Landroid/view/View;
    .locals 2
    .parameter "page"

    .prologue
    .line 2462
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2463
    .local v1, whichHostView:Landroid/view/View;
    invoke-direct {p0, v1}, Lcom/android/launcher2/PagedView;->searchIMTKWidget(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 2464
    .local v0, mtkWidgetView:Landroid/view/View;
    return-object v0
.end method

.method getNextPage()I
    .locals 2

    .prologue
    .line 288
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    goto :goto_0
.end method

.method getPageAt(I)Landroid/view/View;
    .locals 1
    .parameter "index"

    .prologue
    .line 296
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getPageCount()I
    .locals 1

    .prologue
    .line 292
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getPageForView(Landroid/view/View;)I
    .locals 5
    .parameter "v"

    .prologue
    .line 1876
    const/4 v2, -0x1

    .line 1877
    .local v2, result:I
    if-eqz p1, :cond_1

    .line 1878
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 1879
    .local v3, vp:Landroid/view/ViewParent;
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 1880
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1881
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 1886
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #vp:Landroid/view/ViewParent;
    :goto_1
    return v1

    .line 1880
    .restart local v0       #count:I
    .restart local v1       #i:I
    .restart local v3       #vp:Landroid/view/ViewParent;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #vp:Landroid/view/ViewParent;
    :cond_1
    move v1, v2

    .line 1886
    goto :goto_1
.end method

.method getPageNearestToCenterOfScreen()I
    .locals 13

    .prologue
    .line 1646
    const v7, 0x7fffffff

    .line 1647
    .local v7, minDistanceFromScreenCenter:I
    const/4 v8, -0x1

    .line 1648
    .local v8, minDistanceFromScreenCenterIndex:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v10

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    add-int v9, v10, v11

    .line 1649
    .local v9, screenCenter:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    .line 1650
    .local v1, childCount:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v1, :cond_1

    .line 1651
    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    .line 1652
    .local v6, layout:Landroid/view/View;
    invoke-virtual {p0, v6}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v2

    .line 1653
    .local v2, childWidth:I
    div-int/lit8 v4, v2, 0x2

    .line 1654
    .local v4, halfChildWidth:I
    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v10

    add-int v0, v10, v4

    .line 1655
    .local v0, childCenter:I
    sub-int v10, v0, v9

    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 1656
    .local v3, distanceFromScreenCenter:I
    if-ge v3, v7, :cond_0

    .line 1657
    move v7, v3

    .line 1658
    move v8, v5

    .line 1650
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1662
    .end local v0           #childCenter:I
    .end local v2           #childWidth:I
    .end local v3           #distanceFromScreenCenter:I
    .end local v4           #halfChildWidth:I
    .end local v6           #layout:Landroid/view/View;
    :cond_1
    const-string v10, "PagedView"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getPageNearestToCenterOfScreen: minDistanceFromScreenCenterIndex = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", mScrollX = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1665
    return v8
.end method

.method protected getRelativeChildOffset(I)I
    .locals 5
    .parameter "index"

    .prologue
    .line 779
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    aget v2, v2, p1

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 785
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    aget v0, v2, p1

    .line 799
    :cond_0
    :goto_0
    return v0

    .line 787
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingRight()I

    move-result v3

    add-int v1, v2, v3

    .line 788
    .local v1, padding:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildWidth(I)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 790
    .local v0, offset:I
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    if-eqz v2, :cond_0

    .line 791
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    aput v0, v2, p1

    goto :goto_0
.end method

.method protected getScaledMeasuredWidth(Landroid/view/View;)I
    .locals 5
    .parameter "child"

    .prologue
    .line 806
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    .line 807
    .local v1, measuredWidth:I
    iget v2, p0, Lcom/android/launcher2/PagedView;->mMinimumWidth:I

    .line 808
    .local v2, minWidth:I
    if-le v2, v1, :cond_0

    move v0, v2

    .line 809
    .local v0, maxWidth:I
    :goto_0
    int-to-float v3, v0

    iget v4, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    float-to-int v3, v3

    return v3

    .end local v0           #maxWidth:I
    :cond_0
    move v0, v1

    .line 808
    goto :goto_0
.end method

.method protected getScrollProgress(ILandroid/view/View;I)F
    .locals 7
    .parameter "screenCenter"
    .parameter "v"
    .parameter "page"

    .prologue
    const/high16 v6, 0x3f80

    .line 1203
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 1205
    .local v1, halfScreenSize:I
    invoke-virtual {p0, p2}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v4

    iget v5, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    add-int v3, v4, v5

    .line 1206
    .local v3, totalDistance:I
    invoke-virtual {p0, p3}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v4

    invoke-virtual {p0, p3}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v5

    sub-int/2addr v4, v5

    add-int/2addr v4, v1

    sub-int v0, p1, v4

    .line 1209
    .local v0, delta:I
    int-to-float v4, v0

    int-to-float v5, v3

    mul-float/2addr v5, v6

    div-float v2, v4, v5

    .line 1210
    .local v2, scrollProgress:F
    invoke-static {v2, v6}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1211
    const/high16 v4, -0x4080

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1212
    return v2
.end method

.method protected getScrollingIndicator()Landroid/view/View;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2067
    iget-boolean v1, p0, Lcom/android/launcher2/PagedView;->mHasScrollIndicator:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-nez v1, :cond_0

    .line 2068
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 2069
    .local v0, parent:Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 2070
    const v1, 0x7f07000b

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    .line 2071
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher2/PagedView;->mHasScrollIndicator:Z

    .line 2072
    iget-boolean v1, p0, Lcom/android/launcher2/PagedView;->mHasScrollIndicator:Z

    if-eqz v1, :cond_0

    .line 2073
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2077
    .end local v0           #parent:Landroid/view/ViewGroup;
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    return-object v1

    .restart local v0       #parent:Landroid/view/ViewGroup;
    :cond_1
    move v1, v2

    .line 2071
    goto :goto_0
.end method

.method protected getVisiblePages([I)V
    .locals 9
    .parameter "range"

    .prologue
    const/4 v5, -0x1

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 813
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v2

    .line 815
    .local v2, pageCount:I
    if-lez v2, :cond_4

    .line 817
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v5

    if-eqz v5, :cond_1

    iget v5, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    if-ltz v5, :cond_0

    iget v5, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    iget v6, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v5, v6, :cond_1

    .line 818
    :cond_0
    add-int/lit8 v5, v2, -0x1

    aput v5, p1, v7

    .line 819
    aput v7, p1, v8

    .line 844
    :goto_0
    return-void

    .line 821
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v4

    .line 822
    .local v4, screenWidth:I
    const/4 v1, 0x0

    .line 823
    .local v1, leftScreen:I
    const/4 v3, 0x0

    .line 824
    .local v3, rightScreen:I
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 826
    .local v0, currPage:Landroid/view/View;
    :goto_1
    add-int/lit8 v5, v2, -0x1

    if-ge v1, v5, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v6

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_2

    .line 827
    add-int/lit8 v1, v1, 0x1

    .line 828
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_1

    .line 830
    :cond_2
    move v3, v1

    .line 831
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 833
    :goto_2
    add-int/lit8 v5, v2, -0x1

    if-ge v3, v5, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v6

    add-int/2addr v6, v4

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    .line 834
    add-int/lit8 v3, v3, 0x1

    .line 835
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_2

    .line 837
    :cond_3
    aput v1, p1, v7

    .line 838
    aput v3, p1, v8

    goto :goto_0

    .line 841
    .end local v0           #currPage:Landroid/view/View;
    .end local v1           #leftScreen:I
    .end local v3           #rightScreen:I
    .end local v4           #screenWidth:I
    :cond_4
    aput v5, p1, v7

    .line 842
    aput v5, p1, v8

    goto :goto_0
.end method

.method protected hasElasticScrollIndicator()Z
    .locals 1

    .prologue
    .line 2175
    const/4 v0, 0x1

    return v0
.end method

.method public hideScrollIndicatorTrack()V
    .locals 0

    .prologue
    .line 2221
    return-void
.end method

.method protected hideScrollingIndicator(Z)V
    .locals 5
    .parameter "immediately"

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 2126
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    if-gt v0, v2, :cond_1

    .line 2168
    :cond_0
    :goto_0
    return-void

    .line 2127
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2133
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isPageMoving()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2135
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2136
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2145
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 2146
    if-nez p1, :cond_2

    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mScrollingPaused:Z

    if-eqz v0, :cond_3

    .line 2147
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2148
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    .line 2150
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    .line 2151
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x28a

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2152
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/launcher2/PagedView$2;

    invoke-direct {v1, p0}, Lcom/android/launcher2/PagedView$2;-><init>(Lcom/android/launcher2/PagedView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2165
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0
.end method

.method protected hitsNextPage(FF)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1027
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v0

    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hitsPreviousPage(FF)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1020
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v0

    iget v1, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected indexToPage(I)I
    .locals 0
    .parameter "index"

    .prologue
    .line 300
    return p1
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 243
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    .line 244
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 245
    new-instance v1, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/android/launcher2/PagedView$ScrollInterpolator;

    invoke-direct {v3}, Lcom/android/launcher2/PagedView$ScrollInterpolator;-><init>()V

    invoke-direct {v1, v2, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v1, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    .line 246
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 247
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/launcher2/PagedView;->mCenterPagesVertically:Z

    .line 249
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 250
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mTouchSlop:I

    .line 251
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mPagingTouchSlop:I

    .line 252
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mMaximumVelocity:I

    .line 253
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    .line 255
    const/high16 v1, 0x43fa

    iget v2, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mFlingThresholdVelocity:I

    .line 256
    const/high16 v1, 0x437a

    iget v2, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mMinFlingVelocity:I

    .line 257
    const v1, 0x44bb8000

    iget v2, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/android/launcher2/PagedView;->mMinSnapVelocity:I

    .line 258
    invoke-virtual {p0, p0}, Lcom/android/launcher2/PagedView;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 259
    return-void
.end method

.method protected invalidateCachedOffsets()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 739
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 740
    .local v0, count:I
    if-nez v0, :cond_1

    .line 741
    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsets:[I

    .line 742
    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    .line 743
    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsetsWithLayoutScale:[I

    .line 755
    :cond_0
    return-void

    .line 747
    :cond_1
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsets:[I

    .line 748
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    .line 749
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsetsWithLayoutScale:[I

    .line 750
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 751
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsets:[I

    aput v3, v2, v1

    .line 752
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildRelativeOffsets:[I

    aput v3, v2, v1

    .line 753
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mChildOffsetsWithLayoutScale:[I

    aput v3, v2, v1

    .line 750
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected invalidatePageData()V
    .locals 2

    .prologue
    .line 2003
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/PagedView;->invalidatePageData(IZ)V

    .line 2004
    return-void
.end method

.method protected invalidatePageData(I)V
    .locals 1
    .parameter "currentPage"

    .prologue
    .line 2007
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/PagedView;->invalidatePageData(IZ)V

    .line 2008
    return-void
.end method

.method protected invalidatePageData(IZ)V
    .locals 8
    .parameter "currentPage"
    .parameter "immediateAndOnly"

    .prologue
    const/high16 v7, 0x4000

    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 2012
    const-string v2, "PagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalidatePageData: currentPage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", immediateAndOnly = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mIsDataReady = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mContentIsRefreshable = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mScrollX = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", this = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2018
    iget-boolean v2, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    if-nez v2, :cond_1

    .line 2062
    :cond_0
    :goto_0
    return-void

    .line 2022
    :cond_1
    iget-boolean v2, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    if-eqz v2, :cond_0

    .line 2024
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2, v6}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 2025
    iput v5, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 2028
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->syncPages()V

    .line 2032
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredHeight()I

    move-result v3

    invoke-static {v3, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/android/launcher2/PagedView;->measure(II)V

    .line 2036
    if-le p1, v5, :cond_2

    .line 2037
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->setCurrentPage(I)V

    .line 2041
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 2042
    .local v0, count:I
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 2043
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 2044
    iget-object v2, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2043
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2048
    :cond_3
    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v2, p2}, Lcom/android/launcher2/PagedView;->loadAssociatedPages(IZ)V

    .line 2050
    const-string v2, "PagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[--Case Watcher--]invalidatePageData: currentPage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", immediateAndOnly = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mScrollX = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2058
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    .line 2060
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->requestLayout()V

    goto/16 :goto_0
.end method

.method protected isDataReady()Z
    .locals 1

    .prologue
    .line 276
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    return v0
.end method

.method protected isPageMoving()Z
    .locals 1

    .prologue
    .line 385
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    return v0
.end method

.method protected isScrollingIndicatorEnabled()Z
    .locals 1

    .prologue
    .line 2081
    const/4 v0, 0x1

    return v0
.end method

.method public isSupportCycleSlidingScreen()Z
    .locals 1

    .prologue
    .line 2522
    const/4 v0, 0x0

    return v0
.end method

.method public leaveAppWidget(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2301
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2302
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2303
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1}, Lcom/mediatek/common/widget/IMtkWidget;->leaveAppwidgetScreen()V

    .line 2305
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "leaveAppWidgetScreen whichMtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2308
    :cond_0
    return-void
.end method

.method protected loadAssociatedPages(I)V
    .locals 1
    .parameter "page"

    .prologue
    .line 1935
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/PagedView;->loadAssociatedPages(IZ)V

    .line 1936
    return-void
.end method

.method protected loadAssociatedPages(IZ)V
    .locals 10
    .parameter "page"
    .parameter "immediateAndOnly"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1940
    const-string v5, "PagedView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "loadAssociatedPages: page = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", immediateAndOnly = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",mContentIsRefreshable = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", mDirtyPageContent = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1945
    iget-boolean v5, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    if-eqz v5, :cond_7

    .line 1946
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    .line 1947
    .local v0, count:I
    if-ge p1, v0, :cond_7

    .line 1948
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getAssociatedLowerPageBound(I)I

    move-result v3

    .line 1949
    .local v3, lowerPageBound:I
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getAssociatedUpperPageBound(I)I

    move-result v4

    .line 1951
    .local v4, upperPageBound:I
    const-string v5, "PagedView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "loadAssociatedPages: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", page = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", count = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1955
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_3

    .line 1956
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/Page;

    .line 1957
    .local v2, layout:Lcom/android/launcher2/Page;
    if-lt v1, v3, :cond_0

    if-le v1, v4, :cond_2

    .line 1958
    :cond_0
    invoke-interface {v2}, Lcom/android/launcher2/Page;->getPageChildCount()I

    move-result v5

    if-lez v5, :cond_1

    .line 1959
    invoke-interface {v2}, Lcom/android/launcher2/Page;->removeAllViewsOnPage()V

    .line 1961
    :cond_1
    iget-object v5, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v1, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1955
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1965
    .end local v2           #layout:Lcom/android/launcher2/Page;
    :cond_3
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_7

    .line 1966
    if-eq v1, p1, :cond_5

    if-eqz p2, :cond_5

    .line 1965
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1969
    :cond_5
    if-gt v3, v1, :cond_4

    if-gt v1, v4, :cond_4

    .line 1970
    iget-object v5, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1971
    if-ne v1, p1, :cond_6

    if-eqz p2, :cond_6

    move v5, v6

    :goto_3
    invoke-virtual {p0, v1, v5}, Lcom/android/launcher2/PagedView;->syncPageItems(IZ)V

    .line 1972
    iget-object v5, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v1, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    move v5, v7

    .line 1971
    goto :goto_3

    .line 1978
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #lowerPageBound:I
    .end local v4           #upperPageBound:I
    :cond_7
    return-void
.end method

.method protected maxOverScroll()F
    .locals 3

    .prologue
    .line 1278
    const/high16 v0, 0x3f80

    .line 1279
    .local v0, f:F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    div-float v1, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/launcher2/PagedView;->overScrollInfluenceCurve(F)F

    move-result v2

    mul-float v0, v1, v2

    .line 1280
    const v1, 0x3e0f5c29

    mul-float/2addr v1, v0

    return v1
.end method

.method public moveInAppWidget(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2349
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2350
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2351
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->moveIn(I)V

    .line 2352
    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/launcher2/PagedView;->sCanSendMessage:Z

    .line 2354
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "moveIn: mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2357
    :cond_0
    return-void
.end method

.method public moveOutAppWidget(I)Z
    .locals 6
    .parameter "page"

    .prologue
    .line 2366
    const/4 v1, 0x1

    .line 2367
    .local v1, result:Z
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2368
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 2370
    const-string v3, "MTKWidgetView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "moveOut: mtkWidgetView = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2372
    const/4 v3, 0x0

    sput-boolean v3, Lcom/android/launcher2/PagedView;->sCanSendMessage:Z

    .line 2373
    check-cast v0, Lcom/mediatek/common/widget/IMtkWidget;

    .end local v0           #mtkWidgetView:Landroid/view/View;
    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-interface {v0, v3}, Lcom/mediatek/common/widget/IMtkWidget;->moveOut(I)Z

    move-result v1

    move v2, v1

    .line 2376
    .end local v1           #result:Z
    .local v2, result:I
    :goto_0
    return v2

    .end local v2           #result:I
    .restart local v0       #mtkWidgetView:Landroid/view/View;
    .restart local v1       #result:Z
    :cond_0
    move v2, v1

    .restart local v2       #result:I
    goto :goto_0
.end method

.method protected notifyPageSwitchListener()V
    .locals 3

    .prologue
    .line 365
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

    if-eqz v0, :cond_0

    .line 366
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-interface {v0, v1, v2}, Lcom/android/launcher2/PagedView$PageSwitchListener;->onPageSwitch(Landroid/view/View;I)V

    .line 368
    :cond_0
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 729
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mForceScreenScrolled:Z

    .line 730
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    .line 731
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidateCachedOffsets()V

    .line 732
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 736
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "event"

    .prologue
    const/16 v4, 0x9

    const/4 v3, 0x0

    .line 1545
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v2

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_0

    .line 1546
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 1569
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    :goto_0
    return v2

    .line 1551
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    .line 1552
    const/4 v1, 0x0

    .line 1553
    .local v1, vscroll:F
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v0

    .line 1558
    .local v0, hscroll:F
    :goto_1
    cmpl-float v2, v0, v3

    if-nez v2, :cond_1

    cmpl-float v2, v1, v3

    if-eqz v2, :cond_0

    .line 1559
    :cond_1
    cmpl-float v2, v0, v3

    if-gtz v2, :cond_2

    cmpl-float v2, v1, v3

    if-lez v2, :cond_4

    .line 1560
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->scrollRight()V

    .line 1564
    :goto_2
    const/4 v2, 0x1

    goto :goto_0

    .line 1555
    .end local v0           #hscroll:F
    .end local v1           #vscroll:F
    :cond_3
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v2

    neg-float v1, v2

    .line 1556
    .restart local v1       #vscroll:F
    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v0

    .restart local v0       #hscroll:F
    goto :goto_1

    .line 1562
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->scrollLeft()V

    goto :goto_2

    .line 1546
    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
    .end packed-switch
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 2276
    const/4 v0, 0x1

    return v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 2238
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2239
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 2240
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_0

    .line 2241
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 2242
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    .line 2243
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setItemCount(I)V

    .line 2245
    :cond_0
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2
    .parameter "info"

    .prologue
    const/4 v0, 0x1

    .line 2226
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2227
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v1

    if-le v1, v0, :cond_2

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 2228
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 2229
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2231
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v0

    if-lez v0, :cond_1

    .line 2232
    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2234
    :cond_1
    return-void

    .line 2227
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .parameter "ev"

    .prologue
    const/4 v10, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1042
    invoke-direct {p0, p1}, Lcom/android/launcher2/PagedView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 1045
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v7

    if-gtz v7, :cond_1

    .line 1046
    const-string v5, "PagedView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "There are no pages to swipe, page count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1047
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    .line 1142
    :cond_0
    :goto_0
    return v5

    .line 1055
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1056
    .local v0, action:I
    if-ne v0, v9, :cond_2

    iget v7, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-ne v7, v5, :cond_2

    .line 1058
    const-string v6, "PagedView"

    const-string v7, "onInterceptTouchEvent: touch move during scrolling."

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1062
    :cond_2
    and-int/lit16 v7, v0, 0xff

    packed-switch v7, :pswitch_data_0

    .line 1142
    :goto_1
    :pswitch_0
    iget v7, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-nez v7, :cond_0

    move v5, v6

    goto :goto_0

    .line 1068
    :pswitch_1
    iget v7, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    if-eq v7, v10, :cond_3

    .line 1069
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto :goto_1

    .line 1080
    :cond_3
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 1081
    .local v2, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 1083
    .local v4, y:F
    iput v2, p0, Lcom/android/launcher2/PagedView;->mDownMotionX:F

    .line 1084
    iput v2, p0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    .line 1085
    iput v4, p0, Lcom/android/launcher2/PagedView;->mLastMotionY:F

    .line 1086
    iput v8, p0, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    .line 1087
    iput v8, p0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    .line 1088
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1089
    iput-boolean v5, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    .line 1096
    iget-object v7, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->getFinalX()I

    move-result v7

    iget-object v8, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrX()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 1097
    .local v3, xDist:I
    iget-object v7, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->isFinished()Z

    move-result v7

    if-nez v7, :cond_4

    iget v7, p0, Lcom/android/launcher2/PagedView;->mTouchSlop:I

    if-ge v3, v7, :cond_6

    :cond_4
    move v1, v5

    .line 1098
    .local v1, finishedScrolling:Z
    :goto_2
    if-eqz v1, :cond_7

    .line 1099
    iput v6, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1100
    iget-object v7, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1107
    :goto_3
    iget v7, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-eq v7, v9, :cond_5

    iget v7, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    const/4 v8, 0x3

    if-eq v7, v8, :cond_5

    .line 1108
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v7

    if-lez v7, :cond_5

    .line 1109
    invoke-virtual {p0, v2, v4}, Lcom/android/launcher2/PagedView;->hitsPreviousPage(FF)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1110
    iput v9, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1117
    :cond_5
    :goto_4
    const-string v7, "PagedView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onInterceptTouchEvent touch down: finishedScrolling = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", mScrollX = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", xDist = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", mTouchState = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", this = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .end local v1           #finishedScrolling:Z
    :cond_6
    move v1, v6

    .line 1097
    goto :goto_2

    .line 1102
    .restart local v1       #finishedScrolling:Z
    :cond_7
    iput v5, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    goto :goto_3

    .line 1111
    :cond_8
    invoke-virtual {p0, v2, v4}, Lcom/android/launcher2/PagedView;->hitsNextPage(FF)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1112
    const/4 v7, 0x3

    iput v7, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    goto :goto_4

    .line 1126
    .end local v1           #finishedScrolling:Z
    .end local v2           #x:F
    .end local v3           #xDist:I
    .end local v4           #y:F
    :pswitch_3
    iput v6, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1127
    iput-boolean v6, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    .line 1128
    iput v10, p0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1129
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1133
    :pswitch_4
    invoke-direct {p0, p1}, Lcom/android/launcher2/PagedView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 1134
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1062
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 672
    iget-boolean v8, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    if-nez v8, :cond_1

    .line 704
    :cond_0
    :goto_0
    return-void

    .line 677
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingTop()I

    move-result v8

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingBottom()I

    move-result v9

    add-int v7, v8, v9

    .line 678
    .local v7, verticalPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    .line 679
    .local v1, childCount:I
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v3

    .line 681
    .local v3, childLeft:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-ge v6, v1, :cond_4

    .line 682
    invoke-virtual {p0, v6}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 683
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_3

    .line 684
    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v5

    .line 685
    .local v5, childWidth:I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    .line 686
    .local v2, childHeight:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPaddingTop()I

    move-result v4

    .line 687
    .local v4, childTop:I
    iget-boolean v8, p0, Lcom/android/launcher2/PagedView;->mCenterPagesVertically:Z

    if-eqz v8, :cond_2

    .line 688
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredHeight()I

    move-result v8

    sub-int/2addr v8, v7

    sub-int/2addr v8, v2

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v4, v8

    .line 692
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v8, v3

    add-int v9, v4, v2

    invoke-virtual {v0, v3, v4, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 694
    iget v8, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    add-int/2addr v8, v5

    add-int/2addr v3, v8

    .line 681
    .end local v2           #childHeight:I
    .end local v4           #childTop:I
    .end local v5           #childWidth:I
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 698
    .end local v0           #child:Landroid/view/View;
    :cond_4
    iget-boolean v8, p0, Lcom/android/launcher2/PagedView;->mFirstLayout:Z

    if-eqz v8, :cond_0

    iget v8, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ltz v8, :cond_0

    iget v8, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v9

    if-ge v8, v9, :cond_0

    .line 699
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/android/launcher2/PagedView;->setHorizontalScrollBarEnabled(Z)V

    .line 700
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->updateCurrentPageScroll()V

    .line 701
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/android/launcher2/PagedView;->setHorizontalScrollBarEnabled(Z)V

    .line 702
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/PagedView;->mFirstLayout:Z

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 21
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 506
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    move/from16 v19, v0

    if-nez v19, :cond_0

    .line 507
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 610
    :goto_0
    return-void

    .line 511
    :cond_0
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v17

    .line 512
    .local v17, widthMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 513
    .local v18, widthSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 514
    .local v8, heightMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 515
    .local v9, heightSize:I
    const/high16 v19, 0x4000

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_1

    .line 516
    new-instance v19, Ljava/lang/IllegalStateException;

    const-string v20, "Workspace can only be used in EXACTLY mode."

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 520
    :cond_1
    if-lez v18, :cond_2

    if-gtz v9, :cond_3

    .line 521
    :cond_2
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    goto :goto_0

    .line 530
    :cond_3
    const/4 v13, 0x0

    .line 532
    .local v13, maxChildHeight:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getPaddingBottom()I

    move-result v20

    add-int v16, v19, v20

    .line 533
    .local v16, verticalPadding:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getPaddingRight()I

    move-result v20

    add-int v10, v19, v20

    .line 541
    .local v10, horizontalPadding:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v3

    .line 542
    .local v3, childCount:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_1
    if-ge v11, v3, :cond_6

    .line 544
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 545
    .local v2, child:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    .line 548
    .local v12, lp:Landroid/view/ViewGroup$LayoutParams;
    iget v0, v12, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v19, v0

    const/16 v20, -0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 549
    const/high16 v7, -0x8000

    .line 555
    .local v7, childWidthMode:I
    :goto_2
    iget v0, v12, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v19, v0

    const/16 v20, -0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_5

    .line 556
    const/high16 v5, -0x8000

    .line 561
    .local v5, childHeightMode:I
    :goto_3
    sub-int v19, v18, v10

    move/from16 v0, v19

    invoke-static {v0, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 563
    .local v6, childWidthMeasureSpec:I
    sub-int v19, v9, v16

    move/from16 v0, v19

    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 566
    .local v4, childHeightMeasureSpec:I
    invoke-virtual {v2, v6, v4}, Landroid/view/View;->measure(II)V

    .line 567
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v19

    move/from16 v0, v19

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 542
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 551
    .end local v4           #childHeightMeasureSpec:I
    .end local v5           #childHeightMode:I
    .end local v6           #childWidthMeasureSpec:I
    .end local v7           #childWidthMode:I
    :cond_4
    const/high16 v7, 0x4000

    .restart local v7       #childWidthMode:I
    goto :goto_2

    .line 558
    :cond_5
    const/high16 v5, 0x4000

    .restart local v5       #childHeightMode:I
    goto :goto_3

    .line 575
    .end local v2           #child:Landroid/view/View;
    .end local v5           #childHeightMode:I
    .end local v7           #childWidthMode:I
    .end local v12           #lp:Landroid/view/ViewGroup$LayoutParams;
    :cond_6
    const/high16 v19, -0x8000

    move/from16 v0, v19

    if-ne v8, v0, :cond_7

    .line 576
    add-int v9, v13, v16

    .line 579
    :cond_7
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1, v9}, Lcom/android/launcher2/PagedView;->setMeasuredDimension(II)V

    .line 584
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->invalidateCachedOffsets()V

    .line 586
    if-lez v3, :cond_8

    .line 591
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_8

    .line 596
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v14

    .line 597
    .local v14, offset:I
    sub-int v19, v18, v14

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredWidth()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 599
    .local v15, spacing:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/launcher2/PagedView;->setPageSpacing(I)V

    .line 603
    .end local v14           #offset:I
    .end local v15           #spacing:I
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->updateScrollingIndicatorPosition()V

    .line 605
    if-lez v3, :cond_9

    .line 606
    add-int/lit8 v19, v3, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v19

    add-int/lit8 v20, v3, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    goto/16 :goto_0

    .line 608
    :cond_9
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    goto/16 :goto_0
.end method

.method protected onPageBeginMoving()V
    .locals 0

    .prologue
    .line 390
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 0

    .prologue
    .line 394
    return-void
.end method

.method public onPauseWhenShown(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2415
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2416
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2417
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->onPauseWhenShown(I)V

    .line 2419
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPauseWhenShown: mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2422
    :cond_0
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 4
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 930
    iget v2, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 931
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 935
    .local v0, focusablePage:I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    .line 936
    .local v1, v:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 937
    invoke-virtual {v1, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v2

    .line 939
    :goto_1
    return v2

    .line 933
    .end local v0           #focusablePage:I
    .end local v1           #v:Landroid/view/View;
    :cond_0
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .restart local v0       #focusablePage:I
    goto :goto_0

    .line 939
    .restart local v1       #v:Landroid/view/View;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onResumeWhenShown(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2430
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2431
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2432
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->onResumeWhenShown(I)V

    .line 2434
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResumeWhenShown: mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2437
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 22
    .parameter "ev"

    .prologue
    .line 1286
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v19

    if-gtz v19, :cond_0

    .line 1287
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "There is no child in PagedView, child count = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1288
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v19

    .line 1540
    :goto_0
    return v19

    .line 1291
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher2/PagedView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 1293
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    .line 1295
    .local v3, action:I
    and-int/lit16 v0, v3, 0xff

    move/from16 v19, v0

    packed-switch v19, :pswitch_data_0

    .line 1540
    :cond_1
    :goto_1
    :pswitch_0
    const/16 v19, 0x1

    goto :goto_0

    .line 1301
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/Scroller;->isFinished()Z

    move-result v19

    if-nez v19, :cond_2

    .line 1302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1306
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mDownMotionX:F

    .line 1307
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    .line 1308
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    .line 1309
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1311
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Touch down: mDownMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mDownMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTouchState = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_1

    .line 1316
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->pageBeginMoving()V

    goto/16 :goto_1

    .line 1321
    :pswitch_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_e

    .line 1323
    sget-boolean v19, Lcom/android/launcher2/PagedView;->sCanSendMessage:Z

    if-eqz v19, :cond_4

    .line 1324
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->moveOutAppWidget(I)Z

    move-result v14

    .line 1325
    .local v14, result:Z
    if-nez v14, :cond_3

    .line 1327
    const-string v19, "MTKWidgetView"

    const-string v20, "moveOut false."

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1329
    const/16 v19, 0x1

    goto/16 :goto_0

    .line 1332
    :cond_3
    const-string v19, "MTKWidgetView"

    const-string v20, "moveOut true."

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1337
    .end local v14           #result:Z
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v13

    .line 1338
    .local v13, pointerIndex:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 1339
    .local v18, x:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    move/from16 v20, v0

    add-float v19, v19, v20

    sub-float v6, v19, v18

    .line 1342
    .local v6, deltaX:F
    sget-boolean v19, Lcom/android/launcher2/PagedView;->sCanCallEnterAppWidget:Z

    if-eqz v19, :cond_5

    .line 1343
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 1344
    .local v11, page:I
    const/16 v19, 0x0

    cmpg-float v19, v6, v19

    if-gez v19, :cond_8

    .line 1345
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    if-lez v19, :cond_7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v11, v19, -0x1

    .line 1349
    :goto_2
    const/16 v19, 0x0

    sput-boolean v19, Lcom/android/launcher2/PagedView;->sCanCallEnterAppWidget:Z

    .line 1350
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/PagedView;->enterAppWidget(I)V

    .line 1353
    .end local v11           #page:I
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    .line 1358
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v19

    const/high16 v20, 0x3f80

    cmpl-float v19, v19, v20

    if-ltz v19, :cond_d

    .line 1360
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1361
    const/16 v19, 0x0

    cmpg-float v19, v6, v19

    if-gez v19, :cond_b

    .line 1362
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    const/16 v20, 0x0

    cmpl-float v19, v19, v20

    if-lez v19, :cond_a

    .line 1363
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v20, v0

    move/from16 v0, v20

    neg-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v0, v6}, Ljava/lang/Math;->max(FF)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchX:F

    .line 1374
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    add-float v19, v19, v6

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchX:F

    .line 1375
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v19

    move-wide/from16 v0, v19

    long-to-float v0, v0

    move/from16 v19, v0

    const v20, 0x4e6e6b28

    div-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mSmoothingTime:F

    .line 1376
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/PagedView;->mDeferScrollUpdate:Z

    move/from16 v19, v0

    if-nez v19, :cond_c

    .line 1377
    float-to-int v0, v6

    move/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/PagedView;->scrollBy(II)V

    .line 1382
    :goto_4
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    .line 1383
    float-to-int v0, v6

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, v6, v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    .line 1389
    :goto_5
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Touch move scroll: x = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", deltaX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTotalMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mLastMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ",mTouchX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " ,mLastMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1345
    .restart local v11       #page:I
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v19

    add-int/lit8 v11, v19, -0x1

    goto/16 :goto_2

    .line 1347
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v11, v19, 0x1

    :goto_6
    goto/16 :goto_2

    :cond_9
    const/4 v11, 0x0

    goto :goto_6

    .line 1364
    .end local v11           #page:I
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v20

    move/from16 v0, v20

    neg-int v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpg-float v19, v19, v20

    if-gez v19, :cond_6

    .line 1365
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    add-float v19, v19, v6

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchX:F

    goto/16 :goto_3

    .line 1367
    :cond_b
    const/16 v19, 0x0

    cmpl-float v19, v6, v19

    if-lez v19, :cond_6

    .line 1368
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getRight()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v20, v0

    sub-float v5, v19, v20

    .line 1369
    .local v5, availableToScroll:F
    const/16 v19, 0x0

    cmpl-float v19, v5, v19

    if-lez v19, :cond_6

    .line 1370
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchX:F

    move/from16 v19, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchX:F

    goto/16 :goto_3

    .line 1380
    .end local v5           #availableToScroll:F
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    goto/16 :goto_4

    .line 1385
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->awakenScrollBars()Z

    goto/16 :goto_5

    .line 1395
    .end local v6           #deltaX:F
    .end local v13           #pointerIndex:I
    .end local v18           #x:F
    :cond_e
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher2/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 1400
    :pswitch_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_22

    .line 1401
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1402
    .local v4, activePointerId:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v13

    .line 1403
    .restart local v13       #pointerIndex:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 1404
    .restart local v18       #x:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v16, v0

    .line 1405
    .local v16, velocityTracker:Landroid/view/VelocityTracker;
    const/16 v19, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mMaximumVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 1406
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v17, v0

    .line 1407
    .local v17, velocityX:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mDownMotionX:F

    move/from16 v19, v0

    sub-float v19, v18, v19

    move/from16 v0, v19

    float-to-int v6, v0

    .line 1408
    .local v6, deltaX:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v12

    .line 1409
    .local v12, pageWidth:I
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    int-to-float v0, v12

    move/from16 v20, v0

    const v21, 0x3ecccccd

    mul-float v20, v20, v21

    cmpl-float v19, v19, v20

    if-lez v19, :cond_14

    const/4 v9, 0x1

    .line 1412
    .local v9, isSignificantMove:Z
    :goto_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionXRemainder:F

    move/from16 v21, v0

    add-float v20, v20, v21

    sub-float v20, v20, v18

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    .line 1414
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    const/high16 v20, 0x41c8

    cmpl-float v19, v19, v20

    if-lez v19, :cond_15

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mFlingThresholdVelocity:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_15

    const/4 v8, 0x1

    .line 1418
    .local v8, isFling:Z
    :goto_8
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Touch up scroll: x = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", deltaX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTotalMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTotalMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mLastMotionX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mLastMotionX:F

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", velocityX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", pageWidth = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", isFling = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", isSignificantMove = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1428
    const/4 v15, 0x0

    .line 1429
    .local v15, returnToOriginalPage:Z
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    int-to-float v0, v12

    move/from16 v20, v0

    const v21, 0x3ea8f5c3

    mul-float v20, v20, v21

    cmpl-float v19, v19, v20

    if-lez v19, :cond_f

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->signum(F)F

    move-result v19

    int-to-float v0, v6

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->signum(F)F

    move-result v20

    cmpl-float v19, v19, v20

    if-eqz v19, :cond_f

    if-eqz v8, :cond_f

    .line 1432
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Return to origin page: deltaX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", velocityX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", isFling = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1435
    const/4 v15, 0x1

    .line 1438
    :cond_f
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 1442
    .local v7, finalPage:I
    if-eqz v9, :cond_10

    if-lez v6, :cond_10

    if-eqz v8, :cond_11

    :cond_10
    if-eqz v8, :cond_19

    if-lez v17, :cond_19

    :cond_11
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    if-gtz v19, :cond_12

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v19

    if-eqz v19, :cond_19

    .line 1445
    :cond_12
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    if-lez v19, :cond_17

    .line 1446
    if-eqz v15, :cond_16

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 1451
    :cond_13
    :goto_9
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Case 1: finalPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", velocityX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v7, v1}, Lcom/android/launcher2/PagedView;->snapToPageWithVelocity(II)V

    .line 1511
    .end local v4           #activePointerId:I
    .end local v6           #deltaX:I
    .end local v7           #finalPage:I
    .end local v8           #isFling:Z
    .end local v9           #isSignificantMove:Z
    .end local v12           #pageWidth:I
    .end local v13           #pointerIndex:I
    .end local v15           #returnToOriginalPage:Z
    .end local v16           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v17           #velocityX:I
    .end local v18           #x:F
    :goto_a
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1512
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1513
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1409
    .restart local v4       #activePointerId:I
    .restart local v6       #deltaX:I
    .restart local v12       #pageWidth:I
    .restart local v13       #pointerIndex:I
    .restart local v16       #velocityTracker:Landroid/view/VelocityTracker;
    .restart local v17       #velocityX:I
    .restart local v18       #x:F
    :cond_14
    const/4 v9, 0x0

    goto/16 :goto_7

    .line 1414
    .restart local v9       #isSignificantMove:Z
    :cond_15
    const/4 v8, 0x0

    goto/16 :goto_8

    .line 1446
    .restart local v7       #finalPage:I
    .restart local v8       #isFling:Z
    .restart local v15       #returnToOriginalPage:Z
    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, -0x1

    goto :goto_9

    .line 1447
    :cond_17
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v19

    if-eqz v19, :cond_13

    .line 1448
    if-eqz v15, :cond_18

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    :goto_b
    goto :goto_9

    :cond_18
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v19

    add-int/lit8 v7, v19, -0x1

    goto :goto_b

    .line 1455
    :cond_19
    if-eqz v9, :cond_1a

    if-gez v6, :cond_1a

    if-eqz v8, :cond_1b

    :cond_1a
    if-eqz v8, :cond_21

    if-gez v17, :cond_21

    :cond_1b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_1c

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v19

    if-eqz v19, :cond_21

    .line 1458
    :cond_1c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_1f

    .line 1459
    if-eqz v15, :cond_1e

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 1464
    :cond_1d
    :goto_c
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Case 2: finalPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", velocityX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1467
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v7, v1}, Lcom/android/launcher2/PagedView;->snapToPageWithVelocity(II)V

    goto/16 :goto_a

    .line 1459
    :cond_1e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, 0x1

    goto :goto_c

    .line 1460
    :cond_1f
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v19

    if-eqz v19, :cond_1d

    .line 1461
    if-eqz v15, :cond_20

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    :goto_d
    goto :goto_c

    :cond_20
    const/4 v7, 0x0

    goto :goto_d

    .line 1470
    :cond_21
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Case 3: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1473
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    goto/16 :goto_a

    .line 1475
    .end local v4           #activePointerId:I
    .end local v6           #deltaX:I
    .end local v7           #finalPage:I
    .end local v8           #isFling:Z
    .end local v9           #isSignificantMove:Z
    .end local v12           #pageWidth:I
    .end local v13           #pointerIndex:I
    .end local v15           #returnToOriginalPage:Z
    .end local v16           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v17           #velocityX:I
    .end local v18           #x:F
    :cond_22
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_24

    .line 1479
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 1481
    .local v10, nextPage:I
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "TOUCH_STATE_PREV_PAGE: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", nextPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1484
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v10, v0, :cond_23

    .line 1485
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto/16 :goto_a

    .line 1487
    :cond_23
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    goto/16 :goto_a

    .line 1489
    .end local v10           #nextPage:I
    :cond_24
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_26

    .line 1493
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 1495
    .restart local v10       #nextPage:I
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "TOUCH_STATE_NEXT_PAGE: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", nextPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1498
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v10, v0, :cond_25

    .line 1499
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto/16 :goto_a

    .line 1501
    :cond_25
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    goto/16 :goto_a

    .line 1505
    .end local v10           #nextPage:I
    :cond_26
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "[--Case Watcher--]Touch up unhandled: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTouchState = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1509
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher2/PagedView;->onUnhandledTap(Landroid/view/MotionEvent;)V

    goto/16 :goto_a

    .line 1518
    :pswitch_4
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Touch cancel: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTouchState = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mScrollX = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mScrollX:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1522
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_27

    .line 1523
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->snapToDestination()V

    .line 1525
    :cond_27
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mTouchState:I

    .line 1526
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    .line 1527
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1532
    :pswitch_5
    const-string v19, "PagedView"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Touch ACTION_POINTER_UP: mCurrentPage = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mTouchState = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mTouchState:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", mActivePointerId = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mActivePointerId:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", this = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1536
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher2/PagedView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 1295
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method protected onUnhandledTap(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "ev"

    .prologue
    .line 1605
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 1272
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->dampedOverScroll(F)V

    .line 1273
    return-void
.end method

.method protected pageBeginMoving()V
    .locals 1

    .prologue
    .line 371
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    if-nez v0, :cond_0

    .line 372
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    .line 373
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->onPageBeginMoving()V

    .line 375
    :cond_0
    return-void
.end method

.method protected pageEndMoving()V
    .locals 1

    .prologue
    .line 378
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    if-eqz v0, :cond_0

    .line 379
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    .line 380
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->onPageEndMoving()V

    .line 382
    :cond_0
    return-void
.end method

.method pauseScrolling()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 327
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 328
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 329
    iput-boolean v1, p0, Lcom/android/launcher2/PagedView;->mScrollingPaused:Z

    .line 330
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 3
    .parameter "action"
    .parameter "arguments"

    .prologue
    const/4 v0, 0x1

    .line 2249
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2266
    :goto_0
    return v0

    .line 2252
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 2266
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 2254
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    .line 2255
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->scrollRight()V

    goto :goto_0

    .line 2260
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    if-lez v1, :cond_1

    .line 2261
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->scrollLeft()V

    goto :goto_0

    .line 2252
    nop

    :sswitch_data_0
    .sparse-switch
        0x1000 -> :sswitch_0
        0x2000 -> :sswitch_1
    .end sparse-switch
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 2
    .parameter "child"
    .parameter "focused"

    .prologue
    .line 1609
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 1610
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->indexToPage(I)I

    move-result v0

    .line 1611
    .local v0, page:I
    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getCurrentPage()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isInTouchMode()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1612
    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 1614
    :cond_0
    return-void
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 2
    .parameter "child"
    .parameter "rectangle"
    .parameter "immediate"

    .prologue
    .line 919
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->indexToPage(I)I

    move-result v0

    .line 920
    .local v0, page:I
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ne v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1

    .line 921
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 922
    const/4 v1, 0x1

    .line 924
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 2
    .parameter "disallowIntercept"

    .prologue
    .line 1007
    if-eqz p1, :cond_0

    .line 1010
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 1011
    .local v0, currentPage:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 1013
    .end local v0           #currentPage:Landroid/view/View;
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 1014
    return-void
.end method

.method resumeScrolling()V
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mScrollingPaused:Z

    .line 338
    return-void
.end method

.method protected screenScrolled(I)V
    .locals 7
    .parameter "screenCenter"

    .prologue
    .line 707
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 708
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->updateScrollingIndicator()V

    .line 710
    :cond_0
    iget v5, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    if-ltz v5, :cond_1

    iget v5, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    iget v6, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v5, v6, :cond_3

    :cond_1
    const/4 v3, 0x1

    .line 712
    .local v3, isInOverscroll:Z
    :goto_0
    iget-boolean v5, p0, Lcom/android/launcher2/PagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_5

    if-nez v3, :cond_5

    .line 713
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 714
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 715
    .local v1, child:Landroid/view/View;
    if-eqz v1, :cond_2

    .line 716
    invoke-virtual {p0, p1, v1, v2}, Lcom/android/launcher2/PagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 717
    .local v4, scrollProgress:F
    const/high16 v5, 0x3f80

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sub-float v0, v5, v6

    .line 718
    .local v0, alpha:F
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 713
    .end local v0           #alpha:F
    .end local v4           #scrollProgress:F
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 710
    .end local v1           #child:Landroid/view/View;
    .end local v2           #i:I
    .end local v3           #isInOverscroll:Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_0

    .line 721
    .restart local v2       #i:I
    .restart local v3       #isInOverscroll:Z
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    .line 723
    .end local v2           #i:I
    :cond_5
    return-void
.end method

.method public scrollBy(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 412
    iget v0, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    add-int/2addr v0, p1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollY()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/PagedView;->scrollTo(II)V

    .line 413
    return-void
.end method

.method public scrollLeft()V
    .locals 1

    .prologue
    .line 1840
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1841
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-lez v0, :cond_1

    .line 1842
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 1855
    :cond_0
    :goto_0
    return-void

    .line 1843
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-nez v0, :cond_0

    .line 1845
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 1848
    :cond_2
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    if-lez v0, :cond_3

    .line 1849
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 1850
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    if-nez v0, :cond_0

    .line 1852
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0
.end method

.method public scrollRight()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1858
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1859
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    .line 1860
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 1873
    :cond_0
    :goto_0
    return-void

    .line 1861
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1863
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 1866
    :cond_2
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_3

    .line 1867
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 1868
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1870
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    goto :goto_0
.end method

.method public scrollTo(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v1, 0x0

    .line 417
    iput p1, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    .line 419
    if-gez p1, :cond_2

    .line 421
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 422
    iput v1, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 423
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 446
    :cond_0
    :goto_0
    int-to-float v0, p1

    iput v0, p0, Lcom/android/launcher2/PagedView;->mTouchX:F

    .line 447
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    long-to-float v0, v0

    const v1, 0x4e6e6b28

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/launcher2/PagedView;->mSmoothingTime:F

    .line 448
    return-void

    .line 425
    :cond_1
    invoke-super {p0, v1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 426
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 427
    int-to-float v0, p1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->overScroll(F)V

    goto :goto_0

    .line 430
    :cond_2
    iget v0, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le p1, v0, :cond_4

    .line 432
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 433
    iget v0, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    iput v0, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 434
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_0

    .line 436
    :cond_3
    iget v0, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-super {p0, v0, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 437
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 438
    iget v0, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    sub-int v0, p1, v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->overScroll(F)V

    goto :goto_0

    .line 442
    :cond_4
    iput p1, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    .line 443
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_0
.end method

.method protected scrollToNewPageWithoutMovingPages(I)V
    .locals 8
    .parameter "newCurrentPage"

    .prologue
    .line 613
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v5

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v6

    sub-int v2, v5, v6

    .line 614
    .local v2, newX:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollX()I

    move-result v5

    sub-int v0, v2, v5

    .line 616
    .local v0, delta:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v4

    .line 618
    .local v4, pageCount:I
    const-string v5, "PagedView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Scroll to new page without moving pages: newCurrentPage = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", newX = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", mScrollX = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v4, :cond_0

    .line 623
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    .line 624
    .local v3, page:Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getX()F

    move-result v5

    int-to-float v6, v0

    add-float/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/view/View;->setX(F)V

    .line 622
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 626
    .end local v3           #page:Landroid/view/View;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->setCurrentPage(I)V

    .line 627
    return-void
.end method

.method public searchIMTKWidget(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .locals 7
    .parameter "hostView"
    .parameter "providerName"

    .prologue
    .line 2475
    instance-of v6, p1, Lcom/mediatek/common/widget/IMtkWidget;

    if-eqz v6, :cond_0

    .line 2493
    .end local p1
    :goto_0
    return-object p1

    .line 2477
    .restart local p1
    :cond_0
    instance-of v6, p1, Landroid/view/ViewGroup;

    if-eqz v6, :cond_2

    move-object v6, p1

    .line 2478
    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 2479
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_2

    move-object v6, p1

    .line 2480
    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p0, v6, p2}, Lcom/android/launcher2/PagedView;->searchIMTKWidget(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 2481
    .local v3, mtkWidgetView:Landroid/view/View;
    if-eqz v3, :cond_1

    .line 2482
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 2483
    .local v5, v:Landroid/view/View;
    instance-of v6, v5, Lcom/android/launcher2/LauncherAppWidgetHostView;

    if-eqz v6, :cond_1

    move-object v4, v5

    .line 2484
    check-cast v4, Lcom/android/launcher2/LauncherAppWidgetHostView;

    .line 2485
    .local v4, parent:Lcom/android/launcher2/LauncherAppWidgetHostView;
    invoke-virtual {v4}, Lcom/android/launcher2/LauncherAppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v2

    .line 2486
    .local v2, info:Landroid/appwidget/AppWidgetProviderInfo;
    iget-object v6, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object p1, v3

    .line 2487
    goto :goto_0

    .line 2479
    .end local v2           #info:Landroid/appwidget/AppWidgetProviderInfo;
    .end local v4           #parent:Lcom/android/launcher2/LauncherAppWidgetHostView;
    .end local v5           #v:Landroid/view/View;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2493
    .end local v0           #childCount:I
    .end local v1           #i:I
    .end local v3           #mtkWidgetView:Landroid/view/View;
    :cond_2
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public setAllowLongPress(Z)V
    .locals 0
    .parameter "allowLongPress"

    .prologue
    .line 1901
    iput-boolean p1, p0, Lcom/android/launcher2/PagedView;->mAllowLongPress:Z

    .line 1902
    return-void
.end method

.method public setAppWidgetIdAndScreen(Landroid/view/View;II)V
    .locals 2
    .parameter "hostView"
    .parameter "page"
    .parameter "appWidgetId"

    .prologue
    .line 2448
    invoke-direct {p0, p1}, Lcom/android/launcher2/PagedView;->searchIMTKWidget(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 2449
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2450
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p2}, Lcom/mediatek/common/widget/IMtkWidget;->setScreen(I)V

    .line 2451
    check-cast v0, Lcom/mediatek/common/widget/IMtkWidget;

    .end local v0           #mtkWidgetView:Landroid/view/View;
    invoke-interface {v0, p3}, Lcom/mediatek/common/widget/IMtkWidget;->setWidgetId(I)V

    .line 2453
    :cond_0
    return-void
.end method

.method setCurrentPage(I)V
    .locals 3
    .parameter "currentPage"

    .prologue
    .line 344
    const-string v0, "PagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setCurrentPage: currentPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrentPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mScrollX = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 353
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 362
    :goto_0
    return-void

    .line 357
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 358
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->updateCurrentPageScroll()V

    .line 359
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->updateScrollingIndicator()V

    .line 360
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->notifyPageSwitchListener()V

    .line 361
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    goto :goto_0
.end method

.method protected setDataIsReady()V
    .locals 1

    .prologue
    .line 273
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsDataReady:Z

    .line 274
    return-void
.end method

.method public setLayoutScale(F)V
    .locals 11
    .parameter "childrenScale"

    .prologue
    const/high16 v8, 0x4000

    .line 633
    iput p1, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 634
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidateCachedOffsets()V

    .line 637
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v1

    .line 638
    .local v1, childCount:I
    new-array v2, v1, [F

    .line 639
    .local v2, childrenX:[F
    new-array v3, v1, [F

    .line 640
    .local v3, childrenY:[F
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v1, :cond_0

    .line 641
    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 642
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v7

    aput v7, v2, v5

    .line 643
    invoke-virtual {v0}, Landroid/view/View;->getY()F

    move-result v7

    aput v7, v3, v5

    .line 640
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 646
    .end local v0           #child:Landroid/view/View;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v7

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 647
    .local v6, widthSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredHeight()I

    move-result v7

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 648
    .local v4, heightSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->requestLayout()V

    .line 649
    invoke-virtual {p0, v6, v4}, Lcom/android/launcher2/PagedView;->measure(II)V

    .line 651
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredHeight()I

    move-result v7

    if-eqz v7, :cond_1

    .line 652
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getTop()I

    move-result v8

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getRight()I

    move-result v9

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getBottom()I

    move-result v10

    invoke-virtual {p0, v7, v8, v9, v10}, Lcom/android/launcher2/PagedView;->layout(IIII)V

    .line 654
    :cond_1
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_2

    .line 655
    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 656
    .restart local v0       #child:Landroid/view/View;
    aget v7, v2, v5

    invoke-virtual {v0, v7}, Landroid/view/View;->setX(F)V

    .line 657
    aget v7, v3, v5

    invoke-virtual {v0, v7}, Landroid/view/View;->setY(F)V

    .line 654
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 662
    .end local v0           #child:Landroid/view/View;
    :cond_2
    iget v7, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v7}, Lcom/android/launcher2/PagedView;->scrollToNewPageWithoutMovingPages(I)V

    .line 663
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 3
    .parameter "l"

    .prologue
    .line 403
    iput-object p1, p0, Lcom/android/launcher2/PagedView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 404
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v0

    .line 405
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 406
    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 405
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 408
    :cond_0
    return-void
.end method

.method public setPageSpacing(I)V
    .locals 0
    .parameter "pageSpacing"

    .prologue
    .line 666
    iput p1, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    .line 667
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidateCachedOffsets()V

    .line 668
    return-void
.end method

.method public setPageSwitchListener(Lcom/android/launcher2/PagedView$PageSwitchListener;)V
    .locals 3
    .parameter "pageSwitchListener"

    .prologue
    .line 262
    iput-object p1, p0, Lcom/android/launcher2/PagedView;->mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

    .line 263
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mPageSwitchListener:Lcom/android/launcher2/PagedView$PageSwitchListener;

    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-interface {v0, v1, v2}, Lcom/android/launcher2/PagedView$PageSwitchListener;->onPageSwitch(Landroid/view/View;I)V

    .line 266
    :cond_0
    return-void
.end method

.method protected shouldDrawChild(Landroid/view/View;)Z
    .locals 2
    .parameter "child"

    .prologue
    .line 847
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public showScrollIndicatorTrack()V
    .locals 0

    .prologue
    .line 2218
    return-void
.end method

.method protected showScrollingIndicator(Z)V
    .locals 5
    .parameter "immediately"

    .prologue
    const/high16 v4, 0x3f80

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 2097
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicator:Z

    .line 2098
    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    .line 2099
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v0

    if-gt v0, v2, :cond_1

    .line 2117
    :cond_0
    :goto_0
    return-void

    .line 2100
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2102
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mShouldShowScrollIndicator:Z

    .line 2103
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2104
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2106
    invoke-direct {p0}, Lcom/android/launcher2/PagedView;->updateScrollingIndicatorPosition()V

    .line 2107
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 2108
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 2109
    if-nez p1, :cond_2

    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mScrollingPaused:Z

    if-eqz v0, :cond_3

    .line 2110
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    .line 2112
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicator:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v2, [F

    aput v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    .line 2113
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2114
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0
.end method

.method protected snapToDestination()V
    .locals 2

    .prologue
    .line 1669
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageNearestToCenterOfScreen()I

    move-result v0

    const/16 v1, 0x226

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/PagedView;->snapToPage(II)V

    .line 1670
    return-void
.end method

.method protected snapToPage(I)V
    .locals 1
    .parameter "whichPage"

    .prologue
    .line 1766
    const/16 v0, 0x226

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/PagedView;->snapToPage(II)V

    .line 1767
    return-void
.end method

.method protected snapToPage(II)V
    .locals 6
    .parameter "whichPage"
    .parameter "duration"

    .prologue
    .line 1770
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1775
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 1782
    .local v1, newX:I
    iget v3, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    if-ne v1, v3, :cond_0

    .line 1783
    const-string v3, "PagedView"

    const-string v4, "snapToPage: do nothing because mUnboundedScrollX equals with newX."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1799
    :goto_0
    return-void

    .line 1788
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1789
    iget v3, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    if-gtz v3, :cond_2

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne p1, v3, :cond_2

    .line 1790
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v4

    mul-int/2addr v3, v4

    iget v4, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    .line 1796
    :cond_1
    :goto_1
    iget v2, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    .line 1797
    .local v2, sX:I
    sub-int v0, v1, v2

    .line 1798
    .local v0, delta:I
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher2/PagedView;->snapToPage(III)V

    goto :goto_0

    .line 1791
    .end local v0           #delta:I
    .end local v2           #sX:I
    :cond_2
    iget v3, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-lt v3, v4, :cond_1

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_1

    if-nez p1, :cond_1

    .line 1792
    iget v3, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v5

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    goto :goto_1
.end method

.method protected snapToPage(III)V
    .locals 7
    .parameter "whichPage"
    .parameter "delta"
    .parameter "duration"

    .prologue
    const/4 v2, 0x0

    .line 1803
    const-string v0, "PagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(PagedView)snapToPage whichPage = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", delta = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", duration = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mNextPage = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mUnboundedScrollX = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mDeferScrollUpdate = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v3, p0, Lcom/android/launcher2/PagedView;->mDeferScrollUpdate:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mScrollX = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", this = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1809
    iput p1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 1811
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getFocusedChild()Landroid/view/View;

    move-result-object v6

    .line 1812
    .local v6, focusedChild:Landroid/view/View;
    if-eqz v6, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    if-ne v6, v0, :cond_0

    .line 1814
    invoke-virtual {v6}, Landroid/view/View;->clearFocus()V

    .line 1817
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->pageBeginMoving()V

    .line 1818
    invoke-virtual {p0, p3}, Lcom/android/launcher2/PagedView;->awakenScrollBars(I)Z

    .line 1819
    if-nez p3, :cond_1

    .line 1820
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p3

    .line 1824
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->moveOutAppWidget(I)Z

    .line 1825
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1826
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    move v3, p2

    move v4, v2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1830
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mDeferScrollUpdate:Z

    if-eqz v0, :cond_3

    .line 1831
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedView;->loadAssociatedPages(I)V

    .line 1835
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->notifyPageSwitchListener()V

    .line 1836
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->invalidate()V

    .line 1837
    return-void

    .line 1833
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    goto :goto_0
.end method

.method protected snapToPageWithVelocity(II)V
    .locals 10
    .parameter "whichPage"
    .parameter "velocity"

    .prologue
    const/high16 v9, 0x3f80

    .line 1693
    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-static {p1, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1694
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v6

    div-int/lit8 v4, v6, 0x2

    .line 1699
    .local v4, halfScreenSize:I
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v6

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v7

    sub-int v5, v6, v7

    .line 1706
    .local v5, newX:I
    iget v6, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    if-ne v5, v6, :cond_0

    .line 1707
    const-string v6, "PagedView"

    const-string v7, "snapToPageWithVelocity: do nothing because mUnboundedScrollX equals with newX."

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1763
    :goto_0
    return-void

    .line 1712
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1713
    iget v6, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    if-gtz v6, :cond_2

    iget v6, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-nez v6, :cond_2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne p1, v6, :cond_2

    .line 1714
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v6

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v7

    mul-int/2addr v6, v7

    iget v7, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    add-int/2addr v6, v7

    iput v6, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    .line 1720
    :cond_1
    :goto_1
    iget v6, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    sub-int v0, v5, v6

    .line 1721
    .local v0, delta:I
    const/4 v3, 0x0

    .line 1724
    .local v3, duration:I
    const-string v6, "PagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "snapToPageWithVelocity: getChildOffset() = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", measured width = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getChildWidth(I)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", newX = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mUnboundedScrollX = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", halfScreenSize = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1731
    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->isSupportCycleSlidingScreen()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v6

    iget v7, p0, Lcom/android/launcher2/PagedView;->mMinFlingVelocity:I

    if-ge v6, v7, :cond_3

    .line 1734
    const-string v6, "PagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "snapToPageWithVelocity: velocity = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", whichPage = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", MIN_FLING_VELOCITY = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xfa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", this = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1736
    const/16 v6, 0x226

    invoke-virtual {p0, p1, v6}, Lcom/android/launcher2/PagedView;->snapToPage(II)V

    goto/16 :goto_0

    .line 1715
    .end local v0           #delta:I
    .end local v3           #duration:I
    :cond_2
    iget v6, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    iget v7, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-lt v6, v7, :cond_1

    iget v6, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ne v6, v7, :cond_1

    if-nez p1, :cond_1

    .line 1716
    iget v6, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    iget v7, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getWidth()I

    move-result v8

    add-int/2addr v7, v8

    sub-int/2addr v6, v7

    iput v6, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    goto/16 :goto_1

    .line 1744
    .restart local v0       #delta:I
    .restart local v3       #duration:I
    :cond_3
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v9

    mul-int/lit8 v7, v4, 0x2

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-static {v9, v6}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1745
    .local v2, distanceRatio:F
    int-to-float v6, v4

    int-to-float v7, v4

    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedView;->distanceInfluenceForSnapDuration(F)F

    move-result v8

    mul-float/2addr v7, v8

    add-float v1, v6, v7

    .line 1748
    .local v1, distance:F
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 1749
    iget v6, p0, Lcom/android/launcher2/PagedView;->mMinSnapVelocity:I

    invoke-static {v6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 1754
    const/high16 v6, 0x447a

    int-to-float v7, p2

    div-float v7, v1, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    mul-int/lit8 v3, v6, 0x4

    .line 1755
    const/16 v6, 0x2ee

    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1758
    const-string v6, "PagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "snapToPageWithVelocity: velocity = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", whichPage = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", duration = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", delta = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mScrollX = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mUnboundedScrollX = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/android/launcher2/PagedView;->mUnboundedScrollX:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", this = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1762
    invoke-virtual {p0, p1, v0, v3}, Lcom/android/launcher2/PagedView;->snapToPage(III)V

    goto/16 :goto_0
.end method

.method public startCovered(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2385
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2386
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2387
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->startCovered(I)V

    .line 2389
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startCovered mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2392
    :cond_0
    return-void
.end method

.method public startDragAppWidget(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2317
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2318
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2319
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1}, Lcom/mediatek/common/widget/IMtkWidget;->startDrag()V

    .line 2321
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startDrag:mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2324
    :cond_0
    return-void
.end method

.method public stopCovered(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2400
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2401
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2402
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->stopCovered(I)V

    .line 2404
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopCovered mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2407
    :cond_0
    return-void
.end method

.method public stopDragAppWidget(I)V
    .locals 4
    .parameter "page"

    .prologue
    .line 2333
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getMTKWidgetView(I)Landroid/view/View;

    move-result-object v0

    .line 2334
    .local v0, mtkWidgetView:Landroid/view/View;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 2335
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1, p1}, Lcom/mediatek/common/widget/IMtkWidget;->setScreen(I)V

    move-object v1, v0

    .line 2336
    check-cast v1, Lcom/mediatek/common/widget/IMtkWidget;

    invoke-interface {v1}, Lcom/mediatek/common/widget/IMtkWidget;->stopDrag()V

    .line 2338
    const-string v1, "MTKWidgetView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopDrag: mtkWidgetView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2341
    :cond_0
    return-void
.end method

.method public abstract syncPageItems(IZ)V
.end method

.method public abstract syncPages()V
.end method

.method protected updateCurrentPageScroll()V
    .locals 5

    .prologue
    .line 310
    const/4 v0, 0x0

    .line 311
    .local v0, newX:I
    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ltz v3, :cond_0

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/PagedView;->getPageCount()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 312
    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/android/launcher2/PagedView;->getChildOffset(I)I

    move-result v1

    .line 313
    .local v1, offset:I
    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/android/launcher2/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 314
    .local v2, relOffset:I
    sub-int v0, v1, v2

    .line 316
    .end local v1           #offset:I
    .end local v2           #relOffset:I
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3}, Lcom/android/launcher2/PagedView;->scrollTo(II)V

    .line 317
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 318
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 319
    return-void
.end method
