.class public Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;
.super Ljava/lang/Object;
.source "KeyguardViewStateManager.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout$OnChallengeScrolledListener;
.implements Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;


# static fields
.field private static final SCREEN_ON_HINT_DURATION:I = 0x3e8

.field private static final SCREEN_ON_RING_HINT_DELAY:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "KeyguardViewStateManager"

.field static final TRANSPORT_GONE:I = 0x0

.field static final TRANSPORT_INVISIBLE:I = 0x1

.field static final TRANSPORT_VISIBLE:I = 0x2


# instance fields
.field private mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

.field mChallengeTop:I

.field private mCurrentPage:I

.field private mHideHintsRunnable:Ljava/lang/Runnable;

.field private mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

.field private mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

.field private mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

.field mLastScrollState:I

.field mMainQueue:Landroid/os/Handler;

.field private mPageIndexOnPageBeginMoving:I

.field private mPageListeningToSlider:I

.field private mTmpLoc:[I

.field private mTmpPoint:[I

.field private mTransportState:I


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;)V
    .locals 4
    .parameter "hostView"

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpPoint:[I

    .line 33
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    .line 38
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mMainQueue:Landroid/os/Handler;

    .line 45
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTransportState:I

    .line 47
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mLastScrollState:I

    .line 50
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    .line 51
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    .line 52
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageIndexOnPageBeginMoving:I

    .line 54
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeTop:I

    .line 295
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mHideHintsRunnable:Ljava/lang/Runnable;

    .line 57
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;)Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    return-object v0
.end method

.method private getChallengeTopRelativeToFrame(Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;I)I
    .locals 3
    .parameter "frame"
    .parameter "top"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 183
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpPoint:[I

    aput v1, v0, v1

    .line 184
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpPoint:[I

    aput p2, v0, v2

    .line 185
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpPoint:[I

    invoke-direct {p0, v0, p1, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mapPoint(Landroid/view/View;Landroid/view/View;[I)V

    .line 186
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpPoint:[I

    aget v0, v0, v2

    return v0
.end method

.method private mapPoint(Landroid/view/View;Landroid/view/View;[I)V
    .locals 8
    .parameter "fromView"
    .parameter "toView"
    .parameter "pt"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 198
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    invoke-virtual {p1, v4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 200
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    aget v2, v4, v6

    .line 201
    .local v2, x:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    aget v3, v4, v7

    .line 203
    .local v3, y:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    invoke-virtual {p2, v4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 204
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    aget v0, v4, v6

    .line 205
    .local v0, vX:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTmpLoc:[I

    aget v1, v4, v7

    .line 207
    .local v1, vY:I
    aget v4, p3, v6

    sub-int v5, v2, v0

    add-int/2addr v4, v5

    aput v4, p3, v6

    .line 208
    aget v4, p3, v7

    sub-int v5, v3, v1

    add-int/2addr v4, v5

    aput v4, p3, v7

    .line 209
    return-void
.end method

.method private updateEdgeSwiping()V
    .locals 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeOverlapping()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->setOnlyAllowEdgeSwipes(Z)V

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->setOnlyAllowEdgeSwipes(Z)V

    goto :goto_0
.end method

.method private userActivity()V
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;->onUserActivityTimeoutChanged()V

    .line 214
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;->userActivity()V

    .line 216
    :cond_0
    return-void
.end method


# virtual methods
.method public fadeInSecurity(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 111
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 112
    return-void
.end method

.method public fadeOutSecurity(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 108
    return-void
.end method

.method public getTransportState()I
    .locals 1

    .prologue
    .line 323
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTransportState:I

    return v0
.end method

.method public isBouncing()Z
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isBouncing()Z

    move-result v0

    return v0
.end method

.method public isChallengeOverlapping()Z
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeOverlapping()Z

    move-result v0

    .line 91
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isChallengeShowing()Z
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeShowing()Z

    move-result v0

    .line 84
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBouncerStateChanged(Z)V
    .locals 2
    .parameter "bouncerActive"

    .prologue
    .line 329
    if-eqz p1, :cond_1

    .line 330
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->zoomOutToBouncer()V

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 332
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->zoomInFromBouncer()V

    .line 333
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    if-eqz v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;->setOnDismissAction(Lcom/android/internal/policy/impl/keyguard/KeyguardHostView$OnDismissAction;)V

    goto :goto_0
.end method

.method public onPageBeginMoving()V
    .locals 3

    .prologue
    .line 115
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeOverlapping()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    instance-of v1, v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    if-eqz v1, :cond_0

    .line 117
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    .line 118
    .local v0, scl:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;
    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->fadeOutChallenge()V

    .line 119
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getCurrentPage()I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageIndexOnPageBeginMoving:I

    .line 124
    .end local v0           #scl:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    if-eqz v1, :cond_1

    .line 125
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;->clearAppWidgetToShow()V

    .line 126
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardHostView:Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardHostView;->setOnDismissAction(Lcom/android/internal/policy/impl/keyguard/KeyguardHostView$OnDismissAction;)V

    .line 128
    :cond_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mHideHintsRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_2

    .line 129
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mMainQueue:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mHideHintsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 133
    :cond_2
    return-void
.end method

.method public onPageEndMoving()V
    .locals 1

    .prologue
    .line 136
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageIndexOnPageBeginMoving:I

    .line 137
    return-void
.end method

.method public onPageSwitched(Landroid/view/View;I)V
    .locals 5
    .parameter "newPage"
    .parameter "newPageIndex"

    .prologue
    .line 162
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    if-ne v3, p2, :cond_0

    .line 180
    :goto_0
    return-void

    .line 164
    :cond_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    if-eqz v3, :cond_2

    .line 165
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    invoke-virtual {v3, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetPageAt(I)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;

    move-result-object v2

    .line 166
    .local v2, prevPage:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    if-eqz v2, :cond_1

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    if-eq v3, v4, :cond_1

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetToResetOnPageFadeOut()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 168
    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->resetSize()V

    .line 171
    :cond_1
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v3, p2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetPageAt(I)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;

    move-result-object v1

    .line 172
    .local v1, newCurPage:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v3}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeOverlapping()Z

    move-result v0

    .line 173
    .local v0, challengeOverlapping:Z
    if-eqz v0, :cond_2

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->isSmall()Z

    move-result v3

    if-nez v3, :cond_2

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    if-eq v3, p2, :cond_2

    .line 175
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->shrinkWidget()V

    .line 179
    .end local v0           #challengeOverlapping:Z
    .end local v1           #newCurPage:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    .end local v2           #prevPage:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    :cond_2
    iput p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mCurrentPage:I

    goto :goto_0
.end method

.method public onPageSwitching(Landroid/view/View;I)V
    .locals 5
    .parameter "newPage"
    .parameter "newPageIndex"

    .prologue
    const/4 v4, -0x1

    .line 140
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    instance-of v2, v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    if-eqz v2, :cond_0

    .line 141
    instance-of v0, p1, Lcom/android/internal/policy/impl/keyguard/CameraWidgetFrame;

    .line 142
    .local v0, isCameraPage:Z
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    check-cast v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    if-nez v0, :cond_2

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->setChallengeInteractive(Z)V

    .line 147
    .end local v0           #isCameraPage:Z
    :cond_0
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageIndexOnPageBeginMoving:I

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getNextPage()I

    move-result v3

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    instance-of v2, v2, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    if-eqz v2, :cond_1

    .line 149
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;

    .line 150
    .local v1, scl:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;->fadeInChallenge()V

    .line 151
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v2, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->setWidgetToResetOnPageFadeOut(I)V

    .line 153
    .end local v1           #scl:Lcom/android/internal/policy/impl/keyguard/SlidingChallengeLayout;
    :cond_1
    iput v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageIndexOnPageBeginMoving:I

    .line 154
    return-void

    .line 142
    .restart local v0       #isCameraPage:Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public onScrollPositionChanged(FI)V
    .locals 3
    .parameter "scrollPosition"
    .parameter "challengeTop"

    .prologue
    .line 288
    iput p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeTop:I

    .line 289
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetPageAt(I)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;

    move-result-object v0

    .line 290
    .local v0, frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    if-eqz v0, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mLastScrollState:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    .line 291
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeTop:I

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->getChallengeTopRelativeToFrame(Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->adjustFrame(I)V

    .line 293
    :cond_0
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 5
    .parameter "scrollState"

    .prologue
    const/4 v4, 0x3

    .line 220
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    if-nez v2, :cond_1

    .line 284
    :cond_0
    :goto_0
    return-void

    .line 222
    :cond_1
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v2}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeOverlapping()Z

    move-result v0

    .line 224
    .local v0, challengeOverlapping:Z
    if-nez p1, :cond_8

    .line 225
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetPageAt(I)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;

    move-result-object v1

    .line 226
    .local v1, frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    if-eqz v1, :cond_0

    .line 228
    if-nez v0, :cond_2

    .line 229
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->isPageMoving()Z

    move-result v2

    if-nez v2, :cond_6

    .line 230
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->resetSize()V

    .line 231
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->userActivity()V

    .line 236
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->isSmall()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 239
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->getSmallFrameHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->setFrameHeight(I)V

    .line 241
    :cond_3
    if-eq p1, v4, :cond_4

    .line 242
    invoke-virtual {v1, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->hideFrame(Ljava/lang/Object;)V

    .line 244
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->updateEdgeSwiping()V

    .line 246
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v2}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isChallengeShowing()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 247
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;->onResume(I)V

    .line 251
    :goto_2
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    .line 283
    .end local v1           #frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    :cond_5
    :goto_3
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mLastScrollState:I

    goto :goto_0

    .line 233
    .restart local v1       #frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    :cond_6
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->setWidgetToResetOnPageFadeOut(I)V

    goto :goto_1

    .line 249
    :cond_7
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    invoke-interface {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;->onPause()V

    goto :goto_2

    .line 252
    .end local v1           #frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    :cond_8
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mLastScrollState:I

    if-nez v2, :cond_5

    .line 256
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getNextPage()I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    .line 257
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getWidgetPageAt(I)Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;

    move-result-object v1

    .line 258
    .restart local v1       #frame:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;
    if-eqz v1, :cond_0

    .line 261
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v2}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->isBouncing()Z

    move-result v2

    if-nez v2, :cond_b

    .line 262
    if-eq p1, v4, :cond_9

    .line 263
    invoke-virtual {v1, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->showFrame(Ljava/lang/Object;)V

    .line 268
    :cond_9
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->isSmall()Z

    move-result v2

    if-nez v2, :cond_a

    .line 270
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getNextPage()I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    .line 271
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->shrinkWidget(Z)V

    .line 281
    :cond_a
    :goto_4
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    invoke-interface {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;->onPause()V

    goto :goto_3

    .line 274
    :cond_b
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetFrame;->isSmall()Z

    move-result v2

    if-nez v2, :cond_a

    .line 276
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->getNextPage()I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mPageListeningToSlider:I

    goto :goto_4
.end method

.method public setChallengeLayout(Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;)V
    .locals 0
    .parameter "layout"

    .prologue
    .line 66
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    .line 67
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->updateEdgeSwiping()V

    .line 68
    return-void
.end method

.method public setPagedView(Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;)V
    .locals 0
    .parameter "pagedView"

    .prologue
    .line 61
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    .line 62
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->updateEdgeSwiping()V

    .line 63
    return-void
.end method

.method public setSecurityViewContainer(Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;)V
    .locals 0
    .parameter "container"

    .prologue
    .line 95
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardSecurityContainer:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;

    .line 96
    return-void
.end method

.method public setTransportState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 319
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mTransportState:I

    .line 320
    return-void
.end method

.method public showBouncer(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mChallengeLayout:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;->showBouncer()V

    .line 100
    return-void
.end method

.method public showUsabilityHints()V
    .locals 4

    .prologue
    .line 306
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mMainQueue:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager$2;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager$2;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 312
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mKeyguardWidgetPager:Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardWidgetPager;->showInitialPageHints()V

    .line 313
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mHideHintsRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mMainQueue:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewStateManager;->mHideHintsRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 316
    :cond_0
    return-void
.end method
