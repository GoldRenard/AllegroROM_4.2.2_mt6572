.class public Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;
.super Landroid/view/ViewGroup;
.source "SlidingChallengeLayout.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;,
        Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;
    }
.end annotation


# static fields
.field private static final CHALLENGE_FADE_IN_DURATION:I = 0xa0

.field private static final CHALLENGE_FADE_OUT_DURATION:I = 0x64

.field private static final DEBUG:Z = false

.field private static final DEBUG_PLUG_IN:Z = false

.field private static final DRAG_HANDLE_CLOSED_ABOVE:I = 0x8

.field private static final DRAG_HANDLE_CLOSED_BELOW:I = 0x0

.field private static final DRAG_HANDLE_OPEN_ABOVE:I = 0x8

.field private static final DRAG_HANDLE_OPEN_BELOW:I = 0x0

.field private static final FULL_SCREEN_CHALLENGE_HEIGHT:I = 0x190

.field static final HANDLE_ALPHA:Landroid/util/Property; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final HANDLE_ANIMATE_DURATION:I = 0xfa

.field private static final INVALID_POINTER:I = -0x1

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_FADING:I = 0x3

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "SlidingChallengeLayout"

.field private static final sHandleFadeInterpolator:Landroid/view/animation/Interpolator;

.field private static final sMotionInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mActivePointerId:I

.field private mBlockDrag:Z

.field private mBlockDrag_qj:Z

.field private mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

.field private mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

.field private mChallengeBottomBound:I

.field private mChallengeInteractiveExternal:Z

.field private mChallengeInteractiveInternal:Z

.field private mChallengeOffset:F

.field private mChallengeShowing:Z

.field private mChallengeShowingTargetState:Z

.field private mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

.field private mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mDragHandleClosedAbove:I

.field private mDragHandleClosedBelow:I

.field private mDragHandleEdgeSlop:I

.field private mDragHandleOpenAbove:I

.field private mDragHandleOpenBelow:I

.field private mDragging:Z

.field private mEdgeCaptured:Z

.field private final mEndScrollRunnable:Ljava/lang/Runnable;

.field private final mExpandChallengeClickListener:Landroid/view/View$OnClickListener;

.field private mExpandChallengeView:Landroid/view/View;

.field private mFader:Landroid/animation/ObjectAnimator;

.field mFrameAlpha:F

.field private mFrameAnimation:Landroid/animation/ObjectAnimator;

.field mFrameAnimationTarget:F

.field private mGestureStartChallengeBottom:I

.field private mGestureStartX:F

.field private mGestureStartY:F

.field mHandleAlpha:F

.field private mHandleAnimation:Landroid/animation/ObjectAnimator;

.field private mHasGlowpad:Z

.field private mHasLayout:Z

.field private mIsBouncing:Z

.field private mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

.field private mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

.field private mKeyguardLayerBackgroundView:Landroid/view/View;

.field private mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

.field private mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

.field private mKeyguardLayerForegroundView:Landroid/view/View;

.field private mKeyguardSecurityHeight:I

.field private mKeyguardSelectorView:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

.field private mLQLockView:Landroid/view/View;

.field private mMaxVelocity:I

.field private mMinVelocity:I

.field private final mScrimClickListener:Landroid/view/View$OnClickListener;

.field private mScrimView:Landroid/view/View;

.field private mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

.field private mScrollState:I

.field private final mScroller:Landroid/widget/Scroller;

.field private mShowKeyguardLayer:Z

.field private mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

.field private mTouchSlop:I

.field private mTouchSlopSquare:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mWasChallengeShowing:Z

.field private mWidgetsView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 182
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$1;

    const-string v1, "handleAlpha"

    invoke-direct {v0, v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->HANDLE_ALPHA:Landroid/util/Property;

    .line 199
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$2;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$2;-><init>()V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->sMotionInterpolator:Landroid/view/animation/Interpolator;

    .line 206
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$3;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$3;-><init>()V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->sHandleFadeInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 275
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 276
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 279
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 280
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/high16 v5, 0x3f00

    const/4 v4, 0x1

    .line 283
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 106
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    .line 107
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    .line 108
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSelectorView:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    .line 114
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag_qj:Z

    .line 115
    iput v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSecurityHeight:I

    .line 121
    const/high16 v3, 0x3f80

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    .line 122
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    .line 123
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowingTargetState:Z

    .line 124
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWasChallengeShowing:Z

    .line 125
    iput-boolean v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    .line 144
    const/4 v3, -0x1

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    .line 172
    const/4 v3, 0x1

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFrameAnimationTarget:F

    .line 179
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveExternal:Z

    .line 180
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    .line 212
    new-instance v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$4;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$4;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 218
    new-instance v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$5;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$5;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimClickListener:Landroid/view/View$OnClickListener;

    .line 225
    new-instance v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$6;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$6;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeClickListener:Landroid/view/View$OnClickListener;

    .line 1430
    new-instance v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$10;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$10;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    .line 285
    new-instance v3, Landroid/widget/Scroller;

    sget-object v4, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->sMotionInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v3, p1, v4}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    .line 287
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 288
    .local v2, vc:Landroid/view/ViewConfiguration;
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mMinVelocity:I

    .line 289
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mMaxVelocity:I

    .line 291
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 292
    .local v1, res:Landroid/content/res/Resources;
    const v3, 0x1050074

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleEdgeSlop:I

    .line 294
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mTouchSlop:I

    .line 295
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mTouchSlop:I

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mTouchSlop:I

    mul-int/2addr v3, v4

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mTouchSlopSquare:I

    .line 297
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 298
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v0, v3, Landroid/util/DisplayMetrics;->density:F

    .line 301
    .local v0, density:F
    const/high16 v3, 0x4100

    mul-float/2addr v3, v0

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleClosedAbove:I

    .line 302
    mul-float v3, v7, v0

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleClosedBelow:I

    .line 303
    const/high16 v3, 0x4100

    mul-float/2addr v3, v0

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleOpenAbove:I

    .line 304
    mul-float v3, v7, v0

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleOpenBelow:I

    .line 307
    const v3, 0x1050069

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    .line 309
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setWillNotDraw(Z)V

    .line 310
    const/16 v3, 0x100

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setSystemUiVisibility(I)V

    .line 311
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->onFadeStart(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->onFadeEnd(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayer:Z

    return v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->updateKeyguardLayerView(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private cancelTransitionsInProgress()V
    .locals 1

    .prologue
    .line 1165
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1166
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1167
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->completeChallengeScroll()V

    .line 1169
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    .line 1170
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1172
    :cond_1
    return-void
.end method

.method private crossedDragHandle(FFF)Z
    .locals 6
    .parameter "x"
    .parameter "y"
    .parameter "initialY"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 905
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getTop()I

    move-result v0

    .line 906
    .local v0, challengeTop:I
    const/4 v5, 0x0

    cmpl-float v5, p1, v5

    if-ltz v5, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getWidth()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v5, p1, v5

    if-gez v5, :cond_0

    move v1, v3

    .line 909
    .local v1, horizOk:Z
    :goto_0
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v5, :cond_2

    .line 910
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getDragHandleSizeAbove()I

    move-result v5

    sub-int v5, v0, v5

    int-to-float v5, v5

    cmpg-float v5, p3, v5

    if-gez v5, :cond_1

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getDragHandleSizeBelow()I

    move-result v5

    add-int/2addr v5, v0

    int-to-float v5, v5

    cmpl-float v5, p2, v5

    if-lez v5, :cond_1

    move v2, v3

    .line 916
    .local v2, vertOk:Z
    :goto_1
    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    :goto_2
    return v3

    .end local v1           #horizOk:Z
    .end local v2           #vertOk:Z
    :cond_0
    move v1, v4

    .line 906
    goto :goto_0

    .restart local v1       #horizOk:Z
    :cond_1
    move v2, v4

    .line 910
    goto :goto_1

    .line 913
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getDragHandleSizeBelow()I

    move-result v5

    add-int/2addr v5, v0

    int-to-float v5, v5

    cmpl-float v5, p3, v5

    if-lez v5, :cond_3

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getDragHandleSizeAbove()I

    move-result v5

    sub-int v5, v0, v5

    int-to-float v5, v5

    cmpg-float v5, p2, v5

    if-gez v5, :cond_3

    move v2, v3

    .restart local v2       #vertOk:Z
    :goto_3
    goto :goto_1

    .end local v2           #vertOk:Z
    :cond_3
    move v2, v4

    goto :goto_3

    .restart local v2       #vertOk:Z
    :cond_4
    move v3, v4

    .line 916
    goto :goto_2
.end method

.method private getChallengeAlpha()F
    .locals 3

    .prologue
    const/high16 v2, 0x3f80

    .line 611
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    sub-float v0, v1, v2

    .line 612
    .local v0, x:F
    mul-float v1, v0, v0

    mul-float/2addr v1, v0

    add-float/2addr v1, v2

    return v1
.end method

.method private getChallengeBottom()I
    .locals 1

    .prologue
    .line 1306
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 1308
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v0

    goto :goto_0
.end method

.method private getChallengeMargin(Z)I
    .locals 1
    .parameter "expanded"

    .prologue
    .line 607
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasGlowpad:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleEdgeSlop:I

    goto :goto_0
.end method

.method private getDragHandleSizeAbove()I
    .locals 1

    .prologue
    .line 881
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleOpenAbove:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleClosedAbove:I

    goto :goto_0
.end method

.method private getDragHandleSizeBelow()I
    .locals 1

    .prologue
    .line 884
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleOpenBelow:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleClosedBelow:I

    goto :goto_0
.end method

.method private getLayoutBottom()I
    .locals 4

    .prologue
    .line 1295
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v2, :cond_0

    const/4 v0, 0x0

    .line 1298
    .local v0, bottomMargin:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int v1, v2, v0

    .line 1299
    .local v1, layoutBottom:I
    return v1

    .line 1295
    .end local v0           #bottomMargin:I
    .end local v1           #layoutBottom:I
    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    iget v0, v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->bottomMargin:I

    goto :goto_0
.end method

.method private getMaxChallengeBottom()I
    .locals 4

    .prologue
    .line 1205
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    .line 1209
    :goto_0
    return v2

    .line 1206
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v1

    .line 1207
    .local v1, layoutBottom:I
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getMeasuredHeight()I

    move-result v0

    .line 1209
    .local v0, challengeHeight:I
    add-int v2, v1, v0

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    sub-int/2addr v2, v3

    goto :goto_0
.end method

.method private getMinChallengeBottom()I
    .locals 1

    .prologue
    .line 1213
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v0

    return v0
.end method

.method private isChallengeInteractionBlocked()Z
    .locals 1

    .prologue
    .line 722
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveExternal:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isEdgeSwipeBeginEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "ev"

    .prologue
    const/4 v1, 0x0

    .line 868
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eqz v2, :cond_1

    .line 873
    :cond_0
    :goto_0
    return v1

    .line 872
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 873
    .local v0, x:F
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleEdgeSlop:I

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-ltz v2, :cond_2

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragHandleEdgeSlop:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private isInChallengeView(FF)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 888
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isPointInView(FFLandroid/view/View;)Z

    move-result v0

    return v0
.end method

.method private isInDragHandle(FF)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 892
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isPointInView(FFLandroid/view/View;)Z

    move-result v0

    return v0
.end method

.method private isPointInView(FFLandroid/view/View;)Z
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "view"

    .prologue
    const/4 v0, 0x0

    .line 896
    if-nez p3, :cond_1

    .line 899
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_0

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, p2, v1

    if-ltz v1, :cond_0

    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, p1, v1

    if-gez v1, :cond_0

    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, p2, v1

    if-gez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private makeChildMeasureSpec(II)I
    .locals 3
    .parameter "maxSize"
    .parameter "childDimen"

    .prologue
    .line 922
    packed-switch p2, :pswitch_data_0

    .line 932
    const/high16 v0, 0x4000

    .line 933
    .local v0, mode:I
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 936
    .local v1, size:I
    :goto_0
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    return v2

    .line 924
    .end local v0           #mode:I
    .end local v1           #size:I
    :pswitch_0
    const/high16 v0, -0x8000

    .line 925
    .restart local v0       #mode:I
    move v1, p1

    .line 926
    .restart local v1       #size:I
    goto :goto_0

    .line 928
    .end local v0           #mode:I
    .end local v1           #size:I
    :pswitch_1
    const/high16 v0, 0x4000

    .line 929
    .restart local v0       #mode:I
    move v1, p1

    .line 930
    .restart local v1       #size:I
    goto :goto_0

    .line 922
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private moveChallengeTo(I)Z
    .locals 8
    .parameter "bottom"

    .prologue
    const/4 v3, 0x1

    .line 1259
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    if-nez v4, :cond_1

    .line 1260
    :cond_0
    const/4 v3, 0x0

    .line 1287
    :goto_0
    return v3

    .line 1263
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v1

    .line 1264
    .local v1, layoutBottom:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getHeight()I

    move-result v0

    .line 1266
    .local v0, challengeHeight:I
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getMinChallengeBottom()I

    move-result v4

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getMaxChallengeBottom()I

    move-result v5

    invoke-static {p1, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1269
    const/high16 v4, 0x3f80

    sub-int v5, p1, v1

    int-to-float v5, v5

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    sub-int v6, v0, v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    sub-float v2, v4, v5

    .line 1271
    .local v2, offset:F
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    .line 1272
    const/4 v4, 0x0

    cmpl-float v4, v2, v4

    if-lez v4, :cond_2

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-nez v4, :cond_2

    .line 1273
    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setChallengeShowing(Z)V

    .line 1277
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->updateKeyguardLayerPosition(I)V

    .line 1279
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getLeft()I

    move-result v5

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v6}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getHeight()I

    move-result v6

    sub-int v6, p1, v6

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getRight()I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->layout(IIII)V

    .line 1282
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChallengeAlpha()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setAlpha(F)V

    .line 1283
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    if-eqz v4, :cond_3

    .line 1284
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getTop()I

    move-result v5

    invoke-interface {v4, v2, v5}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;->onScrollPositionChanged(FI)V

    .line 1286
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->postInvalidateOnAnimation()V

    goto :goto_0
.end method

.method private onFadeEnd(Z)V
    .locals 3
    .parameter "show"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1229
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    .line 1230
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setChallengeShowing(Z)V

    .line 1232
    if-nez p1, :cond_0

    .line 1233
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getMaxChallengeBottom()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->moveChallengeTo(I)Z

    .line 1236
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 1237
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    .line 1238
    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrollState(I)V

    .line 1239
    return-void
.end method

.method private onFadeStart(Z)V
    .locals 3
    .parameter "show"

    .prologue
    .line 1218
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    .line 1219
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 1221
    if-eqz p1, :cond_0

    .line 1222
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getMinChallengeBottom()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->moveChallengeTo(I)Z

    .line 1225
    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrollState(I)V

    .line 1226
    return-void
.end method

.method private resetTouch()V
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 727
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 728
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    .line 729
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    .line 730
    return-void
.end method

.method private sendInitialListenerUpdates()V
    .locals 3

    .prologue
    .line 342
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    if-eqz v1, :cond_0

    .line 343
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getTop()I

    move-result v0

    .line 344
    .local v0, challengeTop:I
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    invoke-interface {v1, v2, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;->onScrollPositionChanged(FI)V

    .line 345
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollState:I

    invoke-interface {v1, v2}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;->onScrollStateChanged(I)V

    .line 347
    .end local v0           #challengeTop:I
    :cond_0
    return-void

    .line 343
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setChallengeShowing(Z)V
    .locals 3
    .parameter "showChallenge"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 502
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-ne v0, p1, :cond_1

    .line 531
    :cond_0
    :goto_0
    return-void

    .line 505
    :cond_1
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    .line 507
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v0, :cond_0

    .line 514
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v0, :cond_2

    .line 515
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 516
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setVisibility(I)V

    .line 517
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->requestAccessibilityFocus()Z

    .line 519
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mContext:Landroid/content/Context;

    const v2, 0x1040320

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->announceForAccessibility(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 523
    :cond_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 524
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setVisibility(I)V

    .line 525
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 526
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestAccessibilityFocus()Z

    .line 527
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mContext:Landroid/content/Context;

    const v2, 0x1040321

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->announceForAccessibility(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private showChallenge(I)V
    .locals 5
    .parameter "velocity"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1325
    const/4 v0, 0x0

    .line 1326
    .local v0, show:Z
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mMinVelocity:I

    if-le v3, v4, :cond_1

    .line 1327
    if-gez p1, :cond_0

    move v0, v1

    .line 1331
    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(ZI)V

    .line 1332
    return-void

    :cond_0
    move v0, v2

    .line 1327
    goto :goto_0

    .line 1329
    :cond_1
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    const/high16 v4, 0x3f00

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_2

    move v0, v1

    :goto_1
    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method private showChallenge(ZI)V
    .locals 3
    .parameter "show"
    .parameter "velocity"

    .prologue
    .line 1335
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v1, :cond_1

    .line 1336
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setChallengeShowing(Z)V

    .line 1346
    :cond_0
    :goto_0
    return-void

    .line 1340
    :cond_1
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    if-eqz v1, :cond_0

    .line 1341
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowingTargetState:Z

    .line 1342
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v0

    .line 1343
    .local v0, layoutBottom:I
    if-eqz p1, :cond_2

    .end local v0           #layoutBottom:I
    :goto_1
    invoke-virtual {p0, v0, p2}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->animateChallengeTo(II)V

    goto :goto_0

    .restart local v0       #layoutBottom:I
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getHeight()I

    move-result v1

    add-int/2addr v1, v0

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    sub-int v0, v1, v2

    goto :goto_1
.end method

.method private updateKeyguardLayerPosition(I)V
    .locals 9
    .parameter "bottom"

    .prologue
    const/high16 v8, 0x3f80

    .line 1538
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v4, :cond_0

    .line 1539
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getLeft()I

    move-result v5

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v6

    sub-int v6, p1, v6

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getRight()I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, p1}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 1543
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v2

    .line 1544
    .local v2, minBottom:I
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getMeasuredHeight()I

    move-result v5

    add-int v1, v4, v5

    .line 1545
    .local v1, maxBottom:I
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1546
    .local v3, realBottom:I
    sub-int v4, v3, v2

    int-to-float v4, v4

    mul-float/2addr v4, v8

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    sub-float v0, v8, v4

    .line 1547
    .local v0, alpha:F
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    if-eqz v4, :cond_0

    .line 1548
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1557
    .end local v0           #alpha:F
    .end local v1           #maxBottom:I
    .end local v2           #minBottom:I
    .end local v3           #realBottom:I
    :cond_0
    return-void
.end method

.method private updateKeyguardLayerView(Z)V
    .locals 12
    .parameter "show"

    .prologue
    .line 1476
    if-eqz p1, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    if-nez v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    if-nez v8, :cond_1

    .line 1478
    :try_start_0
    const-class v8, Lcom/mediatek/common/pluginmanager/IPluginManager;

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "create"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mContext:Landroid/content/Context;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-class v11, Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const/4 v11, 0x0

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Lcom/mediatek/common/MediatekClassFactory;->createInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/common/pluginmanager/IPluginManager;

    .line 1483
    .local v5, plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    invoke-interface {v5}, Lcom/mediatek/common/pluginmanager/IPluginManager;->getPluginCount()I

    move-result v7

    .line 1484
    .local v7, pluginCount:I
    if-eqz v7, :cond_2

    .line 1488
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v7, :cond_2

    .line 1489
    invoke-interface {v5, v1}, Lcom/mediatek/common/pluginmanager/IPluginManager;->getPlugin(I)Lcom/mediatek/common/pluginmanager/IPlugin;

    move-result-object v6

    .line 1490
    .local v6, plugin:Lcom/mediatek/common/pluginmanager/IPlugin;
    invoke-interface {v6}, Lcom/mediatek/common/pluginmanager/IPlugin;->createObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 1491
    .local v2, keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    invoke-interface {v2}, Lcom/mediatek/common/policy/IKeyguardLayer;->create()Landroid/view/View;

    move-result-object v3

    .line 1492
    .local v3, keyguardLayerView:Landroid/view/View;
    const-string v8, "SlidingChallengeLayout"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateDataUsageView create plugin keyguardLayer="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", this="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 1493
    invoke-interface {v2}, Lcom/mediatek/common/policy/IKeyguardLayer;->getKeyguardLayerInfo()Lcom/mediatek/common/policy/KeyguardLayerInfo;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 1494
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 1495
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    .line 1488
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1497
    :cond_0
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 1498
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1514
    .end local v1           #i:I
    .end local v2           #keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    .end local v3           #keyguardLayerView:Landroid/view/View;
    .end local v5           #plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    .end local v6           #plugin:Lcom/mediatek/common/pluginmanager/IPlugin;
    .end local v7           #pluginCount:I
    :catch_0
    move-exception v0

    .line 1515
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1518
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    :goto_2
    return-void

    .line 1503
    .restart local v5       #plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    .restart local v7       #pluginCount:I
    :cond_2
    :try_start_1
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    if-eqz v8, :cond_3

    .line 1504
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v4, v8, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(II)V

    .line 1505
    .local v4, layoutParam:Landroid/view/ViewGroup$LayoutParams;
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    invoke-virtual {v8, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1506
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 1509
    .end local v4           #layoutParam:Landroid/view/ViewGroup$LayoutParams;
    :cond_3
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    if-eqz v8, :cond_1

    .line 1510
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v4, v8, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(II)V

    .line 1511
    .restart local v4       #layoutParam:Landroid/view/ViewGroup$LayoutParams;
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    invoke-virtual {v8, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1512
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method


# virtual methods
.method animateChallengeTo(II)V
    .locals 13
    .parameter "y"
    .parameter "velocity"

    .prologue
    const/4 v11, 0x2

    const/4 v1, 0x0

    const/high16 v12, 0x3f80

    .line 463
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v0, :cond_0

    .line 499
    :goto_0
    return-void

    .line 468
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->cancelTransitionsInProgress()V

    .line 470
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    .line 471
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v3, 0x0

    invoke-virtual {v0, v11, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 472
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v2

    .line 473
    .local v2, sy:I
    sub-int v4, p1, v2

    .line 474
    .local v4, dy:I
    if-nez v4, :cond_1

    .line 475
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->completeChallengeScroll()V

    goto :goto_0

    .line 479
    :cond_1
    invoke-virtual {p0, v11}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrollState(I)V

    .line 481
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getHeight()I

    move-result v7

    .line 482
    .local v7, childHeight:I
    div-int/lit8 v10, v7, 0x2

    .line 483
    .local v10, halfHeight:I
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v12

    int-to-float v3, v7

    div-float/2addr v0, v3

    invoke-static {v12, v0}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 484
    .local v9, distanceRatio:F
    int-to-float v0, v10

    int-to-float v3, v10

    invoke-virtual {p0, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->distanceInfluenceForSnapDuration(F)F

    move-result v11

    mul-float/2addr v3, v11

    add-float v8, v0, v3

    .line 487
    .local v8, distance:F
    const/4 v5, 0x0

    .line 488
    .local v5, duration:I
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 489
    if-lez p2, :cond_2

    .line 490
    const/high16 v0, 0x447a

    int-to-float v3, p2

    div-float v3, v8, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    mul-int/lit8 v5, v0, 0x4

    .line 495
    :goto_1
    const/16 v0, 0x258

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 497
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 498
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->postInvalidateOnAnimation()V

    goto :goto_0

    .line 492
    :cond_2
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    int-to-float v3, v7

    div-float v6, v0, v3

    .line 493
    .local v6, childDelta:F
    add-float v0, v6, v12

    const/high16 v3, 0x42c8

    mul-float/2addr v0, v3

    float-to-int v5, v0

    goto :goto_1
.end method

.method animateHandle(Z)V
    .locals 4
    .parameter "visible"

    .prologue
    .line 327
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v1, :cond_0

    .line 328
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 329
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    .line 331
    :cond_0
    if-eqz p1, :cond_1

    const/high16 v0, 0x3f80

    .line 332
    .local v0, targetAlpha:F
    :goto_0
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAlpha:F

    cmpl-float v1, v0, v1

    if-nez v1, :cond_2

    .line 339
    :goto_1
    return-void

    .line 331
    .end local v0           #targetAlpha:F
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 335
    .restart local v0       #targetAlpha:F
    :cond_2
    sget-object v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->HANDLE_ALPHA:Landroid/util/Property;

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    .line 336
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->sHandleFadeInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 337
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0xfa

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 338
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHandleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 1367
    instance-of v0, p1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    return v0
.end method

.method completeChallengeScroll()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 439
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowingTargetState:Z

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setChallengeShowing(Z)V

    .line 440
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f80

    :goto_0
    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    .line 441
    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrollState(I)V

    .line 442
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveInternal:Z

    .line 443
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 444
    return-void

    .line 440
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public computeScroll()V
    .locals 2

    .prologue
    .line 1145
    invoke-super {p0}, Landroid/view/ViewGroup;->computeScroll()V

    .line 1147
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1148
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v0, :cond_1

    .line 1150
    const-string v0, "SlidingChallengeLayout"

    const-string v1, "Challenge view missing in computeScroll"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1162
    :cond_0
    :goto_0
    return-void

    .line 1155
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 1156
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->moveChallengeTo(I)Z

    .line 1158
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1159
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "ev"

    .prologue
    const/4 v4, 0x0

    .line 839
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 840
    .local v0, action:I
    const/4 v1, 0x0

    .line 841
    .local v1, handled:Z
    if-nez v0, :cond_0

    .line 843
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    .line 845
    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWidgetsView:Landroid/view/View;

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    if-nez v2, :cond_1

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isEdgeSwipeBeginEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 853
    :cond_1
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWidgetsView:Landroid/view/View;

    invoke-virtual {v3, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    or-int v1, v2, v3

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    .line 856
    :cond_2
    if-nez v1, :cond_3

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    if-nez v2, :cond_3

    .line 857
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 860
    :cond_3
    const/4 v2, 0x1

    if-eq v0, v2, :cond_4

    const/4 v2, 0x3

    if-ne v0, v2, :cond_5

    .line 861
    :cond_4
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEdgeCaptured:Z

    .line 864
    :cond_5
    return v1
.end method

.method distanceInfluenceForSnapDuration(F)F
    .locals 4
    .parameter "f"

    .prologue
    .line 422
    const/high16 v0, 0x3f00

    sub-float/2addr p1, v0

    .line 423
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 424
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 1131
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 1142
    return-void
.end method

.method public fadeChallenge(Z)V
    .locals 6
    .parameter "show"

    .prologue
    .line 1183
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v2, :cond_0

    .line 1185
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->cancelTransitionsInProgress()V

    .line 1186
    if-eqz p1, :cond_1

    const/high16 v0, 0x3f80

    .line 1187
    .local v0, alpha:F
    :goto_0
    if-eqz p1, :cond_2

    const/16 v1, 0xa0

    .line 1188
    .local v1, duration:I
    :goto_1
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const-string v3, "alpha"

    const/4 v4, 0x1

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v0, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    .line 1189
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$9;

    invoke-direct {v3, p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$9;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;Z)V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1199
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    int-to-long v3, v1

    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1200
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mFader:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    .line 1202
    .end local v0           #alpha:F
    .end local v1           #duration:I
    :cond_0
    return-void

    .line 1186
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1187
    .restart local v0       #alpha:F
    :cond_2
    const/16 v1, 0x64

    goto :goto_1
.end method

.method public fadeInChallenge()V
    .locals 1

    .prologue
    .line 1175
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->fadeChallenge(Z)V

    .line 1176
    return-void
.end method

.method public fadeOutChallenge()V
    .locals 1

    .prologue
    .line 1179
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->fadeChallenge(Z)V

    .line 1180
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .prologue
    .line 1362
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 1350
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 1355
    instance-of v0, p1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    check-cast p1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .end local p1
    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;)V

    :goto_0
    return-object v0

    .restart local p1
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1
    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_0

    .restart local p1
    :cond_1
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public getBouncerAnimationDuration()I
    .locals 1

    .prologue
    .line 552
    const/16 v0, 0xfa

    return v0
.end method

.method public getMaxChallengeTop()I
    .locals 3

    .prologue
    .line 1242
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    .line 1246
    :goto_0
    return v2

    .line 1244
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v1

    .line 1245
    .local v1, layoutBottom:I
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getMeasuredHeight()I

    move-result v0

    .line 1246
    .local v0, challengeHeight:I
    sub-int v2, v1, v0

    goto :goto_0
.end method

.method public hideBouncer()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 583
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-nez v1, :cond_1

    .line 604
    :cond_0
    :goto_0
    return-void

    .line 584
    :cond_1
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWasChallengeShowing:Z

    if-nez v1, :cond_2

    invoke-virtual {p0, v5}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(Z)V

    .line 585
    :cond_2
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    .line 587
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 588
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    const-string v2, "alpha"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v4, v3, v5

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 589
    .local v0, anim:Landroid/animation/Animator;
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 590
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$8;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$8;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 596
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 598
    .end local v0           #anim:Landroid/animation/Animator;
    :cond_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v1, :cond_4

    .line 599
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/16 v2, 0xfa

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->hideBouncer(I)V

    .line 601
    :cond_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    if-eqz v1, :cond_0

    .line 602
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    invoke-interface {v1, v5}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;->onBouncerStateChanged(Z)V

    goto :goto_0
.end method

.method public hideLockPadView()V
    .locals 2

    .prologue
    .line 1575
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1576
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1578
    :cond_0
    return-void
.end method

.method public isBouncing()Z
    .locals 1

    .prologue
    .line 547
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    return v0
.end method

.method public isChallengeOverlapping()Z
    .locals 1

    .prologue
    .line 542
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    return v0
.end method

.method public isChallengeShowing()Z
    .locals 1

    .prologue
    .line 537
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    return v0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 362
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 371
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    .line 372
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 376
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 386
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 388
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 390
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    .line 393
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    if-eqz v0, :cond_0

    .line 394
    const-string v0, "SlidingChallengeLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDetachedFromWindow mKeyguardLayerBackground destroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-interface {v0}, Lcom/mediatek/common/policy/IKeyguardLayer;->destroy()V

    .line 396
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 398
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    if-eqz v0, :cond_1

    .line 399
    const-string v0, "SlidingChallengeLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDetachedFromWindow mKeyguardLayerForeground destroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-interface {v0}, Lcom/mediatek/common/policy/IKeyguardLayer;->destroy()V

    .line 401
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 403
    :cond_1
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    .line 404
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    .line 405
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .prologue
    .line 1444
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 1445
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildCount()I

    move-result v1

    .line 1446
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_5

    .line 1447
    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1448
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .line 1449
    .local v3, lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    .line 1450
    check-cast v0, Landroid/widget/FrameLayout;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    .line 1446
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1451
    .restart local v0       #child:Landroid/view/View;
    :cond_1
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/16 v5, 0x9

    if-ne v4, v5, :cond_2

    .line 1452
    check-cast v0, Landroid/widget/FrameLayout;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    goto :goto_1

    .line 1453
    .restart local v0       #child:Landroid/view/View;
    :cond_2
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 1454
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v4, :cond_3

    .line 1455
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "There may only be one child with layout_isChallenge=\"true\""

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1458
    :cond_3
    instance-of v4, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v4, :cond_4

    .line 1459
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Challenge must be a KeyguardSecurityContainer"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1462
    :cond_4
    check-cast v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    goto :goto_1

    .line 1465
    .end local v3           #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    :cond_5
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .parameter "ev"

    .prologue
    .line 624
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v7, :cond_0

    .line 625
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 627
    :cond_0
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 629
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 631
    .local v0, action:I
    const-string v7, "ro.rgk.sm611.style"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "samsun"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 633
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v7, :cond_1

    .line 634
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getHeight()I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSecurityHeight:I

    .line 637
    :cond_1
    const/4 v7, 0x2

    new-array v4, v7, [I

    .line 644
    .local v4, location:[I
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-nez v7, :cond_3

    .line 646
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSelectorView:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    if-eqz v7, :cond_3

    .line 648
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSelectorView:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    invoke-virtual {v7, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->getLocationOnScreen([I)V

    .line 649
    const/4 v2, 0x1

    .line 650
    .local v2, flag:Z
    if-nez v0, :cond_9

    .line 652
    const-string v8, "xing"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Sl --------isInChallengeView  --------- d "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    const/4 v10, 0x1

    aget v10, v4, v10

    int-to-float v10, v10

    cmpg-float v7, v7, v10

    if-gez v7, :cond_7

    const/4 v7, 0x1

    :goto_0
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    const/4 v8, 0x1

    aget v8, v4, v8

    int-to-float v8, v8

    cmpg-float v7, v7, v8

    if-ltz v7, :cond_2

    const/4 v7, 0x1

    aget v7, v4, v7

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSecurityHeight:I

    if-le v7, v8, :cond_8

    .line 655
    :cond_2
    const/4 v2, 0x0

    .line 656
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag_qj:Z

    .line 657
    const-string v7, "xing"

    const-string v8, "Sl --------isInChallengeView  ---------1"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    :goto_1
    const/4 v7, 0x1

    if-ne v2, v7, :cond_3

    .line 671
    const-string v7, "xing"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Sl --------isInChallengeView "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    invoke-virtual {v7, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 679
    .end local v2           #flag:Z
    .end local v4           #location:[I
    :cond_3
    packed-switch v0, :pswitch_data_0

    .line 713
    :cond_4
    :goto_2
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    if-nez v7, :cond_5

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeInteractionBlocked()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 714
    :cond_5
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    .line 715
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    .line 718
    :cond_6
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    return v7

    .line 652
    .restart local v2       #flag:Z
    .restart local v4       #location:[I
    :cond_7
    const/4 v7, 0x0

    goto :goto_0

    .line 660
    :cond_8
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag_qj:Z

    goto :goto_1

    .line 665
    :cond_9
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag_qj:Z

    const/4 v8, 0x1

    if-ne v7, v8, :cond_a

    .line 666
    const/4 v2, 0x0

    .line 667
    :cond_a
    const-string v7, "xing"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Sl --------isInChallengeView  ---------falg"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 681
    .end local v2           #flag:Z
    .end local v4           #location:[I
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartX:F

    .line 682
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    .line 683
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    goto :goto_2

    .line 688
    :pswitch_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->resetTouch()V

    goto :goto_2

    .line 692
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    .line 693
    .local v1, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_3
    if-ge v3, v1, :cond_4

    .line 694
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    .line 695
    .local v5, x:F
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 696
    .local v6, y:F
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-nez v7, :cond_d

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    const/4 v8, -0x1

    if-ne v7, v8, :cond_d

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    invoke-direct {p0, v5, v6, v7}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->crossedDragHandle(FFF)Z

    move-result v7

    if-nez v7, :cond_b

    invoke-direct {p0, v5, v6}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isInChallengeView(FF)Z

    move-result v7

    if-eqz v7, :cond_d

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollState:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_d

    .line 700
    :cond_b
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    .line 701
    iput v5, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartX:F

    .line 702
    iput v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    .line 703
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChallengeBottom()I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartChallengeBottom:I

    .line 704
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    .line 705
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v8, 0x2

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 693
    :cond_c
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 706
    :cond_d
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v7, :cond_c

    invoke-direct {p0, v5, v6}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isInChallengeView(FF)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 707
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    goto :goto_4

    .line 679
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 27
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 1065
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getPaddingLeft()I

    move-result v17

    .line 1066
    .local v17, paddingLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getPaddingTop()I

    move-result v19

    .line 1067
    .local v19, paddingTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getPaddingRight()I

    move-result v18

    .line 1068
    .local v18, paddingRight:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getPaddingBottom()I

    move-result v16

    .line 1069
    .local v16, paddingBottom:I
    sub-int v22, p4, p2

    .line 1070
    .local v22, width:I
    sub-int v11, p5, p3

    .line 1072
    .local v11, height:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildCount()I

    move-result v10

    .line 1073
    .local v10, count:I
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    if-ge v12, v10, :cond_5

    .line 1074
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 1076
    .local v7, child:Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v23

    const/16 v24, 0x8

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1

    .line 1073
    :cond_0
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 1078
    :cond_1
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .line 1080
    .local v15, lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_2

    .line 1083
    add-int v23, v17, v22

    sub-int v23, v23, v18

    div-int/lit8 v6, v23, 0x2

    .line 1084
    .local v6, center:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    .line 1085
    .local v9, childWidth:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    .line 1086
    .local v8, childHeight:I
    div-int/lit8 v23, v9, 0x2

    sub-int v14, v6, v23

    .line 1087
    .local v14, left:I
    sub-int v23, v11, v16

    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->bottomMargin:I

    move/from16 v24, v0

    sub-int v13, v23, v24

    .line 1090
    .local v13, layoutBottom:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    move/from16 v23, v0

    sub-int v23, v8, v23

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    const/high16 v24, 0x3f80

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeOffset:F

    move/from16 v25, v0

    sub-float v24, v24, v25

    mul-float v23, v23, v24

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    add-int v5, v13, v23

    .line 1092
    .local v5, bottom:I
    invoke-direct/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChallengeAlpha()F

    move-result v23

    move/from16 v0, v23

    invoke-virtual {v7, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1093
    sub-int v23, v5, v8

    add-int v24, v14, v9

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v7, v14, v0, v1, v5}, Landroid/view/View;->layout(IIII)V

    goto :goto_1

    .line 1094
    .end local v5           #bottom:I
    .end local v6           #center:I
    .end local v8           #childHeight:I
    .end local v9           #childWidth:I
    .end local v13           #layoutBottom:I
    .end local v14           #left:I
    :cond_2
    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    move/from16 v23, v0

    const/16 v24, 0x6

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_3

    .line 1095
    add-int v23, v17, v22

    sub-int v23, v23, v18

    div-int/lit8 v6, v23, 0x2

    .line 1096
    .restart local v6       #center:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v23

    div-int/lit8 v23, v23, 0x2

    sub-int v14, v6, v23

    .line 1097
    .restart local v14       #left:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v23

    add-int v20, v14, v23

    .line 1098
    .local v20, right:I
    sub-int v23, v11, v16

    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->bottomMargin:I

    move/from16 v24, v0

    sub-int v5, v23, v24

    .line 1099
    .restart local v5       #bottom:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v23

    sub-int v21, v5, v23

    .line 1100
    .local v21, top:I
    move/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v7, v14, v0, v1, v5}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_1

    .line 1103
    .end local v5           #bottom:I
    .end local v6           #center:I
    .end local v14           #left:I
    .end local v20           #right:I
    .end local v21           #top:I
    :cond_3
    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    move/from16 v23, v0

    const/16 v24, 0x8

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    .line 1106
    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    move/from16 v23, v0

    const/16 v24, 0x9

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_4

    .line 1107
    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_1

    .line 1112
    :cond_4
    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->leftMargin:I

    move/from16 v23, v0

    add-int v23, v23, v17

    iget v0, v15, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->topMargin:I

    move/from16 v24, v0

    add-int v24, v24, v19

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v25

    add-int v25, v25, v17

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v26

    add-int v26, v26, v19

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_1

    .line 1119
    .end local v7           #child:Landroid/view/View;
    .end local v15           #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    move-object/from16 v23, v0

    if-eqz v23, :cond_6

    .line 1121
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v25

    sub-int v24, v24, v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v25

    move-object/from16 v0, v23

    move/from16 v1, p2

    move/from16 v2, v24

    move/from16 v3, p4

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 1124
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    move/from16 v23, v0

    if-nez v23, :cond_7

    .line 1125
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    .line 1127
    :cond_7
    return-void
.end method

.method protected onMeasure(II)V
    .locals 30
    .parameter "widthSpec"
    .parameter "heightSpec"

    .prologue
    .line 941
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    const/high16 v4, 0x4000

    if-ne v3, v4, :cond_0

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    const/high16 v4, 0x4000

    if-eq v3, v4, :cond_1

    .line 943
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "SlidingChallengeLayout must be measured with an exact size"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 947
    :cond_1
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v27

    .line 948
    .local v27, width:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 949
    .local v18, height:I
    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setMeasuredDimension(II)V

    .line 952
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v23, v0

    .line 953
    .local v23, oldChallengeView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v24, v0

    .line 954
    .local v24, oldExpandChallengeView:Landroid/view/View;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .line 955
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    .line 956
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildCount()I

    move-result v14

    .line 960
    .local v14, count:I
    const/16 v19, 0x0

    .local v19, i:I
    :goto_0
    move/from16 v0, v19

    if-ge v0, v14, :cond_d

    .line 961
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 962
    .local v9, child:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .line 963
    .local v20, lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_8

    .line 964
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v3, :cond_2

    .line 965
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "There may only be one child with layout_isChallenge=\"true\""

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 968
    :cond_2
    instance-of v3, v9, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v3, :cond_3

    .line 969
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Challenge must be a KeyguardSecurityContainer"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_3
    move-object v3, v9

    .line 972
    check-cast v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .line 973
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v0, v23

    if-eq v3, v0, :cond_4

    .line 974
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v3, :cond_6

    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v4, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setVisibility(I)V

    .line 977
    :cond_4
    const v3, 0x10202fe

    invoke-virtual {v9, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    .line 978
    .local v17, glowPadView:Landroid/view/View;
    if-eqz v17, :cond_7

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_7

    const/4 v3, 0x1

    :goto_2
    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasGlowpad:Z

    .line 979
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChallengeMargin(Z)I

    move-result v3

    move-object/from16 v0, v20

    iput v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->rightMargin:I

    move-object/from16 v0, v20

    iput v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->leftMargin:I

    .line 960
    .end local v17           #glowPadView:Landroid/view/View;
    :cond_5
    :goto_3
    add-int/lit8 v19, v19, 0x1

    goto :goto_0

    .line 974
    :cond_6
    const/4 v3, 0x4

    goto :goto_1

    .line 978
    .restart local v17       #glowPadView:Landroid/view/View;
    :cond_7
    const/4 v3, 0x0

    goto :goto_2

    .line 980
    .end local v17           #glowPadView:Landroid/view/View;
    :cond_8
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_b

    .line 981
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    if-eqz v3, :cond_9

    .line 982
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "There may only be one child with layout_childType=\"expandChallengeHandle\""

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 986
    :cond_9
    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    .line 987
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    move-object/from16 v0, v24

    if-eq v3, v0, :cond_5

    .line 988
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-eqz v3, :cond_a

    const/4 v3, 0x4

    :goto_4
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 989
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 988
    :cond_a
    const/4 v3, 0x0

    goto :goto_4

    .line 991
    :cond_b
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_c

    .line 992
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrimView(Landroid/view/View;)V

    goto :goto_3

    .line 993
    :cond_c
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_5

    .line 994
    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWidgetsView:Landroid/view/View;

    goto :goto_3

    .line 1001
    .end local v9           #child:Landroid/view/View;
    .end local v20           #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    :cond_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v3, :cond_10

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_10

    .line 1008
    move/from16 v7, p2

    .line 1009
    .local v7, challengeHeightSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getRootView()Landroid/view/View;

    move-result-object v25

    .line 1010
    .local v25, root:Landroid/view/View;
    if-eqz v25, :cond_f

    .line 1011
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .line 1012
    .restart local v20       #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v26

    .line 1013
    .local v26, specSize:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    sub-int v28, v3, v4

    .line 1014
    .local v28, windowHeight:I
    sub-int v15, v28, v26

    .line 1016
    .local v15, diff:I
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->maxHeight:I

    sub-int v22, v3, v15

    .line 1017
    .local v22, maxChallengeHeight:I
    const v3, 0x10202b6

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    .line 1018
    .local v21, mAppWidgetContainer:Landroid/view/View;
    const/high16 v3, 0x43c8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    float-to-int v0, v3

    move/from16 v16, v0

    .line 1019
    .local v16, fullScreenChallengeHeight:I
    if-eqz v21, :cond_e

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_e

    .line 1020
    move/from16 v0, v26

    move/from16 v1, v16

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    move/from16 v0, v22

    if-ge v0, v3, :cond_e

    .line 1021
    move/from16 v0, v26

    move/from16 v1, v16

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v22

    .line 1025
    :cond_e
    if-lez v22, :cond_f

    .line 1026
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->height:I

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->makeChildMeasureSpec(II)I

    move-result v7

    .line 1029
    .end local v15           #diff:I
    .end local v16           #fullScreenChallengeHeight:I
    .end local v20           #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    .end local v21           #mAppWidgetContainer:Landroid/view/View;
    .end local v22           #maxChallengeHeight:I
    .end local v26           #specSize:I
    .end local v28           #windowHeight:I
    :cond_f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move/from16 v5, p1

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 1033
    .end local v7           #challengeHeightSpec:I
    .end local v25           #root:Landroid/view/View;
    :cond_10
    const/16 v19, 0x0

    :goto_5
    move/from16 v0, v19

    if-ge v0, v14, :cond_14

    .line 1034
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 1035
    .restart local v9       #child:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_12

    .line 1033
    :cond_11
    :goto_6
    add-int/lit8 v19, v19, 0x1

    goto :goto_5

    .line 1039
    :cond_12
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eq v9, v3, :cond_11

    .line 1043
    move/from16 v10, p1

    .local v10, parentWidthSpec:I
    move/from16 v12, p2

    .line 1044
    .local v12, parentHeightSpec:I
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;

    .line 1045
    .restart local v20       #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;->childType:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_13

    .line 1046
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getRootView()Landroid/view/View;

    move-result-object v25

    .line 1047
    .restart local v25       #root:Landroid/view/View;
    if-eqz v25, :cond_13

    .line 1051
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v0, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v29, v0

    .line 1052
    .local v29, windowWidth:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    sub-int v28, v3, v4

    .line 1053
    .restart local v28       #windowHeight:I
    const/high16 v3, 0x4000

    move/from16 v0, v29

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 1055
    const/high16 v3, 0x4000

    move/from16 v0, v28

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 1059
    .end local v25           #root:Landroid/view/View;
    .end local v28           #windowHeight:I
    .end local v29           #windowWidth:I
    :cond_13
    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v8, p0

    invoke-virtual/range {v8 .. v13}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    goto :goto_6

    .line 1061
    .end local v9           #child:Landroid/view/View;
    .end local v10           #parentWidthSpec:I
    .end local v12           #parentHeightSpec:I
    .end local v20           #lp:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$LayoutParams;
    :cond_14
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .parameter "ev"

    .prologue
    const/4 v13, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    .line 738
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    .line 739
    .local v5, px:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    .line 743
    .local v6, py:F
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-nez v9, :cond_0

    invoke-direct {p0, v5, v6}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isInChallengeView(FF)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 745
    const-string v9, "xing"

    const-string v10, "SlidingChallengeLayout -------- onTouchEvent---------2"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    if-eqz v9, :cond_0

    .line 748
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    invoke-virtual {v9, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 752
    :cond_0
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v9, :cond_1

    .line 753
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v9

    iput-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 755
    :cond_1
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 757
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 758
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 827
    :cond_2
    :goto_0
    :pswitch_0
    return v12

    .line 760
    :pswitch_1
    iput-boolean v11, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    .line 761
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    iput v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartX:F

    .line 762
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    iput v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    goto :goto_0

    .line 766
    :pswitch_2
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-eqz v9, :cond_3

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeInteractionBlocked()Z

    move-result v9

    if-nez v9, :cond_3

    .line 767
    invoke-direct {p0, v11}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(I)V

    .line 769
    :cond_3
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->resetTouch()V

    goto :goto_0

    .line 773
    :pswitch_3
    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v10

    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v10

    if-ne v9, v10, :cond_2

    .line 777
    :pswitch_4
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-eqz v9, :cond_4

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeInteractionBlocked()Z

    move-result v9

    if-nez v9, :cond_4

    .line 778
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v10, 0x3e8

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mMaxVelocity:I

    int-to-float v11, v11

    invoke-virtual {v9, v10, v11}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 779
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v10, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    invoke-virtual {v9, v10}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v9

    float-to-int v9, v9

    invoke-direct {p0, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(I)V

    .line 781
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->resetTouch()V

    goto :goto_0

    .line 785
    :pswitch_5
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-nez v9, :cond_6

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    if-nez v9, :cond_6

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-nez v9, :cond_6

    .line 786
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    .line 787
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v1, :cond_6

    .line 788
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 789
    .local v7, x:F
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    .line 791
    .local v8, y:F
    invoke-direct {p0, v7, v8}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isInDragHandle(FF)Z

    move-result v9

    if-nez v9, :cond_5

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    invoke-direct {p0, v7, v8, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->crossedDragHandle(FFF)Z

    move-result v9

    if-nez v9, :cond_5

    invoke-direct {p0, v7, v8}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isInChallengeView(FF)Z

    move-result v9

    if-eqz v9, :cond_7

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollState:I

    if-ne v9, v13, :cond_7

    :cond_5
    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_7

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->isChallengeInteractionBlocked()Z

    move-result v9

    if-nez v9, :cond_7

    .line 795
    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartX:F

    .line 796
    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    .line 797
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v9

    iput v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    .line 798
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getChallengeBottom()I

    move-result v9

    iput v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartChallengeBottom:I

    .line 799
    iput-boolean v12, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    .line 800
    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/4 v10, 0x0

    invoke-virtual {v9, v13, v10}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 806
    .end local v1           #count:I
    .end local v2           #i:I
    .end local v7           #x:F
    .end local v8           #y:F
    :cond_6
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mDragging:Z

    if-eqz v9, :cond_2

    .line 809
    invoke-virtual {p0, v12}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setScrollState(I)V

    .line 811
    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mActivePointerId:I

    invoke-virtual {p1, v9}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v3

    .line 812
    .local v3, index:I
    if-gez v3, :cond_8

    .line 815
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->resetTouch()V

    .line 816
    invoke-direct {p0, v11}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(I)V

    goto/16 :goto_0

    .line 787
    .end local v3           #index:I
    .restart local v1       #count:I
    .restart local v2       #i:I
    .restart local v7       #x:F
    .restart local v8       #y:F
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 819
    .end local v1           #count:I
    .end local v2           #i:I
    .end local v7           #x:F
    .end local v8           #y:F
    .restart local v3       #index:I
    :cond_8
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    .line 820
    .restart local v8       #y:F
    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartY:F

    sub-float v9, v8, v9

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->getLayoutBottom()I

    move-result v10

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeBottomBound:I

    sub-int/2addr v10, v11

    int-to-float v10, v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 823
    .local v4, pos:F
    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mGestureStartChallengeBottom:I

    float-to-int v10, v4

    add-int/2addr v9, v10

    invoke-direct {p0, v9}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->moveChallengeTo(I)Z

    goto/16 :goto_0

    .line 758
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "child"
    .parameter "focused"

    .prologue
    .line 409
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eq p1, v0, :cond_0

    .line 412
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->hideBouncer()V

    .line 414
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 415
    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0
    .parameter "allowIntercept"

    .prologue
    .line 620
    return-void
.end method

.method public setChallengeInteractive(Z)V
    .locals 1
    .parameter "interactive"

    .prologue
    .line 320
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeInteractiveExternal:Z

    .line 321
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 324
    :cond_0
    return-void
.end method

.method public setClipChildrenForNewEventView(Z)V
    .locals 1
    .parameter "clipChildren"

    .prologue
    .line 1560
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setClipChildren(Z)V

    .line 1561
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v0, :cond_0

    .line 1562
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setClipChildrenForNewEventView(Z)V

    .line 1564
    :cond_0
    return-void
.end method

.method public setHandleAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 314
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mExpandChallengeView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 317
    :cond_0
    return-void
.end method

.method public setKeyguardCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V
    .locals 0
    .parameter "callback"

    .prologue
    .line 1571
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    .line 1572
    return-void
.end method

.method public setLockView(Landroid/view/View;Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)V
    .locals 0
    .parameter "lockView"
    .parameter "keyguardSelectorView"

    .prologue
    .line 111
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    .line 112
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardSelectorView:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    .line 113
    return-void
.end method

.method public setOnBouncerStateChangedListener(Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 357
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    .line 358
    return-void
.end method

.method public setOnChallengeScrolledListener(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 350
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    .line 351
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mHasLayout:Z

    if-eqz v0, :cond_0

    .line 352
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->sendInitialListenerUpdates()V

    .line 354
    :cond_0
    return-void
.end method

.method setScrimView(Landroid/view/View;)V
    .locals 2
    .parameter "scrim"

    .prologue
    .line 447
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 448
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 450
    :cond_0
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    .line 451
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 452
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 453
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 454
    return-void

    .line 451
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method

.method setScrollState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 428
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollState:I

    if-eq v0, p1, :cond_0

    .line 429
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollState:I

    .line 431
    if-nez p1, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->animateHandle(Z)V

    .line 432
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    if-eqz v0, :cond_0

    .line 433
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrollListener:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;->onScrollStateChanged(I)V

    .line 436
    :cond_0
    return-void

    .line 431
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setTouchRecepientForKeyguardLayer(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V
    .locals 1
    .parameter "glowPadView"

    .prologue
    .line 1529
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    .line 1530
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setTouchRecepient(Landroid/view/View;)V

    .line 1535
    :cond_0
    :goto_0
    return-void

    .line 1531
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 1532
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setTouchRecepient(Landroid/view/View;)V

    goto :goto_0
.end method

.method public showBouncer()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 557
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    if-eqz v1, :cond_1

    .line 579
    :cond_0
    :goto_0
    return-void

    .line 558
    :cond_1
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeShowing:Z

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mWasChallengeShowing:Z

    .line 559
    iput-boolean v6, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mIsBouncing:Z

    .line 560
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(Z)V

    .line 561
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 562
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mScrimView:Landroid/view/View;

    const-string v2, "alpha"

    new-array v3, v6, [F

    const/4 v4, 0x0

    const/high16 v5, 0x3f80

    aput v5, v3, v4

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 563
    .local v0, anim:Landroid/animation/Animator;
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 564
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$7;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$7;-><init>(Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 570
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 572
    .end local v0           #anim:Landroid/animation/Animator;
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v1, :cond_3

    .line 573
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/16 v2, 0xfa

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->showBouncer(I)V

    .line 576
    :cond_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    if-eqz v1, :cond_0

    .line 577
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    invoke-interface {v1, v6}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;->onBouncerStateChanged(Z)V

    goto :goto_0
.end method

.method public showChallenge(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 1316
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->showChallenge(ZI)V

    .line 1317
    if-nez p1, :cond_0

    .line 1320
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mBlockDrag:Z

    .line 1322
    :cond_0
    return-void
.end method

.method public showLockPadView()V
    .locals 2

    .prologue
    .line 1581
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1582
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mLQLockView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1583
    :cond_0
    return-void
.end method

.method public updateKeyguardLayerVisibility(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 1521
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayer:Z

    .line 1522
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1523
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->post(Ljava/lang/Runnable;)Z

    .line 1524
    return-void
.end method
