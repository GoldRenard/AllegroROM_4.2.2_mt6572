.class public Lcom/android/launcher2/DragController;
.super Ljava/lang/Object;
.source "DragController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/DragController$ScrollRunnable;,
        Lcom/android/launcher2/DragController$DragListener;
    }
.end annotation


# static fields
.field public static final DRAG_ACTION_COPY:I = 0x1

.field public static final DRAG_ACTION_MOVE:I = 0x0

.field private static final MAX_FLING_DEGREES:F = 35.0f

.field private static final PROFILE_DRAWING_DURING_DRAG:Z = false

.field private static final RESCROLL_DELAY:I = 0x2ee

.field private static final SCROLL_DELAY:I = 0x1f4

.field static final SCROLL_LEFT:I = 0x0

.field static final SCROLL_NONE:I = -0x1

.field private static final SCROLL_OUTSIDE_ZONE:I = 0x0

.field static final SCROLL_RIGHT:I = 0x1

.field private static final SCROLL_WAITING_IN_ZONE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Launcher.DragController"

.field private static final VIBRATE_DURATION:I = 0xf


# instance fields
.field private final mCoordinatesTemp:[I

.field private mDistanceSinceScroll:I

.field private mDragLayerRect:Landroid/graphics/Rect;

.field private mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

.field private mDragScroller:Lcom/android/launcher2/DragScroller;

.field private mDragging:Z

.field private mDropTargets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/DropTarget;",
            ">;"
        }
    .end annotation
.end field

.field private mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

.field protected mFlingToDeleteThresholdVelocity:I

.field private mHandler:Landroid/os/Handler;

.field private mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mLastDropTarget:Lcom/android/launcher2/DropTarget;

.field private mLastTouch:[I

.field private mLastTouchUpTime:J

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/DragController$DragListener;",
            ">;"
        }
    .end annotation
.end field

.field private mMotionDownX:I

.field private mMotionDownY:I

.field private mMoveTarget:Landroid/view/View;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

.field private mScrollState:I

.field private mScrollView:Landroid/view/View;

.field private mScrollZone:I

.field private mTmpPoint:[I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mVibrator:Landroid/os/Vibrator;

.field private mWindowToken:Landroid/os/IBinder;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Launcher;)V
    .locals 6
    .parameter "launcher"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 148
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 73
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mCoordinatesTemp:[I

    .line 92
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 93
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    .line 105
    iput v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    .line 106
    new-instance v2, Lcom/android/launcher2/DragController$ScrollRunnable;

    invoke-direct {v2, p0}, Lcom/android/launcher2/DragController$ScrollRunnable;-><init>(Lcom/android/launcher2/DragController;)V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    .line 112
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    .line 113
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/android/launcher2/DragController;->mLastTouchUpTime:J

    .line 114
    iput v5, p0, Lcom/android/launcher2/DragController;->mDistanceSinceScroll:I

    .line 116
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mTmpPoint:[I

    .line 117
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    .line 149
    invoke-virtual {p1}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 150
    .local v1, r:Landroid/content/res/Resources;
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 151
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    .line 152
    const v2, 0x7f0b002f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/DragController;->mScrollZone:I

    .line 153
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 154
    const-string v2, "vibrator"

    invoke-virtual {p1, v2}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    iput-object v2, p0, Lcom/android/launcher2/DragController;->mVibrator:Landroid/os/Vibrator;

    .line 156
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 157
    .local v0, density:F
    const/high16 v2, 0x7f0a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    iput v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteThresholdVelocity:I

    .line 159
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/DragController;)Lcom/android/launcher2/DragScroller;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragScroller:Lcom/android/launcher2/DragScroller;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/launcher2/DragController;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput p1, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    return p1
.end method

.method static synthetic access$202(Lcom/android/launcher2/DragController;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput p1, p0, Lcom/android/launcher2/DragController;->mDistanceSinceScroll:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/launcher2/DragController;)Lcom/android/launcher2/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    return-object v0
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 813
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 814
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 816
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 817
    return-void
.end method

.method private clearScrollRunnable()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 498
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 499
    iget v0, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    if-ne v0, v2, :cond_0

    .line 500
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    .line 501
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/DragController$ScrollRunnable;->setDirection(I)V

    .line 502
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragScroller:Lcom/android/launcher2/DragScroller;

    invoke-interface {v0}, Lcom/android/launcher2/DragScroller;->onExitScrollArea()Z

    .line 503
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/DragLayer;->onExitScrollArea()V

    .line 505
    :cond_0
    return-void
.end method

.method private drop(FF)V
    .locals 7
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 704
    iget-object v1, p0, Lcom/android/launcher2/DragController;->mCoordinatesTemp:[I

    .line 705
    .local v1, coordinates:[I
    float-to-int v3, p1

    float-to-int v4, p2

    invoke-direct {p0, v3, v4, v1}, Lcom/android/launcher2/DragController;->findDropTarget(II[I)Lcom/android/launcher2/DropTarget;

    move-result-object v2

    .line 707
    .local v2, dropTarget:Lcom/android/launcher2/DropTarget;
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    aget v4, v1, v5

    iput v4, v3, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    .line 708
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    aget v4, v1, v6

    iput v4, v3, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    .line 714
    const/4 v0, 0x0

    .line 715
    .local v0, accepted:Z
    if-eqz v2, :cond_0

    .line 716
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput-boolean v6, v3, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    .line 717
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 718
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 719
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 720
    const/4 v0, 0x1

    .line 723
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v3, v3, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    check-cast v2, Landroid/view/View;

    .end local v2           #dropTarget:Lcom/android/launcher2/DropTarget;
    iget-object v4, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v3, v2, v4, v5, v0}, Lcom/android/launcher2/DragSource;->onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V

    .line 724
    return-void
.end method

.method private dropOnFlingToDeleteTarget(FFLandroid/graphics/PointF;)V
    .locals 7
    .parameter "x"
    .parameter "y"
    .parameter "vel"

    .prologue
    const/4 v6, 0x1

    .line 676
    iget-object v1, p0, Lcom/android/launcher2/DragController;->mCoordinatesTemp:[I

    .line 678
    .local v1, coordinates:[I
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    const/4 v3, 0x0

    aget v3, v1, v3

    iput v3, v2, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    .line 679
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    aget v3, v1, v6

    iput v3, v2, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    .line 683
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eq v2, v3, :cond_0

    .line 684
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 688
    :cond_0
    const/4 v0, 0x0

    .line 689
    .local v0, accepted:Z
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 692
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput-boolean v6, v2, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    .line 693
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 694
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/android/launcher2/DropTarget;->acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 695
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v4, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget v4, v4, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget v5, v5, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    invoke-interface {v2, v3, v4, v5, p3}, Lcom/android/launcher2/DropTarget;->onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V

    .line 697
    const/4 v0, 0x1

    .line 699
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v3, v2, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    check-cast v2, Landroid/view/View;

    iget-object v4, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v3, v2, v4, v6, v0}, Lcom/android/launcher2/DragSource;->onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V

    .line 701
    return-void
.end method

.method private endDrag()V
    .locals 5

    .prologue
    .line 369
    iget-boolean v3, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v3, :cond_2

    .line 370
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    .line 371
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->clearScrollRunnable()V

    .line 372
    const/4 v1, 0x0

    .line 373
    .local v1, isDeferred:Z
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v3, v3, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    if-eqz v3, :cond_1

    .line 374
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-boolean v1, v3, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 375
    if-nez v1, :cond_0

    .line 376
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v3, v3, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v3}, Lcom/android/launcher2/DragView;->remove()V

    .line 378
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    .line 382
    :cond_1
    if-nez v1, :cond_2

    .line 383
    iget-object v3, p0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/DragController$DragListener;

    .line 384
    .local v2, listener:Lcom/android/launcher2/DragController$DragListener;
    invoke-interface {v2}, Lcom/android/launcher2/DragController$DragListener;->onDragEnd()V

    goto :goto_0

    .line 389
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #isDeferred:Z
    .end local v2           #listener:Lcom/android/launcher2/DragController$DragListener;
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->releaseVelocityTracker()V

    .line 390
    return-void
.end method

.method private findDropTarget(II[I)Lcom/android/launcher2/DropTarget;
    .locals 11
    .parameter "x"
    .parameter "y"
    .parameter "dropCoordinates"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 727
    iget-object v4, p0, Lcom/android/launcher2/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 729
    .local v4, r:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 730
    .local v2, dropTargets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/DropTarget;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 731
    .local v0, count:I
    add-int/lit8 v3, v0, -0x1

    .local v3, i:I
    :goto_0
    if-ltz v3, :cond_3

    .line 732
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/DropTarget;

    .line 733
    .local v5, target:Lcom/android/launcher2/DropTarget;
    invoke-interface {v5}, Lcom/android/launcher2/DropTarget;->isDropEnabled()Z

    move-result v6

    if-nez v6, :cond_1

    .line 731
    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 737
    :cond_1
    invoke-interface {v5, v4}, Lcom/android/launcher2/DropTarget;->getHitRect(Landroid/graphics/Rect;)V

    .line 740
    invoke-interface {v5, p3}, Lcom/android/launcher2/DropTarget;->getLocationInDragLayer([I)V

    .line 741
    aget v6, p3, v9

    invoke-interface {v5}, Lcom/android/launcher2/DropTarget;->getLeft()I

    move-result v7

    sub-int/2addr v6, v7

    aget v7, p3, v10

    invoke-interface {v5}, Lcom/android/launcher2/DropTarget;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 743
    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput p1, v6, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    .line 744
    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput p2, v6, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    .line 745
    invoke-virtual {v4, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 746
    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/android/launcher2/DropTarget;->getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;

    move-result-object v1

    .line 747
    .local v1, delegate:Lcom/android/launcher2/DropTarget;
    if-eqz v1, :cond_2

    .line 748
    move-object v5, v1

    .line 749
    invoke-interface {v5, p3}, Lcom/android/launcher2/DropTarget;->getLocationInDragLayer([I)V

    .line 753
    :cond_2
    aget v6, p3, v9

    sub-int v6, p1, v6

    aput v6, p3, v9

    .line 754
    aget v6, p3, v10

    sub-int v6, p2, v6

    aput v6, p3, v10

    .line 759
    .end local v1           #delegate:Lcom/android/launcher2/DropTarget;
    .end local v5           #target:Lcom/android/launcher2/DropTarget;
    :goto_1
    return-object v5

    :cond_3
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private getClampedDragLayerPos(FF)[I
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    .line 412
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragLayer;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 413
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mTmpPoint:[I

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    invoke-static {p1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    aput v2, v0, v1

    .line 414
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mTmpPoint:[I

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/launcher2/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    invoke-static {p2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    aput v2, v0, v1

    .line 415
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mTmpPoint:[I

    return-object v0
.end method

.method private handleMoveEvent(II)V
    .locals 13
    .parameter "x"
    .parameter "y"

    .prologue
    .line 508
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v5, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v5, p1, p2}, Lcom/android/launcher2/DragView;->move(II)V

    .line 511
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mCoordinatesTemp:[I

    .line 512
    .local v0, coordinates:[I
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/DragController;->findDropTarget(II[I)Lcom/android/launcher2/DropTarget;

    move-result-object v3

    .line 513
    .local v3, dropTarget:Lcom/android/launcher2/DropTarget;
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    const/4 v6, 0x0

    aget v6, v0, v6

    iput v6, v5, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    .line 514
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    const/4 v6, 0x1

    aget v6, v0, v6

    iput v6, v5, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    .line 520
    if-eqz v3, :cond_5

    .line 521
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/android/launcher2/DropTarget;->getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;

    move-result-object v2

    .line 522
    .local v2, delegate:Lcom/android/launcher2/DropTarget;
    if-eqz v2, :cond_0

    .line 523
    move-object v3, v2

    .line 526
    :cond_0
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eq v5, v3, :cond_2

    .line 527
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eqz v5, :cond_1

    .line 528
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 530
    :cond_1
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/android/launcher2/DropTarget;->onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 532
    :cond_2
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/android/launcher2/DropTarget;->onDragOver(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 538
    .end local v2           #delegate:Lcom/android/launcher2/DropTarget;
    :cond_3
    :goto_0
    iput-object v3, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    .line 542
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledWindowTouchSlop()I

    move-result v4

    .line 543
    .local v4, slop:I
    iget v5, p0, Lcom/android/launcher2/DragController;->mDistanceSinceScroll:I

    int-to-double v5, v5

    iget-object v7, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    sub-int/2addr v7, p1

    int-to-double v7, v7

    const-wide/high16 v9, 0x4000

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    iget-object v9, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v10, 0x1

    aget v9, v9, v10

    sub-int/2addr v9, p2

    int-to-double v9, v9

    const-wide/high16 v11, 0x4000

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    add-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    add-double/2addr v5, v7

    double-to-int v5, v5

    iput v5, p0, Lcom/android/launcher2/DragController;->mDistanceSinceScroll:I

    .line 545
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v6, 0x0

    aput p1, v5, v6

    .line 546
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v6, 0x1

    aput p2, v5, v6

    .line 547
    iget v5, p0, Lcom/android/launcher2/DragController;->mDistanceSinceScroll:I

    if-ge v5, v4, :cond_6

    const/16 v1, 0x2ee

    .line 549
    .local v1, delay:I
    :goto_1
    iget v5, p0, Lcom/android/launcher2/DragController;->mScrollZone:I

    if-ge p1, v5, :cond_7

    .line 550
    iget v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    if-nez v5, :cond_4

    .line 551
    const/4 v5, 0x1

    iput v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    .line 552
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragScroller:Lcom/android/launcher2/DragScroller;

    const/4 v6, 0x0

    invoke-interface {v5, p1, p2, v6}, Lcom/android/launcher2/DragScroller;->onEnterScrollArea(III)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 553
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/android/launcher2/DragLayer;->onEnterScrollArea(I)V

    .line 554
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/android/launcher2/DragController$ScrollRunnable;->setDirection(I)V

    .line 555
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    int-to-long v7, v1

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 570
    :cond_4
    :goto_2
    return-void

    .line 534
    .end local v1           #delay:I
    .end local v4           #slop:I
    :cond_5
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eqz v5, :cond_3

    .line 535
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    goto :goto_0

    .line 547
    .restart local v4       #slop:I
    :cond_6
    const/16 v1, 0x1f4

    goto :goto_1

    .line 558
    .restart local v1       #delay:I
    :cond_7
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mScrollView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    iget v6, p0, Lcom/android/launcher2/DragController;->mScrollZone:I

    sub-int/2addr v5, v6

    if-le p1, v5, :cond_8

    .line 559
    iget v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    if-nez v5, :cond_4

    .line 560
    const/4 v5, 0x1

    iput v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    .line 561
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragScroller:Lcom/android/launcher2/DragScroller;

    const/4 v6, 0x1

    invoke-interface {v5, p1, p2, v6}, Lcom/android/launcher2/DragScroller;->onEnterScrollArea(III)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 562
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/android/launcher2/DragLayer;->onEnterScrollArea(I)V

    .line 563
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/android/launcher2/DragController$ScrollRunnable;->setDirection(I)V

    .line 564
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    int-to-long v7, v1

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    .line 568
    :cond_8
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->clearScrollRunnable()V

    goto :goto_2
.end method

.method private isFlingingToDelete(Lcom/android/launcher2/DragSource;)Landroid/graphics/PointF;
    .locals 9
    .parameter "source"

    .prologue
    const/4 v4, 0x0

    .line 655
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    if-nez v5, :cond_1

    move-object v3, v4

    .line 672
    :cond_0
    :goto_0
    return-object v3

    .line 656
    :cond_1
    invoke-interface {p1}, Lcom/android/launcher2/DragSource;->supportsFlingToDelete()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v3, v4

    goto :goto_0

    .line 658
    :cond_2
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 659
    .local v0, config:Landroid/view/ViewConfiguration;
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v6, 0x3e8

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 661
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v5

    iget v6, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteThresholdVelocity:I

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    .line 663
    new-instance v3, Landroid/graphics/PointF;

    iget-object v5, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v5

    iget-object v6, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 665
    .local v3, vel:Landroid/graphics/PointF;
    new-instance v2, Landroid/graphics/PointF;

    const/4 v5, 0x0

    const/high16 v6, -0x4080

    invoke-direct {v2, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 666
    .local v2, upVec:Landroid/graphics/PointF;
    iget v5, v3, Landroid/graphics/PointF;->x:F

    iget v6, v2, Landroid/graphics/PointF;->x:F

    mul-float/2addr v5, v6

    iget v6, v3, Landroid/graphics/PointF;->y:F

    iget v7, v2, Landroid/graphics/PointF;->y:F

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    invoke-virtual {v3}, Landroid/graphics/PointF;->length()F

    move-result v6

    invoke-virtual {v2}, Landroid/graphics/PointF;->length()F

    move-result v7

    mul-float/2addr v6, v7

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->acos(D)D

    move-result-wide v5

    double-to-float v1, v5

    .line 668
    .local v1, theta:F
    float-to-double v5, v1

    const-wide v7, 0x4041800000000000L

    invoke-static {v7, v8}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v7

    cmpg-double v5, v5, v7

    if-lez v5, :cond_0

    .end local v1           #theta:F
    .end local v2           #upVec:Landroid/graphics/PointF;
    .end local v3           #vel:Landroid/graphics/PointF;
    :cond_3
    move-object v3, v4

    .line 672
    goto :goto_0
.end method

.method private releaseVelocityTracker()V
    .locals 1

    .prologue
    .line 820
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 821
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 822
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 824
    :cond_0
    return-void
.end method


# virtual methods
.method public addDragListener(Lcom/android/launcher2/DragController$DragListener;)V
    .locals 1
    .parameter "l"

    .prologue
    .line 774
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 775
    return-void
.end method

.method public addDropTarget(Lcom/android/launcher2/DropTarget;)V
    .locals 1
    .parameter "target"

    .prologue
    .line 788
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 789
    return-void
.end method

.method public cancelDrag()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 330
    const-string v0, "Launcher.DragController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cancelDrag: mDragging = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mLastDropTarget = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v0, :cond_1

    .line 334
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    iget-object v1, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v0, v1}, Lcom/android/launcher2/DropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 337
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput-boolean v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 338
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput-boolean v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->cancelled:Z

    .line 339
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iput-boolean v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    .line 340
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-interface {v0, v1, v2, v3, v3}, Lcom/android/launcher2/DragSource;->onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V

    .line 342
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->endDrag()V

    .line 343
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    .line 314
    const-string v0, "Launcher.DragController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchKeyEvent: keycode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", action = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mDragging = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    return v0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 3
    .parameter "focused"
    .parameter "direction"

    .prologue
    .line 491
    const-string v0, "Launcher.DragController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchUnhandledMove: focused = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", direction = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mMoveTarget:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/DragController;->mMoveTarget:Landroid/view/View;

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dragging()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    return v0
.end method

.method public forceMoveEvent()V
    .locals 3

    .prologue
    .line 573
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v0, :cond_0

    .line 583
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/android/launcher2/DragController;->mLastTouch:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/android/launcher2/DragController;->handleMoveEvent(II)V

    .line 585
    :cond_0
    return-void
.end method

.method getDragView()Lcom/android/launcher2/DragView;
    .locals 1

    .prologue
    .line 834
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    return-object v0
.end method

.method getLastGestureUpTime()J
    .locals 2

    .prologue
    .line 419
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v0, :cond_0

    .line 420
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 422
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/android/launcher2/DragController;->mLastTouchUpTime:J

    goto :goto_0
.end method

.method getViewBitmap(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 8
    .parameter "v"

    .prologue
    const/4 v5, 0x0

    .line 268
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 269
    invoke-virtual {p1, v5}, Landroid/view/View;->setPressed(Z)V

    .line 271
    invoke-virtual {p1}, Landroid/view/View;->willNotCacheDrawing()Z

    move-result v4

    .line 272
    .local v4, willNotCache:Z
    invoke-virtual {p1, v5}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 276
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCacheBackgroundColor()I

    move-result v3

    .line 277
    .local v3, color:I
    invoke-virtual {p1, v5}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    .line 278
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    .line 279
    .local v0, alpha:F
    const/high16 v5, 0x3f80

    invoke-virtual {p1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 281
    if-eqz v3, :cond_0

    .line 282
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 284
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->buildDrawingCache()V

    .line 285
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 286
    .local v2, cacheBitmap:Landroid/graphics/Bitmap;
    if-nez v2, :cond_1

    .line 287
    const-string v5, "Launcher.DragController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed getViewBitmap("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v5, v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 288
    const/4 v1, 0x0

    .line 299
    :goto_0
    return-object v1

    .line 291
    :cond_1
    invoke-static {v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 294
    .local v1, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 295
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 296
    invoke-virtual {p1, v4}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 297
    invoke-virtual {p1, v3}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    goto :goto_0
.end method

.method public isDragging()Z
    .locals 1

    .prologue
    .line 322
    iget-boolean v0, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    return v0
.end method

.method public onAppsRemoved(Ljava/util/ArrayList;Landroid/content/Context;)V
    .locals 6
    .parameter
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 346
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    if-eqz v5, :cond_1

    .line 347
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v4, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 348
    .local v4, rawDragInfo:Ljava/lang/Object;
    instance-of v5, v4, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v5, :cond_1

    move-object v0, v4

    .line 349
    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 350
    .local v0, dragInfo:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 352
    .local v3, pn:Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v5, v0, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v5, :cond_0

    .line 354
    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 355
    .local v2, isSamePackage:Z
    if-eqz v2, :cond_0

    .line 356
    invoke-virtual {p0}, Lcom/android/launcher2/DragController;->cancelDrag()V

    .line 363
    .end local v0           #dragInfo:Lcom/android/launcher2/ShortcutInfo;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #isSamePackage:Z
    .end local v3           #pn:Ljava/lang/String;
    .end local v4           #rawDragInfo:Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method onDeferredEndDrag(Lcom/android/launcher2/DragView;)V
    .locals 3
    .parameter "dragView"

    .prologue
    .line 396
    invoke-virtual {p1}, Lcom/android/launcher2/DragView;->remove()V

    .line 399
    iget-object v2, p0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/DragController$DragListener;

    .line 400
    .local v1, listener:Lcom/android/launcher2/DragController$DragListener;
    invoke-interface {v1}, Lcom/android/launcher2/DragController$DragListener;->onDragEnd()V

    goto :goto_0

    .line 402
    .end local v1           #listener:Lcom/android/launcher2/DragController$DragListener;
    :cond_0
    return-void
.end method

.method onDeferredEndFling(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 405
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    invoke-interface {v0}, Lcom/android/launcher2/DragSource;->onFlingToDeleteCompleted()V

    .line 406
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "ev"

    .prologue
    .line 435
    const/4 v1, 0x0

    .line 442
    .local v1, debug:Z
    invoke-direct {p0, p1}, Lcom/android/launcher2/DragController;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 444
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 445
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-direct {p0, v6, v7}, Lcom/android/launcher2/DragController;->getClampedDragLayerPos(FF)[I

    move-result-object v2

    .line 446
    .local v2, dragLayerPos:[I
    const/4 v6, 0x0

    aget v3, v2, v6

    .line 447
    .local v3, dragLayerX:I
    const/4 v6, 0x1

    aget v4, v2, v6

    .line 453
    .local v4, dragLayerY:I
    packed-switch v0, :pswitch_data_0

    .line 479
    :goto_0
    :pswitch_0
    iget-boolean v6, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    return v6

    .line 458
    :pswitch_1
    iput v3, p0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    .line 459
    iput v4, p0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    .line 460
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/launcher2/DragController;->mLastDropTarget:Lcom/android/launcher2/DropTarget;

    goto :goto_0

    .line 463
    :pswitch_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/launcher2/DragController;->mLastTouchUpTime:J

    .line 464
    iget-boolean v6, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v6, :cond_0

    .line 465
    iget-object v6, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v6, v6, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    invoke-direct {p0, v6}, Lcom/android/launcher2/DragController;->isFlingingToDelete(Lcom/android/launcher2/DragSource;)Landroid/graphics/PointF;

    move-result-object v5

    .line 466
    .local v5, vec:Landroid/graphics/PointF;
    if-eqz v5, :cond_1

    .line 467
    int-to-float v6, v3

    int-to-float v7, v4

    invoke-direct {p0, v6, v7, v5}, Lcom/android/launcher2/DragController;->dropOnFlingToDeleteTarget(FFLandroid/graphics/PointF;)V

    .line 472
    .end local v5           #vec:Landroid/graphics/PointF;
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->endDrag()V

    goto :goto_0

    .line 469
    .restart local v5       #vec:Landroid/graphics/PointF;
    :cond_1
    int-to-float v6, v3

    int-to-float v7, v4

    invoke-direct {p0, v6, v7}, Lcom/android/launcher2/DragController;->drop(FF)V

    goto :goto_1

    .line 475
    .end local v5           #vec:Landroid/graphics/PointF;
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/launcher2/DragController;->cancelDrag()V

    goto :goto_0

    .line 453
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .parameter "ev"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 591
    iget-boolean v7, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-nez v7, :cond_0

    .line 646
    :goto_0
    return v5

    .line 596
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher2/DragController;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 598
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 599
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-direct {p0, v7, v8}, Lcom/android/launcher2/DragController;->getClampedDragLayerPos(FF)[I

    move-result-object v1

    .line 600
    .local v1, dragLayerPos:[I
    aget v2, v1, v5

    .line 601
    .local v2, dragLayerX:I
    aget v3, v1, v6

    .line 609
    .local v3, dragLayerY:I
    packed-switch v0, :pswitch_data_0

    :goto_1
    move v5, v6

    .line 646
    goto :goto_0

    .line 612
    :pswitch_0
    iput v2, p0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    .line 613
    iput v3, p0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    .line 615
    iget v7, p0, Lcom/android/launcher2/DragController;->mScrollZone:I

    if-lt v2, v7, :cond_1

    iget-object v7, p0, Lcom/android/launcher2/DragController;->mScrollView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    iget v8, p0, Lcom/android/launcher2/DragController;->mScrollZone:I

    sub-int/2addr v7, v8

    if-le v2, v7, :cond_2

    .line 616
    :cond_1
    iput v6, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    .line 617
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    const-wide/16 v8, 0x1f4

    invoke-virtual {v5, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 619
    :cond_2
    iput v5, p0, Lcom/android/launcher2/DragController;->mScrollState:I

    goto :goto_1

    .line 623
    :pswitch_1
    invoke-direct {p0, v2, v3}, Lcom/android/launcher2/DragController;->handleMoveEvent(II)V

    goto :goto_1

    .line 627
    :pswitch_2
    invoke-direct {p0, v2, v3}, Lcom/android/launcher2/DragController;->handleMoveEvent(II)V

    .line 628
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    invoke-virtual {v5, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 630
    iget-boolean v5, p0, Lcom/android/launcher2/DragController;->mDragging:Z

    if-eqz v5, :cond_3

    .line 631
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    iget-object v5, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    invoke-direct {p0, v5}, Lcom/android/launcher2/DragController;->isFlingingToDelete(Lcom/android/launcher2/DragSource;)Landroid/graphics/PointF;

    move-result-object v4

    .line 632
    .local v4, vec:Landroid/graphics/PointF;
    if-eqz v4, :cond_4

    .line 633
    int-to-float v5, v2

    int-to-float v7, v3

    invoke-direct {p0, v5, v7, v4}, Lcom/android/launcher2/DragController;->dropOnFlingToDeleteTarget(FFLandroid/graphics/PointF;)V

    .line 638
    .end local v4           #vec:Landroid/graphics/PointF;
    :cond_3
    :goto_2
    invoke-direct {p0}, Lcom/android/launcher2/DragController;->endDrag()V

    goto :goto_1

    .line 635
    .restart local v4       #vec:Landroid/graphics/PointF;
    :cond_4
    int-to-float v5, v2

    int-to-float v7, v3

    invoke-direct {p0, v5, v7}, Lcom/android/launcher2/DragController;->drop(FF)V

    goto :goto_2

    .line 641
    .end local v4           #vec:Landroid/graphics/PointF;
    :pswitch_3
    iget-object v5, p0, Lcom/android/launcher2/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/android/launcher2/DragController;->mScrollRunnable:Lcom/android/launcher2/DragController$ScrollRunnable;

    invoke-virtual {v5, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 642
    invoke-virtual {p0}, Lcom/android/launcher2/DragController;->cancelDrag()V

    goto :goto_1

    .line 609
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public removeDragListener(Lcom/android/launcher2/DragController$DragListener;)V
    .locals 1
    .parameter "l"

    .prologue
    .line 781
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 782
    return-void
.end method

.method public removeDropTarget(Lcom/android/launcher2/DropTarget;)V
    .locals 1
    .parameter "target"

    .prologue
    .line 795
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 796
    return-void
.end method

.method public resetDropTarget()V
    .locals 1

    .prologue
    .line 802
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 803
    return-void
.end method

.method resetLastGestureUpTime()V
    .locals 2

    .prologue
    .line 427
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/launcher2/DragController;->mLastTouchUpTime:J

    .line 428
    return-void
.end method

.method public setDragScoller(Lcom/android/launcher2/DragScroller;)V
    .locals 0
    .parameter "scroller"

    .prologue
    .line 763
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mDragScroller:Lcom/android/launcher2/DragScroller;

    .line 764
    return-void
.end method

.method public setFlingToDeleteDropTarget(Lcom/android/launcher2/DropTarget;)V
    .locals 0
    .parameter "target"

    .prologue
    .line 809
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mFlingToDeleteDropTarget:Lcom/android/launcher2/DropTarget;

    .line 810
    return-void
.end method

.method setMoveTarget(Landroid/view/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 486
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mMoveTarget:Landroid/view/View;

    .line 487
    return-void
.end method

.method public setScrollView(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 830
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mScrollView:Landroid/view/View;

    .line 831
    return-void
.end method

.method public setWindowToken(Landroid/os/IBinder;)V
    .locals 0
    .parameter "token"

    .prologue
    .line 767
    iput-object p1, p0, Lcom/android/launcher2/DragController;->mWindowToken:Landroid/os/IBinder;

    .line 768
    return-void
.end method

.method public startDrag(Landroid/graphics/Bitmap;IILcom/android/launcher2/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V
    .locals 19
    .parameter "b"
    .parameter "dragLayerX"
    .parameter "dragLayerY"
    .parameter "source"
    .parameter "dragInfo"
    .parameter "dragAction"
    .parameter "dragOffset"
    .parameter "dragRegion"
    .parameter "initialDragViewScale"

    .prologue
    .line 216
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    if-nez v5, :cond_0

    .line 217
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    const-string v6, "input_method"

    invoke-virtual {v5, v6}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/inputmethod/InputMethodManager;

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 220
    :cond_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/DragController;->mWindowToken:Landroid/os/IBinder;

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 222
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/launcher2/DragController$DragListener;

    .line 223
    .local v17, listener:Lcom/android/launcher2/DragController$DragListener;
    move-object/from16 v0, v17

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move/from16 v3, p6

    invoke-interface {v0, v1, v2, v3}, Lcom/android/launcher2/DragController$DragListener;->onDragStart(Lcom/android/launcher2/DragSource;Ljava/lang/Object;I)V

    goto :goto_0

    .line 226
    .end local v17           #listener:Lcom/android/launcher2/DragController$DragListener;
    :cond_1
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    sub-int v7, v5, p2

    .line 227
    .local v7, registrationX:I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    sub-int v8, v5, p3

    .line 235
    .local v8, registrationY:I
    if-nez p8, :cond_4

    const/4 v14, 0x0

    .line 236
    .local v14, dragRegionLeft:I
    :goto_1
    if-nez p8, :cond_5

    const/4 v15, 0x0

    .line 238
    .local v15, dragRegionTop:I
    :goto_2
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/launcher2/DragController;->mDragging:Z

    .line 240
    new-instance v5, Lcom/android/launcher2/DropTarget$DragObject;

    invoke-direct {v5}, Lcom/android/launcher2/DropTarget$DragObject;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    .line 242
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    .line 243
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    add-int v9, p2, v14

    sub-int/2addr v6, v9

    iput v6, v5, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    .line 244
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    add-int v9, p3, v15

    sub-int/2addr v6, v9

    iput v6, v5, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    .line 245
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    move-object/from16 v0, p4

    iput-object v0, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    .line 246
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    move-object/from16 v0, p5

    iput-object v0, v5, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 248
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mVibrator:Landroid/os/Vibrator;

    const-wide/16 v9, 0xf

    invoke-virtual {v5, v9, v10}, Landroid/os/Vibrator;->vibrate(J)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/DragController;->mDragObject:Lcom/android/launcher2/DropTarget$DragObject;

    move-object/from16 v18, v0

    new-instance v4, Lcom/android/launcher2/DragView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    move-object/from16 v6, p1

    move/from16 v13, p9

    invoke-direct/range {v4 .. v13}, Lcom/android/launcher2/DragView;-><init>(Lcom/android/launcher2/Launcher;Landroid/graphics/Bitmap;IIIIIIF)V

    move-object/from16 v0, v18

    iput-object v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    .line 253
    .local v4, dragView:Lcom/android/launcher2/DragView;
    if-eqz p7, :cond_2

    .line 254
    new-instance v5, Landroid/graphics/Point;

    move-object/from16 v0, p7

    invoke-direct {v5, v0}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    invoke-virtual {v4, v5}, Lcom/android/launcher2/DragView;->setDragVisualizeOffset(Landroid/graphics/Point;)V

    .line 256
    :cond_2
    if-eqz p8, :cond_3

    .line 257
    new-instance v5, Landroid/graphics/Rect;

    move-object/from16 v0, p8

    invoke-direct {v5, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v4, v5}, Lcom/android/launcher2/DragView;->setDragRegion(Landroid/graphics/Rect;)V

    .line 260
    :cond_3
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    invoke-virtual {v4, v5, v6}, Lcom/android/launcher2/DragView;->show(II)V

    .line 261
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/DragController;->mMotionDownX:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/DragController;->mMotionDownY:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/android/launcher2/DragController;->handleMoveEvent(II)V

    .line 262
    return-void

    .line 235
    .end local v4           #dragView:Lcom/android/launcher2/DragView;
    .end local v14           #dragRegionLeft:I
    .end local v15           #dragRegionTop:I
    :cond_4
    move-object/from16 v0, p8

    iget v14, v0, Landroid/graphics/Rect;->left:I

    goto/16 :goto_1

    .line 236
    .restart local v14       #dragRegionLeft:I
    :cond_5
    move-object/from16 v0, p8

    iget v15, v0, Landroid/graphics/Rect;->top:I

    goto/16 :goto_2
.end method

.method public startDrag(Landroid/view/View;Landroid/graphics/Bitmap;Lcom/android/launcher2/DragSource;Ljava/lang/Object;ILandroid/graphics/Rect;F)V
    .locals 11
    .parameter "v"
    .parameter "bmp"
    .parameter "source"
    .parameter "dragInfo"
    .parameter "dragAction"
    .parameter "dragRegion"
    .parameter "initialDragViewScale"

    .prologue
    .line 179
    iget-object v10, p0, Lcom/android/launcher2/DragController;->mCoordinatesTemp:[I

    .line 180
    .local v10, loc:[I
    iget-object v0, p0, Lcom/android/launcher2/DragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p1, v10}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 181
    const/4 v0, 0x0

    aget v0, v10, v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p7

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v1, v4

    const/high16 v4, 0x4000

    div-float/2addr v1, v4

    float-to-int v1, v1

    add-int v2, v0, v1

    .line 183
    .local v2, dragLayerX:I
    const/4 v0, 0x1

    aget v0, v10, v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p7

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v1, v4

    const/high16 v4, 0x4000

    div-float/2addr v1, v4

    float-to-int v1, v1

    add-int v3, v0, v1

    .line 186
    .local v3, dragLayerY:I
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p2

    move-object v4, p3

    move-object v5, p4

    move/from16 v6, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher2/DragController;->startDrag(Landroid/graphics/Bitmap;IILcom/android/launcher2/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V

    .line 189
    if-nez p5, :cond_0

    .line 190
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 192
    :cond_0
    return-void
.end method
