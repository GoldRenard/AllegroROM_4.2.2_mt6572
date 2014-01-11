.class public Lcom/cyanogenmod/trebuchet/DragLayer;
.super Landroid/widget/FrameLayout;
.source "DragLayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    }
.end annotation


# static fields
.field public static final ANIMATION_END_DISAPPEAR:I = 0x0

.field public static final ANIMATION_END_FADE_OUT:I = 0x1

.field public static final ANIMATION_END_REMAIN_VISIBLE:I = 0x2


# instance fields
.field private mAnchorView:Landroid/view/View;

.field private mAnchorViewInitialScrollX:I

.field private mCubicEaseOutInterpolator:Landroid/animation/TimeInterpolator;

.field private mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

.field private mDragController:Lcom/cyanogenmod/trebuchet/DragController;

.field private mDropAnim:Landroid/animation/ValueAnimator;

.field private mDropView:Lcom/cyanogenmod/trebuchet/DragView;

.field private mFadeOutAnim:Landroid/animation/ValueAnimator;

.field private mHitRect:Landroid/graphics/Rect;

.field private mHoverPointClosesFolder:Z

.field private mInScrollArea:Z

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mLeftHoverDrawable:Landroid/graphics/drawable/Drawable;

.field private final mResizeFrames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;",
            ">;"
        }
    .end annotation
.end field

.field private mRightHoverDrawable:Landroid/graphics/drawable/Drawable;

.field private mTmpXY:[I

.field private mXDown:I

.field private mYDown:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 79
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    .line 59
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    .line 60
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    .line 61
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x3fc0

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCubicEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    .line 62
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 63
    iput v3, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorViewInitialScrollX:I

    .line 64
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorView:Landroid/view/View;

    .line 66
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    .line 67
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHitRect:Landroid/graphics/Rect;

    .line 82
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/DragLayer;->setMotionEventSplittingEnabled(Z)V

    .line 83
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->setChildrenDrawingOrderEnabled(Z)V

    .line 85
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02002d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLeftHoverDrawable:Landroid/graphics/drawable/Drawable;

    .line 86
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02002e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mRightHoverDrawable:Landroid/graphics/drawable/Drawable;

    .line 87
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/DragLayer;)Lcom/cyanogenmod/trebuchet/DragView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    return-object v0
.end method

.method static synthetic access$002(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DragView;)Lcom/cyanogenmod/trebuchet/DragView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    return-object p1
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/DragLayer;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/DragLayer;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorViewInitialScrollX:I

    return v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/DragLayer;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->fadeOutDragView()V

    return-void
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/DragLayer;)Lcom/cyanogenmod/trebuchet/DragController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    return-object v0
.end method

.method private fadeOutDragView()V
    .locals 3

    .prologue
    .line 644
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    .line 645
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 646
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 647
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 648
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$4;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/DragLayer$4;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 656
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$5;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/DragLayer$5;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 665
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 666
    return-void

    .line 646
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private handleTouchDown(Landroid/view/MotionEvent;Z)Z
    .locals 9
    .parameter "ev"
    .parameter "intercept"

    .prologue
    const/4 v6, 0x1

    .line 110
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 111
    .local v2, hitRect:Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v4, v7

    .line 112
    .local v4, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v5, v7

    .line 114
    .local v5, y:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    .line 115
    .local v0, child:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getHitRect(Landroid/graphics/Rect;)V

    .line 116
    invoke-virtual {v2, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 117
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getLeft()I

    move-result v7

    sub-int v7, v4, v7

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getTop()I

    move-result v8

    sub-int v8, v5, v8

    invoke-virtual {v0, v7, v8}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->beginResizeIfPointInRegion(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 118
    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    .line 119
    iput v4, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mXDown:I

    .line 120
    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mYDown:I

    .line 121
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/DragLayer;->requestDisallowInterceptTouchEvent(Z)V

    .line 142
    .end local v0           #child:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
    :goto_0
    return v6

    .line 127
    :cond_1
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v7

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v1

    .line 128
    .local v1, currentFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v1, :cond_3

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->isFolderClingVisible()Z

    move-result v7

    if-nez v7, :cond_3

    if-eqz p2, :cond_3

    .line 129
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Folder;->isEditingName()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 130
    invoke-direct {p0, v1, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->isEventOverFolderTextRegion(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 131
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Folder;->dismissEditingName()V

    goto :goto_0

    .line 136
    :cond_2
    invoke-virtual {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 137
    invoke-direct {p0, v1, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->isEventOverFolder(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 138
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    goto :goto_0

    .line 142
    :cond_3
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private isEventOverFolder(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "folder"
    .parameter "ev"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHitRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 106
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHitRect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method

.method private isEventOverFolderTextRegion(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "folder"
    .parameter "ev"

    .prologue
    .line 100
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Folder;->getEditTextRegion()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHitRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 101
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHitRect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method

.method private sendTapOutsideFolderAccessibilityEvent(Z)V
    .locals 5
    .parameter "isEditingName"

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "accessibility"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 200
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 201
    if-eqz p1, :cond_1

    const v2, 0x7f0900d3

    .line 202
    .local v2, stringId:I
    :goto_0
    const/16 v3, 0x8

    invoke-static {v3}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 204
    .local v1, event:Landroid/view/accessibility/AccessibilityEvent;
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 205
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 208
    .end local v1           #event:Landroid/view/accessibility/AccessibilityEvent;
    .end local v2           #stringId:I
    :cond_0
    return-void

    .line 201
    :cond_1
    const v2, 0x7f0900d2

    goto :goto_0
.end method


# virtual methods
.method public addResizeFrame(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 4
    .parameter "widget"
    .parameter "cellLayout"

    .prologue
    const/4 v3, -0x1

    .line 392
    new-instance v1, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1, p2, p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;-><init>(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragLayer;)V

    .line 395
    .local v1, resizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
    new-instance v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    invoke-direct {v0, v3, v3}, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;-><init>(II)V

    .line 396
    .local v0, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 398
    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 399
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 401
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->snapToWidget(Z)V

    .line 402
    return-void
.end method

.method public animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/animation/ValueAnimator$AnimatorUpdateListener;ILandroid/animation/TimeInterpolator;Ljava/lang/Runnable;ILandroid/view/View;)V
    .locals 3
    .parameter "view"
    .parameter "updateCb"
    .parameter "duration"
    .parameter "interpolator"
    .parameter "onCompleteRunnable"
    .parameter "animationEndStyle"
    .parameter "anchorView"

    .prologue
    .line 588
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mFadeOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 592
    :cond_1
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 593
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->cancelAnimation()V

    .line 594
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->resetLayoutParams()V

    .line 597
    if-eqz p7, :cond_2

    .line 598
    invoke-virtual {p7}, Landroid/view/View;->getScrollX()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorViewInitialScrollX:I

    .line 600
    :cond_2
    iput-object p7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mAnchorView:Landroid/view/View;

    .line 603
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    .line 604
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 605
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    int-to-long v1, p3

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 606
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 607
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 608
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$3;

    invoke-direct {v1, p0, p5, p6}, Lcom/cyanogenmod/trebuchet/DragLayer$3;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;Ljava/lang/Runnable;I)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 625
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 626
    return-void

    .line 606
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;Landroid/graphics/Rect;FFFFFILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V
    .locals 24
    .parameter "view"
    .parameter "from"
    .parameter "to"
    .parameter "finalAlpha"
    .parameter "initScaleX"
    .parameter "initScaleY"
    .parameter "finalScaleX"
    .parameter "finalScaleY"
    .parameter "duration"
    .parameter "motionInterpolator"
    .parameter "alphaInterpolator"
    .parameter "onCompleteRunnable"
    .parameter "animationEndStyle"
    .parameter "anchorView"

    .prologue
    .line 522
    move-object/from16 v0, p3

    iget v2, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    int-to-double v2, v2

    const-wide/high16 v4, 0x4000

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    move-object/from16 v0, p3

    iget v4, v0, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p2

    iget v5, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    int-to-double v4, v4

    const-wide/high16 v8, 0x4000

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    move/from16 v21, v0

    .line 524
    .local v21, dist:F
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    .line 525
    .local v23, res:Landroid/content/res/Resources;
    const v2, 0x7f0c0014

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v0, v2

    move/from16 v22, v0

    .line 528
    .local v22, maxDist:F
    if-gez p9, :cond_1

    .line 529
    const v2, 0x7f0c0012

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p9

    .line 530
    cmpg-float v2, v21, v22

    if-gez v2, :cond_0

    .line 531
    move/from16 v0, p9

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCubicEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    div-float v4, v21, v22

    invoke-interface {v3, v4}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v0, v2

    move/from16 p9, v0

    .line 533
    :cond_0
    const v2, 0x7f0c0011

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    move/from16 v0, p9

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result p9

    .line 537
    :cond_1
    const/16 v17, 0x0

    .line 538
    .local v17, interpolator:Landroid/animation/TimeInterpolator;
    if-eqz p11, :cond_2

    if-nez p10, :cond_3

    .line 539
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCubicEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    move-object/from16 v17, v0

    .line 543
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getAlpha()F

    move-result v12

    .line 544
    .local v12, initAlpha:F
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getScaleX()F

    move-result v7

    .line 545
    .local v7, dropViewScale:F
    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$2;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p11

    move-object/from16 v5, p10

    move/from16 v6, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p4

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    invoke-direct/range {v1 .. v14}, Lcom/cyanogenmod/trebuchet/DragLayer$2;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;FFFFFFFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .local v1, updateCb:Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object v15, v1

    move/from16 v16, p9

    move-object/from16 v18, p12

    move/from16 v19, p13

    move-object/from16 v20, p14

    .line 580
    invoke-virtual/range {v13 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/animation/ValueAnimator$AnimatorUpdateListener;ILandroid/animation/TimeInterpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 582
    return-void
.end method

.method public animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;IIIIFFFFFLjava/lang/Runnable;IILandroid/view/View;)V
    .locals 17
    .parameter "view"
    .parameter "fromX"
    .parameter "fromY"
    .parameter "toX"
    .parameter "toY"
    .parameter "finalAlpha"
    .parameter "initScaleX"
    .parameter "initScaleY"
    .parameter "finalScaleX"
    .parameter "finalScaleY"
    .parameter "onCompleteRunnable"
    .parameter "animationEndStyle"
    .parameter "duration"
    .parameter "anchorView"

    .prologue
    .line 487
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v2

    add-int v2, v2, p2

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v3

    add-int v3, v3, p3

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-direct {v4, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 489
    .local v4, from:Landroid/graphics/Rect;
    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v2

    add-int v2, v2, p4

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v3

    add-int v3, v3, p5

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-direct {v5, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 490
    .local v5, to:Landroid/graphics/Rect;
    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p13

    move-object/from16 v14, p11

    move/from16 v15, p12

    move-object/from16 v16, p14

    invoke-virtual/range {v2 .. v16}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;Landroid/graphics/Rect;FFFFFILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 492
    return-void
.end method

.method public animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;)V
    .locals 1
    .parameter "dragView"
    .parameter "child"

    .prologue
    .line 405
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 406
    return-void
.end method

.method public animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;ILjava/lang/Runnable;Landroid/view/View;)V
    .locals 24
    .parameter "dragView"
    .parameter "child"
    .parameter "duration"
    .parameter "onFinishAnimationRunnable"
    .parameter "anchorView"

    .prologue
    .line 427
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v21

    check-cast v21, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 428
    .local v21, parentChildren:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 429
    .local v20, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->measureChild(Landroid/view/View;)V

    .line 431
    new-instance v22, Landroid/graphics/Rect;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/Rect;-><init>()V

    .line 432
    .local v22, r:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 434
    const/4 v3, 0x2

    new-array v0, v3, [I

    move-object/from16 v19, v0

    .line 435
    .local v19, coord:[I
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScaleX()F

    move-result v18

    .line 436
    .local v18, childScale:F
    const/4 v3, 0x0

    move-object/from16 v0, v20

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->x:I

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x3f80

    sub-float v10, v10, v18

    mul-float/2addr v9, v10

    const/high16 v10, 0x4000

    div-float/2addr v9, v10

    float-to-int v9, v9

    add-int/2addr v4, v9

    aput v4, v19, v3

    .line 437
    const/4 v3, 0x1

    move-object/from16 v0, v20

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->y:I

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x3f80

    sub-float v10, v10, v18

    mul-float/2addr v9, v10

    const/high16 v10, 0x4000

    div-float/2addr v9, v10

    float-to-int v9, v9

    add-int/2addr v4, v9

    aput v4, v19, v3

    .line 441
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v3, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    move-result v12

    .line 444
    .local v12, scale:F
    mul-float v12, v12, v18

    .line 445
    const/4 v3, 0x0

    aget v7, v19, v3

    .line 446
    .local v7, toX:I
    const/4 v3, 0x1

    aget v8, v19, v3

    .line 447
    .local v8, toY:I
    move-object/from16 v0, p2

    instance-of v3, v0, Landroid/widget/TextView;

    if-eqz v3, :cond_0

    move-object/from16 v23, p2

    .line 448
    check-cast v23, Landroid/widget/TextView;

    .line 453
    .local v23, tv:Landroid/widget/TextView;
    invoke-virtual/range {v23 .. v23}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v12

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v8, v3

    .line 454
    int-to-float v3, v8

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v9, 0x3f80

    sub-float/2addr v9, v12

    mul-float/2addr v4, v9

    const/high16 v9, 0x4000

    div-float/2addr v4, v9

    sub-float/2addr v3, v4

    float-to-int v8, v3

    .line 455
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v12

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v7, v3

    .line 468
    .end local v23           #tv:Landroid/widget/TextView;
    :goto_0
    move-object/from16 v0, v22

    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 469
    .local v5, fromX:I
    move-object/from16 v0, v22

    iget v6, v0, Landroid/graphics/Rect;->top:I

    .line 470
    .local v6, fromY:I
    const/4 v3, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 471
    new-instance v14, Lcom/cyanogenmod/trebuchet/DragLayer$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v14, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer$1;-><init>(Lcom/cyanogenmod/trebuchet/DragLayer;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 479
    .local v14, onCompleteRunnable:Ljava/lang/Runnable;
    const/high16 v9, 0x3f80

    const/high16 v10, 0x3f80

    const/high16 v11, 0x3f80

    const/4 v15, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move v13, v12

    move/from16 v16, p3

    move-object/from16 v17, p5

    invoke-virtual/range {v3 .. v17}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;IIIIFFFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 481
    return-void

    .line 456
    .end local v5           #fromX:I
    .end local v6           #fromY:I
    .end local v14           #onCompleteRunnable:Ljava/lang/Runnable;
    :cond_0
    move-object/from16 v0, p2

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v3, :cond_1

    .line 458
    int-to-float v3, v8

    const/high16 v4, 0x4000

    mul-float/2addr v4, v12

    const/high16 v9, 0x4000

    div-float/2addr v4, v9

    sub-float/2addr v3, v4

    float-to-int v8, v3

    .line 459
    int-to-float v3, v8

    const/high16 v4, 0x3f80

    sub-float/2addr v4, v12

    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v4, v9

    const/high16 v9, 0x4000

    div-float/2addr v4, v9

    sub-float/2addr v3, v4

    float-to-int v8, v3

    .line 461
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v12

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v7, v3

    goto :goto_0

    .line 463
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getHeight()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    mul-float/2addr v3, v12

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v8, v3

    .line 464
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    mul-float/2addr v3, v12

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v7, v3

    goto/16 :goto_0
.end method

.method public animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 6
    .parameter "dragView"
    .parameter "child"
    .parameter "onFinishAnimationRunnable"

    .prologue
    .line 422
    const/4 v3, -0x1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;ILjava/lang/Runnable;Landroid/view/View;)V

    .line 423
    return-void
.end method

.method public animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;[IFFFILjava/lang/Runnable;I)V
    .locals 19
    .parameter "dragView"
    .parameter "pos"
    .parameter "alpha"
    .parameter "scaleX"
    .parameter "scaleY"
    .parameter "animationEndStyle"
    .parameter "onFinishRunnable"
    .parameter "duration"

    .prologue
    .line 411
    new-instance v18, Landroid/graphics/Rect;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Rect;-><init>()V

    .line 412
    .local v18, r:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 413
    move-object/from16 v0, v18

    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 414
    .local v5, fromX:I
    move-object/from16 v0, v18

    iget v6, v0, Landroid/graphics/Rect;->top:I

    .line 416
    .local v6, fromY:I
    const/4 v3, 0x0

    aget v7, p2, v3

    const/4 v3, 0x1

    aget v8, p2, v3

    const/high16 v10, 0x3f80

    const/high16 v11, 0x3f80

    const/16 v17, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v9, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-object/from16 v14, p7

    move/from16 v15, p6

    move/from16 v16, p8

    invoke-virtual/range {v3 .. v17}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;IIIIFFFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 418
    return-void
.end method

.method public clearAllResizeFrames()V
    .locals 3

    .prologue
    .line 382
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 383
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    .line 384
    .local v0, frame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->commitResize()V

    .line 385
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    goto :goto_0

    .line 387
    .end local v0           #frame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mResizeFrames:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 389
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public clearAnimatedView()V
    .locals 2

    .prologue
    .line 629
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 630
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 632
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    if-eqz v0, :cond_1

    .line 633
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->onDeferredEndDrag(Lcom/cyanogenmod/trebuchet/DragView;)V

    .line 635
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 636
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->invalidate()V

    .line 637
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .parameter "canvas"

    .prologue
    .line 684
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 686
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mInScrollArea:Z

    if-eqz v6, :cond_0

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v6

    if-nez v6, :cond_0

    .line 687
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v5

    .line 688
    .local v5, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->getWidth()I

    move-result v4

    .line 689
    .local v4, width:I
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->getNextPage()I

    move-result v2

    .line 691
    .local v2, page:I
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 692
    .local v0, childRect:Landroid/graphics/Rect;
    invoke-virtual {v5, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 694
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 695
    .local v1, leftPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 697
    .local v3, rightPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getIsDragOverlapping()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 698
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLeftHoverDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v7, 0x0

    iget v8, v0, Landroid/graphics/Rect;->top:I

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLeftHoverDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    iget v10, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 700
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLeftHoverDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 707
    .end local v0           #childRect:Landroid/graphics/Rect;
    .end local v1           #leftPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #page:I
    .end local v3           #rightPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v4           #width:I
    .end local v5           #workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    :cond_0
    :goto_0
    return-void

    .line 701
    .restart local v0       #childRect:Landroid/graphics/Rect;
    .restart local v1       #leftPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v2       #page:I
    .restart local v3       #rightPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v4       #width:I
    .restart local v5       #workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    :cond_1
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getIsDragOverlapping()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 702
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mRightHoverDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mRightHoverDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    sub-int v7, v4, v7

    iget v8, v0, Landroid/graphics/Rect;->top:I

    iget v9, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v6, v7, v8, v4, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 704
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mRightHoverDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 96
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/DragController;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .parameter "focused"
    .parameter "direction"

    .prologue
    .line 319
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0, p1, p2}, Lcom/cyanogenmod/trebuchet/DragController;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public getAnimatedView()Landroid/view/View;
    .locals 1

    .prologue
    .line 640
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;

    return-object v0
.end method

.method public getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F
    .locals 9
    .parameter "descendant"
    .parameter "coord"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 282
    const/high16 v1, 0x3f80

    .line 283
    .local v1, scale:F
    const/4 v4, 0x2

    new-array v0, v4, [F

    aget v4, p2, v7

    int-to-float v4, v4

    aput v4, v0, v7

    aget v4, p2, v8

    int-to-float v4, v4

    aput v4, v0, v8

    .line 284
    .local v0, pt:[F
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 285
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v4

    mul-float/2addr v1, v4

    .line 286
    aget v4, v0, v7

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v0, v7

    .line 287
    aget v4, v0, v8

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v0, v8

    .line 288
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 289
    .local v3, viewParent:Landroid/view/ViewParent;
    :goto_0
    instance-of v4, v3, Landroid/view/View;

    if-eqz v4, :cond_0

    if-eq v3, p0, :cond_0

    move-object v2, v3

    .line 290
    check-cast v2, Landroid/view/View;

    .line 291
    .local v2, view:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 292
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v4

    mul-float/2addr v1, v4

    .line 293
    aget v4, v0, v7

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getScrollX()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v0, v7

    .line 294
    aget v4, v0, v8

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    add-float/2addr v4, v5

    aput v4, v0, v8

    .line 295
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 296
    goto :goto_0

    .line 297
    .end local v2           #view:Landroid/view/View;
    :cond_0
    aget v4, v0, v7

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    aput v4, p2, v7

    .line 298
    aget v4, v0, v8

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    aput v4, p2, v8

    .line 299
    return v1
.end method

.method public getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F
    .locals 6
    .parameter "descendant"
    .parameter "r"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 257
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aput v4, v1, v4

    .line 258
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aput v4, v1, v5

    .line 259
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    invoke-virtual {p0, p1, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    move-result v0

    .line 260
    .local v0, scale:F
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aget v1, v1, v4

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aget v2, v2, v5

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aget v3, v3, v4

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mTmpXY:[I

    aget v4, v4, v5

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p2, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 262
    return v0
.end method

.method public getLocationInDragLayer(Landroid/view/View;[I)F
    .locals 2
    .parameter "child"
    .parameter "loc"

    .prologue
    const/4 v1, 0x0

    .line 266
    aput v1, p2, v1

    .line 267
    const/4 v0, 0x1

    aput v1, p2, v0

    .line 268
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    move-result v0

    return v0
.end method

.method public getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 10
    .parameter "v"
    .parameter "r"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 303
    const/4 v7, 0x2

    new-array v1, v7, [I

    .line 304
    .local v1, loc:[I
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInWindow([I)V

    .line 305
    aget v5, v1, v8

    .line 306
    .local v5, x:I
    aget v6, v1, v9

    .line 308
    .local v6, y:I
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 309
    aget v3, v1, v8

    .line 310
    .local v3, vX:I
    aget v4, v1, v9

    .line 312
    .local v4, vY:I
    sub-int v0, v3, v5

    .line 313
    .local v0, left:I
    sub-int v2, v4, v6

    .line 314
    .local v2, top:I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v8, v2

    invoke-virtual {p2, v0, v2, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 315
    return-void
.end method

.method onEnterScrollArea()V
    .locals 1

    .prologue
    .line 673
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mInScrollArea:Z

    .line 674
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->invalidate()V

    .line 675
    return-void
.end method

.method onExitScrollArea()V
    .locals 1

    .prologue
    .line 678
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mInScrollArea:Z

    .line 679
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->invalidate()V

    .line 680
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 214
    const/4 v0, 0x0

    return v0
.end method

.method public onInterceptHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "ev"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 158
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v6

    if-nez v6, :cond_1

    .line 194
    :cond_0
    :goto_0
    return v4

    .line 161
    :cond_1
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v6

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v2

    .line 162
    .local v2, currentFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v2, :cond_0

    .line 165
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "accessibility"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 167
    .local v0, accessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 168
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    .line 170
    .local v1, action:I
    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 181
    :goto_1
    :pswitch_1
    invoke-direct {p0, v2, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->isEventOverFolder(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z

    move-result v3

    .line 182
    .local v3, isOverFolder:Z
    if-nez v3, :cond_3

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    if-nez v6, :cond_3

    .line 183
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Folder;->isEditingName()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/DragLayer;->sendTapOutsideFolderAccessibilityEvent(Z)V

    .line 184
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    move v4, v5

    .line 185
    goto :goto_0

    .line 172
    .end local v3           #isOverFolder:Z
    :pswitch_2
    invoke-direct {p0, v2, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->isEventOverFolder(Lcom/cyanogenmod/trebuchet/Folder;Landroid/view/MotionEvent;)Z

    move-result v3

    .line 173
    .restart local v3       #isOverFolder:Z
    if-nez v3, :cond_2

    .line 174
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Folder;->isEditingName()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/DragLayer;->sendTapOutsideFolderAccessibilityEvent(Z)V

    .line 175
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    move v4, v5

    .line 176
    goto :goto_0

    .line 178
    :cond_2
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    goto :goto_1

    .line 186
    :cond_3
    if-eqz v3, :cond_4

    .line 187
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mHoverPointClosesFolder:Z

    goto :goto_0

    :cond_4
    move v4, v5

    .line 189
    goto :goto_0

    .line 170
    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "ev"

    .prologue
    const/4 v0, 0x1

    .line 147
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 148
    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->handleTouchDown(Landroid/view/MotionEvent;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 153
    :goto_0
    return v0

    .line 152
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->clearAllResizeFrames()V

    .line 153
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/DragController;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 367
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 368
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getChildCount()I

    move-result v1

    .line 369
    .local v1, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 370
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/DragLayer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 371
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 372
    .local v2, flp:Landroid/widget/FrameLayout$LayoutParams;
    instance-of v5, v2, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    if-eqz v5, :cond_0

    move-object v4, v2

    .line 373
    check-cast v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 374
    .local v4, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    iget-boolean v5, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    if-eqz v5, :cond_0

    .line 375
    iget v5, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    iget v7, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    iget v8, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    add-int/2addr v7, v8

    iget v8, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    iget v9, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    add-int/2addr v8, v9

    invoke-virtual {v0, v5, v6, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 369
    .end local v4           #lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 379
    .end local v0           #child:Landroid/view/View;
    .end local v2           #flp:Landroid/widget/FrameLayout$LayoutParams;
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .parameter "ev"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 219
    const/4 v1, 0x0

    .line 220
    .local v1, handled:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 222
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v2, v6

    .line 223
    .local v2, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v3, v6

    .line 225
    .local v3, y:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    if-nez v6, :cond_0

    .line 226
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    if-nez v6, :cond_0

    .line 227
    invoke-direct {p0, p1, v4}, Lcom/cyanogenmod/trebuchet/DragLayer;->handleTouchDown(Landroid/view/MotionEvent;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 246
    :goto_0
    return v5

    .line 233
    :cond_0
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    if-eqz v6, :cond_1

    .line 234
    const/4 v1, 0x1

    .line 235
    packed-switch v0, :pswitch_data_0

    .line 246
    :cond_1
    :goto_1
    if-nez v1, :cond_2

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v6, p1}, Lcom/cyanogenmod/trebuchet/DragController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_3

    :cond_2
    move v4, v5

    :cond_3
    move v5, v4

    goto :goto_0

    .line 237
    :pswitch_0
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    iget v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mXDown:I

    sub-int v7, v2, v7

    iget v8, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mYDown:I

    sub-int v8, v3, v8

    invoke-virtual {v6, v7, v8}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->visualizeResizeForDelta(II)V

    goto :goto_1

    .line 241
    :pswitch_1
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    iget v7, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mXDown:I

    sub-int v7, v2, v7

    iget v8, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mYDown:I

    sub-int v8, v3, v8

    invoke-virtual {v6, v7, v8}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->visualizeResizeForDelta(II)V

    .line 242
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->onTouchUp()V

    .line 243
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mCurrentResizeFrame:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    goto :goto_1

    .line 235
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 0
    .parameter "launcher"
    .parameter "controller"

    .prologue
    .line 90
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 91
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 92
    return-void
.end method
