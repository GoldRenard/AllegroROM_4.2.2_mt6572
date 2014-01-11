.class public Lcom/android/systemui/UniverseBackground;
.super Landroid/widget/FrameLayout;
.source "UniverseBackground.java"


# static fields
.field static final CHATTY:Z = false

.field static final SPEW:Z = false

.field static final STATE_CLOSED:I = 0x0

.field static final STATE_OPEN:I = 0x2

.field static final STATE_OPENING:I = 0x1

.field static final TAG:Ljava/lang/String; = "UniverseBackground"


# instance fields
.field private mAnimAccel:F

.field private mAnimLastTimeNanos:J

.field private mAnimVel:F

.field private mAnimY:F

.field private mAnimating:Z

.field private mAnimatingReveal:Z

.field final mAnimationCallback:Ljava/lang/Runnable;

.field private mAverageX:F

.field private mAverageY:F

.field final mBottomAnchor:Landroid/view/View;

.field private mChoreographer:Landroid/view/Choreographer;

.field private mClosing:Z

.field private mCollapseAccelPx:F

.field private mCollapseMinDisplayFraction:F

.field final mContent:Landroid/view/View;

.field private mDragStartX:F

.field private mDragStartY:F

.field private mExpandAccelPx:F

.field private mExpandMinDisplayFraction:F

.field private mExpanded:Z

.field private mExpandedVisible:Z

.field private mFlingCollapseMinVelocityPx:F

.field private mFlingExpandMinVelocityPx:F

.field private mFlingGestureMaxXVelocityPx:F

.field private mPositionTmp:[I

.field private mSelfCollapseVelocityPx:F

.field private mSelfExpandVelocityPx:F

.field final mSession:Landroid/view/IWindowSession;

.field private mState:I

.field private final mTmpFloats:[F

.field private mTracking:Z

.field private mUniverseTransform:Landroid/view/animation/Transformation;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mYDelta:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 49
    new-instance v0, Lcom/android/systemui/UniverseBackground$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/UniverseBackground$1;-><init>(Lcom/android/systemui/UniverseBackground;)V

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimationCallback:Ljava/lang/Runnable;

    .line 71
    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mPositionTmp:[I

    .line 91
    iput-boolean v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimatingReveal:Z

    .line 93
    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 94
    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    .line 95
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    .line 99
    const/high16 v0, -0x100

    invoke-virtual {p0, v0}, Lcom/android/systemui/UniverseBackground;->setBackgroundColor(I)V

    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Landroid/view/WindowManagerGlobal;->getWindowSession(Landroid/os/Looper;)Landroid/view/IWindowSession;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mSession:Landroid/view/IWindowSession;

    .line 101
    const v0, 0x7f040050

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mContent:Landroid/view/View;

    .line 102
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/android/systemui/UniverseBackground;->addView(Landroid/view/View;)V

    .line 103
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mContent:Landroid/view/View;

    const v1, 0x7f080128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/android/systemui/UniverseBackground$2;

    invoke-direct {v1, p0}, Lcom/android/systemui/UniverseBackground$2;-><init>(Lcom/android/systemui/UniverseBackground;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mContent:Landroid/view/View;

    const v1, 0x7f08012a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mBottomAnchor:Landroid/view/View;

    .line 109
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    .line 110
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->loadDimens()V

    .line 111
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/UniverseBackground;)Landroid/view/Choreographer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    return-object v0
.end method

.method private computeAveragePos(Landroid/view/MotionEvent;)V
    .locals 5
    .parameter "event"

    .prologue
    .line 136
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    .line 137
    .local v1, num:I
    const/4 v2, 0x0

    .local v2, x:F
    const/4 v3, 0x0

    .line 138
    .local v3, y:F
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 139
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    add-float/2addr v2, v4

    .line 140
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v3, v4

    .line 138
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    :cond_0
    int-to-float v4, v1

    div-float v4, v2, v4

    iput v4, p0, Lcom/android/systemui/UniverseBackground;->mAverageX:F

    .line 143
    int-to-float v4, v1

    div-float v4, v3, v4

    iput v4, p0, Lcom/android/systemui/UniverseBackground;->mAverageY:F

    .line 144
    return-void
.end method

.method private getExpandedViewMaxHeight()I
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mBottomAnchor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    return v0
.end method

.method private loadDimens()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 120
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 121
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x7f0d0020

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mSelfExpandVelocityPx:F

    .line 122
    const v1, 0x7f0d0021

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mSelfCollapseVelocityPx:F

    .line 123
    const v1, 0x7f0d0022

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mFlingExpandMinVelocityPx:F

    .line 124
    const v1, 0x7f0d0023

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mFlingCollapseMinVelocityPx:F

    .line 126
    const v1, 0x7f0d0027

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mCollapseMinDisplayFraction:F

    .line 127
    const v1, 0x7f0d0028

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mExpandMinDisplayFraction:F

    .line 129
    const v1, 0x7f0d0029

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mExpandAccelPx:F

    .line 130
    const v1, 0x7f0d002a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mCollapseAccelPx:F

    .line 132
    const v1, 0x7f0d0024

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/UniverseBackground;->mFlingGestureMaxXVelocityPx:F

    .line 133
    return-void
.end method

.method private sendUniverseTransform()V
    .locals 10

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v0}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 150
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mSession:Landroid/view/IWindowSession;

    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v2

    iget-object v3, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    iget-object v4, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v5, 0x5

    aget v4, v4, v5

    iget-object v5, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v6, 0x0

    aget v5, v5, v6

    iget-object v6, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    iget-object v7, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v8, 0x1

    aget v7, v7, v8

    iget-object v8, p0, Lcom/android/systemui/UniverseBackground;->mTmpFloats:[F

    const/4 v9, 0x4

    aget v8, v8, v9

    invoke-interface/range {v0 .. v8}, Landroid/view/IWindowSession;->setUniverseTransform(Landroid/os/IBinder;FFFFFFF)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private trackMovement(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 389
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 390
    return-void
.end method

.method private updateUniverseScale()V
    .locals 6

    .prologue
    .line 214
    iget v3, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    if-lez v3, :cond_1

    .line 215
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getWidth()I

    move-result v2

    .line 216
    .local v2, w:I
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getHeight()I

    move-result v0

    .line 217
    .local v0, h:I
    iget v3, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    sub-int v3, v0, v3

    int-to-float v3, v3

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    int-to-float v4, v0

    div-float v1, v3, v4

    .line 218
    .local v1, scale:F
    iget-object v3, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    div-int/lit8 v4, v2, 0x2

    int-to-float v4, v4

    int-to-float v5, v0

    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 221
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->sendUniverseTransform()V

    .line 222
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_0

    .line 223
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/systemui/UniverseBackground;->setVisibility(I)V

    .line 233
    .end local v0           #h:I
    .end local v1           #scale:F
    .end local v2           #w:I
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    iget-object v3, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->clear()V

    .line 228
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->sendUniverseTransform()V

    .line 229
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getVisibility()I

    move-result v3

    if-nez v3, :cond_0

    .line 230
    const/16 v3, 0x8

    invoke-virtual {p0, v3}, Lcom/android/systemui/UniverseBackground;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public animateCollapse()V
    .locals 1

    .prologue
    .line 182
    const/high16 v0, 0x3f80

    invoke-virtual {p0, v0}, Lcom/android/systemui/UniverseBackground;->animateCollapse(F)V

    .line 183
    return-void
.end method

.method public animateCollapse(F)V
    .locals 4
    .parameter "velocityMultiplier"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 195
    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    .line 196
    iget-boolean v1, p0, Lcom/android/systemui/UniverseBackground;->mExpandedVisible:Z

    if-nez v1, :cond_0

    .line 211
    :goto_0
    return-void

    .line 201
    :cond_0
    iget-boolean v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    if-eqz v1, :cond_1

    .line 202
    iget v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    float-to-int v0, v1

    .line 208
    .local v0, y:I
    :goto_1
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mExpanded:Z

    .line 209
    invoke-virtual {p0, v0, v2}, Lcom/android/systemui/UniverseBackground;->prepareTracking(IZ)V

    .line 210
    iget v1, p0, Lcom/android/systemui/UniverseBackground;->mSelfCollapseVelocityPx:F

    neg-float v1, v1

    mul-float/2addr v1, p1

    invoke-virtual {p0, v0, v1, v3}, Lcom/android/systemui/UniverseBackground;->performFling(IFZ)V

    goto :goto_0

    .line 204
    .end local v0           #y:I
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .restart local v0       #y:I
    goto :goto_1
.end method

.method public consumeEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .parameter "event"

    .prologue
    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 393
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    if-nez v6, :cond_1

    .line 394
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v6

    const/4 v7, 0x5

    if-ne v6, v7, :cond_0

    .line 396
    invoke-direct {p0, p1}, Lcom/android/systemui/UniverseBackground;->computeAveragePos(Landroid/view/MotionEvent;)V

    .line 397
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mAverageX:F

    iput v6, p0, Lcom/android/systemui/UniverseBackground;->mDragStartX:F

    .line 398
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mAverageY:F

    iput v6, p0, Lcom/android/systemui/UniverseBackground;->mDragStartY:F

    .line 399
    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 400
    iget-object v6, p0, Lcom/android/systemui/UniverseBackground;->mUniverseTransform:Landroid/view/animation/Transformation;

    invoke-virtual {v6}, Landroid/view/animation/Transformation;->clear()V

    .line 401
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->sendUniverseTransform()V

    .line 402
    invoke-virtual {p0, v5}, Lcom/android/systemui/UniverseBackground;->setVisibility(I)V

    .line 403
    iput v4, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    .line 404
    iget v5, p0, Lcom/android/systemui/UniverseBackground;->mDragStartY:F

    float-to-int v5, v5

    invoke-virtual {p0, v5, v4}, Lcom/android/systemui/UniverseBackground;->prepareTracking(IZ)V

    .line 405
    iget-object v5, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->clear()V

    .line 406
    invoke-direct {p0, p1}, Lcom/android/systemui/UniverseBackground;->trackMovement(Landroid/view/MotionEvent;)V

    .line 456
    :goto_0
    return v4

    :cond_0
    move v4, v5

    .line 409
    goto :goto_0

    .line 412
    :cond_1
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    if-ne v6, v4, :cond_9

    .line 413
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v6

    if-eq v6, v4, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_7

    .line 415
    :cond_2
    iget-object v6, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v7, 0x3e8

    invoke-virtual {v6, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 416
    invoke-direct {p0, p1}, Lcom/android/systemui/UniverseBackground;->computeAveragePos(Landroid/view/MotionEvent;)V

    .line 418
    iget-object v6, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    .line 419
    .local v3, yVel:F
    cmpg-float v6, v3, v8

    if-gez v6, :cond_6

    move v0, v4

    .line 421
    .local v0, negative:Z
    :goto_1
    iget-object v6, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .line 422
    .local v2, xVel:F
    cmpg-float v6, v2, v8

    if-gez v6, :cond_3

    .line 423
    neg-float v2, v2

    .line 425
    :cond_3
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mFlingGestureMaxXVelocityPx:F

    cmpl-float v6, v2, v6

    if-lez v6, :cond_4

    .line 426
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mFlingGestureMaxXVelocityPx:F

    .line 429
    :cond_4
    float-to-double v6, v3

    float-to-double v8, v2

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    double-to-float v1, v6

    .line 430
    .local v1, vel:F
    if-eqz v0, :cond_5

    .line 431
    neg-float v1, v1

    .line 442
    :cond_5
    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mAverageY:F

    float-to-int v6, v6

    invoke-virtual {p0, v6, v1, v5}, Lcom/android/systemui/UniverseBackground;->performFling(IFZ)V

    .line 443
    const/4 v5, 0x2

    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    goto :goto_0

    .end local v0           #negative:Z
    .end local v1           #vel:F
    .end local v2           #xVel:F
    :cond_6
    move v0, v5

    .line 419
    goto :goto_1

    .line 447
    .end local v3           #yVel:F
    :cond_7
    invoke-direct {p0, p1}, Lcom/android/systemui/UniverseBackground;->computeAveragePos(Landroid/view/MotionEvent;)V

    .line 448
    iget v5, p0, Lcom/android/systemui/UniverseBackground;->mAverageY:F

    iget v6, p0, Lcom/android/systemui/UniverseBackground;->mDragStartY:F

    sub-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 449
    iget v5, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v6

    if-le v5, v6, :cond_8

    .line 450
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v5

    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 452
    :cond_8
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->updateUniverseScale()V

    goto :goto_0

    :cond_9
    move v4, v5

    .line 456
    goto :goto_0
.end method

.method doAnimation(J)V
    .locals 4
    .parameter "frameTimeNanos"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 245
    iget-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/UniverseBackground;->incrementAnim(J)V

    .line 253
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mClosing:Z

    if-nez v0, :cond_1

    .line 255
    iput-boolean v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    .line 256
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 257
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->updateUniverseScale()V

    .line 258
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mExpanded:Z

    .line 259
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 263
    :cond_1
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mClosing:Z

    if-eqz v0, :cond_2

    .line 265
    iput-boolean v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    .line 266
    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 267
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->updateUniverseScale()V

    .line 268
    iput-boolean v2, p0, Lcom/android/systemui/UniverseBackground;->mExpanded:Z

    .line 269
    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mState:I

    goto :goto_0

    .line 273
    :cond_2
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    float-to-int v0, v0

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mYDelta:I

    .line 274
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->updateUniverseScale()V

    .line 275
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    iget-object v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimationCallback:Ljava/lang/Runnable;

    const/4 v2, 0x0

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->getLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getLayoutParams()Landroid/view/WindowManager$LayoutParams;
    .locals 6

    .prologue
    const/4 v1, -0x1

    .line 160
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/16 v3, 0x7e9

    const v4, 0x800120

    move v2, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 169
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    invoke-static {}, Landroid/app/ActivityManager;->isHighEndGfx()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v2, 0x100

    or-int/2addr v1, v2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 172
    :cond_0
    const-string v1, "UniverseBackground"

    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 173
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 174
    return-object v0
.end method

.method incrementAnim(J)V
    .locals 10
    .parameter "frameTimeNanos"

    .prologue
    .line 287
    iget-wide v6, p0, Lcom/android/systemui/UniverseBackground;->mAnimLastTimeNanos:J

    sub-long v6, p1, v6

    const-wide/16 v8, 0x0

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 288
    .local v1, deltaNanos:J
    long-to-float v6, v1

    const v7, 0x3089705f

    mul-float v3, v6, v7

    .line 289
    .local v3, t:F
    iget v5, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    .line 290
    .local v5, y:F
    iget v4, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    .line 291
    .local v4, v:F
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 292
    .local v0, a:F
    mul-float v6, v4, v3

    add-float/2addr v6, v5

    const/high16 v7, 0x3f00

    mul-float/2addr v7, v0

    mul-float/2addr v7, v3

    mul-float/2addr v7, v3

    add-float/2addr v6, v7

    iput v6, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    .line 293
    mul-float v6, v0, v3

    add-float/2addr v6, v4

    iput v6, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    .line 294
    iput-wide p1, p0, Lcom/android/systemui/UniverseBackground;->mAnimLastTimeNanos:J

    .line 297
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 116
    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->loadDimens()V

    .line 117
    return-void
.end method

.method performFling(IFZ)V
    .locals 8
    .parameter "y"
    .parameter "vel"
    .parameter "always"

    .prologue
    const/4 v7, 0x0

    const/4 v0, 0x0

    const/high16 v6, 0x3f80

    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 327
    iput-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimatingReveal:Z

    .line 329
    int-to-float v2, p1

    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    .line 330
    iput p2, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    .line 334
    iget-boolean v2, p0, Lcom/android/systemui/UniverseBackground;->mExpanded:Z

    if-eqz v2, :cond_4

    .line 335
    if-nez p3, :cond_3

    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mFlingCollapseMinVelocityPx:F

    cmpl-float v2, p2, v2

    if-gtz v2, :cond_0

    int-to-float v2, p1

    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/android/systemui/UniverseBackground;->mCollapseMinDisplayFraction:F

    sub-float v4, v6, v4

    mul-float/2addr v3, v4

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mFlingExpandMinVelocityPx:F

    neg-float v2, v2

    cmpl-float v2, p2, v2

    if-lez v2, :cond_3

    .line 341
    :cond_0
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mExpandAccelPx:F

    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 342
    cmpg-float v2, p2, v5

    if-gez v2, :cond_1

    .line 343
    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    .line 377
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->resetLastAnimTime()V

    .line 378
    iput-boolean v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    .line 379
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    cmpg-float v2, v2, v5

    if-gez v2, :cond_2

    move v0, v1

    :cond_2
    iput-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mClosing:Z

    .line 380
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    iget-object v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimationCallback:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2, v7}, Landroid/view/Choreographer;->removeCallbacks(ILjava/lang/Runnable;Ljava/lang/Object;)V

    .line 382
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    iget-object v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimationCallback:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2, v7}, Landroid/view/Choreographer;->postCallback(ILjava/lang/Runnable;Ljava/lang/Object;)V

    .line 385
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->stopTracking()V

    .line 386
    return-void

    .line 348
    :cond_3
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mCollapseAccelPx:F

    neg-float v2, v2

    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 349
    cmpl-float v2, p2, v5

    if-lez v2, :cond_1

    .line 350
    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    goto :goto_0

    .line 354
    :cond_4
    if-nez p3, :cond_5

    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mFlingExpandMinVelocityPx:F

    cmpl-float v2, p2, v2

    if-gtz v2, :cond_5

    int-to-float v2, p1

    invoke-direct {p0}, Lcom/android/systemui/UniverseBackground;->getExpandedViewMaxHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/android/systemui/UniverseBackground;->mExpandMinDisplayFraction:F

    sub-float v4, v6, v4

    mul-float/2addr v3, v4

    cmpl-float v2, v2, v3

    if-lez v2, :cond_6

    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mFlingCollapseMinVelocityPx:F

    neg-float v2, v2

    cmpl-float v2, p2, v2

    if-lez v2, :cond_6

    .line 360
    :cond_5
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mExpandAccelPx:F

    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 361
    cmpg-float v2, p2, v5

    if-gez v2, :cond_1

    .line 362
    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    goto :goto_0

    .line 368
    :cond_6
    iget v2, p0, Lcom/android/systemui/UniverseBackground;->mCollapseAccelPx:F

    neg-float v2, v2

    iput v2, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 369
    cmpl-float v2, p2, v5

    if-lez v2, :cond_1

    .line 370
    iput v5, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    goto :goto_0
.end method

.method prepareTracking(IZ)V
    .locals 4
    .parameter "y"
    .parameter "opening"

    .prologue
    const/4 v3, 0x1

    .line 304
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mTracking:Z

    .line 305
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 306
    if-eqz p2, :cond_0

    .line 307
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mExpandAccelPx:F

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimAccel:F

    .line 308
    iget v0, p0, Lcom/android/systemui/UniverseBackground;->mFlingExpandMinVelocityPx:F

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimVel:F

    .line 309
    int-to-float v0, p1

    iput v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimY:F

    .line 310
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    .line 311
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mAnimatingReveal:Z

    .line 312
    invoke-virtual {p0}, Lcom/android/systemui/UniverseBackground;->resetLastAnimTime()V

    .line 313
    iput-boolean v3, p0, Lcom/android/systemui/UniverseBackground;->mExpandedVisible:Z

    .line 315
    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    if-eqz v0, :cond_1

    .line 316
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimating:Z

    .line 317
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mChoreographer:Landroid/view/Choreographer;

    iget-object v1, p0, Lcom/android/systemui/UniverseBackground;->mAnimationCallback:Ljava/lang/Runnable;

    const/4 v2, 0x0

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/Choreographer;->removeCallbacks(ILjava/lang/Runnable;Ljava/lang/Object;)V

    .line 320
    :cond_1
    return-void
.end method

.method resetLastAnimTime()V
    .locals 2

    .prologue
    .line 236
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/UniverseBackground;->mAnimLastTimeNanos:J

    .line 242
    return-void
.end method

.method stopTracking()V
    .locals 1

    .prologue
    .line 281
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/UniverseBackground;->mTracking:Z

    .line 282
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 283
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/UniverseBackground;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 284
    return-void
.end method
