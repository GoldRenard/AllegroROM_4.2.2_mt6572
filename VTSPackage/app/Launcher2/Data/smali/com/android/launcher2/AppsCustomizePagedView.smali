.class public Lcom/android/launcher2/AppsCustomizePagedView;
.super Lcom/android/launcher2/PagedViewWithDraggableItems;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/android/launcher2/DragSource;
.implements Lcom/android/launcher2/PagedViewIcon$PressedCallback;
.implements Lcom/android/launcher2/PagedViewWidget$ShortPressListener;
.implements Lcom/android/launcher2/LauncherTransitionable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/AppsCustomizePagedView$ContentType;
    }
.end annotation


# static fields
.field private static CAMERA_DISTANCE:F = 0.0f

.field private static final PERFORM_OVERSCROLL_ROTATION:Z = true

.field private static final TAG:Ljava/lang/String; = "AppsCustomizePagedView"

.field private static TRANSITION_MAX_ROTATION:F = 0.0f

.field private static TRANSITION_PIVOT:F = 0.0f

.field private static TRANSITION_SCALE_FACTOR:F = 0.0f

.field static final WIDGET_BOUND:I = 0x1

.field static final WIDGET_INFLATED:I = 0x2

.field static final WIDGET_NO_CLEANUP_REQUIRED:I = -0x1

.field static final WIDGET_PRELOAD_PENDING:I = 0x0

.field static final sLookAheadPageCount:I = 0x2

.field static final sLookBehindPageCount:I = 0x2

.field private static final sPageSleepDelay:I = 0xc8


# instance fields
.field private mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

.field private mAppIconSize:I

.field private mApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mAppsHasSet:Z

.field private mBindWidgetRunnable:Ljava/lang/Runnable;

.field mCachedAppWidgetPreviewCanvas:Lcom/android/launcher2/CanvasCache;

.field mCachedAppWidgetPreviewDestRect:Lcom/android/launcher2/RectCache;

.field mCachedAppWidgetPreviewPaint:Lcom/android/launcher2/PaintCache;

.field mCachedAppWidgetPreviewSrcRect:Lcom/android/launcher2/RectCache;

.field mCachedShortcutPreviewBitmap:Lcom/android/launcher2/BitmapCache;

.field mCachedShortcutPreviewCanvas:Lcom/android/launcher2/CanvasCache;

.field mCachedShortcutPreviewPaint:Lcom/android/launcher2/PaintCache;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mClingFocusedX:I

.field private mClingFocusedY:I

.field private mContentWidth:I

.field mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

.field private mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/AsyncTaskPageData;",
            ">;"
        }
    .end annotation
.end field

.field private mDragController:Lcom/android/launcher2/DragController;

.field private mDraggingWidget:Z

.field private mHasShownAllAppsCling:Z

.field private mIconCache:Lcom/android/launcher2/IconCache;

.field private mInTransition:Z

.field private mInflateWidgetRunnable:Ljava/lang/Runnable;

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private final mLayoutInflater:Landroid/view/LayoutInflater;

.field private mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field private mMaxAppCellCountX:I

.field private mMaxAppCellCountY:I

.field private mNumAppsPages:I

.field private mNumWidgetPages:I

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field private mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

.field mRunningTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/AppsCustomizeAsyncTask;",
            ">;"
        }
    .end annotation
.end field

.field private mSaveInstanceStateItemIndex:I

.field private mTmpRect:Landroid/graphics/Rect;

.field mWidgetCleanupState:I

.field private mWidgetCountX:I

.field private mWidgetCountY:I

.field private mWidgetHeightGap:I

.field private mWidgetInstructionToast:Landroid/widget/Toast;

.field mWidgetLoadingId:I

.field private mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

.field private mWidgetWidthGap:I

.field private mWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field mZInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;

.field private final sWidgetPreviewIconPaddingPercentage:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 289
    const v0, 0x45cb2000

    sput v0, Lcom/android/launcher2/AppsCustomizePagedView;->CAMERA_DISTANCE:F

    .line 290
    const v0, 0x3f3d70a4

    sput v0, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_SCALE_FACTOR:F

    .line 291
    const v0, 0x3f266666

    sput v0, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_PIVOT:F

    .line 292
    const/high16 v0, 0x41b0

    sput v0, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_MAX_ROTATION:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x2

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 338
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/PagedViewWithDraggableItems;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 260
    iput v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 282
    const/high16 v2, 0x3e80

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->sWidgetPreviewIconPaddingPercentage:F

    .line 288
    new-instance v2, Lcom/android/launcher2/Workspace$ZInterpolator;

    const/high16 v3, 0x3f00

    invoke-direct {v2, v3}, Lcom/android/launcher2/Workspace$ZInterpolator;-><init>(F)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mZInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;

    .line 294
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    const v3, 0x3f666666

    invoke-direct {v2, v3}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 295
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x4080

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 301
    iput-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    .line 302
    iput-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    .line 307
    iput v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 308
    iput v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    .line 309
    iput-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 310
    iput-boolean v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 316
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    .line 318
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    .line 321
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    .line 324
    new-instance v2, Lcom/android/launcher2/BitmapCache;

    invoke-direct {v2}, Lcom/android/launcher2/BitmapCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/android/launcher2/BitmapCache;

    .line 325
    new-instance v2, Lcom/android/launcher2/PaintCache;

    invoke-direct {v2}, Lcom/android/launcher2/PaintCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/android/launcher2/PaintCache;

    .line 326
    new-instance v2, Lcom/android/launcher2/CanvasCache;

    invoke-direct {v2}, Lcom/android/launcher2/CanvasCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewCanvas:Lcom/android/launcher2/CanvasCache;

    .line 329
    new-instance v2, Lcom/android/launcher2/CanvasCache;

    invoke-direct {v2}, Lcom/android/launcher2/CanvasCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/android/launcher2/CanvasCache;

    .line 330
    new-instance v2, Lcom/android/launcher2/RectCache;

    invoke-direct {v2}, Lcom/android/launcher2/RectCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewSrcRect:Lcom/android/launcher2/RectCache;

    .line 331
    new-instance v2, Lcom/android/launcher2/RectCache;

    invoke-direct {v2}, Lcom/android/launcher2/RectCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewDestRect:Lcom/android/launcher2/RectCache;

    .line 332
    new-instance v2, Lcom/android/launcher2/PaintCache;

    invoke-direct {v2}, Lcom/android/launcher2/PaintCache;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/android/launcher2/PaintCache;

    .line 335
    iput-boolean v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppsHasSet:Z

    .line 339
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 340
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 341
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    .line 342
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    .line 343
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/LauncherApplication;

    invoke-virtual {v2}, Lcom/android/launcher2/LauncherApplication;->getIconCache()Lcom/android/launcher2/IconCache;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mIconCache:Lcom/android/launcher2/IconCache;

    .line 344
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2}, Landroid/graphics/Canvas;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    .line 345
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    .line 348
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 349
    .local v1, resources:Landroid/content/res/Resources;
    const v2, 0x7f0b0022

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    .line 351
    sget-object v2, Lcom/android/launcher/R$styleable;->AppsCustomizePagedView:[I

    invoke-virtual {p1, p2, v2, v4, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 352
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountX:I

    .line 353
    invoke-virtual {v0, v8, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountY:I

    .line 354
    invoke-virtual {v0, v6, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetWidthGap:I

    .line 356
    const/4 v2, 0x3

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetHeightGap:I

    .line 358
    const/4 v2, 0x4

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    .line 359
    const/4 v2, 0x5

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    .line 360
    const/4 v2, 0x6

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mClingFocusedX:I

    .line 361
    const/4 v2, 0x7

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mClingFocusedY:I

    .line 362
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 363
    new-instance v2, Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/launcher2/PagedViewCellLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    .line 367
    iput-boolean v4, p0, Lcom/android/launcher2/PagedView;->mFadeInAdjacentScreens:Z

    .line 370
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getImportantForAccessibility()I

    move-result v2

    if-nez v2, :cond_0

    .line 371
    invoke-virtual {p0, v8}, Lcom/android/launcher2/AppsCustomizePagedView;->setImportantForAccessibility(I)V

    .line 373
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/AppsCustomizePagedView;)Lcom/android/launcher2/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 239
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/launcher2/AppsCustomizePagedView;Lcom/android/launcher2/AppsCustomizeAsyncTask;Lcom/android/launcher2/AsyncTaskPageData;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 239
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->loadWidgetPreviewsInBackground(Lcom/android/launcher2/AppsCustomizeAsyncTask;Lcom/android/launcher2/AsyncTaskPageData;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/launcher2/AppsCustomizePagedView;Lcom/android/launcher2/AsyncTaskPageData;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 239
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/android/launcher2/AsyncTaskPageData;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/launcher2/AppsCustomizePagedView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInTransition:Z

    return v0
.end method

.method static synthetic access$400(Lcom/android/launcher2/AppsCustomizePagedView;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 239
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/launcher2/AppsCustomizePagedView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 239
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    return v0
.end method

.method static synthetic access$600(Lcom/android/launcher2/AppsCustomizePagedView;ILjava/util/ArrayList;III)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 239
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/AppsCustomizePagedView;->prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;III)V

    return-void
.end method

.method private addAppsWithoutInvalidate(Ljava/util/ArrayList;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1949
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1950
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1951
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/ApplicationInfo;

    .line 1952
    .local v3, info:Lcom/android/launcher2/ApplicationInfo;
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getAppNameComparator()Ljava/util/Comparator;

    move-result-object v5

    invoke-static {v4, v3, v5}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v2

    .line 1953
    .local v2, index:I
    if-gez v2, :cond_0

    .line 1954
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    add-int/lit8 v5, v2, 0x1

    neg-int v5, v5

    invoke-virtual {v4, v5, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1956
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "addAppsWithoutInvalidate: mApps size = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", index = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", info = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1950
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1961
    .end local v2           #index:I
    .end local v3           #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_1
    return-void
.end method

.method private beginDraggingApplication(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 658
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Workspace;->onDragStartedWithItem(Landroid/view/View;)V

    .line 659
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/android/launcher2/Workspace;->beginDragShared(Landroid/view/View;Lcom/android/launcher2/DragSource;)V

    .line 660
    return-void
.end method

.method private beginDraggingWidget(Landroid/view/View;)Z
    .locals 32
    .parameter "v"

    .prologue
    .line 814
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 816
    const v3, 0x7f07000e

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v25

    check-cast v25, Landroid/widget/ImageView;

    .line 817
    .local v25, image:Landroid/widget/ImageView;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/PendingAddItemInfo;

    .line 826
    .local v18, createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_0

    .line 827
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 828
    const/4 v3, 0x0

    .line 897
    :goto_0
    return v3

    .line 834
    :cond_0
    const/high16 v21, 0x3f80

    .line 835
    .local v21, scale:F
    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v3, :cond_3

    .line 838
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    if-nez v3, :cond_1

    .line 839
    const/4 v3, 0x0

    goto :goto_0

    .line 842
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    move-object/from16 v24, v0

    .line 843
    .local v24, createWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;
    move-object/from16 v18, v24

    .line 844
    move-object/from16 v0, v18

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 845
    .local v7, spanX:I
    move-object/from16 v0, v18

    iget v8, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 846
    .local v8, spanY:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v3

    const/4 v4, 0x1

    move-object/from16 v0, v24

    invoke-virtual {v3, v7, v8, v0, v4}, Lcom/android/launcher2/Workspace;->estimateItemSize(IILcom/android/launcher2/ItemInfo;Z)[I

    move-result-object v31

    .line 849
    .local v31, size:[I
    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v30

    check-cast v30, Lcom/android/launcher2/FastBitmapDrawable;

    .line 850
    .local v30, previewDrawable:Lcom/android/launcher2/FastBitmapDrawable;
    const/high16 v27, 0x3fa0

    .line 852
    .local v27, minScale:F
    invoke-virtual/range {v30 .. v30}, Lcom/android/launcher2/FastBitmapDrawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v27

    float-to-int v3, v3

    const/4 v4, 0x0

    aget v4, v31, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 853
    .local v9, maxWidth:I
    invoke-virtual/range {v30 .. v30}, Lcom/android/launcher2/FastBitmapDrawable;->getIntrinsicHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v27

    float-to-int v3, v3

    const/4 v4, 0x1

    aget v4, v31, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 854
    .local v10, maxHeight:I
    move-object/from16 v0, v24

    iget-object v4, v0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    move-object/from16 v0, v24

    iget v5, v0, Lcom/android/launcher2/PendingAddWidgetInfo;->previewImage:I

    move-object/from16 v0, v24

    iget v6, v0, Lcom/android/launcher2/PendingAddWidgetInfo;->icon:I

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v10}, Lcom/android/launcher2/AppsCustomizePagedView;->getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 858
    .local v13, preview:Landroid/graphics/Bitmap;
    const/16 v3, 0x9

    new-array v0, v3, [F

    move-object/from16 v28, v0

    .line 859
    .local v28, mv:[F
    new-instance v26, Landroid/graphics/Matrix;

    invoke-direct/range {v26 .. v26}, Landroid/graphics/Matrix;-><init>()V

    .line 860
    .local v26, m:Landroid/graphics/Matrix;
    new-instance v3, Landroid/graphics/RectF;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    int-to-float v11, v11

    invoke-direct {v3, v4, v5, v6, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v30 .. v30}, Lcom/android/launcher2/FastBitmapDrawable;->getIntrinsicWidth()I

    move-result v11

    int-to-float v11, v11

    invoke-virtual/range {v30 .. v30}, Lcom/android/launcher2/FastBitmapDrawable;->getIntrinsicHeight()I

    move-result v14

    int-to-float v14, v14

    invoke-direct {v4, v5, v6, v11, v14}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    move-object/from16 v0, v26

    invoke-virtual {v0, v3, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 865
    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 866
    const/4 v3, 0x0

    aget v21, v28, v3

    .line 883
    .end local v7           #spanX:I
    .end local v8           #spanY:I
    .end local v9           #maxWidth:I
    .end local v10           #maxHeight:I
    .end local v24           #createWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;
    .end local v26           #m:Landroid/graphics/Matrix;
    .end local v27           #minScale:F
    .end local v28           #mv:[F
    .end local v30           #previewDrawable:Lcom/android/launcher2/FastBitmapDrawable;
    .end local v31           #size:[I
    :goto_1
    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v3, :cond_2

    move-object/from16 v3, v18

    check-cast v3, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget v3, v3, Lcom/android/launcher2/PendingAddWidgetInfo;->previewImage:I

    if-eqz v3, :cond_4

    :cond_2
    const/16 v22, 0x1

    .line 887
    .local v22, clipAlpha:Z
    :goto_2
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v5, 0x0

    invoke-static {v13, v3, v4, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v29

    .line 891
    .local v29, outline:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->lockScreenOrientation()V

    .line 892
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v29

    move/from16 v2, v22

    invoke-virtual {v3, v0, v1, v2}, Lcom/android/launcher2/Workspace;->onDragStartedWithItem(Lcom/android/launcher2/PendingAddItemInfo;Landroid/graphics/Bitmap;Z)V

    .line 893
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mDragController:Lcom/android/launcher2/DragController;

    const/16 v19, 0x1

    const/16 v20, 0x0

    move-object/from16 v15, v25

    move-object/from16 v16, v13

    move-object/from16 v17, p0

    invoke-virtual/range {v14 .. v21}, Lcom/android/launcher2/DragController;->startDrag(Landroid/view/View;Landroid/graphics/Bitmap;Lcom/android/launcher2/DragSource;Ljava/lang/Object;ILandroid/graphics/Rect;F)V

    .line 895
    invoke-virtual/range {v29 .. v29}, Landroid/graphics/Bitmap;->recycle()V

    .line 896
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->recycle()V

    .line 897
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 868
    .end local v13           #preview:Landroid/graphics/Bitmap;
    .end local v22           #clipAlpha:Z
    .end local v29           #outline:Landroid/graphics/Bitmap;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/launcher2/PendingAddShortcutInfo;

    .line 869
    .local v23, createShortcutInfo:Lcom/android/launcher2/PendingAddShortcutInfo;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v0, v23

    iget-object v4, v0, Lcom/android/launcher2/PendingAddShortcutInfo;->shortcutActivityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v3, v4}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    .line 870
    .local v12, icon:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 873
    .restart local v13       #preview:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v13}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 874
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 875
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v16

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v17

    move-object/from16 v11, p0

    invoke-direct/range {v11 .. v17}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 877
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    .line 878
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 879
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v0, v18

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    goto/16 :goto_1

    .line 883
    .end local v12           #icon:Landroid/graphics/drawable/Drawable;
    .end local v23           #createShortcutInfo:Lcom/android/launcher2/PendingAddShortcutInfo;
    :cond_4
    const/16 v22, 0x0

    goto/16 :goto_2
.end method

.method private cancelAllTasks()V
    .locals 6

    .prologue
    .line 1096
    const-string v3, "AppsCustomizePagedView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cancelAllTasks: mRunningTasks size = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1100
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1101
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1102
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    .line 1103
    .local v1, task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->cancel(Z)Z

    .line 1104
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 1105
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    iget v4, v1, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1108
    iget v3, v1, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    invoke-virtual {p0, v3}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 1109
    .local v2, v:Landroid/view/View;
    instance-of v3, v2, Lcom/android/launcher2/PagedViewGridLayout;

    if-eqz v3, :cond_0

    .line 1110
    check-cast v2, Lcom/android/launcher2/PagedViewGridLayout;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewGridLayout;->removeAllViewsOnPage()V

    goto :goto_0

    .line 1113
    .end local v1           #task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    :cond_1
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1114
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1115
    return-void
.end method

.method private cleanupWidgetPreloading(Z)V
    .locals 7
    .parameter "widgetWasAdded"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 767
    const-string v2, "AppsCustomizePagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cleanupWidgetPreloading widgetWasAdded = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCreateWidgetInfo = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mWidgetLoadingId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    if-nez p1, :cond_0

    .line 774
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 775
    .local v0, info:Lcom/android/launcher2/PendingAddWidgetInfo;
    iput-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 777
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    if-nez v2, :cond_1

    .line 779
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 780
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 800
    .end local v0           #info:Lcom/android/launcher2/PendingAddWidgetInfo;
    :cond_0
    :goto_0
    iput v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 801
    iput v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    .line 802
    iput-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 803
    invoke-static {}, Lcom/android/launcher2/PagedViewWidget;->resetShortPressTarget()V

    .line 804
    return-void

    .line 781
    .restart local v0       #info:Lcom/android/launcher2/PendingAddWidgetInfo;
    :cond_1
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 783
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    if-eq v2, v5, :cond_2

    .line 784
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getAppWidgetHost()Lcom/android/launcher2/LauncherAppWidgetHost;

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    invoke-virtual {v2, v3}, Lcom/android/launcher2/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 788
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 789
    :cond_3
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 791
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    if-eq v2, v5, :cond_4

    .line 792
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getAppWidgetHost()Lcom/android/launcher2/LauncherAppWidgetHost;

    move-result-object v2

    iget v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetLoadingId:I

    invoke-virtual {v2, v3}, Lcom/android/launcher2/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 796
    :cond_4
    iget-object v1, v0, Lcom/android/launcher2/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 797
    .local v1, widget:Landroid/appwidget/AppWidgetHostView;
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    goto :goto_0
.end method

.method private dumpAppWidgetProviderInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 5
    .parameter "tag"
    .parameter "label"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2090
    .local p3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2091
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 2092
    .local v0, i:Ljava/lang/Object;
    instance-of v3, v0, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v3, :cond_1

    move-object v2, v0

    .line 2093
    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    .line 2094
    .local v2, info:Landroid/appwidget/AppWidgetProviderInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   label=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" previewImage="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " resizeMode="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " configure="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " initialLayout="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " minWidth="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " minHeight="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2098
    .end local v2           #info:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_1
    instance-of v3, v0, Landroid/content/pm/ResolveInfo;

    if-eqz v3, :cond_0

    move-object v2, v0

    .line 2099
    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 2100
    .local v2, info:Landroid/content/pm/ResolveInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   label=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" icon="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/content/pm/ResolveInfo;->icon:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2104
    .end local v0           #i:Ljava/lang/Object;
    .end local v2           #info:Landroid/content/pm/ResolveInfo;
    :cond_2
    return-void
.end method

.method private endDragging(Landroid/view/View;ZZ)V
    .locals 2
    .parameter "target"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    .line 948
    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v0

    if-eq p1, v0, :cond_1

    instance-of v0, p1, Lcom/android/launcher2/DeleteDropTarget;

    if-nez v0, :cond_1

    .line 952
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragMode()V

    .line 954
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Launcher;->unlockScreenOrientation(Z)V

    .line 955
    return-void
.end method

.method private findAppByComponent(Ljava/util/List;Lcom/android/launcher2/ApplicationInfo;)I
    .locals 5
    .parameter
    .parameter "item"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;",
            "Lcom/android/launcher2/ApplicationInfo;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1975
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/launcher2/ApplicationInfo;>;"
    iget-object v4, p2, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    .line 1976
    .local v3, removeComponent:Landroid/content/ComponentName;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .line 1977
    .local v2, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 1978
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 1979
    .local v1, info:Lcom/android/launcher2/ApplicationInfo;
    iget-object v4, v1, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1983
    .end local v0           #i:I
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    :goto_1
    return v0

    .line 1977
    .restart local v0       #i:I
    .restart local v1       #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1983
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private findAppByPackage(Ljava/util/List;Ljava/lang/String;)I
    .locals 7
    .parameter
    .parameter "packageName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1986
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/launcher2/ApplicationInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 1987
    .local v3, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 1988
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 1989
    .local v1, info:Lcom/android/launcher2/ApplicationInfo;
    iget-object v4, v1, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-static {v4}, Lcom/android/launcher2/ItemInfo;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1994
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, v1, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/Utilities;->isComponentEnabled(Landroid/content/Context;Landroid/content/ComponentName;)Z

    move-result v2

    .line 1996
    .local v2, isComponentEnabled:Z
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "findAppByPackage: i = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",name = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",isComponentEnabled = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1999
    if-nez v2, :cond_0

    .line 2004
    .end local v0           #i:I
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    .end local v2           #isComponentEnabled:Z
    :goto_1
    return v0

    .line 1987
    .restart local v0       #i:I
    .restart local v1       #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2004
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private getMiddleComponentIndexOnCurrentPage()I
    .locals 9

    .prologue
    .line 388
    const/4 v3, -0x1

    .line 389
    .local v3, i:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageCount()I

    move-result v7

    if-lez v7, :cond_0

    .line 390
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getCurrentPage()I

    move-result v2

    .line 391
    .local v2, currentPage:I
    iget v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v2, v7, :cond_1

    .line 392
    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/PagedViewCellLayout;

    .line 393
    .local v4, layout:Lcom/android/launcher2/PagedViewCellLayout;
    invoke-virtual {v4}, Lcom/android/launcher2/PagedViewCellLayout;->getChildrenLayout()Lcom/android/launcher2/PagedViewCellLayoutChildren;

    move-result-object v1

    .line 394
    .local v1, childrenLayout:Lcom/android/launcher2/PagedViewCellLayoutChildren;
    iget v7, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    iget v8, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    mul-int v6, v7, v8

    .line 395
    .local v6, numItemsPerPage:I
    invoke-virtual {v1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 396
    .local v0, childCount:I
    if-lez v0, :cond_0

    .line 397
    mul-int v7, v2, v6

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    .line 410
    .end local v0           #childCount:I
    .end local v1           #childrenLayout:Lcom/android/launcher2/PagedViewCellLayoutChildren;
    .end local v2           #currentPage:I
    .end local v4           #layout:Lcom/android/launcher2/PagedViewCellLayout;
    .end local v6           #numItemsPerPage:I
    :cond_0
    :goto_0
    return v3

    .line 400
    .restart local v2       #currentPage:I
    :cond_1
    iget-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 401
    .local v5, numApps:I
    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/PagedViewGridLayout;

    .line 402
    .local v4, layout:Lcom/android/launcher2/PagedViewGridLayout;
    iget v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    iget v8, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v6, v7, v8

    .line 403
    .restart local v6       #numItemsPerPage:I
    invoke-virtual {v4}, Lcom/android/launcher2/PagedViewGridLayout;->getChildCount()I

    move-result v0

    .line 404
    .restart local v0       #childCount:I
    if-lez v0, :cond_0

    .line 405
    iget v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int v7, v2, v7

    mul-int/2addr v7, v6

    add-int/2addr v7, v5

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    goto :goto_0
.end method

.method private getShortcutPreview(Landroid/content/pm/ResolveInfo;II)Landroid/graphics/Bitmap;
    .locals 19
    .parameter "info"
    .parameter "maxWidth"
    .parameter "maxHeight"

    .prologue
    .line 1369
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/android/launcher2/BitmapCache;

    invoke-virtual {v2}, Lcom/android/launcher2/BitmapCache;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 1370
    .local v4, tempBitmap:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewCanvas:Lcom/android/launcher2/CanvasCache;

    invoke-virtual {v2}, Lcom/android/launcher2/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Canvas;

    .line 1371
    .local v15, c:Landroid/graphics/Canvas;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    move/from16 v0, p2

    if-ne v2, v0, :cond_0

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    move/from16 v0, p3

    if-eq v2, v0, :cond_2

    .line 1374
    :cond_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1375
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/android/launcher2/BitmapCache;

    invoke-virtual {v2, v4}, Lcom/android/launcher2/BitmapCache;->set(Ljava/lang/Object;)V

    .line 1382
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/pm/ResolveInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1384
    .local v3, icon:Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0b003b

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    .line 1386
    .local v6, paddingTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0b0039

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    .line 1388
    .local v5, paddingLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0b003a

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v18

    .line 1391
    .local v18, paddingRight:I
    sub-int v2, p2, v5

    sub-int v7, v2, v18

    .local v7, scaledIconWidth:I
    move-object/from16 v2, p0

    move v8, v7

    .line 1393
    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1396
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 1397
    .local v10, preview:Landroid/graphics/Bitmap;
    invoke-virtual {v15, v10}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1398
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/android/launcher2/PaintCache;

    invoke-virtual {v2}, Lcom/android/launcher2/PaintCache;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/graphics/Paint;

    .line 1399
    .local v17, p:Landroid/graphics/Paint;
    if-nez v17, :cond_1

    .line 1400
    new-instance v17, Landroid/graphics/Paint;

    .end local v17           #p:Landroid/graphics/Paint;
    invoke-direct/range {v17 .. v17}, Landroid/graphics/Paint;-><init>()V

    .line 1401
    .restart local v17       #p:Landroid/graphics/Paint;
    new-instance v16, Landroid/graphics/ColorMatrix;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 1402
    .local v16, colorMatrix:Landroid/graphics/ColorMatrix;
    const/4 v2, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 1403
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1404
    const/16 v2, 0xf

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1407
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/android/launcher2/PaintCache;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/android/launcher2/PaintCache;->set(Ljava/lang/Object;)V

    .line 1409
    .end local v16           #colorMatrix:Landroid/graphics/ColorMatrix;
    :cond_1
    const/4 v2, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v15, v4, v2, v8, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1410
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1412
    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    move-object/from16 v8, p0

    move-object v9, v3

    invoke-direct/range {v8 .. v14}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1414
    return-object v10

    .line 1377
    .end local v3           #icon:Landroid/graphics/drawable/Drawable;
    .end local v5           #paddingLeft:I
    .end local v6           #paddingTop:I
    .end local v7           #scaledIconWidth:I
    .end local v10           #preview:Landroid/graphics/Bitmap;
    .end local v17           #p:Landroid/graphics/Paint;
    .end local v18           #paddingRight:I
    :cond_2
    invoke-virtual {v15, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1378
    const/4 v2, 0x0

    sget-object v8, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v15, v2, v8}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 1379
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0
.end method

.method private getSleepForPage(I)I
    .locals 3
    .parameter "page"

    .prologue
    .line 1275
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getWidgetPageLoadPriority(I)I

    move-result v0

    .line 1276
    .local v0, pageDiff:I
    const/4 v1, 0x0

    mul-int/lit16 v2, v0, 0xc8

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1
.end method

.method private getTabHost()Lcom/android/launcher2/AppsCustomizeTabHost;
    .locals 2

    .prologue
    .line 2079
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    const v1, 0x7f07002a

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/AppsCustomizeTabHost;

    return-object v0
.end method

.method private getThreadPriorityForPage(I)I
    .locals 3
    .parameter "page"

    .prologue
    const/16 v2, 0x13

    const/4 v1, 0x1

    .line 1264
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getWidgetPageLoadPriority(I)I

    move-result v0

    .line 1265
    .local v0, pageDiff:I
    if-gtz v0, :cond_0

    .line 1270
    :goto_0
    return v1

    .line 1267
    :cond_0
    if-gt v0, v1, :cond_1

    move v1, v2

    .line 1268
    goto :goto_0

    :cond_1
    move v1, v2

    .line 1270
    goto :goto_0
.end method

.method private getWidgetPageLoadPriority(I)I
    .locals 7
    .parameter "page"

    .prologue
    .line 1240
    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 1241
    .local v4, toPage:I
    iget v5, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v6, -0x1

    if-le v5, v6, :cond_0

    .line 1242
    iget v4, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 1248
    :cond_0
    iget-object v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1249
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    const v1, 0x7fffffff

    .line 1250
    .local v1, minPageDiff:I
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1251
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    .line 1252
    .local v3, task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    iget v5, v3, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    sub-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 1253
    goto :goto_0

    .line 1255
    .end local v3           #task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    :cond_1
    sub-int v5, p1, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 1256
    .local v2, rawPageDiff:I
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    sub-int v5, v2, v5

    return v5
.end method

.method private getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;
    .locals 32
    .parameter "provider"
    .parameter "previewImage"
    .parameter "iconId"
    .parameter "cellHSpan"
    .parameter "cellVSpan"
    .parameter "maxWidth"
    .parameter "maxHeight"

    .prologue
    .line 1421
    invoke-virtual/range {p1 .. p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v20

    .line 1423
    .local v20, packageName:Ljava/lang/String;
    if-gtz p6, :cond_0

    .line 1424
    const-string v2, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getWidgetPreview packageName="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", maxWidth:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p6

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1425
    const p6, 0x7fffffff

    .line 1427
    :cond_0
    if-gtz p7, :cond_1

    .line 1428
    const-string v2, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getWidgetPreview packageName="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", maxHeight:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1429
    const p7, 0x7fffffff

    .line 1432
    :cond_1
    const/16 v16, 0x0

    .line 1433
    .local v16, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz p2, :cond_2

    .line 1434
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v7, 0x0

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v2, v0, v1, v7}, Landroid/content/pm/PackageManager;->getDrawable(Ljava/lang/String;ILandroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 1435
    if-nez v16, :cond_2

    .line 1436
    const-string v2, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can\'t load widget preview drawable 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " for provider: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1442
    :cond_2
    const/4 v12, 0x0

    .line 1443
    .local v12, bitmapWidth:I
    const/4 v13, 0x0

    .line 1444
    .local v13, bitmapHeight:I
    const/4 v4, 0x0

    .line 1445
    .local v4, defaultPreview:Landroid/graphics/Bitmap;
    if-eqz v16, :cond_c

    const/16 v31, 0x1

    .line 1447
    .local v31, widgetPreviewExists:Z
    :goto_0
    const/16 v30, 0x0

    .line 1448
    .local v30, useWidgetPreview:Z
    if-eqz v31, :cond_4

    .line 1449
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v12

    .line 1450
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v13

    .line 1451
    if-lez v12, :cond_3

    if-gtz v13, :cond_d

    .line 1452
    :cond_3
    const-string v2, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getWidgetPreview packageName="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", getIntrinsicWidth():"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", getIntrinsicHeight(): "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1459
    :cond_4
    :goto_1
    if-nez v30, :cond_8

    .line 1461
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ge v0, v2, :cond_5

    const/16 p4, 0x1

    .line 1462
    :cond_5
    const/4 v2, 0x1

    move/from16 v0, p5

    if-ge v0, v2, :cond_6

    const/16 p5, 0x1

    .line 1464
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v7, 0x7f020092

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    check-cast v22, Landroid/graphics/drawable/BitmapDrawable;

    .line 1466
    .local v22, previewDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v24

    .line 1468
    .local v24, previewDrawableWidth:I
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v23

    .line 1470
    .local v23, previewDrawableHeight:I
    mul-int v12, v24, p4

    .line 1471
    mul-int v13, v23, p5

    .line 1473
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v13, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1475
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/android/launcher2/CanvasCache;

    invoke-virtual {v2}, Lcom/android/launcher2/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/graphics/Canvas;

    .line 1476
    .local v14, c:Landroid/graphics/Canvas;
    invoke-virtual {v14, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1477
    const/4 v2, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v2, v7, v12, v13}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 1484
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v21

    .line 1485
    .local v21, previewBitmap:Landroid/graphics/Bitmap;
    new-instance v26, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v2, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 1486
    .local v26, shader:Landroid/graphics/BitmapShader;
    new-instance v27, Landroid/graphics/Paint;

    invoke-direct/range {v27 .. v27}, Landroid/graphics/Paint;-><init>()V

    .line 1487
    .local v27, shaderPaint:Landroid/graphics/Paint;
    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1488
    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Landroid/graphics/Canvas;->drawPaint(Landroid/graphics/Paint;)V

    .line 1491
    const/4 v2, 0x0

    invoke-virtual {v14, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1494
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    const/high16 v7, 0x3e80

    mul-float/2addr v2, v7

    float-to-int v0, v2

    move/from16 v18, v0

    .line 1495
    .local v18, minOffset:I
    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v28

    .line 1496
    .local v28, smallestSide:I
    move/from16 v0, v28

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    mul-int/lit8 v8, v18, 0x2

    add-int/2addr v7, v8

    int-to-float v7, v7

    div-float/2addr v2, v7

    const/high16 v7, 0x3f80

    invoke-static {v2, v7}, Ljava/lang/Math;->min(FF)F

    move-result v17

    .line 1500
    .local v17, iconScale:F
    const/4 v3, 0x0

    .line 1501
    .local v3, icon:Landroid/graphics/drawable/Drawable;
    move/from16 v0, v24

    int-to-float v2, v0

    :try_start_0
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v7, v7

    mul-float v7, v7, v17

    sub-float/2addr v2, v7

    const/high16 v7, 0x4000

    div-float/2addr v2, v7

    float-to-int v5, v2

    .line 1503
    .local v5, hoffset:I
    move/from16 v0, v23

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v7, v7

    mul-float v7, v7, v17

    sub-float/2addr v2, v7

    const/high16 v7, 0x4000

    div-float/2addr v2, v7

    float-to-int v6, v2

    .line 1505
    .local v6, yoffset:I
    if-lez p3, :cond_7

    .line 1506
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v0, v20

    move/from16 v1, p3

    invoke-virtual {v2, v0, v1}, Lcom/android/launcher2/IconCache;->getFullResIcon(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1508
    :cond_7
    if-eqz v3, :cond_8

    .line 1509
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v7, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v8, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1519
    .end local v3           #icon:Landroid/graphics/drawable/Drawable;
    .end local v5           #hoffset:I
    .end local v6           #yoffset:I
    .end local v14           #c:Landroid/graphics/Canvas;
    .end local v17           #iconScale:F
    .end local v18           #minOffset:I
    .end local v21           #previewBitmap:Landroid/graphics/Bitmap;
    .end local v22           #previewDrawable:Landroid/graphics/drawable/BitmapDrawable;
    .end local v23           #previewDrawableHeight:I
    .end local v24           #previewDrawableWidth:I
    .end local v26           #shader:Landroid/graphics/BitmapShader;
    .end local v27           #shaderPaint:Landroid/graphics/Paint;
    .end local v28           #smallestSide:I
    :cond_8
    :goto_2
    const/high16 v25, 0x3f80

    .line 1520
    .local v25, scale:F
    move/from16 v0, p6

    if-le v12, v0, :cond_9

    .line 1521
    move/from16 v0, p6

    int-to-float v2, v0

    int-to-float v7, v12

    div-float v25, v2, v7

    .line 1524
    :cond_9
    int-to-float v2, v13

    mul-float v2, v2, v25

    move/from16 v0, p7

    int-to-float v7, v0

    cmpl-float v2, v2, v7

    if-lez v2, :cond_a

    .line 1525
    move/from16 v0, p7

    int-to-float v2, v0

    int-to-float v7, v13

    div-float v25, v2, v7

    .line 1528
    :cond_a
    const/high16 v2, 0x3f80

    cmpl-float v2, v25, v2

    if-eqz v2, :cond_b

    .line 1529
    int-to-float v2, v12

    mul-float v2, v2, v25

    float-to-int v12, v2

    .line 1530
    int-to-float v2, v13

    mul-float v2, v2, v25

    float-to-int v13, v2

    .line 1533
    :cond_b
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v13, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 1537
    .local v9, preview:Landroid/graphics/Bitmap;
    if-eqz v31, :cond_e

    .line 1538
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, v16

    invoke-direct/range {v7 .. v13}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1557
    :goto_3
    return-object v9

    .line 1445
    .end local v9           #preview:Landroid/graphics/Bitmap;
    .end local v25           #scale:F
    .end local v30           #useWidgetPreview:Z
    .end local v31           #widgetPreviewExists:Z
    :cond_c
    const/16 v31, 0x0

    goto/16 :goto_0

    .line 1455
    .restart local v30       #useWidgetPreview:Z
    .restart local v31       #widgetPreviewExists:Z
    :cond_d
    const/16 v30, 0x1

    goto/16 :goto_1

    .line 1541
    .restart local v9       #preview:Landroid/graphics/Bitmap;
    .restart local v25       #scale:F
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/android/launcher2/CanvasCache;

    invoke-virtual {v2}, Lcom/android/launcher2/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/graphics/Canvas;

    .line 1542
    .restart local v14       #c:Landroid/graphics/Canvas;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewSrcRect:Lcom/android/launcher2/RectCache;

    invoke-virtual {v2}, Lcom/android/launcher2/RectCache;->get()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Landroid/graphics/Rect;

    .line 1543
    .local v29, src:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewDestRect:Lcom/android/launcher2/RectCache;

    invoke-virtual {v2}, Lcom/android/launcher2/RectCache;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Rect;

    .line 1544
    .local v15, dest:Landroid/graphics/Rect;
    invoke-virtual {v14, v9}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1545
    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v7, v8, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 1546
    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    invoke-virtual {v15, v2, v7, v8, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 1548
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/android/launcher2/PaintCache;

    invoke-virtual {v2}, Lcom/android/launcher2/PaintCache;->get()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/graphics/Paint;

    .line 1549
    .local v19, p:Landroid/graphics/Paint;
    if-nez v19, :cond_f

    .line 1550
    new-instance v19, Landroid/graphics/Paint;

    .end local v19           #p:Landroid/graphics/Paint;
    invoke-direct/range {v19 .. v19}, Landroid/graphics/Paint;-><init>()V

    .line 1551
    .restart local v19       #p:Landroid/graphics/Paint;
    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1552
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/android/launcher2/PaintCache;

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Lcom/android/launcher2/PaintCache;->set(Ljava/lang/Object;)V

    .line 1554
    :cond_f
    move-object/from16 v0, v29

    move-object/from16 v1, v19

    invoke-virtual {v14, v4, v0, v15, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1555
    const/4 v2, 0x0

    invoke-virtual {v14, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_3

    .line 1513
    .end local v9           #preview:Landroid/graphics/Bitmap;
    .end local v15           #dest:Landroid/graphics/Rect;
    .end local v19           #p:Landroid/graphics/Paint;
    .end local v25           #scale:F
    .end local v29           #src:Landroid/graphics/Rect;
    .restart local v3       #icon:Landroid/graphics/drawable/Drawable;
    .restart local v17       #iconScale:F
    .restart local v18       #minOffset:I
    .restart local v21       #previewBitmap:Landroid/graphics/Bitmap;
    .restart local v22       #previewDrawable:Landroid/graphics/drawable/BitmapDrawable;
    .restart local v23       #previewDrawableHeight:I
    .restart local v24       #previewDrawableWidth:I
    .restart local v26       #shader:Landroid/graphics/BitmapShader;
    .restart local v27       #shaderPaint:Landroid/graphics/Paint;
    .restart local v28       #smallestSide:I
    :catch_0
    move-exception v2

    goto/16 :goto_2
.end method

.method private invalidateOnDataChange()V
    .locals 1

    .prologue
    .line 1924
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->isDataReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1927
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->requestLayout()V

    .line 1932
    :goto_0
    return-void

    .line 1929
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1930
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData()V

    goto :goto_0
.end method

.method private loadWidgetPreviewsInBackground(Lcom/android/launcher2/AppsCustomizeAsyncTask;Lcom/android/launcher2/AsyncTaskPageData;)V
    .locals 17
    .parameter "task"
    .parameter "data"

    .prologue
    .line 1678
    if-eqz p1, :cond_0

    .line 1680
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->syncThreadPriority()V

    .line 1684
    :cond_0
    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/android/launcher2/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 1685
    .local v15, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p2

    iget-object v13, v0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    .line 1686
    .local v13, images:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/graphics/Bitmap;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 1687
    .local v11, count:I
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    if-ge v12, v11, :cond_1

    .line 1688
    if-eqz p1, :cond_3

    .line 1690
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1714
    :cond_1
    return-void

    .line 1693
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->syncThreadPriority()V

    .line 1696
    :cond_3
    invoke-virtual {v15, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 1697
    .local v16, rawInfo:Ljava/lang/Object;
    move-object/from16 v0, v16

    instance-of v1, v0, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v1, :cond_5

    move-object/from16 v14, v16

    .line 1698
    check-cast v14, Landroid/appwidget/AppWidgetProviderInfo;

    .line 1699
    .local v14, info:Landroid/appwidget/AppWidgetProviderInfo;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v1, v14}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v10

    .line 1701
    .local v10, cellSpans:[I
    move-object/from16 v0, p2

    iget v1, v0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageWidth:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    const/4 v3, 0x0

    aget v3, v10, v3

    invoke-virtual {v2, v3}, Lcom/android/launcher2/PagedViewCellLayout;->estimateCellWidth(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1703
    .local v7, maxWidth:I
    move-object/from16 v0, p2

    iget v1, v0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageHeight:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    const/4 v3, 0x1

    aget v3, v10, v3

    invoke-virtual {v2, v3}, Lcom/android/launcher2/PagedViewCellLayout;->estimateCellHeight(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 1705
    .local v8, maxHeight:I
    iget-object v2, v14, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v3, v14, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    iget v4, v14, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    const/4 v1, 0x0

    aget v5, v10, v1

    const/4 v1, 0x1

    aget v6, v10, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v8}, Lcom/android/launcher2/AppsCustomizePagedView;->getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 1707
    .local v9, b:Landroid/graphics/Bitmap;
    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1687
    .end local v7           #maxWidth:I
    .end local v8           #maxHeight:I
    .end local v9           #b:Landroid/graphics/Bitmap;
    .end local v10           #cellSpans:[I
    .end local v14           #info:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_4
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 1708
    :cond_5
    move-object/from16 v0, v16

    instance-of v1, v0, Landroid/content/pm/ResolveInfo;

    if-eqz v1, :cond_4

    move-object/from16 v14, v16

    .line 1710
    check-cast v14, Landroid/content/pm/ResolveInfo;

    .line 1711
    .local v14, info:Landroid/content/pm/ResolveInfo;
    move-object/from16 v0, p2

    iget v1, v0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageWidth:I

    move-object/from16 v0, p2

    iget v2, v0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageHeight:I

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v1, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->getShortcutPreview(Landroid/content/pm/ResolveInfo;II)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private onSyncWidgetPageItems(Lcom/android/launcher2/AsyncTaskPageData;)V
    .locals 14
    .parameter "data"

    .prologue
    const/4 v13, 0x0

    .line 1717
    iget-boolean v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInTransition:Z

    if-eqz v10, :cond_0

    .line 1718
    iget-object v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1753
    :goto_0
    return-void

    .line 1722
    :cond_0
    :try_start_0
    iget v5, p1, Lcom/android/launcher2/AsyncTaskPageData;->page:I

    .line 1723
    .local v5, page:I
    invoke-virtual {p0, v5}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/PagedViewGridLayout;

    .line 1725
    .local v4, layout:Lcom/android/launcher2/PagedViewGridLayout;
    iget-object v2, p1, Lcom/android/launcher2/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 1726
    .local v2, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1727
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 1728
    invoke-virtual {v4, v1}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/PagedViewWidget;

    .line 1729
    .local v9, widget:Lcom/android/launcher2/PagedViewWidget;
    if-eqz v9, :cond_1

    .line 1730
    iget-object v10, p1, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Bitmap;

    .line 1731
    .local v7, preview:Landroid/graphics/Bitmap;
    new-instance v10, Lcom/android/launcher2/FastBitmapDrawable;

    invoke-direct {v10, v7}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v9, v10, v1}, Lcom/android/launcher2/PagedViewWidget;->applyPreview(Lcom/android/launcher2/FastBitmapDrawable;I)V

    .line 1727
    .end local v7           #preview:Landroid/graphics/Bitmap;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1736
    .end local v9           #widget:Lcom/android/launcher2/PagedViewWidget;
    :cond_2
    const-string v10, "AppsCustomizePagedView"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "onSyncWidgetPageItems: page = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", layout = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", count = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", this = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1740
    invoke-virtual {v4}, Lcom/android/launcher2/PagedViewGridLayout;->createHardwareLayer()V

    .line 1741
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidate()V

    .line 1744
    iget-object v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1745
    .local v3, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1746
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    .line 1747
    .local v8, task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    iget v6, v8, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    .line 1748
    .local v6, pageIndex:I
    invoke-direct {p0, v6}, Lcom/android/launcher2/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v10

    invoke-virtual {v8, v10}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->setThreadPriority(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 1751
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v2           #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v3           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    .end local v4           #layout:Lcom/android/launcher2/PagedViewGridLayout;
    .end local v5           #page:I
    .end local v6           #pageIndex:I
    .end local v8           #task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    :catchall_0
    move-exception v10

    invoke-virtual {p1, v13}, Lcom/android/launcher2/AsyncTaskPageData;->cleanup(Z)V

    throw v10

    .restart local v0       #count:I
    .restart local v1       #i:I
    .restart local v2       #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v3       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    .restart local v4       #layout:Lcom/android/launcher2/PagedViewGridLayout;
    .restart local v5       #page:I
    :cond_3
    invoke-virtual {p1, v13}, Lcom/android/launcher2/AsyncTaskPageData;->cleanup(Z)V

    goto/16 :goto_0
.end method

.method private preloadWidget(Lcom/android/launcher2/PendingAddWidgetInfo;)V
    .locals 5
    .parameter "info"

    .prologue
    .line 687
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    .line 688
    .local v1, pInfo:Landroid/appwidget/AppWidgetProviderInfo;
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {p0, v2, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getDefaultOptionsForWidget(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/PendingAddWidgetInfo;)Landroid/os/Bundle;

    move-result-object v0

    .line 691
    .local v0, options:Landroid/os/Bundle;
    const-string v2, "AppsCustomizePagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "preloadWidget info = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", pInfo = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", pInfo.configure = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    iget-object v2, v1, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v2, :cond_0

    .line 696
    iput-object v0, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 747
    :goto_0
    return-void

    .line 700
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 701
    new-instance v2, Lcom/android/launcher2/AppsCustomizePagedView$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/android/launcher2/AppsCustomizePagedView$2;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;Landroid/os/Bundle;Lcom/android/launcher2/PendingAddWidgetInfo;)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    .line 720
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    .line 722
    new-instance v2, Lcom/android/launcher2/AppsCustomizePagedView$3;

    invoke-direct {v2, p0, v1, p1}, Lcom/android/launcher2/AppsCustomizePagedView$3;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;Landroid/appwidget/AppWidgetProviderInfo;Lcom/android/launcher2/PendingAddWidgetInfo;)V

    iput-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    .line 746
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;III)V
    .locals 12
    .parameter "page"
    .parameter
    .parameter "cellWidth"
    .parameter "cellHeight"
    .parameter "cellCountX"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;III)V"
        }
    .end annotation

    .prologue
    .line 1285
    .local p2, widgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 1286
    .local v7, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1287
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    .line 1288
    .local v10, task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    iget v11, v10, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    .line 1289
    .local v11, taskPage:I
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getAssociatedLowerPageBound(I)I

    move-result v1

    if-lt v11, v1, :cond_0

    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getAssociatedUpperPageBound(I)I

    move-result v1

    if-le v11, v1, :cond_1

    .line 1291
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->cancel(Z)Z

    .line 1292
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 1294
    :cond_1
    invoke-direct {p0, v11}, Lcom/android/launcher2/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v1

    invoke-virtual {v10, v1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1299
    .end local v10           #task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    .end local v11           #taskPage:I
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getSleepForPage(I)I

    move-result v8

    .line 1300
    .local v8, sleepMs:I
    new-instance v0, Lcom/android/launcher2/AsyncTaskPageData;

    new-instance v5, Lcom/android/launcher2/AppsCustomizePagedView$5;

    invoke-direct {v5, p0, v8}, Lcom/android/launcher2/AppsCustomizePagedView$5;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;I)V

    new-instance v6, Lcom/android/launcher2/AppsCustomizePagedView$6;

    invoke-direct {v6, p0}, Lcom/android/launcher2/AppsCustomizePagedView$6;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;)V

    move v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/AsyncTaskPageData;-><init>(ILjava/util/ArrayList;IILcom/android/launcher2/AsyncTaskCallback;Lcom/android/launcher2/AsyncTaskCallback;)V

    .line 1329
    .local v0, pageData:Lcom/android/launcher2/AsyncTaskPageData;
    new-instance v9, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    sget-object v1, Lcom/android/launcher2/AsyncTaskPageData$Type;->LoadWidgetPreviewData:Lcom/android/launcher2/AsyncTaskPageData$Type;

    invoke-direct {v9, p1, v1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;-><init>(ILcom/android/launcher2/AsyncTaskPageData$Type;)V

    .line 1331
    .local v9, t:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v1

    invoke-virtual {v9, v1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    .line 1332
    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/android/launcher2/AsyncTaskPageData;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v9, v1, v2}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1333
    iget-object v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1334
    return-void
.end method

.method private removeAppsWithPackageNameWithoutInvalidate(Ljava/util/ArrayList;)V
    .locals 4
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
    .line 2025
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2026
    .local v1, pn:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->findAppByPackage(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    .line 2027
    .local v2, removeIndex:I
    :goto_0
    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 2028
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2029
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->findAppByPackage(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 2032
    .end local v1           #pn:Ljava/lang/String;
    .end local v2           #removeIndex:I
    :cond_1
    return-void
.end method

.method private removeAppsWithoutInvalidate(Ljava/util/ArrayList;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2009
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 2010
    .local v2, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 2011
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 2012
    .local v1, info:Lcom/android/launcher2/ApplicationInfo;
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v4, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->findAppByComponent(Ljava/util/List;Lcom/android/launcher2/ApplicationInfo;)I

    move-result v3

    .line 2013
    .local v3, removeIndex:I
    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    .line 2014
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2016
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "removeAppsWithoutInvalidate: removeIndex = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", ApplicationInfo info = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2010
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2021
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    .end local v3           #removeIndex:I
    :cond_1
    return-void
.end method

.method private renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V
    .locals 8
    .parameter "d"
    .parameter "bitmap"
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    .line 1352
    const/high16 v7, 0x3f80

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/launcher2/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIIIF)V

    .line 1353
    return-void
.end method

.method private renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIIIF)V
    .locals 4
    .parameter "d"
    .parameter "bitmap"
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"
    .parameter "scale"

    .prologue
    .line 1357
    if-eqz p2, :cond_0

    .line 1358
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1359
    .local v0, c:Landroid/graphics/Canvas;
    invoke-virtual {v0, p7, p7}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1360
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->copyBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 1361
    .local v1, oldBounds:Landroid/graphics/Rect;
    add-int v2, p3, p5

    add-int v3, p4, p6

    invoke-virtual {p1, p3, p4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1362
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1363
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 1364
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1366
    .end local v0           #c:Landroid/graphics/Canvas;
    .end local v1           #oldBounds:Landroid/graphics/Rect;
    :cond_0
    return-void
.end method

.method private setVisibilityOnChildren(Landroid/view/ViewGroup;I)V
    .locals 3
    .parameter "layout"
    .parameter "visibility"

    .prologue
    .line 1172
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 1173
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1174
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/view/View;->setVisibility(I)V

    .line 1173
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1176
    :cond_0
    return-void
.end method

.method private setupPage(Lcom/android/launcher2/PagedViewCellLayout;)V
    .locals 7
    .parameter "layout"

    .prologue
    const/high16 v6, -0x8000

    .line 1179
    iget v2, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    invoke-virtual {p1, v2, v3}, Lcom/android/launcher2/PagedViewCellLayout;->setCellCount(II)V

    .line 1180
    iget v2, p0, Lcom/android/launcher2/PagedView;->mPageLayoutWidthGap:I

    iget v3, p0, Lcom/android/launcher2/PagedView;->mPageLayoutHeightGap:I

    invoke-virtual {p1, v2, v3}, Lcom/android/launcher2/PagedViewCellLayout;->setGap(II)V

    .line 1181
    iget v2, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingLeft:I

    iget v3, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingTop:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingRight:I

    iget v5, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/android/launcher2/PagedViewCellLayout;->setPadding(IIII)V

    .line 1188
    const/16 v2, 0x8

    invoke-direct {p0, p1, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->setVisibilityOnChildren(Landroid/view/ViewGroup;I)V

    .line 1189
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1190
    .local v1, widthSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 1191
    .local v0, heightSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageContentWidth()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/android/launcher2/PagedViewCellLayout;->setMinimumWidth(I)V

    .line 1192
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher2/PagedViewCellLayout;->measure(II)V

    .line 1193
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->setVisibilityOnChildren(Landroid/view/ViewGroup;I)V

    .line 1194
    return-void
.end method

.method private setupPage(Lcom/android/launcher2/PagedViewGridLayout;)V
    .locals 7
    .parameter "layout"

    .prologue
    const/high16 v6, -0x8000

    .line 1340
    iget v2, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingLeft:I

    iget v3, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingTop:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingRight:I

    iget v5, p0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/android/launcher2/PagedViewGridLayout;->setPadding(IIII)V

    .line 1345
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1346
    .local v1, widthSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 1347
    .local v0, heightSpec:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageContentWidth()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/android/launcher2/PagedViewGridLayout;->setMinimumWidth(I)V

    .line 1348
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher2/PagedViewGridLayout;->measure(II)V

    .line 1349
    return-void
.end method

.method private updateCurrentTab(I)V
    .locals 5
    .parameter "currentPage"

    .prologue
    .line 1148
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getTabHost()Lcom/android/launcher2/AppsCustomizeTabHost;

    move-result-object v0

    .line 1150
    .local v0, tabHost:Lcom/android/launcher2/AppsCustomizeTabHost;
    const-string v2, "AppsCustomizePagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCurrentTab: currentPage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCurrentPage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

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

    .line 1154
    if-eqz v0, :cond_0

    .line 1155
    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    .line 1156
    .local v1, tag:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1157
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-lt p1, v2, :cond_1

    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Widgets:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1159
    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Widgets:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)V

    .line 1166
    .end local v1           #tag:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1160
    .restart local v1       #tag:Ljava/lang/String;
    :cond_1
    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge p1, v2, :cond_0

    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Applications:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1162
    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Applications:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)V

    goto :goto_0
.end method

.method private updatePageCounts()V
    .locals 3

    .prologue
    .line 442
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    .line 444
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    mul-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    .line 446
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updatePageCounts end: mNumWidgetPages = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mNumAppsPages = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mApps.size() = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCellCountX = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCellCountY = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

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

    .line 451
    return-void
.end method

.method private updateUnreadNumInAppInfo(Landroid/content/ComponentName;I)V
    .locals 4
    .parameter "component"
    .parameter "unreadNum"

    .prologue
    .line 2284
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 2285
    .local v2, size:I
    const/4 v0, 0x0

    .line 2286
    .local v0, appInfo:Lcom/android/launcher2/ApplicationInfo;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 2287
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 2288
    .restart local v0       #appInfo:Lcom/android/launcher2/ApplicationInfo;
    iget-object v3, v0, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2289
    iput p2, v0, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    .line 2286
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2292
    :cond_1
    return-void
.end method

.method public static updateUnreadNumInAppInfo(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2300
    .local p0, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 2301
    .local v2, size:I
    const/4 v0, 0x0

    .line 2302
    .local v0, appInfo:Lcom/android/launcher2/ApplicationInfo;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 2303
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 2304
    .restart local v0       #appInfo:Lcom/android/launcher2/ApplicationInfo;
    iget-object v3, v0, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-static {v3}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadNumberOfComponent(Landroid/content/ComponentName;)I

    move-result v3

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    .line 2302
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2306
    :cond_0
    return-void
.end method


# virtual methods
.method public addApps(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1965
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addApps: list = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1968
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->addAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 1969
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->reorderApps()V

    .line 1970
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 1971
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 1972
    return-void
.end method

.method protected beginDragging(Landroid/view/View;)Z
    .locals 3
    .parameter "v"

    .prologue
    const/4 v0, 0x0

    .line 906
    invoke-super {p0, p1}, Lcom/android/launcher2/PagedViewWithDraggableItems;->beginDragging(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 935
    :goto_0
    return v0

    .line 908
    :cond_0
    instance-of v1, p1, Lcom/android/launcher2/PagedViewIcon;

    if-eqz v1, :cond_2

    .line 909
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->beginDraggingApplication(Landroid/view/View;)V

    .line 918
    :cond_1
    new-instance v0, Lcom/android/launcher2/AppsCustomizePagedView$4;

    invoke-direct {v0, p0}, Lcom/android/launcher2/AppsCustomizePagedView$4;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;)V

    const-wide/16 v1, 0x96

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 935
    const/4 v0, 0x1

    goto :goto_0

    .line 910
    :cond_2
    instance-of v1, p1, Lcom/android/launcher2/PagedViewWidget;

    if-eqz v1, :cond_1

    .line 911
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->beginDraggingWidget(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0
.end method

.method public cleanUpShortPress(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 808
    iget-boolean v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    if-nez v0, :cond_0

    .line 809
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 811
    :cond_0
    return-void
.end method

.method public clearAllPages()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1075
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1076
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 1078
    .local v0, count:I
    const-string v3, "AppsCustomizePagedView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clearAllPages: count = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1081
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 1082
    invoke-virtual {p0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 1083
    .local v2, v:Landroid/view/View;
    instance-of v3, v2, Lcom/android/launcher2/PagedViewGridLayout;

    if-eqz v3, :cond_1

    .line 1084
    check-cast v2, Lcom/android/launcher2/PagedViewGridLayout;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewGridLayout;->removeAllViewsOnPage()V

    .line 1085
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1081
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1087
    .restart local v2       #v:Landroid/view/View;
    :cond_1
    instance-of v3, v2, Lcom/android/launcher2/PagedViewCellLayout;

    if-eqz v3, :cond_0

    .line 1088
    check-cast v2, Lcom/android/launcher2/PagedViewCellLayout;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayout;->removeAllViewsOnPage()V

    .line 1089
    iget-object v3, p0, Lcom/android/launcher2/PagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1092
    :cond_2
    return-void
.end method

.method protected determineDraggingStart(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "ev"

    .prologue
    .line 655
    return-void
.end method

.method public dumpState()V
    .locals 3

    .prologue
    .line 2084
    const-string v0, "AppsCustomizePagedView"

    const-string v1, "mApps"

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/android/launcher2/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2085
    const-string v0, "AppsCustomizePagedView"

    const-string v1, "mWidgets"

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->dumpAppWidgetProviderInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2086
    return-void
.end method

.method protected getAssociatedLowerPageBound(I)I
    .locals 5
    .parameter "page"

    .prologue
    .line 2138
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 2139
    .local v0, count:I
    const/4 v3, 0x5

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 2140
    .local v2, windowSize:I
    add-int/lit8 v3, p1, -0x2

    sub-int v4, v0, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 2141
    .local v1, windowMinIndex:I
    return v1
.end method

.method protected getAssociatedUpperPageBound(I)I
    .locals 5
    .parameter "page"

    .prologue
    .line 2144
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 2145
    .local v0, count:I
    const/4 v3, 0x5

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 2146
    .local v2, windowSize:I
    add-int/lit8 v3, p1, 0x2

    add-int/lit8 v4, v2, -0x1

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/lit8 v4, v0, -0x1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 2148
    .local v1, windowMaxIndex:I
    return v1
.end method

.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 959
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 7

    .prologue
    .line 2153
    iget v3, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 2154
    .local v1, page:I
    :goto_0
    const v2, 0x7f0d0055

    .line 2155
    .local v2, stringId:I
    const/4 v0, 0x0

    .line 2157
    .local v0, count:I
    iget v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v1, v3, :cond_1

    .line 2158
    const v2, 0x7f0d0057

    .line 2159
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    .line 2166
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    add-int/lit8 v6, v1, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 2153
    .end local v0           #count:I
    .end local v1           #page:I
    .end local v2           #stringId:I
    :cond_0
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    goto :goto_0

    .line 2161
    .restart local v0       #count:I
    .restart local v1       #page:I
    .restart local v2       #stringId:I
    :cond_1
    iget v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int/2addr v1, v3

    .line 2162
    const v2, 0x7f0d0058

    .line 2163
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    goto :goto_1
.end method

.method getDefaultOptionsForWidget(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/PendingAddWidgetInfo;)Landroid/os/Bundle;
    .locals 9
    .parameter "launcher"
    .parameter "info"

    .prologue
    .line 663
    const/4 v1, 0x0

    .line 664
    .local v1, options:Landroid/os/Bundle;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v5, v6, :cond_0

    .line 665
    iget-object v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    iget v6, p2, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v7, p2, Lcom/android/launcher2/ItemInfo;->spanY:I

    iget-object v8, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    invoke-static {v5, v6, v7, v8}, Lcom/android/launcher2/AppWidgetResizeFrame;->getWidgetSizeRanges(Lcom/android/launcher2/Launcher;IILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 666
    iget-object v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v6, p2, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v2

    .line 669
    .local v2, padding:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v0, v5, Landroid/util/DisplayMetrics;->density:F

    .line 670
    .local v0, density:F
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v3, v5

    .line 671
    .local v3, xPaddingDips:I
    iget v5, v2, Landroid/graphics/Rect;->top:I

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v4, v5

    .line 673
    .local v4, yPaddingDips:I
    new-instance v1, Landroid/os/Bundle;

    .end local v1           #options:Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 674
    .restart local v1       #options:Landroid/os/Bundle;
    const-string v5, "appWidgetMinWidth"

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v6, v3

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 676
    const-string v5, "appWidgetMinHeight"

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v4

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 678
    const-string v5, "appWidgetMaxWidth"

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v3

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 680
    const-string v5, "appWidgetMaxHeight"

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v4

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 683
    .end local v0           #density:F
    .end local v2           #padding:Landroid/graphics/Rect;
    .end local v3           #xPaddingDips:I
    .end local v4           #yPaddingDips:I
    :cond_0
    return-object v1
.end method

.method getPageAt(I)Landroid/view/View;
    .locals 1
    .parameter "index"

    .prologue
    .line 1804
    invoke-virtual {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->indexToPage(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getPageContentWidth()I
    .locals 1

    .prologue
    .line 1897
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mContentWidth:I

    return v0
.end method

.method getPageForComponent(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 424
    if-gez p1, :cond_0

    const/4 v1, 0x0

    .line 431
    :goto_0
    return v1

    .line 426
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 427
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    mul-int v0, v1, v2

    .line 428
    .local v0, numItemsPerPage:I
    div-int v1, p1, v0

    goto :goto_0

    .line 430
    .end local v0           #numItemsPerPage:I
    :cond_1
    iget v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v0, v1, v2

    .line 431
    .restart local v0       #numItemsPerPage:I
    iget v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int v2, p1, v2

    div-int/2addr v2, v0

    add-int/2addr v1, v2

    goto :goto_0
.end method

.method getSaveInstanceStateIndex()I
    .locals 2

    .prologue
    .line 415
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 416
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMiddleComponentIndexOnCurrentPage()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 418
    :cond_0
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    return v0
.end method

.method public iconPressed(Lcom/android/launcher2/PagedViewIcon;)V
    .locals 1
    .parameter "icon"

    .prologue
    .line 2118
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    if-eqz v0, :cond_0

    .line 2119
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->resetDrawableState()V

    .line 2121
    :cond_0
    iput-object p1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    .line 2122
    return-void
.end method

.method protected indexToPage(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 1809
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 377
    invoke-super {p0}, Lcom/android/launcher2/PagedViewWithDraggableItems;->init()V

    .line 378
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/launcher2/PagedView;->mCenterPagesVertically:Z

    .line 380
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 381
    .local v0, context:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 382
    .local v1, r:Landroid/content/res/Resources;
    const v2, 0x7f0a000d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42c8

    div-float/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->setDragSlopeThreshold(F)V

    .line 383
    return-void
.end method

.method invalidateAppPages(IZ)V
    .locals 3
    .parameter "currentPage"
    .parameter "immediateAndOnly"

    .prologue
    .line 2313
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalidateAppPages: currentPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", immediateAndOnly = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2315
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData(IZ)V

    .line 2316
    return-void
.end method

.method public isSupportCycleSlidingScreen()Z
    .locals 1

    .prologue
    .line 2323
    const/4 v0, 0x0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 13
    .parameter "v"

    .prologue
    const-wide/16 v11, 0x4

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 594
    const-string v6, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onClick: v = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", v.getTag() = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    const-string v6, "AppsCustomizePagedView.onClick"

    invoke-static {v11, v12, v6}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 601
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v6}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v6}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/launcher2/Workspace;->isSwitchingState()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 643
    :cond_0
    :goto_0
    return-void

    .line 604
    :cond_1
    instance-of v6, p1, Lcom/android/launcher2/PagedViewIcon;

    if-eqz v6, :cond_4

    .line 606
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 609
    .local v0, appInfo:Lcom/android/launcher2/ApplicationInfo;
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    if-eqz v6, :cond_2

    .line 610
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    invoke-virtual {v6}, Lcom/android/launcher2/PagedViewIcon;->lockDrawableState()V

    .line 616
    :cond_2
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v6, v10}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 617
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v7, v0, Lcom/android/launcher2/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v6, p1, v7, v0}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 642
    .end local v0           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    :cond_3
    :goto_1
    invoke-static {v11, v12}, Landroid/os/Trace;->traceEnd(J)V

    goto :goto_0

    .line 619
    :cond_4
    instance-of v6, p1, Lcom/android/launcher2/PagedViewWidget;

    if-eqz v6, :cond_3

    .line 621
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    if-eqz v6, :cond_5

    .line 622
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    invoke-virtual {v6}, Landroid/widget/Toast;->cancel()V

    .line 624
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f0d0016

    invoke-static {v6, v7, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    iput-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    .line 626
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 629
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0b0031

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    int-to-float v2, v6

    .line 630
    .local v2, offsetY:F
    const v6, 0x7f07000e

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 631
    .local v3, p:Landroid/widget/ImageView;
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v1

    .line 632
    .local v1, bounce:Landroid/animation/AnimatorSet;
    const-string v6, "translationY"

    new-array v7, v10, [F

    aput v2, v7, v9

    invoke-static {v3, v6, v7}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 633
    .local v5, tyuAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x7d

    invoke-virtual {v5, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 634
    const-string v6, "translationY"

    new-array v7, v10, [F

    const/4 v8, 0x0

    aput v8, v7, v9

    invoke-static {v3, v6, v7}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 635
    .local v4, tydAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x64

    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 636
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 637
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 638
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_1
.end method

.method protected onDataReady(II)V
    .locals 16
    .parameter "width"
    .parameter "height"

    .prologue
    .line 455
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    iget v11, v11, Landroid/content/res/Configuration;->orientation:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_4

    const/4 v5, 0x1

    .line 457
    .local v5, isLandscape:Z
    :goto_0
    const v6, 0x7fffffff

    .line 458
    .local v6, maxCellCountX:I
    const v7, 0x7fffffff

    .line 459
    .local v7, maxCellCountY:I
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 460
    if-eqz v5, :cond_5

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v6

    .line 462
    :goto_1
    if-eqz v5, :cond_6

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v7

    .line 465
    :cond_0
    :goto_2
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountX:I

    const/4 v12, -0x1

    if-le v11, v12, :cond_1

    .line 466
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountX:I

    invoke-static {v6, v11}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 469
    :cond_1
    move v8, v7

    .line 470
    .local v8, maxWidgetCellCountY:I
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountY:I

    const/4 v12, -0x1

    if-le v11, v12, :cond_2

    .line 471
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mMaxAppCellCountY:I

    invoke-static {v8, v11}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 476
    :cond_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/launcher2/PagedView;->mPageLayoutWidthGap:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mPageLayoutHeightGap:I

    invoke-virtual {v11, v12, v13}, Lcom/android/launcher2/PagedViewCellLayout;->setGap(II)V

    .line 477
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingLeft:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingTop:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingRight:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/android/launcher2/PagedViewCellLayout;->setPadding(IIII)V

    .line 479
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v11, v0, v1, v6, v7}, Lcom/android/launcher2/PagedViewCellLayout;->calculateCellCount(IIII)V

    .line 480
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountX()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    .line 481
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountY()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    .line 482
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 485
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v11

    const/high16 v12, -0x8000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 486
    .local v10, widthSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v11

    const/high16 v12, -0x8000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 487
    .local v2, heightSpec:I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v11, v0, v1, v6, v8}, Lcom/android/launcher2/PagedViewCellLayout;->calculateCellCount(IIII)V

    .line 488
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v11, v10, v2}, Lcom/android/launcher2/PagedViewCellLayout;->measure(II)V

    .line 489
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/android/launcher2/PagedViewCellLayout;->getContentWidth()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mContentWidth:I

    .line 491
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getTabHost()Lcom/android/launcher2/AppsCustomizeTabHost;

    move-result-object v3

    .line 492
    .local v3, host:Lcom/android/launcher2/AppsCustomizeTabHost;
    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v4

    .line 495
    .local v4, hostIsTransitioning:Z
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageForComponent(I)I

    move-result v9

    .line 497
    .local v9, page:I
    const-string v11, "AppsCustomizePagedView"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "onDataReady: height = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", width = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", isLandscape = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", page = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", hostIsTransitioning = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", mContentWidth = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mContentWidth:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", mNumAppsPages = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", mNumWidgetPages = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", this = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    const/4 v11, 0x0

    invoke-static {v11, v9}, Ljava/lang/Math;->max(II)I

    move-result v11

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData(IZ)V

    .line 508
    if-nez v4, :cond_3

    .line 509
    new-instance v11, Lcom/android/launcher2/AppsCustomizePagedView$1;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/android/launcher2/AppsCustomizePagedView$1;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    .line 516
    :cond_3
    return-void

    .line 455
    .end local v2           #heightSpec:I
    .end local v3           #host:Lcom/android/launcher2/AppsCustomizeTabHost;
    .end local v4           #hostIsTransitioning:Z
    .end local v5           #isLandscape:Z
    .end local v6           #maxCellCountX:I
    .end local v7           #maxCellCountY:I
    .end local v8           #maxWidgetCellCountY:I
    .end local v9           #page:I
    .end local v10           #widthSpec:I
    :cond_4
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 460
    .restart local v5       #isLandscape:Z
    .restart local v6       #maxCellCountX:I
    .restart local v7       #maxCellCountY:I
    :cond_5
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v6

    goto/16 :goto_1

    .line 462
    :cond_6
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v7

    goto/16 :goto_2
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 1066
    invoke-super {p0}, Lcom/android/launcher2/PagedViewWithDraggableItems;->onDetachedFromWindow()V

    .line 1068
    const-string v0, "AppsCustomizePagedView"

    const-string v1, "onDetachedFromWindow."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1070
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1071
    return-void
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V
    .locals 10
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v6, 0x0

    .line 1010
    if-eqz p3, :cond_0

    .line 1045
    :goto_0
    return-void

    .line 1012
    :cond_0
    invoke-direct {p0, p1, v6, p4}, Lcom/android/launcher2/AppsCustomizePagedView;->endDragging(Landroid/view/View;ZZ)V

    .line 1016
    if-nez p4, :cond_4

    .line 1017
    const/4 v4, 0x0

    .line 1018
    .local v4, showOutOfSpaceMessage:Z
    instance-of v7, p1, Lcom/android/launcher2/Workspace;

    if-eqz v7, :cond_2

    .line 1019
    iget-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v7}, Lcom/android/launcher2/Launcher;->getCurrentWorkspaceScreen()I

    move-result v0

    .local v0, currentScreen:I
    move-object v5, p1

    .line 1020
    check-cast v5, Lcom/android/launcher2/Workspace;

    .line 1021
    .local v5, workspace:Lcom/android/launcher2/Workspace;
    invoke-virtual {v5, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout;

    .line 1022
    .local v3, layout:Lcom/android/launcher2/CellLayout;
    iget-object v2, p2, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/ItemInfo;

    .line 1023
    .local v2, itemInfo:Lcom/android/launcher2/ItemInfo;
    if-eqz v3, :cond_1

    .line 1024
    invoke-virtual {v3, v2}, Lcom/android/launcher2/CellLayout;->calculateSpans(Lcom/android/launcher2/ItemInfo;)V

    .line 1025
    const/4 v7, 0x0

    iget v8, v2, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v9, v2, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {v3, v7, v8, v9}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v7

    if-nez v7, :cond_5

    const/4 v4, 0x1

    .line 1030
    :cond_1
    :goto_1
    iget-object v7, p2, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v7, v7, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v7, :cond_2

    .line 1031
    iget-object v1, p2, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 1032
    .local v1, info:Lcom/android/launcher2/PendingAddWidgetInfo;
    iget-object v7, v1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v5, v7}, Lcom/android/launcher2/Workspace;->searchIMTKWidget(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 1033
    iget-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v7, v1}, Lcom/android/launcher2/Launcher;->showOnlyOneWidgetMessage(Lcom/android/launcher2/PendingAddWidgetInfo;)V

    .line 1037
    .end local v0           #currentScreen:I
    .end local v1           #info:Lcom/android/launcher2/PendingAddWidgetInfo;
    .end local v2           #itemInfo:Lcom/android/launcher2/ItemInfo;
    .end local v3           #layout:Lcom/android/launcher2/CellLayout;
    .end local v5           #workspace:Lcom/android/launcher2/Workspace;
    :cond_2
    if-eqz v4, :cond_3

    .line 1038
    iget-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v7, v6}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    .line 1041
    :cond_3
    iput-boolean v6, p2, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 1043
    .end local v4           #showOutOfSpaceMessage:Z
    :cond_4
    invoke-direct {p0, p4}, Lcom/android/launcher2/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 1044
    iput-boolean v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    goto :goto_0

    .restart local v0       #currentScreen:I
    .restart local v2       #itemInfo:Lcom/android/launcher2/ItemInfo;
    .restart local v3       #layout:Lcom/android/launcher2/CellLayout;
    .restart local v4       #showOutOfSpaceMessage:Z
    .restart local v5       #workspace:Lcom/android/launcher2/Workspace;
    :cond_5
    move v4, v6

    .line 1025
    goto :goto_1
.end method

.method public onFlingToDeleteCompleted()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1050
    const-string v0, "AppsCustomizePagedView"

    const-string v1, "onFlingToDeleteCompleted."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    const/4 v0, 0x0

    invoke-direct {p0, v0, v3, v3}, Lcom/android/launcher2/AppsCustomizePagedView;->endDragging(Landroid/view/View;ZZ)V

    .line 1055
    invoke-direct {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 1056
    iput-boolean v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 1057
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 646
    invoke-static {p1, p2, p3}, Lcom/android/launcher2/FocusHelper;->handleAppsCustomizeKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLauncherTransitionEnd(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 7
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v3, 0x0

    .line 986
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLauncherTransitionEnd l = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", animated = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", toWorkspace = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 990
    iput-boolean v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInTransition:Z

    .line 991
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/AsyncTaskPageData;

    .line 992
    .local v0, d:Lcom/android/launcher2/AsyncTaskPageData;
    invoke-direct {p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/android/launcher2/AsyncTaskPageData;)V

    goto :goto_0

    .line 994
    .end local v0           #d:Lcom/android/launcher2/AsyncTaskPageData;
    :cond_0
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 995
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    .line 996
    .local v2, r:Ljava/lang/Runnable;
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 998
    .end local v2           #r:Ljava/lang/Runnable;
    :cond_1
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 999
    if-nez p3, :cond_2

    const/4 v3, 0x1

    :cond_2
    iput-boolean v3, p0, Lcom/android/launcher2/PagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 1000
    return-void
.end method

.method public onLauncherTransitionPrepare(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 3
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 965
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLauncherTransitionPrepare l = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", animated = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", toWorkspace = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mInTransition:Z

    .line 970
    if-eqz p3, :cond_0

    .line 971
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 973
    :cond_0
    return-void
.end method

.method public onLauncherTransitionStart(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 0
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 977
    return-void
.end method

.method public onLauncherTransitionStep(Lcom/android/launcher2/Launcher;F)V
    .locals 0
    .parameter "l"
    .parameter "t"

    .prologue
    .line 981
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 540
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 541
    .local v1, width:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 542
    .local v0, height:I
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->isDataReady()Z

    move-result v2

    if-nez v2, :cond_0

    .line 543
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppsHasSet:Z

    if-eqz v2, :cond_0

    .line 544
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->setDataIsReady()V

    .line 545
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->setMeasuredDimension(II)V

    .line 546
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->onDataReady(II)V

    .line 550
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher2/PagedViewWithDraggableItems;->onMeasure(II)V

    .line 551
    return-void
.end method

.method public onPackagesUpdated()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 555
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 556
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v9}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/appwidget/AppWidgetManager;->getInstalledProviders()Ljava/util/List;

    move-result-object v8

    .line 559
    .local v8, widgets:Ljava/util/List;,"Ljava/util/List<Landroid/appwidget/AppWidgetProviderInfo;>;"
    const-string v9, "AppsCustomizePagedView"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updatePackages: widgets size = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    new-instance v5, Landroid/content/Intent;

    const-string v9, "android.intent.action.CREATE_SHORTCUT"

    invoke-direct {v5, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 563
    .local v5, shortcutsIntent:Landroid/content/Intent;
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v9, v5, v12}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 564
    .local v4, shortcuts:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/appwidget/AppWidgetProviderInfo;

    .line 565
    .local v7, widget:Landroid/appwidget/AppWidgetProviderInfo;
    iget v9, v7, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    if-lez v9, :cond_1

    iget v9, v7, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    if-lez v9, :cond_1

    .line 567
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v9, v7}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v6

    .line 568
    .local v6, spanXY:[I
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v9, v7}, Lcom/android/launcher2/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v2

    .line 569
    .local v2, minSpanXY:[I
    aget v9, v6, v12

    aget v10, v2, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 570
    .local v1, minSpanX:I
    aget v9, v6, v13

    aget v10, v2, v13

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 571
    .local v3, minSpanY:I
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v9

    if-gt v1, v9, :cond_0

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v9

    if-gt v3, v9, :cond_0

    .line 573
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 575
    :cond_0
    const-string v9, "AppsCustomizePagedView"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Widget "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " can not fit on this device ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "), min span is ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "), span is ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget v11, v6, v12

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget v11, v6, v13

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 580
    .end local v1           #minSpanX:I
    .end local v2           #minSpanXY:[I
    .end local v3           #minSpanY:I
    .end local v6           #spanXY:[I
    :cond_1
    const-string v9, "AppsCustomizePagedView"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Widget "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " has invalid dimensions ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 584
    .end local v7           #widget:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_2
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 585
    iget-object v9, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    new-instance v10, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;

    iget-object v11, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-direct {v10, v11}, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;-><init>(Landroid/content/pm/PackageManager;)V

    invoke-static {v9, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 587
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 588
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 589
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 1

    .prologue
    .line 1902
    invoke-super {p0}, Lcom/android/launcher2/PagedViewWithDraggableItems;->onPageEndMoving()V

    .line 1903
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 1906
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 1907
    return-void
.end method

.method public onShortPress(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 752
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShortcutPress v = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", v.getTag() = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v0, :cond_0

    .line 759
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 761
    :cond_0
    new-instance v1, Lcom/android/launcher2/PendingAddWidgetInfo;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/PendingAddWidgetInfo;

    invoke-direct {v1, v0}, Lcom/android/launcher2/PendingAddWidgetInfo;-><init>(Lcom/android/launcher2/PendingAddWidgetInfo;)V

    iput-object v1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 762
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/android/launcher2/PendingAddWidgetInfo;

    invoke-direct {p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->preloadWidget(Lcom/android/launcher2/PendingAddWidgetInfo;)V

    .line 763
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 1889
    invoke-virtual {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->acceleratedOverScroll(F)V

    .line 1890
    return-void
.end method

.method public removeApps(Ljava/util/ArrayList;)V
    .locals 3
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
    .line 2036
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeApps: packageNames = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",size = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

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

    .line 2040
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->removeAppsWithPackageNameWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2041
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->reorderApps()V

    .line 2042
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 2043
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2044
    return-void
.end method

.method public reorderApps()V
    .locals 9

    .prologue
    .line 2174
    const-string v6, "AppsCustomizePagedView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reorderApps: mApps = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", this = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2176
    sget-object v6, Lcom/android/launcher2/AllAppsList;->sTopPackages:Ljava/util/ArrayList;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    sget-object v6, Lcom/android/launcher2/AllAppsList;->sTopPackages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2206
    :cond_0
    return-void

    .line 2181
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    const/16 v6, 0x2a

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 2184
    .local v1, dataReorder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    sget-object v6, Lcom/android/launcher2/AllAppsList;->sTopPackages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/AllAppsList$TopPackage;

    .line 2185
    .local v5, tp:Lcom/android/launcher2/AllAppsList$TopPackage;
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 2186
    .local v0, ai:Lcom/android/launcher2/ApplicationInfo;
    iget-object v6, v0, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v5, Lcom/android/launcher2/AllAppsList$TopPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, v0, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v5, Lcom/android/launcher2/AllAppsList$TopPackage;->className:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 2188
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2189
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2195
    .end local v0           #ai:Lcom/android/launcher2/ApplicationInfo;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #tp:Lcom/android/launcher2/AllAppsList$TopPackage;
    :cond_4
    sget-object v6, Lcom/android/launcher2/AllAppsList;->sTopPackages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/AllAppsList$TopPackage;

    .line 2196
    .restart local v5       #tp:Lcom/android/launcher2/AllAppsList$TopPackage;
    const/4 v4, 0x0

    .line 2197
    .local v4, newIndex:I
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ApplicationInfo;

    .line 2198
    .restart local v0       #ai:Lcom/android/launcher2/ApplicationInfo;
    iget-object v6, v0, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v5, Lcom/android/launcher2/AllAppsList$TopPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    iget-object v6, v0, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v5, Lcom/android/launcher2/AllAppsList$TopPackage;->className:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2200
    iget v6, v5, Lcom/android/launcher2/AllAppsList$TopPackage;->order:I

    const/4 v7, 0x0

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget-object v7, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2201
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v6, v4, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 2063
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 2065
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getTabHost()Lcom/android/launcher2/AppsCustomizeTabHost;

    move-result-object v0

    .line 2066
    .local v0, tabHost:Lcom/android/launcher2/AppsCustomizeTabHost;
    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    .line 2067
    .local v1, tag:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 2068
    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Applications:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2069
    sget-object v2, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Applications:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)V

    .line 2073
    :cond_0
    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-eqz v2, :cond_1

    .line 2074
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData(I)V

    .line 2076
    :cond_1
    return-void
.end method

.method public resetDrawableState()V
    .locals 1

    .prologue
    .line 2125
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    if-eqz v0, :cond_0

    .line 2126
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->resetDrawableState()V

    .line 2127
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mPressedIcon:Lcom/android/launcher2/PagedViewIcon;

    .line 2129
    :cond_0
    return-void
.end method

.method restorePageForIndex(I)V
    .locals 0
    .parameter "index"

    .prologue
    .line 437
    if-gez p1, :cond_0

    .line 439
    :goto_0
    return-void

    .line 438
    :cond_0
    iput p1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    goto :goto_0
.end method

.method protected screenScrolled(I)V
    .locals 14
    .parameter "screenCenter"

    .prologue
    const/high16 v13, 0x4000

    const/high16 v9, 0x3f80

    const/4 v12, 0x0

    .line 1815
    invoke-super {p0, p1}, Lcom/android/launcher2/PagedViewWithDraggableItems;->screenScrolled(I)V

    .line 1823
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v10

    if-ge v1, v10, :cond_6

    .line 1824
    invoke-virtual {p0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v8

    .line 1825
    .local v8, v:Landroid/view/View;
    if-eqz v8, :cond_0

    .line 1826
    invoke-virtual {p0, p1, v8, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v6

    .line 1828
    .local v6, scrollProgress:F
    iget-object v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mZInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;

    invoke-static {v6, v12}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    invoke-virtual {v10, v11}, Lcom/android/launcher2/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v2

    .line 1830
    .local v2, interpolatedProgress:F
    sub-float v10, v9, v2

    sget v11, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_SCALE_FACTOR:F

    mul-float/2addr v11, v2

    add-float v5, v10, v11

    .line 1832
    .local v5, scale:F
    invoke-static {v12, v6}, Ljava/lang/Math;->min(FF)F

    move-result v10

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    int-to-float v11, v11

    mul-float v7, v10, v11

    .line 1836
    .local v7, translationX:F
    cmpg-float v10, v6, v12

    if-gez v10, :cond_2

    .line 1837
    cmpg-float v10, v6, v12

    if-gez v10, :cond_1

    iget-object v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v11

    sub-float v11, v9, v11

    invoke-virtual {v10, v11}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .line 1844
    .local v0, alpha:F
    :goto_1
    iget v10, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    sget v11, Lcom/android/launcher2/AppsCustomizePagedView;->CAMERA_DISTANCE:F

    mul-float/2addr v10, v11

    invoke-virtual {v8, v10}, Landroid/view/View;->setCameraDistance(F)V

    .line 1845
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 1846
    .local v4, pageWidth:I
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    .line 1849
    .local v3, pageHeight:I
    if-nez v1, :cond_3

    cmpg-float v10, v6, v12

    if-gez v10, :cond_3

    .line 1851
    sget v10, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_PIVOT:F

    int-to-float v11, v4

    mul-float/2addr v10, v11

    invoke-virtual {v8, v10}, Landroid/view/View;->setPivotX(F)V

    .line 1852
    sget v10, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_MAX_ROTATION:F

    neg-float v10, v10

    mul-float/2addr v10, v6

    invoke-virtual {v8, v10}, Landroid/view/View;->setRotationY(F)V

    .line 1853
    const/high16 v5, 0x3f80

    .line 1854
    const/high16 v0, 0x3f80

    .line 1856
    const/4 v7, 0x0

    .line 1872
    :goto_2
    invoke-virtual {v8, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 1873
    invoke-virtual {v8, v5}, Landroid/view/View;->setScaleX(F)V

    .line 1874
    invoke-virtual {v8, v5}, Landroid/view/View;->setScaleY(F)V

    .line 1875
    invoke-virtual {v8, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1879
    cmpl-float v10, v0, v12

    if-nez v10, :cond_5

    .line 1880
    const/4 v10, 0x4

    invoke-virtual {v8, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1823
    .end local v0           #alpha:F
    .end local v2           #interpolatedProgress:F
    .end local v3           #pageHeight:I
    .end local v4           #pageWidth:I
    .end local v5           #scale:F
    .end local v6           #scrollProgress:F
    .end local v7           #translationX:F
    :cond_0
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .restart local v2       #interpolatedProgress:F
    .restart local v5       #scale:F
    .restart local v6       #scrollProgress:F
    .restart local v7       #translationX:F
    :cond_1
    move v0, v9

    .line 1837
    goto :goto_1

    .line 1841
    :cond_2
    iget-object v10, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    sub-float v11, v9, v6

    invoke-virtual {v10, v11}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .restart local v0       #alpha:F
    goto :goto_1

    .line 1857
    .restart local v3       #pageHeight:I
    .restart local v4       #pageWidth:I
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ne v1, v10, :cond_4

    cmpl-float v10, v6, v12

    if-lez v10, :cond_4

    .line 1859
    sget v10, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_PIVOT:F

    sub-float v10, v9, v10

    int-to-float v11, v4

    mul-float/2addr v10, v11

    invoke-virtual {v8, v10}, Landroid/view/View;->setPivotX(F)V

    .line 1860
    sget v10, Lcom/android/launcher2/AppsCustomizePagedView;->TRANSITION_MAX_ROTATION:F

    neg-float v10, v10

    mul-float/2addr v10, v6

    invoke-virtual {v8, v10}, Landroid/view/View;->setRotationY(F)V

    .line 1861
    const/high16 v5, 0x3f80

    .line 1862
    const/high16 v0, 0x3f80

    .line 1864
    const/4 v7, 0x0

    goto :goto_2

    .line 1866
    :cond_4
    int-to-float v10, v3

    div-float/2addr v10, v13

    invoke-virtual {v8, v10}, Landroid/view/View;->setPivotY(F)V

    .line 1867
    int-to-float v10, v4

    div-float/2addr v10, v13

    invoke-virtual {v8, v10}, Landroid/view/View;->setPivotX(F)V

    .line 1868
    invoke-virtual {v8, v12}, Landroid/view/View;->setRotationY(F)V

    goto :goto_2

    .line 1881
    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-eqz v10, :cond_0

    .line 1882
    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_3

    .line 1886
    .end local v0           #alpha:F
    .end local v2           #interpolatedProgress:F
    .end local v3           #pageHeight:I
    .end local v4           #pageWidth:I
    .end local v5           #scale:F
    .end local v6           #scrollProgress:F
    .end local v7           #translationX:F
    .end local v8           #v:Landroid/view/View;
    :cond_6
    return-void
.end method

.method public setApps(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1935
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    iput-object p1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    .line 1937
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setApps : mApps = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mAppsHasSet = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppsHasSet:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1940
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mAppsHasSet:Z

    .line 1941
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getAppNameComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1942
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->reorderApps()V

    .line 1943
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 1944
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 1945
    return-void
.end method

.method public setContentType(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)V
    .locals 2
    .parameter "type"

    .prologue
    const/4 v1, 0x1

    .line 1118
    sget-object v0, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Widgets:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    if-ne p1, v0, :cond_1

    .line 1119
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData(IZ)V

    .line 1123
    :cond_0
    :goto_0
    return-void

    .line 1120
    :cond_1
    sget-object v0, Lcom/android/launcher2/AppsCustomizePagedView$ContentType;->Applications:Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    if-ne p1, v0, :cond_0

    .line 1121
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidatePageData(IZ)V

    goto :goto_0
.end method

.method public setup(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/DragController;)V
    .locals 0
    .parameter "launcher"
    .parameter "dragController"

    .prologue
    .line 1913
    iput-object p1, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 1914
    iput-object p2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mDragController:Lcom/android/launcher2/DragController;

    .line 1915
    return-void
.end method

.method showAllAppsCling()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 520
    const-string v2, "AppsCustomizePagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "showAllAppsCling: mHasShownAllAppsCling = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mHasShownAllAppsCling:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    iget-boolean v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mHasShownAllAppsCling:Z

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->isDataReady()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 524
    iput-boolean v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mHasShownAllAppsCling:Z

    .line 526
    const/4 v2, 0x2

    new-array v0, v2, [I

    .line 527
    .local v0, offset:[I
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    iget v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mClingFocusedX:I

    iget v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mClingFocusedY:I

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/PagedViewCellLayout;->estimateCellPosition(II)[I

    move-result-object v1

    .line 528
    .local v1, pos:[I
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    invoke-virtual {v2, p0, v0}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 531
    aget v2, v1, v6

    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v3

    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/PagedViewCellLayout;->getMeasuredWidth()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    aget v4, v0, v6

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v1, v6

    .line 533
    aget v2, v1, v5

    aget v3, v0, v5

    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/launcher2/DragLayer;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v1, v5

    .line 534
    iget-object v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2, v1}, Lcom/android/launcher2/Launcher;->showFirstRunAllAppsCling([I)V

    .line 536
    .end local v0           #offset:[I
    .end local v1           #pos:[I
    :cond_0
    return-void
.end method

.method protected snapToPage(III)V
    .locals 6
    .parameter "whichPage"
    .parameter "delta"
    .parameter "duration"

    .prologue
    .line 1126
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher2/PagedViewWithDraggableItems;->snapToPage(III)V

    .line 1127
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->updateCurrentTab(I)V

    .line 1129
    const-string v3, "AppsCustomizePagedView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "snapToPage: whichPage = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", delta = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", duration = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", this = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    iget-object v3, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1135
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/launcher2/AppsCustomizeAsyncTask;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1136
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/AppsCustomizeAsyncTask;

    .line 1137
    .local v2, task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    iget v1, v2, Lcom/android/launcher2/AppsCustomizeAsyncTask;->page:I

    .line 1138
    .local v1, pageIndex:I
    iget v3, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-le v3, v4, :cond_0

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ge v1, v3, :cond_1

    :cond_0
    iget v3, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ge v3, v4, :cond_2

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-gt v1, v3, :cond_2

    .line 1140
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1142
    :cond_2
    const/16 v3, 0x13

    invoke-virtual {v2, v3}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1145
    .end local v1           #pageIndex:I
    .end local v2           #task:Lcom/android/launcher2/AppsCustomizeAsyncTask;
    :cond_3
    return-void
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 1061
    const/4 v0, 0x1

    return v0
.end method

.method public surrender()V
    .locals 0

    .prologue
    .line 2111
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 2112
    return-void
.end method

.method public syncAppsPageItems(IZ)V
    .locals 17
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 1198
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/launcher2/PagedView;->mCellCountY:I

    mul-int v9, v13, v14

    .line 1199
    .local v9, numCells:I
    mul-int v10, p1, v9

    .line 1200
    .local v10, startIndex:I
    add-int v13, v10, v9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1202
    .local v1, endIndex:I
    const-string v13, "AppsCustomizePagedView"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "syncAppsPageItems: page = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", immediate = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", numCells = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", startIndex = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", endIndex = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", app size = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", child count = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getChildCount()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", this = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1208
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/android/launcher2/PagedViewCellLayout;

    .line 1210
    .local v8, layout:Lcom/android/launcher2/PagedViewCellLayout;
    invoke-virtual {v8}, Lcom/android/launcher2/PagedViewCellLayout;->removeAllViewsOnPage()V

    .line 1211
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1212
    .local v7, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1213
    .local v4, images:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/graphics/Bitmap;>;"
    move v2, v10

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1214
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/launcher2/ApplicationInfo;

    .line 1215
    .local v6, info:Lcom/android/launcher2/ApplicationInfo;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v14, 0x7f040003

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v8, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/PagedViewIcon;

    .line 1217
    .local v3, icon:Lcom/android/launcher2/PagedViewIcon;
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v3, v6, v13, v0}, Lcom/android/launcher2/PagedViewIcon;->applyFromApplicationInfo(Lcom/android/launcher2/ApplicationInfo;ZLcom/android/launcher2/PagedViewIcon$PressedCallback;)V

    .line 1218
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/android/launcher2/PagedViewIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1219
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/android/launcher2/PagedViewIcon;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1220
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/android/launcher2/PagedViewIcon;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1221
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/android/launcher2/PagedViewIcon;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1223
    sub-int v5, v2, v10

    .line 1224
    .local v5, index:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    rem-int v11, v5, v13

    .line 1225
    .local v11, x:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/PagedView;->mCellCountX:I

    div-int v12, v5, v13

    .line 1226
    .local v12, y:I
    const/4 v13, -0x1

    new-instance v14, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;

    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-direct {v14, v11, v12, v15, v0}, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v8, v3, v13, v2, v14}, Lcom/android/launcher2/PagedViewCellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/PagedViewCellLayout$LayoutParams;)Z

    .line 1228
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1229
    iget-object v13, v6, Lcom/android/launcher2/ApplicationInfo;->iconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1213
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1232
    .end local v3           #icon:Lcom/android/launcher2/PagedViewIcon;
    .end local v5           #index:I
    .end local v6           #info:Lcom/android/launcher2/ApplicationInfo;
    .end local v11           #x:I
    .end local v12           #y:I
    :cond_0
    invoke-virtual {v8}, Lcom/android/launcher2/PagedViewCellLayout;->createHardwareLayers()V

    .line 1233
    return-void
.end method

.method public syncPageItems(IZ)V
    .locals 3
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 1790
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "syncPageItems: page = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", immediate = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mNumAppsPages = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1794
    iget v0, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge p1, v0, :cond_0

    .line 1795
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->syncAppsPageItems(IZ)V

    .line 1799
    :goto_0
    return-void

    .line 1797
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->syncWidgetPageItems(IZ)V

    goto :goto_0
.end method

.method public syncPages()V
    .locals 8

    .prologue
    const/4 v7, -0x1

    .line 1758
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "syncPages: mNumWidgetPages = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", mNumAppsPages = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1762
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->removeAllViews()V

    .line 1763
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1766
    iget-object v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->notifyPagesWereRecreated()V

    .line 1768
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1769
    .local v0, context:Landroid/content/Context;
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    iget v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumWidgetPages:I

    if-ge v2, v4, :cond_0

    .line 1770
    new-instance v3, Lcom/android/launcher2/PagedViewGridLayout;

    iget v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    iget v5, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    invoke-direct {v3, v0, v4, v5}, Lcom/android/launcher2/PagedViewGridLayout;-><init>(Landroid/content/Context;II)V

    .line 1772
    .local v3, layout:Lcom/android/launcher2/PagedViewGridLayout;
    invoke-direct {p0, v3}, Lcom/android/launcher2/AppsCustomizePagedView;->setupPage(Lcom/android/launcher2/PagedViewGridLayout;)V

    .line 1773
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v3, v4}, Lcom/android/launcher2/AppsCustomizePagedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1769
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1777
    .end local v3           #layout:Lcom/android/launcher2/PagedViewGridLayout;
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget v4, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v1, v4, :cond_1

    .line 1778
    new-instance v3, Lcom/android/launcher2/PagedViewCellLayout;

    invoke-direct {v3, v0}, Lcom/android/launcher2/PagedViewCellLayout;-><init>(Landroid/content/Context;)V

    .line 1779
    .local v3, layout:Lcom/android/launcher2/PagedViewCellLayout;
    invoke-direct {p0, v3}, Lcom/android/launcher2/AppsCustomizePagedView;->setupPage(Lcom/android/launcher2/PagedViewCellLayout;)V

    .line 1780
    invoke-virtual {p0, v3}, Lcom/android/launcher2/AppsCustomizePagedView;->addView(Landroid/view/View;)V

    .line 1782
    const-string v4, "AppsCustomizePagedView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "syncPages: PagedViewCellLayout layout = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1777
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1785
    .end local v3           #layout:Lcom/android/launcher2/PagedViewCellLayout;
    :cond_1
    return-void
.end method

.method public syncWidgetPageItems(IZ)V
    .locals 24
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 1561
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v19, v2, v3

    .line 1564
    .local v19, numItemsPerPage:I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1565
    .local v9, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayout;->getContentWidth()I

    move-result v11

    .line 1566
    .local v11, contentWidth:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingLeft:I

    sub-int v2, v11, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingRight:I

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetWidthGap:I

    mul-int/2addr v3, v7

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    div-int v4, v2, v3

    .line 1568
    .local v4, cellWidth:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayout;->getContentHeight()I

    move-result v10

    .line 1569
    .local v10, contentHeight:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingTop:I

    sub-int v2, v10, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/PagedView;->mPageLayoutPaddingBottom:I

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetHeightGap:I

    mul-int/2addr v3, v7

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountY:I

    div-int v5, v2, v3

    .line 1573
    .local v5, cellHeight:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int v2, p1, v2

    mul-int v20, v2, v19

    .line 1574
    .local v20, offset:I
    move/from16 v13, v20

    .local v13, i:I
    :goto_0
    add-int v2, v20, v19

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v13, v2, :cond_0

    .line 1575
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1574
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1578
    :cond_0
    const-string v2, "AppsCustomizePagedView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "syncWidgetPageItems: page = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", immediate = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", numItemsPerPage = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", cellWidth = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", contentHeight = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", cellHeight = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", offset = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", this = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1585
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/android/launcher2/PagedViewGridLayout;

    .line 1586
    .local v6, layout:Lcom/android/launcher2/PagedViewGridLayout;
    invoke-virtual {v6}, Lcom/android/launcher2/PagedViewGridLayout;->getCellCountX()I

    move-result v2

    invoke-virtual {v6, v2}, Lcom/android/launcher2/PagedViewGridLayout;->setColumnCount(I)V

    .line 1587
    const/4 v13, 0x0

    :goto_1
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v13, v2, :cond_5

    .line 1588
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    .line 1589
    .local v21, rawInfo:Ljava/lang/Object;
    const/4 v12, 0x0

    .line 1590
    .local v12, createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040006

    const/4 v7, 0x0

    invoke-virtual {v2, v3, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v23

    check-cast v23, Lcom/android/launcher2/PagedViewWidget;

    .line 1592
    .local v23, widget:Lcom/android/launcher2/PagedViewWidget;
    move-object/from16 v0, v21

    instance-of v2, v0, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v2, :cond_4

    move-object/from16 v14, v21

    .line 1594
    check-cast v14, Landroid/appwidget/AppWidgetProviderInfo;

    .line 1595
    .local v14, info:Landroid/appwidget/AppWidgetProviderInfo;
    new-instance v12, Lcom/android/launcher2/PendingAddWidgetInfo;

    .end local v12           #createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v12, v14, v2, v3}, Lcom/android/launcher2/PendingAddWidgetInfo;-><init>(Landroid/appwidget/AppWidgetProviderInfo;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1598
    .restart local v12       #createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v2, v14}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v22

    .line 1599
    .local v22, spanXY:[I
    const/4 v2, 0x0

    aget v2, v22, v2

    iput v2, v12, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1600
    const/4 v2, 0x1

    aget v2, v22, v2

    iput v2, v12, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 1601
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v2, v14}, Lcom/android/launcher2/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v18

    .line 1602
    .local v18, minSpanXY:[I
    const/4 v2, 0x0

    aget v2, v18, v2

    iput v2, v12, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 1603
    const/4 v2, 0x1

    aget v2, v18, v2

    iput v2, v12, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 1605
    const/4 v2, -0x1

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v2, v1}, Lcom/android/launcher2/PagedViewWidget;->applyFromAppWidgetProviderInfo(Landroid/appwidget/AppWidgetProviderInfo;I[I)V

    .line 1606
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Lcom/android/launcher2/PagedViewWidget;->setTag(Ljava/lang/Object;)V

    .line 1607
    invoke-virtual/range {v23 .. v24}, Lcom/android/launcher2/PagedViewWidget;->setShortPressListener(Lcom/android/launcher2/PagedViewWidget$ShortPressListener;)V

    .line 1618
    .end local v14           #info:Landroid/appwidget/AppWidgetProviderInfo;
    .end local v18           #minSpanXY:[I
    .end local v22           #spanXY:[I
    :cond_1
    :goto_2
    invoke-virtual/range {v23 .. v24}, Lcom/android/launcher2/PagedViewWidget;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1619
    invoke-virtual/range {v23 .. v24}, Lcom/android/launcher2/PagedViewWidget;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1620
    invoke-virtual/range {v23 .. v24}, Lcom/android/launcher2/PagedViewWidget;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1621
    invoke-virtual/range {v23 .. v24}, Lcom/android/launcher2/PagedViewWidget;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1624
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    rem-int v15, v13, v2

    .line 1625
    .local v15, ix:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetCountX:I

    div-int v16, v13, v2

    .line 1626
    .local v16, iy:I
    new-instance v17, Landroid/widget/GridLayout$LayoutParams;

    sget-object v2, Landroid/widget/GridLayout;->LEFT:Landroid/widget/GridLayout$Alignment;

    move/from16 v0, v16

    invoke-static {v0, v2}, Landroid/widget/GridLayout;->spec(ILandroid/widget/GridLayout$Alignment;)Landroid/widget/GridLayout$Spec;

    move-result-object v2

    sget-object v3, Landroid/widget/GridLayout;->TOP:Landroid/widget/GridLayout$Alignment;

    invoke-static {v15, v3}, Landroid/widget/GridLayout;->spec(ILandroid/widget/GridLayout$Alignment;)Landroid/widget/GridLayout$Spec;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-direct {v0, v2, v3}, Landroid/widget/GridLayout$LayoutParams;-><init>(Landroid/widget/GridLayout$Spec;Landroid/widget/GridLayout$Spec;)V

    .line 1629
    .local v17, lp:Landroid/widget/GridLayout$LayoutParams;
    move-object/from16 v0, v17

    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1630
    move-object/from16 v0, v17

    iput v5, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1631
    const/16 v2, 0x33

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/widget/GridLayout$LayoutParams;->setGravity(I)V

    .line 1632
    if-lez v15, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetWidthGap:I

    move-object/from16 v0, v17

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 1633
    :cond_2
    if-lez v16, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mWidgetHeightGap:I

    move-object/from16 v0, v17

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1634
    :cond_3
    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v6, v0, v1}, Lcom/android/launcher2/PagedViewGridLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1587
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 1608
    .end local v15           #ix:I
    .end local v16           #iy:I
    .end local v17           #lp:Landroid/widget/GridLayout$LayoutParams;
    :cond_4
    move-object/from16 v0, v21

    instance-of v2, v0, Landroid/content/pm/ResolveInfo;

    if-eqz v2, :cond_1

    move-object/from16 v14, v21

    .line 1610
    check-cast v14, Landroid/content/pm/ResolveInfo;

    .line 1611
    .local v14, info:Landroid/content/pm/ResolveInfo;
    new-instance v12, Lcom/android/launcher2/PendingAddShortcutInfo;

    .end local v12           #createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    iget-object v2, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-direct {v12, v2}, Lcom/android/launcher2/PendingAddShortcutInfo;-><init>(Landroid/content/pm/ActivityInfo;)V

    .line 1612
    .restart local v12       #createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    const/4 v2, 0x1

    iput v2, v12, Lcom/android/launcher2/ItemInfo;->itemType:I

    .line 1613
    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    iget-object v7, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, v12, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    .line 1615
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v14}, Lcom/android/launcher2/PagedViewWidget;->applyFromResolveInfo(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;)V

    .line 1616
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Lcom/android/launcher2/PagedViewWidget;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 1640
    .end local v12           #createItemInfo:Lcom/android/launcher2/PendingAddItemInfo;
    .end local v14           #info:Landroid/content/pm/ResolveInfo;
    .end local v21           #rawInfo:Ljava/lang/Object;
    .end local v23           #widget:Lcom/android/launcher2/PagedViewWidget;
    :cond_5
    new-instance v2, Lcom/android/launcher2/AppsCustomizePagedView$7;

    move-object/from16 v3, p0

    move/from16 v7, p2

    move/from16 v8, p1

    invoke-direct/range {v2 .. v9}, Lcom/android/launcher2/AppsCustomizePagedView$7;-><init>(Lcom/android/launcher2/AppsCustomizePagedView;IILcom/android/launcher2/PagedViewGridLayout;ZILjava/util/ArrayList;)V

    invoke-virtual {v6, v2}, Lcom/android/launcher2/PagedViewGridLayout;->setOnLayoutListener(Ljava/lang/Runnable;)V

    .line 1672
    return-void
.end method

.method public updateApps(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2048
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v0, "AppsCustomizePagedView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateApps: list = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2054
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->removeAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2055
    invoke-direct {p0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->addAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2056
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->updatePageCounts()V

    .line 2057
    invoke-virtual {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->reorderApps()V

    .line 2058
    invoke-direct {p0}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2059
    return-void
.end method

.method public updateAppsUnread()V
    .locals 7

    .prologue
    .line 2254
    iget-object v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {v6}, Lcom/android/launcher2/AppsCustomizePagedView;->updateUnreadNumInAppInfo(Ljava/util/ArrayList;)V

    .line 2256
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    iget v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v4, v6, :cond_0

    .line 2257
    invoke-virtual {p0, v4}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/PagedViewCellLayout;

    .line 2258
    .local v2, cl:Lcom/android/launcher2/PagedViewCellLayout;
    if-nez v2, :cond_1

    .line 2275
    .end local v2           #cl:Lcom/android/launcher2/PagedViewCellLayout;
    :cond_0
    return-void

    .line 2261
    .restart local v2       #cl:Lcom/android/launcher2/PagedViewCellLayout;
    :cond_1
    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayout;->getPageChildCount()I

    move-result v3

    .line 2262
    .local v3, count:I
    const/4 v0, 0x0

    .line 2263
    .local v0, appIcon:Lcom/android/launcher2/PagedViewIcon;
    const/4 v1, 0x0

    .line 2264
    .local v1, appInfo:Lcom/android/launcher2/ApplicationInfo;
    const/4 v5, 0x0

    .local v5, j:I
    :goto_1
    if-ge v5, v3, :cond_2

    .line 2265
    invoke-virtual {v2, v5}, Lcom/android/launcher2/PagedViewCellLayout;->getChildOnPageAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #appIcon:Lcom/android/launcher2/PagedViewIcon;
    check-cast v0, Lcom/android/launcher2/PagedViewIcon;

    .line 2266
    .restart local v0       #appIcon:Lcom/android/launcher2/PagedViewIcon;
    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 2267
    .restart local v1       #appInfo:Lcom/android/launcher2/ApplicationInfo;
    iget-object v6, v1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-static {v6}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadNumberOfComponent(Landroid/content/ComponentName;)I

    move-result v6

    iput v6, v1, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    .line 2268
    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->invalidate()V

    .line 2264
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 2256
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public updateAppsUnreadChanged(Landroid/content/ComponentName;I)V
    .locals 7
    .parameter "component"
    .parameter "unreadNum"

    .prologue
    .line 2222
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->updateUnreadNumInAppInfo(Landroid/content/ComponentName;I)V

    .line 2223
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    iget v6, p0, Lcom/android/launcher2/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v4, v6, :cond_0

    .line 2224
    invoke-virtual {p0, v4}, Lcom/android/launcher2/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/PagedViewCellLayout;

    .line 2225
    .local v2, cl:Lcom/android/launcher2/PagedViewCellLayout;
    if-nez v2, :cond_1

    .line 2244
    .end local v2           #cl:Lcom/android/launcher2/PagedViewCellLayout;
    :cond_0
    return-void

    .line 2228
    .restart local v2       #cl:Lcom/android/launcher2/PagedViewCellLayout;
    :cond_1
    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayout;->getPageChildCount()I

    move-result v3

    .line 2229
    .local v3, count:I
    const/4 v0, 0x0

    .line 2230
    .local v0, appIcon:Lcom/android/launcher2/PagedViewIcon;
    const/4 v1, 0x0

    .line 2231
    .local v1, appInfo:Lcom/android/launcher2/ApplicationInfo;
    const/4 v5, 0x0

    .local v5, j:I
    :goto_1
    if-ge v5, v3, :cond_3

    .line 2232
    invoke-virtual {v2, v5}, Lcom/android/launcher2/PagedViewCellLayout;->getChildOnPageAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #appIcon:Lcom/android/launcher2/PagedViewIcon;
    check-cast v0, Lcom/android/launcher2/PagedViewIcon;

    .line 2233
    .restart local v0       #appIcon:Lcom/android/launcher2/PagedViewIcon;
    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #appInfo:Lcom/android/launcher2/ApplicationInfo;
    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 2238
    .restart local v1       #appInfo:Lcom/android/launcher2/ApplicationInfo;
    if-eqz v1, :cond_2

    iget-object v6, v1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v6, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2239
    iput p2, v1, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    .line 2240
    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewIcon;->invalidate()V

    .line 2231
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 2223
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
