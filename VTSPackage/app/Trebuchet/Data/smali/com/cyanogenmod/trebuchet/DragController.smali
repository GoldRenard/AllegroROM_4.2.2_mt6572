.class public Lcom/cyanogenmod/trebuchet/DragController;
.super Ljava/lang/Object;
.source "DragController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;,
        Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    }
.end annotation


# static fields
.field public static DRAG_ACTION_COPY:I = 0x0

.field public static DRAG_ACTION_MOVE:I = 0x0

.field private static final MAX_FLING_DEGREES:F = 35.0f

.field private static final PROFILE_DRAWING_DURING_DRAG:Z = false

.field private static final RESCROLL_DELAY:I = 0x2ee

.field private static final SCROLL_DELAY:I = 0x1f4

.field static final SCROLL_LEFT:I = 0x0

.field static final SCROLL_NONE:I = -0x1

.field private static final SCROLL_OUTSIDE_ZONE:I = 0x0

.field static final SCROLL_RIGHT:I = 0x1

.field private static final SCROLL_WAITING_IN_ZONE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Trebuchet.DragController"

.field private static final VIBRATE_DURATION:I = 0xf


# instance fields
.field private final mCoordinatesTemp:[I

.field private mDistanceSinceScroll:I

.field private mDragLayerRect:Landroid/graphics/Rect;

.field private mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

.field private mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

.field private mDragging:Z

.field private mDropTargets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/DropTarget;",
            ">;"
        }
    .end annotation
.end field

.field private mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

.field protected mFlingToDeleteThresholdVelocity:I

.field private mHandler:Landroid/os/Handler;

.field private mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

.field private mLastTouch:[I

.field private mLastTouchUpTime:J

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/DragController$DragListener;",
            ">;"
        }
    .end annotation
.end field

.field private mMotionDownX:I

.field private mMotionDownY:I

.field private mMoveTarget:Landroid/view/View;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

.field private mScrollState:I

.field private mScrollView:Landroid/view/View;

.field private mScrollZone:I

.field private mTmpPoint:[I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mVibrator:Landroid/os/Vibrator;

.field private mWindowToken:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    sput v0, Lcom/cyanogenmod/trebuchet/DragController;->DRAG_ACTION_MOVE:I

    .line 48
    const/4 v0, 0x1

    sput v0, Lcom/cyanogenmod/trebuchet/DragController;->DRAG_ACTION_COPY:I

    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 6
    .parameter "launcher"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 71
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mCoordinatesTemp:[I

    .line 90
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 91
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    .line 103
    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    .line 104
    new-instance v2, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;-><init>(Lcom/cyanogenmod/trebuchet/DragController;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    .line 110
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouch:[I

    .line 111
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouchUpTime:J

    .line 112
    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I

    .line 114
    new-array v2, v4, [I

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mTmpPoint:[I

    .line 115
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    .line 147
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 148
    .local v1, r:Landroid/content/res/Resources;
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 149
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    .line 150
    const v2, 0x7f0d0032

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollZone:I

    .line 151
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 152
    const-string v2, "vibrator"

    invoke-virtual {p1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVibrator:Landroid/os/Vibrator;

    .line 154
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 155
    .local v0, density:F
    const/high16 v2, 0x7f0c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteThresholdVelocity:I

    .line 157
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/DragScroller;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

    return-object v0
.end method

.method static synthetic access$102(Lcom/cyanogenmod/trebuchet/DragController;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    return p1
.end method

.method static synthetic access$202(Lcom/cyanogenmod/trebuchet/DragController;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I

    return p1
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    return-object v0
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 752
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 753
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 755
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 756
    return-void
.end method

.method private clearScrollRunnable()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 470
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 471
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    if-ne v0, v2, :cond_0

    .line 472
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    .line 473
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->setDirection(I)V

    .line 474
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/DragScroller;->onExitScrollArea()Z

    .line 475
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->onExitScrollArea()V

    .line 477
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

    .line 656
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mCoordinatesTemp:[I

    .line 657
    .local v1, coordinates:[I
    float-to-int v3, p1

    float-to-int v4, p2

    invoke-direct {p0, v3, v4, v1}, Lcom/cyanogenmod/trebuchet/DragController;->findDropTarget(II[I)Lcom/cyanogenmod/trebuchet/DropTarget;

    move-result-object v2

    .line 659
    .local v2, dropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    aget v4, v1, v5

    iput v4, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    .line 660
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    aget v4, v1, v6

    iput v4, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    .line 661
    const/4 v0, 0x0

    .line 662
    .local v0, accepted:Z
    if-eqz v2, :cond_0

    .line 663
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput-boolean v6, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    .line 664
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 665
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 666
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 667
    const/4 v0, 0x1

    .line 670
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    check-cast v2, Landroid/view/View;

    .end local v2           #dropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v3, v2, v4, v5, v0}, Lcom/cyanogenmod/trebuchet/DragSource;->onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V

    .line 671
    return-void
.end method

.method private dropOnFlingToDeleteTarget(Landroid/graphics/PointF;)V
    .locals 7
    .parameter "vel"

    .prologue
    const/4 v6, 0x1

    .line 628
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mCoordinatesTemp:[I

    .line 630
    .local v1, coordinates:[I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    const/4 v3, 0x0

    aget v3, v1, v3

    iput v3, v2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    .line 631
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    aget v3, v1, v6

    iput v3, v2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    .line 635
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eq v2, v3, :cond_0

    .line 636
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 640
    :cond_0
    const/4 v0, 0x0

    .line 641
    .local v0, accepted:Z
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 644
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput-boolean v6, v2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    .line 645
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 646
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v2, v3}, Lcom/cyanogenmod/trebuchet/DropTarget;->acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 647
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget v4, v4, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    invoke-interface {v2, v3, v4, v5, p1}, Lcom/cyanogenmod/trebuchet/DropTarget;->onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V

    .line 649
    const/4 v0, 0x1

    .line 651
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v3, v2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    check-cast v2, Landroid/view/View;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v3, v2, v4, v6, v0}, Lcom/cyanogenmod/trebuchet/DragSource;->onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V

    .line 653
    return-void
.end method

.method private endDrag()V
    .locals 5

    .prologue
    .line 349
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v3, :cond_2

    .line 350
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    .line 351
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->clearScrollRunnable()V

    .line 352
    const/4 v1, 0x0

    .line 353
    .local v1, isDeferred:Z
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    if-eqz v3, :cond_1

    .line 354
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-boolean v1, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 355
    if-nez v1, :cond_0

    .line 356
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragView;->remove()V

    .line 358
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 362
    :cond_1
    if-nez v1, :cond_2

    .line 363
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/DragController$DragListener;

    .line 364
    .local v2, listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    invoke-interface {v2}, Lcom/cyanogenmod/trebuchet/DragController$DragListener;->onDragEnd()V

    goto :goto_0

    .line 369
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #isDeferred:Z
    .end local v2           #listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    :cond_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->releaseVelocityTracker()V

    .line 370
    return-void
.end method

.method private findDropTarget(II[I)Lcom/cyanogenmod/trebuchet/DropTarget;
    .locals 11
    .parameter "x"
    .parameter "y"
    .parameter "dropCoordinates"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 674
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 676
    .local v4, r:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 677
    .local v2, dropTargets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/DropTarget;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 678
    .local v0, count:I
    add-int/lit8 v3, v0, -0x1

    .local v3, i:I
    :goto_0
    if-ltz v3, :cond_3

    .line 679
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/DropTarget;

    .line 680
    .local v5, target:Lcom/cyanogenmod/trebuchet/DropTarget;
    invoke-interface {v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->isDropEnabled()Z

    move-result v6

    if-nez v6, :cond_1

    .line 678
    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 683
    :cond_1
    invoke-interface {v5, v4}, Lcom/cyanogenmod/trebuchet/DropTarget;->getHitRect(Landroid/graphics/Rect;)V

    .line 686
    invoke-interface {v5, p3}, Lcom/cyanogenmod/trebuchet/DropTarget;->getLocationInDragLayer([I)V

    .line 687
    aget v6, p3, v9

    invoke-interface {v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->getLeft()I

    move-result v7

    sub-int/2addr v6, v7

    aget v7, p3, v10

    invoke-interface {v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 689
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput p1, v6, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    .line 690
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput p2, v6, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    .line 691
    invoke-virtual {v4, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 692
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/cyanogenmod/trebuchet/DropTarget;->getDropTargetDelegate(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Lcom/cyanogenmod/trebuchet/DropTarget;

    move-result-object v1

    .line 693
    .local v1, delegate:Lcom/cyanogenmod/trebuchet/DropTarget;
    if-eqz v1, :cond_2

    .line 694
    move-object v5, v1

    .line 695
    invoke-interface {v5, p3}, Lcom/cyanogenmod/trebuchet/DropTarget;->getLocationInDragLayer([I)V

    .line 699
    :cond_2
    aget v6, p3, v9

    sub-int v6, p1, v6

    aput v6, p3, v9

    .line 700
    aget v6, p3, v10

    sub-int v6, p2, v6

    aput v6, p3, v10

    .line 705
    .end local v1           #delegate:Lcom/cyanogenmod/trebuchet/DropTarget;
    .end local v5           #target:Lcom/cyanogenmod/trebuchet/DropTarget;
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
    .line 392
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 393
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mTmpPoint:[I

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    invoke-static {p1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    aput v2, v0, v1

    .line 394
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mTmpPoint:[I

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragLayerRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    invoke-static {p2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    aput v2, v0, v1

    .line 395
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mTmpPoint:[I

    return-object v0
.end method

.method private handleMoveEvent(II)V
    .locals 13
    .parameter "x"
    .parameter "y"

    .prologue
    .line 480
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v5, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v5, p1, p2}, Lcom/cyanogenmod/trebuchet/DragView;->move(II)V

    .line 483
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mCoordinatesTemp:[I

    .line 484
    .local v0, coordinates:[I
    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->findDropTarget(II[I)Lcom/cyanogenmod/trebuchet/DropTarget;

    move-result-object v3

    .line 485
    .local v3, dropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    const/4 v6, 0x0

    aget v6, v0, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    .line 486
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    const/4 v6, 0x1

    aget v6, v0, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    .line 487
    if-eqz v3, :cond_5

    .line 488
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->getDropTargetDelegate(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Lcom/cyanogenmod/trebuchet/DropTarget;

    move-result-object v2

    .line 489
    .local v2, delegate:Lcom/cyanogenmod/trebuchet/DropTarget;
    if-eqz v2, :cond_0

    .line 490
    move-object v3, v2

    .line 493
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eq v5, v3, :cond_2

    .line 494
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v5, :cond_1

    .line 495
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 497
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 499
    :cond_2
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v3, v5}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragOver(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 505
    .end local v2           #delegate:Lcom/cyanogenmod/trebuchet/DropTarget;
    :cond_3
    :goto_0
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    .line 509
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledWindowTouchSlop()I

    move-result v4

    .line 510
    .local v4, slop:I
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I

    int-to-double v5, v5

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouch:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    sub-int/2addr v7, p1

    int-to-double v7, v7

    const-wide/high16 v9, 0x4000

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouch:[I

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

    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I

    .line 512
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouch:[I

    const/4 v6, 0x0

    aput p1, v5, v6

    .line 513
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouch:[I

    const/4 v6, 0x1

    aput p2, v5, v6

    .line 514
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I

    if-ge v5, v4, :cond_6

    const/16 v1, 0x2ee

    .line 516
    .local v1, delay:I
    :goto_1
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollZone:I

    if-ge p1, v5, :cond_7

    .line 517
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    if-nez v5, :cond_4

    .line 518
    const/4 v5, 0x1

    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    .line 519
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

    const/4 v6, 0x0

    invoke-interface {v5, p1, p2, v6}, Lcom/cyanogenmod/trebuchet/DragScroller;->onEnterScrollArea(III)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 520
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->onEnterScrollArea()V

    .line 521
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->setDirection(I)V

    .line 522
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    int-to-long v7, v1

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 537
    :cond_4
    :goto_2
    return-void

    .line 501
    .end local v1           #delay:I
    .end local v4           #slop:I
    :cond_5
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v5, :cond_3

    .line 502
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v5, v6}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    goto :goto_0

    .line 514
    .restart local v4       #slop:I
    :cond_6
    const/16 v1, 0x1f4

    goto :goto_1

    .line 525
    .restart local v1       #delay:I
    :cond_7
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    iget v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollZone:I

    sub-int/2addr v5, v6

    if-le p1, v5, :cond_8

    .line 526
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    if-nez v5, :cond_4

    .line 527
    const/4 v5, 0x1

    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    .line 528
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

    const/4 v6, 0x1

    invoke-interface {v5, p1, p2, v6}, Lcom/cyanogenmod/trebuchet/DragScroller;->onEnterScrollArea(III)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 529
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->onEnterScrollArea()V

    .line 530
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->setDirection(I)V

    .line 531
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    int-to-long v7, v1

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    .line 535
    :cond_8
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->clearScrollRunnable()V

    goto :goto_2
.end method

.method private isFlingingToDelete(Lcom/cyanogenmod/trebuchet/DragSource;)Landroid/graphics/PointF;
    .locals 9
    .parameter "source"

    .prologue
    const/4 v4, 0x0

    .line 607
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-nez v5, :cond_1

    move-object v3, v4

    .line 624
    :cond_0
    :goto_0
    return-object v3

    .line 608
    :cond_1
    invoke-interface {p1}, Lcom/cyanogenmod/trebuchet/DragSource;->supportsFlingToDelete()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v3, v4

    goto :goto_0

    .line 610
    :cond_2
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 611
    .local v0, config:Landroid/view/ViewConfiguration;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v6, 0x3e8

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 613
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v5

    iget v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteThresholdVelocity:I

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    .line 615
    new-instance v3, Landroid/graphics/PointF;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 617
    .local v3, vel:Landroid/graphics/PointF;
    new-instance v2, Landroid/graphics/PointF;

    const/4 v5, 0x0

    const/high16 v6, -0x4080

    invoke-direct {v2, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 618
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

    .line 620
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

    .line 624
    goto :goto_0
.end method

.method private releaseVelocityTracker()V
    .locals 1

    .prologue
    .line 759
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 760
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 761
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 763
    :cond_0
    return-void
.end method


# virtual methods
.method public addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V
    .locals 1
    .parameter "l"

    .prologue
    .line 720
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 721
    return-void
.end method

.method public addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V
    .locals 1
    .parameter "target"

    .prologue
    .line 734
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 735
    return-void
.end method

.method public cancelDrag()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 316
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v0, :cond_1

    .line 317
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v0, v1}, Lcom/cyanogenmod/trebuchet/DropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput-boolean v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 321
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->cancelled:Z

    .line 322
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    .line 323
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-interface {v0, v1, v2, v3, v3}, Lcom/cyanogenmod/trebuchet/DragSource;->onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V

    .line 325
    :cond_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->endDrag()V

    .line 326
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 305
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    return v0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .parameter "focused"
    .parameter "direction"

    .prologue
    .line 466
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMoveTarget:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMoveTarget:Landroid/view/View;

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
    .line 160
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    return v0
.end method

.method public forceMoveEvent()V
    .locals 2

    .prologue
    .line 540
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v0, :cond_0

    .line 541
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->handleMoveEvent(II)V

    .line 543
    :cond_0
    return-void
.end method

.method getDragView()Lcom/cyanogenmod/trebuchet/DragView;
    .locals 1

    .prologue
    .line 773
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    return-object v0
.end method

.method getLastGestureUpTime()J
    .locals 2

    .prologue
    .line 399
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v0, :cond_0

    .line 400
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 402
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouchUpTime:J

    goto :goto_0
.end method

.method getViewBitmap(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 8
    .parameter "v"

    .prologue
    const/4 v5, 0x0

    .line 260
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 261
    invoke-virtual {p1, v5}, Landroid/view/View;->setPressed(Z)V

    .line 263
    invoke-virtual {p1}, Landroid/view/View;->willNotCacheDrawing()Z

    move-result v4

    .line 264
    .local v4, willNotCache:Z
    invoke-virtual {p1, v5}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 268
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCacheBackgroundColor()I

    move-result v3

    .line 269
    .local v3, color:I
    invoke-virtual {p1, v5}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    .line 270
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    .line 271
    .local v0, alpha:F
    const/high16 v5, 0x3f80

    invoke-virtual {p1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 273
    if-eqz v3, :cond_0

    .line 274
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 276
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->buildDrawingCache()V

    .line 277
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 278
    .local v2, cacheBitmap:Landroid/graphics/Bitmap;
    if-nez v2, :cond_1

    .line 279
    const-string v5, "Trebuchet.DragController"

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

    .line 280
    const/4 v1, 0x0

    .line 291
    :goto_0
    return-object v1

    .line 283
    :cond_1
    invoke-static {v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 286
    .local v1, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 287
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 288
    invoke-virtual {p1, v4}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 289
    invoke-virtual {p1, v3}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    goto :goto_0
.end method

.method public isDragging()Z
    .locals 1

    .prologue
    .line 309
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    return v0
.end method

.method public onAppsRemoved(Ljava/util/ArrayList;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 329
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    if-eqz v5, :cond_1

    .line 330
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v4, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 331
    .local v4, rawDragInfo:Ljava/lang/Object;
    instance-of v5, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v5, :cond_1

    move-object v0, v4

    .line 332
    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 333
    .local v0, dragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
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

    .line 335
    .local v3, pn:Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v5, :cond_0

    .line 337
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 338
    .local v2, isSamePackage:Z
    if-eqz v2, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragController;->cancelDrag()V

    .line 346
    .end local v0           #dragInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #isSamePackage:Z
    .end local v3           #pn:Ljava/lang/String;
    .end local v4           #rawDragInfo:Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method onDeferredEndDrag(Lcom/cyanogenmod/trebuchet/DragView;)V
    .locals 3
    .parameter "dragView"

    .prologue
    .line 376
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/DragView;->remove()V

    .line 379
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/DragController$DragListener;

    .line 380
    .local v1, listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    invoke-interface {v1}, Lcom/cyanogenmod/trebuchet/DragController$DragListener;->onDragEnd()V

    goto :goto_0

    .line 382
    .end local v1           #listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    :cond_0
    return-void
.end method

.method onDeferredEndFling(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 385
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/DragSource;->onFlingToDeleteCompleted()V

    .line 386
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "ev"

    .prologue
    .line 415
    const/4 v1, 0x0

    .line 422
    .local v1, debug:Z
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DragController;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 424
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 425
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-direct {p0, v6, v7}, Lcom/cyanogenmod/trebuchet/DragController;->getClampedDragLayerPos(FF)[I

    move-result-object v2

    .line 426
    .local v2, dragLayerPos:[I
    const/4 v6, 0x0

    aget v3, v2, v6

    .line 427
    .local v3, dragLayerX:I
    const/4 v6, 0x1

    aget v4, v2, v6

    .line 429
    .local v4, dragLayerY:I
    packed-switch v0, :pswitch_data_0

    .line 455
    :goto_0
    :pswitch_0
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    return v6

    .line 434
    :pswitch_1
    iput v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    .line 435
    iput v4, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    .line 436
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    goto :goto_0

    .line 439
    :pswitch_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouchUpTime:J

    .line 440
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v6, :cond_0

    .line 441
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v6, v6, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v6}, Lcom/cyanogenmod/trebuchet/DragController;->isFlingingToDelete(Lcom/cyanogenmod/trebuchet/DragSource;)Landroid/graphics/PointF;

    move-result-object v5

    .line 442
    .local v5, vec:Landroid/graphics/PointF;
    if-eqz v5, :cond_1

    .line 443
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/DragController;->dropOnFlingToDeleteTarget(Landroid/graphics/PointF;)V

    .line 448
    .end local v5           #vec:Landroid/graphics/PointF;
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->endDrag()V

    goto :goto_0

    .line 445
    .restart local v5       #vec:Landroid/graphics/PointF;
    :cond_1
    int-to-float v6, v3

    int-to-float v7, v4

    invoke-direct {p0, v6, v7}, Lcom/cyanogenmod/trebuchet/DragController;->drop(FF)V

    goto :goto_1

    .line 451
    .end local v5           #vec:Landroid/graphics/PointF;
    :pswitch_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragController;->cancelDrag()V

    goto :goto_0

    .line 429
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

    .line 549
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-nez v7, :cond_0

    .line 598
    :goto_0
    return v5

    .line 554
    :cond_0
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/DragController;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 556
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 557
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-direct {p0, v7, v8}, Lcom/cyanogenmod/trebuchet/DragController;->getClampedDragLayerPos(FF)[I

    move-result-object v1

    .line 558
    .local v1, dragLayerPos:[I
    aget v2, v1, v5

    .line 559
    .local v2, dragLayerX:I
    aget v3, v1, v6

    .line 561
    .local v3, dragLayerY:I
    packed-switch v0, :pswitch_data_0

    :goto_1
    move v5, v6

    .line 598
    goto :goto_0

    .line 564
    :pswitch_0
    iput v2, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    .line 565
    iput v3, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    .line 567
    iget v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollZone:I

    if-lt v2, v7, :cond_1

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    iget v8, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollZone:I

    sub-int/2addr v7, v8

    if-le v2, v7, :cond_2

    .line 568
    :cond_1
    iput v6, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    .line 569
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    const-wide/16 v8, 0x1f4

    invoke-virtual {v5, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 571
    :cond_2
    iput v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I

    goto :goto_1

    .line 575
    :pswitch_1
    invoke-direct {p0, v2, v3}, Lcom/cyanogenmod/trebuchet/DragController;->handleMoveEvent(II)V

    goto :goto_1

    .line 579
    :pswitch_2
    invoke-direct {p0, v2, v3}, Lcom/cyanogenmod/trebuchet/DragController;->handleMoveEvent(II)V

    .line 580
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    invoke-virtual {v5, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 582
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    if-eqz v5, :cond_3

    .line 583
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    iget-object v5, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/DragController;->isFlingingToDelete(Lcom/cyanogenmod/trebuchet/DragSource;)Landroid/graphics/PointF;

    move-result-object v4

    .line 584
    .local v4, vec:Landroid/graphics/PointF;
    if-eqz v4, :cond_4

    .line 585
    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/DragController;->dropOnFlingToDeleteTarget(Landroid/graphics/PointF;)V

    .line 590
    .end local v4           #vec:Landroid/graphics/PointF;
    :cond_3
    :goto_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/DragController;->endDrag()V

    goto :goto_1

    .line 587
    .restart local v4       #vec:Landroid/graphics/PointF;
    :cond_4
    int-to-float v5, v2

    int-to-float v7, v3

    invoke-direct {p0, v5, v7}, Lcom/cyanogenmod/trebuchet/DragController;->drop(FF)V

    goto :goto_2

    .line 593
    .end local v4           #vec:Landroid/graphics/PointF;
    :pswitch_3
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragController;->mHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollRunnable:Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;

    invoke-virtual {v5, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 594
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragController;->cancelDrag()V

    goto :goto_1

    .line 561
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public removeDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V
    .locals 1
    .parameter "l"

    .prologue
    .line 727
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 728
    return-void
.end method

.method public removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V
    .locals 1
    .parameter "target"

    .prologue
    .line 741
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 742
    return-void
.end method

.method resetLastGestureUpTime()V
    .locals 2

    .prologue
    .line 407
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLastTouchUpTime:J

    .line 408
    return-void
.end method

.method public setDragScoller(Lcom/cyanogenmod/trebuchet/DragScroller;)V
    .locals 0
    .parameter "scroller"

    .prologue
    .line 709
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;

    .line 710
    return-void
.end method

.method public setFlingToDeleteDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V
    .locals 0
    .parameter "target"

    .prologue
    .line 748
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mFlingToDeleteDropTarget:Lcom/cyanogenmod/trebuchet/DropTarget;

    .line 749
    return-void
.end method

.method setMoveTarget(Landroid/view/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 462
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mMoveTarget:Landroid/view/View;

    .line 463
    return-void
.end method

.method public setScrollView(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 769
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mScrollView:Landroid/view/View;

    .line 770
    return-void
.end method

.method public setWindowToken(Landroid/os/IBinder;)V
    .locals 0
    .parameter "token"

    .prologue
    .line 713
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mWindowToken:Landroid/os/IBinder;

    .line 714
    return-void
.end method

.method public startDrag(Landroid/graphics/Bitmap;IILcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V
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
    .line 214
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    if-nez v5, :cond_0

    .line 215
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const-string v6, "input_method"

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/inputmethod/InputMethodManager;

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 218
    :cond_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/DragController;->mWindowToken:Landroid/os/IBinder;

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v9}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 220
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/cyanogenmod/trebuchet/DragController$DragListener;

    .line 221
    .local v17, listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    move-object/from16 v0, v17

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move/from16 v3, p6

    invoke-interface {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/DragController$DragListener;->onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V

    goto :goto_0

    .line 224
    .end local v17           #listener:Lcom/cyanogenmod/trebuchet/DragController$DragListener;
    :cond_1
    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    sub-int v7, v5, p2

    .line 225
    .local v7, registrationX:I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    sub-int v8, v5, p3

    .line 227
    .local v8, registrationY:I
    if-nez p8, :cond_4

    const/4 v14, 0x0

    .line 228
    .local v14, dragRegionLeft:I
    :goto_1
    if-nez p8, :cond_5

    const/4 v15, 0x0

    .line 230
    .local v15, dragRegionTop:I
    :goto_2
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragging:Z

    .line 232
    new-instance v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-direct {v5}, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    .line 234
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    .line 235
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    add-int v9, p2, v14

    sub-int/2addr v6, v9

    iput v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    .line 236
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    add-int v9, p3, v15

    sub-int/2addr v6, v9

    iput v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    .line 237
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    move-object/from16 v0, p4

    iput-object v0, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    .line 238
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    move-object/from16 v0, p5

    iput-object v0, v5, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 240
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mVibrator:Landroid/os/Vibrator;

    const-wide/16 v9, 0xf

    invoke-virtual {v5, v9, v10}, Landroid/os/Vibrator;->vibrate(J)V

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DragController;->mDragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    move-object/from16 v18, v0

    new-instance v4, Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    move-object/from16 v6, p1

    move/from16 v13, p9

    invoke-direct/range {v4 .. v13}, Lcom/cyanogenmod/trebuchet/DragView;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/graphics/Bitmap;IIIIIIF)V

    move-object/from16 v0, v18

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    .line 245
    .local v4, dragView:Lcom/cyanogenmod/trebuchet/DragView;
    if-eqz p7, :cond_2

    .line 246
    new-instance v5, Landroid/graphics/Point;

    move-object/from16 v0, p7

    invoke-direct {v5, v0}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragView;->setDragVisualizeOffset(Landroid/graphics/Point;)V

    .line 248
    :cond_2
    if-eqz p8, :cond_3

    .line 249
    new-instance v5, Landroid/graphics/Rect;

    move-object/from16 v0, p8

    invoke-direct {v5, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragView;->setDragRegion(Landroid/graphics/Rect;)V

    .line 252
    :cond_3
    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    invoke-virtual {v4, v5, v6}, Lcom/cyanogenmod/trebuchet/DragView;->show(II)V

    .line 253
    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownX:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DragController;->mMotionDownY:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/cyanogenmod/trebuchet/DragController;->handleMoveEvent(II)V

    .line 254
    return-void

    .line 227
    .end local v4           #dragView:Lcom/cyanogenmod/trebuchet/DragView;
    .end local v14           #dragRegionLeft:I
    .end local v15           #dragRegionTop:I
    :cond_4
    move-object/from16 v0, p8

    iget v14, v0, Landroid/graphics/Rect;->left:I

    goto/16 :goto_1

    .line 228
    .restart local v14       #dragRegionLeft:I
    :cond_5
    move-object/from16 v0, p8

    iget v15, v0, Landroid/graphics/Rect;->top:I

    goto/16 :goto_2
.end method

.method public startDrag(Landroid/view/View;Landroid/graphics/Bitmap;Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;ILandroid/graphics/Rect;F)V
    .locals 12
    .parameter "v"
    .parameter "bmp"
    .parameter "source"
    .parameter "dragInfo"
    .parameter "dragAction"
    .parameter "dragRegion"
    .parameter "initialDragViewScale"

    .prologue
    .line 177
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/DragController;->mCoordinatesTemp:[I

    .line 178
    .local v11, loc:[I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v1

    invoke-virtual {v1, p1, v11}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 179
    const/4 v1, 0x0

    aget v1, v11, v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p7

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v2, v5

    const/high16 v5, 0x4000

    div-float/2addr v2, v5

    float-to-int v2, v2

    add-int v3, v1, v2

    .line 181
    .local v3, dragLayerX:I
    const/4 v1, 0x1

    aget v1, v11, v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p7

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v2, v5

    const/high16 v5, 0x4000

    div-float/2addr v2, v5

    float-to-int v2, v2

    add-int v4, v1, v2

    .line 184
    .local v4, dragLayerY:I
    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    invoke-virtual/range {v1 .. v10}, Lcom/cyanogenmod/trebuchet/DragController;->startDrag(Landroid/graphics/Bitmap;IILcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V

    .line 187
    sget v1, Lcom/cyanogenmod/trebuchet/DragController;->DRAG_ACTION_MOVE:I

    move/from16 v0, p5

    if-ne v0, v1, :cond_0

    .line 188
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 190
    :cond_0
    return-void
.end method
