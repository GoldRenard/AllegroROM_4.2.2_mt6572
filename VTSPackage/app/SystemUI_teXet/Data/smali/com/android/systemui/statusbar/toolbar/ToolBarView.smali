.class public Lcom/android/systemui/statusbar/toolbar/ToolBarView;
.super Landroid/view/ViewGroup;
.source "ToolBarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;,
        Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;,
        Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;
    }
.end annotation


# static fields
.field private static final BASELINE_FLING_VELOCITY:F = 2500.0f

.field private static final DEBUG:Z = true

.field private static final FLING_VELOCITY_INFLUENCE:F = 0.4f

.field private static final INVALID_POINTER:I = -0x1

.field private static final INVALID_SCREEN:I = -0x1

.field private static final SNAP_VELOCITY:I = 0x258

.field private static final TAG:Ljava/lang/String; = "ToolBarView"

.field private static final TOUCH_STATE_REST:I = 0x0

.field private static final TOUCH_STATE_SCROLLING:I = 0x1


# instance fields
.field private mActivePointerId:I

.field private mAllowLongPress:Z

.field private mCurrentScreen:I

.field private mDefaultScreen:I

.field private mDisplay:Landroid/view/Display;

.field private mFirstLayout:Z

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mIsUpdated:Z

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mMaximumVelocity:I

.field private mNextScreen:I

.field private mOverscrollDistance:I

.field private mScrollInterpolator:Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

.field private mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

.field private mScroller:Landroid/widget/Scroller;

.field public mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

.field private mStatusBarService:Lcom/android/systemui/statusbar/BaseStatusBar;

.field private mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

.field private mToolBarSwitchPanel:Landroid/view/View;

.field private mTouchSlop:I

.field private mTouchState:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x1

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 107
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mFirstLayout:Z

    .line 43
    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    .line 51
    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    .line 52
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    .line 53
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIsUpdated:Z

    .line 57
    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 803
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$3;-><init>(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 108
    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    .line 109
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDisplay:Landroid/view/Display;

    .line 110
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setHapticFeedbackEnabled(Z)V

    .line 111
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->initWorkspace()V

    .line 112
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)Landroid/content/BroadcastReceiver;
    .registers 2
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setUpdate()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateForSimReady()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateForSimNameUpdate()V

    return-void
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .registers 3
    .parameter "ev"

    .prologue
    .line 600
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_a

    .line 601
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 603
    :cond_a
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 604
    return-void
.end method

.method private initWorkspace()V
    .registers 5

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 151
    .local v1, context:Landroid/content/Context;
    new-instance v2, Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

    invoke-direct {v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollInterpolator:Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

    .line 152
    new-instance v2, Landroid/widget/Scroller;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollInterpolator:Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

    invoke-direct {v2, v1, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    .line 153
    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    iput v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    .line 154
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 155
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchSlop:I

    .line 156
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v2

    iput v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mMaximumVelocity:I

    .line 157
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledOverscrollDistance()I

    move-result v2

    iput v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mOverscrollDistance:I

    .line 158
    return-void
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .registers 7
    .parameter "ev"

    .prologue
    .line 448
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const v4, 0xff00

    and-int/2addr v3, v4

    shr-int/lit8 v2, v3, 0x8

    .line 450
    .local v2, pointerIndex:I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 451
    .local v1, pointerId:I
    iget v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    if-ne v1, v3, :cond_30

    .line 454
    if-nez v2, :cond_31

    const/4 v0, 0x1

    .line 455
    .local v0, newPointerIndex:I
    :goto_15
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    .line 456
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionY:F

    .line 457
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 458
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_30

    .line 459
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 462
    .end local v0           #newPointerIndex:I
    :cond_30
    return-void

    .line 454
    :cond_31
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private releaseVelocityTracker()V
    .registers 2

    .prologue
    .line 607
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    .line 608
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 609
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 611
    :cond_c
    return-void
.end method

.method private setUpdate()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 817
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 818
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 819
    const-string v1, "android.intent.action.SIM_NAME_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 820
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 821
    return-void
.end method

.method private snapToScreen(IIZ)V
    .registers 14
    .parameter "whichScreen"
    .parameter "velocity"
    .parameter "settle"

    .prologue
    const/4 v2, 0x0

    .line 618
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 619
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->enableChildrenCache(II)V

    .line 620
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    .line 621
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    invoke-interface {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;->onScrollFinish(I)V

    .line 623
    const-string v0, "ToolBarView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "snapToScreen  mNextScreen is "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v4, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getFocusedChild()Landroid/view/View;

    move-result-object v6

    .line 627
    .local v6, focusedChild:Landroid/view/View;
    if-eqz v6, :cond_4c

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    if-eq p1, v0, :cond_4c

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-ne v6, v0, :cond_4c

    .line 629
    invoke-virtual {v6}, Landroid/view/View;->clearFocus()V

    .line 632
    :cond_4c
    const/4 v0, 0x1

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    sub-int v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 633
    .local v8, screenDelta:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getWidth()I

    move-result v0

    mul-int v7, p1, v0

    .line 634
    .local v7, newX:I
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    sub-int v3, v7, v0

    .line 635
    .local v3, delta:I
    add-int/lit8 v0, v8, 0x1

    mul-int/lit8 v5, v0, 0x64

    .line 637
    .local v5, duration:I
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_74

    .line 638
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 641
    :cond_74
    if-eqz p3, :cond_b5

    .line 642
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollInterpolator:Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

    invoke-virtual {v0, v8}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;->setDistance(I)V

    .line 647
    :goto_7b
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 648
    if-lez p2, :cond_bb

    .line 649
    int-to-float v0, v5

    int-to-float v1, v5

    int-to-float v4, p2

    const v9, 0x451c4000

    div-float/2addr v4, v9

    div-float/2addr v1, v4

    const v4, 0x3ecccccd

    mul-float/2addr v1, v4

    add-float/2addr v0, v1

    float-to-int v5, v0

    .line 653
    :goto_8f
    invoke-virtual {p0, v5}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->awakenScrollBars(I)Z

    .line 654
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 658
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_b1

    .line 659
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    .line 661
    :cond_b1
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->invalidate()V

    .line 662
    return-void

    .line 644
    :cond_b5
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollInterpolator:Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$WorkspaceOvershootInterpolator;->disableSettle()V

    goto :goto_7b

    .line 651
    :cond_bb
    add-int/lit8 v5, v5, 0x64

    goto :goto_8f
.end method

.method private updateForSimNameUpdate()V
    .registers 1

    .prologue
    .line 833
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateForSimReady()V

    .line 834
    return-void
.end method

.method private updateForSimReady()V
    .registers 2

    .prologue
    .line 824
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 825
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimInfo()V

    .line 826
    return-void
.end method


# virtual methods
.method public allowLongPress()Z
    .registers 2

    .prologue
    .line 722
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    return v0
.end method

.method clearChildrenCache()V
    .registers 5

    .prologue
    .line 508
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    .line 509
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_5
    if-ge v1, v0, :cond_14

    .line 510
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 511
    .local v2, layout:Landroid/view/ViewGroup;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setDrawingCacheEnabled(Z)V

    .line 509
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 513
    .end local v2           #layout:Landroid/view/ViewGroup;
    :cond_14
    return-void
.end method

.method public computeScroll()V
    .registers 5

    .prologue
    const/4 v3, -0x1

    .line 274
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 275
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    .line 276
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollY:I

    .line 277
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->postInvalidate()V

    .line 287
    :cond_1c
    :goto_1c
    return-void

    .line 278
    :cond_1d
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    if-eq v0, v3, :cond_1c

    .line 279
    const/4 v0, 0x0

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    .line 281
    const-string v0, "ToolBarView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "computeScroll  mCurrentScreen is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-interface {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;->onScrollFinish(I)V

    .line 284
    iput v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    .line 285
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->clearChildrenCache()V

    goto :goto_1c
.end method

.method public dismissDialogs()V
    .registers 2

    .prologue
    .line 793
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->dismissDialogs()V

    .line 794
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 13
    .parameter "canvas"

    .prologue
    const/4 v2, 0x1

    .line 291
    const/4 v4, 0x0

    .line 292
    .local v4, restore:Z
    const/4 v5, 0x0

    .line 297
    .local v5, restoreCount:I
    iget v8, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    if-eq v8, v2, :cond_21

    iget v8, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_21

    .line 299
    .local v2, fastDraw:Z
    :goto_c
    if-eqz v2, :cond_23

    .line 300
    iget v8, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v8}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getDrawingTime()J

    move-result-wide v9

    invoke-virtual {p0, p1, v8, v9, v10}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 314
    :cond_1b
    :goto_1b
    if-eqz v4, :cond_20

    .line 315
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 317
    :cond_20
    return-void

    .line 297
    .end local v2           #fastDraw:Z
    :cond_21
    const/4 v2, 0x0

    goto :goto_c

    .line 302
    .restart local v2       #fastDraw:Z
    :cond_23
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getDrawingTime()J

    move-result-wide v0

    .line 303
    .local v0, drawingTime:J
    iget v8, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float v7, v8, v9

    .line 304
    .local v7, scrollPos:F
    float-to-int v3, v7

    .line 305
    .local v3, leftScreen:I
    add-int/lit8 v6, v3, 0x1

    .line 306
    .local v6, rightScreen:I
    if-ltz v3, :cond_3d

    .line 307
    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {p0, p1, v8, v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 309
    :cond_3d
    int-to-float v8, v3

    cmpl-float v8, v7, v8

    if-eqz v8, :cond_1b

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v8

    if-ge v6, v8, :cond_1b

    .line 310
    invoke-virtual {p0, v6}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {p0, p1, v8, v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    goto :goto_1b
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 365
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method enableChildrenCache(II)V
    .registers 9
    .parameter "fromScreen"
    .parameter "toScreen"

    .prologue
    const/4 v5, 0x1

    .line 492
    if-le p1, p2, :cond_6

    .line 493
    move v3, p1

    .line 494
    .local v3, temp:I
    move p1, p2

    .line 495
    move p2, v3

    .line 497
    .end local v3           #temp:I
    :cond_6
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    .line 498
    .local v0, count:I
    const/4 v4, 0x0

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 499
    add-int/lit8 v4, v0, -0x1

    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 500
    move v1, p1

    .local v1, i:I
    :goto_16
    if-gt v1, p2, :cond_27

    .line 501
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 502
    .local v2, layout:Landroid/view/ViewGroup;
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->setDrawingCacheEnabled(Z)V

    .line 503
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->setDrawingCacheEnabled(Z)V

    .line 500
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 505
    .end local v2           #layout:Landroid/view/ViewGroup;
    :cond_27
    return-void
.end method

.method public focusableViewAvailable(Landroid/view/View;)V
    .registers 6
    .parameter "focused"

    .prologue
    .line 472
    iget v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 473
    .local v0, current:Landroid/view/View;
    move-object v2, p1

    .line 475
    .local v2, v:Landroid/view/View;
    :goto_7
    if-ne v2, v0, :cond_d

    .line 476
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->focusableViewAvailable(Landroid/view/View;)V

    .line 486
    :cond_c
    return-void

    .line 479
    :cond_d
    if-eq v2, p0, :cond_c

    .line 482
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 483
    .local v1, parent:Landroid/view/ViewParent;
    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_c

    .line 484
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .end local v2           #v:Landroid/view/View;
    check-cast v2, Landroid/view/View;

    .restart local v2       #v:Landroid/view/View;
    goto :goto_7
.end method

.method public getCurrentScreen()I
    .registers 2

    .prologue
    .line 243
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    return v0
.end method

.method public getIndicatorCount()I
    .registers 2

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getScreenForView(Landroid/view/View;)I
    .registers 7
    .parameter "v"

    .prologue
    .line 705
    const/4 v2, -0x1

    .line 706
    .local v2, result:I
    if-eqz p1, :cond_18

    .line 707
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 708
    .local v3, vp:Landroid/view/ViewParent;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    .line 709
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_c
    if-ge v1, v0, :cond_18

    .line 710
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-ne v3, v4, :cond_15

    .line 715
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #vp:Landroid/view/ViewParent;
    :goto_14
    return v1

    .line 709
    .restart local v0       #count:I
    .restart local v1       #i:I
    .restart local v3       #vp:Landroid/view/ViewParent;
    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .end local v0           #count:I
    .end local v1           #i:I
    .end local v3           #vp:Landroid/view/ViewParent;
    :cond_18
    move v1, v2

    .line 715
    goto :goto_14
.end method

.method public final getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mStatusBarService:Lcom/android/systemui/statusbar/BaseStatusBar;

    return-object v0
.end method

.method public hideSimSwithPanel()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 195
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setSimSwitchPanleVisibility(Z)V

    .line 196
    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    .line 197
    invoke-virtual {p0, v0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setCurrentScreen(II)V

    .line 198
    return-void
.end method

.method isDefaultScreenShowing()Z
    .registers 3

    .prologue
    .line 235
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isStatusBarExpanded()Z
    .registers 2

    .prologue
    .line 789
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mStatusBarService:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/BaseStatusBar;->isExpanded()Z

    move-result v0

    return v0
.end method

.method public moveToCurrentScreen(I)V
    .registers 3
    .parameter "toolbarwidth"

    .prologue
    .line 743
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setCurrentScreen(II)V

    .line 744
    return-void
.end method

.method public moveToDefaultScreen(Z)V
    .registers 4
    .parameter "animate"

    .prologue
    .line 734
    if-eqz p1, :cond_11

    .line 735
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(I)V

    .line 739
    :goto_7
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 740
    return-void

    .line 737
    :cond_11
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setCurrentScreen(II)V

    goto :goto_7
.end method

.method protected onAttachedToWindow()V
    .registers 4

    .prologue
    .line 320
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 321
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;-><init>(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    const-wide/16 v1, 0xc8

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 328
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->computeScroll()V

    .line 329
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 4

    .prologue
    .line 136
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 137
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;-><init>(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    const-wide/16 v1, 0xc8

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 144
    return-void
.end method

.method public onFinishInflate()V
    .registers 2

    .prologue
    .line 128
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 129
    const v0, 0x7f080122

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    .line 130
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0, p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->setToolBar(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIsUpdated:Z

    .line 132
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 16
    .parameter "ev"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 370
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 371
    .local v0, action:I
    const/4 v10, 0x2

    if-ne v0, v10, :cond_e

    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    if-eqz v10, :cond_e

    .line 444
    :cond_d
    :goto_d
    return v12

    .line 374
    :cond_e
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 375
    and-int/lit16 v10, v0, 0xff

    packed-switch v10, :pswitch_data_a2

    .line 444
    :cond_16
    :goto_16
    :pswitch_16
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    if-nez v10, :cond_d

    move v12, v11

    goto :goto_d

    .line 383
    :pswitch_1c
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    .line 384
    .local v2, pointerIndex:I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 385
    .local v4, x:F
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    .line 386
    .local v7, y:F
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    sub-float v10, v4, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v5, v10

    .line 387
    .local v5, xDiff:I
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionY:F

    sub-float v10, v7, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    float-to-int v8, v10

    .line 389
    .local v8, yDiff:I
    iget v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchSlop:I

    .line 390
    .local v3, touchSlop:I
    if-le v5, v3, :cond_67

    move v6, v12

    .line 391
    .local v6, xMoved:Z
    :goto_41
    if-le v8, v3, :cond_69

    move v9, v12

    .line 393
    .local v9, yMoved:Z
    :goto_44
    if-nez v6, :cond_48

    if-eqz v9, :cond_16

    .line 394
    :cond_48
    if-eqz v6, :cond_57

    .line 396
    iput v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    .line 397
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v10, v10, -0x1

    iget v13, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v13, v13, 0x1

    invoke-virtual {p0, v10, v13}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->enableChildrenCache(II)V

    .line 400
    :cond_57
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    if-eqz v10, :cond_16

    .line 401
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    .line 404
    iget v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0, v10}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 405
    .local v1, currentScreen:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->cancelLongPress()V

    goto :goto_16

    .end local v1           #currentScreen:Landroid/view/View;
    .end local v6           #xMoved:Z
    .end local v9           #yMoved:Z
    :cond_67
    move v6, v11

    .line 390
    goto :goto_41

    .restart local v6       #xMoved:Z
    :cond_69
    move v9, v11

    .line 391
    goto :goto_44

    .line 411
    .end local v2           #pointerIndex:I
    .end local v3           #touchSlop:I
    .end local v4           #x:F
    .end local v5           #xDiff:I
    .end local v6           #xMoved:Z
    .end local v7           #y:F
    .end local v8           #yDiff:I
    :pswitch_6b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 412
    .restart local v4       #x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    .line 414
    .restart local v7       #y:F
    iput v4, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    .line 415
    iput v7, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionY:F

    .line 416
    invoke-virtual {p1, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v10

    iput v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 417
    iput-boolean v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    .line 423
    iget-object v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v10}, Landroid/widget/Scroller;->isFinished()Z

    move-result v10

    if-eqz v10, :cond_8b

    move v10, v11

    :goto_88
    iput v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    goto :goto_16

    :cond_8b
    move v10, v12

    goto :goto_88

    .line 429
    .end local v4           #x:F
    .end local v7           #y:F
    :pswitch_8d
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->clearChildrenCache()V

    .line 430
    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    .line 431
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 432
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    .line 433
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->releaseVelocityTracker()V

    goto/16 :goto_16

    .line 436
    :pswitch_9c
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_16

    .line 375
    nop

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_8d
        :pswitch_1c
        :pswitch_8d
        :pswitch_16
        :pswitch_16
        :pswitch_9c
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .registers 14
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 351
    const/4 v1, 0x0

    .line 352
    .local v1, childLeft:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v3

    .line 353
    .local v3, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_6
    if-ge v4, v3, :cond_26

    .line 354
    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 355
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_23

    .line 356
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 357
    .local v2, childWidth:I
    const/4 v5, 0x0

    add-int v6, v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    invoke-virtual {v0, v1, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 358
    add-int/2addr v1, v2

    .line 353
    .end local v2           #childWidth:I
    :cond_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 361
    .end local v0           #child:Landroid/view/View;
    :cond_26
    return-void
.end method

.method protected onMeasure(II)V
    .registers 9
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v5, 0x0

    .line 333
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 334
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 335
    .local v2, width:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 337
    .local v3, widthMode:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v0

    .line 338
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_11
    if-ge v1, v0, :cond_1d

    .line 339
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Landroid/view/View;->measure(II)V

    .line 338
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 341
    :cond_1d
    iget-boolean v4, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mFirstLayout:Z

    if-eqz v4, :cond_30

    .line 342
    invoke-virtual {p0, v5}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setHorizontalScrollBarEnabled(Z)V

    .line 343
    iget v4, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    mul-int/2addr v4, v2

    invoke-virtual {p0, v4, v5}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->scrollTo(II)V

    .line 344
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setHorizontalScrollBarEnabled(Z)V

    .line 345
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mFirstLayout:Z

    .line 347
    :cond_30
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .parameter "state"

    .prologue
    .line 673
    move-object v0, p1

    check-cast v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;

    .line 674
    .local v0, savedState:Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;
    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 675
    iget v1, v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_13

    .line 676
    iget v1, v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    .line 678
    :cond_13
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .prologue
    .line 666
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 667
    .local v0, state:Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;
    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    iput v1, v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    .line 668
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 15
    .parameter "ev"

    .prologue
    .line 517
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 518
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 519
    .local v0, action:I
    and-int/lit16 v11, v0, 0xff

    packed-switch v11, :pswitch_data_136

    .line 596
    :cond_c
    :goto_c
    :pswitch_c
    const/4 v11, 0x1

    return v11

    .line 522
    :pswitch_e
    iget-object v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v11}, Landroid/widget/Scroller;->isFinished()Z

    move-result v11

    if-nez v11, :cond_1b

    .line 523
    iget-object v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v11}, Landroid/widget/Scroller;->abortAnimation()V

    .line 526
    :cond_1b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    .line 527
    const/4 v11, 0x0

    invoke-virtual {p1, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v11

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 528
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_c

    .line 529
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v11, v11, -0x1

    iget v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {p0, v11, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->enableChildrenCache(II)V

    goto :goto_c

    .line 533
    :pswitch_39
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_c

    .line 535
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    invoke-virtual {p1, v11}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    .line 536
    .local v4, pointerIndex:I
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    .line 537
    .local v10, x:F
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    sub-float v3, v11, v10

    .line 538
    .local v3, deltaX:F
    iput v10, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mLastMotionX:F

    .line 540
    const/4 v11, 0x0

    cmpg-float v11, v3, v11

    if-gez v11, :cond_67

    .line 541
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    iget v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mOverscrollDistance:I

    add-int v1, v11, v12

    .line 542
    .local v1, availableToScroll:I
    if-lez v1, :cond_c

    .line 543
    neg-int v11, v1

    int-to-float v11, v11

    invoke-static {v11, v3}, Ljava/lang/Math;->max(FF)F

    move-result v11

    float-to-int v11, v11

    const/4 v12, 0x0

    invoke-virtual {p0, v11, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->scrollBy(II)V

    goto :goto_c

    .line 545
    .end local v1           #availableToScroll:I
    :cond_67
    const/4 v11, 0x0

    cmpl-float v11, v3, v11

    if-lez v11, :cond_94

    .line 546
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {p0, v11}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getRight()I

    move-result v11

    iget v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    sub-int/2addr v11, v12

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getWidth()I

    move-result v12

    sub-int/2addr v11, v12

    iget v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mOverscrollDistance:I

    add-int v1, v11, v12

    .line 548
    .restart local v1       #availableToScroll:I
    if-lez v1, :cond_c

    .line 549
    int-to-float v11, v1

    invoke-static {v11, v3}, Ljava/lang/Math;->min(FF)F

    move-result v11

    float-to-int v11, v11

    const/4 v12, 0x0

    invoke-virtual {p0, v11, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->scrollBy(II)V

    goto/16 :goto_c

    .line 552
    .end local v1           #availableToScroll:I
    :cond_94
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->awakenScrollBars()Z

    goto/16 :goto_c

    .line 557
    .end local v3           #deltaX:F
    .end local v4           #pointerIndex:I
    .end local v10           #x:F
    :pswitch_99
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_d9

    .line 558
    iget-object v7, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 559
    .local v7, velocityTracker:Landroid/view/VelocityTracker;
    const/16 v11, 0x3e8

    iget v12, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mMaximumVelocity:I

    int-to-float v12, v12

    invoke-virtual {v7, v11, v12}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 560
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    invoke-virtual {v7, v11}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v11

    float-to-int v8, v11

    .line 561
    .local v8, velocityX:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getWidth()I

    move-result v5

    .line 562
    .local v5, screenWidth:I
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    div-int/lit8 v12, v5, 0x2

    add-int/2addr v11, v12

    div-int v9, v11, v5

    .line 563
    .local v9, whichScreen:I
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    int-to-float v11, v11

    int-to-float v12, v5

    div-float v6, v11, v12

    .line 564
    .local v6, scrolledPos:F
    const/16 v11, 0x258

    if-le v8, v11, :cond_e7

    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    if-lez v11, :cond_e7

    .line 566
    int-to-float v11, v9

    cmpg-float v11, v6, v11

    if-gez v11, :cond_e4

    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v2, v11, -0x1

    .line 567
    .local v2, bound:I
    :goto_d1
    invoke-static {v9, v2}, Ljava/lang/Math;->min(II)I

    move-result v11

    const/4 v12, 0x1

    invoke-direct {p0, v11, v8, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(IIZ)V

    .line 576
    .end local v2           #bound:I
    .end local v5           #screenWidth:I
    .end local v6           #scrolledPos:F
    .end local v7           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v8           #velocityX:I
    .end local v9           #whichScreen:I
    :cond_d9
    :goto_d9
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    .line 577
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 578
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->releaseVelocityTracker()V

    goto/16 :goto_c

    .line 566
    .restart local v5       #screenWidth:I
    .restart local v6       #scrolledPos:F
    .restart local v7       #velocityTracker:Landroid/view/VelocityTracker;
    .restart local v8       #velocityX:I
    .restart local v9       #whichScreen:I
    :cond_e4
    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    goto :goto_d1

    .line 568
    :cond_e7
    const/16 v11, -0x258

    if-ge v8, v11, :cond_10a

    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-ge v11, v12, :cond_10a

    .line 570
    int-to-float v11, v9

    cmpl-float v11, v6, v11

    if-lez v11, :cond_107

    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v2, v11, 0x1

    .line 571
    .restart local v2       #bound:I
    :goto_fe
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v11

    const/4 v12, 0x1

    invoke-direct {p0, v11, v8, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(IIZ)V

    goto :goto_d9

    .line 570
    .end local v2           #bound:I
    :cond_107
    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    goto :goto_fe

    .line 573
    :cond_10a
    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {p0, v9, v11, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(IIZ)V

    goto :goto_d9

    .line 581
    .end local v5           #screenWidth:I
    .end local v6           #scrolledPos:F
    .end local v7           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v8           #velocityX:I
    .end local v9           #whichScreen:I
    :pswitch_110
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_125

    .line 582
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getWidth()I

    move-result v5

    .line 583
    .restart local v5       #screenWidth:I
    iget v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollX:I

    div-int/lit8 v12, v5, 0x2

    add-int/2addr v11, v12

    div-int v9, v11, v5

    .line 584
    .restart local v9       #whichScreen:I
    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {p0, v9, v11, v12}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(IIZ)V

    .line 586
    .end local v5           #screenWidth:I
    .end local v9           #whichScreen:I
    :cond_125
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mTouchState:I

    .line 587
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mActivePointerId:I

    .line 588
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->releaseVelocityTracker()V

    goto/16 :goto_c

    .line 591
    :pswitch_130
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_c

    .line 519
    nop

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_e
        :pswitch_99
        :pswitch_39
        :pswitch_110
        :pswitch_c
        :pswitch_c
        :pswitch_130
    .end packed-switch
.end method

.method public scrollLeft()V
    .registers 2

    .prologue
    .line 681
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 682
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    if-lez v0, :cond_13

    .line 683
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(I)V

    .line 690
    :cond_13
    :goto_13
    return-void

    .line 686
    :cond_14
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    if-lez v0, :cond_13

    .line 687
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(I)V

    goto :goto_13
.end method

.method public scrollRight()V
    .registers 3

    .prologue
    .line 693
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 694
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 695
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(I)V

    .line 702
    :cond_19
    :goto_19
    return-void

    .line 698
    :cond_1a
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 699
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mNextScreen:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(I)V

    goto :goto_19
.end method

.method public scrollTo(II)V
    .registers 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 269
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 270
    return-void
.end method

.method public setAllowLongPress(Z)V
    .registers 2
    .parameter "allowLongPress"

    .prologue
    .line 730
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mAllowLongPress:Z

    .line 731
    return-void
.end method

.method public setCurrentScreen(II)V
    .registers 8
    .parameter "currentScreen"
    .parameter "toolbarwidth"

    .prologue
    const/4 v4, 0x0

    .line 251
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_e

    .line 252
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 254
    :cond_e
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    .line 255
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

    if-eqz v1, :cond_29

    .line 256
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    invoke-interface {v1, v2}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;->onScrollFinish(I)V

    .line 258
    :cond_29
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDisplay:Landroid/view/Display;

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v0

    .line 259
    .local v0, width:I
    if-eqz p2, :cond_32

    .line 260
    move v0, p2

    .line 262
    :cond_32
    const-string v1, "Width"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "width is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mCurrentScreen:I

    mul-int/2addr v1, v0

    invoke-virtual {p0, v1, v4}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->scrollTo(II)V

    .line 264
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->invalidate()V

    .line 265
    return-void
.end method

.method public setScrollToScreenCallback(Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;)V
    .registers 2
    .parameter "scrollToScreenCallback"

    .prologue
    .line 181
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mScrollToScreenCallback:Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;

    .line 182
    return-void
.end method

.method setSimSwitchPanleVisibility(Z)V
    .registers 6
    .parameter "visible"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 201
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    .line 211
    .local v0, bar:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
    if-eqz p1, :cond_32

    .line 212
    iget-boolean v1, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mHasFlipSettings:Z

    if-eqz v1, :cond_23

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mFlipSettingsView:Landroid/view/View;

    if-eqz v1, :cond_23

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mFlipSettingsView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_23

    iget-object v1, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2e

    .line 216
    :cond_23
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarSwitchPanel:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 217
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->setPanelShowing(Z)V

    .line 228
    :cond_2e
    :goto_2e
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateIndicator()V

    .line 229
    return-void

    .line 219
    :cond_32
    if-nez p1, :cond_2e

    .line 220
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarSwitchPanel:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v1, v3, :cond_44

    .line 222
    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->dismissAppGuide()V

    .line 224
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarSwitchPanel:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 226
    :cond_44
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->setPanelShowing(Z)V

    goto :goto_2e
.end method

.method public setStatusBarService(Lcom/android/systemui/statusbar/BaseStatusBar;)V
    .registers 2
    .parameter "statusBarService"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mStatusBarService:Lcom/android/systemui/statusbar/BaseStatusBar;

    .line 116
    return-void
.end method

.method public setToolBarIndicator(Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;)V
    .registers 2
    .parameter "toolBarIndicator"

    .prologue
    .line 161
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

    .line 162
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateIndicator()V

    .line 163
    return-void
.end method

.method public setToolBarSwitchPanel(Landroid/view/View;)V
    .registers 2
    .parameter "toolBarSwitchPanel"

    .prologue
    .line 119
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarSwitchPanel:Landroid/view/View;

    .line 120
    return-void
.end method

.method public showSimSwithPanel(Ljava/lang/String;)V
    .registers 4
    .parameter "simServiceType"

    .prologue
    const/4 v1, 0x0

    .line 185
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimService(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 186
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setSimSwitchPanleVisibility(Z)V

    .line 190
    :goto_d
    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mDefaultScreen:I

    .line 191
    invoke-virtual {p0, v1, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setCurrentScreen(II)V

    .line 192
    return-void

    .line 188
    :cond_13
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->setSimSwitchPanleVisibility(Z)V

    goto :goto_d
.end method

.method public snapToScreen(I)V
    .registers 3
    .parameter "whichScreen"

    .prologue
    const/4 v0, 0x0

    .line 614
    invoke-direct {p0, p1, v0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->snapToScreen(IIZ)V

    .line 615
    return-void
.end method

.method public updateIndicator()V
    .registers 4

    .prologue
    .line 170
    const-string v0, "ToolBarView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateIndicator called, and indicator count is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getChildCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getIndicatorCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2b

    .line 172
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->setVisibility(I)V

    .line 178
    :goto_2a
    return-void

    .line 174
    :cond_2b
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->setVisibility(I)V

    .line 175
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getIndicatorCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->setCount(I)V

    .line 176
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mToolBarIndicator:Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->requestLayout()V

    goto :goto_2a
.end method

.method public updateResources()V
    .registers 2

    .prologue
    .line 797
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mIsUpdated:Z

    if-nez v0, :cond_5

    .line 801
    :goto_4
    return-void

    .line 800
    :cond_5
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateResources()V

    goto :goto_4
.end method

.method public updateSimInfos(Landroid/content/Intent;)V
    .registers 3
    .parameter "intent"

    .prologue
    .line 779
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimInfo()V

    .line 780
    return-void
.end method
