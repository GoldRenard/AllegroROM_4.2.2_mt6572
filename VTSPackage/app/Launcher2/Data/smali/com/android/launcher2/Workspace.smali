.class public Lcom/android/launcher2/Workspace;
.super Lcom/android/launcher2/SmoothPagedView;
.source "Workspace.java"

# interfaces
.implements Lcom/android/launcher2/DropTarget;
.implements Lcom/android/launcher2/DragSource;
.implements Lcom/android/launcher2/DragScroller;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/launcher2/DragController$DragListener;
.implements Lcom/android/launcher2/LauncherTransitionable;
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/Workspace$ReorderAlarmListener;,
        Lcom/android/launcher2/Workspace$FolderCreationAlarmListener;,
        Lcom/android/launcher2/Workspace$ZoomInInterpolator;,
        Lcom/android/launcher2/Workspace$ZoomOutInterpolator;,
        Lcom/android/launcher2/Workspace$InverseZInterpolator;,
        Lcom/android/launcher2/Workspace$ZInterpolator;,
        Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;,
        Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;,
        Lcom/android/launcher2/Workspace$State;
    }
.end annotation


# static fields
.field private static final ADJACENT_SCREEN_DROP_DURATION:I = 0x12c

.field public static final ANIMATE_INTO_POSITION_AND_DISAPPEAR:I = 0x0

.field public static final ANIMATE_INTO_POSITION_AND_REMAIN:I = 0x1

.field public static final ANIMATE_INTO_POSITION_AND_RESIZE:I = 0x2

.field private static final BACKGROUND_FADE_OUT_DURATION:I = 0x15e

.field public static final CANCEL_TWO_STAGE_WIDGET_DROP_ANIMATION:I = 0x4

.field private static final CHILDREN_OUTLINE_FADE_IN_DURATION:I = 0x64

.field private static final CHILDREN_OUTLINE_FADE_OUT_DELAY:I = 0x0

.field private static final CHILDREN_OUTLINE_FADE_OUT_DURATION:I = 0x177

.field public static final COMPLETE_TWO_STAGE_WIDGET_DROP_ANIMATION:I = 0x3

.field private static final DEFAULT_CELL_COUNT_X:I = 0x4

.field private static final DEFAULT_CELL_COUNT_Y:I = 0x4

.field private static final DEFAULT_WALLPAPER:Ljava/lang/String; = "default_wallpaper"

.field public static final DRAG_BITMAP_PADDING:I = 0x2

.field private static final DRAG_MODE_ADD_TO_FOLDER:I = 0x2

.field private static final DRAG_MODE_CREATE_FOLDER:I = 0x1

.field private static final DRAG_MODE_NONE:I = 0x0

.field private static final DRAG_MODE_REORDER:I = 0x3

.field private static final FLING_THRESHOLD_VELOCITY:I = 0x1f4

.field private static final FOLDER_CREATION_TIMEOUT:I = 0x0

.field static final MAX_SWIPE_ANGLE:F = 1.0471976f

.field private static final REORDER_TIMEOUT:I = 0xfa

.field static final START_DAMPING_TOUCH_SLOP_ANGLE:F = 0.5235988f

.field private static final TAG:Ljava/lang/String; = "Workspace"

.field static final TOUCH_SLOP_DAMPING_FACTOR:F = 4.0f

.field private static final WALLPAPER_SCREENS_SPAN:F = 2.0f

.field private static final WORKSPACE_OVERSCROLL_ROTATION:F = 24.0f

.field static mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

.field static mPortraitCellLayoutMetrics:Landroid/graphics/Rect;


# instance fields
.field private mAddToExistingFolderOnDrop:Z

.field mAnimatingViewIntoPlace:Z

.field private mBackground:Landroid/graphics/drawable/Drawable;

.field private mBackgroundAlpha:F

.field private mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

.field private mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

.field private final mBindPages:Ljava/lang/Runnable;

.field private mCameraDistance:I

.field mChildrenLayersEnabled:Z

.field private mChildrenOutlineAlpha:F

.field private mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

.field private mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

.field private mCreateUserFolderOnDrop:Z

.field private mCurrentRotationY:F

.field private mCurrentScaleX:F

.field private mCurrentScaleY:F

.field private mCurrentTranslationX:F

.field private mCurrentTranslationY:F

.field private mDefaultPage:I

.field private mDelayedResizeRunnable:Ljava/lang/Runnable;

.field private mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

.field private mDisplaySize:Landroid/graphics/Point;

.field private mDragController:Lcom/android/launcher2/DragController;

.field private mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

.field private mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

.field private mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

.field private mDragMode:I

.field private mDragOutline:Landroid/graphics/Bitmap;

.field private mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

.field private mDragOverX:I

.field private mDragOverY:I

.field private mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

.field private mDragTargetLayout:Lcom/android/launcher2/CellLayout;

.field private mDragViewVisualCenter:[F

.field mDrawBackground:Z

.field private mDropToLayout:Lcom/android/launcher2/CellLayout;

.field private final mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

.field private mIconCache:Lcom/android/launcher2/IconCache;

.field private mInScrollArea:Z

.field mIsDragOccuring:Z

.field private mIsStaticWallpaper:Z

.field private mIsSwitchingState:Z

.field private mLastReorderX:I

.field private mLastReorderY:I

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mMaxDistanceForFolderCreation:F

.field private mNewAlphas:[F

.field private mNewBackgroundAlphas:[F

.field private mNewRotationYs:[F

.field private mNewScaleXs:[F

.field private mNewScaleYs:[F

.field private mNewTranslationXs:[F

.field private mNewTranslationYs:[F

.field private mOldAlphas:[F

.field private mOldBackgroundAlphas:[F

.field private mOldScaleXs:[F

.field private mOldScaleYs:[F

.field private mOldTranslationXs:[F

.field private mOldTranslationYs:[F

.field private mOriginalPageSpacing:I

.field private final mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

.field private mOverScrollMaxBackgroundAlpha:F

.field private mOverscrollFade:F

.field private mOverscrollTransformsSet:Z

.field private final mReorderAlarm:Lcom/android/launcher2/Alarm;

.field private final mRestoredPages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSavedRotationY:F

.field private mSavedScrollX:I

.field private mSavedStates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field

.field private mSavedTranslationX:F

.field private mSpringLoadedDragController:Lcom/android/launcher2/SpringLoadedDragController;

.field private mSpringLoadedPageSpacing:I

.field private mSpringLoadedShrinkFactor:F

.field private mState:Lcom/android/launcher2/Workspace$State;

.field private mTargetCell:[I

.field private mTempCell:[I

.field private mTempCellLayoutCenterCoordinates:[F

.field private mTempDragBottomRightCoordinates:[F

.field private mTempDragCoordinates:[F

.field private mTempEstimate:[I

.field private mTempInverseMatrix:Landroid/graphics/Matrix;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTempVisiblePagesRange:[I

.field private final mTempXY:[I

.field private mTransitionProgress:F

.field mUpdateWallpaperOffsetImmediately:Z

.field mWallpaperHeight:I

.field private final mWallpaperManager:Landroid/app/WallpaperManager;

.field mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

.field private mWallpaperScrollRatio:F

.field private mWallpaperTravelWidth:I

.field mWallpaperWidth:I

.field private mWindowToken:Landroid/os/IBinder;

.field private mWorkspaceFadeInAdjacentScreens:Z

.field private mXDown:F

.field private mYDown:F

.field private final mZoomInInterpolator:Lcom/android/launcher2/Workspace$ZoomInInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 128
    sput-object v0, Lcom/android/launcher2/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 129
    sput-object v0, Lcom/android/launcher2/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 281
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/Workspace;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 282
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 292
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/SmoothPagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 97
    const/4 v8, 0x0

    iput v8, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineAlpha:F

    .line 103
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mDrawBackground:Z

    .line 104
    const/4 v8, 0x0

    iput v8, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    .line 105
    const/4 v8, 0x0

    iput v8, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    .line 107
    const/high16 v8, 0x3f80

    iput v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperScrollRatio:F

    .line 124
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 125
    const/4 v8, -0x1

    iput v8, p0, Lcom/android/launcher2/Workspace;->mDragOverX:I

    .line 126
    const/4 v8, -0x1

    iput v8, p0, Lcom/android/launcher2/Workspace;->mDragOverY:I

    .line 134
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    .line 138
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    .line 143
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    .line 151
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempCell:[I

    .line 152
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempEstimate:[I

    .line 153
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    .line 154
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempDragCoordinates:[F

    .line 155
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempCellLayoutCenterCoordinates:[F

    .line 156
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempDragBottomRightCoordinates:[F

    .line 157
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 169
    sget-object v8, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    .line 170
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    .line 172
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mAnimatingViewIntoPlace:Z

    .line 173
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mIsDragOccuring:Z

    .line 174
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mChildrenLayersEnabled:Z

    .line 177
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    .line 179
    new-instance v8, Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-direct {v8}, Lcom/android/launcher2/HolographicOutlineHelper;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    .line 180
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 181
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempRect:Landroid/graphics/Rect;

    .line 182
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempXY:[I

    .line 183
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mTempVisiblePagesRange:[I

    .line 184
    const/4 v8, 0x0

    iput v8, p0, Lcom/android/launcher2/Workspace;->mOverscrollFade:F

    .line 193
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 196
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    .line 205
    new-instance v8, Lcom/android/launcher2/Alarm;

    invoke-direct {v8}, Lcom/android/launcher2/Alarm;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

    .line 206
    new-instance v8, Lcom/android/launcher2/Alarm;

    invoke-direct {v8}, Lcom/android/launcher2/Alarm;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    .line 207
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    .line 208
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 209
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    .line 210
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 233
    const/4 v8, 0x0

    iput v8, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    .line 234
    const/4 v8, -0x1

    iput v8, p0, Lcom/android/launcher2/Workspace;->mLastReorderX:I

    .line 235
    const/4 v8, -0x1

    iput v8, p0, Lcom/android/launcher2/Workspace;->mLastReorderY:I

    .line 238
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    .line 264
    new-instance v8, Lcom/android/launcher2/Workspace$1;

    invoke-direct {v8, p0}, Lcom/android/launcher2/Workspace$1;-><init>(Lcom/android/launcher2/Workspace;)V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mBindPages:Ljava/lang/Runnable;

    .line 1578
    new-instance v8, Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    invoke-direct {v8}, Lcom/android/launcher2/Workspace$ZoomInInterpolator;-><init>()V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mZoomInInterpolator:Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    .line 293
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/PagedView;->mContentIsRefreshable:Z

    .line 294
    iget v8, p0, Lcom/android/launcher2/PagedView;->mPageSpacing:I

    iput v8, p0, Lcom/android/launcher2/Workspace;->mOriginalPageSpacing:I

    .line 296
    new-instance v8, Lcom/android/launcher2/DropTarget$DragEnforcer;

    invoke-direct {v8, p1}, Lcom/android/launcher2/DropTarget$DragEnforcer;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    .line 298
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->setDataIsReady()V

    move-object v8, p1

    .line 300
    check-cast v8, Lcom/android/launcher2/Launcher;

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 301
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 302
    .local v7, res:Landroid/content/res/Resources;
    const v8, 0x7f090004

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    iput-boolean v8, p0, Lcom/android/launcher2/Workspace;->mWorkspaceFadeInAdjacentScreens:Z

    .line 303
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/launcher2/PagedView;->mFadeInAdjacentScreens:Z

    .line 304
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v8

    iput-object v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 306
    const/4 v3, 0x4

    .line 307
    .local v3, cellCountX:I
    const/4 v4, 0x4

    .line 309
    .local v4, cellCountY:I
    sget-object v8, Lcom/android/launcher/R$styleable;->Workspace:[I

    const/4 v9, 0x0

    invoke-virtual {p1, p2, v8, p3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 312
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 317
    const/4 v8, 0x1

    new-array v8, v8, [I

    const/4 v9, 0x0

    const v10, 0x10102eb

    aput v10, v8, v9

    invoke-virtual {p1, v8}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 319
    .local v2, actionBarSizeTypedArray:Landroid/content/res/TypedArray;
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v2, v8, v9}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 321
    .local v1, actionBarHeight:F
    new-instance v6, Landroid/graphics/Point;

    invoke-direct {v6}, Landroid/graphics/Point;-><init>()V

    .line 322
    .local v6, minDims:Landroid/graphics/Point;
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 323
    .local v5, maxDims:Landroid/graphics/Point;
    iget-object v8, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v8}, Lcom/android/launcher2/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v8

    invoke-interface {v8}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    invoke-virtual {v8, v6, v5}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 325
    const/4 v3, 0x1

    .line 326
    :goto_0
    add-int/lit8 v8, v3, 0x1

    invoke-static {v7, v8}, Lcom/android/launcher2/CellLayout;->widthInPortrait(Landroid/content/res/Resources;I)I

    move-result v8

    iget v9, v6, Landroid/graphics/Point;->x:I

    if-gt v8, v9, :cond_0

    .line 327
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 330
    :cond_0
    const/4 v4, 0x1

    .line 332
    :goto_1
    add-int/lit8 v8, v4, 0x1

    invoke-static {v7, v8}, Lcom/android/launcher2/CellLayout;->heightInLandscape(Landroid/content/res/Resources;I)I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v8, v1

    iget v9, v6, Landroid/graphics/Point;->y:I

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_1

    .line 333
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 337
    .end local v1           #actionBarHeight:F
    .end local v2           #actionBarSizeTypedArray:Landroid/content/res/TypedArray;
    .end local v5           #maxDims:Landroid/graphics/Point;
    .end local v6           #minDims:Landroid/graphics/Point;
    :cond_1
    const v8, 0x7f0a0003

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x42c8

    div-float/2addr v8, v9

    iput v8, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedShrinkFactor:F

    .line 339
    const v8, 0x7f0b0018

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedPageSpacing:I

    .line 341
    const v8, 0x7f0a0019

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    iput v8, p0, Lcom/android/launcher2/Workspace;->mCameraDistance:I

    .line 344
    const/4 v8, 0x1

    invoke-virtual {v0, v8, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 345
    const/4 v8, 0x2

    invoke-virtual {v0, v8, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 346
    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    iput v8, p0, Lcom/android/launcher2/Workspace;->mDefaultPage:I

    .line 347
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 349
    invoke-virtual {p0, p0}, Lcom/android/launcher2/Workspace;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 351
    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherModel;->updateWorkspaceLayoutCells(II)V

    .line 352
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/android/launcher2/Workspace;->setHapticFeedbackEnabled(Z)V

    .line 354
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->initWorkspace()V

    .line 357
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/android/launcher2/Workspace;->setMotionEventSplittingEnabled(Z)V

    .line 360
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getImportantForAccessibility()I

    move-result v8

    if-nez v8, :cond_2

    .line 361
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/android/launcher2/Workspace;->setImportantForAccessibility(I)V

    .line 363
    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/launcher2/Workspace;)Landroid/app/WallpaperManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/CellLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/launcher2/Workspace;IIIILcom/android/launcher2/CellLayout;[I)[I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"

    .prologue
    .line 78
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/launcher2/Workspace;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput p1, p0, Lcom/android/launcher2/Workspace;->mLastReorderX:I

    return p1
.end method

.method static synthetic access$1302(Lcom/android/launcher2/Workspace;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput p1, p0, Lcom/android/launcher2/Workspace;->mLastReorderY:I

    return p1
.end method

.method static synthetic access$1400(Lcom/android/launcher2/Workspace;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/Workspace;->isNeedToDelayRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Workspace;->removeFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/Workspace;->getRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1800(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/DragController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/launcher2/Workspace;)Landroid/graphics/Point;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/launcher2/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mOldBackgroundAlphas:[F

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/launcher2/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/launcher2/Workspace;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/launcher2/Workspace;)Lcom/android/launcher2/FolderIcon$FolderRingAnimator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)Lcom/android/launcher2/FolderIcon$FolderRingAnimator;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    return-object p1
.end method

.method static synthetic access$800(Lcom/android/launcher2/Workspace;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    return-object v0
.end method

.method static synthetic access$802(Lcom/android/launcher2/Workspace;[I)[I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    return-object p1
.end method

.method static synthetic access$900(Lcom/android/launcher2/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    return-object v0
.end method

.method private animateBackgroundGradient(FZ)V
    .locals 4
    .parameter "finalAlpha"
    .parameter "animated"

    .prologue
    const/4 v2, 0x0

    .line 1197
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1

    .line 1222
    :cond_0
    :goto_0
    return-void

    .line 1198
    :cond_1
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_2

    .line 1199
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1200
    iput-object v2, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    .line 1202
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_3

    .line 1203
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1204
    iput-object v2, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    .line 1206
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getBackgroundAlpha()F

    move-result v0

    .line 1207
    .local v0, startAlpha:F
    cmpl-float v1, p1, v0

    if-eqz v1, :cond_0

    .line 1208
    if-eqz p2, :cond_4

    .line 1209
    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput v0, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-static {v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    .line 1210
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/launcher2/Workspace$3;

    invoke-direct {v2, p0}, Lcom/android/launcher2/Workspace$3;-><init>(Lcom/android/launcher2/Workspace;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1215
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x3fc0

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1216
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x15e

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1217
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 1219
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->setBackgroundAlpha(F)V

    goto :goto_0
.end method

.method private cleanupAddToFolder()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2720
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    if-eqz v0, :cond_0

    .line 2721
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/FolderIcon;->onDragExit(Ljava/lang/Object;)V

    .line 2722
    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 2724
    :cond_0
    return-void
.end method

.method private cleanupFolderCreation()V
    .locals 1

    .prologue
    .line 2713
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    if-eqz v0, :cond_0

    .line 2714
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragFolderRingAnimator:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    invoke-virtual {v0}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->animateToNaturalState()V

    .line 2716
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 2717
    return-void
.end method

.method private cleanupReorder(Z)V
    .locals 2
    .parameter "cancelAlarm"

    .prologue
    const/4 v1, -0x1

    .line 2728
    if-eqz p1, :cond_0

    .line 2729
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 2731
    :cond_0
    iput v1, p0, Lcom/android/launcher2/Workspace;->mLastReorderX:I

    .line 2732
    iput v1, p0, Lcom/android/launcher2/Workspace;->mLastReorderY:I

    .line 2733
    return-void
.end method

.method private computeWallpaperScrollRatio(I)V
    .locals 6
    .parameter "page"

    .prologue
    const/high16 v5, 0x3f80

    .line 1021
    iget v0, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 1022
    .local v0, layoutScale:F
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getRelativeChildOffset(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 1023
    .local v1, scaled:I
    iput v5, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 1024
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getRelativeChildOffset(I)I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v2, v3

    .line 1025
    .local v2, unscaled:F
    iput v0, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 1026
    if-lez v1, :cond_0

    .line 1027
    mul-float v3, v5, v2

    int-to-float v4, v1

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/launcher2/Workspace;->mWallpaperScrollRatio:F

    .line 1031
    :goto_0
    return-void

    .line 1029
    :cond_0
    iput v5, p0, Lcom/android/launcher2/Workspace;->mWallpaperScrollRatio:F

    goto :goto_0
.end method

.method private createDragOutline(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;IIIZ)Landroid/graphics/Bitmap;
    .locals 13
    .parameter "orig"
    .parameter "canvas"
    .parameter "padding"
    .parameter "w"
    .parameter "h"
    .parameter "clipAlpha"

    .prologue
    .line 1923
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x1060012

    invoke-static {v2, v4}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v5

    .line 1925
    .local v5, outlineColor:I
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1926
    .local v3, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v3}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1928
    new-instance v12, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-direct {v12, v2, v4, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1929
    .local v12, src:Landroid/graphics/Rect;
    sub-int v2, p4, p3

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v2, v4

    sub-int v4, p5, p3

    int-to-float v4, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v4, v6

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 1931
    .local v9, scaleFactor:F
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v9

    float-to-int v11, v2

    .line 1932
    .local v11, scaledWidth:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v9

    float-to-int v10, v2

    .line 1933
    .local v10, scaledHeight:I
    new-instance v8, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-direct {v8, v2, v4, v11, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1936
    .local v8, dst:Landroid/graphics/Rect;
    sub-int v2, p4, v11

    div-int/lit8 v2, v2, 0x2

    sub-int v4, p5, v10

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v8, v2, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 1938
    const/4 v2, 0x0

    invoke-virtual {p2, p1, v12, v8, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1939
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    move-object v4, p2

    move v6, v5

    move/from16 v7, p6

    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/HolographicOutlineHelper;->applyMediumExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;IIZ)V

    .line 1941
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1943
    return-object v3
.end method

.method private createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "v"
    .parameter "canvas"
    .parameter "padding"

    .prologue
    .line 1904
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1060012

    invoke-static {v2, v3}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v1

    .line 1906
    .local v1, outlineColor:I
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    add-int/2addr v2, p3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, p3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1909
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1910
    const/4 v2, 0x1

    invoke-direct {p0, p1, p2, p3, v2}, Lcom/android/launcher2/Workspace;->drawDragView(Landroid/view/View;Landroid/graphics/Canvas;IZ)V

    .line 1911
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-virtual {v2, v0, p2, v1, v1}, Lcom/android/launcher2/HolographicOutlineHelper;->applyMediumExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)V

    .line 1912
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1913
    return-object v0
.end method

.method private drawDragView(Landroid/view/View;Landroid/graphics/Canvas;IZ)V
    .locals 8
    .parameter "v"
    .parameter "destCanvas"
    .parameter "padding"
    .parameter "pruneToDrawable"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1835
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mTempRect:Landroid/graphics/Rect;

    .line 1836
    .local v0, clipRect:Landroid/graphics/Rect;
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 1838
    const/4 v2, 0x0

    .line 1840
    .local v2, textVisible:Z
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 1841
    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_1

    if-eqz p4, :cond_1

    .line 1842
    check-cast p1, Landroid/widget/TextView;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aget-object v1, v4, v7

    .line 1843
    .local v1, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    add-int/2addr v4, p3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    add-int/2addr v5, p3

    invoke-virtual {v0, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 1844
    div-int/lit8 v4, p3, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, p3, 0x2

    int-to-float v5, v5

    invoke-virtual {p2, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1845
    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1872
    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 1873
    return-void

    .line 1847
    .restart local p1
    :cond_1
    instance-of v4, p1, Lcom/android/launcher2/FolderIcon;

    if-eqz v4, :cond_3

    move-object v4, p1

    .line 1850
    check-cast v4, Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v4}, Lcom/android/launcher2/FolderIcon;->getTextVisible()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v4, p1

    .line 1851
    check-cast v4, Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v4, v6}, Lcom/android/launcher2/FolderIcon;->setTextVisible(Z)V

    .line 1852
    const/4 v2, 0x1

    .line 1863
    :cond_2
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v4

    neg-int v4, v4

    div-int/lit8 v5, p3, 0x2

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v5

    neg-int v5, v5

    div-int/lit8 v6, p3, 0x2

    add-int/2addr v5, v6

    int-to-float v5, v5

    invoke-virtual {p2, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1864
    sget-object v4, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p2, v0, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 1865
    invoke-virtual {p1, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 1868
    if-eqz v2, :cond_0

    .line 1869
    check-cast p1, Lcom/android/launcher2/FolderIcon;

    .end local p1
    invoke-virtual {p1, v7}, Lcom/android/launcher2/FolderIcon;->setTextVisible(Z)V

    goto :goto_0

    .line 1854
    .restart local p1
    :cond_3
    instance-of v4, p1, Lcom/android/launcher2/BubbleTextView;

    if-eqz v4, :cond_4

    move-object v3, p1

    .line 1855
    check-cast v3, Lcom/android/launcher2/BubbleTextView;

    .line 1856
    .local v3, tv:Lcom/android/launcher2/BubbleTextView;
    invoke-virtual {v3}, Lcom/android/launcher2/BubbleTextView;->getExtendedPaddingTop()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v3}, Lcom/android/launcher2/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/text/Layout;->getLineTop(I)I

    move-result v5

    add-int/2addr v4, v5

    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    .line 1858
    .end local v3           #tv:Lcom/android/launcher2/BubbleTextView;
    :cond_4
    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_2

    move-object v3, p1

    .line 1859
    check-cast v3, Landroid/widget/TextView;

    .line 1860
    .local v3, tv:Landroid/widget/TextView;
    invoke-virtual {v3}, Landroid/widget/TextView;->getExtendedPaddingTop()I

    move-result v4

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/text/Layout;->getLineTop(I)I

    move-result v5

    add-int/2addr v4, v5

    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_1
.end method

.method private enableHwLayersOnVisiblePages()V
    .locals 7

    .prologue
    .line 1467
    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mChildrenLayersEnabled:Z

    if-eqz v5, :cond_6

    .line 1468
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v4

    .line 1469
    .local v4, screenCount:I
    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mTempVisiblePagesRange:[I

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Workspace;->getVisiblePages([I)V

    .line 1470
    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mTempVisiblePagesRange:[I

    const/4 v6, 0x0

    aget v2, v5, v6

    .line 1471
    .local v2, leftScreen:I
    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mTempVisiblePagesRange:[I

    const/4 v6, 0x1

    aget v3, v5, v6

    .line 1472
    .local v3, rightScreen:I
    if-ne v2, v3, :cond_0

    .line 1474
    add-int/lit8 v5, v4, -0x1

    if-ge v3, v5, :cond_3

    .line 1475
    add-int/lit8 v3, v3, 0x1

    .line 1480
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v4, :cond_4

    .line 1481
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1482
    .local v1, layout:Lcom/android/launcher2/CellLayout;
    if-gt v2, v0, :cond_1

    if-gt v0, v3, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->shouldDrawChild(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1483
    :cond_1
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->disableHardwareLayers()V

    .line 1480
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1476
    .end local v0           #i:I
    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    :cond_3
    if-lez v2, :cond_0

    .line 1477
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 1486
    .restart local v0       #i:I
    :cond_4
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v4, :cond_6

    .line 1487
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1488
    .restart local v1       #layout:Lcom/android/launcher2/CellLayout;
    if-gt v2, v0, :cond_5

    if-gt v0, v3, :cond_5

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->shouldDrawChild(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1489
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->enableHardwareLayers()V

    .line 1486
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1493
    .end local v0           #i:I
    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    .end local v2           #leftScreen:I
    .end local v3           #rightScreen:I
    .end local v4           #screenCount:I
    :cond_6
    return-void
.end method

.method private findMatchingPageForDragOver(Lcom/android/launcher2/DragView;FFZ)Lcom/android/launcher2/CellLayout;
    .locals 11
    .parameter "dragView"
    .parameter "originX"
    .parameter "originY"
    .parameter "exact"

    .prologue
    .line 2854
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v6

    .line 2855
    .local v6, screenCount:I
    const/4 v0, 0x0

    .line 2856
    .local v0, bestMatchingScreen:Lcom/android/launcher2/CellLayout;
    const v7, 0x7f7fffff

    .line 2858
    .local v7, smallestDistSoFar:F
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v6, :cond_4

    .line 2859
    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout;

    .line 2861
    .local v2, cl:Lcom/android/launcher2/CellLayout;
    const/4 v9, 0x2

    new-array v8, v9, [F

    const/4 v9, 0x0

    aput p2, v8, v9

    const/4 v9, 0x1

    aput p3, v8, v9

    .line 2864
    .local v8, touchXy:[F
    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    iget-object v10, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v9, v10}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 2865
    iget-object v9, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v2, v8, v9}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 2867
    const/4 v9, 0x0

    aget v9, v8, v9

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-ltz v9, :cond_0

    const/4 v9, 0x0

    aget v9, v8, v9

    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->getWidth()I

    move-result v10

    int-to-float v10, v10

    cmpg-float v9, v9, v10

    if-gtz v9, :cond_0

    const/4 v9, 0x1

    aget v9, v8, v9

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-ltz v9, :cond_0

    const/4 v9, 0x1

    aget v9, v8, v9

    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->getHeight()I

    move-result v10

    int-to-float v10, v10

    cmpg-float v9, v9, v10

    if-gtz v9, :cond_0

    .line 2902
    .end local v2           #cl:Lcom/android/launcher2/CellLayout;
    .end local v8           #touchXy:[F
    :goto_1
    return-object v2

    .line 2872
    .restart local v2       #cl:Lcom/android/launcher2/CellLayout;
    .restart local v8       #touchXy:[F
    :cond_0
    if-nez p4, :cond_2

    .line 2874
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mTempCellLayoutCenterCoordinates:[F

    .line 2875
    .local v1, cellLayoutCenter:[F
    const/4 v9, 0x0

    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    aput v10, v1, v9

    .line 2876
    const/4 v9, 0x1

    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->getHeight()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    aput v10, v1, v9

    .line 2877
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher2/Workspace;->mapPointFromChildToSelf(Landroid/view/View;[F)V

    .line 2879
    const/4 v9, 0x0

    aput p2, v8, v9

    .line 2880
    const/4 v9, 0x1

    aput p3, v8, v9

    .line 2884
    invoke-static {v8, v1}, Lcom/android/launcher2/Workspace;->squaredDistance([F[F)F

    move-result v3

    .line 2886
    .local v3, dist:F
    cmpg-float v9, v3, v7

    if-gez v9, :cond_1

    .line 2887
    move v7, v3

    .line 2888
    move-object v0, v2

    .line 2892
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSupportCycleSlidingScreen()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 2893
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v5

    .line 2894
    .local v5, page:I
    add-int/lit8 v9, v6, -0x1

    if-ne v5, v9, :cond_3

    .line 2895
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #bestMatchingScreen:Lcom/android/launcher2/CellLayout;
    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 2858
    .end local v1           #cellLayoutCenter:[F
    .end local v3           #dist:F
    .end local v5           #page:I
    .restart local v0       #bestMatchingScreen:Lcom/android/launcher2/CellLayout;
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 2896
    .restart local v1       #cellLayoutCenter:[F
    .restart local v3       #dist:F
    .restart local v5       #page:I
    :cond_3
    if-nez v5, :cond_2

    .line 2897
    add-int/lit8 v9, v6, -0x1

    invoke-virtual {p0, v9}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #bestMatchingScreen:Lcom/android/launcher2/CellLayout;
    check-cast v0, Lcom/android/launcher2/CellLayout;

    .restart local v0       #bestMatchingScreen:Lcom/android/launcher2/CellLayout;
    goto :goto_2

    .end local v1           #cellLayoutCenter:[F
    .end local v2           #cl:Lcom/android/launcher2/CellLayout;
    .end local v3           #dist:F
    .end local v5           #page:I
    .end local v8           #touchXy:[F
    :cond_4
    move-object v2, v0

    .line 2902
    goto :goto_1
.end method

.method private findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I
    .locals 6
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "layout"
    .parameter "recycle"

    .prologue
    .line 3563
    move-object v0, p5

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v0

    return-object v0
.end method

.method static getCellLayoutMetrics(Lcom/android/launcher2/Launcher;I)Landroid/graphics/Rect;
    .locals 14
    .parameter "launcher"
    .parameter "orientation"

    .prologue
    .line 2576
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2577
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 2578
    .local v7, display:Landroid/view/Display;
    new-instance v13, Landroid/graphics/Point;

    invoke-direct {v13}, Landroid/graphics/Point;-><init>()V

    .line 2579
    .local v13, smallestSize:Landroid/graphics/Point;
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    .line 2580
    .local v8, largestSize:Landroid/graphics/Point;
    invoke-virtual {v7, v13, v8}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 2581
    if-nez p1, :cond_1

    .line 2582
    sget-object v0, Lcom/android/launcher2/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 2583
    const v0, 0x7f0b004b

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 2584
    .local v10, paddingLeft:I
    const v0, 0x7f0b004d

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 2585
    .local v11, paddingRight:I
    const v0, 0x7f0b004f

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 2586
    .local v12, paddingTop:I
    const v0, 0x7f0b0051

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 2587
    .local v9, paddingBottom:I
    iget v0, v8, Landroid/graphics/Point;->x:I

    sub-int/2addr v0, v10

    sub-int v2, v0, v11

    .line 2588
    .local v2, width:I
    iget v0, v13, Landroid/graphics/Point;->y:I

    sub-int/2addr v0, v12

    sub-int v3, v0, v9

    .line 2589
    .local v3, height:I
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/android/launcher2/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 2590
    sget-object v0, Lcom/android/launcher2/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v4

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v5

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->getMetrics(Landroid/graphics/Rect;Landroid/content/res/Resources;IIIII)V

    .line 2594
    .end local v2           #width:I
    .end local v3           #height:I
    .end local v9           #paddingBottom:I
    .end local v10           #paddingLeft:I
    .end local v11           #paddingRight:I
    .end local v12           #paddingTop:I
    :cond_0
    sget-object v0, Lcom/android/launcher2/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 2610
    :goto_0
    return-object v0

    .line 2595
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    .line 2596
    sget-object v0, Lcom/android/launcher2/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    if-nez v0, :cond_2

    .line 2597
    const v0, 0x7f0b004b

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 2598
    .restart local v10       #paddingLeft:I
    const v0, 0x7f0b004d

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 2599
    .restart local v11       #paddingRight:I
    const v0, 0x7f0b004f

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 2600
    .restart local v12       #paddingTop:I
    const v0, 0x7f0b0051

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 2601
    .restart local v9       #paddingBottom:I
    iget v0, v13, Landroid/graphics/Point;->x:I

    sub-int/2addr v0, v10

    sub-int v2, v0, v11

    .line 2602
    .restart local v2       #width:I
    iget v0, v8, Landroid/graphics/Point;->y:I

    sub-int/2addr v0, v12

    sub-int v3, v0, v9

    .line 2603
    .restart local v3       #height:I
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/android/launcher2/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    .line 2604
    sget-object v0, Lcom/android/launcher2/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v4

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v5

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->getMetrics(Landroid/graphics/Rect;Landroid/content/res/Resources;IIIII)V

    .line 2608
    .end local v2           #width:I
    .end local v3           #height:I
    .end local v9           #paddingBottom:I
    .end local v10           #paddingLeft:I
    .end local v11           #paddingRight:I
    .end local v12           #paddingTop:I
    :cond_2
    sget-object v0, Lcom/android/launcher2/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    goto :goto_0

    .line 2610
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F
    .locals 5
    .parameter "x"
    .parameter "y"
    .parameter "xOffset"
    .parameter "yOffset"
    .parameter "dragView"
    .parameter "recycle"

    .prologue
    .line 2912
    if-nez p6, :cond_0

    .line 2913
    const/4 v3, 0x2

    new-array v1, v3, [F

    .line 2920
    .local v1, res:[F
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0030

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr p1, v3

    .line 2921
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0031

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr p2, v3

    .line 2927
    sub-int v0, p1, p3

    .line 2928
    .local v0, left:I
    sub-int v2, p2, p4

    .line 2931
    .local v2, top:I
    const/4 v3, 0x0

    invoke-virtual {p5}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    int-to-float v4, v4

    aput v4, v1, v3

    .line 2932
    const/4 v3, 0x1

    invoke-virtual {p5}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v2

    int-to-float v4, v4

    aput v4, v1, v3

    .line 2934
    return-object v1

    .line 2915
    .end local v0           #left:I
    .end local v1           #res:[F
    .end local v2           #top:I
    :cond_0
    move-object v1, p6

    .restart local v1       #res:[F
    goto :goto_0
.end method

.method private getFinalPositionForDropAnimation([I[FLcom/android/launcher2/DragView;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/ItemInfo;[IZZ)V
    .locals 12
    .parameter "loc"
    .parameter "scaleXY"
    .parameter "dragView"
    .parameter "layout"
    .parameter "info"
    .parameter "targetCell"
    .parameter "external"
    .parameter "scale"

    .prologue
    .line 3414
    move-object/from16 v0, p5

    iget v6, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 3415
    .local v6, spanX:I
    move-object/from16 v0, p5

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 3417
    .local v7, spanY:I
    const/4 v1, 0x0

    aget v4, p6, v1

    const/4 v1, 0x1

    aget v5, p6, v1

    move-object v1, p0

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher2/Workspace;->estimateItemPosition(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/ItemInfo;IIII)Landroid/graphics/Rect;

    move-result-object v11

    .line 3418
    .local v11, r:Landroid/graphics/Rect;
    const/4 v1, 0x0

    iget v2, v11, Landroid/graphics/Rect;->left:I

    aput v2, p1, v1

    .line 3419
    const/4 v1, 0x1

    iget v2, v11, Landroid/graphics/Rect;->top:I

    aput v2, p1, v1

    .line 3421
    move-object/from16 v0, p4

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setFinalTransitionTransform(Lcom/android/launcher2/CellLayout;)V

    .line 3422
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v1

    move-object/from16 v0, p4

    invoke-virtual {v1, v0, p1}, Lcom/android/launcher2/DragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    move-result v8

    .line 3424
    .local v8, cellLayoutScale:F
    move-object/from16 v0, p4

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->resetTransitionTransform(Lcom/android/launcher2/CellLayout;)V

    .line 3428
    if-eqz p8, :cond_0

    .line 3429
    const/high16 v1, 0x3f80

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    invoke-virtual {p3}, Lcom/android/launcher2/DragView;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v9, v1, v2

    .line 3430
    .local v9, dragViewScaleX:F
    const/high16 v1, 0x3f80

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    invoke-virtual {p3}, Lcom/android/launcher2/DragView;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v10, v1, v2

    .line 3438
    .local v10, dragViewScaleY:F
    :goto_0
    const/4 v1, 0x0

    aget v2, p1, v1

    int-to-float v2, v2

    invoke-virtual {p3}, Lcom/android/launcher2/DragView;->getMeasuredWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v8

    sub-float/2addr v3, v4

    const/high16 v4, 0x4000

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int v2, v2

    aput v2, p1, v1

    .line 3439
    const/4 v1, 0x1

    aget v2, p1, v1

    int-to-float v2, v2

    invoke-virtual {p3}, Lcom/android/launcher2/DragView;->getMeasuredHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v8

    sub-float/2addr v3, v4

    const/high16 v4, 0x4000

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int v2, v2

    aput v2, p1, v1

    .line 3441
    const/4 v1, 0x0

    mul-float v2, v9, v8

    aput v2, p2, v1

    .line 3442
    const/4 v1, 0x1

    mul-float v2, v10, v8

    aput v2, p2, v1

    .line 3443
    return-void

    .line 3432
    .end local v9           #dragViewScaleX:F
    .end local v10           #dragViewScaleY:F
    :cond_0
    const/high16 v9, 0x3f80

    .line 3433
    .restart local v9       #dragViewScaleX:F
    const/high16 v10, 0x3f80

    .restart local v10       #dragViewScaleY:F
    goto :goto_0
.end method

.method private getRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I
    .locals 9
    .parameter "info"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/FolderInfo;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutInfo;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 4217
    .local p2, packageNames:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .local p3, appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    iget-object v1, p1, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 4218
    .local v1, contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 4220
    .local v2, contentsCount:I
    const/4 v4, 0x0

    .local v4, k:I
    :goto_0
    if-ge v4, v2, :cond_1

    .line 4221
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ShortcutInfo;

    .line 4222
    .local v0, appInfo:Lcom/android/launcher2/ShortcutInfo;
    iget-object v3, v0, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4223
    .local v3, intent:Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v5

    .line 4225
    .local v5, name:Landroid/content/ComponentName;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 4226
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4220
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4231
    .end local v0           #appInfo:Lcom/android/launcher2/ShortcutInfo;
    .end local v3           #intent:Landroid/content/Intent;
    .end local v5           #name:Landroid/content/ComponentName;
    :cond_1
    const-string v6, "Workspace"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getRemoveFolderItems info = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", packageNames = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", appsToRemoveFromFolder.size() = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4234
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    return v6
.end method

.method private getScrollRange()I
    .locals 2

    .prologue
    .line 884
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildOffset(I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildOffset(I)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private hitsPage(IFF)Z
    .locals 7
    .parameter "index"
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 626
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 627
    .local v1, page:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 628
    const/4 v4, 0x2

    new-array v0, v4, [F

    aput p2, v0, v3

    aput p3, v0, v2

    .line 629
    .local v0, localXY:[F
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[F)V

    .line 630
    aget v4, v0, v3

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_0

    aget v4, v0, v3

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_0

    aget v4, v0, v2

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_0

    aget v4, v0, v2

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_0

    .line 633
    .end local v0           #localXY:[F
    :goto_0
    return v2

    .restart local v0       #localXY:[F
    :cond_0
    move v2, v3

    .line 630
    goto :goto_0

    .end local v0           #localXY:[F
    :cond_1
    move v2, v3

    .line 633
    goto :goto_0
.end method

.method private initAnimationArrays()V
    .locals 2

    .prologue
    .line 1615
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    .line 1616
    .local v0, childCount:I
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mOldTranslationXs:[F

    if-eqz v1, :cond_0

    .line 1630
    :goto_0
    return-void

    .line 1617
    :cond_0
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldTranslationXs:[F

    .line 1618
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldTranslationYs:[F

    .line 1619
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldScaleXs:[F

    .line 1620
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldScaleYs:[F

    .line 1621
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldBackgroundAlphas:[F

    .line 1622
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mOldAlphas:[F

    .line 1623
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewTranslationXs:[F

    .line 1624
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewTranslationYs:[F

    .line 1625
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewScaleXs:[F

    .line 1626
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewScaleYs:[F

    .line 1627
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F

    .line 1628
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    .line 1629
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mNewRotationYs:[F

    goto :goto_0
.end method

.method private isDragWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 2938
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/LauncherAppWidgetInfo;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isExternalDragWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 2942
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    if-eq v0, p0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/launcher2/Workspace;->isDragWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isNeedToDelayRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)Z
    .locals 6
    .parameter "info"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/FolderInfo;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutInfo;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 4196
    .local p2, packageNames:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .local p3, appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    iget-object v0, p1, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 4197
    .local v0, contents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 4198
    .local v1, contentsCount:I
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/Workspace;->getRemoveFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/HashSet;Ljava/util/ArrayList;)I

    move-result v2

    .line 4200
    .local v2, removeFolderItemsCount:I
    const-string v3, "Workspace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isNeedToDelayRemoveFolderItems info = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", packageNames = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", contentsCount = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", removeFolderItemsCount = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4204
    add-int/lit8 v3, v1, -0x1

    if-lt v2, v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private manageFolderFeedback(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFLandroid/view/View;)V
    .locals 10
    .parameter "info"
    .parameter "targetLayout"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "dragOverView"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 3071
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/Workspace;->willCreateUserFolder(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFZ)Z

    move-result v6

    .line 3074
    .local v6, userFolderPending:Z
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-nez v0, :cond_1

    if-eqz v6, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->alarmPending()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3076
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

    new-instance v1, Lcom/android/launcher2/Workspace$FolderCreationAlarmListener;

    aget v2, p3, v5

    aget v3, p3, v8

    invoke-direct {v1, p0, p2, v2, v3}, Lcom/android/launcher2/Workspace$FolderCreationAlarmListener;-><init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/CellLayout;II)V

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Alarm;->setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V

    .line 3078
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mFolderCreationAlarm:Lcom/android/launcher2/Alarm;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Alarm;->setAlarm(J)V

    .line 3102
    .end local p5
    :cond_0
    :goto_0
    return-void

    .line 3082
    .restart local p5
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher2/Workspace;->willAddToExistingUserFolder(Ljava/lang/Object;Lcom/android/launcher2/CellLayout;[IF)Z

    move-result v7

    .line 3085
    .local v7, willAddToFolder:Z
    if-eqz v7, :cond_3

    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-nez v0, :cond_3

    .line 3086
    check-cast p5, Lcom/android/launcher2/FolderIcon;

    .end local p5
    iput-object p5, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    .line 3087
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverFolderIcon:Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/FolderIcon;->onDragEnter(Ljava/lang/Object;)V

    .line 3088
    if-eqz p2, :cond_2

    .line 3089
    invoke-virtual {p2}, Lcom/android/launcher2/CellLayout;->clearDragOutlines()V

    .line 3091
    :cond_2
    invoke-virtual {p0, v9}, Lcom/android/launcher2/Workspace;->setDragMode(I)V

    goto :goto_0

    .line 3095
    .restart local p5
    :cond_3
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-ne v0, v9, :cond_4

    if-nez v7, :cond_4

    .line 3096
    invoke-virtual {p0, v5}, Lcom/android/launcher2/Workspace;->setDragMode(I)V

    .line 3098
    :cond_4
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-ne v0, v8, :cond_0

    if-nez v6, :cond_0

    .line 3099
    invoke-virtual {p0, v5}, Lcom/android/launcher2/Workspace;->setDragMode(I)V

    goto :goto_0
.end method

.method private onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;Z)V
    .locals 6
    .parameter "touchXY"
    .parameter "dragInfo"
    .parameter "cellLayout"
    .parameter "insertAtFirst"

    .prologue
    .line 3197
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher2/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;ZLcom/android/launcher2/DropTarget$DragObject;)V

    .line 3198
    return-void
.end method

.method private onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;ZLcom/android/launcher2/DropTarget$DragObject;)V
    .locals 55
    .parameter "touchXY"
    .parameter "dragInfo"
    .parameter "cellLayout"
    .parameter "insertAtFirst"
    .parameter "d"

    .prologue
    .line 3210
    new-instance v50, Lcom/android/launcher2/Workspace$8;

    move-object/from16 v0, v50

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/launcher2/Workspace$8;-><init>(Lcom/android/launcher2/Workspace;)V

    .local v50, exitSpringLoadedRunnable:Ljava/lang/Runnable;
    move-object/from16 v30, p2

    .line 3217
    check-cast v30, Lcom/android/launcher2/ItemInfo;

    .line 3218
    .local v30, info:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v30

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 3219
    .local v5, spanX:I
    move-object/from16 v0, v30

    iget v6, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 3220
    .local v6, spanY:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v2, :cond_0

    .line 3221
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v5, v2, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    .line 3222
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v6, v2, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    .line 3225
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-wide/16 v26, -0x65

    .line 3228
    .local v26, container:J
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v28

    .line 3229
    .local v28, screen:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v0, v28

    if-eq v0, v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    if-eq v2, v3, :cond_1

    .line 3231
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    .line 3235
    :cond_1
    const-string v3, "Workspace"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDropExternal: touchXY[0] = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p1, :cond_c

    const/4 v2, 0x0

    aget v2, p1, v2

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", touchXY[1] = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p1, :cond_d

    const/4 v2, 0x1

    aget v2, p1, v2

    :goto_2
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", dragInfo = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ",info = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v30

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", cellLayout = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", insertAtFirst = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", dragInfo = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    iget-object v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", screen = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", container = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v26

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3243
    move-object/from16 v0, v30

    instance-of v2, v0, Lcom/android/launcher2/PendingAddItemInfo;

    if-eqz v2, :cond_f

    move-object/from16 v24, p2

    .line 3244
    check-cast v24, Lcom/android/launcher2/PendingAddItemInfo;

    .line 3246
    .local v24, pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;
    const/16 v51, 0x1

    .line 3247
    .local v51, findNearestVacantCell:Z
    move-object/from16 v0, v24

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 3248
    const/4 v2, 0x0

    aget v3, p1, v2

    const/4 v2, 0x1

    aget v4, p1, v2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 3250
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher2/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v11

    .line 3252
    .local v11, distance:F
    move-object/from16 v0, p5

    iget-object v8, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v8, Lcom/android/launcher2/ItemInfo;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p3

    invoke-virtual/range {v7 .. v12}, Lcom/android/launcher2/Workspace;->willCreateUserFolder(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFZ)Z

    move-result v2

    if-nez v2, :cond_2

    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/ItemInfo;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v2, v1, v3, v11}, Lcom/android/launcher2/Workspace;->willAddToExistingUserFolder(Ljava/lang/Object;Lcom/android/launcher2/CellLayout;[IF)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3255
    :cond_2
    const/16 v51, 0x0

    .line 3259
    .end local v11           #distance:F
    :cond_3
    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/launcher2/ItemInfo;

    .line 3260
    .local v25, item:Lcom/android/launcher2/ItemInfo;
    const/16 v54, 0x0

    .line 3261
    .local v54, updateWidgetSize:Z
    if-eqz v51, :cond_7

    .line 3262
    move-object/from16 v0, v25

    iget v15, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 3263
    .local v15, minSpanX:I
    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v16, v0

    .line 3264
    .local v16, minSpanY:I
    move-object/from16 v0, v25

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    if-lez v2, :cond_4

    move-object/from16 v0, v25

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    if-lez v2, :cond_4

    .line 3265
    move-object/from16 v0, v25

    iget v15, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 3266
    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    move/from16 v16, v0

    .line 3268
    :cond_4
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 v21, v0

    .line 3269
    .local v21, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v13, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v14, v2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v17, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v20, v0

    const/16 v22, 0x2

    move-object/from16 v12, p3

    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher2/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 3273
    const/4 v2, 0x0

    aget v2, v21, v2

    move-object/from16 v0, v25

    iget v3, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    if-ne v2, v3, :cond_5

    const/4 v2, 0x1

    aget v2, v21, v2

    move-object/from16 v0, v25

    iget v3, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    if-eq v2, v3, :cond_6

    .line 3274
    :cond_5
    const/16 v54, 0x1

    .line 3276
    :cond_6
    const/4 v2, 0x0

    aget v2, v21, v2

    move-object/from16 v0, v25

    iput v2, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 3277
    const/4 v2, 0x1

    aget v2, v21, v2

    move-object/from16 v0, v25

    iput v2, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 3280
    .end local v15           #minSpanX:I
    .end local v16           #minSpanY:I
    .end local v21           #resultSpan:[I
    :cond_7
    new-instance v22, Lcom/android/launcher2/Workspace$9;

    move-object/from16 v23, p0

    invoke-direct/range {v22 .. v28}, Lcom/android/launcher2/Workspace$9;-><init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/PendingAddItemInfo;Lcom/android/launcher2/ItemInfo;JI)V

    .line 3303
    .local v22, onAnimationCompleteRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, v24

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_e

    move-object/from16 v2, v24

    check-cast v2, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget-object v0, v2, Lcom/android/launcher2/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v35, v0

    .line 3306
    .local v35, finalView:Landroid/view/View;
    :goto_3
    move-object/from16 v0, v35

    instance-of v2, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v2, :cond_8

    if-eqz v54, :cond_8

    move-object/from16 v49, v35

    .line 3307
    check-cast v49, Landroid/appwidget/AppWidgetHostView;

    .line 3308
    .local v49, awhv:Landroid/appwidget/AppWidgetHostView;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, v25

    iget v3, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move-object/from16 v0, v25

    iget v4, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v0, v49

    invoke-static {v0, v2, v3, v4}, Lcom/android/launcher2/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/android/launcher2/Launcher;II)V

    .line 3312
    .end local v49           #awhv:Landroid/appwidget/AppWidgetHostView;
    :cond_8
    const/16 v34, 0x0

    .line 3313
    .local v34, animationStyle:I
    move-object/from16 v0, v24

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_9

    check-cast v24, Lcom/android/launcher2/PendingAddWidgetInfo;

    .end local v24           #pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v2, :cond_9

    .line 3315
    const/16 v34, 0x1

    .line 3317
    :cond_9
    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v32, v0

    const/16 v36, 0x1

    move-object/from16 v29, p0

    move-object/from16 v31, p3

    move-object/from16 v33, v22

    invoke-virtual/range {v29 .. v36}, Lcom/android/launcher2/Workspace;->animateWidgetDrop(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 3387
    .end local v22           #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .end local v25           #item:Lcom/android/launcher2/ItemInfo;
    .end local v34           #animationStyle:I
    .end local v35           #finalView:Landroid/view/View;
    .end local v51           #findNearestVacantCell:Z
    .end local v54           #updateWidgetSize:Z
    :cond_a
    :goto_4
    return-void

    .line 3225
    .end local v26           #container:J
    .end local v28           #screen:I
    :cond_b
    const-wide/16 v26, -0x64

    goto/16 :goto_0

    .line 3235
    .restart local v26       #container:J
    .restart local v28       #screen:I
    :cond_c
    const/4 v2, -0x1

    goto/16 :goto_1

    :cond_d
    const/4 v2, -0x1

    goto/16 :goto_2

    .line 3303
    .restart local v22       #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .restart local v24       #pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;
    .restart local v25       #item:Lcom/android/launcher2/ItemInfo;
    .restart local v51       #findNearestVacantCell:Z
    .restart local v54       #updateWidgetSize:Z
    :cond_e
    const/16 v35, 0x0

    goto :goto_3

    .line 3321
    .end local v22           #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .end local v24           #pendingInfo:Lcom/android/launcher2/PendingAddItemInfo;
    .end local v25           #item:Lcom/android/launcher2/ItemInfo;
    .end local v51           #findNearestVacantCell:Z
    .end local v54           #updateWidgetSize:Z
    :cond_f
    const/16 v37, 0x0

    .line 3323
    .local v37, view:Landroid/view/View;
    move-object/from16 v0, v30

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v2, :pswitch_data_0

    .line 3338
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown item type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3326
    :pswitch_0
    move-object/from16 v0, v30

    iget-wide v2, v0, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v7, -0x1

    cmp-long v2, v2, v7

    if-nez v2, :cond_10

    move-object/from16 v0, v30

    instance-of v2, v0, Lcom/android/launcher2/ApplicationInfo;

    if-eqz v2, :cond_10

    .line 3328
    new-instance v52, Lcom/android/launcher2/ShortcutInfo;

    check-cast v30, Lcom/android/launcher2/ApplicationInfo;

    .end local v30           #info:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v52

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/android/launcher2/ShortcutInfo;-><init>(Lcom/android/launcher2/ApplicationInfo;)V

    .local v52, info:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v30, v52

    .line 3330
    .end local v52           #info:Lcom/android/launcher2/ItemInfo;
    .restart local v30       #info:Lcom/android/launcher2/ItemInfo;
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    const v4, 0x7f040002

    move-object/from16 v2, v30

    check-cast v2, Lcom/android/launcher2/ShortcutInfo;

    move-object/from16 v0, p3

    invoke-virtual {v3, v4, v0, v2}, Lcom/android/launcher2/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v37

    .line 3343
    :goto_5
    if-eqz p1, :cond_11

    .line 3344
    const/4 v2, 0x0

    aget v3, p1, v2

    const/4 v2, 0x1

    aget v4, p1, v2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 3346
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher2/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v11

    .line 3348
    .restart local v11       #distance:F
    move-object/from16 v0, v50

    move-object/from16 v1, p5

    iput-object v0, v1, Lcom/android/launcher2/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    .line 3349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v41, v0

    const/16 v43, 0x1

    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v44, v0

    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    move-object/from16 v45, v0

    move-object/from16 v36, p0

    move-wide/from16 v38, v26

    move-object/from16 v40, p3

    move/from16 v42, v11

    invoke-virtual/range {v36 .. v45}, Lcom/android/launcher2/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/android/launcher2/CellLayout;[IFZLcom/android/launcher2/DragView;Ljava/lang/Runnable;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 3353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v39, v0

    const/16 v42, 0x1

    move-object/from16 v36, p0

    move-object/from16 v38, p3

    move/from16 v40, v11

    move-object/from16 v41, p5

    invoke-virtual/range {v36 .. v42}, Lcom/android/launcher2/Workspace;->addToExistingFolderIfNecessary(Landroid/view/View;Lcom/android/launcher2/CellLayout;[IFLcom/android/launcher2/DropTarget$DragObject;Z)Z

    move-result v2

    if-nez v2, :cond_a

    .line 3359
    .end local v11           #distance:F
    :cond_11
    if-eqz p1, :cond_12

    .line 3361
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v0, v2

    move/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v0, v2

    move/from16 v40, v0

    const/16 v41, 0x1

    const/16 v42, 0x1

    const/16 v43, 0x1

    const/16 v44, 0x1

    const/16 v45, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v46, v0

    const/16 v47, 0x0

    const/16 v48, 0x2

    move-object/from16 v38, p3

    invoke-virtual/range {v38 .. v48}, Lcom/android/launcher2/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 3367
    :goto_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v41, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v42, v2, v3

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v43, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v44, v0

    move-object/from16 v36, p0

    move-wide/from16 v38, v26

    move/from16 v40, v28

    move/from16 v45, p4

    invoke-virtual/range {v36 .. v45}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3369
    move-object/from16 v0, p3

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->onDropChild(Landroid/view/View;)V

    .line 3370
    invoke-virtual/range {v37 .. v37}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v53

    check-cast v53, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 3371
    .local v53, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    invoke-virtual/range {p3 .. p3}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v2

    move-object/from16 v0, v37

    invoke-virtual {v2, v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->measureChild(Landroid/view/View;)V

    .line 3374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v38, v0

    move-object/from16 v0, v53

    iget v0, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    move/from16 v43, v0

    move-object/from16 v0, v53

    iget v0, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    move/from16 v44, v0

    move-object/from16 v39, v30

    move-wide/from16 v40, v26

    move/from16 v42, v28

    invoke-static/range {v38 .. v44}, Lcom/android/launcher2/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    .line 3377
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    if-eqz v2, :cond_a

    .line 3381
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setFinalTransitionTransform(Lcom/android/launcher2/CellLayout;)V

    .line 3382
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    invoke-virtual {v2, v3, v0, v1}, Lcom/android/launcher2/DragLayer;->animateViewIntoPosition(Lcom/android/launcher2/DragView;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 3384
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->resetTransitionTransform(Lcom/android/launcher2/CellLayout;)V

    goto/16 :goto_4

    .line 3334
    .end local v53           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :pswitch_1
    const v3, 0x7f04000c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v2, v30

    check-cast v2, Lcom/android/launcher2/FolderInfo;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v0, p3

    invoke-static {v3, v4, v0, v2, v7}, Lcom/android/launcher2/FolderIcon;->fromXml(ILcom/android/launcher2/Launcher;Landroid/view/ViewGroup;Lcom/android/launcher2/FolderInfo;Lcom/android/launcher2/IconCache;)Lcom/android/launcher2/FolderIcon;

    move-result-object v37

    .line 3336
    goto/16 :goto_5

    .line 3365
    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    goto/16 :goto_6

    .line 3323
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onResetScrollArea()V
    .locals 1

    .prologue
    .line 3778
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3779
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    .line 3780
    return-void
.end method

.method private removeFolderItems(Lcom/android/launcher2/FolderInfo;Ljava/util/ArrayList;)V
    .locals 3
    .parameter "info"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/FolderInfo;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4244
    .local p2, appsToRemoveFromFolder:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutInfo;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ShortcutInfo;

    .line 4245
    .local v1, item:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {p1, v1}, Lcom/android/launcher2/FolderInfo;->remove(Lcom/android/launcher2/ShortcutInfo;)V

    .line 4246
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-static {v2, v1}, Lcom/android/launcher2/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;)V

    goto :goto_0

    .line 4248
    .end local v1           #item:Lcom/android/launcher2/ShortcutInfo;
    :cond_0
    return-void
.end method

.method private setChildrenBackgroundAlphaMultipliers(F)V
    .locals 3
    .parameter "a"

    .prologue
    .line 1283
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1284
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 1285
    .local v0, child:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0, p1}, Lcom/android/launcher2/CellLayout;->setBackgroundAlphaMultiplier(F)V

    .line 1283
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1287
    .end local v0           #child:Lcom/android/launcher2/CellLayout;
    :cond_0
    return-void
.end method

.method private static squaredDistance([F[F)F
    .locals 5
    .parameter "point1"
    .parameter "point2"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2797
    aget v2, p0, v3

    aget v3, p1, v3

    sub-float v0, v2, v3

    .line 2798
    .local v0, distanceX:F
    aget v2, p1, v4

    aget v3, p1, v4

    sub-float v1, v2, v3

    .line 2799
    .local v1, distanceY:F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    return v2
.end method

.method private syncWallpaperOffsetWithScroll()V
    .locals 3

    .prologue
    .line 956
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isHardwareAccelerated()Z

    move-result v0

    .line 957
    .local v0, enableWallpaperEffects:Z
    if-eqz v0, :cond_0

    .line 958
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->wallpaperOffsetForCurrentScroll()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->setFinalX(F)V

    .line 960
    :cond_0
    return-void
.end method

.method private updateChildrenLayersEnabled(Z)V
    .locals 7
    .parameter "force"

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 1450
    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v6, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    if-eq v5, v6, :cond_0

    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-eqz v5, :cond_4

    :cond_0
    move v3, v4

    .line 1451
    .local v3, small:Z
    :goto_0
    if-nez p1, :cond_1

    if-nez v3, :cond_1

    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mAnimatingViewIntoPlace:Z

    if-nez v5, :cond_1

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isPageMoving()Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    move v1, v4

    .line 1453
    .local v1, enableChildrenLayers:Z
    :cond_2
    iget-boolean v4, p0, Lcom/android/launcher2/Workspace;->mChildrenLayersEnabled:Z

    if-eq v1, v4, :cond_3

    .line 1454
    iput-boolean v1, p0, Lcom/android/launcher2/Workspace;->mChildrenLayersEnabled:Z

    .line 1455
    iget-boolean v4, p0, Lcom/android/launcher2/Workspace;->mChildrenLayersEnabled:Z

    if-eqz v4, :cond_5

    .line 1456
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->enableHwLayersOnVisiblePages()V

    .line 1464
    :cond_3
    return-void

    .end local v1           #enableChildrenLayers:Z
    .end local v3           #small:Z
    :cond_4
    move v3, v1

    .line 1450
    goto :goto_0

    .line 1458
    .restart local v1       #enableChildrenLayers:Z
    .restart local v3       #small:Z
    :cond_5
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getPageCount()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 1459
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 1460
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->disableHardwareLayers()V

    .line 1458
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private updatePageAlphaValues(I)V
    .locals 8
    .parameter "screenCenter"

    .prologue
    const/high16 v7, 0x3f80

    .line 1260
    iget v5, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    if-ltz v5, :cond_0

    iget v5, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    iget v6, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v5, v6, :cond_2

    :cond_0
    const/4 v3, 0x1

    .line 1261
    .local v3, isInOverscroll:Z
    :goto_0
    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mWorkspaceFadeInAdjacentScreens:Z

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v6, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    if-ne v5, v6, :cond_4

    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v5, :cond_4

    if-nez v3, :cond_4

    .line 1265
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 1266
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1267
    .local v1, child:Lcom/android/launcher2/CellLayout;
    if-eqz v1, :cond_1

    .line 1268
    invoke-virtual {p0, p1, v1, v2}, Lcom/android/launcher2/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 1269
    .local v4, scrollProgress:F
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v0, v7, v5

    .line 1270
    .local v0, alpha:F
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setAlpha(F)V

    .line 1271
    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mIsDragOccuring:Z

    if-nez v5, :cond_3

    .line 1272
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Workspace;->backgroundAlphaInterpolator(F)F

    move-result v5

    invoke-virtual {v1, v5}, Lcom/android/launcher2/CellLayout;->setBackgroundAlphaMultiplier(F)V

    .line 1265
    .end local v0           #alpha:F
    .end local v4           #scrollProgress:F
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1260
    .end local v1           #child:Lcom/android/launcher2/CellLayout;
    .end local v2           #i:I
    .end local v3           #isInOverscroll:Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_0

    .line 1275
    .restart local v0       #alpha:F
    .restart local v1       #child:Lcom/android/launcher2/CellLayout;
    .restart local v2       #i:I
    .restart local v3       #isInOverscroll:Z
    .restart local v4       #scrollProgress:F
    :cond_3
    invoke-virtual {v1, v7}, Lcom/android/launcher2/CellLayout;->setBackgroundAlphaMultiplier(F)V

    goto :goto_2

    .line 1280
    .end local v0           #alpha:F
    .end local v1           #child:Lcom/android/launcher2/CellLayout;
    .end local v2           #i:I
    .end local v4           #scrollProgress:F
    :cond_4
    return-void
.end method

.method private updateWallpaperOffsets()V
    .locals 6

    .prologue
    .line 967
    const/4 v1, 0x0

    .line 968
    .local v1, updateNow:Z
    const/4 v0, 0x1

    .line 969
    .local v0, keepUpdating:Z
    iget-boolean v2, p0, Lcom/android/launcher2/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    if-eqz v2, :cond_2

    .line 970
    const/4 v1, 0x1

    .line 971
    const/4 v0, 0x0

    .line 972
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->jumpToFinal()V

    .line 973
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 977
    :goto_0
    if-eqz v1, :cond_0

    .line 978
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    if-eqz v2, :cond_0

    .line 979
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v4}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->getCurrX()F

    move-result v4

    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v5}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->getCurrY()F

    move-result v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V

    .line 983
    :cond_0
    if-eqz v0, :cond_1

    .line 984
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 986
    :cond_1
    return-void

    .line 975
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->computeScrollOffset()Z

    move-result v0

    move v1, v0

    goto :goto_0
.end method

.method private wallpaperOffsetForCurrentScroll()F
    .locals 12

    .prologue
    const/high16 v11, 0x3f80

    .line 913
    iget-object v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    int-to-float v9, v9

    div-float v9, v11, v9

    invoke-virtual {v8, v9, v11}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 918
    iget v1, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 919
    .local v1, layoutScale:F
    iput v11, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 920
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->getScrollRange()I

    move-result v5

    .line 923
    .local v5, scrollRange:I
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v6

    .line 925
    .local v6, scrollX:I
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSupportCycleSlidingScreen()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 926
    iget v8, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v6, v8, :cond_1

    .line 927
    iget v8, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    sub-int v2, v6, v8

    .line 928
    .local v2, offset:I
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWidth()I

    move-result v9

    mul-int/2addr v8, v9

    int-to-float v8, v8

    int-to-float v9, v2

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWidth()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v9, v10

    sub-float v9, v11, v9

    mul-float/2addr v8, v9

    float-to-int v6, v8

    .line 933
    .end local v2           #offset:I
    :cond_0
    :goto_0
    const/4 v8, 0x0

    iget v9, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    invoke-static {v6, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v0, v8

    .line 934
    .local v0, adjustedScrollX:F
    iget v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperScrollRatio:F

    mul-float/2addr v0, v8

    .line 935
    iput v1, p0, Lcom/android/launcher2/PagedView;->mLayoutScale:F

    .line 937
    int-to-float v8, v5

    div-float v4, v0, v8

    .line 940
    .local v4, scrollProgress:F
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_2

    iget-boolean v8, p0, Lcom/android/launcher2/Workspace;->mIsStaticWallpaper:Z

    if-eqz v8, :cond_2

    .line 944
    iget v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperTravelWidth:I

    iget v9, p0, Lcom/android/launcher2/Workspace;->mWallpaperWidth:I

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 946
    .local v7, wallpaperTravelWidth:I
    int-to-float v8, v7

    mul-float/2addr v8, v4

    iget v9, p0, Lcom/android/launcher2/Workspace;->mWallpaperWidth:I

    sub-int/2addr v9, v7

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    add-float v3, v8, v9

    .line 948
    .local v3, offsetInDips:F
    iget v8, p0, Lcom/android/launcher2/Workspace;->mWallpaperWidth:I

    int-to-float v8, v8

    div-float v2, v3, v8

    .line 951
    .end local v3           #offsetInDips:F
    .end local v7           #wallpaperTravelWidth:I
    :goto_1
    return v2

    .line 929
    .end local v0           #adjustedScrollX:F
    .end local v4           #scrollProgress:F
    :cond_1
    if-gez v6, :cond_0

    .line 930
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    neg-int v9, v6

    mul-int v6, v8, v9

    goto :goto_0

    .restart local v0       #adjustedScrollX:F
    .restart local v4       #scrollProgress:F
    :cond_2
    move v2, v4

    .line 951
    goto :goto_1
.end method

.method private wallpaperTravelToScreenWidthRatio(II)F
    .locals 9
    .parameter "width"
    .parameter "height"

    .prologue
    .line 858
    int-to-float v7, p1

    int-to-float v8, p2

    div-float v4, v7, v8

    .line 865
    .local v4, aspectRatio:F
    const v0, 0x3fcccccd

    .line 866
    .local v0, ASPECT_RATIO_LANDSCAPE:F
    const/high16 v1, 0x3f20

    .line 867
    .local v1, ASPECT_RATIO_PORTRAIT:F
    const/high16 v2, 0x3fc0

    .line 868
    .local v2, WALLPAPER_WIDTH_TO_SCREEN_RATIO_LANDSCAPE:F
    const v3, 0x3f99999a

    .line 875
    .local v3, WALLPAPER_WIDTH_TO_SCREEN_RATIO_PORTRAIT:F
    const v5, 0x3e9d89d7

    .line 878
    .local v5, x:F
    const v6, 0x3f80fc10

    .line 879
    .local v6, y:F
    const v7, 0x3e9d89d7

    mul-float/2addr v7, v4

    const v8, 0x3f80fc10

    add-float/2addr v7, v8

    return v7
.end method


# virtual methods
.method public acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 29
    .parameter "d"

    .prologue
    .line 2064
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    .line 2065
    .local v9, dropTargetLayout:Lcom/android/launcher2/CellLayout;
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    move-object/from16 v0, p0

    if-eq v2, v0, :cond_a

    .line 2067
    if-nez v9, :cond_0

    .line 2068
    const/4 v2, 0x0

    .line 2148
    :goto_0
    return v2

    .line 2070
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->transitionStateShouldAllowDrop()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    .line 2072
    :cond_1
    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    .line 2076
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2, v9}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2077
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/android/launcher2/Hotseat;[F)V

    .line 2082
    :goto_1
    const/16 v17, 0x1

    .line 2083
    .local v17, spanX:I
    const/16 v18, 0x1

    .line 2084
    .local v18, spanY:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v2, :cond_4

    .line 2085
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    move-object/from16 v23, v0

    .line 2086
    .local v23, dragCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;
    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    move/from16 v17, v0

    .line 2087
    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    move/from16 v18, v0

    .line 2094
    .end local v23           #dragCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;
    :goto_2
    move/from16 v5, v17

    .line 2095
    .local v5, minSpanX:I
    move/from16 v6, v18

    .line 2096
    .local v6, minSpanY:I
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v2, :cond_2

    .line 2097
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget v5, v2, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 2098
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget v6, v2, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 2101
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v3, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v2, v2, v4

    float-to-int v4, v2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object v7, v9

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 2104
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    invoke-virtual {v9, v2, v3, v4}, Lcom/android/launcher2/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v11

    .line 2106
    .local v11, distance:F
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v8, Lcom/android/launcher2/ItemInfo;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v12, 0x1

    move-object/from16 v7, p0

    invoke-virtual/range {v7 .. v12}, Lcom/android/launcher2/Workspace;->willCreateUserFolder(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFZ)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2108
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2079
    .end local v5           #minSpanX:I
    .end local v6           #minSpanY:I
    .end local v11           #distance:F
    .end local v17           #spanX:I
    .end local v18           #spanY:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v2, v3}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto/16 :goto_1

    .line 2089
    .restart local v17       #spanX:I
    .restart local v18       #spanY:I
    :cond_4
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/launcher2/ItemInfo;

    .line 2090
    .local v24, dragInfo:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v17, v0

    .line 2091
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v18, v0

    goto/16 :goto_2

    .line 2110
    .end local v24           #dragInfo:Lcom/android/launcher2/ItemInfo;
    .restart local v5       #minSpanX:I
    .restart local v6       #minSpanY:I
    .restart local v11       #distance:F
    :cond_5
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/android/launcher2/ItemInfo;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v9, v3, v11}, Lcom/android/launcher2/Workspace;->willAddToExistingUserFolder(Ljava/lang/Object;Lcom/android/launcher2/CellLayout;[IF)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2112
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2115
    :cond_6
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 v21, v0

    .line 2116
    .local v21, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v13, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v14, v2

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v20, v0

    const/16 v22, 0x3

    move-object v12, v9

    move v15, v5

    move/from16 v16, v6

    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher2/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 2119
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ltz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ltz v2, :cond_7

    const/16 v25, 0x1

    .line 2122
    .local v25, foundCell:Z
    :goto_3
    if-nez v25, :cond_9

    .line 2125
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2, v9}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v28

    .line 2126
    .local v28, isHotseat:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    if-eqz v2, :cond_8

    if-eqz v28, :cond_8

    .line 2127
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v26

    .line 2128
    .local v26, hotseat:Lcom/android/launcher2/Hotseat;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v2, v3}, Lcom/android/launcher2/Hotseat;->getOrderInHotseat(II)I

    move-result v2

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Hotseat;->isAllAppsButtonRank(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2130
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2119
    .end local v25           #foundCell:Z
    .end local v26           #hotseat:Lcom/android/launcher2/Hotseat;
    .end local v28           #isHotseat:Z
    :cond_7
    const/16 v25, 0x0

    goto :goto_3

    .line 2134
    .restart local v25       #foundCell:Z
    .restart local v28       #isHotseat:Z
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    .line 2135
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2140
    .end local v28           #isHotseat:Z
    :cond_9
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v2, :cond_a

    .line 2141
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v27, v0

    check-cast v27, Lcom/android/launcher2/PendingAddWidgetInfo;

    .line 2142
    .local v27, info:Lcom/android/launcher2/PendingAddWidgetInfo;
    move-object/from16 v0, v27

    iget-object v2, v0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Workspace;->searchIMTKWidget(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 2143
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Launcher;->showOnlyOneWidgetMessage(Lcom/android/launcher2/PendingAddWidgetInfo;)V

    .line 2144
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2148
    .end local v5           #minSpanX:I
    .end local v6           #minSpanY:I
    .end local v11           #distance:F
    .end local v17           #spanX:I
    .end local v18           #spanY:I
    .end local v21           #resultSpan:[I
    .end local v25           #foundCell:Z
    .end local v27           #info:Lcom/android/launcher2/PendingAddWidgetInfo;
    :cond_a
    const/4 v2, 0x1

    goto/16 :goto_0
.end method

.method addApplicationShortcut(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/CellLayout;JIIIZII)V
    .locals 15
    .parameter "info"
    .parameter "target"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "insertAtFirst"
    .parameter "intersectX"
    .parameter "intersectY"

    .prologue
    .line 2039
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    const v4, 0x7f040002

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v2, v4, v0, v1}, Lcom/android/launcher2/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v14

    .line 2041
    .local v14, view:Landroid/view/View;
    const/4 v2, 0x2

    new-array v3, v2, [I

    .line 2042
    .local v3, cellXY:[I
    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object/from16 v2, p2

    move/from16 v6, p9

    move/from16 v7, p10

    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->findCellForSpanThatIntersects([IIIII)Z

    .line 2044
    const-string v2, "Workspace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addApplicationShortcut: info = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", view = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", container = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p3

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", screen = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", cellXY[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v3, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", cellXY[1] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    aget v5, v3, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", insertAtFirst = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p8

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2050
    const/4 v2, 0x0

    aget v9, v3, v2

    const/4 v2, 0x1

    aget v10, v3, v2

    const/4 v11, 0x1

    const/4 v12, 0x1

    move-object v4, p0

    move-object v5, v14

    move-wide/from16 v6, p3

    move/from16 v8, p5

    move/from16 v13, p8

    invoke-virtual/range {v4 .. v13}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 2051
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v2, 0x0

    aget v9, v3, v2

    const/4 v2, 0x1

    aget v10, v3, v2

    move-object/from16 v5, p1

    move-wide/from16 v6, p3

    move/from16 v8, p5

    invoke-static/range {v4 .. v10}, Lcom/android/launcher2/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    .line 2053
    return-void
.end method

.method public addExternalItemToScreen(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;)Z
    .locals 4
    .parameter "dragInfo"
    .parameter "layout"

    .prologue
    const/4 v0, 0x0

    .line 3184
    const-string v1, "Workspace"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addExternalItemToScreen: dragInfo = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", layout = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3187
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mTempEstimate:[I

    iget v2, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v3, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {p2, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3188
    iget-object v1, p1, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/android/launcher2/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;Z)V

    .line 3189
    const/4 v0, 0x1

    .line 3192
    :goto_0
    return v0

    .line 3191
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2, p2}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    goto :goto_0
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
    .line 1404
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1405
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 1406
    .local v0, openFolder:Lcom/android/launcher2/Folder;
    if-eqz v0, :cond_1

    .line 1407
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher2/Folder;->addFocusables(Ljava/util/ArrayList;I)V

    .line 1412
    .end local v0           #openFolder:Lcom/android/launcher2/Folder;
    :cond_0
    :goto_0
    return-void

    .line 1409
    .restart local v0       #openFolder:Lcom/android/launcher2/Folder;
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher2/SmoothPagedView;->addFocusables(Ljava/util/ArrayList;II)V

    goto :goto_0
.end method

.method addInScreen(Landroid/view/View;JIIIII)V
    .locals 10
    .parameter "child"
    .parameter "container"
    .parameter "screen"
    .parameter "x"
    .parameter "y"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 511
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 512
    return-void
.end method

.method addInScreen(Landroid/view/View;JIIIIIZ)V
    .locals 14
    .parameter "child"
    .parameter "container"
    .parameter "screen"
    .parameter "x"
    .parameter "y"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "insert"

    .prologue
    .line 528
    const-wide/16 v4, -0x64

    cmp-long v4, p2, v4

    if-nez v4, :cond_2

    .line 529
    if-ltz p4, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v4

    move/from16 v0, p4

    if-lt v0, v4, :cond_2

    .line 530
    :cond_0
    const-string v4, "Workspace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The screen must be >= 0 and < "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p4

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "); skipping child"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    .end local p1
    :cond_1
    :goto_0
    return-void

    .line 537
    .restart local p1
    :cond_2
    const-wide/16 v4, -0x65

    cmp-long v4, p2, v4

    if-nez v4, :cond_9

    .line 538
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v12

    .line 539
    .local v12, layout:Lcom/android/launcher2/CellLayout;
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 542
    instance-of v4, p1, Lcom/android/launcher2/FolderIcon;

    if-eqz v4, :cond_3

    move-object v4, p1

    .line 543
    check-cast v4, Lcom/android/launcher2/FolderIcon;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/launcher2/FolderIcon;->setTextVisible(Z)V

    .line 546
    :cond_3
    if-gez p4, :cond_8

    .line 547
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v4

    move/from16 v0, p5

    move/from16 v1, p6

    invoke-virtual {v4, v0, v1}, Lcom/android/launcher2/Hotseat;->getOrderInHotseat(II)I

    move-result p4

    .line 564
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    .line 566
    .local v11, genericLp:Landroid/view/ViewGroup$LayoutParams;
    if-eqz v11, :cond_4

    instance-of v4, v11, Lcom/android/launcher2/CellLayout$LayoutParams;

    if-nez v4, :cond_b

    .line 567
    :cond_4
    new-instance v13, Lcom/android/launcher2/CellLayout$LayoutParams;

    move/from16 v0, p5

    move/from16 v1, p6

    move/from16 v2, p7

    move/from16 v3, p8

    invoke-direct {v13, v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout$LayoutParams;-><init>(IIII)V

    .line 576
    .local v13, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :goto_2
    if-gez p7, :cond_5

    if-gez p8, :cond_5

    .line 577
    const/4 v4, 0x0

    iput-boolean v4, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 581
    :cond_5
    const/4 v7, -0x1

    .line 598
    .local v7, childId:I
    instance-of v4, p1, Landroid/appwidget/AppWidgetHostView;

    if-eqz v4, :cond_c

    const-wide/16 v4, -0x64

    cmp-long v4, p2, v4

    if-nez v4, :cond_c

    .line 600
    const-wide/16 v4, 0x1

    add-long v4, v4, p2

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-static/range {v4 .. v10}, Lcom/android/launcher2/LauncherModel;->getCellLayoutChildId(JIIIII)I

    .end local v7           #childId:I
    move-result v7

    .line 605
    .restart local v7       #childId:I
    :goto_3
    instance-of v4, p1, Lcom/android/launcher2/Folder;

    if-nez v4, :cond_d

    const/4 v9, 0x1

    .line 606
    .local v9, markCellsAsOccupied:Z
    :goto_4
    if-eqz p9, :cond_e

    const/4 v6, 0x0

    :goto_5
    move-object v4, v12

    move-object v5, p1

    move-object v8, v13

    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher2/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z

    move-result v4

    if-nez v4, :cond_6

    .line 610
    const-string v4, "Workspace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to add to item at ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") to CellLayout"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    :cond_6
    instance-of v4, p1, Lcom/android/launcher2/Folder;

    if-nez v4, :cond_7

    .line 614
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 615
    iget-object v4, p0, Lcom/android/launcher2/PagedView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 617
    :cond_7
    instance-of v4, p1, Lcom/android/launcher2/DropTarget;

    if-eqz v4, :cond_1

    .line 618
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    check-cast p1, Lcom/android/launcher2/DropTarget;

    .end local p1
    invoke-virtual {v4, p1}, Lcom/android/launcher2/DragController;->addDropTarget(Lcom/android/launcher2/DropTarget;)V

    goto/16 :goto_0

    .line 551
    .end local v7           #childId:I
    .end local v9           #markCellsAsOccupied:Z
    .end local v11           #genericLp:Landroid/view/ViewGroup$LayoutParams;
    .end local v13           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .restart local p1
    :cond_8
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Lcom/android/launcher2/Hotseat;->getCellXFromOrder(I)I

    move-result p5

    .line 552
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Lcom/android/launcher2/Hotseat;->getCellYFromOrder(I)I

    move-result p6

    goto/16 :goto_1

    .line 556
    .end local v12           #layout:Lcom/android/launcher2/CellLayout;
    :cond_9
    instance-of v4, p1, Lcom/android/launcher2/FolderIcon;

    if-eqz v4, :cond_a

    move-object v4, p1

    .line 557
    check-cast v4, Lcom/android/launcher2/FolderIcon;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/launcher2/FolderIcon;->setTextVisible(Z)V

    .line 560
    :cond_a
    move/from16 v0, p4

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/android/launcher2/CellLayout;

    .line 561
    .restart local v12       #layout:Lcom/android/launcher2/CellLayout;
    new-instance v4, Lcom/android/launcher2/IconKeyEventListener;

    invoke-direct {v4}, Lcom/android/launcher2/IconKeyEventListener;-><init>()V

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    goto/16 :goto_1

    .restart local v11       #genericLp:Landroid/view/ViewGroup$LayoutParams;
    :cond_b
    move-object v13, v11

    .line 569
    check-cast v13, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 570
    .restart local v13       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    move/from16 v0, p5

    iput v0, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 571
    move/from16 v0, p6

    iput v0, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 572
    move/from16 v0, p7

    iput v0, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 573
    move/from16 v0, p8

    iput v0, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    goto/16 :goto_2

    .line 602
    .restart local v7       #childId:I
    :cond_c
    invoke-static/range {p2 .. p8}, Lcom/android/launcher2/LauncherModel;->getCellLayoutChildId(JIIIII)I

    move-result v7

    goto/16 :goto_3

    .line 605
    :cond_d
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 606
    .restart local v9       #markCellsAsOccupied:Z
    :cond_e
    const/4 v6, -0x1

    goto/16 :goto_5
.end method

.method addToExistingFolderIfNecessary(Landroid/view/View;Lcom/android/launcher2/CellLayout;[IFLcom/android/launcher2/DropTarget$DragObject;Z)Z
    .locals 7
    .parameter "newView"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "d"
    .parameter "external"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2274
    iget v4, p0, Lcom/android/launcher2/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v4, p4, v4

    if-lez v4, :cond_1

    .line 2305
    :cond_0
    :goto_0
    return v2

    .line 2278
    :cond_1
    aget v4, p3, v2

    aget v5, p3, v3

    invoke-virtual {p2, v4, v5}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 2280
    .local v0, dropOverView:Landroid/view/View;
    const-string v4, "Workspace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "createUserFolderIfNecessary: newView = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", target = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", targetCell[0] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, p3, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", targetCell[1] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, p3, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", external = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", d = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", dropOverView = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2284
    iget-boolean v4, p0, Lcom/android/launcher2/Workspace;->mAddToExistingFolderOnDrop:Z

    if-eqz v4, :cond_0

    .line 2287
    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 2289
    instance-of v4, v0, Lcom/android/launcher2/FolderIcon;

    if-eqz v4, :cond_0

    move-object v1, v0

    .line 2290
    check-cast v1, Lcom/android/launcher2/FolderIcon;

    .line 2291
    .local v1, fi:Lcom/android/launcher2/FolderIcon;
    iget-object v4, p5, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    invoke-virtual {v1, v4}, Lcom/android/launcher2/FolderIcon;->acceptDrop(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2292
    invoke-virtual {v1, p5}, Lcom/android/launcher2/FolderIcon;->onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 2295
    if-nez p6, :cond_2

    .line 2296
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v2

    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v4, v4, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v2, v4}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 2299
    :cond_2
    const-string v2, "Workspace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addToExistingFolderIfNecessary: fi = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", d = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v3

    .line 2302
    goto/16 :goto_0
.end method

.method public animateWidgetDrop(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V
    .locals 40
    .parameter "info"
    .parameter "cellLayout"
    .parameter "dragView"
    .parameter "onCompleteRunnable"
    .parameter "animationType"
    .parameter "finalView"
    .parameter "external"

    .prologue
    .line 3448
    new-instance v38, Landroid/graphics/Rect;

    invoke-direct/range {v38 .. v38}, Landroid/graphics/Rect;-><init>()V

    .line 3449
    .local v38, from:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v4

    move-object/from16 v0, p3

    move-object/from16 v1, v38

    invoke-virtual {v4, v0, v1}, Lcom/android/launcher2/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 3451
    const/4 v4, 0x2

    new-array v5, v4, [I

    .line 3452
    .local v5, finalPos:[I
    const/4 v4, 0x2

    new-array v6, v4, [F

    .line 3453
    .local v6, scaleXY:[F
    move-object/from16 v0, p1

    instance-of v4, v0, Lcom/android/launcher2/PendingAddShortcutInfo;

    if-nez v4, :cond_3

    const/4 v12, 0x1

    .line 3454
    .local v12, scalePreview:Z
    :goto_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v4, p0

    move-object/from16 v7, p3

    move-object/from16 v8, p2

    move-object/from16 v9, p1

    move/from16 v11, p7

    invoke-direct/range {v4 .. v12}, Lcom/android/launcher2/Workspace;->getFinalPositionForDropAnimation([I[FLcom/android/launcher2/DragView;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/ItemInfo;[IZZ)V

    .line 3457
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v39

    .line 3458
    .local v39, res:Landroid/content/res/Resources;
    const v4, 0x7f0a0014

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    add-int/lit16 v0, v4, -0xc8

    move/from16 v21, v0

    .line 3461
    .local v21, duration:I
    const-string v4, "Workspace"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "animateWidgetDrop: info = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", animationType = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p5

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", finalPos = ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    aget v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "), scaleXY = ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    aget v8, v6, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget v8, v6, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "), scalePreview = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",external = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3467
    move-object/from16 v0, p6

    instance-of v4, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v4, :cond_0

    if-eqz p7, :cond_0

    .line 3468
    const-string v4, "Workspace"

    const-string v7, "6557954 Animate widget drop, final view is appWidgetHostView"

    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3469
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    .line 3471
    :cond_0
    const/4 v4, 0x2

    move/from16 v0, p5

    if-eq v0, v4, :cond_1

    if-eqz p7, :cond_4

    :cond_1
    if-eqz p6, :cond_4

    .line 3472
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/Workspace;->createWidgetBitmap(Lcom/android/launcher2/ItemInfo;Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v37

    .line 3473
    .local v37, crossFadeBitmap:Landroid/graphics/Bitmap;
    move-object/from16 v0, p3

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setCrossFadeBitmap(Landroid/graphics/Bitmap;)V

    .line 3474
    move/from16 v0, v21

    int-to-float v4, v0

    const v7, 0x3f4ccccd

    mul-float/2addr v4, v7

    float-to-int v4, v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lcom/android/launcher2/DragView;->crossFade(I)V

    .line 3479
    .end local v37           #crossFadeBitmap:Landroid/graphics/Bitmap;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v22

    .line 3480
    .local v22, dragLayer:Lcom/android/launcher2/DragLayer;
    const/4 v4, 0x4

    move/from16 v0, p5

    if-ne v0, v4, :cond_5

    .line 3481
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v13

    const/16 v16, 0x0

    const v17, 0x3dcccccd

    const v18, 0x3dcccccd

    const/16 v19, 0x0

    move-object/from16 v14, p3

    move-object v15, v5

    move-object/from16 v20, p4

    invoke-virtual/range {v13 .. v21}, Lcom/android/launcher2/DragLayer;->animateViewIntoPosition(Lcom/android/launcher2/DragView;[IFFFILjava/lang/Runnable;I)V

    .line 3506
    :goto_2
    return-void

    .line 3453
    .end local v12           #scalePreview:Z
    .end local v21           #duration:I
    .end local v22           #dragLayer:Lcom/android/launcher2/DragLayer;
    .end local v39           #res:Landroid/content/res/Resources;
    :cond_3
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 3475
    .restart local v12       #scalePreview:Z
    .restart local v21       #duration:I
    .restart local v39       #res:Landroid/content/res/Resources;
    :cond_4
    move-object/from16 v0, p1

    iget v4, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    const/4 v7, 0x4

    if-ne v4, v7, :cond_2

    if-eqz p7, :cond_2

    .line 3476
    const/4 v4, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    aget v8, v6, v8

    const/4 v9, 0x1

    aget v9, v6, v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    aput v8, v6, v7

    aput v8, v6, v4

    goto :goto_1

    .line 3485
    .restart local v22       #dragLayer:Lcom/android/launcher2/DragLayer;
    :cond_5
    const/4 v4, 0x1

    move/from16 v0, p5

    if-ne v0, v4, :cond_6

    .line 3486
    const/16 v34, 0x2

    .line 3491
    .local v34, endStyle:I
    :goto_3
    new-instance v33, Lcom/android/launcher2/Workspace$10;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, p6

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher2/Workspace$10;-><init>(Lcom/android/launcher2/Workspace;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 3502
    .local v33, onComplete:Ljava/lang/Runnable;
    move-object/from16 v0, v38

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v24, v0

    move-object/from16 v0, v38

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v25, v0

    const/4 v4, 0x0

    aget v26, v5, v4

    const/4 v4, 0x1

    aget v27, v5, v4

    const/high16 v28, 0x3f80

    const/high16 v29, 0x3f80

    const/high16 v30, 0x3f80

    const/4 v4, 0x0

    aget v31, v6, v4

    const/4 v4, 0x1

    aget v32, v6, v4

    move-object/from16 v23, p3

    move/from16 v35, v21

    move-object/from16 v36, p0

    invoke-virtual/range {v22 .. v36}, Lcom/android/launcher2/DragLayer;->animateViewIntoPosition(Lcom/android/launcher2/DragView;IIIIFFFFFLjava/lang/Runnable;IILandroid/view/View;)V

    goto :goto_2

    .line 3488
    .end local v33           #onComplete:Ljava/lang/Runnable;
    .end local v34           #endStyle:I
    :cond_6
    const/16 v34, 0x0

    .restart local v34       #endStyle:I
    goto :goto_3
.end method

.method backgroundAlphaInterpolator(F)F
    .locals 4
    .parameter "r"

    .prologue
    .line 1236
    const v0, 0x3dcccccd

    .line 1237
    .local v0, pivotA:F
    const v1, 0x3ecccccd

    .line 1238
    .local v1, pivotB:F
    cmpg-float v2, p1, v0

    if-gez v2, :cond_0

    .line 1239
    const/4 v2, 0x0

    .line 1243
    :goto_0
    return v2

    .line 1240
    :cond_0
    cmpl-float v2, p1, v1

    if-lez v2, :cond_1

    .line 1241
    const/high16 v2, 0x3f80

    goto :goto_0

    .line 1243
    :cond_1
    sub-float v2, p1, v0

    sub-float v3, v1, v0

    div-float/2addr v2, v3

    goto :goto_0
.end method

.method public beginDragShared(Landroid/view/View;Lcom/android/launcher2/DragSource;)V
    .locals 24
    .parameter "child"
    .parameter "source"

    .prologue
    .line 1984
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    .line 1987
    .local v21, r:Landroid/content/res/Resources;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3}, Landroid/graphics/Canvas;-><init>()V

    const/4 v7, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3, v7}, Lcom/android/launcher2/Workspace;->createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1989
    .local v4, b:Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    .line 1990
    .local v14, bmpWidth:I
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    .line 1992
    .local v13, bmpHeight:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mTempXY:[I

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v7}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    move-result v12

    .line 1993
    .local v12, scale:F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTempXY:[I

    const/4 v7, 0x0

    aget v3, v3, v7

    int-to-float v3, v3

    int-to-float v7, v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v12

    sub-float/2addr v7, v8

    const/high16 v8, 0x4000

    div-float/2addr v7, v8

    sub-float/2addr v3, v7

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 1995
    .local v5, dragLayerX:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTempXY:[I

    const/4 v7, 0x1

    aget v3, v3, v7

    int-to-float v3, v3

    int-to-float v7, v13

    int-to-float v8, v13

    mul-float/2addr v8, v12

    sub-float/2addr v7, v8

    const/high16 v8, 0x4000

    div-float/2addr v7, v8

    sub-float/2addr v3, v7

    const/high16 v7, 0x3f80

    sub-float/2addr v3, v7

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 2003
    .local v6, dragLayerY:I
    const/4 v10, 0x0

    .line 2004
    .local v10, dragVisualizeOffset:Landroid/graphics/Point;
    const/4 v11, 0x0

    .line 2005
    .local v11, dragRect:Landroid/graphics/Rect;
    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/android/launcher2/BubbleTextView;

    if-nez v3, :cond_0

    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/android/launcher2/PagedViewIcon;

    if-eqz v3, :cond_3

    .line 2006
    :cond_0
    const v3, 0x7f0b0022

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v18

    .line 2007
    .local v18, iconSize:I
    const v3, 0x7f0b001b

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v17

    .line 2008
    .local v17, iconPaddingTop:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingTop()I

    move-result v23

    .line 2009
    .local v23, top:I
    sub-int v3, v14, v18

    div-int/lit8 v19, v3, 0x2

    .line 2010
    .local v19, left:I
    add-int v22, v19, v18

    .line 2011
    .local v22, right:I
    add-int v15, v23, v18

    .line 2012
    .local v15, bottom:I
    add-int v6, v6, v23

    .line 2015
    new-instance v10, Landroid/graphics/Point;

    .end local v10           #dragVisualizeOffset:Landroid/graphics/Point;
    const/4 v3, -0x1

    add-int/lit8 v7, v17, -0x1

    invoke-direct {v10, v3, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 2017
    .restart local v10       #dragVisualizeOffset:Landroid/graphics/Point;
    new-instance v11, Landroid/graphics/Rect;

    .end local v11           #dragRect:Landroid/graphics/Rect;
    move/from16 v0, v19

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v11, v0, v1, v2, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2024
    .end local v15           #bottom:I
    .end local v17           #iconPaddingTop:I
    .end local v18           #iconSize:I
    .end local v19           #left:I
    .end local v22           #right:I
    .end local v23           #top:I
    .restart local v11       #dragRect:Landroid/graphics/Rect;
    :cond_1
    :goto_0
    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/android/launcher2/BubbleTextView;

    if-eqz v3, :cond_2

    move-object/from16 v16, p1

    .line 2025
    check-cast v16, Lcom/android/launcher2/BubbleTextView;

    .line 2026
    .local v16, icon:Lcom/android/launcher2/BubbleTextView;
    invoke-virtual/range {v16 .. v16}, Lcom/android/launcher2/BubbleTextView;->clearPressedOrFocusedBackground()V

    .line 2029
    .end local v16           #icon:Lcom/android/launcher2/BubbleTextView;
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    const/4 v9, 0x0

    move-object/from16 v7, p2

    invoke-virtual/range {v3 .. v12}, Lcom/android/launcher2/DragController;->startDrag(Landroid/graphics/Bitmap;IILcom/android/launcher2/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V

    .line 2031
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 2034
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Workspace;->showScrollingIndicator(Z)V

    .line 2035
    return-void

    .line 2018
    :cond_3
    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/android/launcher2/FolderIcon;

    if-eqz v3, :cond_1

    .line 2019
    const v3, 0x7f0b003c

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v20

    .line 2020
    .local v20, previewSize:I
    new-instance v11, Landroid/graphics/Rect;

    .end local v11           #dragRect:Landroid/graphics/Rect;
    const/4 v3, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v8

    move/from16 v0, v20

    invoke-direct {v11, v3, v7, v8, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v11       #dragRect:Landroid/graphics/Rect;
    goto :goto_0
.end method

.method public buildPageHardwareLayers()V
    .locals 4

    .prologue
    .line 1497
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 1498
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1499
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    .line 1500
    .local v0, childCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 1501
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1502
    .local v1, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->buildHardwareLayer()V

    .line 1500
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1505
    .end local v0           #childCount:I
    .end local v1           #cl:Lcom/android/launcher2/CellLayout;
    .end local v2           #i:I
    :cond_0
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 1506
    return-void
.end method

.method clearChildrenCache()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1438
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    .line 1439
    .local v2, screenCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 1440
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1441
    .local v1, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v1, v4}, Lcom/android/launcher2/CellLayout;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1443
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isHardwareAccelerated()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1444
    invoke-virtual {v1, v4}, Lcom/android/launcher2/CellLayout;->setChildrenDrawingCacheEnabled(Z)V

    .line 1439
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1447
    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    :cond_1
    return-void
.end method

.method clearDropTargets()V
    .locals 7

    .prologue
    .line 3862
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 3864
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 3865
    .local v4, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v4}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    .line 3866
    .local v0, childCount:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 3867
    invoke-virtual {v4, v3}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 3868
    .local v5, v:Landroid/view/View;
    instance-of v6, v5, Lcom/android/launcher2/DropTarget;

    if-eqz v6, :cond_1

    .line 3869
    iget-object v6, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    check-cast v5, Lcom/android/launcher2/DropTarget;

    .end local v5           #v:Landroid/view/View;
    invoke-virtual {v6, v5}, Lcom/android/launcher2/DragController;->removeDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 3866
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3873
    .end local v0           #childCount:I
    .end local v3           #j:I
    .end local v4           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_2
    return-void
.end method

.method public computeScroll()V
    .locals 0

    .prologue
    .line 1146
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->computeScroll()V

    .line 1147
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->syncWallpaperOffsetWithScroll()V

    .line 1148
    return-void
.end method

.method public createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "v"
    .parameter "canvas"
    .parameter "padding"

    .prologue
    const/4 v5, 0x1

    .line 1882
    instance-of v2, p1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    move-object v2, p1

    .line 1883
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v1, v2, v5

    .line 1884
    .local v1, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    add-int/2addr v2, p3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    add-int/2addr v3, p3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1891
    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    .local v0, b:Landroid/graphics/Bitmap;
    :goto_0
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1892
    invoke-direct {p0, p1, p2, p3, v5}, Lcom/android/launcher2/Workspace;->drawDragView(Landroid/view/View;Landroid/graphics/Canvas;IZ)V

    .line 1893
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1895
    return-object v0

    .line 1887
    .end local v0           #b:Landroid/graphics/Bitmap;
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    add-int/2addr v2, p3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, p3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0       #b:Landroid/graphics/Bitmap;
    goto :goto_0
.end method

.method createUserFolderIfNecessary(Landroid/view/View;JLcom/android/launcher2/CellLayout;[IFZLcom/android/launcher2/DragView;Ljava/lang/Runnable;)Z
    .locals 21
    .parameter "newView"
    .parameter "container"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "external"
    .parameter "dragView"
    .parameter "postAnimationRunnable"

    .prologue
    .line 2204
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v2, p6, v2

    if-lez v2, :cond_0

    const/4 v2, 0x0

    .line 2269
    :goto_0
    return v2

    .line 2205
    :cond_0
    const/4 v2, 0x0

    aget v2, p5, v2

    const/4 v3, 0x1

    aget v3, p5, v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v2, v3}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v9

    .line 2207
    .local v9, v:Landroid/view/View;
    const-string v2, "Workspace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createUserFolderIfNecessary: newView = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mDragInfo = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", container = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", target = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", targetCell[0] = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    aget v4, p5, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", targetCell[1] = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    aget v4, p5, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", external = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p7

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", dragView = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p8

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", v = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCreateUserFolderOnDrop = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2214
    const/16 v19, 0x0

    .line 2215
    .local v19, hasntMoved:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v2, :cond_1

    .line 2216
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v17

    .line 2217
    .local v17, cellParent:Lcom/android/launcher2/CellLayout;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cellX:I

    const/4 v3, 0x0

    aget v3, p5, v3

    if-ne v2, v3, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cellY:I

    const/4 v3, 0x1

    aget v3, p5, v3

    if-ne v2, v3, :cond_3

    move-object/from16 v0, v17

    move-object/from16 v1, p4

    if-ne v0, v1, :cond_3

    const/16 v19, 0x1

    .line 2221
    .end local v17           #cellParent:Lcom/android/launcher2/CellLayout;
    :cond_1
    :goto_1
    if-eqz v9, :cond_2

    if-nez v19, :cond_2

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    if-nez v2, :cond_4

    .line 2223
    :cond_2
    const-string v2, "Workspace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Do not create user folder: hasntMoved = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCreateUserFolderOnDrop = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", v = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2226
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2217
    .restart local v17       #cellParent:Lcom/android/launcher2/CellLayout;
    :cond_3
    const/16 v19, 0x0

    goto :goto_1

    .line 2228
    .end local v17           #cellParent:Lcom/android/launcher2/CellLayout;
    :cond_4
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    .line 2229
    if-nez p5, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v6, v2, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    .line 2231
    .local v6, screen:I
    :goto_2
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    instance-of v15, v2, Lcom/android/launcher2/ShortcutInfo;

    .line 2232
    .local v15, aboveShortcut:Z
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    instance-of v0, v2, Lcom/android/launcher2/ShortcutInfo;

    move/from16 v20, v0

    .line 2235
    .local v20, willBecomeShortcut:Z
    const-string v2, "Workspace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createUserFolderIfNecessary: aboveShortcut = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", willBecomeShortcut = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2239
    if-eqz v15, :cond_9

    if-eqz v20, :cond_9

    .line 2240
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/ShortcutInfo;

    .line 2241
    .local v10, sourceInfo:Lcom/android/launcher2/ShortcutInfo;
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/ShortcutInfo;

    .line 2243
    .local v18, destInfo:Lcom/android/launcher2/ShortcutInfo;
    if-nez p7, :cond_5

    .line 2244
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v3, v3, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 2247
    :cond_5
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 2248
    .local v12, folderLocation:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    invoke-virtual {v2, v9, v12}, Lcom/android/launcher2/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v13

    .line 2249
    .local v13, scale:F
    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 2251
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v3, 0x0

    aget v7, p5, v3

    const/4 v3, 0x1

    aget v8, p5, v3

    move-object/from16 v3, p4

    move-wide/from16 v4, p2

    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher2/Launcher;->addFolder(Lcom/android/launcher2/CellLayout;JIII)Lcom/android/launcher2/FolderIcon;

    move-result-object v7

    .line 2253
    .local v7, fi:Lcom/android/launcher2/FolderIcon;
    const/4 v2, -0x1

    move-object/from16 v0, v18

    iput v2, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 2254
    const/4 v2, -0x1

    move-object/from16 v0, v18

    iput v2, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 2255
    const/4 v2, -0x1

    iput v2, v10, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 2256
    const/4 v2, -0x1

    iput v2, v10, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 2259
    if-eqz p8, :cond_7

    const/16 v16, 0x1

    .line 2260
    .local v16, animate:Z
    :goto_3
    if-eqz v16, :cond_8

    move-object/from16 v8, v18

    move-object/from16 v11, p8

    move-object/from16 v14, p9

    .line 2261
    invoke-virtual/range {v7 .. v14}, Lcom/android/launcher2/FolderIcon;->performCreateAnimation(Lcom/android/launcher2/ShortcutInfo;Landroid/view/View;Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/DragView;Landroid/graphics/Rect;FLjava/lang/Runnable;)V

    .line 2267
    :goto_4
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2229
    .end local v6           #screen:I
    .end local v7           #fi:Lcom/android/launcher2/FolderIcon;
    .end local v10           #sourceInfo:Lcom/android/launcher2/ShortcutInfo;
    .end local v12           #folderLocation:Landroid/graphics/Rect;
    .end local v13           #scale:F
    .end local v15           #aboveShortcut:Z
    .end local v16           #animate:Z
    .end local v18           #destInfo:Lcom/android/launcher2/ShortcutInfo;
    .end local v20           #willBecomeShortcut:Z
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v6

    goto/16 :goto_2

    .line 2259
    .restart local v6       #screen:I
    .restart local v7       #fi:Lcom/android/launcher2/FolderIcon;
    .restart local v10       #sourceInfo:Lcom/android/launcher2/ShortcutInfo;
    .restart local v12       #folderLocation:Landroid/graphics/Rect;
    .restart local v13       #scale:F
    .restart local v15       #aboveShortcut:Z
    .restart local v18       #destInfo:Lcom/android/launcher2/ShortcutInfo;
    .restart local v20       #willBecomeShortcut:Z
    :cond_7
    const/16 v16, 0x0

    goto :goto_3

    .line 2264
    .restart local v16       #animate:Z
    :cond_8
    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/android/launcher2/FolderIcon;->addItem(Lcom/android/launcher2/ShortcutInfo;)V

    .line 2265
    invoke-virtual {v7, v10}, Lcom/android/launcher2/FolderIcon;->addItem(Lcom/android/launcher2/ShortcutInfo;)V

    goto :goto_4

    .line 2269
    .end local v7           #fi:Lcom/android/launcher2/FolderIcon;
    .end local v10           #sourceInfo:Lcom/android/launcher2/ShortcutInfo;
    .end local v12           #folderLocation:Landroid/graphics/Rect;
    .end local v13           #scale:F
    .end local v16           #animate:Z
    .end local v18           #destInfo:Lcom/android/launcher2/ShortcutInfo;
    :cond_9
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public createWidgetBitmap(Lcom/android/launcher2/ItemInfo;Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 12
    .parameter "widgetInfo"
    .parameter "layout"

    .prologue
    const/high16 v11, 0x4000

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 3390
    iget-object v6, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v6}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v6

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v8, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {v6, v7, v8, p1, v9}, Lcom/android/launcher2/Workspace;->estimateItemSize(IILcom/android/launcher2/ItemInfo;Z)[I

    move-result-object v3

    .line 3392
    .local v3, unScaledSize:[I
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v4

    .line 3393
    .local v4, visibility:I
    invoke-virtual {p2, v9}, Landroid/view/View;->setVisibility(I)V

    .line 3395
    aget v6, v3, v9

    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 3396
    .local v5, width:I
    aget v6, v3, v10

    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 3397
    .local v2, height:I
    aget v6, v3, v9

    aget v7, v3, v10

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 3399
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 3401
    .local v1, c:Landroid/graphics/Canvas;
    invoke-virtual {p2, v5, v2}, Landroid/view/View;->measure(II)V

    .line 3402
    aget v6, v3, v9

    aget v7, v3, v10

    invoke-virtual {p2, v9, v9, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 3403
    invoke-virtual {p2, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 3404
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 3405
    invoke-virtual {p2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3406
    return-object v0
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 8
    .parameter "ev"

    .prologue
    const v7, 0x3f060a92

    .line 742
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 773
    :cond_0
    :goto_0
    return-void

    .line 743
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isFinishedSwitchingState()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 745
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget v6, p0, Lcom/android/launcher2/Workspace;->mXDown:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 746
    .local v0, deltaX:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget v6, p0, Lcom/android/launcher2/Workspace;->mYDown:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 748
    .local v1, deltaY:F
    const/4 v5, 0x0

    invoke-static {v0, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-eqz v5, :cond_0

    .line 750
    div-float v3, v1, v0

    .line 751
    .local v3, slope:F
    float-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->atan(D)D

    move-result-wide v5

    double-to-float v4, v5

    .line 753
    .local v4, theta:F
    iget v5, p0, Lcom/android/launcher2/PagedView;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v0, v5

    if-gtz v5, :cond_2

    iget v5, p0, Lcom/android/launcher2/PagedView;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v1, v5

    if-lez v5, :cond_3

    .line 754
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->cancelCurrentPageLongPress()V

    .line 757
    :cond_3
    const v5, 0x3f860a92

    cmpl-float v5, v4, v5

    if-gtz v5, :cond_0

    .line 760
    cmpl-float v5, v4, v7

    if-lez v5, :cond_4

    .line 765
    sub-float/2addr v4, v7

    .line 766
    div-float v5, v4, v7

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v2, v5

    .line 768
    .local v2, extraRatio:F
    const/high16 v5, 0x3f80

    const/high16 v6, 0x4080

    mul-float/2addr v6, v2

    add-float/2addr v5, v6

    invoke-super {p0, p1, v5}, Lcom/android/launcher2/SmoothPagedView;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    goto :goto_0

    .line 771
    .end local v2           #extraRatio:F
    :cond_4
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto :goto_0
.end method

.method disableBackground()V
    .locals 1

    .prologue
    .line 1190
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mDrawBackground:Z

    .line 1191
    return-void
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3676
    .local p1, container:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mSavedStates:Landroid/util/SparseArray;

    .line 3677
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .parameter "focused"
    .parameter "direction"

    .prologue
    .line 688
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isFinishedSwitchingState()Z

    move-result v0

    if-nez v0, :cond_1

    .line 690
    :cond_0
    const/4 v0, 0x0

    .line 692
    :goto_0
    return v0

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/launcher2/SmoothPagedView;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    goto :goto_0
.end method

.method enableBackground()V
    .locals 1

    .prologue
    .line 1193
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mDrawBackground:Z

    .line 1194
    return-void
.end method

.method enableChildrenCache(II)V
    .locals 6
    .parameter "fromPage"
    .parameter "toPage"

    .prologue
    const/4 v5, 0x1

    .line 1419
    if-le p1, p2, :cond_0

    .line 1420
    move v3, p1

    .line 1421
    .local v3, temp:I
    move p1, p2

    .line 1422
    move p2, v3

    .line 1425
    .end local v3           #temp:I
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    .line 1427
    .local v2, screenCount:I
    const/4 v4, 0x0

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1428
    add-int/lit8 v4, v2, -0x1

    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 1430
    move v0, p1

    .local v0, i:I
    :goto_0
    if-gt v0, p2, :cond_1

    .line 1431
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 1432
    .local v1, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v1, v5}, Lcom/android/launcher2/CellLayout;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1433
    invoke-virtual {v1, v5}, Lcom/android/launcher2/CellLayout;->setChildrenDrawingCacheEnabled(Z)V

    .line 1430
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1435
    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    :cond_1
    return-void
.end method

.method public estimateItemPosition(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/ItemInfo;IIII)Landroid/graphics/Rect;
    .locals 6
    .parameter "cl"
    .parameter "pendingInfo"
    .parameter "hCell"
    .parameter "vCell"
    .parameter "hSpan"
    .parameter "vSpan"

    .prologue
    .line 388
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .local v5, r:Landroid/graphics/Rect;
    move-object v0, p1

    move v1, p3

    move v2, p4

    move v3, p5

    move v4, p6

    .line 389
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->cellToRect(IIIILandroid/graphics/Rect;)V

    .line 390
    return-object v5
.end method

.method public estimateItemSize(IILcom/android/launcher2/ItemInfo;Z)[I
    .locals 10
    .parameter "hSpan"
    .parameter "vSpan"
    .parameter "itemInfo"
    .parameter "springLoaded"

    .prologue
    const v2, 0x7fffffff

    const/4 v9, 0x1

    const/4 v3, 0x0

    .line 369
    const/4 v0, 0x2

    new-array v8, v0, [I

    .line 370
    .local v8, size:[I
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 371
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .local v1, cl:Lcom/android/launcher2/CellLayout;
    move-object v0, p0

    move-object v2, p3

    move v4, v3

    move v5, p1

    move v6, p2

    .line 372
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher2/Workspace;->estimateItemPosition(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/ItemInfo;IIII)Landroid/graphics/Rect;

    move-result-object v7

    .line 373
    .local v7, r:Landroid/graphics/Rect;
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v0

    aput v0, v8, v3

    .line 374
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v0

    aput v0, v8, v9

    .line 375
    if-eqz p4, :cond_0

    .line 376
    aget v0, v8, v3

    int-to-float v0, v0

    iget v2, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedShrinkFactor:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    aput v0, v8, v3

    .line 377
    aget v0, v8, v9

    int-to-float v0, v0

    iget v2, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedShrinkFactor:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    aput v0, v8, v9

    .line 383
    .end local v1           #cl:Lcom/android/launcher2/CellLayout;
    .end local v7           #r:Landroid/graphics/Rect;
    :cond_0
    :goto_0
    return-object v8

    .line 381
    :cond_1
    aput v2, v8, v3

    .line 382
    aput v2, v8, v9

    goto :goto_0
.end method

.method public exitWidgetResizeMode()V
    .locals 2

    .prologue
    .line 1610
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    .line 1611
    .local v0, dragLayer:Lcom/android/launcher2/DragLayer;
    invoke-virtual {v0}, Lcom/android/launcher2/DragLayer;->clearAllResizeFrames()V

    .line 1612
    return-void
.end method

.method getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutAndWidgetContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3816
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3818
    .local v0, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    .line 3819
    .local v2, screenCount:I
    const/4 v1, 0x0

    .local v1, screen:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 3820
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout;

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3819
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3822
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 3823
    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3825
    :cond_1
    return-object v0
.end method

.method public getBackgroundAlpha()F
    .locals 1

    .prologue
    .line 1232
    iget v0, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    return v0
.end method

.method getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;Z)Landroid/animation/Animator;
    .locals 1
    .parameter "state"
    .parameter "animated"

    .prologue
    .line 1633
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher2/Workspace;->getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;ZI)Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;ZI)Landroid/animation/Animator;
    .locals 29
    .parameter "state"
    .parameter "animated"
    .parameter "delay"

    .prologue
    .line 1637
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_0

    .line 1638
    const/4 v5, 0x0

    .line 1787
    :goto_0
    return-object v5

    .line 1642
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->initAnimationArrays()V

    .line 1644
    if-eqz p2, :cond_6

    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v5

    .line 1647
    .local v5, anim:Landroid/animation/AnimatorSet;
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getNextPage()I

    move-result v26

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setCurrentPage(I)V

    .line 1649
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v16, v0

    .line 1650
    .local v16, oldState:Lcom/android/launcher2/Workspace$State;
    sget-object v26, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_7

    const/16 v17, 0x1

    .line 1651
    .local v17, oldStateIsNormal:Z
    :goto_2
    sget-object v26, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_8

    const/16 v19, 0x1

    .line 1652
    .local v19, oldStateIsSpringLoaded:Z
    :goto_3
    sget-object v26, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_9

    const/16 v18, 0x1

    .line 1653
    .local v18, oldStateIsSmall:Z
    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    .line 1654
    sget-object v26, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_a

    const/16 v20, 0x1

    .line 1655
    .local v20, stateIsNormal:Z
    :goto_5
    sget-object v26, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_b

    const/16 v22, 0x1

    .line 1656
    .local v22, stateIsSpringLoaded:Z
    :goto_6
    sget-object v26, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_c

    const/16 v21, 0x1

    .line 1657
    .local v21, stateIsSmall:Z
    :goto_7
    const/high16 v12, 0x3f80

    .line 1658
    .local v12, finalScaleFactor:F
    if-eqz v22, :cond_d

    const/high16 v11, 0x3f80

    .line 1659
    .local v11, finalBackgroundAlpha:F
    :goto_8
    const/16 v23, 0x0

    .line 1660
    .local v23, translationX:F
    const/16 v24, 0x0

    .line 1661
    .local v24, translationY:F
    const/16 v25, 0x1

    .line 1663
    .local v25, zoomIn:Z
    sget-object v26, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    if-eq v0, v1, :cond_10

    .line 1664
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace;->mSpringLoadedShrinkFactor:F

    move/from16 v27, v0

    if-eqz v21, :cond_e

    const v26, 0x3dcccccd

    :goto_9
    sub-float v12, v27, v26

    .line 1665
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace;->mSpringLoadedPageSpacing:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setPageSpacing(I)V

    .line 1666
    if-eqz v17, :cond_f

    if-eqz v21, :cond_f

    .line 1667
    const/16 v25, 0x0

    .line 1668
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/android/launcher2/Workspace;->setLayoutScale(F)V

    .line 1669
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 1679
    :goto_a
    if-eqz v25, :cond_11

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f0a0002

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    .line 1682
    .local v9, duration:I
    :goto_b
    const/4 v13, 0x0

    .local v13, i:I
    :goto_c
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v26

    move/from16 v0, v26

    if-ge v13, v0, :cond_15

    .line 1683
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout;

    .line 1684
    .local v7, cl:Lcom/android/launcher2/CellLayout;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/Workspace;->mWorkspaceFadeInAdjacentScreens:Z

    move/from16 v26, v0

    if-eqz v26, :cond_1

    if-nez v22, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ne v13, v0, :cond_12

    :cond_1
    const/high16 v10, 0x3f80

    .line 1686
    .local v10, finalAlpha:F
    :goto_d
    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v8

    .line 1687
    .local v8, currentAlpha:F
    move v15, v8

    .line 1690
    .local v15, initialAlpha:F
    if-eqz v18, :cond_2

    if-nez v20, :cond_3

    :cond_2
    if-eqz v17, :cond_5

    if-eqz v21, :cond_5

    .line 1695
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-eq v13, v0, :cond_4

    if-eqz p2, :cond_4

    if-eqz v19, :cond_13

    .line 1696
    :cond_4
    const/high16 v10, 0x3f80

    .line 1703
    :cond_5
    :goto_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldAlphas:[F

    move-object/from16 v26, v0

    aput v15, v26, v13

    .line 1704
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v26, v0

    aput v10, v26, v13

    .line 1705
    if-eqz p2, :cond_14

    .line 1706
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldTranslationXs:[F

    move-object/from16 v26, v0

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getTranslationX()F

    move-result v27

    aput v27, v26, v13

    .line 1707
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldTranslationYs:[F

    move-object/from16 v26, v0

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getTranslationY()F

    move-result v27

    aput v27, v26, v13

    .line 1708
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldScaleXs:[F

    move-object/from16 v26, v0

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getScaleX()F

    move-result v27

    aput v27, v26, v13

    .line 1709
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldScaleYs:[F

    move-object/from16 v26, v0

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getScaleY()F

    move-result v27

    aput v27, v26, v13

    .line 1710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldBackgroundAlphas:[F

    move-object/from16 v26, v0

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getBackgroundAlpha()F

    move-result v27

    aput v27, v26, v13

    .line 1712
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationXs:[F

    move-object/from16 v26, v0

    aput v23, v26, v13

    .line 1713
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationYs:[F

    move-object/from16 v26, v0

    aput v24, v26, v13

    .line 1714
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleXs:[F

    move-object/from16 v26, v0

    aput v12, v26, v13

    .line 1715
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleYs:[F

    move-object/from16 v26, v0

    aput v12, v26, v13

    .line 1716
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v26, v0

    aput v11, v26, v13

    .line 1682
    :goto_f
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_c

    .line 1644
    .end local v5           #anim:Landroid/animation/AnimatorSet;
    .end local v7           #cl:Lcom/android/launcher2/CellLayout;
    .end local v8           #currentAlpha:F
    .end local v9           #duration:I
    .end local v10           #finalAlpha:F
    .end local v11           #finalBackgroundAlpha:F
    .end local v12           #finalScaleFactor:F
    .end local v13           #i:I
    .end local v15           #initialAlpha:F
    .end local v16           #oldState:Lcom/android/launcher2/Workspace$State;
    .end local v17           #oldStateIsNormal:Z
    .end local v18           #oldStateIsSmall:Z
    .end local v19           #oldStateIsSpringLoaded:Z
    .end local v20           #stateIsNormal:Z
    .end local v21           #stateIsSmall:Z
    .end local v22           #stateIsSpringLoaded:Z
    .end local v23           #translationX:F
    .end local v24           #translationY:F
    .end local v25           #zoomIn:Z
    :cond_6
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 1650
    .restart local v5       #anim:Landroid/animation/AnimatorSet;
    .restart local v16       #oldState:Lcom/android/launcher2/Workspace$State;
    :cond_7
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 1651
    .restart local v17       #oldStateIsNormal:Z
    :cond_8
    const/16 v19, 0x0

    goto/16 :goto_3

    .line 1652
    .restart local v19       #oldStateIsSpringLoaded:Z
    :cond_9
    const/16 v18, 0x0

    goto/16 :goto_4

    .line 1654
    .restart local v18       #oldStateIsSmall:Z
    :cond_a
    const/16 v20, 0x0

    goto/16 :goto_5

    .line 1655
    .restart local v20       #stateIsNormal:Z
    :cond_b
    const/16 v22, 0x0

    goto/16 :goto_6

    .line 1656
    .restart local v22       #stateIsSpringLoaded:Z
    :cond_c
    const/16 v21, 0x0

    goto/16 :goto_7

    .line 1658
    .restart local v12       #finalScaleFactor:F
    .restart local v21       #stateIsSmall:Z
    :cond_d
    const/4 v11, 0x0

    goto/16 :goto_8

    .line 1664
    .restart local v11       #finalBackgroundAlpha:F
    .restart local v23       #translationX:F
    .restart local v24       #translationY:F
    .restart local v25       #zoomIn:Z
    :cond_e
    const/16 v26, 0x0

    goto/16 :goto_9

    .line 1671
    :cond_f
    const/high16 v11, 0x3f80

    .line 1672
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/android/launcher2/Workspace;->setLayoutScale(F)V

    goto/16 :goto_a

    .line 1675
    :cond_10
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace;->mOriginalPageSpacing:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setPageSpacing(I)V

    .line 1676
    const/high16 v26, 0x3f80

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setLayoutScale(F)V

    goto/16 :goto_a

    .line 1679
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f0a0009

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    goto/16 :goto_b

    .line 1684
    .restart local v7       #cl:Lcom/android/launcher2/CellLayout;
    .restart local v9       #duration:I
    .restart local v13       #i:I
    :cond_12
    const/4 v10, 0x0

    goto/16 :goto_d

    .line 1698
    .restart local v8       #currentAlpha:F
    .restart local v10       #finalAlpha:F
    .restart local v15       #initialAlpha:F
    :cond_13
    const/4 v15, 0x0

    .line 1699
    const/4 v10, 0x0

    goto/16 :goto_e

    .line 1718
    :cond_14
    move/from16 v0, v23

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 1719
    move/from16 v0, v24

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setTranslationY(F)V

    .line 1720
    invoke-virtual {v7, v12}, Lcom/android/launcher2/CellLayout;->setScaleX(F)V

    .line 1721
    invoke-virtual {v7, v12}, Lcom/android/launcher2/CellLayout;->setScaleY(F)V

    .line 1722
    invoke-virtual {v7, v11}, Lcom/android/launcher2/CellLayout;->setBackgroundAlpha(F)V

    .line 1723
    invoke-virtual {v7, v10}, Lcom/android/launcher2/CellLayout;->setShortcutAndWidgetAlpha(F)V

    goto :goto_f

    .line 1727
    .end local v7           #cl:Lcom/android/launcher2/CellLayout;
    .end local v8           #currentAlpha:F
    .end local v10           #finalAlpha:F
    .end local v15           #initialAlpha:F
    :cond_15
    if-eqz p2, :cond_1c

    .line 1728
    const/4 v14, 0x0

    .local v14, index:I
    :goto_10
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v26

    move/from16 v0, v26

    if-ge v14, v0, :cond_1b

    .line 1729
    move v13, v14

    .line 1730
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout;

    .line 1731
    .restart local v7       #cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v8

    .line 1732
    .restart local v8       #currentAlpha:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    const/16 v27, 0x0

    cmpl-float v26, v26, v27

    if-nez v26, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    const/16 v27, 0x0

    cmpl-float v26, v26, v27

    if-nez v26, :cond_17

    .line 1733
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationXs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 1734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationYs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setTranslationY(F)V

    .line 1735
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleXs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setScaleX(F)V

    .line 1736
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleYs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setScaleY(F)V

    .line 1737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setBackgroundAlpha(F)V

    .line 1738
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 1739
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewRotationYs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 1728
    :cond_16
    :goto_11
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_10

    .line 1741
    :cond_17
    new-instance v3, Lcom/android/launcher2/LauncherViewPropertyAnimator;

    invoke-direct {v3, v7}, Lcom/android/launcher2/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 1742
    .local v3, a:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationXs:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v3, v0}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->translationX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewTranslationYs:[F

    move-object/from16 v27, v0

    aget v27, v27, v13

    invoke-virtual/range {v26 .. v27}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->translationY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleXs:[F

    move-object/from16 v27, v0

    aget v27, v27, v13

    invoke-virtual/range {v26 .. v27}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewScaleYs:[F

    move-object/from16 v27, v0

    aget v27, v27, v13

    invoke-virtual/range {v26 .. v27}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v26

    int-to-long v0, v9

    move-wide/from16 v27, v0

    invoke-virtual/range {v26 .. v28}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mZoomInInterpolator:Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1748
    invoke-virtual {v5, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 1750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v27, v0

    aget v27, v27, v13

    cmpl-float v26, v26, v27

    if-nez v26, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    cmpl-float v26, v8, v26

    if-eqz v26, :cond_19

    .line 1751
    :cond_18
    new-instance v4, Lcom/android/launcher2/LauncherViewPropertyAnimator;

    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-direct {v4, v0}, Lcom/android/launcher2/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 1753
    .local v4, alphaAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->alpha(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v26

    int-to-long v0, v9

    move-wide/from16 v27, v0

    invoke-virtual/range {v26 .. v28}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mZoomInInterpolator:Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1756
    invoke-virtual {v5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 1758
    .end local v4           #alphaAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mOldBackgroundAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    const/16 v27, 0x0

    cmpl-float v26, v26, v27

    if-nez v26, :cond_1a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v26, v0

    aget v26, v26, v13

    const/16 v27, 0x0

    cmpl-float v26, v26, v27

    if-eqz v26, :cond_16

    .line 1760
    :cond_1a
    const/16 v26, 0x2

    move/from16 v0, v26

    new-array v0, v0, [F

    move-object/from16 v26, v0

    fill-array-data v26, :array_0

    invoke-static/range {v26 .. v26}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v26

    int-to-long v0, v9

    move-wide/from16 v27, v0

    invoke-virtual/range {v26 .. v28}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v6

    .line 1761
    .local v6, bgAnim:Landroid/animation/ValueAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mZoomInInterpolator:Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1762
    new-instance v26, Lcom/android/launcher2/Workspace$4;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7, v13}, Lcom/android/launcher2/Workspace$4;-><init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/CellLayout;I)V

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1769
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    goto/16 :goto_11

    .line 1773
    .end local v3           #a:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .end local v6           #bgAnim:Landroid/animation/ValueAnimator;
    .end local v7           #cl:Lcom/android/launcher2/CellLayout;
    .end local v8           #currentAlpha:F
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->buildPageHardwareLayers()V

    .line 1774
    move/from16 v0, p3

    int-to-long v0, v0

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    invoke-virtual {v5, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 1777
    .end local v14           #index:I
    :cond_1c
    if-eqz v22, :cond_1d

    .line 1781
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const v27, 0x7f0a0001

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v26

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    const/high16 v27, 0x42c8

    div-float v26, v26, v27

    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace;->animateBackgroundGradient(FZ)V

    goto/16 :goto_0

    .line 1785
    :cond_1d
    const/16 v26, 0x0

    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace;->animateBackgroundGradient(FZ)V

    goto/16 :goto_0

    .line 1760
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public getChildrenOutlineAlpha()F
    .locals 1

    .prologue
    .line 1186
    iget v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineAlpha:F

    return v0
.end method

.method public getContent()Landroid/view/View;
    .locals 0

    .prologue
    .line 1824
    return-object p0
.end method

.method public getCurrentDropLayout()Lcom/android/launcher2/CellLayout;
    .locals 1

    .prologue
    .line 3543
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getNextPage()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    return-object v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 5

    .prologue
    .line 4073
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    .line 4074
    .local v0, page:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d0056

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    add-int/lit8 v4, v0, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 4073
    .end local v0           #page:I
    :cond_0
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    goto :goto_0
.end method

.method public getDescendantFocusability()I
    .locals 1

    .prologue
    .line 1396
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1397
    const/high16 v0, 0x6

    .line 1399
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->getDescendantFocusability()I

    move-result v0

    goto :goto_0
.end method

.method public getDragInfo()Lcom/android/launcher2/CellLayout$CellInfo;
    .locals 1

    .prologue
    .line 3553
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    return-object v0
.end method

.method public getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;
    .locals 1
    .parameter "d"

    .prologue
    .line 2736
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFolderForTag(Ljava/lang/Object;)Lcom/android/launcher2/Folder;
    .locals 8
    .parameter "tag"

    .prologue
    .line 3829
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 3831
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 3832
    .local v6, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v6}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 3833
    .local v2, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 3834
    invoke-virtual {v6, v4}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 3835
    .local v0, child:Landroid/view/View;
    instance-of v7, v0, Lcom/android/launcher2/Folder;

    if-eqz v7, :cond_1

    move-object v3, v0

    .line 3836
    check-cast v3, Lcom/android/launcher2/Folder;

    .line 3837
    .local v3, f:Lcom/android/launcher2/Folder;
    invoke-virtual {v3}, Lcom/android/launcher2/Folder;->getInfo()Lcom/android/launcher2/FolderInfo;

    move-result-object v7

    if-ne v7, p1, :cond_1

    invoke-virtual {v3}, Lcom/android/launcher2/Folder;->getInfo()Lcom/android/launcher2/FolderInfo;

    move-result-object v7

    iget-boolean v7, v7, Lcom/android/launcher2/FolderInfo;->opened:Z

    if-eqz v7, :cond_1

    .line 3843
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #f:Lcom/android/launcher2/Folder;
    .end local v4           #i:I
    .end local v6           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :goto_1
    return-object v3

    .line 3833
    .restart local v0       #child:Landroid/view/View;
    .restart local v2       #count:I
    .restart local v4       #i:I
    .restart local v6       #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 3843
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v4           #i:I
    .end local v6           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getHitRect(Landroid/graphics/Rect;)V
    .locals 3
    .parameter "outRect"

    .prologue
    const/4 v2, 0x0

    .line 3175
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 3176
    return-void
.end method

.method public getLocationInDragLayer([I)V
    .locals 1
    .parameter "loc"

    .prologue
    .line 4079
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 4080
    return-void
.end method

.method getOpenFolder()Lcom/android/launcher2/Folder;
    .locals 6

    .prologue
    .line 482
    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v2

    .line 483
    .local v2, dragLayer:Lcom/android/launcher2/DragLayer;
    invoke-virtual {v2}, Lcom/android/launcher2/DragLayer;->getChildCount()I

    move-result v1

    .line 484
    .local v1, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v1, :cond_1

    .line 485
    invoke-virtual {v2, v4}, Lcom/android/launcher2/DragLayer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 486
    .local v0, child:Landroid/view/View;
    instance-of v5, v0, Lcom/android/launcher2/Folder;

    if-eqz v5, :cond_0

    move-object v3, v0

    .line 487
    check-cast v3, Lcom/android/launcher2/Folder;

    .line 488
    .local v3, folder:Lcom/android/launcher2/Folder;
    invoke-virtual {v3}, Lcom/android/launcher2/Folder;->getInfo()Lcom/android/launcher2/FolderInfo;

    move-result-object v5

    iget-boolean v5, v5, Lcom/android/launcher2/FolderInfo;->opened:Z

    if-eqz v5, :cond_0

    .line 492
    .end local v0           #child:Landroid/view/View;
    .end local v3           #folder:Lcom/android/launcher2/Folder;
    :goto_1
    return-object v3

    .line 484
    .restart local v0       #child:Landroid/view/View;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 492
    .end local v0           #child:Landroid/view/View;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;
    .locals 5
    .parameter "v"

    .prologue
    .line 3786
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;

    move-result-object v2

    .line 3787
    .local v2, layouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/CellLayout;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 3788
    .local v1, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    .line 3792
    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getScrollMode()I
    .locals 1

    .prologue
    .line 452
    const/4 v0, 0x1

    return v0
.end method

.method public getViewForTag(Ljava/lang/Object;)Landroid/view/View;
    .locals 7
    .parameter "tag"

    .prologue
    .line 3847
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 3849
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 3850
    .local v5, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v5}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 3851
    .local v2, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 3852
    invoke-virtual {v5, v3}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 3853
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-ne v6, p1, :cond_1

    .line 3858
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #i:I
    .end local v5           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :goto_1
    return-object v0

    .line 3851
    .restart local v0       #child:Landroid/view/View;
    .restart local v2       #count:I
    .restart local v3       #i:I
    .restart local v5       #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3858
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #i:I
    .end local v5           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getViewLocationRelativeToSelf(Landroid/view/View;[I)V
    .locals 7
    .parameter "v"
    .parameter "location"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2541
    invoke-virtual {p0, p2}, Lcom/android/launcher2/Workspace;->getLocationInWindow([I)V

    .line 2542
    aget v2, p2, v5

    .line 2543
    .local v2, x:I
    aget v3, p2, v6

    .line 2545
    .local v3, y:I
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 2546
    aget v0, p2, v5

    .line 2547
    .local v0, vX:I
    aget v1, p2, v6

    .line 2549
    .local v1, vY:I
    sub-int v4, v0, v2

    aput v4, p2, v5

    .line 2550
    sub-int v4, v1, v3

    aput v4, p2, v6

    .line 2551
    return-void
.end method

.method getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/CellLayout;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3799
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3800
    .local v0, layouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/CellLayout;>;"
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    .line 3801
    .local v2, screenCount:I
    const/4 v1, 0x0

    .local v1, screen:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 3802
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3801
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3804
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 3805
    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3807
    :cond_1
    return-object v0
.end method

.method hideOutlines()V
    .locals 4

    .prologue
    .line 1161
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v0, :cond_2

    .line 1162
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1163
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1164
    :cond_1
    const-string v0, "childrenOutlineAlpha"

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    .line 1165
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x177

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1166
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 1167
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1169
    :cond_2
    return-void
.end method

.method protected hitsNextPage(FF)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 651
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 655
    .local v0, current:I
    :goto_0
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_1

    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1, p1, p2}, Lcom/android/launcher2/Workspace;->hitsPage(IFF)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 651
    .end local v0           #current:I
    :cond_0
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    goto :goto_0

    .line 655
    .restart local v0       #current:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected hitsPreviousPage(FF)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 640
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 644
    .local v0, current:I
    :goto_0
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_1

    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1, p1, p2}, Lcom/android/launcher2/Workspace;->hitsPage(IFF)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 640
    .end local v0           #current:I
    :cond_0
    iget v0, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    goto :goto_0

    .line 644
    .restart local v0       #current:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected initWorkspace()V
    .locals 7

    .prologue
    .line 425
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 426
    .local v1, context:Landroid/content/Context;
    iget v4, p0, Lcom/android/launcher2/Workspace;->mDefaultPage:I

    iput v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    .line 427
    iget v4, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-static {v4}, Lcom/android/launcher2/Launcher;->setScreen(I)V

    .line 428
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherApplication;

    .line 429
    .local v0, app:Lcom/android/launcher2/LauncherApplication;
    invoke-virtual {v0}, Lcom/android/launcher2/LauncherApplication;->getIconCache()Lcom/android/launcher2/IconCache;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher2/Workspace;->mIconCache:Lcom/android/launcher2/IconCache;

    .line 430
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->setWillNotDraw(Z)V

    .line 431
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 433
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 435
    .local v3, res:Landroid/content/res/Resources;
    const v4, 0x7f020001

    :try_start_0
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    :goto_0
    new-instance v4, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-direct {v4, p0}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;-><init>(Lcom/android/launcher2/Workspace;)V

    iput-object v4, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    .line 441
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 442
    .local v2, display:Landroid/view/Display;
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    invoke-virtual {v2, v4}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 443
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    iget-object v6, p0, Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    invoke-direct {p0, v5, v6}, Lcom/android/launcher2/Workspace;->wallpaperTravelToScreenWidthRatio(II)F

    move-result v5

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/android/launcher2/Workspace;->mWallpaperTravelWidth:I

    .line 446
    const v4, 0x3f0ccccd

    const v5, 0x7f0b0022

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iput v4, p0, Lcom/android/launcher2/Workspace;->mMaxDistanceForFolderCreation:F

    .line 447
    const/high16 v4, 0x43fa

    iget v5, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/android/launcher2/PagedView;->mFlingThresholdVelocity:I

    .line 448
    return-void

    .line 436
    .end local v2           #display:Landroid/view/Display;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method isDrawingBackgroundGradient()Z
    .locals 2

    .prologue
    .line 1378
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mDrawBackground:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDropEnabled()Z
    .locals 1

    .prologue
    .line 3658
    const/4 v0, 0x1

    return v0
.end method

.method public isFinishedSwitchingState()Z
    .locals 2

    .prologue
    .line 679
    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/Workspace;->mTransitionProgress:F

    const/high16 v1, 0x3f00

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSmall()Z
    .locals 2

    .prologue
    .line 1415
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v1, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v1, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSupportCycleSlidingScreen()Z
    .locals 1

    .prologue
    .line 4255
    const/4 v0, 0x1

    return v0
.end method

.method public isSwitchingState()Z
    .locals 1

    .prologue
    .line 673
    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    return v0
.end method

.method isTouchActive()Z
    .locals 1

    .prologue
    .line 496
    iget v0, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method mapPointFromChildToSelf(Landroid/view/View;[F)V
    .locals 5
    .parameter "v"
    .parameter "xy"

    .prologue
    .line 2787
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 2788
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v0

    .line 2789
    .local v0, scrollX:I
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 2790
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 2792
    :cond_0
    const/4 v1, 0x0

    aget v2, p2, v1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int v3, v0, v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 2793
    const/4 v1, 0x1

    aget v2, p2, v1

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollY()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 2794
    return-void
.end method

.method mapPointFromSelfToChild(Landroid/view/View;[F)V
    .locals 1
    .parameter "v"
    .parameter "xy"

    .prologue
    .line 2746
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 2747
    return-void
.end method

.method mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V
    .locals 5
    .parameter "v"
    .parameter "xy"
    .parameter "cachedInverseMatrix"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2760
    if-nez p3, :cond_0

    .line 2761
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 2762
    iget-object p3, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 2764
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v0

    .line 2765
    .local v0, scrollX:I
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 2766
    iget-object v1, p0, Lcom/android/launcher2/PagedView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 2768
    :cond_1
    aget v1, p2, v3

    int-to-float v2, v0

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v3

    .line 2769
    aget v1, p2, v4

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollY()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v4

    .line 2770
    invoke-virtual {p3, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 2771
    return-void
.end method

.method mapPointFromSelfToHotseatLayout(Lcom/android/launcher2/Hotseat;[F)V
    .locals 4
    .parameter "hotseat"
    .parameter "xy"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2774
    invoke-virtual {p1}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 2775
    aget v0, p2, v2

    invoke-virtual {p1}, Lcom/android/launcher2/Hotseat;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    aput v0, p2, v2

    .line 2776
    aget v0, p2, v3

    invoke-virtual {p1}, Lcom/android/launcher2/Hotseat;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    aput v0, p2, v3

    .line 2777
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 2778
    return-void
.end method

.method moveToDefaultScreen(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 4053
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4054
    if-eqz p1, :cond_1

    .line 4055
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDefaultPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    .line 4060
    :cond_0
    :goto_0
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDefaultPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4061
    return-void

    .line 4057
    :cond_1
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDefaultPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentPage(I)V

    goto :goto_0
.end method

.method protected notifyPageSwitchListener()V
    .locals 1

    .prologue
    .line 851
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->notifyPageSwitchListener()V

    .line 852
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-static {v0}, Lcom/android/launcher2/Launcher;->setScreen(I)V

    .line 853
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .prologue
    .line 1329
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->onAttachedToWindow()V

    .line 1330
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    .line 1332
    const-string v0, "Workspace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAttachedToWindow: mWindowToken = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1334
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->computeScroll()V

    .line 1335
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->setWindowToken(Landroid/os/IBinder;)V

    .line 1336
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 6
    .parameter "parent"
    .parameter "child"

    .prologue
    const/4 v3, 0x1

    .line 457
    instance-of v1, p2, Lcom/android/launcher2/CellLayout;

    if-nez v1, :cond_0

    .line 458
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "A Workspace can only have CellLayout children."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    move-object v0, p2

    .line 460
    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 461
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0, p0}, Lcom/android/launcher2/CellLayout;->setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 462
    invoke-virtual {v0, v3}, Lcom/android/launcher2/CellLayout;->setClickable(Z)V

    .line 463
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d0054

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 465
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 469
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    .line 1340
    const-string v0, "Workspace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDetachedFromWindow: mWindowToken = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1342
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mWindowToken:Landroid/os/IBinder;

    .line 1343
    return-void
.end method

.method public onDragEnd()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 412
    iput-boolean v1, p0, Lcom/android/launcher2/Workspace;->mIsDragOccuring:Z

    .line 413
    invoke-direct {p0, v1}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 414
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Launcher;->unlockScreenOrientation(Z)V

    .line 417
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/launcher2/InstallShortcutReceiver;->disableAndFlushInstallQueue(Landroid/content/Context;)V

    .line 418
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/launcher2/UninstallShortcutReceiver;->disableAndFlushUninstallQueue(Landroid/content/Context;)V

    .line 419
    return-void
.end method

.method public onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, 0x0

    .line 2559
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    invoke-virtual {v1}, Lcom/android/launcher2/DropTarget$DragEnforcer;->onDragEnter()V

    .line 2560
    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    .line 2561
    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 2563
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    .line 2564
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getCurrentDropLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    .line 2565
    .local v0, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2566
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2570
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2571
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->showOutlines()V

    .line 2573
    :cond_0
    return-void
.end method

.method public onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 4
    .parameter "d"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 2618
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    invoke-virtual {v0}, Lcom/android/launcher2/DropTarget$DragEnforcer;->onDragExit()V

    .line 2622
    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    if-eqz v0, :cond_3

    .line 2623
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isPageMoving()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2626
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getNextPage()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    .line 2634
    :goto_0
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-ne v0, v2, :cond_4

    .line 2635
    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    .line 2641
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->onResetScrollArea()V

    .line 2647
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2648
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2650
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedDragController:Lcom/android/launcher2/SpringLoadedDragController;

    invoke-virtual {v0}, Lcom/android/launcher2/SpringLoadedDragController;->cancel()V

    .line 2652
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    if-nez v0, :cond_1

    .line 2653
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->hideOutlines()V

    .line 2655
    :cond_1
    return-void

    .line 2628
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    goto :goto_0

    .line 2631
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    goto :goto_0

    .line 2636
    :cond_4
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 2637
    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mAddToExistingFolderOnDrop:Z

    goto :goto_1
.end method

.method public onDragOver(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 30
    .parameter "d"

    .prologue
    .line 2952
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    if-ne v2, v3, :cond_1

    .line 3067
    :cond_0
    :goto_0
    return-void

    .line 2954
    :cond_1
    new-instance v29, Landroid/graphics/Rect;

    invoke-direct/range {v29 .. v29}, Landroid/graphics/Rect;-><init>()V

    .line 2955
    .local v29, r:Landroid/graphics/Rect;
    const/16 v27, 0x0

    .line 2956
    .local v27, layout:Lcom/android/launcher2/CellLayout;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Lcom/android/launcher2/ItemInfo;

    .line 2959
    .local v26, item:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v26

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    if-ltz v2, :cond_2

    move-object/from16 v0, v26

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    if-gez v2, :cond_3

    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Improper spans found"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2960
    :cond_3
    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    .line 2963
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-nez v2, :cond_a

    const/4 v13, 0x0

    .line 2965
    .local v13, child:Landroid/view/View;
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 2966
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-direct/range {p0 .. p1}, Lcom/android/launcher2/Workspace;->isExternalDragWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2967
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 2968
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2969
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v27

    .line 2972
    :cond_4
    if-nez v27, :cond_5

    .line 2973
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    int-to-float v3, v3

    move-object/from16 v0, p1

    iget v4, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    int-to-float v4, v4

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/android/launcher2/Workspace;->findMatchingPageForDragOver(Lcom/android/launcher2/DragView;FFZ)Lcom/android/launcher2/CellLayout;

    move-result-object v27

    .line 2975
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, v27

    if-eq v0, v2, :cond_6

    .line 2977
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2978
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 2980
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    if-ne v2, v3, :cond_b

    const/16 v25, 0x1

    .line 2981
    .local v25, isInSpringLoadedMode:Z
    :goto_2
    if-eqz v25, :cond_6

    .line 2982
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 2983
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mSpringLoadedDragController:Lcom/android/launcher2/SpringLoadedDragController;

    invoke-virtual {v2}, Lcom/android/launcher2/SpringLoadedDragController;->cancel()V

    .line 3007
    .end local v25           #isInSpringLoadedMode:Z
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v2, :cond_0

    .line 3009
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 3010
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/android/launcher2/Hotseat;[F)V

    .line 3015
    :goto_4
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/launcher2/ItemInfo;

    .line 3017
    .local v24, info:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v3, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v2, v2, v4

    float-to-int v4, v2

    move-object/from16 v0, v26

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 3021
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/android/launcher2/Workspace;->setCurrentDropOverCell(II)V

    .line 3023
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v5, 0x1

    aget v4, v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher2/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v6

    .line 3026
    .local v6, targetCellDistance:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v7

    .line 3029
    .local v7, dragOverView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v3, v24

    invoke-direct/range {v2 .. v7}, Lcom/android/launcher2/Workspace;->manageFolderFeedback(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFLandroid/view/View;)V

    .line 3032
    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v17, v0

    .line 3033
    .local v17, minSpanX:I
    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v18, v0

    .line 3034
    .local v18, minSpanY:I
    move-object/from16 v0, v26

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    if-lez v2, :cond_7

    move-object/from16 v0, v26

    iget v2, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    if-lez v2, :cond_7

    .line 3035
    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    move/from16 v17, v0

    .line 3036
    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    move/from16 v18, v0

    .line 3039
    :cond_7
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v9, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v10, v2

    move-object/from16 v0, v26

    iget v11, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move-object/from16 v0, v26

    iget v12, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    invoke-virtual/range {v8 .. v14}, Lcom/android/launcher2/CellLayout;->isNearestDropLocationOccupied(IIIILandroid/view/View;[I)Z

    move-result v28

    .line 3043
    .local v28, nearestDropOccupied:Z
    if-nez v28, :cond_11

    .line 3044
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v15, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v0, v2

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v17, v2, v3

    .end local v17           #minSpanX:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v18, v2, v3

    .end local v18           #minSpanY:I
    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v19, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v2}, Lcom/android/launcher2/DragView;->getDragVisualizeOffset()Landroid/graphics/Point;

    move-result-object v22

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v2}, Lcom/android/launcher2/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v23

    invoke-virtual/range {v12 .. v23}, Lcom/android/launcher2/CellLayout;->visualizeDropLocation(Landroid/view/View;Landroid/graphics/Bitmap;IIIIIIZLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 3060
    :cond_8
    :goto_5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mDragMode:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mDragMode:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_9

    if-nez v28, :cond_0

    .line 3062
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v2, :cond_0

    .line 3063
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->revertTempState()V

    goto/16 :goto_0

    .line 2963
    .end local v6           #targetCellDistance:F
    .end local v7           #dragOverView:Landroid/view/View;
    .end local v13           #child:Landroid/view/View;
    .end local v24           #info:Lcom/android/launcher2/ItemInfo;
    .end local v28           #nearestDropOccupied:Z
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v13, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    goto/16 :goto_1

    .line 2980
    .restart local v13       #child:Landroid/view/View;
    :cond_b
    const/16 v25, 0x0

    goto/16 :goto_2

    .line 2985
    .restart local v25       #isInSpringLoadedMode:Z
    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mSpringLoadedDragController:Lcom/android/launcher2/SpringLoadedDragController;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/SpringLoadedDragController;->setAlarm(Lcom/android/launcher2/CellLayout;)V

    goto/16 :goto_3

    .line 2991
    .end local v25           #isInSpringLoadedMode:Z
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    if-eqz v2, :cond_e

    invoke-direct/range {p0 .. p1}, Lcom/android/launcher2/Workspace;->isDragWidget(Lcom/android/launcher2/DropTarget$DragObject;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 2992
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Lcom/android/launcher2/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 2993
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 2994
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v27

    .line 2997
    :cond_e
    if-nez v27, :cond_f

    .line 2998
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getCurrentDropLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v27

    .line 3000
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, v27

    if-eq v0, v2, :cond_6

    .line 3001
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3002
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    goto/16 :goto_3

    .line 3012
    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto/16 :goto_4

    .line 3048
    .restart local v6       #targetCellDistance:F
    .restart local v7       #dragOverView:Landroid/view/View;
    .restart local v17       #minSpanX:I
    .restart local v18       #minSpanY:I
    .restart local v24       #info:Lcom/android/launcher2/ItemInfo;
    .restart local v28       #nearestDropOccupied:Z
    :cond_11
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-eqz v2, :cond_12

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mDragMode:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_8

    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v2}, Lcom/android/launcher2/Alarm;->alarmPending()Z

    move-result v2

    if-nez v2, :cond_8

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mLastReorderX:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    if-ne v2, v3, :cond_13

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/Workspace;->mLastReorderY:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    if-eq v2, v3, :cond_8

    .line 3054
    :cond_13
    new-instance v14, Lcom/android/launcher2/Workspace$ReorderAlarmListener;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v16, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v19, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v21, v0

    move-object/from16 v15, p0

    move-object/from16 v22, v13

    invoke-direct/range {v14 .. v22}, Lcom/android/launcher2/Workspace$ReorderAlarmListener;-><init>(Lcom/android/launcher2/Workspace;[FIIIILcom/android/launcher2/DragView;Landroid/view/View;)V

    .line 3056
    .local v14, listener:Lcom/android/launcher2/Workspace$ReorderAlarmListener;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v2, v14}, Lcom/android/launcher2/Alarm;->setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V

    .line 3057
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Workspace;->mReorderAlarm:Lcom/android/launcher2/Alarm;

    const-wide/16 v3, 0xfa

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/Alarm;->setAlarm(J)V

    goto/16 :goto_5
.end method

.method public onDragStart(Lcom/android/launcher2/DragSource;Ljava/lang/Object;I)V
    .locals 1
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsDragOccuring:Z

    .line 399
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 400
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->lockScreenOrientation()V

    .line 401
    const/high16 v0, 0x3f80

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->setChildrenBackgroundAlphaMultipliers(F)V

    .line 403
    invoke-static {}, Lcom/android/launcher2/InstallShortcutReceiver;->enableInstallQueue()V

    .line 404
    invoke-static {}, Lcom/android/launcher2/UninstallShortcutReceiver;->enableUninstallQueue()V

    .line 405
    return-void
.end method

.method public onDragStartedWithItem(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 1593
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 1596
    .local v0, canvas:Landroid/graphics/Canvas;
    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher2/Workspace;->createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 1597
    return-void
.end method

.method public onDragStartedWithItem(Lcom/android/launcher2/PendingAddItemInfo;Landroid/graphics/Bitmap;Z)V
    .locals 8
    .parameter "info"
    .parameter "b"
    .parameter "clipAlpha"

    .prologue
    const/4 v4, 0x0

    .line 1600
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2}, Landroid/graphics/Canvas;-><init>()V

    .line 1602
    .local v2, canvas:Landroid/graphics/Canvas;
    iget v0, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v1, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {p0, v0, v1, p1, v4}, Lcom/android/launcher2/Workspace;->estimateItemSize(IILcom/android/launcher2/ItemInfo;Z)[I

    move-result-object v7

    .line 1605
    .local v7, size:[I
    const/4 v3, 0x2

    aget v4, v7, v4

    const/4 v0, 0x1

    aget v5, v7, v0

    move-object v0, p0

    move-object v1, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/Workspace;->createDragOutline(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;IIIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 1607
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .parameter "canvas"

    .prologue
    .line 1360
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->updateWallpaperOffsets()V

    .line 1363
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/launcher2/Workspace;->mDrawBackground:Z

    if-eqz v1, :cond_0

    .line 1364
    iget v1, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    const/high16 v2, 0x437f

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 1365
    .local v0, alpha:I
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1366
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getMeasuredWidth()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getMeasuredHeight()I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1368
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1371
    .end local v0           #alpha:I
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->onDraw(Landroid/graphics/Canvas;)V

    .line 1374
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mBindPages:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 1375
    return-void
.end method

.method public onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 65
    .parameter "d"

    .prologue
    .line 2309
    move-object/from16 v0, p1

    iget v6, v0, Lcom/android/launcher2/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v7, v0, Lcom/android/launcher2/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v8, v0, Lcom/android/launcher2/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v9, v0, Lcom/android/launcher2/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v11}, Lcom/android/launcher2/Workspace;->getDragViewVisualCenter(IIIILcom/android/launcher2/DragView;[F)[F

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    .line 2312
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Workspace;->mDropToLayout:Lcom/android/launcher2/CellLayout;

    .line 2315
    .local v8, dropTargetLayout:Lcom/android/launcher2/CellLayout;
    if-eqz v8, :cond_0

    .line 2316
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5, v8}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2317
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v7}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/android/launcher2/Hotseat;[F)V

    .line 2329
    :cond_0
    :goto_0
    const/16 v64, -0x1

    .line 2330
    .local v64, snapScreen:I
    const/16 v62, 0x0

    .line 2331
    .local v62, resizeOnDrop:Z
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragSource:Lcom/android/launcher2/DragSource;

    move-object/from16 v0, p0

    if-eq v5, v0, :cond_3

    .line 2332
    const/4 v5, 0x2

    new-array v6, v5, [I

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v9, 0x0

    aget v7, v7, v9

    float-to-int v7, v7

    aput v7, v6, v5

    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v9, 0x1

    aget v7, v7, v9

    float-to-int v7, v7

    aput v7, v6, v5

    .line 2334
    .local v6, touchXY:[I
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v5, p0

    move-object/from16 v10, p1

    invoke-direct/range {v5 .. v10}, Lcom/android/launcher2/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/android/launcher2/CellLayout;ZLcom/android/launcher2/DropTarget$DragObject;)V

    .line 2516
    .end local v6           #touchXY:[I
    :cond_1
    :goto_1
    return-void

    .line 2319
    .end local v62           #resizeOnDrop:Z
    .end local v64           #snapScreen:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v5, v7}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto :goto_0

    .line 2335
    .restart local v62       #resizeOnDrop:Z
    .restart local v64       #snapScreen:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v5, :cond_1

    .line 2336
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v28, v0

    .line 2338
    .local v28, cell:Landroid/view/View;
    const/16 v63, 0x0

    .line 2339
    .local v63, resizeRunnable:Ljava/lang/Runnable;
    if-eqz v8, :cond_b

    .line 2341
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v5

    if-eq v5, v8, :cond_c

    const/16 v55, 0x1

    .line 2342
    .local v55, hasMovedLayouts:Z
    :goto_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5, v8}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v54

    .line 2343
    .local v54, hasMovedIntoHotseat:Z
    if-eqz v54, :cond_d

    const-wide/16 v16, -0x65

    .line 2346
    .local v16, container:J
    :goto_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v5, v5, v7

    if-gez v5, :cond_e

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    move/from16 v35, v0

    .line 2348
    .local v35, screen:I
    :goto_4
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v5, :cond_f

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v12, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    .line 2349
    .local v12, spanX:I
    :goto_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v5, :cond_10

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v13, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    .line 2353
    .local v13, spanY:I
    :goto_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x0

    aget v5, v5, v7

    float-to-int v10, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x1

    aget v5, v5, v7

    float-to-int v11, v5

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v9, p0

    move-object v14, v8

    invoke-direct/range {v9 .. v15}, Lcom/android/launcher2/Workspace;->findNearestArea(IIIILcom/android/launcher2/CellLayout;[I)[I

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 2355
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x0

    aget v5, v5, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v9, 0x1

    aget v7, v7, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    invoke-virtual {v8, v5, v7, v9}, Lcom/android/launcher2/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v20

    .line 2365
    .local v20, distance:F
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    if-nez v5, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v19, v0

    const/16 v21, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v14, p0

    move-object/from16 v15, v28

    move-object/from16 v18, v8

    invoke-virtual/range {v14 .. v23}, Lcom/android/launcher2/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/android/launcher2/CellLayout;[IFZLcom/android/launcher2/DragView;Ljava/lang/Runnable;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2370
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v24, v0

    const/16 v27, 0x0

    move-object/from16 v21, p0

    move-object/from16 v22, v28

    move-object/from16 v23, v8

    move/from16 v25, v20

    move-object/from16 v26, p1

    invoke-virtual/range {v21 .. v27}, Lcom/android/launcher2/Workspace;->addToExistingFolderIfNecessary(Landroid/view/View;Lcom/android/launcher2/CellLayout;[IFLcom/android/launcher2/DropTarget$DragObject;Z)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2377
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v58, v0

    check-cast v58, Lcom/android/launcher2/ItemInfo;

    .line 2378
    .local v58, item:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v58

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v24, v0

    .line 2379
    .local v24, minSpanX:I
    move-object/from16 v0, v58

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v25, v0

    .line 2380
    .local v25, minSpanY:I
    move-object/from16 v0, v58

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    if-lez v5, :cond_5

    move-object/from16 v0, v58

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    if-lez v5, :cond_5

    .line 2381
    move-object/from16 v0, v58

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    move/from16 v24, v0

    .line 2382
    move-object/from16 v0, v58

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    move/from16 v25, v0

    .line 2385
    :cond_5
    const/4 v5, 0x2

    new-array v0, v5, [I

    move-object/from16 v30, v0

    .line 2386
    .local v30, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x0

    aget v5, v5, v7

    float-to-int v0, v5

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragViewVisualCenter:[F

    const/4 v7, 0x1

    aget v5, v5, v7

    float-to-int v0, v5

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    move-object/from16 v29, v0

    const/16 v31, 0x1

    move-object/from16 v21, v8

    move/from16 v26, v12

    move/from16 v27, v13

    invoke-virtual/range {v21 .. v31}, Lcom/android/launcher2/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    .line 2390
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v5, v5, v7

    if-ltz v5, :cond_11

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v5, v5, v7

    if-ltz v5, :cond_11

    const/16 v53, 0x1

    .line 2393
    .local v53, foundCell:Z
    :goto_7
    if-eqz v53, :cond_7

    move-object/from16 v0, v28

    instance-of v5, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v5, :cond_7

    const/4 v5, 0x0

    aget v5, v30, v5

    move-object/from16 v0, v58

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    if-ne v5, v7, :cond_6

    const/4 v5, 0x1

    aget v5, v30, v5

    move-object/from16 v0, v58

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    if-eq v5, v7, :cond_7

    .line 2395
    :cond_6
    const/16 v62, 0x1

    .line 2396
    const/4 v5, 0x0

    aget v5, v30, v5

    move-object/from16 v0, v58

    iput v5, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 2397
    const/4 v5, 0x1

    aget v5, v30, v5

    move-object/from16 v0, v58

    iput v5, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v49, v28

    .line 2398
    check-cast v49, Landroid/appwidget/AppWidgetHostView;

    .line 2399
    .local v49, awhv:Landroid/appwidget/AppWidgetHostView;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    const/4 v7, 0x0

    aget v7, v30, v7

    const/4 v9, 0x1

    aget v9, v30, v9

    move-object/from16 v0, v49

    invoke-static {v0, v5, v7, v9}, Lcom/android/launcher2/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/android/launcher2/Launcher;II)V

    .line 2403
    .end local v49           #awhv:Landroid/appwidget/AppWidgetHostView;
    :cond_7
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    move/from16 v0, v35

    if-eq v5, v0, :cond_8

    if-nez v54, :cond_8

    .line 2404
    move/from16 v64, v35

    .line 2405
    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    .line 2408
    :cond_8
    if-eqz v53, :cond_13

    .line 2409
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v57

    check-cast v57, Lcom/android/launcher2/ItemInfo;

    .line 2410
    .local v57, info:Lcom/android/launcher2/ItemInfo;
    if-eqz v55, :cond_9

    .line 2412
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v5

    move-object/from16 v0, v28

    invoke-virtual {v5, v0}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 2413
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v36, v5, v7

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v37, v5, v7

    move-object/from16 v0, v57

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v38, v0

    move-object/from16 v0, v57

    iget v0, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v39, v0

    move-object/from16 v31, p0

    move-object/from16 v32, v28

    move-wide/from16 v33, v16

    invoke-virtual/range {v31 .. v39}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIII)V

    .line 2418
    :cond_9
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v60

    check-cast v60, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2419
    .local v60, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v5, v5, v7

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 2420
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v5, v5, v7

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 2421
    move-object/from16 v0, v58

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 2422
    move-object/from16 v0, v58

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->spanY:I

    move-object/from16 v0, v60

    iput v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 2423
    const/4 v5, 0x1

    move-object/from16 v0, v60

    iput-boolean v5, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 2426
    const/16 v51, -0x1

    .line 2427
    .local v51, childId:I
    move-object/from16 v0, v28

    instance-of v5, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v5, :cond_12

    const-wide/16 v9, -0x64

    cmp-long v5, v16, v9

    if-nez v5, :cond_12

    .line 2429
    const-wide/16 v9, 0x1

    add-long v36, v16, v9

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    move/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v39, v5, v7

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v40, v5, v7

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    move/from16 v41, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    move/from16 v42, v0

    invoke-static/range {v36 .. v42}, Lcom/android/launcher2/LauncherModel;->getCellLayoutChildId(JIIIII)I

    move-result v51

    .line 2436
    :goto_8
    move-object/from16 v0, v28

    move/from16 v1, v51

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 2438
    const-wide/16 v9, -0x65

    cmp-long v5, v16, v9

    if-eqz v5, :cond_a

    move-object/from16 v0, v28

    instance-of v5, v0, Lcom/android/launcher2/LauncherAppWidgetHostView;

    if-eqz v5, :cond_a

    .line 2440
    move-object/from16 v50, v8

    .local v50, cellLayout:Lcom/android/launcher2/CellLayout;
    move-object/from16 v56, v28

    .line 2444
    check-cast v56, Lcom/android/launcher2/LauncherAppWidgetHostView;

    .line 2445
    .local v56, hostView:Lcom/android/launcher2/LauncherAppWidgetHostView;
    invoke-virtual/range {v56 .. v56}, Lcom/android/launcher2/LauncherAppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v61

    .line 2446
    .local v61, pinfo:Landroid/appwidget/AppWidgetProviderInfo;
    if-eqz v61, :cond_a

    move-object/from16 v0, v61

    iget v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    if-eqz v5, :cond_a

    .line 2448
    new-instance v48, Lcom/android/launcher2/Workspace$5;

    move-object/from16 v0, v48

    move-object/from16 v1, p0

    move-object/from16 v2, v57

    move-object/from16 v3, v56

    move-object/from16 v4, v50

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/launcher2/Workspace$5;-><init>(Lcom/android/launcher2/Workspace;Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/LauncherAppWidgetHostView;Lcom/android/launcher2/CellLayout;)V

    .line 2454
    .local v48, addResizeFrame:Ljava/lang/Runnable;
    new-instance v63, Lcom/android/launcher2/Workspace$6;

    .end local v63           #resizeRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, v63

    move-object/from16 v1, p0

    move-object/from16 v2, v48

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace$6;-><init>(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)V

    .line 2466
    .end local v48           #addResizeFrame:Ljava/lang/Runnable;
    .end local v50           #cellLayout:Lcom/android/launcher2/CellLayout;
    .end local v56           #hostView:Lcom/android/launcher2/LauncherAppWidgetHostView;
    .end local v61           #pinfo:Landroid/appwidget/AppWidgetProviderInfo;
    .restart local v63       #resizeRunnable:Ljava/lang/Runnable;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    move-object/from16 v31, v0

    move-object/from16 v0, v60

    iget v0, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    move/from16 v36, v0

    move-object/from16 v0, v60

    iget v0, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    move/from16 v37, v0

    move-object/from16 v32, v57

    move-wide/from16 v33, v16

    invoke-static/range {v31 .. v37}, Lcom/android/launcher2/LauncherModel;->moveItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIII)V

    .line 2478
    .end local v12           #spanX:I
    .end local v13           #spanY:I
    .end local v16           #container:J
    .end local v20           #distance:F
    .end local v24           #minSpanX:I
    .end local v25           #minSpanY:I
    .end local v30           #resultSpan:[I
    .end local v35           #screen:I
    .end local v51           #childId:I
    .end local v53           #foundCell:Z
    .end local v54           #hasMovedIntoHotseat:Z
    .end local v55           #hasMovedLayouts:Z
    .end local v57           #info:Lcom/android/launcher2/ItemInfo;
    .end local v58           #item:Lcom/android/launcher2/ItemInfo;
    .end local v60           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_b
    :goto_9
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v38

    check-cast v38, Lcom/android/launcher2/CellLayout;

    .line 2479
    .local v38, parent:Lcom/android/launcher2/CellLayout;
    move-object/from16 v52, v63

    .line 2482
    .local v52, finalResizeRunnable:Ljava/lang/Runnable;
    new-instance v40, Lcom/android/launcher2/Workspace$7;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    move-object/from16 v2, v52

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace$7;-><init>(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)V

    .line 2492
    .local v40, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/launcher2/Workspace;->mAnimatingViewIntoPlace:Z

    .line 2493
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    invoke-virtual {v5}, Lcom/android/launcher2/DragView;->hasDrawn()Z

    move-result v5

    if-eqz v5, :cond_17

    .line 2494
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Lcom/android/launcher2/ItemInfo;

    .line 2495
    .local v37, info:Lcom/android/launcher2/ItemInfo;
    move-object/from16 v0, v37

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    const/4 v7, 0x4

    if-ne v5, v7, :cond_15

    .line 2496
    if-eqz v62, :cond_14

    const/16 v41, 0x2

    .line 2498
    .local v41, animationType:I
    :goto_a
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v39, v0

    const/16 v43, 0x0

    move-object/from16 v36, p0

    move-object/from16 v42, v28

    invoke-virtual/range {v36 .. v43}, Lcom/android/launcher2/Workspace;->animateWidgetDrop(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 2509
    .end local v37           #info:Lcom/android/launcher2/ItemInfo;
    .end local v41           #animationType:I
    :goto_b
    move-object/from16 v0, v38

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->onDropChild(Landroid/view/View;)V

    .line 2512
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v5, v5, v7

    const/4 v7, -0x1

    if-ne v5, v7, :cond_1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v5, v5, v7

    const/4 v7, -0x1

    if-ne v5, v7, :cond_1

    .line 2513
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v5, v5, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/launcher2/Workspace;->stopDragAppWidget(I)V

    goto/16 :goto_1

    .line 2341
    .end local v38           #parent:Lcom/android/launcher2/CellLayout;
    .end local v40           #onCompleteRunnable:Ljava/lang/Runnable;
    .end local v52           #finalResizeRunnable:Ljava/lang/Runnable;
    :cond_c
    const/16 v55, 0x0

    goto/16 :goto_2

    .line 2343
    .restart local v54       #hasMovedIntoHotseat:Z
    .restart local v55       #hasMovedLayouts:Z
    :cond_d
    const-wide/16 v16, -0x64

    goto/16 :goto_3

    .line 2346
    .restart local v16       #container:J
    :cond_e
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v35

    goto/16 :goto_4

    .line 2348
    .restart local v35       #screen:I
    :cond_f
    const/4 v12, 0x1

    goto/16 :goto_5

    .line 2349
    .restart local v12       #spanX:I
    :cond_10
    const/4 v13, 0x1

    goto/16 :goto_6

    .line 2390
    .restart local v13       #spanY:I
    .restart local v20       #distance:F
    .restart local v24       #minSpanX:I
    .restart local v25       #minSpanY:I
    .restart local v30       #resultSpan:[I
    .restart local v58       #item:Lcom/android/launcher2/ItemInfo;
    :cond_11
    const/16 v53, 0x0

    goto/16 :goto_7

    .line 2433
    .restart local v51       #childId:I
    .restart local v53       #foundCell:Z
    .restart local v57       #info:Lcom/android/launcher2/ItemInfo;
    .restart local v60       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_12
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    move/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    aget v39, v5, v7

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    aget v40, v5, v7

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    move/from16 v41, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v0, v5, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    move/from16 v42, v0

    move-wide/from16 v36, v16

    invoke-static/range {v36 .. v42}, Lcom/android/launcher2/LauncherModel;->getCellLayoutChildId(JIIIII)I

    move-result v51

    goto/16 :goto_8

    .line 2470
    .end local v51           #childId:I
    .end local v57           #info:Lcom/android/launcher2/ItemInfo;
    .end local v60           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_13
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v60

    check-cast v60, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2471
    .restart local v60       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x0

    move-object/from16 v0, v60

    iget v9, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    aput v9, v5, v7

    .line 2472
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mTargetCell:[I

    const/4 v7, 0x1

    move-object/from16 v0, v60

    iget v9, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    aput v9, v5, v7

    .line 2473
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v59

    check-cast v59, Lcom/android/launcher2/CellLayout;

    .line 2474
    .local v59, layout:Lcom/android/launcher2/CellLayout;
    move-object/from16 v0, v59

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;)V

    goto/16 :goto_9

    .line 2496
    .end local v12           #spanX:I
    .end local v13           #spanY:I
    .end local v16           #container:J
    .end local v20           #distance:F
    .end local v24           #minSpanX:I
    .end local v25           #minSpanY:I
    .end local v30           #resultSpan:[I
    .end local v35           #screen:I
    .end local v53           #foundCell:Z
    .end local v54           #hasMovedIntoHotseat:Z
    .end local v55           #hasMovedLayouts:Z
    .end local v58           #item:Lcom/android/launcher2/ItemInfo;
    .end local v59           #layout:Lcom/android/launcher2/CellLayout;
    .end local v60           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .restart local v37       #info:Lcom/android/launcher2/ItemInfo;
    .restart local v38       #parent:Lcom/android/launcher2/CellLayout;
    .restart local v40       #onCompleteRunnable:Ljava/lang/Runnable;
    .restart local v52       #finalResizeRunnable:Ljava/lang/Runnable;
    :cond_14
    const/16 v41, 0x0

    goto/16 :goto_a

    .line 2501
    :cond_15
    if-gez v64, :cond_16

    const/16 v45, -0x1

    .line 2502
    .local v45, duration:I
    :goto_c
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v42

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    move-object/from16 v43, v0

    move-object/from16 v44, v28

    move-object/from16 v46, v40

    move-object/from16 v47, p0

    invoke-virtual/range {v42 .. v47}, Lcom/android/launcher2/DragLayer;->animateViewIntoPosition(Lcom/android/launcher2/DragView;Landroid/view/View;ILjava/lang/Runnable;Landroid/view/View;)V

    goto/16 :goto_b

    .line 2501
    .end local v45           #duration:I
    :cond_16
    const/16 v45, 0x12c

    goto :goto_c

    .line 2506
    .end local v37           #info:Lcom/android/launcher2/ItemInfo;
    :cond_17
    const/4 v5, 0x0

    move-object/from16 v0, p1

    iput-boolean v5, v0, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 2507
    const/4 v5, 0x0

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_b
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/android/launcher2/DropTarget$DragObject;ZZ)V
    .locals 6
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 3583
    const-string v1, "Workspace"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDropCompleted: target = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", d = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", isFlingToDelete = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mDragInfo = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", success = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3587
    if-eqz p4, :cond_2

    .line 3588
    if-eq p1, p0, :cond_0

    .line 3589
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v1, :cond_0

    .line 3590
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/android/launcher2/CellLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 3591
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    instance-of v1, v1, Lcom/android/launcher2/DropTarget;

    if-eqz v1, :cond_0

    .line 3592
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    check-cast v1, Lcom/android/launcher2/DropTarget;

    invoke-virtual {v2, v1}, Lcom/android/launcher2/DragController;->removeDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 3606
    :cond_0
    :goto_0
    iget-boolean v1, p2, Lcom/android/launcher2/DropTarget$DragObject;->cancelled:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    if-eqz v1, :cond_1

    .line 3607
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3611
    :cond_1
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->stopDragAppWidget(I)V

    .line 3612
    iput-object v5, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 3613
    iput-object v5, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    .line 3616
    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->hideScrollingIndicator(Z)V

    .line 3617
    return-void

    .line 3596
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v1, :cond_0

    .line 3598
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1, p1}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3599
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    .line 3603
    .local v0, cellLayout:Lcom/android/launcher2/CellLayout;
    :goto_1
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->onDropChild(Landroid/view/View;)V

    .line 3604
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;)V

    goto :goto_0

    .line 3601
    .end local v0           #cellLayout:Lcom/android/launcher2/CellLayout;
    :cond_3
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget v1, v1, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .restart local v0       #cellLayout:Lcom/android/launcher2/CellLayout;
    goto :goto_1
.end method

.method public onEnterScrollArea(III)Z
    .locals 9
    .parameter "x"
    .parameter "y"
    .parameter "direction"

    .prologue
    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v5, 0x1

    .line 3722
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/launcher2/LauncherApplication;->isScreenLandscape(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_0

    move v0, v5

    .line 3723
    .local v0, isPortrait:Z
    :goto_0
    iget-object v8, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v8}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v8

    if-eqz v8, :cond_1

    if-eqz v0, :cond_1

    .line 3724
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 3725
    .local v3, r:Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v8}, Lcom/android/launcher2/Launcher;->getHotseat()Lcom/android/launcher2/Hotseat;

    move-result-object v8

    invoke-virtual {v8, v3}, Lcom/android/launcher2/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 3726
    invoke-virtual {v3, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 3759
    .end local v3           #r:Landroid/graphics/Rect;
    :goto_1
    return v6

    .end local v0           #isPortrait:Z
    :cond_0
    move v0, v6

    .line 3722
    goto :goto_0

    .line 3731
    .restart local v0       #isPortrait:Z
    :cond_1
    const/4 v4, 0x0

    .line 3732
    .local v4, result:Z
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v6

    if-nez v6, :cond_3

    iget-boolean v6, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v6, :cond_3

    .line 3733
    iput-boolean v5, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    .line 3735
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getNextPage()I

    move-result v8

    if-nez p3, :cond_4

    move v6, v7

    :goto_2
    add-int v2, v8, v6

    .line 3738
    .local v2, page:I
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSupportCycleSlidingScreen()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 3739
    if-ne p3, v5, :cond_5

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v5

    if-ne v2, v5, :cond_5

    .line 3740
    const/4 v2, 0x0

    .line 3747
    :cond_2
    :goto_3
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3749
    if-ltz v2, :cond_3

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 3750
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 3751
    .local v1, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3755
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 3756
    const/4 v4, 0x1

    .end local v1           #layout:Lcom/android/launcher2/CellLayout;
    .end local v2           #page:I
    :cond_3
    move v6, v4

    .line 3759
    goto :goto_1

    :cond_4
    move v6, v5

    .line 3735
    goto :goto_2

    .line 3741
    .restart local v2       #page:I
    :cond_5
    if-nez p3, :cond_2

    if-ne v2, v7, :cond_2

    .line 3742
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    goto :goto_3
.end method

.method public onExitScrollArea()Z
    .locals 3

    .prologue
    .line 3764
    const/4 v1, 0x0

    .line 3765
    .local v1, result:Z
    iget-boolean v2, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    if-eqz v2, :cond_0

    .line 3766
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 3767
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getCurrentDropLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    .line 3768
    .local v0, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3769
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V

    .line 3771
    const/4 v1, 0x1

    .line 3772
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/launcher2/Workspace;->mInScrollArea:Z

    .line 3774
    .end local v0           #layout:Lcom/android/launcher2/CellLayout;
    :cond_0
    return v1
.end method

.method public onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 0
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vec"

    .prologue
    .line 3650
    return-void
.end method

.method public onFlingToDeleteCompleted()V
    .locals 0

    .prologue
    .line 3655
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "ev"

    .prologue
    .line 700
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    sparse-switch v1, :sswitch_data_0

    .line 714
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 702
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mXDown:F

    .line 703
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mYDown:F

    goto :goto_0

    .line 707
    :sswitch_1
    iget v1, p0, Lcom/android/launcher2/PagedView;->mTouchState:I

    if-nez v1, :cond_0

    .line 708
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 709
    .local v0, currentPage:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->lastDownOnOccupiedCell()Z

    move-result v1

    if-nez v1, :cond_0

    .line 710
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->onWallpaperTap(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 700
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x6 -> :sswitch_1
    .end sparse-switch
.end method

.method public onLauncherTransitionEnd(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 4
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v3, 0x0

    .line 1807
    iput-boolean v3, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    .line 1808
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mWallpaperOffset:Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->setOverrideHorizontalCatchupConstant(Z)V

    .line 1809
    invoke-direct {p0, v3}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 1814
    iget-boolean v2, p0, Lcom/android/launcher2/Workspace;->mWorkspaceFadeInAdjacentScreens:Z

    if-nez v2, :cond_0

    .line 1815
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1816
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 1817
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    const/high16 v2, 0x3f80

    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 1815
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1820
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    .end local v1           #i:I
    :cond_0
    return-void
.end method

.method public onLauncherTransitionPrepare(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 1
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 1792
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    .line 1793
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->cancelScrollingIndicatorAnimations()V

    .line 1794
    return-void
.end method

.method public onLauncherTransitionStart(Lcom/android/launcher2/Launcher;ZZ)V
    .locals 0
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 1798
    return-void
.end method

.method public onLauncherTransitionStep(Lcom/android/launcher2/Launcher;F)V
    .locals 0
    .parameter "l"
    .parameter "t"

    .prologue
    .line 1802
    iput p2, p0, Lcom/android/launcher2/Workspace;->mTransitionProgress:F

    .line 1803
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 1347
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mFirstLayout:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1348
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 1350
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/android/launcher2/SmoothPagedView;->onLayout(ZIIII)V

    .line 1356
    return-void
.end method

.method protected onPageBeginMoving()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 776
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->onPageBeginMoving()V

    .line 778
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 779
    invoke-direct {p0, v2}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 792
    :goto_0
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 793
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->showOutlines()V

    .line 794
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v1}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v1

    if-nez v1, :cond_3

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lcom/android/launcher2/Workspace;->mIsStaticWallpaper:Z

    .line 799
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher2/Workspace;->mWorkspaceFadeInAdjacentScreens:Z

    if-nez v1, :cond_4

    .line 800
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 801
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    const/high16 v3, 0x3f80

    invoke-virtual {v1, v3}, Lcom/android/launcher2/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 800
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 781
    .end local v0           #i:I
    :cond_1
    iget v1, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    .line 783
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    iget v3, p0, Lcom/android/launcher2/PagedView;->mNextPage:I

    invoke-virtual {p0, v1, v3}, Lcom/android/launcher2/Workspace;->enableChildrenCache(II)V

    goto :goto_0

    .line 787
    :cond_2
    iget v1, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v1, v1, -0x1

    iget v3, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v1, v3}, Lcom/android/launcher2/Workspace;->enableChildrenCache(II)V

    goto :goto_0

    :cond_3
    move v1, v2

    .line 794
    goto :goto_1

    .line 806
    :cond_4
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->showScrollingIndicator(Z)V

    .line 807
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 810
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->onPageEndMoving()V

    .line 812
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 813
    invoke-direct {p0, v1}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 819
    :goto_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0}, Lcom/android/launcher2/DragController;->isDragging()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 820
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 823
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0}, Lcom/android/launcher2/DragController;->forceMoveEvent()V

    .line 836
    :cond_0
    :goto_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    .line 838
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 839
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 840
    iput-object v2, p0, Lcom/android/launcher2/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    .line 843
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 844
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 845
    iput-object v2, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    .line 847
    :cond_2
    return-void

    .line 815
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->clearChildrenCache()V

    goto :goto_0

    .line 827
    :cond_4
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 828
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->hideOutlines()V

    .line 832
    :cond_5
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0}, Lcom/android/launcher2/DragController;->isDragging()Z

    move-result v0

    if-nez v0, :cond_0

    .line 833
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->hideScrollingIndicator(Z)V

    goto :goto_1
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 2
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 1383
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1384
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 1385
    .local v0, openFolder:Lcom/android/launcher2/Folder;
    if-eqz v0, :cond_0

    .line 1386
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher2/Folder;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v1

    .line 1391
    .end local v0           #openFolder:Lcom/android/launcher2/Folder;
    :goto_0
    return v1

    .line 1388
    .restart local v0       #openFolder:Lcom/android/launcher2/Folder;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher2/SmoothPagedView;->onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z

    move-result v1

    goto :goto_0

    .line 1391
    .end local v0           #openFolder:Lcom/android/launcher2/Folder;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 3
    .parameter "state"

    .prologue
    .line 3663
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 3665
    const-string v0, "Workspace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRestoreInstanceState: state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrentPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3668
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-static {v0}, Lcom/android/launcher2/Launcher;->setScreen(I)V

    .line 3669
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 669
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isFinishedSwitchingState()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onWallpaperTap(Landroid/view/MotionEvent;)V
    .locals 9
    .parameter "ev"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1509
    iget-object v8, p0, Lcom/android/launcher2/Workspace;->mTempCell:[I

    .line 1510
    .local v8, position:[I
    invoke-virtual {p0, v8}, Lcom/android/launcher2/Workspace;->getLocationOnScreen([I)V

    .line 1512
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v7

    .line 1513
    .local v7, pointerIndex:I
    aget v0, v8, v5

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    aput v0, v8, v5

    .line 1514
    aget v0, v8, v4

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    aput v0, v8, v4

    .line 1516
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-ne v2, v4, :cond_0

    const-string v2, "android.wallpaper.tap"

    :goto_0
    aget v3, v8, v5

    aget v4, v8, v4

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/app/WallpaperManager;->sendWallpaperCommand(Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;)V

    .line 1520
    return-void

    .line 1516
    :cond_0
    const-string v2, "android.wallpaper.secondaryTap"

    goto :goto_0
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .parameter "visibility"

    .prologue
    .line 683
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Launcher;->onWindowVisibilityChanged(I)V

    .line 684
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 1325
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->acceleratedOverScroll(F)V

    .line 1326
    return-void
.end method

.method overScrollBackgroundAlphaInterpolator(F)F
    .locals 3
    .parameter "r"

    .prologue
    .line 1248
    const v0, 0x3da3d70a

    .line 1250
    .local v0, threshold:F
    iget v1, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    cmpl-float v1, p1, v1

    if-lez v1, :cond_1

    .line 1251
    iput p1, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    .line 1256
    :cond_0
    :goto_0
    div-float v1, p1, v0

    const/high16 v2, 0x3f80

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    return v1

    .line 1252
    :cond_1
    iget v1, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    cmpg-float v1, p1, v1

    if-gez v1, :cond_0

    .line 1253
    iget p1, p0, Lcom/android/launcher2/Workspace;->mOverScrollMaxBackgroundAlpha:F

    goto :goto_0
.end method

.method overlaps(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;IILandroid/graphics/Matrix;)Z
    .locals 10
    .parameter "cl"
    .parameter "dragView"
    .parameter "dragViewX"
    .parameter "dragViewY"
    .parameter "cachedInverseMatrix"

    .prologue
    .line 2810
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mTempDragCoordinates:[F

    .line 2811
    .local v1, draggedItemTopLeft:[F
    const/4 v7, 0x0

    int-to-float v8, p3

    aput v8, v1, v7

    .line 2812
    const/4 v7, 0x1

    int-to-float v8, p4

    aput v8, v1, v7

    .line 2813
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mTempDragBottomRightCoordinates:[F

    .line 2814
    .local v0, draggedItemBottomRight:[F
    const/4 v7, 0x0

    const/4 v8, 0x0

    aget v8, v1, v8

    invoke-virtual {p2}, Lcom/android/launcher2/DragView;->getDragRegionWidth()I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v8, v9

    aput v8, v0, v7

    .line 2815
    const/4 v7, 0x1

    const/4 v8, 0x1

    aget v8, v1, v8

    invoke-virtual {p2}, Lcom/android/launcher2/DragView;->getDragRegionHeight()I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v8, v9

    aput v8, v0, v7

    .line 2819
    invoke-virtual {p0, p1, v1, p5}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 2820
    const/4 v7, 0x0

    const/4 v8, 0x0

    aget v8, v1, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 2821
    .local v4, overlapRegionLeft:F
    const/4 v7, 0x0

    const/4 v8, 0x1

    aget v8, v1, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 2823
    .local v6, overlapRegionTop:F
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getWidth()I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v4, v7

    if-gtz v7, :cond_0

    const/4 v7, 0x0

    cmpl-float v7, v6, v7

    if-ltz v7, :cond_0

    .line 2826
    invoke-virtual {p0, p1, v0, p5}, Lcom/android/launcher2/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 2827
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/4 v8, 0x0

    aget v8, v0, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 2828
    .local v5, overlapRegionRight:F
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getHeight()I

    move-result v7

    int-to-float v7, v7

    const/4 v8, 0x1

    aget v8, v0, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 2830
    .local v3, overlapRegionBottom:F
    const/4 v7, 0x0

    cmpl-float v7, v5, v7

    if-ltz v7, :cond_0

    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getHeight()I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v3, v7

    if-gtz v7, :cond_0

    .line 2831
    sub-float v7, v5, v4

    sub-float v8, v3, v6

    mul-float v2, v7, v8

    .line 2833
    .local v2, overlap:F
    const/4 v7, 0x0

    cmpl-float v7, v2, v7

    if-lez v7, :cond_0

    .line 2834
    const/4 v7, 0x1

    .line 2838
    .end local v2           #overlap:F
    .end local v3           #overlapRegionBottom:F
    .end local v5           #overlapRegionRight:F
    :goto_0
    return v7

    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method

.method protected reinflateWidgetsIfNecessary()V
    .locals 10

    .prologue
    .line 718
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v1

    .line 719
    .local v1, clCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 720
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 721
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v7

    .line 722
    .local v7, swc:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v7}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v4

    .line 723
    .local v4, itemCount:I
    const/4 v5, 0x0

    .local v5, j:I
    :goto_1
    if-ge v5, v4, :cond_1

    .line 724
    invoke-virtual {v7, v5}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 726
    .local v8, v:Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Lcom/android/launcher2/LauncherAppWidgetInfo;

    if-eqz v9, :cond_0

    .line 727
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/LauncherAppWidgetInfo;

    .line 728
    .local v3, info:Lcom/android/launcher2/LauncherAppWidgetInfo;
    iget-object v6, v3, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    check-cast v6, Lcom/android/launcher2/LauncherAppWidgetHostView;

    .line 729
    .local v6, lahv:Lcom/android/launcher2/LauncherAppWidgetHostView;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/android/launcher2/LauncherAppWidgetHostView;->orientationChangedSincedInflation()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 730
    iget-object v9, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v9, v3}, Lcom/android/launcher2/Launcher;->removeAppWidget(Lcom/android/launcher2/LauncherAppWidgetInfo;)V

    .line 732
    invoke-virtual {v0, v6}, Lcom/android/launcher2/CellLayout;->removeView(Landroid/view/View;)V

    .line 733
    iget-object v9, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v9, v3}, Lcom/android/launcher2/Launcher;->bindAppWidget(Lcom/android/launcher2/LauncherAppWidgetInfo;)V

    .line 723
    .end local v3           #info:Lcom/android/launcher2/LauncherAppWidgetInfo;
    .end local v6           #lahv:Lcom/android/launcher2/LauncherAppWidgetHostView;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 719
    .end local v8           #v:Landroid/view/View;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 738
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    .end local v4           #itemCount:I
    .end local v5           #j:I
    .end local v7           #swc:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_2
    return-void
.end method

.method removeItems(Ljava/util/ArrayList;)V
    .locals 9
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
    .line 3876
    .local p1, packages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 3877
    .local v5, packageNames:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v5, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 3880
    const-string v6, "Workspace"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "removeFinalItem: packageNames = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3883
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;

    move-result-object v0

    .line 3884
    .local v0, cellLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/CellLayout;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/CellLayout;

    .line 3885
    .local v4, layoutParent:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v3

    .line 3888
    .local v3, layout:Landroid/view/ViewGroup;
    new-instance v6, Lcom/android/launcher2/Workspace$11;

    invoke-direct {v6, p0, v3, v5, v4}, Lcom/android/launcher2/Workspace$11;-><init>(Lcom/android/launcher2/Workspace;Landroid/view/ViewGroup;Ljava/util/HashSet;Lcom/android/launcher2/CellLayout;)V

    invoke-virtual {p0, v6}, Lcom/android/launcher2/Workspace;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 3978
    .end local v3           #layout:Landroid/view/ViewGroup;
    .end local v4           #layoutParent:Lcom/android/launcher2/CellLayout;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 3979
    .local v1, context:Landroid/content/Context;
    new-instance v6, Lcom/android/launcher2/Workspace$12;

    invoke-direct {v6, p0, v1, v5}, Lcom/android/launcher2/Workspace$12;-><init>(Lcom/android/launcher2/Workspace;Landroid/content/Context;Ljava/util/HashSet;)V

    invoke-virtual {p0, v6}, Lcom/android/launcher2/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 4014
    return-void
.end method

.method public resetFinalScrollForPageChange(I)V
    .locals 2
    .parameter "screen"

    .prologue
    .line 2532
    if-ltz p1, :cond_0

    .line 2533
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 2534
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    iget v1, p0, Lcom/android/launcher2/Workspace;->mSavedScrollX:I

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->setScrollX(I)V

    .line 2535
    iget v1, p0, Lcom/android/launcher2/Workspace;->mSavedTranslationX:F

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 2536
    iget v1, p0, Lcom/android/launcher2/Workspace;->mSavedRotationY:F

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 2538
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    :cond_0
    return-void
.end method

.method public resetTransitionTransform(Lcom/android/launcher2/CellLayout;)V
    .locals 1
    .parameter "layout"

    .prologue
    .line 3524
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSwitchingState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3525
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleX:F

    .line 3526
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getScaleY()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleY:F

    .line 3527
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getTranslationX()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationX:F

    .line 3528
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getTranslationY()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationY:F

    .line 3529
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getRotationY()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace;->mCurrentRotationY:F

    .line 3530
    iget v0, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleX:F

    invoke-virtual {p1, v0}, Lcom/android/launcher2/CellLayout;->setScaleX(F)V

    .line 3531
    iget v0, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleY:F

    invoke-virtual {p1, v0}, Lcom/android/launcher2/CellLayout;->setScaleY(F)V

    .line 3532
    iget v0, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationX:F

    invoke-virtual {p1, v0}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 3533
    iget v0, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationY:F

    invoke-virtual {p1, v0}, Lcom/android/launcher2/CellLayout;->setTranslationY(F)V

    .line 3534
    iget v0, p0, Lcom/android/launcher2/Workspace;->mCurrentRotationY:F

    invoke-virtual {p1, v0}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 3536
    :cond_0
    return-void
.end method

.method public restoreInstanceStateForChild(I)V
    .locals 3
    .parameter "child"

    .prologue
    .line 3680
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mSavedStates:Landroid/util/SparseArray;

    if-eqz v1, :cond_0

    .line 3681
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3682
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 3683
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mSavedStates:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->restoreInstanceState(Landroid/util/SparseArray;)V

    .line 3685
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    :cond_0
    return-void
.end method

.method public restoreInstanceStateForRemainingPages()V
    .locals 4

    .prologue
    .line 3688
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    .line 3689
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 3690
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3691
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->restoreInstanceStateForChild(I)V

    .line 3689
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3694
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 3695
    return-void
.end method

.method protected screenScrolled(I)V
    .locals 9
    .parameter "screenCenter"

    .prologue
    const/4 v8, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1291
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->screenScrolled(I)V

    .line 1293
    invoke-direct {p0, p1}, Lcom/android/launcher2/Workspace;->updatePageAlphaValues(I)V

    .line 1294
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->enableHwLayersOnVisiblePages()V

    .line 1296
    iget v6, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    if-ltz v6, :cond_0

    iget v6, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    iget v7, p0, Lcom/android/launcher2/PagedView;->mMaxScrollX:I

    if-le v6, v7, :cond_5

    .line 1297
    :cond_0
    iget v6, p0, Lcom/android/launcher2/PagedView;->mOverScrollX:I

    if-gez v6, :cond_3

    move v1, v4

    .line 1298
    .local v1, index:I
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 1299
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher2/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1300
    .local v3, scrollProgress:F
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    if-nez v1, :cond_1

    move v4, v5

    :cond_1
    invoke-virtual {v0, v6, v4}, Lcom/android/launcher2/CellLayout;->setOverScrollAmount(FZ)V

    .line 1301
    const/high16 v4, -0x3e40

    mul-float v2, v4, v3

    .line 1302
    .local v2, rotation:F
    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 1303
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->setFadeForOverScroll(F)V

    .line 1304
    iget-boolean v4, p0, Lcom/android/launcher2/Workspace;->mOverscrollTransformsSet:Z

    if-nez v4, :cond_2

    .line 1305
    iput-boolean v5, p0, Lcom/android/launcher2/Workspace;->mOverscrollTransformsSet:Z

    .line 1306
    iget v4, p0, Lcom/android/launcher2/PagedView;->mDensity:F

    iget v6, p0, Lcom/android/launcher2/Workspace;->mCameraDistance:I

    int-to-float v6, v6

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setCameraDistance(F)V

    .line 1307
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v6, v4

    if-nez v1, :cond_4

    const/high16 v4, 0x3f40

    :goto_1
    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setPivotX(F)V

    .line 1308
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x3f00

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setPivotY(F)V

    .line 1309
    invoke-virtual {v0, v5}, Lcom/android/launcher2/CellLayout;->setOverscrollTransformsDirty(Z)V

    .line 1321
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    .end local v1           #index:I
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_2
    :goto_2
    return-void

    .line 1297
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v6

    add-int/lit8 v1, v6, -0x1

    goto :goto_0

    .line 1307
    .restart local v0       #cl:Lcom/android/launcher2/CellLayout;
    .restart local v1       #index:I
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    :cond_4
    const/high16 v4, 0x3e80

    goto :goto_1

    .line 1312
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    .end local v1           #index:I
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_5
    iget v5, p0, Lcom/android/launcher2/Workspace;->mOverscrollFade:F

    cmpl-float v5, v5, v8

    if-eqz v5, :cond_6

    .line 1313
    invoke-virtual {p0, v8}, Lcom/android/launcher2/Workspace;->setFadeForOverScroll(F)V

    .line 1315
    :cond_6
    iget-boolean v5, p0, Lcom/android/launcher2/Workspace;->mOverscrollTransformsSet:Z

    if-eqz v5, :cond_2

    .line 1316
    iput-boolean v4, p0, Lcom/android/launcher2/Workspace;->mOverscrollTransformsSet:Z

    .line 1317
    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->resetOverscrollTransforms()V

    .line 1318
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/CellLayout;

    invoke-virtual {v4}, Lcom/android/launcher2/CellLayout;->resetOverscrollTransforms()V

    goto :goto_2
.end method

.method public scrollLeft()V
    .locals 2

    .prologue
    .line 3699
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v1, :cond_0

    .line 3700
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->scrollLeft()V

    .line 3702
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 3703
    .local v0, openFolder:Lcom/android/launcher2/Folder;
    if-eqz v0, :cond_1

    .line 3704
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->completeDragExit()V

    .line 3706
    :cond_1
    return-void
.end method

.method public scrollRight()V
    .locals 2

    .prologue
    .line 3710
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v1, :cond_0

    .line 3711
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->scrollRight()V

    .line 3713
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 3714
    .local v0, openFolder:Lcom/android/launcher2/Folder;
    if-eqz v0, :cond_1

    .line 3715
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->completeDragExit()V

    .line 3717
    :cond_1
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 1225
    iget v0, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 1226
    iput p1, p0, Lcom/android/launcher2/Workspace;->mBackgroundAlpha:F

    .line 1227
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 1229
    :cond_0
    return-void
.end method

.method public setChildrenOutlineAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 1178
    iput p1, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineAlpha:F

    .line 1179
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1180
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 1181
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0, p1}, Lcom/android/launcher2/CellLayout;->setBackgroundAlpha(F)V

    .line 1179
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1183
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    :cond_0
    return-void
.end method

.method setCurrentDragOverlappingLayout(Lcom/android/launcher2/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    .line 2672
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v0, :cond_0

    .line 2673
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setIsDragOverlapping(Z)V

    .line 2675
    :cond_0
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    .line 2676
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v0, :cond_1

    .line 2677
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragOverlappingLayout:Lcom/android/launcher2/CellLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setIsDragOverlapping(Z)V

    .line 2679
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 2680
    return-void
.end method

.method setCurrentDropLayout(Lcom/android/launcher2/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    const/4 v1, -0x1

    .line 2658
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v0, :cond_0

    .line 2659
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->revertTempState()V

    .line 2660
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->onDragExit()V

    .line 2662
    :cond_0
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    .line 2663
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    if-eqz v0, :cond_1

    .line 2664
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDragTargetLayout:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->onDragEnter()V

    .line 2666
    :cond_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->cleanupReorder(Z)V

    .line 2667
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupFolderCreation()V

    .line 2668
    invoke-virtual {p0, v1, v1}, Lcom/android/launcher2/Workspace;->setCurrentDropOverCell(II)V

    .line 2669
    return-void
.end method

.method setCurrentDropOverCell(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 2683
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragOverX:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragOverY:I

    if-eq p2, v0, :cond_1

    .line 2684
    :cond_0
    iput p1, p0, Lcom/android/launcher2/Workspace;->mDragOverX:I

    .line 2685
    iput p2, p0, Lcom/android/launcher2/Workspace;->mDragOverY:I

    .line 2686
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->setDragMode(I)V

    .line 2688
    :cond_1
    return-void
.end method

.method setDragMode(I)V
    .locals 2
    .parameter "dragMode"

    .prologue
    const/4 v1, 0x1

    .line 2691
    iget v0, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    if-eq p1, v0, :cond_1

    .line 2692
    if-nez p1, :cond_2

    .line 2693
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupAddToFolder()V

    .line 2696
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->cleanupReorder(Z)V

    .line 2697
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupFolderCreation()V

    .line 2708
    :cond_0
    :goto_0
    iput p1, p0, Lcom/android/launcher2/Workspace;->mDragMode:I

    .line 2710
    :cond_1
    return-void

    .line 2698
    :cond_2
    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 2699
    invoke-direct {p0, v1}, Lcom/android/launcher2/Workspace;->cleanupReorder(Z)V

    .line 2700
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupFolderCreation()V

    goto :goto_0

    .line 2701
    :cond_3
    if-ne p1, v1, :cond_4

    .line 2702
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupAddToFolder()V

    .line 2703
    invoke-direct {p0, v1}, Lcom/android/launcher2/Workspace;->cleanupReorder(Z)V

    goto :goto_0

    .line 2704
    :cond_4
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 2705
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupAddToFolder()V

    .line 2706
    invoke-direct {p0}, Lcom/android/launcher2/Workspace;->cleanupFolderCreation()V

    goto :goto_0
.end method

.method setFadeForOverScroll(F)V
    .locals 8
    .parameter "fade"

    .prologue
    const/high16 v7, 0x3f80

    const/high16 v6, 0x3f00

    .line 4083
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isScrollingIndicatorEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    .line 4096
    :goto_0
    return-void

    .line 4085
    :cond_0
    iput p1, p0, Lcom/android/launcher2/Workspace;->mOverscrollFade:F

    .line 4086
    sub-float v5, v7, p1

    mul-float/2addr v5, v6

    add-float v3, v6, v5

    .line 4087
    .local v3, reducedFade:F
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 4088
    .local v1, parent:Landroid/view/ViewGroup;
    const v5, 0x7f070022

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    move-object v2, v5

    check-cast v2, Landroid/widget/ImageView;

    .line 4089
    .local v2, qsbDivider:Landroid/widget/ImageView;
    const v5, 0x7f070023

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    move-object v0, v5

    check-cast v0, Landroid/widget/ImageView;

    .line 4090
    .local v0, dockDivider:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollingIndicator()Landroid/view/View;

    move-result-object v4

    .line 4092
    .local v4, scrollIndicator:Landroid/view/View;
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->cancelScrollingIndicatorAnimations()V

    .line 4093
    if-eqz v2, :cond_1

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 4094
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 4095
    :cond_2
    sub-float v5, v7, p1

    invoke-virtual {v4, v5}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method public setFinalScrollForPageChange(I)V
    .locals 5
    .parameter "screen"

    .prologue
    const/4 v4, 0x0

    .line 2519
    if-ltz p1, :cond_0

    .line 2520
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getScrollX()I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/Workspace;->mSavedScrollX:I

    .line 2521
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 2522
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getTranslationX()F

    move-result v2

    iput v2, p0, Lcom/android/launcher2/Workspace;->mSavedTranslationX:F

    .line 2523
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getRotationY()F

    move-result v2

    iput v2, p0, Lcom/android/launcher2/Workspace;->mSavedRotationY:F

    .line 2524
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getChildOffset(I)I

    move-result v2

    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->getRelativeChildOffset(I)I

    move-result v3

    sub-int v1, v2, v3

    .line 2525
    .local v1, newX:I
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Workspace;->setScrollX(I)V

    .line 2526
    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 2527
    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 2529
    .end local v0           #cl:Lcom/android/launcher2/CellLayout;
    .end local v1           #newX:I
    :cond_0
    return-void
.end method

.method public setFinalTransitionTransform(Lcom/android/launcher2/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    .line 3509
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSwitchingState()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3510
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 3511
    .local v0, index:I
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getScaleX()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleX:F

    .line 3512
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getScaleY()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mCurrentScaleY:F

    .line 3513
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getTranslationX()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationX:F

    .line 3514
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getTranslationY()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mCurrentTranslationY:F

    .line 3515
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getRotationY()F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/Workspace;->mCurrentRotationY:F

    .line 3516
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mNewScaleXs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/android/launcher2/CellLayout;->setScaleX(F)V

    .line 3517
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mNewScaleYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/android/launcher2/CellLayout;->setScaleY(F)V

    .line 3518
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mNewTranslationXs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 3519
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mNewTranslationYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/android/launcher2/CellLayout;->setTranslationY(F)V

    .line 3520
    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mNewRotationYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 3522
    .end local v0           #index:I
    :cond_0
    return-void
.end method

.method protected setWallpaperDimension()V
    .locals 6

    .prologue
    .line 888
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 889
    .local v3, minDims:Landroid/graphics/Point;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 890
    .local v1, maxDims:Landroid/graphics/Point;
    iget-object v4, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v4}, Lcom/android/launcher2/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v3, v1}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 892
    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v5, v1, Landroid/graphics/Point;->y:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 893
    .local v0, maxDim:I
    iget v4, v3, Landroid/graphics/Point;->x:I

    iget v5, v3, Landroid/graphics/Point;->y:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 897
    .local v2, minDim:I
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 898
    int-to-float v4, v0

    invoke-direct {p0, v0, v2}, Lcom/android/launcher2/Workspace;->wallpaperTravelToScreenWidthRatio(II)F

    move-result v5

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/android/launcher2/Workspace;->mWallpaperWidth:I

    .line 899
    iput v0, p0, Lcom/android/launcher2/Workspace;->mWallpaperHeight:I

    .line 904
    :goto_0
    new-instance v4, Lcom/android/launcher2/Workspace$2;

    const-string v5, "setWallpaperDimension"

    invoke-direct {v4, p0, v5}, Lcom/android/launcher2/Workspace$2;-><init>(Lcom/android/launcher2/Workspace;Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/android/launcher2/Workspace$2;->start()V

    .line 909
    return-void

    .line 901
    :cond_0
    int-to-float v4, v2

    const/high16 v5, 0x4000

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/android/launcher2/Workspace;->mWallpaperWidth:I

    .line 902
    iput v0, p0, Lcom/android/launcher2/Workspace;->mWallpaperHeight:I

    goto :goto_0
.end method

.method setup(Lcom/android/launcher2/DragController;)V
    .locals 2
    .parameter "dragController"

    .prologue
    .line 3568
    new-instance v0, Lcom/android/launcher2/SpringLoadedDragController;

    iget-object v1, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-direct {v0, v1}, Lcom/android/launcher2/SpringLoadedDragController;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mSpringLoadedDragController:Lcom/android/launcher2/SpringLoadedDragController;

    .line 3569
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDragController:Lcom/android/launcher2/DragController;

    .line 3573
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 3574
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->setWallpaperDimension()V

    .line 3575
    return-void
.end method

.method protected shouldDrawChild(Landroid/view/View;)Z
    .locals 3
    .parameter "child"

    .prologue
    const/4 v2, 0x0

    .line 472
    move-object v0, p1

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 473
    .local v0, cl:Lcom/android/launcher2/CellLayout;
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->shouldDrawChild(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_0

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getBackgroundAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method showOutlines()V
    .locals 4

    .prologue
    .line 1151
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/launcher2/Workspace;->mIsSwitchingState:Z

    if-nez v0, :cond_2

    .line 1152
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1153
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1154
    :cond_1
    const-string v0, "childrenOutlineAlpha"

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    .line 1155
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1156
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1158
    :cond_2
    return-void
.end method

.method public showOutlinesTemporarily()V
    .locals 1

    .prologue
    .line 1172
    iget-boolean v0, p0, Lcom/android/launcher2/PagedView;->mIsPageMoving:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isTouchActive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1173
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    .line 1175
    :cond_0
    return-void
.end method

.method protected snapToPage(I)V
    .locals 3
    .parameter "whichPage"

    .prologue
    .line 996
    invoke-super {p0, p1}, Lcom/android/launcher2/SmoothPagedView;->snapToPage(I)V

    .line 998
    const-string v0, "Workspace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "snapToPage: whichPage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mScrollX = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/launcher2/PagedView;->mScrollX:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1000
    invoke-direct {p0, p1}, Lcom/android/launcher2/Workspace;->computeWallpaperScrollRatio(I)V

    .line 1001
    return-void
.end method

.method protected snapToPage(II)V
    .locals 0
    .parameter "whichPage"
    .parameter "duration"

    .prologue
    .line 1005
    invoke-super {p0, p1, p2}, Lcom/android/launcher2/SmoothPagedView;->snapToPage(II)V

    .line 1006
    invoke-direct {p0, p1}, Lcom/android/launcher2/Workspace;->computeWallpaperScrollRatio(I)V

    .line 1007
    return-void
.end method

.method protected snapToPage(ILjava/lang/Runnable;)V
    .locals 1
    .parameter "whichPage"
    .parameter "r"

    .prologue
    .line 1010
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 1011
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1013
    :cond_0
    iput-object p2, p0, Lcom/android/launcher2/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    .line 1014
    const/16 v0, 0x3b6

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/Workspace;->snapToPage(II)V

    .line 1015
    return-void
.end method

.method startDrag(Lcom/android/launcher2/CellLayout$CellInfo;)V
    .locals 6
    .parameter "cellInfo"

    .prologue
    .line 1947
    iget-object v1, p1, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 1955
    .local v1, child:Landroid/view/View;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1956
    const-string v3, "Workspace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Abnormal start drag: cellInfo = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",child = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1981
    :goto_0
    return-void

    .line 1961
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->isInTouchMode()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1963
    const-string v3, "Workspace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The child "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not in touch mode."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1968
    :cond_1
    iput-object p1, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    .line 1969
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1970
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout;

    .line 1971
    .local v2, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v2, v1}, Lcom/android/launcher2/CellLayout;->prepareChildForDrag(Landroid/view/View;)V

    .line 1973
    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    .line 1974
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/view/View;->setPressed(Z)V

    .line 1976
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 1979
    .local v0, canvas:Landroid/graphics/Canvas;
    const/4 v3, 0x2

    invoke-direct {p0, v1, v0, v3}, Lcom/android/launcher2/Workspace;->createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 1980
    invoke-virtual {p0, v1, p0}, Lcom/android/launcher2/Workspace;->beginDragShared(Landroid/view/View;Lcom/android/launcher2/DragSource;)V

    goto :goto_0
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 3644
    const/4 v0, 0x1

    return v0
.end method

.method public syncPageItems(IZ)V
    .locals 0
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 4069
    return-void
.end method

.method public syncPages()V
    .locals 0

    .prologue
    .line 4065
    return-void
.end method

.method public transitionStateShouldAllowDrop()Z
    .locals 2

    .prologue
    .line 2056
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->isSwitchingState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/Workspace;->mTransitionProgress:F

    const/high16 v1, 0x3f00

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mState:Lcom/android/launcher2/Workspace$State;

    sget-object v1, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public updateComponentUnreadChanged(Landroid/content/ComponentName;I)V
    .locals 16
    .parameter "component"
    .parameter "unreadNum"

    .prologue
    .line 4144
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v3

    .line 4145
    .local v3, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    const/4 v2, 0x0

    .line 4146
    .local v2, childCount:I
    const/4 v12, 0x0

    .line 4147
    .local v12, view:Landroid/view/View;
    const/4 v11, 0x0

    .line 4148
    .local v11, tag:Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v11           #tag:Ljava/lang/Object;
    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 4149
    .local v9, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 4150
    const/4 v8, 0x0

    .local v8, j:I
    :goto_0
    if-ge v8, v2, :cond_0

    .line 4151
    invoke-virtual {v9, v8}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 4152
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v11

    .line 4157
    .restart local v11       #tag:Ljava/lang/Object;
    instance-of v13, v11, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v13, :cond_2

    move-object v6, v11

    .line 4158
    check-cast v6, Lcom/android/launcher2/ShortcutInfo;

    .line 4159
    .local v6, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v7, v6, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4160
    .local v7, intent:Landroid/content/Intent;
    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    .line 4165
    .local v4, componentName:Landroid/content/ComponentName;
    if-eqz v4, :cond_1

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 4166
    const-string v13, "Workspace"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "updateComponentUnreadChanged 1: find component = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ",tag = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ",j = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ",cellX = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v6, Lcom/android/launcher2/ItemInfo;->cellX:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ",cellY = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v6, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4169
    move/from16 v0, p2

    iput v0, v6, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move-object v13, v12

    .line 4170
    check-cast v13, Lcom/android/launcher2/BubbleTextView;

    invoke-virtual {v13}, Lcom/android/launcher2/BubbleTextView;->invalidate()V

    .line 4150
    .end local v4           #componentName:Landroid/content/ComponentName;
    .end local v6           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v7           #intent:Landroid/content/Intent;
    :cond_1
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 4172
    :cond_2
    instance-of v13, v11, Lcom/android/launcher2/FolderInfo;

    if-eqz v13, :cond_1

    move-object v13, v12

    .line 4173
    check-cast v13, Lcom/android/launcher2/FolderIcon;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v1}, Lcom/android/launcher2/FolderIcon;->updateFolderUnreadNum(Landroid/content/ComponentName;I)V

    move-object v13, v12

    .line 4174
    check-cast v13, Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v13}, Lcom/android/launcher2/FolderIcon;->invalidate()V

    goto :goto_1

    .line 4180
    .end local v8           #j:I
    .end local v9           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .end local v11           #tag:Ljava/lang/Object;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v10

    .line 4181
    .local v10, openFolder:Lcom/android/launcher2/Folder;
    if-eqz v10, :cond_4

    .line 4182
    invoke-virtual {v10}, Lcom/android/launcher2/Folder;->updateContentUnreadNum()V

    .line 4184
    :cond_4
    return-void
.end method

.method protected updateCurrentPageScroll()V
    .locals 1

    .prologue
    .line 990
    invoke-super {p0}, Lcom/android/launcher2/SmoothPagedView;->updateCurrentPageScroll()V

    .line 991
    iget v0, p0, Lcom/android/launcher2/PagedView;->mCurrentPage:I

    invoke-direct {p0, v0}, Lcom/android/launcher2/Workspace;->computeWallpaperScrollRatio(I)V

    .line 992
    return-void
.end method

.method updateItemLocationsInDatabase(Lcom/android/launcher2/CellLayout;)V
    .locals 13
    .parameter "cl"

    .prologue
    .line 3620
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v10

    .line 3622
    .local v10, count:I
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v4

    .line 3623
    .local v4, screen:I
    const/16 v9, -0x64

    .line 3625
    .local v9, container:I
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3626
    const/4 v4, -0x1

    .line 3627
    const/16 v9, -0x65

    .line 3630
    :cond_0
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v10, :cond_2

    .line 3631
    invoke-virtual {p1}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 3632
    .local v12, v:Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 3634
    .local v1, info:Lcom/android/launcher2/ItemInfo;
    if-eqz v1, :cond_1

    iget-boolean v0, v1, Lcom/android/launcher2/ItemInfo;->requiresDbUpdate:Z

    if-eqz v0, :cond_1

    .line 3635
    const/4 v0, 0x0

    iput-boolean v0, v1, Lcom/android/launcher2/ItemInfo;->requiresDbUpdate:Z

    .line 3636
    iget-object v0, p0, Lcom/android/launcher2/Workspace;->mLauncher:Lcom/android/launcher2/Launcher;

    int-to-long v2, v9

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v7, v1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v8, v1, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-static/range {v0 .. v8}, Lcom/android/launcher2/LauncherModel;->modifyItemInDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIIIII)V

    .line 3630
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 3640
    .end local v1           #info:Lcom/android/launcher2/ItemInfo;
    .end local v12           #v:Landroid/view/View;
    :cond_2
    return-void
.end method

.method updateShortcuts(Ljava/util/ArrayList;)V
    .locals 19
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
    .line 4018
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v16, "Workspace"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateShortcuts: apps = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4021
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v5

    .line 4022
    .local v5, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 4023
    .local v11, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v11}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v4

    .line 4024
    .local v4, childCount:I
    const/4 v9, 0x0

    .local v9, j:I
    :goto_0
    if-ge v9, v4, :cond_0

    .line 4025
    invoke-virtual {v11, v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    .line 4026
    .local v15, view:Landroid/view/View;
    invoke-virtual {v15}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v14

    .line 4027
    .local v14, tag:Ljava/lang/Object;
    instance-of v0, v14, Lcom/android/launcher2/ShortcutInfo;

    move/from16 v16, v0

    if-eqz v16, :cond_2

    move-object v7, v14

    .line 4028
    check-cast v7, Lcom/android/launcher2/ShortcutInfo;

    .line 4032
    .local v7, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v8, v7, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4033
    .local v8, intent:Landroid/content/Intent;
    invoke-virtual {v8}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v12

    .line 4034
    .local v12, name:Landroid/content/ComponentName;
    iget v0, v7, Lcom/android/launcher2/ItemInfo;->itemType:I

    move/from16 v16, v0

    if-nez v16, :cond_2

    const-string v16, "android.intent.action.MAIN"

    invoke-virtual {v8}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_2

    if-eqz v12, :cond_2

    .line 4036
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 4037
    .local v3, appCount:I
    const/4 v10, 0x0

    .local v10, k:I
    :goto_1
    if-ge v10, v3, :cond_2

    .line 4038
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/ApplicationInfo;

    .line 4039
    .local v2, app:Lcom/android/launcher2/ApplicationInfo;
    iget-object v0, v2, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_1

    move-object v13, v15

    .line 4040
    check-cast v13, Lcom/android/launcher2/BubbleTextView;

    .line 4041
    .local v13, shortcut:Lcom/android/launcher2/BubbleTextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lcom/android/launcher2/ShortcutInfo;->updateIcon(Lcom/android/launcher2/IconCache;)V

    .line 4042
    iget-object v0, v2, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v7, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    .line 4043
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v13, v7, v0}, Lcom/android/launcher2/BubbleTextView;->applyFromShortcutInfo(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/IconCache;)V

    .line 4037
    .end local v13           #shortcut:Lcom/android/launcher2/BubbleTextView;
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 4024
    .end local v2           #app:Lcom/android/launcher2/ApplicationInfo;
    .end local v3           #appCount:I
    .end local v7           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v8           #intent:Landroid/content/Intent;
    .end local v10           #k:I
    .end local v12           #name:Landroid/content/ComponentName;
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 4050
    .end local v4           #childCount:I
    .end local v9           #j:I
    .end local v11           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .end local v14           #tag:Ljava/lang/Object;
    .end local v15           #view:Landroid/view/View;
    :cond_3
    return-void
.end method

.method public updateShortcutsAndFoldersUnread()V
    .locals 11

    .prologue
    .line 4105
    invoke-virtual {p0}, Lcom/android/launcher2/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 4106
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ShortcutAndWidgetContainer;>;"
    const/4 v0, 0x0

    .line 4107
    .local v0, childCount:I
    const/4 v9, 0x0

    .line 4108
    .local v9, view:Landroid/view/View;
    const/4 v8, 0x0

    .line 4109
    .local v8, tag:Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .end local v8           #tag:Ljava/lang/Object;
    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 4110
    .local v7, layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v7}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    .line 4111
    const/4 v6, 0x0

    .local v6, j:I
    :goto_0
    if-ge v6, v0, :cond_0

    .line 4112
    invoke-virtual {v7, v6}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 4113
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    .line 4118
    .restart local v8       #tag:Ljava/lang/Object;
    instance-of v10, v8, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v10, :cond_2

    move-object v4, v8

    .line 4119
    check-cast v4, Lcom/android/launcher2/ShortcutInfo;

    .line 4120
    .local v4, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v5, v4, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4121
    .local v5, intent:Landroid/content/Intent;
    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    .line 4122
    .local v2, componentName:Landroid/content/ComponentName;
    invoke-static {v2}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadNumberOfComponent(Landroid/content/ComponentName;)I

    move-result v10

    iput v10, v4, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move-object v10, v9

    .line 4123
    check-cast v10, Lcom/android/launcher2/BubbleTextView;

    invoke-virtual {v10}, Lcom/android/launcher2/BubbleTextView;->invalidate()V

    .line 4111
    .end local v2           #componentName:Landroid/content/ComponentName;
    .end local v4           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v5           #intent:Landroid/content/Intent;
    :cond_1
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 4124
    :cond_2
    instance-of v10, v8, Lcom/android/launcher2/FolderInfo;

    if-eqz v10, :cond_1

    move-object v10, v9

    .line 4125
    check-cast v10, Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v10}, Lcom/android/launcher2/FolderIcon;->updateFolderUnreadNum()V

    move-object v10, v9

    .line 4126
    check-cast v10, Lcom/android/launcher2/FolderIcon;

    invoke-virtual {v10}, Lcom/android/launcher2/FolderIcon;->invalidate()V

    goto :goto_1

    .line 4130
    .end local v6           #j:I
    .end local v7           #layout:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .end local v8           #tag:Ljava/lang/Object;
    :cond_3
    return-void
.end method

.method public updateWallpaperOffsetImmediately()V
    .locals 1

    .prologue
    .line 963
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 964
    return-void
.end method

.method willAddToExistingUserFolder(Ljava/lang/Object;Lcom/android/launcher2/CellLayout;[IF)Z
    .locals 7
    .parameter "dragInfo"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2182
    iget v5, p0, Lcom/android/launcher2/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v5, p4, v5

    if-lez v5, :cond_1

    .line 2198
    :cond_0
    :goto_0
    return v3

    .line 2183
    :cond_1
    aget v5, p3, v3

    aget v6, p3, v4

    invoke-virtual {p2, v5, v6}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 2185
    .local v0, dropOverView:Landroid/view/View;
    if-eqz v0, :cond_2

    .line 2186
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2187
    .local v2, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget-boolean v5, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v5, :cond_2

    iget v5, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    iget v6, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    if-ne v5, v6, :cond_0

    iget v5, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    iget v6, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v5, v6, :cond_0

    .line 2192
    .end local v2           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_2
    instance-of v5, v0, Lcom/android/launcher2/FolderIcon;

    if-eqz v5, :cond_0

    move-object v1, v0

    .line 2193
    check-cast v1, Lcom/android/launcher2/FolderIcon;

    .line 2194
    .local v1, fi:Lcom/android/launcher2/FolderIcon;
    invoke-virtual {v1, p1}, Lcom/android/launcher2/FolderIcon;->acceptDrop(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    .line 2195
    goto :goto_0
.end method

.method willCreateUserFolder(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;[IFZ)Z
    .locals 9
    .parameter "info"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "considerTimeout"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 2153
    iget v7, p0, Lcom/android/launcher2/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v7, p4, v7

    if-lez v7, :cond_1

    .line 2177
    :cond_0
    :goto_0
    return v6

    .line 2154
    :cond_1
    aget v7, p3, v6

    aget v8, p3, v5

    invoke-virtual {p2, v7, v8}, Lcom/android/launcher2/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v1

    .line 2156
    .local v1, dropOverView:Landroid/view/View;
    if-eqz v1, :cond_2

    .line 2157
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2158
    .local v3, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget-boolean v7, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v7, :cond_2

    iget v7, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    iget v8, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    if-ne v7, v8, :cond_0

    iget v7, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    iget v8, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v7, v8, :cond_0

    .line 2163
    .end local v3           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_2
    const/4 v2, 0x0

    .line 2164
    .local v2, hasntMoved:Z
    iget-object v7, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    if-eqz v7, :cond_3

    .line 2165
    iget-object v7, p0, Lcom/android/launcher2/Workspace;->mDragInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    iget-object v7, v7, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    if-ne v1, v7, :cond_6

    move v2, v5

    .line 2168
    :cond_3
    :goto_1
    if-eqz v1, :cond_0

    if-nez v2, :cond_0

    if-eqz p5, :cond_4

    iget-boolean v7, p0, Lcom/android/launcher2/Workspace;->mCreateUserFolderOnDrop:Z

    if-eqz v7, :cond_0

    .line 2172
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    instance-of v0, v7, Lcom/android/launcher2/ShortcutInfo;

    .line 2173
    .local v0, aboveShortcut:Z
    iget v7, p1, Lcom/android/launcher2/ItemInfo;->itemType:I

    if-eqz v7, :cond_5

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->itemType:I

    if-ne v7, v5, :cond_7

    :cond_5
    move v4, v5

    .line 2177
    .local v4, willBecomeShortcut:Z
    :goto_2
    if-eqz v0, :cond_8

    if-eqz v4, :cond_8

    :goto_3
    move v6, v5

    goto :goto_0

    .end local v0           #aboveShortcut:Z
    .end local v4           #willBecomeShortcut:Z
    :cond_6
    move v2, v6

    .line 2165
    goto :goto_1

    .restart local v0       #aboveShortcut:Z
    :cond_7
    move v4, v6

    .line 2173
    goto :goto_2

    .restart local v4       #willBecomeShortcut:Z
    :cond_8
    move v5, v6

    .line 2177
    goto :goto_3
.end method
