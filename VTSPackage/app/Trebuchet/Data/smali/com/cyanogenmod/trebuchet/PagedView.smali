.class public abstract Lcom/cyanogenmod/trebuchet/PagedView;
.super Landroid/view/ViewGroup;
.source "PagedView.java"

# interfaces
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/PagedView$SavedState;,
        Lcom/cyanogenmod/trebuchet/PagedView$OvershootInterpolator;,
        Lcom/cyanogenmod/trebuchet/PagedView$QuadInterpolator;,
        Lcom/cyanogenmod/trebuchet/PagedView$QuintInterpolator;,
        Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;
    }
.end annotation


# static fields
.field protected static final ALPHA_QUANTIZE_LEVEL:F = 1.0E-4f

.field static final AUTOMATIC_PAGE_SPACING:I = -0x1

.field private static final DEBUG:Z = false

.field private static final FLING_THRESHOLD_VELOCITY:I = 0x1f4

.field protected static final INVALID_PAGE:I = -0x1

.field protected static final INVALID_POINTER:I = -0x1

.field protected static final MAX_PAGE_SNAP_DURATION:I = 0x226

.field private static final MIN_FLING_VELOCITY:I = 0xfa

.field private static final MIN_LENGTH_FOR_FLING:I = 0x19

.field private static final MIN_SNAP_VELOCITY:I = 0x5dc

.field protected static final NANOTIME_DIV:F = 1.0E9f

.field private static final OVERSCROLL_ACCELERATE_FACTOR:F = 2.0f

.field private static final OVERSCROLL_DAMP_FACTOR:F = 0.14f

.field protected static final PAGE_SNAP_ANIMATION_DURATION:I = 0x190

.field private static final RETURN_TO_ORIGINAL_PAGE_THRESHOLD:F = 0.33f

.field private static final SIGNIFICANT_MOVE_THRESHOLD:F = 0.4f

.field protected static final SLOW_PAGE_SNAP_ANIMATION_DURATION:I = 0x2ee

.field private static final TAG:Ljava/lang/String; = "Trebuchet.PagedView"

.field protected static final TOUCH_STATE_NEXT_PAGE:I = 0x3

.field protected static final TOUCH_STATE_PREV_PAGE:I = 0x2

.field protected static final TOUCH_STATE_REST:I = 0x0

.field protected static final TOUCH_STATE_SCROLLING:I = 0x1

.field protected static final sScrollIndicatorFadeInDuration:I = 0x96

.field protected static final sScrollIndicatorFadeOutDuration:I = 0x28a

.field protected static final sScrollIndicatorFadeOutShortDuration:I = 0x96

.field protected static final sScrollIndicatorFlashDuration:I = 0x28a


# instance fields
.field hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

.field protected mActivePointerId:I

.field protected mAllowLongPress:Z

.field protected mAllowOverScroll:Z

.field protected mCellCountX:I

.field protected mCellCountY:I

.field protected mCenterPages:Z

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

.field private mDownMotionY:F

.field protected mFadeInAdjacentScreens:Z

.field protected mFirstLayout:Z

.field protected mFlingThresholdVelocity:I

.field protected mForceDrawAllChildrenNextFrame:Z

.field protected mForceScreenScrolled:Z

.field protected mHandleFadeInAdjacentScreens:Z

.field protected mHandleScrollIndicator:Z

.field private mHasScrollIndicator:Z

.field protected mIsDataReady:Z

.field protected mIsPageMoving:Z

.field protected mLastMotionX:F

.field protected mLastMotionXRemainder:F

.field protected mLastMotionY:F

.field protected mLastMotionYRemainder:F

.field private mLastScreenScroll:I

.field protected mLayoutScale:F

.field protected mLongClickListener:Landroid/view/View$OnLongClickListener;

.field protected mMaxScrollX:I

.field protected mMaxScrollY:I

.field private mMaximumVelocity:I

.field protected mMinFlingVelocity:I

.field protected mMinSnapVelocity:I

.field private mMinimumHeight:I

.field private mMinimumWidth:I

.field protected mNextPage:I

.field protected mOverScrollX:I

.field protected mOverScrollY:I

.field protected mPageLayoutHeightGap:I

.field protected mPageLayoutPaddingBottom:I

.field protected mPageLayoutPaddingLeft:I

.field protected mPageLayoutPaddingRight:I

.field protected mPageLayoutPaddingTop:I

.field protected mPageLayoutWidthGap:I

.field protected mPageSpacing:I

.field private mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

.field private mPagingTouchSlop:I

.field private mScrollIndicator:Landroid/view/View;

.field private mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

.field private mScrollIndicatorPaddingBottom:I

.field private mScrollIndicatorPaddingLeft:I

.field private mScrollIndicatorPaddingRight:I

.field private mScrollIndicatorPaddingTop:I

.field protected mScroller:Landroid/widget/Scroller;

.field private mScrollingPaused:Z

.field private mShouldShowScrollIndicator:Z

.field private mShouldShowScrollIndicatorImmediately:Z

.field protected mSmoothingTime:F

.field protected mTempVisiblePagesRange:[I

.field protected mTotalMotionX:F

.field protected mTotalMotionY:F

.field protected mTouchSlop:I

.field protected mTouchState:I

.field protected mTouchX:F

.field protected mTouchY:F

.field protected mUnboundedScrollX:I

.field protected mUnboundedScrollY:I

.field protected mUsePagingTouchSlop:Z

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field protected mVertical:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 212
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 213
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 216
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 217
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

    .line 220
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 93
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFirstLayout:Z

    .line 96
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    .line 110
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastScreenScroll:I

    .line 121
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 122
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    .line 126
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    .line 140
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCellCountX:I

    .line 141
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCellCountY:I

    .line 143
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowOverScroll:Z

    .line 146
    new-array v1, v5, [I

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTempVisiblePagesRange:[I

    .line 156
    const/high16 v1, 0x3f80

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLayoutScale:F

    .line 160
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 167
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mContentIsRefreshable:Z

    .line 170
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFadeInAdjacentScreens:Z

    .line 173
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleFadeInAdjacentScreens:Z

    .line 177
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUsePagingTouchSlop:Z

    .line 180
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferScrollUpdate:Z

    .line 182
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    .line 185
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    .line 194
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    .line 195
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicator:Z

    .line 196
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    .line 197
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleScrollIndicator:Z

    .line 202
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollingPaused:Z

    .line 2029
    new-instance v1, Lcom/cyanogenmod/trebuchet/PagedView$1;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/PagedView$1;-><init>(Lcom/cyanogenmod/trebuchet/PagedView;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    .line 222
    sget-object v1, Lcom/cyanogenmod/trebuchet/R$styleable;->PagedView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 224
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->setPageSpacing(I)V

    .line 225
    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutPaddingTop:I

    .line 227
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutPaddingBottom:I

    .line 229
    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutPaddingLeft:I

    .line 231
    const/4 v1, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutPaddingRight:I

    .line 233
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutWidthGap:I

    .line 235
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageLayoutHeightGap:I

    .line 237
    const/4 v1, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingLeft:I

    .line 239
    const/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingTop:I

    .line 241
    const/16 v1, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingRight:I

    .line 243
    const/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingBottom:I

    .line 245
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 247
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->setHapticFeedbackEnabled(Z)V

    .line 248
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->init()V

    .line 249
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/PagedView;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    return-object v0
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 1579
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 1580
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1582
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1583
    return-void
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .locals 6
    .parameter "ev"

    .prologue
    const/4 v5, 0x0

    .line 1593
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const v4, 0xff00

    and-int/2addr v3, v4

    shr-int/lit8 v2, v3, 0x8

    .line 1595
    .local v2, pointerIndex:I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 1596
    .local v1, pointerId:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    if-ne v1, v3, :cond_0

    .line 1600
    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 1601
    .local v0, newPointerIndex:I
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionX:F

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    .line 1602
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionY:F

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    .line 1603
    iput v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    .line 1604
    iput v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    .line 1605
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1606
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_0

    .line 1607
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 1610
    .end local v0           #newPointerIndex:I
    :cond_0
    return-void

    .line 1600
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private overScrollInfluenceCurve(F)F
    .locals 2
    .parameter "f"

    .prologue
    const/high16 v1, 0x3f80

    .line 1277
    sub-float/2addr p1, v1

    .line 1278
    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, v1

    return v0
.end method

.method private releaseVelocityTracker()V
    .locals 1

    .prologue
    .line 1586
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 1587
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1588
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1590
    :cond_0
    return-void
.end method

.method private updateScrollingIndicator()V
    .locals 2

    .prologue
    .line 2138
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    .line 2149
    :cond_0
    :goto_0
    return-void

    .line 2139
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2140
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleScrollIndicator:Z

    if-nez v0, :cond_0

    .line 2142
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2143
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 2144
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicatorPosition()V

    .line 2146
    :cond_2
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicator:Z

    if-eqz v0, :cond_0

    .line 2147
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->showScrollingIndicator(Z)V

    goto :goto_0
.end method

.method private updateScrollingIndicatorPosition()V
    .locals 17

    .prologue
    .line 2152
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v13

    if-nez v13, :cond_1

    .line 2196
    :cond_0
    :goto_0
    return-void

    .line 2153
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v13, :cond_0

    .line 2154
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleScrollIndicator:Z

    if-nez v13, :cond_0

    .line 2155
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v8

    .line 2156
    .local v8, numPages:I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v13, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v10

    .line 2157
    .local v10, pageSize:I
    :goto_1
    const/4 v13, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 2158
    .local v6, lastChildIndex:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v14

    sub-int v7, v13, v14

    .line 2159
    .local v7, maxScroll:I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v13, :cond_5

    .line 2160
    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingLeft:I

    sub-int v13, v10, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingRight:I

    sub-int v12, v13, v14

    .line 2161
    .local v12, trackWidth:I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getPaddingLeft()I

    move-result v14

    sub-int/2addr v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getPaddingRight()I

    move-result v14

    sub-int v5, v13, v14

    .line 2164
    .local v5, indicatorWidth:I
    const/4 v13, 0x0

    const/high16 v14, 0x3f80

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollX()I

    move-result v15

    int-to-float v15, v15

    int-to-float v0, v7

    move/from16 v16, v0

    div-float v15, v15, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->min(FF)F

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 2165
    .local v9, offset:F
    div-int v4, v12, v8

    .line 2166
    .local v4, indicatorSpace:I
    sub-int v13, v12, v4

    int-to-float v13, v13

    mul-float/2addr v13, v9

    float-to-int v13, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingLeft:I

    add-int v3, v13, v14

    .line 2167
    .local v3, indicatorPos:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->hasElasticScrollIndicator()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 2168
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    if-eq v13, v4, :cond_2

    .line 2169
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iput v4, v13, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 2170
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->requestLayout()V

    .line 2176
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    int-to-float v14, v3

    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationX(F)V

    goto/16 :goto_0

    .line 2156
    .end local v3           #indicatorPos:I
    .end local v4           #indicatorSpace:I
    .end local v5           #indicatorWidth:I
    .end local v6           #lastChildIndex:I
    .end local v7           #maxScroll:I
    .end local v9           #offset:F
    .end local v10           #pageSize:I
    .end local v12           #trackWidth:I
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v10

    goto/16 :goto_1

    .line 2173
    .restart local v3       #indicatorPos:I
    .restart local v4       #indicatorSpace:I
    .restart local v5       #indicatorWidth:I
    .restart local v6       #lastChildIndex:I
    .restart local v7       #maxScroll:I
    .restart local v9       #offset:F
    .restart local v10       #pageSize:I
    .restart local v12       #trackWidth:I
    :cond_4
    div-int/lit8 v13, v4, 0x2

    div-int/lit8 v14, v5, 0x2

    sub-int v1, v13, v14

    .line 2174
    .local v1, indicatorCenterOffset:I
    add-int/2addr v3, v1

    goto :goto_2

    .line 2178
    .end local v1           #indicatorCenterOffset:I
    .end local v3           #indicatorPos:I
    .end local v4           #indicatorSpace:I
    .end local v5           #indicatorWidth:I
    .end local v9           #offset:F
    .end local v12           #trackWidth:I
    :cond_5
    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingTop:I

    sub-int v13, v10, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingBottom:I

    sub-int v11, v13, v14

    .line 2179
    .local v11, trackHeight:I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getPaddingTop()I

    move-result v14

    sub-int/2addr v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getPaddingBottom()I

    move-result v14

    sub-int v2, v13, v14

    .line 2182
    .local v2, indicatorHeight:I
    const/4 v13, 0x0

    const/high16 v14, 0x3f80

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollY()I

    move-result v15

    int-to-float v15, v15

    int-to-float v0, v7

    move/from16 v16, v0

    div-float v15, v15, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->min(FF)F

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 2183
    .restart local v9       #offset:F
    div-int v4, v11, v8

    .line 2184
    .restart local v4       #indicatorSpace:I
    sub-int v13, v11, v4

    int-to-float v13, v13

    mul-float/2addr v13, v9

    float-to-int v13, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorPaddingTop:I

    add-int v3, v13, v14

    .line 2185
    .restart local v3       #indicatorPos:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->hasElasticScrollIndicator()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 2186
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    if-eq v13, v4, :cond_6

    .line 2187
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iput v4, v13, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 2188
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->requestLayout()V

    .line 2194
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    int-to-float v14, v3

    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationY(F)V

    goto/16 :goto_0

    .line 2191
    :cond_7
    div-int/lit8 v13, v4, 0x2

    div-int/lit8 v14, v2, 0x2

    sub-int v1, v13, v14

    .line 2192
    .restart local v1       #indicatorCenterOffset:I
    add-int/2addr v3, v1

    goto :goto_3
.end method


# virtual methods
.method protected acceleratedOverScroll(F)V
    .locals 7
    .parameter "amount"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 1282
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v2

    .line 1286
    .local v2, screenSize:I
    :goto_0
    const/high16 v3, 0x4000

    int-to-float v4, v2

    div-float v4, p1, v4

    mul-float v0, v3, v4

    .line 1288
    .local v0, f:F
    cmpl-float v3, v0, v5

    if-nez v3, :cond_1

    .line 1314
    :goto_1
    return-void

    .line 1282
    .end local v0           #f:F
    .end local v2           #screenSize:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v2

    goto :goto_0

    .line 1291
    .restart local v0       #f:F
    .restart local v2       #screenSize:I
    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f80

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_2

    .line 1292
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float/2addr v0, v3

    .line 1295
    :cond_2
    int-to-float v3, v2

    mul-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1296
    .local v1, overScrollAmount:I
    cmpg-float v3, p1, v5

    if-gez v3, :cond_4

    .line 1297
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_3

    .line 1298
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    .line 1299
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    .line 1313
    :goto_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    goto :goto_1

    .line 1301
    :cond_3
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    .line 1302
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_2

    .line 1305
    :cond_4
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_5

    .line 1306
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    .line 1307
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    goto :goto_2

    .line 1309
    :cond_5
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    .line 1310
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_2
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
    .line 1015
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1016
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 1018
    :cond_0
    const/16 v0, 0x11

    if-ne p2, v0, :cond_2

    .line 1019
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-lez v0, :cond_1

    .line 1020
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 1027
    :cond_1
    :goto_0
    return-void

    .line 1022
    :cond_2
    const/16 v0, 0x42

    if-ne p2, v0, :cond_1

    .line 1023
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    .line 1024
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    goto :goto_0
.end method

.method public allowLongPress()Z
    .locals 1

    .prologue
    .line 1863
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    return v0
.end method

.method protected cancelCurrentPageLongPress()V
    .locals 2

    .prologue
    .line 1247
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    if-eqz v1, :cond_0

    .line 1248
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    .line 1252
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 1253
    .local v0, currentPage:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1254
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 1257
    .end local v0           #currentPage:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected cancelScrollingIndicatorAnimations()V
    .locals 1

    .prologue
    .line 2070
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 2071
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 2073
    :cond_0
    return-void
.end method

.method public computeScroll()V
    .locals 0

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->computeScrollHelper()Z

    .line 514
    return-void
.end method

.method protected computeScrollHelper()Z
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v6, -0x1

    const/4 v3, 0x0

    .line 471
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 473
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollX()I

    move-result v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollY()I

    move-result v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    if-ne v3, v4, :cond_0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 476
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 478
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    .line 508
    :cond_2
    :goto_0
    return v2

    .line 480
    :cond_3
    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    if-eq v4, v6, :cond_6

    .line 481
    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 482
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    .line 483
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->notifyPageSwitchListener()V

    .line 486
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    if-eqz v4, :cond_4

    .line 487
    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->loadAssociatedPages(I)V

    .line 488
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    .line 493
    :cond_4
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    if-nez v3, :cond_5

    .line 494
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->pageEndMoving()V

    .line 498
    :cond_5
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "accessibility"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 500
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 501
    const/16 v3, 0x1000

    invoke-static {v3}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 503
    .local v1, ev:Landroid/view/accessibility/AccessibilityEvent;
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPageDescription()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_0

    .end local v0           #accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    .end local v1           #ev:Landroid/view/accessibility/AccessibilityEvent;
    :cond_6
    move v2, v3

    .line 508
    goto :goto_0
.end method

.method protected dampedOverScroll(F)V
    .locals 7
    .parameter "amount"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 1317
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v2

    .line 1319
    .local v2, screenSize:I
    :goto_0
    int-to-float v3, v2

    div-float v0, p1, v3

    .line 1321
    .local v0, f:F
    cmpl-float v3, v0, v5

    if-nez v3, :cond_1

    .line 1348
    :goto_1
    return-void

    .line 1317
    .end local v0           #f:F
    .end local v2           #screenSize:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v2

    goto :goto_0

    .line 1322
    .restart local v0       #f:F
    .restart local v2       #screenSize:I
    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float v3, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->overScrollInfluenceCurve(F)F

    move-result v4

    mul-float v0, v3, v4

    .line 1325
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f80

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_2

    .line 1326
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float/2addr v0, v3

    .line 1329
    :cond_2
    const v3, 0x3e0f5c29

    mul-float/2addr v3, v0

    int-to-float v4, v2

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1330
    .local v1, overScrollAmount:I
    cmpg-float v3, p1, v5

    if-gez v3, :cond_4

    .line 1331
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_3

    .line 1332
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    .line 1333
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    .line 1347
    :goto_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    goto :goto_1

    .line 1335
    :cond_3
    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    .line 1336
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_2

    .line 1339
    :cond_4
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_5

    .line 1340
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    .line 1341
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    goto :goto_2

    .line 1343
    :cond_5
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    .line 1344
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    iput v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_2
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 1192
    const/high16 v0, 0x3f80

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    .line 1193
    return-void
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;F)V
    .locals 12
    .parameter "ev"
    .parameter "touchSlopScale"

    .prologue
    .line 1204
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 1205
    .local v0, pointerIndex:I
    const/4 v10, -0x1

    if-ne v0, v10, :cond_1

    .line 1244
    :cond_0
    :goto_0
    return-void

    .line 1208
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    .line 1209
    .local v2, x:F
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 1210
    .local v6, y:F
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    sub-float v10, v2, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v3, v10

    .line 1211
    .local v3, xDiff:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    sub-float v10, v6, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v7, v10

    .line 1213
    .local v7, yDiff:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchSlop:I

    int-to-float v10, v10

    mul-float/2addr v10, p2

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1214
    .local v1, touchSlop:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPagingTouchSlop:I

    if-le v3, v10, :cond_4

    const/4 v5, 0x1

    .line 1215
    .local v5, xPaged:Z
    :goto_1
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPagingTouchSlop:I

    if-le v7, v10, :cond_5

    const/4 v9, 0x1

    .line 1216
    .local v9, yPaged:Z
    :goto_2
    if-le v3, v1, :cond_6

    const/4 v4, 0x1

    .line 1217
    .local v4, xMoved:Z
    :goto_3
    if-le v7, v1, :cond_7

    const/4 v8, 0x1

    .line 1219
    .local v8, yMoved:Z
    :goto_4
    if-nez v4, :cond_2

    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_8

    if-eqz v5, :cond_9

    .line 1220
    :cond_2
    :goto_5
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_b

    .line 1221
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUsePagingTouchSlop:Z

    if-eqz v10, :cond_a

    if-eqz v5, :cond_3

    .line 1223
    :goto_6
    const/4 v10, 0x1

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1224
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    sub-float/2addr v11, v2

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    add-float/2addr v10, v11

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    .line 1225
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    .line 1226
    const/4 v10, 0x0

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    .line 1227
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    int-to-float v10, v10

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchX:F

    .line 1228
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->pageBeginMoving()V

    .line 1242
    :cond_3
    :goto_7
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->cancelCurrentPageLongPress()V

    goto :goto_0

    .line 1214
    .end local v4           #xMoved:Z
    .end local v5           #xPaged:Z
    .end local v8           #yMoved:Z
    .end local v9           #yPaged:Z
    :cond_4
    const/4 v5, 0x0

    goto :goto_1

    .line 1215
    .restart local v5       #xPaged:Z
    :cond_5
    const/4 v9, 0x0

    goto :goto_2

    .line 1216
    .restart local v9       #yPaged:Z
    :cond_6
    const/4 v4, 0x0

    goto :goto_3

    .line 1217
    .restart local v4       #xMoved:Z
    :cond_7
    const/4 v8, 0x0

    goto :goto_4

    .line 1219
    .restart local v8       #yMoved:Z
    :cond_8
    if-nez v9, :cond_2

    :cond_9
    if-eqz v8, :cond_0

    goto :goto_5

    .line 1221
    :cond_a
    if-eqz v4, :cond_3

    goto :goto_6

    .line 1231
    :cond_b
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUsePagingTouchSlop:Z

    if-eqz v10, :cond_c

    if-eqz v9, :cond_3

    .line 1233
    :goto_8
    const/4 v10, 0x1

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1234
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    sub-float/2addr v11, v6

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    add-float/2addr v10, v11

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    .line 1235
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    .line 1236
    const/4 v10, 0x0

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    .line 1237
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    int-to-float v10, v10

    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchY:F

    .line 1238
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->pageBeginMoving()V

    goto :goto_7

    .line 1231
    :cond_c
    if-eqz v8, :cond_3

    goto :goto_8
.end method

.method protected disableScrollingIndicator()V
    .locals 2

    .prologue
    .line 2122
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2123
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2125
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    .line 2126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    .line 2127
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 13
    .parameter "canvas"

    .prologue
    const/4 v9, -0x1

    const/4 v12, 0x0

    .line 932
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v7, :cond_4

    .line 933
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastScreenScroll:I

    if-ne v7, v8, :cond_0

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    if-eqz v7, :cond_1

    .line 934
    :cond_0
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->screenScrolled(I)V

    .line 935
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    iput v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastScreenScroll:I

    .line 936
    iput-boolean v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    .line 947
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v4

    .line 948
    .local v4, pageCount:I
    if-lez v4, :cond_7

    .line 949
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTempVisiblePagesRange:[I

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->getVisiblePages([I)V

    .line 950
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTempVisiblePagesRange:[I

    aget v3, v7, v12

    .line 951
    .local v3, leftTopScreen:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTempVisiblePagesRange:[I

    const/4 v8, 0x1

    aget v5, v7, v8

    .line 952
    .local v5, rightBottomScreen:I
    if-eq v3, v9, :cond_7

    if-eq v5, v9, :cond_7

    .line 953
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getDrawingTime()J

    move-result-wide v0

    .line 955
    .local v0, drawingTime:J
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 956
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollX()I

    move-result v7

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollY()I

    move-result v8

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollX()I

    move-result v9

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getRight()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getLeft()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollY()I

    move-result v10

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getBottom()I

    move-result v11

    add-int/2addr v10, v11

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getTop()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 959
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    .local v2, i:I
    :goto_1
    if-ltz v2, :cond_6

    .line 960
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    .line 961
    .local v6, v:Landroid/view/View;
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceDrawAllChildrenNextFrame:Z

    if-nez v7, :cond_2

    if-gt v3, v2, :cond_3

    if-gt v2, v5, :cond_3

    :cond_2
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->shouldDrawChild(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 963
    invoke-virtual {p0, p1, v6, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 959
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 939
    .end local v0           #drawingTime:J
    .end local v2           #i:I
    .end local v3           #leftTopScreen:I
    .end local v4           #pageCount:I
    .end local v5           #rightBottomScreen:I
    .end local v6           #v:Landroid/view/View;
    :cond_4
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastScreenScroll:I

    if-ne v7, v8, :cond_5

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    if-eqz v7, :cond_1

    .line 940
    :cond_5
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->screenScrolled(I)V

    .line 941
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    iput v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastScreenScroll:I

    .line 942
    iput-boolean v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    goto :goto_0

    .line 966
    .restart local v0       #drawingTime:J
    .restart local v2       #i:I
    .restart local v3       #leftTopScreen:I
    .restart local v4       #pageCount:I
    .restart local v5       #rightBottomScreen:I
    :cond_6
    iput-boolean v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 967
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 970
    .end local v0           #drawingTime:J
    .end local v2           #i:I
    .end local v3           #leftTopScreen:I
    .end local v5           #rightBottomScreen:I
    :cond_7
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 3
    .parameter "focused"
    .parameter "direction"

    .prologue
    const/4 v0, 0x1

    .line 999
    const/16 v1, 0x11

    if-ne p2, v1, :cond_0

    .line 1000
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    if-lez v1, :cond_1

    .line 1001
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 1010
    :goto_0
    return v0

    .line 1004
    :cond_0
    const/16 v1, 0x42

    if-ne p2, v1, :cond_1

    .line 1005
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    .line 1006
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    goto :goto_0

    .line 1010
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    goto :goto_0
.end method

.method distanceInfluenceForSnapDuration(F)F
    .locals 4
    .parameter "f"

    .prologue
    .line 1737
    const/high16 v0, 0x3f00

    sub-float/2addr p1, v0

    .line 1738
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 1739
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method protected enableScrollingIndicator()V
    .locals 2

    .prologue
    .line 2114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    .line 2115
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2116
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2117
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2119
    :cond_0
    return-void
.end method

.method protected flashScrollingIndicator(Z)V
    .locals 3
    .parameter "animated"

    .prologue
    .line 2036
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2037
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->showScrollingIndicator(Z)V

    .line 2038
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicatorRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x28a

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2039
    return-void

    .line 2037
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public focusableViewAvailable(Landroid/view/View;)V
    .locals 4
    .parameter "focused"

    .prologue
    .line 1038
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 1039
    .local v0, current:Landroid/view/View;
    move-object v2, p1

    .line 1041
    .local v2, v:Landroid/view/View;
    :goto_0
    if-ne v2, v0, :cond_1

    .line 1042
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->focusableViewAvailable(Landroid/view/View;)V

    .line 1052
    :cond_0
    return-void

    .line 1045
    :cond_1
    if-eq v2, p0, :cond_0

    .line 1048
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 1049
    .local v1, parent:Landroid/view/ViewParent;
    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_0

    .line 1050
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
    .line 1942
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
    .line 1945
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 1946
    .local v0, count:I
    add-int/lit8 v1, p1, 0x1

    add-int/lit8 v2, v0, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    return v1
.end method

.method protected getChildHeight(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 1649
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 1650
    .local v0, measuredHeight:I
    :goto_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinimumHeight:I

    .line 1651
    .local v1, minHeight:I
    if-le v1, v0, :cond_1

    .end local v1           #minHeight:I
    :goto_1
    return v1

    .line 1649
    .end local v0           #measuredHeight:I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .restart local v0       #measuredHeight:I
    .restart local v1       #minHeight:I
    :cond_1
    move v1, v0

    .line 1651
    goto :goto_1
.end method

.method protected getChildIndexForRelativeOffset(I)I
    .locals 5
    .parameter "relativeOffset"

    .prologue
    .line 1624
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 1627
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 1628
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 1629
    .local v2, leftTop:I
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v4, :cond_0

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v4

    :goto_1
    add-int v3, v2, v4

    .line 1631
    .local v3, rightBottom:I
    if-gt v2, p1, :cond_1

    if-gt p1, v3, :cond_1

    .line 1635
    .end local v1           #i:I
    .end local v2           #leftTop:I
    .end local v3           #rightBottom:I
    :goto_2
    return v1

    .line 1629
    .restart local v1       #i:I
    .restart local v2       #leftTop:I
    :cond_0
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v4

    goto :goto_1

    .line 1627
    .restart local v3       #rightBottom:I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1635
    .end local v2           #leftTop:I
    .end local v3           #rightBottom:I
    :cond_2
    const/4 v1, -0x1

    goto :goto_2
.end method

.method protected getChildOffset(I)I
    .locals 5
    .parameter "index"

    .prologue
    const/4 v2, 0x0

    .line 806
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLayoutScale:F

    const/high16 v4, 0x3f80

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsets:[I

    .line 809
    .local v0, childOffsets:[I
    :goto_0
    if-eqz v0, :cond_2

    aget v3, v0, p1

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    .line 810
    aget v2, v0, p1

    .line 823
    :cond_0
    :goto_1
    return v2

    .line 806
    .end local v0           #childOffsets:[I
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsetsWithLayoutScale:[I

    goto :goto_0

    .line 812
    .restart local v0       #childOffsets:[I
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v3

    if-eqz v3, :cond_0

    .line 815
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 816
    .local v2, offset:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    if-ge v1, p1, :cond_4

    .line 817
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_3

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v3

    :goto_3
    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 816
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 817
    :cond_3
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v3

    goto :goto_3

    .line 820
    :cond_4
    if-eqz v0, :cond_0

    .line 821
    aput v2, v0, p1

    goto :goto_1
.end method

.method protected getChildWidth(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 1641
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 1642
    .local v0, measuredWidth:I
    :goto_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinimumWidth:I

    .line 1643
    .local v1, minWidth:I
    if-le v1, v0, :cond_1

    .end local v1           #minWidth:I
    :goto_1
    return v1

    .line 1641
    .end local v0           #measuredWidth:I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .restart local v0       #measuredWidth:I
    .restart local v1       #minWidth:I
    :cond_1
    move v1, v0

    .line 1643
    goto :goto_1
.end method

.method getCurrentPage()I
    .locals 1

    .prologue
    .line 298
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    return v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 4

    .prologue
    .line 2251
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getNextPage()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNextPage()I
    .locals 2

    .prologue
    .line 301
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    goto :goto_0
.end method

.method getPageAt(I)Landroid/view/View;
    .locals 1
    .parameter "index"

    .prologue
    .line 309
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getPageCount()I
    .locals 1

    .prologue
    .line 305
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getPageForView(Landroid/view/View;)I
    .locals 5
    .parameter "v"

    .prologue
    .line 1846
    const/4 v2, -0x1

    .line 1847
    .local v2, result:I
    if-eqz p1, :cond_1

    .line 1848
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 1849
    .local v3, vp:Landroid/view/ViewParent;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 1850
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1851
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 1856
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #vp:Landroid/view/ViewParent;
    :goto_1
    return v1

    .line 1850
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

    .line 1856
    goto :goto_1
.end method

.method getPageNearestToCenterOfScreen()I
    .locals 13

    .prologue
    .line 1655
    const v8, 0x7fffffff

    .line 1656
    .local v8, minDistanceFromScreenCenter:I
    const/4 v9, -0x1

    .line 1657
    .local v9, minDistanceFromScreenCenterIndex:I
    iget-boolean v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v11, :cond_1

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v12

    div-int/lit8 v12, v12, 0x2

    add-int v10, v11, v12

    .line 1659
    .local v10, screenCenter:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v1

    .line 1660
    .local v1, childCount:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-ge v6, v1, :cond_3

    .line 1661
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v7

    .line 1663
    .local v7, layout:Landroid/view/View;
    iget-boolean v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v11, :cond_2

    .line 1664
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v3

    .line 1665
    .local v3, childWidth:I
    div-int/lit8 v5, v3, 0x2

    .line 1670
    .end local v3           #childWidth:I
    .local v5, halfChild:I
    :goto_2
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v11

    add-int v0, v11, v5

    .line 1671
    .local v0, childCenter:I
    sub-int v11, v0, v10

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 1672
    .local v4, distanceFromScreenCenter:I
    if-ge v4, v8, :cond_0

    .line 1673
    move v8, v4

    .line 1674
    move v9, v6

    .line 1660
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1657
    .end local v0           #childCenter:I
    .end local v1           #childCount:I
    .end local v4           #distanceFromScreenCenter:I
    .end local v5           #halfChild:I
    .end local v6           #i:I
    .end local v7           #layout:Landroid/view/View;
    .end local v10           #screenCenter:I
    :cond_1
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v12

    div-int/lit8 v12, v12, 0x2

    add-int v10, v11, v12

    goto :goto_0

    .line 1667
    .restart local v1       #childCount:I
    .restart local v6       #i:I
    .restart local v7       #layout:Landroid/view/View;
    .restart local v10       #screenCenter:I
    :cond_2
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v2

    .line 1668
    .local v2, childHeight:I
    div-int/lit8 v5, v2, 0x2

    .restart local v5       #halfChild:I
    goto :goto_2

    .line 1677
    .end local v2           #childHeight:I
    .end local v5           #halfChild:I
    .end local v7           #layout:Landroid/view/View;
    :cond_3
    return v9
.end method

.method protected getRelativeChildOffset(I)I
    .locals 5
    .parameter "index"

    .prologue
    .line 828
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    aget v2, v2, p1

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 829
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    aget v0, v2, p1

    .line 844
    :cond_0
    :goto_0
    return v0

    .line 832
    :cond_1
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v2, :cond_2

    .line 833
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingRight:I

    add-int v1, v2, v3

    .line 834
    .local v1, padding:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildWidth(I)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 841
    .local v0, offset:I
    :goto_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    if-eqz v2, :cond_0

    .line 842
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    aput v0, v2, p1

    goto :goto_0

    .line 837
    .end local v0           #offset:I
    .end local v1           #padding:I
    :cond_2
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingBottom:I

    add-int v1, v2, v3

    .line 838
    .restart local v1       #padding:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildHeight(I)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .restart local v0       #offset:I
    goto :goto_1
.end method

.method protected getScaledMeasuredHeight(Landroid/view/View;)I
    .locals 5
    .parameter "child"

    .prologue
    .line 874
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 875
    .local v1, measuredHeight:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinimumHeight:I

    .line 876
    .local v2, minHeight:I
    if-le v2, v1, :cond_0

    move v0, v2

    .line 877
    .local v0, maxHeight:I
    :goto_0
    int-to-float v3, v0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLayoutScale:F

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    float-to-int v3, v3

    return v3

    .end local v0           #maxHeight:I
    :cond_0
    move v0, v1

    .line 876
    goto :goto_0
.end method

.method protected getScaledMeasuredWidth(Landroid/view/View;)I
    .locals 5
    .parameter "child"

    .prologue
    .line 865
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    .line 866
    .local v1, measuredWidth:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinimumWidth:I

    .line 867
    .local v2, minWidth:I
    if-le v2, v1, :cond_0

    move v0, v2

    .line 868
    .local v0, maxWidth:I
    :goto_0
    int-to-float v3, v0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLayoutScale:F

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    float-to-int v3, v3

    return v3

    .end local v0           #maxWidth:I
    :cond_0
    move v0, v1

    .line 867
    goto :goto_0
.end method

.method protected getScaledRelativeChildOffset(I)I
    .locals 5
    .parameter "index"

    .prologue
    .line 850
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v2, :cond_0

    .line 851
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingRight:I

    add-int v1, v2, v3

    .line 852
    .local v1, padding:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 859
    .local v0, offset:I
    :goto_0
    return v0

    .line 855
    .end local v0           #offset:I
    .end local v1           #padding:I
    :cond_0
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingBottom:I

    add-int v1, v2, v3

    .line 856
    .restart local v1       #padding:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .restart local v0       #offset:I
    goto :goto_0
.end method

.method protected getScrollInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    .prologue
    .line 1729
    new-instance v0, Lcom/cyanogenmod/trebuchet/PagedView$QuintInterpolator;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/PagedView$QuintInterpolator;-><init>()V

    return-object v0
.end method

.method protected getScrollProgress(ILandroid/view/View;I)F
    .locals 8
    .parameter "screenScroll"
    .parameter "v"
    .parameter "page"

    .prologue
    const/high16 v7, 0x3f80

    .line 1260
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v5

    :goto_0
    div-int/lit8 v1, v5, 0x2

    .line 1261
    .local v1, halfScreenSize:I
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v5

    :goto_1
    div-int/lit8 v5, v5, 0x2

    add-int v2, p1, v5

    .line 1263
    .local v2, screenCenter:I
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_2

    invoke-virtual {p0, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v5

    :goto_2
    iget v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int v4, v5, v6

    .line 1265
    .local v4, totalDistance:I
    invoke-virtual {p0, p3}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v5

    invoke-virtual {p0, p3}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v6

    sub-int/2addr v5, v6

    add-int/2addr v5, v1

    sub-int v0, v2, v5

    .line 1268
    .local v0, delta:I
    int-to-float v5, v0

    int-to-float v6, v4

    mul-float/2addr v6, v7

    div-float v3, v5, v6

    .line 1269
    .local v3, scrollProgress:F
    invoke-static {v3, v7}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 1270
    const/high16 v5, -0x4080

    invoke-static {v3, v5}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 1271
    return v3

    .line 1260
    .end local v0           #delta:I
    .end local v1           #halfScreenSize:I
    .end local v2           #screenCenter:I
    .end local v3           #scrollProgress:F
    .end local v4           #totalDistance:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v5

    goto :goto_0

    .line 1261
    .restart local v1       #halfScreenSize:I
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v5

    goto :goto_1

    .line 1263
    .restart local v2       #screenCenter:I
    :cond_2
    invoke-virtual {p0, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v5

    goto :goto_2
.end method

.method protected getScrollingIndicator()Landroid/view/View;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2008
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-nez v1, :cond_0

    .line 2009
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 2010
    .local v0, parent:Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 2011
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollingIndicatorId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    .line 2012
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    .line 2013
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHasScrollIndicator:Z

    if-eqz v1, :cond_0

    .line 2014
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2018
    .end local v0           #parent:Landroid/view/ViewGroup;
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    return-object v1

    .restart local v0       #parent:Landroid/view/ViewGroup;
    :cond_1
    move v1, v2

    .line 2012
    goto :goto_0
.end method

.method protected getScrollingIndicatorId()I
    .locals 1

    .prologue
    .line 2026
    const v0, 0x7f07003c

    return v0
.end method

.method protected getVisiblePages([I)V
    .locals 13
    .parameter "range"

    .prologue
    .line 881
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v2

    .line 883
    .local v2, pageCount:I
    if-lez v2, :cond_5

    .line 884
    iget-boolean v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v11, :cond_2

    .line 885
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v4

    .line 886
    .local v4, pageWidth:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v7

    .line 887
    .local v7, screenWidth:I
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledRelativeChildOffset(I)I

    move-result v11

    add-int v9, v11, v4

    .line 888
    .local v9, x:I
    const/4 v1, 0x0

    .line 889
    .local v1, leftScreen:I
    const/4 v5, 0x0

    .line 890
    .local v5, rightScreen:I
    :goto_0
    add-int/lit8 v11, v2, -0x1

    if-ge v1, v11, :cond_0

    int-to-float v11, v9

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->getTranslationX()F

    move-result v12

    add-float/2addr v11, v12

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    int-to-float v12, v12

    cmpg-float v11, v11, v12

    if-gtz v11, :cond_0

    .line 891
    add-int/lit8 v1, v1, 0x1

    .line 892
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v11

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v11, v12

    add-int/2addr v9, v11

    goto :goto_0

    .line 894
    :cond_0
    move v5, v1

    .line 896
    :goto_1
    add-int/lit8 v11, v2, -0x1

    if-ge v5, v11, :cond_1

    int-to-float v11, v9

    add-int/lit8 v12, v5, 0x1

    invoke-virtual {p0, v12}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->getTranslationX()F

    move-result v12

    add-float/2addr v11, v12

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    add-int/2addr v12, v7

    int-to-float v12, v12

    cmpg-float v11, v11, v12

    if-gez v11, :cond_1

    .line 897
    add-int/lit8 v5, v5, 0x1

    .line 898
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v11

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v11, v12

    add-int/2addr v9, v11

    goto :goto_1

    .line 900
    :cond_1
    const/4 v11, 0x0

    aput v1, p1, v11

    .line 901
    const/4 v11, 0x1

    aput v5, p1, v11

    .line 924
    .end local v1           #leftScreen:I
    .end local v4           #pageWidth:I
    .end local v5           #rightScreen:I
    .end local v7           #screenWidth:I
    .end local v9           #x:I
    :goto_2
    return-void

    .line 903
    :cond_2
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v3

    .line 904
    .local v3, pageHeight:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v6

    .line 905
    .local v6, screenHeight:I
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledRelativeChildOffset(I)I

    move-result v11

    add-int v10, v11, v3

    .line 906
    .local v10, y:I
    const/4 v8, 0x0

    .line 907
    .local v8, topScreen:I
    const/4 v0, 0x0

    .line 908
    .local v0, bottomScreen:I
    :goto_3
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    if-gt v10, v11, :cond_3

    add-int/lit8 v11, v2, -0x1

    if-ge v8, v11, :cond_3

    .line 909
    add-int/lit8 v8, v8, 0x1

    .line 910
    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v11

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v11, v12

    add-int/2addr v10, v11

    goto :goto_3

    .line 912
    :cond_3
    move v0, v8

    .line 913
    :goto_4
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    add-int/2addr v11, v6

    if-ge v10, v11, :cond_4

    add-int/lit8 v11, v2, -0x1

    if-ge v0, v11, :cond_4

    .line 914
    add-int/lit8 v0, v0, 0x1

    .line 915
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v11

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v11, v12

    add-int/2addr v10, v11

    goto :goto_4

    .line 917
    :cond_4
    const/4 v11, 0x0

    aput v8, p1, v11

    .line 918
    const/4 v11, 0x1

    aput v0, p1, v11

    goto :goto_2

    .line 921
    .end local v0           #bottomScreen:I
    .end local v3           #pageHeight:I
    .end local v6           #screenHeight:I
    .end local v8           #topScreen:I
    .end local v10           #y:I
    :cond_5
    const/4 v11, 0x0

    const/4 v12, -0x1

    aput v12, p1, v11

    .line 922
    const/4 v11, 0x1

    const/4 v12, -0x1

    aput v12, p1, v11

    goto :goto_2
.end method

.method protected hasElasticScrollIndicator()Z
    .locals 1

    .prologue
    .line 2134
    const/4 v0, 0x1

    return v0
.end method

.method public hideScrollIndicatorTrack()V
    .locals 0

    .prologue
    .line 2202
    return-void
.end method

.method protected hideScrollingIndicator(Z)V
    .locals 1
    .parameter "immediately"

    .prologue
    .line 2076
    const/16 v0, 0x28a

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicator(ZI)V

    .line 2077
    return-void
.end method

.method protected hideScrollingIndicator(ZI)V
    .locals 5
    .parameter "immediately"
    .parameter "duration"

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 2080
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    if-gt v0, v2, :cond_1

    .line 2111
    :cond_0
    :goto_0
    return-void

    .line 2081
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2082
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleScrollIndicator:Z

    if-nez v0, :cond_0

    .line 2084
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2085
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2087
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicatorPosition()V

    .line 2088
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 2089
    if-nez p1, :cond_2

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollingPaused:Z

    if-eqz v0, :cond_3

    .line 2090
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2091
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    .line 2093
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    .line 2094
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2095
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/cyanogenmod/trebuchet/PagedView$2;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/PagedView$2;-><init>(Lcom/cyanogenmod/trebuchet/PagedView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2108
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0
.end method

.method protected hitsNextPage(FF)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1082
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_0

    .end local p1
    :goto_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v0

    :goto_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    const/4 v0, 0x1

    :goto_2
    return v0

    .restart local p1
    :cond_0
    move p1, p2

    goto :goto_0

    .end local p1
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_2
.end method

.method protected hitsPreviousPage(FF)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1075
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_0

    .end local p1
    :goto_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    .restart local p1
    :cond_0
    move p1, p2

    goto :goto_0

    .end local p1
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected indexToPage(I)I
    .locals 0
    .parameter "index"

    .prologue
    .line 313
    return p1
.end method

.method protected init()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 255
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    .line 256
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 257
    new-instance v1, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    .line 258
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 259
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    .line 260
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCenterPages:Z

    .line 262
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 263
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchSlop:I

    .line 264
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPagingTouchSlop:I

    .line 265
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaximumVelocity:I

    .line 266
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDensity:F

    .line 268
    const/high16 v1, 0x43fa

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFlingThresholdVelocity:I

    .line 269
    const/high16 v1, 0x437a

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinFlingVelocity:I

    .line 270
    const v1, 0x44bb8000

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDensity:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinSnapVelocity:I

    .line 271
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/trebuchet/PagedView;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 272
    return-void
.end method

.method protected invalidateCachedOffsets()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 787
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 788
    .local v0, count:I
    if-nez v0, :cond_1

    .line 789
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsets:[I

    .line 790
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    .line 791
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsetsWithLayoutScale:[I

    .line 803
    :cond_0
    return-void

    .line 795
    :cond_1
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsets:[I

    .line 796
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    .line 797
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsetsWithLayoutScale:[I

    .line 798
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 799
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsets:[I

    aput v3, v2, v1

    .line 800
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildRelativeOffsets:[I

    aput v3, v2, v1

    .line 801
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mChildOffsetsWithLayoutScale:[I

    aput v3, v2, v1

    .line 798
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected invalidatePageData()V
    .locals 2

    .prologue
    .line 1964
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidatePageData(IZ)V

    .line 1965
    return-void
.end method

.method protected invalidatePageData(I)V
    .locals 1
    .parameter "currentPage"

    .prologue
    .line 1967
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidatePageData(IZ)V

    .line 1968
    return-void
.end method

.method protected invalidatePageData(IZ)V
    .locals 7
    .parameter "currentPage"
    .parameter "immediateAndOnly"

    .prologue
    const/high16 v6, 0x4000

    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 1970
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    if-nez v2, :cond_1

    .line 2003
    :cond_0
    :goto_0
    return-void

    .line 1974
    :cond_1
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mContentIsRefreshable:Z

    if-eqz v2, :cond_0

    .line 1976
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2, v5}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1977
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    .line 1980
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->syncPages()V

    .line 1984
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v3

    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->measure(II)V

    .line 1988
    if-le p1, v4, :cond_2

    .line 1989
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->setCurrentPage(I)V

    .line 1993
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 1994
    .local v0, count:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1995
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 1996
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1995
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2000
    :cond_3
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v2, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->loadAssociatedPages(IZ)V

    .line 2001
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->requestLayout()V

    goto :goto_0
.end method

.method protected isDataReady()Z
    .locals 1

    .prologue
    .line 289
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    return v0
.end method

.method protected isPageMoving()Z
    .locals 1

    .prologue
    .line 399
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    return v0
.end method

.method protected isScrollingIndicatorEnabled()Z
    .locals 1

    .prologue
    .line 2022
    const/4 v0, 0x1

    return v0
.end method

.method protected loadAssociatedPages(I)V
    .locals 1
    .parameter "page"

    .prologue
    .line 1905
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->loadAssociatedPages(IZ)V

    .line 1906
    return-void
.end method

.method protected loadAssociatedPages(IZ)V
    .locals 9
    .parameter "page"
    .parameter "immediateAndOnly"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1908
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mContentIsRefreshable:Z

    if-eqz v5, :cond_7

    .line 1909
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    .line 1910
    .local v0, count:I
    if-ge p1, v0, :cond_7

    .line 1911
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getAssociatedLowerPageBound(I)I

    move-result v3

    .line 1912
    .local v3, lowerPageBound:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getAssociatedUpperPageBound(I)I

    move-result v4

    .line 1916
    .local v4, upperPageBound:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_3

    .line 1917
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/Page;

    .line 1918
    .local v2, layout:Lcom/cyanogenmod/trebuchet/Page;
    if-lt v1, v3, :cond_0

    if-le v1, v4, :cond_2

    .line 1919
    :cond_0
    invoke-interface {v2}, Lcom/cyanogenmod/trebuchet/Page;->getPageChildCount()I

    move-result v5

    if-lez v5, :cond_1

    .line 1920
    invoke-interface {v2}, Lcom/cyanogenmod/trebuchet/Page;->removeAllViewsOnPage()V

    .line 1922
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v1, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1916
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1926
    .end local v2           #layout:Lcom/cyanogenmod/trebuchet/Page;
    :cond_3
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_7

    .line 1927
    if-eq v1, p1, :cond_5

    if-eqz p2, :cond_5

    .line 1926
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1930
    :cond_5
    if-gt v3, v1, :cond_4

    if-gt v1, v4, :cond_4

    .line 1931
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1932
    if-ne v1, p1, :cond_6

    if-eqz p2, :cond_6

    move v5, v6

    :goto_3
    invoke-virtual {p0, v1, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->syncPageItems(IZ)V

    .line 1933
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v1, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    move v5, v7

    .line 1932
    goto :goto_3

    .line 1939
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
    .line 1357
    const/high16 v0, 0x3f80

    .line 1358
    .local v0, f:F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    div-float v1, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->overScrollInfluenceCurve(F)F

    move-result v2

    mul-float v0, v1, v2

    .line 1359
    const v1, 0x3e0f5c29

    mul-float/2addr v1, v0

    return v1
.end method

.method protected notifyPageSwitchListener()V
    .locals 3

    .prologue
    .line 379
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-interface {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;->onPageSwitch(Landroid/view/View;I)V

    .line 382
    :cond_0
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 777
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mForceScreenScrolled:Z

    .line 778
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    .line 779
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidateCachedOffsets()V

    .line 780
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 784
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "event"

    .prologue
    const/16 v4, 0x9

    const/4 v3, 0x0

    .line 1551
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v2

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_0

    .line 1552
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 1575
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    :goto_0
    return v2

    .line 1557
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    .line 1558
    const/4 v1, 0x0

    .line 1559
    .local v1, vscroll:F
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v0

    .line 1564
    .local v0, hscroll:F
    :goto_1
    cmpl-float v2, v0, v3

    if-nez v2, :cond_1

    cmpl-float v2, v1, v3

    if-eqz v2, :cond_0

    .line 1565
    :cond_1
    cmpl-float v2, v0, v3

    if-gtz v2, :cond_2

    cmpl-float v2, v1, v3

    if-lez v2, :cond_4

    .line 1566
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollRight()V

    .line 1570
    :goto_2
    const/4 v2, 0x1

    goto :goto_0

    .line 1561
    .end local v0           #hscroll:F
    .end local v1           #vscroll:F
    :cond_3
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v2

    neg-float v1, v2

    .line 1562
    .restart local v1       #vscroll:F
    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v0

    .restart local v0       #hscroll:F
    goto :goto_1

    .line 1568
    :cond_4
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollLeft()V

    goto :goto_2

    .line 1552
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
    .line 2257
    const/4 v0, 0x1

    return v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 2219
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2220
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 2221
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_0

    .line 2222
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 2223
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    .line 2224
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setItemCount(I)V

    .line 2226
    :cond_0
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2
    .parameter "info"

    .prologue
    const/4 v0, 0x1

    .line 2207
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2208
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v1

    if-le v1, v0, :cond_2

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 2209
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 2210
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2212
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v0

    if-lez v0, :cond_1

    .line 2213
    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 2215
    :cond_1
    return-void

    .line 2208
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .parameter "ev"

    .prologue
    const/4 v10, -0x1

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1093
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 1096
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v5

    if-gtz v5, :cond_1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    .line 1188
    :cond_0
    :goto_0
    return v6

    .line 1103
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1104
    .local v0, action:I
    if-ne v0, v9, :cond_2

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    if-eq v5, v6, :cond_0

    .line 1109
    :cond_2
    and-int/lit16 v5, v0, 0xff

    packed-switch v5, :pswitch_data_0

    .line 1188
    :cond_3
    :goto_1
    :pswitch_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    if-eqz v5, :cond_a

    move v5, v6

    :goto_2
    move v6, v5

    goto :goto_0

    .line 1115
    :pswitch_1
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    if-eq v5, v10, :cond_4

    .line 1116
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto :goto_1

    .line 1127
    :cond_4
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 1128
    .local v2, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 1130
    .local v4, y:F
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionX:F

    .line 1131
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionY:F

    .line 1132
    iput v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    .line 1133
    iput v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    .line 1134
    iput v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    .line 1135
    iput v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    .line 1136
    iput v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    .line 1137
    iput v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    .line 1138
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1139
    iput-boolean v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    .line 1146
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_6

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getFinalX()I

    move-result v5

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrX()I

    move-result v8

    sub-int/2addr v5, v8

    :goto_3
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 1148
    .local v3, xyDist:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->isFinished()Z

    move-result v5

    if-nez v5, :cond_5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchSlop:I

    if-ge v3, v5, :cond_7

    :cond_5
    move v1, v6

    .line 1149
    .local v1, finishedScrolling:Z
    :goto_4
    if-eqz v1, :cond_8

    .line 1150
    iput v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1151
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1158
    :goto_5
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    if-eq v5, v9, :cond_3

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    const/4 v8, 0x3

    if-eq v5, v8, :cond_3

    .line 1159
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v5

    if-lez v5, :cond_3

    .line 1160
    invoke-virtual {p0, v2, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->hitsPreviousPage(FF)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1161
    iput v9, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    goto :goto_1

    .line 1146
    .end local v1           #finishedScrolling:Z
    .end local v3           #xyDist:I
    :cond_6
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getFinalY()I

    move-result v5

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->getCurrY()I

    move-result v8

    sub-int/2addr v5, v8

    goto :goto_3

    .restart local v3       #xyDist:I
    :cond_7
    move v1, v7

    .line 1148
    goto :goto_4

    .line 1153
    .restart local v1       #finishedScrolling:Z
    :cond_8
    iput v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    goto :goto_5

    .line 1162
    :cond_9
    invoke-virtual {p0, v2, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->hitsNextPage(FF)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1163
    const/4 v5, 0x3

    iput v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    goto/16 :goto_1

    .line 1172
    .end local v1           #finishedScrolling:Z
    .end local v2           #x:F
    .end local v3           #xyDist:I
    .end local v4           #y:F
    :pswitch_3
    iput v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1173
    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    .line 1174
    iput v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1175
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1179
    :pswitch_4
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 1180
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    :cond_a
    move v5, v7

    .line 1188
    goto/16 :goto_2

    .line 1109
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
    .locals 12
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 676
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    if-nez v10, :cond_1

    .line 752
    :cond_0
    :goto_0
    return-void

    .line 681
    :cond_1
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingBottom:I

    add-int v9, v10, v11

    .line 682
    .local v9, verticalPadding:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingRight:I

    add-int v6, v10, v11

    .line 683
    .local v6, horizontalPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v1

    .line 684
    .local v1, childCount:I
    const/4 v3, 0x0

    .line 685
    .local v3, childLeft:I
    const/4 v4, 0x0

    .line 686
    .local v4, childTop:I
    if-lez v1, :cond_2

    .line 690
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_5

    .line 691
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v3

    .line 697
    :goto_1
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    if-gez v10, :cond_2

    .line 698
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_6

    .line 699
    sub-int v10, p4, p2

    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    sub-int/2addr v10, v11

    div-int/lit8 v10, v10, 0x2

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setPageSpacing(I)V

    .line 706
    :cond_2
    :goto_2
    const/4 v7, 0x0

    .local v7, i:I
    :goto_3
    if-ge v7, v1, :cond_e

    .line 707
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 708
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_4

    .line 709
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_7

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v5

    .line 710
    .local v5, childWidth:I
    :goto_4
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-eqz v10, :cond_8

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredHeight(Landroid/view/View;)I

    move-result v2

    .line 711
    .local v2, childHeight:I
    :goto_5
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_9

    .line 712
    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingTop:I

    .line 717
    :goto_6
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCenterPages:Z

    if-eqz v10, :cond_3

    .line 718
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_a

    .line 719
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v10

    sub-int/2addr v10, v9

    sub-int/2addr v10, v2

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v4, v10

    .line 726
    :cond_3
    :goto_7
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_b

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    :goto_8
    add-int v11, v3, v10

    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-eqz v10, :cond_c

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    :goto_9
    add-int/2addr v10, v4

    invoke-virtual {v0, v3, v4, v11, v10}, Landroid/view/View;->layout(IIII)V

    .line 729
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_d

    .line 730
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v10, v5

    add-int/2addr v3, v10

    .line 706
    .end local v2           #childHeight:I
    .end local v5           #childWidth:I
    :cond_4
    :goto_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 693
    .end local v0           #child:Landroid/view/View;
    .end local v7           #i:I
    :cond_5
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v4

    goto :goto_1

    .line 701
    :cond_6
    sub-int v10, p3, p5

    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    sub-int/2addr v10, v11

    div-int/lit8 v10, v10, 0x2

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setPageSpacing(I)V

    goto :goto_2

    .line 709
    .restart local v0       #child:Landroid/view/View;
    .restart local v7       #i:I
    :cond_7
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    goto :goto_4

    .line 710
    .restart local v5       #childWidth:I
    :cond_8
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    goto :goto_5

    .line 714
    .restart local v2       #childHeight:I
    :cond_9
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPaddingLeft:I

    goto :goto_6

    .line 721
    :cond_a
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v10

    sub-int/2addr v10, v6

    sub-int/2addr v10, v5

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v3, v10

    goto :goto_7

    :cond_b
    move v10, v5

    .line 726
    goto :goto_8

    :cond_c
    move v10, v2

    goto :goto_9

    .line 732
    :cond_d
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    add-int/2addr v10, v2

    add-int/2addr v4, v10

    goto :goto_a

    .line 737
    .end local v0           #child:Landroid/view/View;
    .end local v2           #childHeight:I
    .end local v5           #childWidth:I
    :cond_e
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFirstLayout:Z

    if-eqz v10, :cond_0

    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-ltz v10, :cond_0

    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v11

    if-ge v10, v11, :cond_0

    .line 738
    iget v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v10

    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v11

    sub-int v8, v10, v11

    .line 739
    .local v8, newXY:I
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v10, :cond_f

    .line 740
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setHorizontalScrollBarEnabled(Z)V

    .line 741
    const/4 v10, 0x0

    invoke-virtual {p0, v8, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 742
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v10, v8}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 743
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setHorizontalScrollBarEnabled(Z)V

    .line 750
    :goto_b
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFirstLayout:Z

    goto/16 :goto_0

    .line 745
    :cond_f
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setVerticalScrollBarEnabled(Z)V

    .line 746
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v8}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 747
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v10, v8}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 748
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->setVerticalScrollBarEnabled(Z)V

    goto :goto_b
.end method

.method protected onMeasure(II)V
    .locals 22
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 518
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    move/from16 v20, v0

    if-nez v20, :cond_0

    .line 519
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 618
    :goto_0
    return-void

    .line 523
    :cond_0
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    .line 524
    .local v18, widthMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 525
    .local v8, heightMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v19

    .line 526
    .local v19, widthSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 528
    .local v9, heightSize:I
    if-lez v19, :cond_1

    if-gtz v9, :cond_2

    .line 529
    :cond_1
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    goto :goto_0

    .line 532
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v20, v0

    if-nez v20, :cond_3

    const/high16 v20, 0x4000

    move/from16 v0, v18

    move/from16 v1, v20

    if-eq v0, v1, :cond_3

    .line 533
    new-instance v20, Ljava/lang/IllegalStateException;

    const-string v21, "Workspace can only be used in EXACTLY mode."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 535
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v20, v0

    if-eqz v20, :cond_4

    const/high16 v20, 0x4000

    move/from16 v0, v20

    if-eq v8, v0, :cond_4

    .line 536
    new-instance v20, Ljava/lang/IllegalStateException;

    const-string v21, "Workspace can only be used in EXACTLY mode."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 539
    :cond_4
    const/4 v13, 0x0

    .line 540
    .local v13, maxChildHeight:I
    const/4 v14, 0x0

    .line 542
    .local v14, maxChildWidth:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPaddingTop()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPaddingBottom()I

    move-result v21

    add-int v17, v20, v21

    .line 543
    .local v17, verticalPadding:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPaddingLeft()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPaddingRight()I

    move-result v21

    add-int v10, v20, v21

    .line 549
    .local v10, horizontalPadding:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v3

    .line 550
    .local v3, childCount:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_1
    if-ge v11, v3, :cond_7

    .line 552
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 553
    .local v2, child:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    .line 556
    .local v12, lp:Landroid/view/ViewGroup$LayoutParams;
    iget v0, v12, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v20, v0

    const/16 v21, -0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_5

    .line 557
    const/high16 v7, -0x8000

    .line 563
    .local v7, childWidthMode:I
    :goto_2
    iget v0, v12, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v20, v0

    const/16 v21, -0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_6

    .line 564
    const/high16 v5, -0x8000

    .line 569
    .local v5, childHeightMode:I
    :goto_3
    sub-int v20, v19, v10

    move/from16 v0, v20

    invoke-static {v0, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 571
    .local v6, childWidthMeasureSpec:I
    sub-int v20, v9, v17

    move/from16 v0, v20

    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 574
    .local v4, childHeightMeasureSpec:I
    invoke-virtual {v2, v6, v4}, Landroid/view/View;->measure(II)V

    .line 575
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v20

    move/from16 v0, v20

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 576
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v20

    move/from16 v0, v20

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 550
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 559
    .end local v4           #childHeightMeasureSpec:I
    .end local v5           #childHeightMode:I
    .end local v6           #childWidthMeasureSpec:I
    .end local v7           #childWidthMode:I
    :cond_5
    const/high16 v7, 0x4000

    .restart local v7       #childWidthMode:I
    goto :goto_2

    .line 566
    :cond_6
    const/high16 v5, 0x4000

    .restart local v5       #childHeightMode:I
    goto :goto_3

    .line 581
    .end local v2           #child:Landroid/view/View;
    .end local v5           #childHeightMode:I
    .end local v7           #childWidthMode:I
    .end local v12           #lp:Landroid/view/ViewGroup$LayoutParams;
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v20, v0

    if-nez v20, :cond_a

    const/high16 v20, -0x8000

    move/from16 v0, v20

    if-ne v8, v0, :cond_a

    .line 582
    add-int v9, v13, v17

    .line 587
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Lcom/cyanogenmod/trebuchet/PagedView;->setMeasuredDimension(II)V

    .line 592
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidateCachedOffsets()V

    .line 594
    if-lez v3, :cond_9

    .line 599
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    .line 604
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v15

    .line 605
    .local v15, offset:I
    sub-int v20, v19, v15

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredWidth()I

    move-result v21

    sub-int v20, v20, v21

    move/from16 v0, v20

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 607
    .local v16, spacing:I
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->setPageSpacing(I)V

    .line 611
    .end local v15           #offset:I
    .end local v16           #spacing:I
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicatorPosition()V

    .line 613
    if-lez v3, :cond_b

    .line 614
    add-int/lit8 v20, v3, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v20

    add-int/lit8 v21, v3, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v21

    sub-int v20, v20, v21

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    goto/16 :goto_0

    .line 583
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v20, v0

    if-eqz v20, :cond_8

    const/high16 v20, -0x8000

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_8

    .line 584
    add-int v19, v14, v10

    goto :goto_4

    .line 616
    :cond_b
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    goto/16 :goto_0
.end method

.method protected onPageBeginMoving()V
    .locals 0

    .prologue
    .line 404
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 0

    .prologue
    .line 408
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 4
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 985
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 986
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    .line 990
    .local v0, focusablePage:I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    .line 991
    .local v1, v:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 992
    invoke-virtual {v1, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v2

    .line 994
    :goto_1
    return v2

    .line 988
    .end local v0           #focusablePage:I
    .end local v1           #v:Landroid/view/View;
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .restart local v0       #focusablePage:I
    goto :goto_0

    .line 994
    .restart local v1       #v:Landroid/view/View;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 22
    .parameter "ev"

    .prologue
    .line 1365
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v19

    if-gtz v19, :cond_0

    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v19

    .line 1546
    :goto_0
    return v19

    .line 1367
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/PagedView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 1369
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    .line 1371
    .local v3, action:I
    and-int/lit16 v0, v3, 0xff

    move/from16 v19, v0

    packed-switch v19, :pswitch_data_0

    .line 1546
    :cond_1
    :goto_1
    :pswitch_0
    const/16 v19, 0x1

    goto :goto_0

    .line 1377
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/Scroller;->isFinished()Z

    move-result v19

    if-nez v19, :cond_2

    .line 1378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1382
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionX:F

    .line 1383
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionY:F

    .line 1384
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    .line 1385
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    .line 1386
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    .line 1387
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    .line 1388
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1389
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_1

    .line 1390
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->pageBeginMoving()V

    goto :goto_1

    .line 1395
    :pswitch_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_8

    .line 1397
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v12

    .line 1398
    .local v12, pointerIndex:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/view/MotionEvent;->getX(I)F

    move-result v17

    .line 1399
    .local v17, x:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    move/from16 v20, v0

    add-float v19, v19, v20

    sub-float v5, v19, v17

    .line 1400
    .local v5, deltaX:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/view/MotionEvent;->getY(I)F

    move-result v18

    .line 1401
    .local v18, y:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    move/from16 v20, v0

    add-float v19, v19, v20

    sub-float v6, v19, v18

    .line 1403
    .local v6, deltaY:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    .line 1404
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    move/from16 v19, v0

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    .line 1409
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_3

    move/from16 v19, v5

    :goto_2
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(F)F

    move-result v19

    const/high16 v20, 0x3f80

    cmpl-float v19, v19, v20

    if-ltz v19, :cond_7

    .line 1410
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_5

    .line 1411
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchX:F

    move/from16 v19, v0

    add-float v19, v19, v5

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchX:F

    .line 1412
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v19

    move-wide/from16 v0, v19

    long-to-float v0, v0

    move/from16 v19, v0

    const v20, 0x4e6e6b28

    div-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mSmoothingTime:F

    .line 1413
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferScrollUpdate:Z

    move/from16 v19, v0

    if-nez v19, :cond_4

    .line 1414
    float-to-int v0, v5

    move/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollBy(II)V

    .line 1419
    :goto_3
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    .line 1420
    float-to-int v0, v5

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, v5, v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    goto/16 :goto_1

    :cond_3
    move/from16 v19, v6

    .line 1409
    goto :goto_2

    .line 1417
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    goto :goto_3

    .line 1422
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchY:F

    move/from16 v19, v0

    add-float v19, v19, v6

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchY:F

    .line 1423
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v19

    move-wide/from16 v0, v19

    long-to-float v0, v0

    move/from16 v19, v0

    const v20, 0x4e6e6b28

    div-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mSmoothingTime:F

    .line 1424
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferScrollUpdate:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    .line 1425
    const/16 v19, 0x0

    float-to-int v0, v6

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollBy(II)V

    .line 1430
    :goto_4
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    .line 1431
    float-to-int v0, v6

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, v6, v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    goto/16 :goto_1

    .line 1428
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    goto :goto_4

    .line 1434
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->awakenScrollBars()Z

    goto/16 :goto_1

    .line 1437
    .end local v5           #deltaX:F
    .end local v6           #deltaY:F
    .end local v12           #pointerIndex:I
    .end local v17           #x:F
    .end local v18           #y:F
    :cond_8
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 1442
    :pswitch_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_22

    .line 1443
    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1444
    .local v4, activePointerId:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v12

    .line 1445
    .restart local v12       #pointerIndex:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/view/MotionEvent;->getX(I)F

    move-result v17

    .line 1446
    .restart local v17       #x:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/view/MotionEvent;->getY(I)F

    move-result v18

    .line 1447
    .restart local v18       #y:F
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1448
    .local v14, velocityTracker:Landroid/view/VelocityTracker;
    const/16 v19, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaximumVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 1449
    invoke-virtual {v14, v4}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v19

    move/from16 v0, v19

    float-to-int v15, v0

    .line 1450
    .local v15, velocityX:I
    invoke-virtual {v14, v4}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v16, v0

    .line 1451
    .local v16, velocityY:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionX:F

    move/from16 v19, v0

    sub-float v19, v17, v19

    move/from16 v0, v19

    float-to-int v5, v0

    .line 1452
    .local v5, deltaX:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mDownMotionY:F

    move/from16 v19, v0

    sub-float v19, v18, v19

    move/from16 v0, v19

    float-to-int v6, v0

    .line 1453
    .local v6, deltaY:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getScaledMeasuredWidth(Landroid/view/View;)I

    move-result v11

    .line 1454
    .local v11, pageWidth:I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_c

    move/from16 v19, v5

    :goto_5
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    int-to-float v0, v11

    move/from16 v20, v0

    const v21, 0x3ecccccd

    mul-float v20, v20, v21

    cmpl-float v19, v19, v20

    if-lez v19, :cond_d

    const/4 v9, 0x1

    .line 1457
    .local v9, isSignificantMove:Z
    :goto_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionX:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionXRemainder:F

    move/from16 v21, v0

    add-float v20, v20, v21

    sub-float v20, v20, v17

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    .line 1458
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionY:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mLastMotionYRemainder:F

    move/from16 v21, v0

    add-float v20, v20, v21

    sub-float v20, v20, v18

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v19, v20

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionY:F

    .line 1460
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTotalMotionX:F

    move/from16 v19, v0

    const/high16 v20, 0x41c8

    cmpl-float v19, v19, v20

    if-lez v19, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_e

    move/from16 v19, v15

    :goto_7
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mFlingThresholdVelocity:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_f

    const/4 v8, 0x1

    .line 1466
    .local v8, isFling:Z
    :goto_8
    const/4 v13, 0x0

    .line 1467
    .local v13, returnToOriginalPage:Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_10

    move/from16 v19, v5

    :goto_9
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    int-to-float v0, v11

    move/from16 v20, v0

    const v21, 0x3ea8f5c3

    mul-float v20, v20, v21

    cmpl-float v19, v19, v20

    if-lez v19, :cond_9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_11

    int-to-float v0, v15

    move/from16 v19, v0

    :goto_a
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->signum(F)F

    move-result v20

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_12

    int-to-float v0, v5

    move/from16 v19, v0

    :goto_b
    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->signum(F)F

    move-result v19

    cmpl-float v19, v20, v19

    if-eqz v19, :cond_9

    if-eqz v8, :cond_9

    .line 1470
    const/4 v13, 0x1

    .line 1477
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    move/from16 v19, v0

    if-nez v19, :cond_19

    .line 1478
    if-eqz v9, :cond_a

    if-lez v5, :cond_a

    if-eqz v8, :cond_b

    :cond_a
    if-eqz v8, :cond_14

    if-lez v15, :cond_14

    :cond_b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    if-lez v19, :cond_14

    .line 1480
    if-eqz v13, :cond_13

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 1481
    .local v7, finalPage:I
    :goto_c
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v15}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPageWithVelocity(II)V

    .line 1527
    .end local v4           #activePointerId:I
    .end local v5           #deltaX:I
    .end local v6           #deltaY:I
    .end local v7           #finalPage:I
    .end local v8           #isFling:Z
    .end local v9           #isSignificantMove:Z
    .end local v11           #pageWidth:I
    .end local v12           #pointerIndex:I
    .end local v13           #returnToOriginalPage:Z
    .end local v14           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v15           #velocityX:I
    .end local v16           #velocityY:I
    .end local v17           #x:F
    .end local v18           #y:F
    :goto_d
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1528
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1529
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .restart local v4       #activePointerId:I
    .restart local v5       #deltaX:I
    .restart local v6       #deltaY:I
    .restart local v11       #pageWidth:I
    .restart local v12       #pointerIndex:I
    .restart local v14       #velocityTracker:Landroid/view/VelocityTracker;
    .restart local v15       #velocityX:I
    .restart local v16       #velocityY:I
    .restart local v17       #x:F
    .restart local v18       #y:F
    :cond_c
    move/from16 v19, v6

    .line 1454
    goto/16 :goto_5

    :cond_d
    const/4 v9, 0x0

    goto/16 :goto_6

    .restart local v9       #isSignificantMove:Z
    :cond_e
    move/from16 v19, v16

    .line 1460
    goto/16 :goto_7

    :cond_f
    const/4 v8, 0x0

    goto/16 :goto_8

    .restart local v8       #isFling:Z
    .restart local v13       #returnToOriginalPage:Z
    :cond_10
    move/from16 v19, v6

    .line 1467
    goto/16 :goto_9

    :cond_11
    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v19, v0

    goto :goto_a

    :cond_12
    int-to-float v0, v6

    move/from16 v19, v0

    goto :goto_b

    .line 1480
    :cond_13
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, -0x1

    goto :goto_c

    .line 1482
    :cond_14
    if-eqz v9, :cond_15

    if-gez v5, :cond_15

    if-eqz v8, :cond_16

    :cond_15
    if-eqz v8, :cond_18

    if-gez v15, :cond_18

    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_18

    .line 1485
    if-eqz v13, :cond_17

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 1486
    .restart local v7       #finalPage:I
    :goto_e
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v15}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPageWithVelocity(II)V

    goto :goto_d

    .line 1485
    .end local v7           #finalPage:I
    :cond_17
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, 0x1

    goto :goto_e

    .line 1488
    :cond_18
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToDestination()V

    goto :goto_d

    .line 1491
    :cond_19
    if-eqz v9, :cond_1a

    if-lez v6, :cond_1a

    if-eqz v8, :cond_1b

    :cond_1a
    if-eqz v8, :cond_1d

    if-lez v16, :cond_1d

    :cond_1b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    if-lez v19, :cond_1d

    .line 1493
    if-eqz v13, :cond_1c

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 1494
    .restart local v7       #finalPage:I
    :goto_f
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v7, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPageWithVelocity(II)V

    goto/16 :goto_d

    .line 1493
    .end local v7           #finalPage:I
    :cond_1c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, -0x1

    goto :goto_f

    .line 1495
    :cond_1d
    if-eqz v9, :cond_1e

    if-gez v6, :cond_1e

    if-eqz v8, :cond_1f

    :cond_1e
    if-eqz v8, :cond_21

    if-gez v16, :cond_21

    :cond_1f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_21

    .line 1498
    if-eqz v13, :cond_20

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 1499
    .restart local v7       #finalPage:I
    :goto_10
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v7, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPageWithVelocity(II)V

    goto/16 :goto_d

    .line 1498
    .end local v7           #finalPage:I
    :cond_20
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    add-int/lit8 v7, v19, 0x1

    goto :goto_10

    .line 1501
    :cond_21
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToDestination()V

    goto/16 :goto_d

    .line 1504
    .end local v4           #activePointerId:I
    .end local v5           #deltaX:I
    .end local v6           #deltaY:I
    .end local v8           #isFling:Z
    .end local v9           #isSignificantMove:Z
    .end local v11           #pageWidth:I
    .end local v12           #pointerIndex:I
    .end local v13           #returnToOriginalPage:Z
    .end local v14           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v15           #velocityX:I
    .end local v16           #velocityY:I
    .end local v17           #x:F
    .end local v18           #y:F
    :cond_22
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_24

    .line 1508
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 1509
    .local v10, nextPage:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v10, v0, :cond_23

    .line 1510
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    goto/16 :goto_d

    .line 1512
    :cond_23
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToDestination()V

    goto/16 :goto_d

    .line 1514
    .end local v10           #nextPage:I
    :cond_24
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_26

    .line 1518
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 1519
    .restart local v10       #nextPage:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v10, v0, :cond_25

    .line 1520
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    goto/16 :goto_d

    .line 1522
    :cond_25
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToDestination()V

    goto/16 :goto_d

    .line 1525
    .end local v10           #nextPage:I
    :cond_26
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onUnhandledTap(Landroid/view/MotionEvent;)V

    goto/16 :goto_d

    .line 1533
    :pswitch_4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_27

    .line 1534
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToDestination()V

    .line 1536
    :cond_27
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchState:I

    .line 1537
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedView;->mActivePointerId:I

    .line 1538
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedView;->releaseVelocityTracker()V

    goto/16 :goto_1

    .line 1542
    :pswitch_5
    invoke-direct/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 1371
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
    .line 1612
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 1351
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->dampedOverScroll(F)V

    .line 1352
    return-void
.end method

.method protected pageBeginMoving()V
    .locals 1

    .prologue
    .line 385
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    if-nez v0, :cond_0

    .line 386
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    .line 387
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onPageBeginMoving()V

    .line 389
    :cond_0
    return-void
.end method

.method protected pageEndMoving()V
    .locals 1

    .prologue
    .line 392
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    if-eqz v0, :cond_0

    .line 393
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsPageMoving:Z

    .line 394
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onPageEndMoving()V

    .line 396
    :cond_0
    return-void
.end method

.method pauseScrolling()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 345
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 346
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 347
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollingPaused:Z

    .line 348
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 3
    .parameter "action"
    .parameter "arguments"

    .prologue
    const/4 v0, 0x1

    .line 2230
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2247
    :goto_0
    return v0

    .line 2233
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 2247
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 2235
    :sswitch_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    .line 2236
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollRight()V

    goto :goto_0

    .line 2241
    :sswitch_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    if-lez v1, :cond_1

    .line 2242
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollLeft()V

    goto :goto_0

    .line 2233
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
    .line 1616
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 1617
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->indexToPage(I)I

    move-result v0

    .line 1618
    .local v0, page:I
    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isInTouchMode()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1619
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 1621
    :cond_0
    return-void
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 2
    .parameter "child"
    .parameter "rectangle"
    .parameter "immediate"

    .prologue
    .line 974
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->indexToPage(I)I

    move-result v0

    .line 975
    .local v0, page:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-ne v0, v1, :cond_0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1

    .line 976
    :cond_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 977
    const/4 v1, 0x1

    .line 979
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
    .line 1062
    if-eqz p1, :cond_0

    .line 1065
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 1066
    .local v0, currentPage:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 1068
    .end local v0           #currentPage:Landroid/view/View;
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 1069
    return-void
.end method

.method resumeScrolling()V
    .locals 1

    .prologue
    .line 355
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollingPaused:Z

    .line 356
    return-void
.end method

.method protected screenScrolled(I)V
    .locals 7
    .parameter "screenScroll"

    .prologue
    .line 755
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 756
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicator()V

    .line 758
    :cond_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    if-ltz v5, :cond_1

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    iget v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    if-le v5, v6, :cond_3

    :cond_1
    const/4 v3, 0x1

    .line 760
    .local v3, isInOverscroll:Z
    :goto_0
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_5

    if-nez v3, :cond_5

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleFadeInAdjacentScreens:Z

    if-nez v5, :cond_5

    .line 761
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 762
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 763
    .local v1, child:Landroid/view/View;
    if-eqz v1, :cond_2

    .line 764
    invoke-virtual {p0, p1, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 765
    .local v4, scrollProgress:F
    const/high16 v5, 0x3f80

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sub-float v0, v5, v6

    .line 766
    .local v0, alpha:F
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 761
    .end local v0           #alpha:F
    .end local v4           #scrollProgress:F
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 758
    .end local v1           #child:Landroid/view/View;
    .end local v2           #i:I
    .end local v3           #isInOverscroll:Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_0

    .line 769
    .restart local v2       #i:I
    .restart local v3       #isInOverscroll:Z
    :cond_4
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    .line 771
    .end local v2           #i:I
    :cond_5
    return-void
.end method

.method public scrollBy(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 426
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollX:I

    :goto_0
    add-int v1, v0, p1

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollY:I

    :goto_1
    add-int/2addr v0, p2

    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 427
    return-void

    .line 426
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_1
.end method

.method public scrollLeft()V
    .locals 1

    .prologue
    .line 1830
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1831
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 1835
    :cond_0
    :goto_0
    return-void

    .line 1833
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    goto :goto_0
.end method

.method public scrollRight()V
    .locals 2

    .prologue
    .line 1838
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1839
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 1843
    :cond_0
    :goto_0
    return-void

    .line 1841
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    goto :goto_0
.end method

.method public scrollTo(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v1, 0x0

    .line 431
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollX:I

    .line 432
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollY:I

    .line 434
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_3

    .line 435
    if-gez p1, :cond_1

    .line 436
    invoke-super {p0, v1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 437
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 438
    int-to-float v0, p1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->overScroll(F)V

    .line 465
    :cond_0
    :goto_0
    int-to-float v0, p1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchX:F

    .line 466
    int-to-float v0, p2

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mTouchY:F

    .line 467
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    long-to-float v0, v0

    const v1, 0x4e6e6b28

    div-float/2addr v0, v1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mSmoothingTime:F

    .line 468
    return-void

    .line 440
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    if-le p1, v0, :cond_2

    .line 441
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    invoke-super {p0, v0, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 442
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 443
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollX:I

    sub-int v0, p1, v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->overScroll(F)V

    goto :goto_0

    .line 446
    :cond_2
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollX:I

    .line 447
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_0

    .line 450
    :cond_3
    if-gez p2, :cond_4

    .line 451
    invoke-super {p0, p1, v1}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 452
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 453
    int-to-float v0, p2

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->overScroll(F)V

    goto :goto_0

    .line 455
    :cond_4
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    if-le p2, v0, :cond_5

    .line 456
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    invoke-super {p0, p1, v0}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 457
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowOverScroll:Z

    if-eqz v0, :cond_0

    .line 458
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMaxScrollY:I

    sub-int v0, p2, v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->overScroll(F)V

    goto :goto_0

    .line 461
    :cond_5
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mOverScrollY:I

    .line 462
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_0
.end method

.method protected scrollToNewPageWithoutMovingPages(I)V
    .locals 7
    .parameter "newCurrentPage"

    .prologue
    .line 621
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v5

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v6

    sub-int v2, v5, v6

    .line 622
    .local v2, newXY:I
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_0

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollX:I

    :goto_0
    sub-int v0, v2, v5

    .line 624
    .local v0, delta:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v4

    .line 625
    .local v4, pageCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v4, :cond_2

    .line 626
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    .line 627
    .local v3, page:Landroid/view/View;
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v5, :cond_1

    .line 628
    invoke-virtual {v3}, Landroid/view/View;->getX()F

    move-result v5

    int-to-float v6, v0

    add-float/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/view/View;->setX(F)V

    .line 625
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 622
    .end local v0           #delta:I
    .end local v1           #i:I
    .end local v3           #page:Landroid/view/View;
    .end local v4           #pageCount:I
    :cond_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollY:I

    goto :goto_0

    .line 630
    .restart local v0       #delta:I
    .restart local v1       #i:I
    .restart local v3       #page:Landroid/view/View;
    .restart local v4       #pageCount:I
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getY()F

    move-result v5

    int-to-float v6, v0

    add-float/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/view/View;->setY(F)V

    goto :goto_2

    .line 633
    .end local v3           #page:Landroid/view/View;
    :cond_2
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->setCurrentPage(I)V

    .line 634
    return-void
.end method

.method public setAllowLongPress(Z)V
    .locals 0
    .parameter "allowLongPress"

    .prologue
    .line 1871
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mAllowLongPress:Z

    .line 1872
    return-void
.end method

.method setCurrentPage(I)V
    .locals 2
    .parameter "currentPage"

    .prologue
    .line 361
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 362
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 366
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 376
    :goto_0
    return-void

    .line 371
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    .line 372
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateCurrentPageScroll()V

    .line 373
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicator()V

    .line 374
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->notifyPageSwitchListener()V

    .line 375
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    goto :goto_0
.end method

.method protected setDataIsReady()V
    .locals 1

    .prologue
    .line 286
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mIsDataReady:Z

    .line 287
    return-void
.end method

.method public setLayoutScale(F)V
    .locals 11
    .parameter "childrenScale"

    .prologue
    const/high16 v8, 0x4000

    .line 640
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLayoutScale:F

    .line 641
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidateCachedOffsets()V

    .line 644
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v1

    .line 645
    .local v1, childCount:I
    new-array v2, v1, [F

    .line 646
    .local v2, childrenX:[F
    new-array v3, v1, [F

    .line 647
    .local v3, childrenY:[F
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v1, :cond_0

    .line 648
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 649
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v7

    aput v7, v2, v5

    .line 650
    invoke-virtual {v0}, Landroid/view/View;->getY()F

    move-result v7

    aput v7, v3, v5

    .line 647
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 653
    .end local v0           #child:Landroid/view/View;
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v7

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 654
    .local v6, widthSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v7

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 655
    .local v4, heightSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->requestLayout()V

    .line 656
    invoke-virtual {p0, v6, v4}, Lcom/cyanogenmod/trebuchet/PagedView;->measure(II)V

    .line 657
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getTop()I

    move-result v8

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getRight()I

    move-result v9

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getBottom()I

    move-result v10

    invoke-virtual {p0, v7, v8, v9, v10}, Lcom/cyanogenmod/trebuchet/PagedView;->layout(IIII)V

    .line 658
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_1

    .line 659
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 660
    .restart local v0       #child:Landroid/view/View;
    aget v7, v2, v5

    invoke-virtual {v0, v7}, Landroid/view/View;->setX(F)V

    .line 661
    aget v7, v3, v5

    invoke-virtual {v0, v7}, Landroid/view/View;->setY(F)V

    .line 658
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 666
    .end local v0           #child:Landroid/view/View;
    :cond_1
    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollToNewPageWithoutMovingPages(I)V

    .line 667
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 3
    .parameter "l"

    .prologue
    .line 417
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 418
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v0

    .line 419
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 420
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 419
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 422
    :cond_0
    return-void
.end method

.method public setPageSpacing(I)V
    .locals 0
    .parameter "pageSpacing"

    .prologue
    .line 670
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSpacing:I

    .line 671
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidateCachedOffsets()V

    .line 672
    return-void
.end method

.method public setPageSwitchListener(Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;)V
    .locals 3
    .parameter "pageSwitchListener"

    .prologue
    .line 275
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

    .line 276
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mPageSwitchListener:Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-interface {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView$PageSwitchListener;->onPageSwitch(Landroid/view/View;I)V

    .line 279
    :cond_0
    return-void
.end method

.method protected shouldDrawChild(Landroid/view/View;)Z
    .locals 2
    .parameter "child"

    .prologue
    .line 927
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

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
    .line 2199
    return-void
.end method

.method protected showScrollingIndicator(Z)V
    .locals 1
    .parameter "immediately"

    .prologue
    .line 2042
    const/16 v0, 0x96

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->showScrollingIndicator(ZI)V

    .line 2043
    return-void
.end method

.method protected showScrollingIndicator(ZI)V
    .locals 5
    .parameter "immediately"
    .parameter "duration"

    .prologue
    const/high16 v4, 0x3f80

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 2046
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicator:Z

    .line 2047
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicatorImmediately:Z

    .line 2048
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v0

    if-gt v0, v2, :cond_1

    .line 2067
    :cond_0
    :goto_0
    return-void

    .line 2049
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->isScrollingIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2050
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mHandleScrollIndicator:Z

    if-nez v0, :cond_0

    .line 2052
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mShouldShowScrollIndicator:Z

    .line 2053
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getScrollingIndicator()Landroid/view/View;

    .line 2054
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2056
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateScrollingIndicatorPosition()V

    .line 2057
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 2058
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->cancelScrollingIndicatorAnimations()V

    .line 2059
    if-nez p1, :cond_2

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollingPaused:Z

    if-eqz v0, :cond_3

    .line 2060
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    .line 2062
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicator:Landroid/view/View;

    const-string v1, "alpha"

    new-array v2, v2, [F

    aput v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    .line 2063
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2064
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScrollIndicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0
.end method

.method protected snapToDestination()V
    .locals 2

    .prologue
    .line 1681
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageNearestToCenterOfScreen()I

    move-result v0

    const/16 v1, 0x190

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(II)V

    .line 1682
    return-void
.end method

.method protected snapToPage(I)V
    .locals 1
    .parameter "whichPage"

    .prologue
    .line 1781
    const/16 v0, 0x190

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(II)V

    .line 1782
    return-void
.end method

.method protected snapToPage(II)V
    .locals 5
    .parameter "whichPage"
    .parameter "duration"

    .prologue
    .line 1785
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1790
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 1791
    .local v1, newXY:I
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_0

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollX:I

    .line 1792
    .local v2, sXY:I
    :goto_0
    sub-int v0, v1, v2

    .line 1793
    .local v0, delta:I
    invoke-virtual {p0, p1, v0, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(III)V

    .line 1794
    return-void

    .line 1791
    .end local v0           #delta:I
    .end local v2           #sXY:I
    :cond_0
    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollY:I

    goto :goto_0
.end method

.method protected snapToPage(III)V
    .locals 8
    .parameter "whichPage"
    .parameter "delta"
    .parameter "duration"

    .prologue
    const/4 v2, 0x0

    .line 1797
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    .line 1799
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getFocusedChild()Landroid/view/View;

    move-result-object v7

    .line 1800
    .local v7, focusedChild:Landroid/view/View;
    if-eqz v7, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    if-ne v7, v0, :cond_0

    .line 1802
    invoke-virtual {v7}, Landroid/view/View;->clearFocus()V

    .line 1805
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->pageBeginMoving()V

    .line 1806
    invoke-virtual {p0, p3}, Lcom/cyanogenmod/trebuchet/PagedView;->awakenScrollBars(I)Z

    .line 1807
    if-nez p3, :cond_1

    .line 1808
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p3

    .line 1811
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1812
    :cond_2
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v0, :cond_3

    .line 1813
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollX:I

    move v3, p2

    move v4, v2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1820
    :goto_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferScrollUpdate:Z

    if-eqz v0, :cond_4

    .line 1821
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mNextPage:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->loadAssociatedPages(I)V

    .line 1825
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->notifyPageSwitchListener()V

    .line 1826
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->invalidate()V

    .line 1827
    return-void

    .line 1815
    :cond_3
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollY:I

    move v4, v2

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    goto :goto_0

    .line 1823
    :cond_4
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mDeferLoadAssociatedPagesUntilScrollCompletes:Z

    goto :goto_1
.end method

.method protected snapToPageWithVelocity(II)V
    .locals 9
    .parameter "whichPage"
    .parameter "velocity"

    .prologue
    const/high16 v8, 0x3f80

    .line 1743
    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-static {p1, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1744
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v6, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredWidth()I

    move-result v6

    :goto_0
    div-int/lit8 v4, v6, 0x2

    .line 1749
    .local v4, halfScreenSize:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v6

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v7

    sub-int v5, v6, v7

    .line 1750
    .local v5, newXY:I
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v6, :cond_1

    iget v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollX:I

    :goto_1
    sub-int v0, v5, v6

    .line 1751
    .local v0, delta:I
    const/4 v3, 0x0

    .line 1753
    .local v3, duration:I
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v6

    iget v7, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinFlingVelocity:I

    if-ge v6, v7, :cond_2

    .line 1756
    const/16 v6, 0x190

    invoke-virtual {p0, p1, v6}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(II)V

    .line 1778
    :goto_2
    return-void

    .line 1744
    .end local v0           #delta:I
    .end local v3           #duration:I
    .end local v4           #halfScreenSize:I
    .end local v5           #newXY:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getMeasuredHeight()I

    move-result v6

    goto :goto_0

    .line 1750
    .restart local v4       #halfScreenSize:I
    .restart local v5       #newXY:I
    :cond_1
    iget v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mUnboundedScrollY:I

    goto :goto_1

    .line 1764
    .restart local v0       #delta:I
    .restart local v3       #duration:I
    :cond_2
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v8

    mul-int/lit8 v7, v4, 0x2

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-static {v8, v6}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1765
    .local v2, distanceRatio:F
    int-to-float v6, v4

    int-to-float v7, v4

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->distanceInfluenceForSnapDuration(F)F

    move-result v8

    mul-float/2addr v7, v8

    add-float v1, v6, v7

    .line 1768
    .local v1, distance:F
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 1769
    iget v6, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mMinSnapVelocity:I

    invoke-static {v6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 1774
    const/high16 v6, 0x447a

    int-to-float v7, p2

    div-float v7, v1, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    mul-int/lit8 v3, v6, 0x4

    .line 1775
    const/16 v6, 0x226

    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1777
    invoke-virtual {p0, p1, v0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(III)V

    goto :goto_2
.end method

.method public abstract syncPageItems(IZ)V
.end method

.method public abstract syncPages()V
.end method

.method protected updateCurrentPageScroll()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 323
    const/4 v0, 0x0

    .line 324
    .local v0, newScrollPos:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    if-ltz v3, :cond_0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageCount()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 325
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildOffset(I)I

    move-result v1

    .line 326
    .local v1, offset:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/PagedView;->getRelativeChildOffset(I)I

    move-result v2

    .line 327
    .local v2, relOffset:I
    sub-int v0, v1, v2

    .line 329
    .end local v1           #offset:I
    .end local v2           #relOffset:I
    :cond_0
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mVertical:Z

    if-nez v3, :cond_1

    .line 330
    invoke-virtual {p0, v0, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 331
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 336
    :goto_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 337
    return-void

    .line 333
    :cond_1
    invoke-virtual {p0, v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollTo(II)V

    .line 334
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    goto :goto_0
.end method
