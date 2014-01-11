.class public Lcom/android/systemui/ExpandHelper;
.super Ljava/lang/Object;
.source "ExpandHelper.java"

# interfaces
.implements Lcom/android/systemui/Gefingerpoken;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/ExpandHelper$ViewScaler;,
        Lcom/android/systemui/ExpandHelper$Callback;
    }
.end annotation


# static fields
.field private static final BLINDS:I = 0x1

.field protected static final DEBUG:Z = false

.field protected static final DEBUG_GLOW:Z = false

.field protected static final DEBUG_SCALE:Z = false

.field private static final EXPAND_DURATION:J = 0xfaL

.field private static final GLOW_BASE:F = 0.5f

.field private static final GLOW_DURATION:J = 0x96L

.field private static final NONE:I = 0x0

.field private static final PULL:I = 0x2

.field private static final STRETCH:I = 0x4

.field private static final STRETCH_INTERVAL:F = 2.0f

.field private static final TAG:Ljava/lang/String; = "ExpandHelper"

.field private static final USE_DRAG:Z = true

.field private static final USE_SPAN:Z = true


# instance fields
.field private mCallback:Lcom/android/systemui/ExpandHelper$Callback;

.field private mContext:Landroid/content/Context;

.field private mCurrView:Landroid/view/View;

.field private mCurrViewBottomGlow:Landroid/view/View;

.field private mCurrViewTopGlow:Landroid/view/View;

.field private mEventSource:Landroid/view/View;

.field private mExpanding:Z

.field private mExpansionStyle:I

.field private mGlowAnimationSet:Landroid/animation/AnimatorSet;

.field private mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

.field private mGlowTopAnimation:Landroid/animation/ObjectAnimator;

.field private mGravity:I

.field private mHasPopped:Z

.field private mInitialTouchFocusY:F

.field private mInitialTouchSpan:F

.field private mInitialTouchY:F

.field private mLargeSize:I

.field private mLastFocusY:F

.field private mLastMotionY:I

.field private mLastSpanY:F

.field private mMaximumStretch:F

.field private mNaturalHeight:F

.field private mOldHeight:F

.field private mPopDuration:I

.field private mPopLimit:F

.field private mPullGestureMinXSpan:F

.field private mSGD:Landroid/view/ScaleGestureDetector;

.field private mScaleAnimation:Landroid/animation/ObjectAnimator;

.field private mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

.field private mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

.field private mScrollView:Landroid/view/View;

.field private mSmallSize:I

.field private mTouchSlop:I

.field private mVibrator:Landroid/os/Vibrator;

.field private mWatchingForPull:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/ExpandHelper$Callback;II)V
    .registers 14
    .parameter "context"
    .parameter "callback"
    .parameter "small"
    .parameter "large"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 186
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput v5, p0, Lcom/android/systemui/ExpandHelper;->mExpansionStyle:I

    .line 112
    new-instance v2, Lcom/android/systemui/ExpandHelper$1;

    invoke-direct {v2, p0}, Lcom/android/systemui/ExpandHelper$1;-><init>(Lcom/android/systemui/ExpandHelper;)V

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 187
    iput p3, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    .line 188
    iget v2, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v2, v2

    const/high16 v3, 0x4000

    mul-float/2addr v2, v3

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mMaximumStretch:F

    .line 189
    iput p4, p0, Lcom/android/systemui/ExpandHelper;->mLargeSize:I

    .line 190
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    .line 191
    iput-object p2, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    .line 192
    new-instance v2, Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-direct {v2, p0}, Lcom/android/systemui/ExpandHelper$ViewScaler;-><init>(Lcom/android/systemui/ExpandHelper;)V

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    .line 193
    const/16 v2, 0x30

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mGravity:I

    .line 194
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    const-string v3, "height"

    new-array v4, v7, [F

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    .line 195
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v3, 0xfa

    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 196
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0041

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mPopLimit:F

    .line 197
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mPopDuration:I

    .line 198
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0042

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mPullGestureMinXSpan:F

    .line 200
    new-instance v1, Lcom/android/systemui/ExpandHelper$2;

    invoke-direct {v1, p0}, Lcom/android/systemui/ExpandHelper$2;-><init>(Lcom/android/systemui/ExpandHelper;)V

    .line 218
    .local v1, glowVisibilityController:Landroid/animation/AnimatorListenerAdapter;
    const-string v2, "alpha"

    new-array v3, v7, [F

    aput v6, v3, v5

    invoke-static {v8, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowTopAnimation:Landroid/animation/ObjectAnimator;

    .line 219
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowTopAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 220
    const-string v2, "alpha"

    new-array v3, v7, [F

    aput v6, v3, v5

    invoke-static {v8, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

    .line 221
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 222
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    .line 223
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/android/systemui/ExpandHelper;->mGlowTopAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/ExpandHelper;->mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 224
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    const-wide/16 v3, 0x96

    invoke-virtual {v2, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 226
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 227
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Lcom/android/systemui/ExpandHelper;->mTouchSlop:I

    .line 229
    new-instance v2, Landroid/view/ScaleGestureDetector;

    iget-object v3, p0, Lcom/android/systemui/ExpandHelper;->mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v2, p1, v3}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v2, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    .line 230
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/ExpandHelper;FF)Landroid/view/View;
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/android/systemui/ExpandHelper;->findView(FF)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/ExpandHelper;Landroid/view/View;I)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/systemui/ExpandHelper;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    return v0
.end method

.method private calculateGlow(FF)F
    .registers 12
    .parameter "target"
    .parameter "actual"

    .prologue
    const/high16 v8, 0x3f80

    const/high16 v7, 0x3f00

    .line 311
    sub-float v2, p1, p2

    iget v3, p0, Lcom/android/systemui/ExpandHelper;->mMaximumStretch:F

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 312
    .local v1, stretch:F
    const-wide v2, 0x4005bf0a8b145769L

    const/high16 v4, -0x4080

    const/high16 v5, 0x4100

    mul-float/2addr v5, v1

    const/high16 v6, 0x40a0

    sub-float/2addr v5, v6

    mul-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v2, v2

    add-float/2addr v2, v8

    div-float v0, v8, v2

    .line 314
    .local v0, strength:F
    mul-float v2, v0, v7

    add-float/2addr v2, v7

    return v2
.end method

.method private clamp(F)F
    .registers 4
    .parameter "target"

    .prologue
    .line 252
    move v0, p1

    .line 253
    .local v0, out:F
    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_14

    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v0, v1

    .line 254
    :cond_b
    :goto_b
    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_13

    iget v0, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    .line 255
    :cond_13
    return v0

    .line 253
    :cond_14
    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mLargeSize:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_b

    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mLargeSize:I

    int-to-float v0, v1

    goto :goto_b
.end method

.method private clearView()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 563
    iput-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    .line 564
    iput-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    .line 565
    iput-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    .line 566
    return-void
.end method

.method private findView(FF)Landroid/view/View;
    .registers 6
    .parameter "x"
    .parameter "y"

    .prologue
    .line 259
    const/4 v1, 0x0

    .line 260
    .local v1, v:Landroid/view/View;
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mEventSource:Landroid/view/View;

    if-eqz v2, :cond_1e

    .line 261
    const/4 v2, 0x2

    new-array v0, v2, [I

    .line 262
    .local v0, location:[I
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mEventSource:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 263
    const/4 v2, 0x0

    aget v2, v0, v2

    int-to-float v2, v2

    add-float/2addr p1, v2

    .line 264
    const/4 v2, 0x1

    aget v2, v0, v2

    int-to-float v2, v2

    add-float/2addr p2, v2

    .line 265
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    invoke-interface {v2, p1, p2}, Lcom/android/systemui/ExpandHelper$Callback;->getChildAtRawPosition(FF)Landroid/view/View;

    move-result-object v1

    .line 269
    .end local v0           #location:[I
    :goto_1d
    return-object v1

    .line 267
    :cond_1e
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    invoke-interface {v2, p1, p2}, Lcom/android/systemui/ExpandHelper$Callback;->getChildAtPosition(FF)Landroid/view/View;

    move-result-object v1

    goto :goto_1d
.end method

.method private finishExpanding(Z)V
    .registers 11
    .parameter "force"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 527
    iget-boolean v4, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    if-nez v4, :cond_7

    .line 560
    :goto_6
    return-void

    .line 531
    :cond_7
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v4}, Lcom/android/systemui/ExpandHelper$ViewScaler;->getHeight()F

    move-result v0

    .line 532
    .local v0, currentHeight:F
    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v2, v4

    .line 533
    .local v2, targetHeight:F
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v4}, Lcom/android/systemui/ExpandHelper$ViewScaler;->getHeight()F

    move-result v1

    .line 534
    .local v1, h:F
    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    iget v7, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v7, v7

    cmpl-float v4, v4, v7

    if-nez v4, :cond_6f

    move v3, v5

    .line 535
    .local v3, wasClosed:Z
    :goto_20
    if-eqz v3, :cond_75

    .line 536
    if-nez p1, :cond_2b

    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v4, v4

    cmpl-float v4, v0, v4

    if-lez v4, :cond_71

    :cond_2b
    iget v2, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    .line 540
    :goto_2d
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 541
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 543
    :cond_3a
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/android/systemui/ExpandHelper;->setGlow(F)V

    .line 544
    iget-object v7, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    cmpl-float v4, v1, v4

    if-nez v4, :cond_84

    move v4, v5

    :goto_49
    invoke-interface {v7, v8, v4}, Lcom/android/systemui/ExpandHelper$Callback;->setUserExpandedChild(Landroid/view/View;Z)Z

    .line 545
    cmpl-float v4, v2, v0

    if-eqz v4, :cond_63

    .line 546
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    new-array v5, v5, [F

    aput v2, v5, v6

    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 547
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->setupStartValues()V

    .line 548
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mScaleAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 550
    :cond_63
    iget-object v4, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    iget-object v5, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    invoke-interface {v4, v5, v6}, Lcom/android/systemui/ExpandHelper$Callback;->setUserLockedChild(Landroid/view/View;Z)Z

    .line 552
    iput-boolean v6, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    .line 553
    iput v6, p0, Lcom/android/systemui/ExpandHelper;->mExpansionStyle:I

    goto :goto_6

    .end local v3           #wasClosed:Z
    :cond_6f
    move v3, v6

    .line 534
    goto :goto_20

    .line 536
    .restart local v3       #wasClosed:Z
    :cond_71
    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v2, v4

    goto :goto_2d

    .line 538
    :cond_75
    if-nez p1, :cond_7d

    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    cmpg-float v4, v0, v4

    if-gez v4, :cond_81

    :cond_7d
    iget v4, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v2, v4

    :goto_80
    goto :goto_2d

    :cond_81
    iget v2, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    goto :goto_80

    :cond_84
    move v4, v6

    .line 544
    goto :goto_49
.end method

.method private handleGlowVisibility()V
    .registers 6

    .prologue
    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 342
    iget-object v3, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpg-float v0, v0, v4

    if-gtz v0, :cond_23

    move v0, v1

    :goto_10
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 344
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    iget-object v3, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v3

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_25

    :goto_1f
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 346
    return-void

    :cond_23
    move v0, v2

    .line 342
    goto :goto_10

    :cond_25
    move v1, v2

    .line 344
    goto :goto_1f
.end method

.method private isInside(Landroid/view/View;FF)Z
    .registers 11
    .parameter "v"
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 275
    if-nez p1, :cond_7

    .line 293
    :goto_6
    return v4

    .line 279
    :cond_7
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mEventSource:Landroid/view/View;

    if-eqz v2, :cond_1a

    .line 280
    new-array v1, v6, [I

    .line 281
    .local v1, location:[I
    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mEventSource:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 282
    aget v2, v1, v4

    int-to-float v2, v2

    add-float/2addr p2, v2

    .line 283
    aget v2, v1, v3

    int-to-float v2, v2

    add-float/2addr p3, v2

    .line 286
    .end local v1           #location:[I
    :cond_1a
    new-array v1, v6, [I

    .line 287
    .restart local v1       #location:[I
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 288
    aget v2, v1, v4

    int-to-float v2, v2

    sub-float/2addr p2, v2

    .line 289
    aget v2, v1, v3

    int-to-float v2, v2

    sub-float/2addr p3, v2

    .line 292
    cmpl-float v2, p2, v5

    if-lez v2, :cond_4d

    cmpl-float v2, p3, v5

    if-lez v2, :cond_4d

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, p2, v2

    if-gez v2, :cond_49

    move v2, v3

    :goto_39
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v5, p3, v5

    if-gez v5, :cond_4b

    move v5, v3

    :goto_43
    and-int/2addr v2, v5

    if-eqz v2, :cond_4d

    move v0, v3

    .local v0, inside:Z
    :goto_47
    move v4, v0

    .line 293
    goto :goto_6

    .end local v0           #inside:Z
    :cond_49
    move v2, v4

    .line 292
    goto :goto_39

    :cond_4b
    move v5, v4

    goto :goto_43

    :cond_4d
    move v0, v4

    goto :goto_47
.end method

.method private setView(Landroid/view/View;)V
    .registers 4
    .parameter "v"

    .prologue
    .line 569
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    .line 570
    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1b

    move-object v0, p1

    .line 571
    check-cast v0, Landroid/view/ViewGroup;

    .line 572
    .local v0, g:Landroid/view/ViewGroup;
    const v1, 0x7f0800b2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    .line 573
    const v1, 0x7f0800b6

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    .line 581
    .end local v0           #g:Landroid/view/ViewGroup;
    :cond_1b
    return-void
.end method

.method private startExpanding(Landroid/view/View;I)V
    .registers 6
    .parameter "v"
    .parameter "expandType"

    .prologue
    const/4 v2, 0x1

    .line 503
    iput p2, p0, Lcom/android/systemui/ExpandHelper;->mExpansionStyle:I

    .line 504
    iget-boolean v0, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    if-ne p1, v0, :cond_c

    .line 524
    :goto_b
    return-void

    .line 507
    :cond_c
    iput-boolean v2, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    .line 509
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    invoke-interface {v0, p1, v2}, Lcom/android/systemui/ExpandHelper$Callback;->setUserLockedChild(Landroid/view/View;Z)Z

    .line 510
    invoke-direct {p0, p1}, Lcom/android/systemui/ExpandHelper;->setView(Landroid/view/View;)V

    .line 511
    const/high16 v0, 0x3f00

    invoke-virtual {p0, v0}, Lcom/android/systemui/ExpandHelper;->setGlow(F)V

    .line 512
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v0, p1}, Lcom/android/systemui/ExpandHelper$ViewScaler;->setView(Landroid/view/View;)V

    .line 513
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v0}, Lcom/android/systemui/ExpandHelper$ViewScaler;->getHeight()F

    move-result v0

    iput v0, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    .line 514
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCallback:Lcom/android/systemui/ExpandHelper$Callback;

    invoke-interface {v0, p1}, Lcom/android/systemui/ExpandHelper$Callback;->canChildBeExpanded(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 516
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    iget v1, p0, Lcom/android/systemui/ExpandHelper;->mLargeSize:I

    invoke-virtual {v0, v1}, Lcom/android/systemui/ExpandHelper$ViewScaler;->getNaturalHeight(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    .line 523
    :goto_3b
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_b

    .line 519
    :cond_43
    iget v0, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    iput v0, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    goto :goto_3b
.end method

.method private updateExpansion()V
    .registers 10

    .prologue
    const/high16 v7, 0x3f80

    .line 235
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v6}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v6

    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchSpan:F

    sub-float v4, v6, v8

    .line 236
    .local v4, span:F
    mul-float/2addr v4, v7

    .line 237
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v6}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v6

    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchFocusY:F

    sub-float v0, v6, v8

    .line 238
    .local v0, drag:F
    mul-float/2addr v0, v7

    .line 239
    iget v6, p0, Lcom/android/systemui/ExpandHelper;->mGravity:I

    const/16 v8, 0x50

    if-ne v6, v8, :cond_5f

    const/high16 v6, -0x4080

    :goto_20
    mul-float/2addr v0, v6

    .line 240
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v6, v8

    add-float v3, v6, v7

    .line 241
    .local v3, pull:F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v6, v0

    div-float/2addr v6, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v7

    mul-float/2addr v7, v4

    div-float/2addr v7, v3

    add-float v1, v6, v7

    .line 242
    .local v1, hand:F
    iget v6, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    add-float v5, v1, v6

    .line 243
    .local v5, target:F
    invoke-direct {p0, v5}, Lcom/android/systemui/ExpandHelper;->clamp(F)F

    move-result v2

    .line 244
    .local v2, newHeight:F
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v6, v2}, Lcom/android/systemui/ExpandHelper$ViewScaler;->setHeight(F)V

    .line 246
    invoke-direct {p0, v5, v2}, Lcom/android/systemui/ExpandHelper;->calculateGlow(FF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/android/systemui/ExpandHelper;->setGlow(F)V

    .line 247
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v6}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v6

    iput v6, p0, Lcom/android/systemui/ExpandHelper;->mLastFocusY:F

    .line 248
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v6}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v6

    iput v6, p0, Lcom/android/systemui/ExpandHelper;->mLastSpanY:F

    .line 249
    return-void

    .end local v1           #hand:F
    .end local v2           #newHeight:F
    .end local v3           #pull:F
    .end local v5           #target:F
    :cond_5f
    move v6, v7

    .line 239
    goto :goto_20
.end method

.method private declared-synchronized vibrate(J)V
    .registers 5
    .parameter "duration"

    .prologue
    .line 605
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mVibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_11

    .line 606
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/android/systemui/ExpandHelper;->mVibrator:Landroid/os/Vibrator;

    .line 609
    :cond_11
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_18

    .line 610
    monitor-exit p0

    return-void

    .line 605
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public cancel()V
    .registers 4

    .prologue
    .line 594
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/systemui/ExpandHelper;->finishExpanding(Z)V

    .line 595
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->clearView()V

    .line 598
    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/android/systemui/ExpandHelper;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/ExpandHelper;->mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, v1, v2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    .line 599
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 585
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V

    .line 586
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/systemui/ExpandHelper;->finishExpanding(Z)V

    .line 587
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->clearView()V

    .line 588
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12
    .parameter "ev"

    .prologue
    const/4 v9, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 350
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 357
    .local v0, action:I
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 358
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v8

    float-to-int v2, v8

    .line 359
    .local v2, x:I
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v8

    float-to-int v4, v8

    .line 361
    .local v4, y:I
    int-to-float v8, v4

    iput v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchFocusY:F

    .line 362
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v8

    iput v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchSpan:F

    .line 363
    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchFocusY:F

    iput v8, p0, Lcom/android/systemui/ExpandHelper;->mLastFocusY:F

    .line 364
    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchSpan:F

    iput v8, p0, Lcom/android/systemui/ExpandHelper;->mLastSpanY:F

    .line 367
    iget-boolean v8, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    if-eqz v8, :cond_32

    .line 421
    :cond_31
    :goto_31
    return v6

    .line 370
    :cond_32
    if-ne v0, v9, :cond_3a

    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mExpansionStyle:I

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_31

    .line 374
    :cond_3a
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8}, Landroid/view/ScaleGestureDetector;->getCurrentSpanX()F

    move-result v3

    .line 375
    .local v3, xspan:F
    if-ne v0, v9, :cond_5e

    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mPullGestureMinXSpan:F

    cmpl-float v8, v3, v8

    if-lez v8, :cond_5e

    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v8}, Landroid/view/ScaleGestureDetector;->getCurrentSpanY()F

    move-result v8

    cmpl-float v8, v3, v8

    if-lez v8, :cond_5e

    .line 381
    int-to-float v7, v2

    int-to-float v8, v4

    invoke-direct {p0, v7, v8}, Lcom/android/systemui/ExpandHelper;->findView(FF)Landroid/view/View;

    move-result-object v1

    .line 382
    .local v1, underFocus:Landroid/view/View;
    if-eqz v1, :cond_31

    .line 383
    invoke-direct {p0, v1, v9}, Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V

    goto :goto_31

    .line 387
    .end local v1           #underFocus:Landroid/view/View;
    :cond_5e
    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mScrollView:Landroid/view/View;

    if-eqz v8, :cond_6c

    iget-object v8, p0, Lcom/android/systemui/ExpandHelper;->mScrollView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getScrollY()I

    move-result v8

    if-lez v8, :cond_6c

    move v6, v7

    .line 388
    goto :goto_31

    .line 391
    :cond_6c
    and-int/lit16 v8, v0, 0xff

    packed-switch v8, :pswitch_data_aa

    .line 421
    :cond_71
    :goto_71
    iget-boolean v6, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    goto :goto_31

    .line 393
    :pswitch_74
    iget-boolean v8, p0, Lcom/android/systemui/ExpandHelper;->mWatchingForPull:Z

    if-eqz v8, :cond_71

    .line 394
    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mLastMotionY:I

    sub-int v5, v4, v8

    .line 395
    .local v5, yDiff:I
    iget v8, p0, Lcom/android/systemui/ExpandHelper;->mTouchSlop:I

    if-le v5, v8, :cond_71

    .line 397
    iput v4, p0, Lcom/android/systemui/ExpandHelper;->mLastMotionY:I

    .line 398
    int-to-float v8, v2

    int-to-float v9, v4

    invoke-direct {p0, v8, v9}, Lcom/android/systemui/ExpandHelper;->findView(FF)Landroid/view/View;

    move-result-object v1

    .line 399
    .restart local v1       #underFocus:Landroid/view/View;
    if-eqz v1, :cond_71

    .line 400
    invoke-direct {p0, v1, v6}, Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V

    .line 401
    iget v6, p0, Lcom/android/systemui/ExpandHelper;->mLastMotionY:I

    int-to-float v6, v6

    iput v6, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    .line 402
    iput-boolean v7, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    goto :goto_71

    .line 410
    .end local v1           #underFocus:Landroid/view/View;
    .end local v5           #yDiff:I
    :pswitch_95
    iget-object v6, p0, Lcom/android/systemui/ExpandHelper;->mScrollView:Landroid/view/View;

    int-to-float v7, v2

    int-to-float v8, v4

    invoke-direct {p0, v6, v7, v8}, Lcom/android/systemui/ExpandHelper;->isInside(Landroid/view/View;FF)Z

    move-result v6

    iput-boolean v6, p0, Lcom/android/systemui/ExpandHelper;->mWatchingForPull:Z

    .line 411
    iput v4, p0, Lcom/android/systemui/ExpandHelper;->mLastMotionY:I

    goto :goto_71

    .line 417
    :pswitch_a2
    invoke-direct {p0, v7}, Lcom/android/systemui/ExpandHelper;->finishExpanding(Z)V

    .line 418
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->clearView()V

    goto :goto_71

    .line 391
    nop

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_95
        :pswitch_a2
        :pswitch_74
        :pswitch_a2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 15
    .parameter "ev"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 427
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 434
    .local v0, action:I
    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v11, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 436
    packed-switch v0, :pswitch_data_d4

    .line 499
    :cond_e
    :goto_e
    :pswitch_e
    return v9

    .line 438
    :pswitch_f
    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mExpansionStyle:I

    and-int/lit8 v11, v11, 0x1

    if-eqz v11, :cond_a4

    .line 439
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    sub-float/2addr v11, v12

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    add-float v4, v11, v12

    .line 440
    .local v4, rawHeight:F
    invoke-direct {p0, v4}, Lcom/android/systemui/ExpandHelper;->clamp(F)F

    move-result v2

    .line 441
    .local v2, newHeight:F
    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mOldHeight:F

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v12, v12

    cmpl-float v11, v11, v12

    if-nez v11, :cond_96

    move v6, v9

    .line 442
    .local v6, wasClosed:Z
    :goto_2e
    const/4 v1, 0x0

    .line 443
    .local v1, isFinished:Z
    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mNaturalHeight:F

    cmpl-float v11, v4, v11

    if-lez v11, :cond_36

    .line 444
    const/4 v1, 0x1

    .line 446
    :cond_36
    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mSmallSize:I

    int-to-float v11, v11

    cmpg-float v11, v4, v11

    if-gez v11, :cond_3e

    .line 447
    const/4 v1, 0x1

    .line 450
    :cond_3e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    sub-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 451
    .local v3, pull:F
    iget-boolean v11, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    if-nez v11, :cond_53

    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mPopLimit:F

    cmpl-float v11, v3, v11

    if-lez v11, :cond_5f

    .line 452
    :cond_53
    iget-boolean v11, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    if-nez v11, :cond_5f

    .line 453
    iget v11, p0, Lcom/android/systemui/ExpandHelper;->mPopDuration:I

    int-to-long v11, v11

    invoke-direct {p0, v11, v12}, Lcom/android/systemui/ExpandHelper;->vibrate(J)V

    .line 454
    iput-boolean v9, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    .line 458
    :cond_5f
    iget-boolean v11, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    if-eqz v11, :cond_98

    .line 459
    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mScaler:Lcom/android/systemui/ExpandHelper$ViewScaler;

    invoke-virtual {v11, v2}, Lcom/android/systemui/ExpandHelper$ViewScaler;->setHeight(F)V

    .line 460
    const/high16 v11, 0x3f00

    invoke-virtual {p0, v11}, Lcom/android/systemui/ExpandHelper;->setGlow(F)V

    .line 465
    :goto_6d
    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v11}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v11

    float-to-int v7, v11

    .line 466
    .local v7, x:I
    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v11}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v11

    float-to-int v8, v11

    .line 467
    .local v8, y:I
    int-to-float v11, v7

    int-to-float v12, v8

    invoke-direct {p0, v11, v12}, Lcom/android/systemui/ExpandHelper;->findView(FF)Landroid/view/View;

    move-result-object v5

    .line 468
    .local v5, underFocus:Landroid/view/View;
    if-eqz v1, :cond_e

    if-eqz v5, :cond_e

    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mCurrView:Landroid/view/View;

    if-eq v5, v11, :cond_e

    .line 469
    invoke-direct {p0, v10}, Lcom/android/systemui/ExpandHelper;->finishExpanding(Z)V

    .line 470
    invoke-direct {p0, v5, v9}, Lcom/android/systemui/ExpandHelper;->startExpanding(Landroid/view/View;I)V

    .line 471
    int-to-float v11, v8

    iput v11, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    .line 472
    iput-boolean v10, p0, Lcom/android/systemui/ExpandHelper;->mHasPopped:Z

    goto/16 :goto_e

    .end local v1           #isFinished:Z
    .end local v3           #pull:F
    .end local v5           #underFocus:Landroid/view/View;
    .end local v6           #wasClosed:Z
    .end local v7           #x:I
    .end local v8           #y:I
    :cond_96
    move v6, v10

    .line 441
    goto :goto_2e

    .line 462
    .restart local v1       #isFinished:Z
    .restart local v3       #pull:F
    .restart local v6       #wasClosed:Z
    :cond_98
    const/high16 v11, 0x4080

    mul-float/2addr v11, v3

    const/4 v12, 0x0

    invoke-direct {p0, v11, v12}, Lcom/android/systemui/ExpandHelper;->calculateGlow(FF)F

    move-result v11

    invoke-virtual {p0, v11}, Lcom/android/systemui/ExpandHelper;->setGlow(F)V

    goto :goto_6d

    .line 477
    .end local v1           #isFinished:Z
    .end local v2           #newHeight:F
    .end local v3           #pull:F
    .end local v4           #rawHeight:F
    .end local v6           #wasClosed:Z
    :cond_a4
    iget-boolean v10, p0, Lcom/android/systemui/ExpandHelper;->mExpanding:Z

    if-eqz v10, :cond_e

    .line 478
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->updateExpansion()V

    goto/16 :goto_e

    .line 488
    :pswitch_ad
    iget v10, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v11}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v11

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mLastFocusY:F

    sub-float/2addr v11, v12

    add-float/2addr v10, v11

    iput v10, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchY:F

    .line 489
    iget v10, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchSpan:F

    iget-object v11, p0, Lcom/android/systemui/ExpandHelper;->mSGD:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v11}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v11

    iget v12, p0, Lcom/android/systemui/ExpandHelper;->mLastSpanY:F

    sub-float/2addr v11, v12

    add-float/2addr v10, v11

    iput v10, p0, Lcom/android/systemui/ExpandHelper;->mInitialTouchSpan:F

    goto/16 :goto_e

    .line 495
    :pswitch_cb
    invoke-direct {p0, v10}, Lcom/android/systemui/ExpandHelper;->finishExpanding(Z)V

    .line 496
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->clearView()V

    goto/16 :goto_e

    .line 436
    nop

    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_cb
        :pswitch_f
        :pswitch_cb
        :pswitch_e
        :pswitch_ad
        :pswitch_ad
    .end packed-switch
.end method

.method public setEventSource(Landroid/view/View;)V
    .registers 2
    .parameter "eventSource"

    .prologue
    .line 297
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper;->mEventSource:Landroid/view/View;

    .line 298
    return-void
.end method

.method public setGlow(F)V
    .registers 6
    .parameter "glow"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 318
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_f

    cmpl-float v0, p1, v1

    if-nez v0, :cond_5c

    .line 319
    :cond_f
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 320
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 322
    :cond_1c
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    if-eqz v0, :cond_5c

    .line 323
    cmpl-float v0, p1, v1

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_5d

    .line 325
    :cond_32
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowTopAnimation:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 326
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 327
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowTopAnimation:Landroid/animation/ObjectAnimator;

    new-array v1, v3, [F

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 328
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowBottomAnimation:Landroid/animation/ObjectAnimator;

    new-array v1, v3, [F

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 329
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->setupStartValues()V

    .line 330
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mGlowAnimationSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 339
    :cond_5c
    :goto_5c
    return-void

    .line 333
    :cond_5d
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewTopGlow:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 334
    iget-object v0, p0, Lcom/android/systemui/ExpandHelper;->mCurrViewBottomGlow:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 335
    invoke-direct {p0}, Lcom/android/systemui/ExpandHelper;->handleGlowVisibility()V

    goto :goto_5c
.end method

.method public setGravity(I)V
    .registers 2
    .parameter "gravity"

    .prologue
    .line 301
    iput p1, p0, Lcom/android/systemui/ExpandHelper;->mGravity:I

    .line 302
    return-void
.end method

.method public setScrollView(Landroid/view/View;)V
    .registers 2
    .parameter "scrollView"

    .prologue
    .line 305
    iput-object p1, p0, Lcom/android/systemui/ExpandHelper;->mScrollView:Landroid/view/View;

    .line 306
    return-void
.end method
