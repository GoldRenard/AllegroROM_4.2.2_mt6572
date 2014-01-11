.class public Lcom/cyanogenmod/trebuchet/Workspace;
.super Lcom/cyanogenmod/trebuchet/PagedView;
.source "Workspace.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/DropTarget;
.implements Lcom/cyanogenmod/trebuchet/DragSource;
.implements Lcom/cyanogenmod/trebuchet/DragScroller;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/cyanogenmod/trebuchet/DragController$DragListener;
.implements Lcom/cyanogenmod/trebuchet/LauncherTransitionable;
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/Workspace$13;,
        Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;,
        Lcom/cyanogenmod/trebuchet/Workspace$FolderCreationAlarmListener;,
        Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;,
        Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;,
        Lcom/cyanogenmod/trebuchet/Workspace$InverseZInterpolator;,
        Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;,
        Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;,
        Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;,
        Lcom/cyanogenmod/trebuchet/Workspace$State;
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

.field private static final DEBUG_CHANGE_STATE_ANIMATIONS:Z = false

.field private static final DEFAULT_CELL_COUNT_X:I = 0x4

.field private static final DEFAULT_CELL_COUNT_Y:I = 0x4

.field private static final DEFAULT_HOMESCREEN:I = 0x2

.field public static final DRAG_BITMAP_PADDING:I = 0x2

.field private static final DRAG_MODE_ADD_TO_FOLDER:I = 0x2

.field private static final DRAG_MODE_CREATE_FOLDER:I = 0x1

.field private static final DRAG_MODE_NONE:I = 0x0

.field private static final DRAG_MODE_REORDER:I = 0x3

.field private static final FLING_THRESHOLD_VELOCITY:I = 0x1f4

.field private static final FOLDER_CREATION_TIMEOUT:I = 0x0

.field static final MAX_SWIPE_ANGLE:F = 1.0471976f

.field private static final REORDER_TIMEOUT:I = 0xfa

.field private static final SCROLLING_INDICATOR_BOTTOM:I = 0x2

.field private static final SCROLLING_INDICATOR_DOCK:I = 0x0

.field private static final SCROLLING_INDICATOR_TOP:I = 0x1

.field static final START_DAMPING_TOUCH_SLOP_ANGLE:F = 0.5235988f

.field private static final TAG:Ljava/lang/String; = "Trebuchet.Workspace"

.field static final TOUCH_SLOP_DAMPING_FACTOR:F = 4.0f

.field private static final WORKSPACE_OVERSCROLL_ROTATION:F = 24.0f

.field private static final WORKSPACE_ROTATION:F = 12.5f

.field static mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

.field static mPortraitCellLayoutMetrics:Landroid/graphics/Rect;


# instance fields
.field private mAddToExistingFolderOnDrop:Z

.field private mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

.field mAnimatingViewIntoPlace:Z

.field private mBackground:Landroid/graphics/drawable/Drawable;

.field private mBackgroundAlpha:F

.field private mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

.field private mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

.field private final mBindPages:Ljava/lang/Runnable;

.field private final mCamera:Landroid/graphics/Camera;

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

.field private mDefaultHomescreen:I

.field private mDelayedResizeRunnable:Ljava/lang/Runnable;

.field private mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

.field private mDisplaySize:Landroid/graphics/Point;

.field private mDragController:Lcom/cyanogenmod/trebuchet/DragController;

.field private mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

.field private mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

.field private mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

.field private mDragMode:I

.field private mDragOutline:Landroid/graphics/Bitmap;

.field private mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

.field private mDragOverX:I

.field private mDragOverY:I

.field private mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

.field private mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

.field private mDragViewVisualCenter:[F

.field mDrawBackground:Z

.field private mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

.field private mFadeScrollingIndicator:Z

.field private final mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

.field private mHideDockIconLabels:Z

.field private mHideIconLabels:Z

.field private mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field private mInScrollArea:Z

.field mIsDragOccuring:Z

.field private mIsStaticWallpaper:Z

.field private mIsSwitchingState:Z

.field private mLastReorderX:I

.field private mLastReorderY:I

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private mMaxDistanceForFolderCreation:F

.field private mNewAlphas:[F

.field private mNewBackgroundAlphas:[F

.field private mNewRotationYs:[F

.field private mNewRotations:[F

.field private mNewScaleXs:[F

.field private mNewScaleYs:[F

.field private mNewTranslationXs:[F

.field private mNewTranslationYs:[F

.field private mNumberHomescreens:I

.field private mOldAlphas:[F

.field private mOldBackgroundAlphas:[F

.field private mOldRotationYs:[F

.field private mOldRotations:[F

.field private mOldScaleXs:[F

.field private mOldScaleYs:[F

.field private mOldTranslationXs:[F

.field private mOldTranslationYs:[F

.field private final mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

.field private mOverscrollFade:F

.field private mOverscrollTransformsDirty:Z

.field private mPaint:Landroid/graphics/Paint;

.field private final mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

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

.field private mRotatePivotPoint:F

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

.field private mScrollTransformsDirty:Z

.field private mScrollWallpaper:Z

.field private mScrollingIndicatorPosition:I

.field private mShowDockDivider:Z

.field private mShowHotseat:Z

.field private mShowOutlines:Z

.field private mShowScrollingIndicator:Z

.field private mShowSearchBar:Z

.field private mSpringLoadedDragController:Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

.field private mSpringLoadedShrinkFactor:F

.field private mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

.field private mStretchScreens:Z

.field private mTargetCell:[I

.field private mTempCell:[I

.field private mTempCellLayoutCenterCoordinates:[F

.field private mTempEstimate:[I

.field private final mTempFloat2:[F

.field private mTempInverseMatrix:Landroid/graphics/Matrix;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTempVisiblePagesRange:[I

.field private final mTempXY:[I

.field private mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

.field private mTransitionProgress:F

.field mUpdateWallpaperOffsetImmediately:Z

.field private mWallpaperBitmap:Landroid/graphics/Bitmap;

.field private mWallpaperHack:Z

.field mWallpaperHeight:I

.field mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

.field private final mWallpaperManager:Landroid/app/WallpaperManager;

.field private mWallpaperOffsets:[I

.field private mWallpaperScrollRatio:F

.field private mWallpaperScrollX:F

.field private mWallpaperScrollY:F

.field private mWallpaperSize:I

.field private mWallpaperTravelWidth:I

.field mWallpaperWidth:I

.field private mWindowToken:Landroid/os/IBinder;

.field private mXDown:F

.field private mYDown:F

.field private final mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

.field private final mZoomInInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 136
    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 137
    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 331
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/Workspace;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 332
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 10
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 342
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 99
    const/high16 v8, -0x4080

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    .line 104
    const/4 v8, 0x0

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineAlpha:F

    .line 110
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDrawBackground:Z

    .line 111
    const/4 v8, 0x0

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    .line 113
    const/high16 v8, 0x3f80

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollRatio:F

    .line 120
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    .line 121
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mPaint:Landroid/graphics/Paint;

    .line 132
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 133
    const/4 v8, -0x1

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverX:I

    .line 134
    const/4 v8, -0x1

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverY:I

    .line 142
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 146
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 151
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 159
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempCell:[I

    .line 160
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempEstimate:[I

    .line 161
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    .line 162
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempCellLayoutCenterCoordinates:[F

    .line 163
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 177
    sget-object v8, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    .line 178
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    .line 180
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAnimatingViewIntoPlace:Z

    .line 181
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsDragOccuring:Z

    .line 182
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenLayersEnabled:Z

    .line 185
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    .line 187
    new-instance v8, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-direct {v8}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    .line 188
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 189
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempRect:Landroid/graphics/Rect;

    .line 190
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempXY:[I

    .line 191
    const/4 v8, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempVisiblePagesRange:[I

    .line 192
    const/4 v8, 0x0

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollFade:F

    .line 193
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollTransformsDirty:Z

    .line 194
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    .line 198
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    .line 199
    new-instance v8, Landroid/graphics/Camera;

    invoke-direct {v8}, Landroid/graphics/Camera;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCamera:Landroid/graphics/Camera;

    .line 200
    const/4 v8, 0x2

    new-array v8, v8, [F

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempFloat2:[F

    .line 205
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 208
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    .line 216
    new-instance v8, Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-direct {v8}, Lcom/cyanogenmod/trebuchet/Alarm;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    .line 217
    new-instance v8, Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-direct {v8}, Lcom/cyanogenmod/trebuchet/Alarm;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    .line 218
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    .line 219
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 220
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    .line 221
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 244
    const/4 v8, 0x0

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    .line 245
    const/4 v8, -0x1

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderX:I

    .line 246
    const/4 v8, -0x1

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderY:I

    .line 249
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    .line 296
    sget-object v8, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Standard:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    .line 298
    new-instance v8, Lcom/cyanogenmod/trebuchet/Workspace$1;

    invoke-direct {v8, p0}, Lcom/cyanogenmod/trebuchet/Workspace$1;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;)V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBindPages:Ljava/lang/Runnable;

    .line 2100
    new-instance v8, Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    invoke-direct {v8}, Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;-><init>()V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mZoomInInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    .line 2101
    new-instance v8, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    const/high16 v9, 0x3f00

    invoke-direct {v8, v9}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;-><init>(F)V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    .line 2102
    new-instance v8, Landroid/view/animation/AccelerateInterpolator;

    const v9, 0x3f666666

    invoke-direct {v8, v9}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 2103
    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v9, 0x4080

    invoke-direct {v8, v9}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 343
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mContentIsRefreshable:Z

    .line 345
    new-instance v8, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    invoke-direct {v8, p1}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    .line 347
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setDataIsReady()V

    move-object v8, p1

    .line 349
    check-cast v8, Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 350
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 351
    .local v4, res:Landroid/content/res/Resources;
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHandleFadeInAdjacentScreens:Z

    .line 352
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v8

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 354
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUsePagingTouchSlop:Z

    .line 356
    const/4 v2, 0x4

    .line 357
    .local v2, cellCountX:I
    const/4 v3, 0x4

    .line 359
    .local v3, cellCountY:I
    sget-object v8, Lcom/cyanogenmod/trebuchet/R$styleable;->Workspace:[I

    const/4 v9, 0x0

    invoke-virtual {p1, p2, v8, p3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 362
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 363
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getCellCountsForLarge(Landroid/content/Context;)[I

    move-result-object v1

    .line 364
    .local v1, cellCount:[I
    const/4 v8, 0x0

    aget v2, v1, v8

    .line 365
    const/4 v8, 0x1

    aget v3, v1, v8

    .line 368
    .end local v1           #cellCount:[I
    :cond_0
    const v8, 0x7f0c0003

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x42c8

    div-float/2addr v8, v9

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedShrinkFactor:F

    .line 370
    const v8, 0x7f0c0017

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCameraDistance:I

    .line 373
    const/4 v8, 0x0

    invoke-virtual {v0, v8, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 374
    const/4 v8, 0x1

    invoke-virtual {v0, v8, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 375
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 377
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 380
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0b0007

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    .line 381
    :cond_1
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getCellCountX(I)I

    move-result v2

    .line 382
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getCellCountY(I)I

    move-result v3

    .line 385
    :cond_2
    invoke-static {v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateWorkspaceLayoutCells(II)V

    .line 386
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->setHapticFeedbackEnabled(Z)V

    .line 389
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getNumberHomescreens()I

    move-result v8

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    .line 390
    const/4 v8, 0x2

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getDefaultHomescreen(I)I

    move-result v8

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    .line 391
    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    iget v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    if-lt v8, v9, :cond_3

    .line 392
    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    div-int/lit8 v8, v8, 0x2

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    .line 395
    :cond_3
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getStretchScreens()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mStretchScreens:Z

    .line 397
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0b0007

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    .line 398
    .local v7, workspaceTabletGrid:Z
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_4

    if-nez v7, :cond_4

    .line 399
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mStretchScreens:Z

    .line 401
    :cond_4
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getShowSearchBar()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowSearchBar:Z

    .line 402
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getShowDock()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowHotseat:Z

    .line 403
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getHideIconLabels()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    .line 404
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getShowDock()Z

    move-result v5

    .line 405
    .local v5, showHotseat:Z
    const v8, 0x7f0b000a

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->orientation:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_7

    const/4 v6, 0x1

    .line 408
    .local v6, verticalHotseat:Z
    :goto_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getHideIconLabels()Z

    move-result v8

    if-nez v8, :cond_5

    if-eqz v5, :cond_5

    if-eqz v6, :cond_8

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-nez v8, :cond_8

    :cond_5
    const/4 v8, 0x1

    :goto_1
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideDockIconLabels:Z

    .line 410
    const v8, 0x7f09007a

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getTransitionEffect(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-result-object v8

    iput-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    .line 412
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getScrollWallpaper()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    .line 413
    const v8, 0x7f0b0009

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getWallpaperHack(Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHack:Z

    .line 415
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getWallpaperSize()I

    move-result v8

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperSize:I

    .line 416
    const v8, 0x7f0b0006

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getShowOutlines(Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowOutlines:Z

    .line 418
    const v8, 0x7f0b0005

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    invoke-static {v8}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;->getFadeInAdjacentScreens(Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    .line 420
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Indicator;->getShowScrollingIndicator()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowScrollingIndicator:Z

    .line 421
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Indicator;->getFadeScrollingIndicator()Z

    move-result v8

    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeScrollingIndicator:Z

    .line 422
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Indicator;->getScrollingIndicatorPosition()I

    move-result v8

    iput v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollingIndicatorPosition:I

    .line 423
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getShowDivider()Z

    move-result v8

    if-eqz v8, :cond_9

    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowHotseat:Z

    if-eqz v8, :cond_9

    const/4 v8, 0x1

    :goto_2
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowDockDivider:Z

    .line 425
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->initWorkspace()V

    .line 426
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->checkWallpaper()V

    .line 429
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->setMotionEventSplittingEnabled(Z)V

    .line 432
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getImportantForAccessibility()I

    move-result v8

    if-nez v8, :cond_6

    .line 433
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->setImportantForAccessibility(I)V

    .line 435
    :cond_6
    return-void

    .line 405
    .end local v6           #verticalHotseat:Z
    :cond_7
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 408
    .restart local v6       #verticalHotseat:Z
    :cond_8
    const/4 v8, 0x0

    goto :goto_1

    .line 423
    :cond_9
    const/4 v8, 0x0

    goto :goto_2
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    return-object v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/Workspace;)Landroid/app/WallpaperManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/cyanogenmod/trebuchet/Workspace;IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"

    .prologue
    .line 79
    invoke-direct/range {p0 .. p6}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1202(Lcom/cyanogenmod/trebuchet/Workspace;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderX:I

    return p1
.end method

.method static synthetic access$1302(Lcom/cyanogenmod/trebuchet/Workspace;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderY:I

    return p1
.end method

.method static synthetic access$1400(Lcom/cyanogenmod/trebuchet/Workspace;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/DragController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/Workspace;)Landroid/graphics/Point;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldBackgroundAlphas:[F

    return-object v0
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F

    return-object v0
.end method

.method static synthetic access$502(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/Workspace;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    return-object v0
.end method

.method static synthetic access$702(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    return-object p1
.end method

.method static synthetic access$800(Lcom/cyanogenmod/trebuchet/Workspace;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    return-object v0
.end method

.method static synthetic access$802(Lcom/cyanogenmod/trebuchet/Workspace;[I)[I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    return-object p1
.end method

.method static synthetic access$900(Lcom/cyanogenmod/trebuchet/Workspace;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    return-object v0
.end method

.method private animateBackgroundGradient(FZ)V
    .locals 4
    .parameter "finalAlpha"
    .parameter "animated"

    .prologue
    const/4 v2, 0x0

    .line 1357
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1

    .line 1382
    :cond_0
    :goto_0
    return-void

    .line 1358
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_2

    .line 1359
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1360
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeInAnimation:Landroid/animation/ValueAnimator;

    .line 1362
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_3

    .line 1363
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1364
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    .line 1366
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getBackgroundAlpha()F

    move-result v0

    .line 1367
    .local v0, startAlpha:F
    cmpl-float v1, p1, v0

    if-eqz v1, :cond_0

    .line 1368
    if-eqz p2, :cond_4

    .line 1369
    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput v0, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    .line 1370
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/cyanogenmod/trebuchet/Workspace$3;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/Workspace$3;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1375
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x3fc0

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1376
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x15e

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1377
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundFadeOutAnimation:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 1379
    :cond_4
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->setBackgroundAlpha(F)V

    goto :goto_0
.end method

.method private centerWallpaperOffset()V
    .locals 4

    .prologue
    const/high16 v0, 0x3f00

    .line 1098
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    .line 1099
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    .line 1100
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 1101
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V

    .line 1103
    :cond_0
    return-void
.end method

.method private cleanupAddToFolder()V
    .locals 1

    .prologue
    .line 3250
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v0, :cond_0

    .line 3251
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDragExit()V

    .line 3252
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 3254
    :cond_0
    return-void
.end method

.method private cleanupFolderCreation()V
    .locals 1

    .prologue
    .line 3243
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    if-eqz v0, :cond_0

    .line 3244
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->animateToNaturalState()V

    .line 3246
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 3247
    return-void
.end method

.method private cleanupReorder(Z)V
    .locals 2
    .parameter "cancelAlarm"

    .prologue
    const/4 v1, -0x1

    .line 3258
    if-eqz p1, :cond_0

    .line 3259
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 3261
    :cond_0
    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderX:I

    .line 3262
    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderY:I

    .line 3263
    return-void
.end method

.method private computeWallpaperScrollRatio(I)V
    .locals 6
    .parameter "page"

    .prologue
    const/high16 v5, 0x3f80

    .line 1166
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1167
    .local v0, layoutScale:F
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getRelativeChildOffset(I)I

    move-result v4

    sub-int v1, v3, v4

    .line 1168
    .local v1, scaled:I
    iput v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1169
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildOffset(I)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getRelativeChildOffset(I)I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v2, v3

    .line 1170
    .local v2, unscaled:F
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1171
    if-lez v1, :cond_0

    .line 1172
    mul-float v3, v5, v2

    int-to-float v4, v1

    div-float/2addr v3, v4

    iput v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollRatio:F

    .line 1176
    :goto_0
    return-void

    .line 1174
    :cond_0
    iput v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollRatio:F

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
    .line 2572
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x1060012

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .line 2573
    .local v5, outlineColor:I
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 2574
    .local v3, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v3}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2576
    new-instance v12, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-direct {v12, v2, v4, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2577
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

    .line 2579
    .local v9, scaleFactor:F
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v9

    float-to-int v11, v2

    .line 2580
    .local v11, scaledWidth:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v9

    float-to-int v10, v2

    .line 2581
    .local v10, scaledHeight:I
    new-instance v8, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-direct {v8, v2, v4, v11, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2584
    .local v8, dst:Landroid/graphics/Rect;
    sub-int v2, p4, v11

    div-int/lit8 v2, v2, 0x2

    sub-int v4, p5, v10

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v8, v2, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 2586
    const/4 v2, 0x0

    invoke-virtual {p2, p1, v12, v8, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 2587
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    move-object v4, p2

    move v6, v5

    move/from16 v7, p6

    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;->applyMediumExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;IIZ)V

    .line 2589
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2591
    return-object v3
.end method

.method private createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "v"
    .parameter "canvas"
    .parameter "padding"

    .prologue
    .line 2555
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1060012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 2556
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

    .line 2559
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2560
    const/4 v2, 0x1

    invoke-direct {p0, p1, p2, p3, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->drawDragView(Landroid/view/View;Landroid/graphics/Canvas;IZ)V

    .line 2561
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-virtual {v2, v0, p2, v1, v1}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;->applyMediumExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)V

    .line 2562
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2563
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

    .line 2485
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempRect:Landroid/graphics/Rect;

    .line 2486
    .local v0, clipRect:Landroid/graphics/Rect;
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 2488
    const/4 v2, 0x0

    .line 2490
    .local v2, textVisible:Z
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 2491
    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_1

    if-eqz p4, :cond_1

    .line 2492
    check-cast p1, Landroid/widget/TextView;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aget-object v1, v4, v7

    .line 2493
    .local v1, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    add-int/2addr v4, p3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    add-int/2addr v5, p3

    invoke-virtual {v0, v6, v6, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 2494
    div-int/lit8 v4, p3, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, p3, 0x2

    int-to-float v5, v5

    invoke-virtual {p2, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2495
    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 2524
    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 2525
    return-void

    .line 2497
    .restart local p1
    :cond_1
    instance-of v4, p1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v4, :cond_3

    .line 2498
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    if-nez v4, :cond_2

    move-object v4, p1

    .line 2501
    check-cast v4, Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getTextVisible()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v4, p1

    .line 2502
    check-cast v4, Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v4, v6}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    .line 2503
    const/4 v2, 0x1

    .line 2515
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

    .line 2516
    sget-object v4, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p2, v0, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 2517
    invoke-virtual {p1, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2520
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    if-nez v4, :cond_0

    if-eqz v2, :cond_0

    .line 2521
    check-cast p1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .end local p1
    invoke-virtual {p1, v7}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    goto :goto_0

    .line 2506
    .restart local p1
    :cond_3
    instance-of v4, p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v4, :cond_4

    move-object v3, p1

    .line 2507
    check-cast v3, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 2508
    .local v3, tv:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getExtendedPaddingTop()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/text/Layout;->getLineTop(I)I

    move-result v5

    add-int/2addr v4, v5

    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    .line 2510
    .end local v3           #tv:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    :cond_4
    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_2

    move-object v3, p1

    .line 2511
    check-cast v3, Landroid/widget/TextView;

    .line 2512
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
    .line 1989
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenLayersEnabled:Z

    if-eqz v5, :cond_6

    .line 1990
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    .line 1991
    .local v4, screenCount:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempVisiblePagesRange:[I

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->getVisiblePages([I)V

    .line 1992
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempVisiblePagesRange:[I

    const/4 v6, 0x0

    aget v2, v5, v6

    .line 1993
    .local v2, leftScreen:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempVisiblePagesRange:[I

    const/4 v6, 0x1

    aget v3, v5, v6

    .line 1994
    .local v3, rightScreen:I
    if-ne v2, v3, :cond_0

    .line 1996
    add-int/lit8 v5, v4, -0x1

    if-ge v3, v5, :cond_3

    .line 1997
    add-int/lit8 v3, v3, 0x1

    .line 2002
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v4, :cond_4

    .line 2003
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2004
    .local v1, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-gt v2, v0, :cond_1

    if-gt v0, v3, :cond_1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->shouldDrawChild(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 2005
    :cond_1
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->disableHardwareLayers()V

    .line 2002
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1998
    .end local v0           #i:I
    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_3
    if-lez v2, :cond_0

    .line 1999
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 2008
    .restart local v0       #i:I
    :cond_4
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v4, :cond_6

    .line 2009
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2010
    .restart local v1       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-gt v2, v0, :cond_5

    if-gt v0, v3, :cond_5

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->shouldDrawChild(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 2011
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->enableHardwareLayers()V

    .line 2008
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 2015
    .end local v0           #i:I
    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #leftScreen:I
    .end local v3           #rightScreen:I
    .end local v4           #screenCount:I
    :cond_6
    return-void
.end method

.method private findMatchingPageForDragOver(FFZ)Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 10
    .parameter "originX"
    .parameter "originY"
    .parameter "exact"

    .prologue
    .line 3350
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    .line 3351
    .local v5, screenCount:I
    const/4 v0, 0x0

    .line 3352
    .local v0, bestMatchingScreen:Lcom/cyanogenmod/trebuchet/CellLayout;
    const v6, 0x7f7fffff

    .line 3354
    .local v6, smallestDistSoFar:F
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v5, :cond_2

    .line 3355
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3357
    .local v2, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/4 v8, 0x2

    new-array v7, v8, [F

    const/4 v8, 0x0

    aput p1, v7, v8

    const/4 v8, 0x1

    aput p2, v7, v8

    .line 3360
    .local v7, touchXy:[F
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 3361
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v2, v7, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 3363
    const/4 v8, 0x0

    aget v8, v7, v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_0

    const/4 v8, 0x0

    aget v8, v7, v8

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_0

    const/4 v8, 0x1

    aget v8, v7, v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_0

    const/4 v8, 0x1

    aget v8, v7, v8

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_0

    .line 3388
    .end local v2           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #touchXy:[F
    :goto_1
    return-object v2

    .line 3368
    .restart local v2       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v7       #touchXy:[F
    :cond_0
    if-nez p3, :cond_1

    .line 3370
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempCellLayoutCenterCoordinates:[F

    .line 3371
    .local v1, cellLayoutCenter:[F
    const/4 v8, 0x0

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    aput v9, v1, v8

    .line 3372
    const/4 v8, 0x1

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    aput v9, v1, v8

    .line 3373
    invoke-virtual {p0, v2, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromChildToSelf(Landroid/view/View;[F)V

    .line 3375
    const/4 v8, 0x0

    aput p1, v7, v8

    .line 3376
    const/4 v8, 0x1

    aput p2, v7, v8

    .line 3380
    const/4 v8, 0x0

    invoke-static {v7, v1, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->squaredDistance([F[FZ)F

    move-result v3

    .line 3382
    .local v3, dist:F
    cmpg-float v8, v3, v6

    if-gez v8, :cond_1

    .line 3383
    move v6, v3

    .line 3384
    move-object v0, v2

    .line 3354
    .end local v1           #cellLayoutCenter:[F
    .end local v3           #dist:F
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v2           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #touchXy:[F
    :cond_2
    move-object v2, v0

    .line 3388
    goto :goto_1
.end method

.method private findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I
    .locals 6
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "layout"
    .parameter "recycle"

    .prologue
    .line 4026
    move-object v0, p5

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v0

    return-object v0
.end method

.method public static getCellCountsForLarge(Landroid/content/Context;)[I
    .locals 11
    .parameter "context"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 438
    const/4 v7, 0x2

    new-array v2, v7, [I

    .line 440
    .local v2, cellCount:[I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 445
    .local v4, res:Landroid/content/res/Resources;
    new-array v7, v9, [I

    const v8, 0x10102eb

    aput v8, v7, v10

    invoke-virtual {p0, v7}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 447
    .local v1, actionBarSizeTypedArray:Landroid/content/res/TypedArray;
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 448
    .local v3, displayMetrics:Landroid/util/DisplayMetrics;
    const/4 v7, 0x0

    invoke-virtual {v1, v10, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    .line 449
    .local v0, actionBarHeight:F
    const v7, 0x7f0d0031

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v6

    .line 450
    .local v6, systemBarHeight:F
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    int-to-float v7, v7

    iget v8, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float v5, v7, v8

    .line 453
    .local v5, smallestScreenDim:F
    aput v9, v2, v10

    .line 454
    :goto_0
    aget v7, v2, v10

    add-int/lit8 v7, v7, 0x1

    invoke-static {v4, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->widthInPortrait(Landroid/content/res/Resources;I)I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v7, v5

    if-gtz v7, :cond_0

    .line 455
    aget v7, v2, v10

    add-int/lit8 v7, v7, 0x1

    aput v7, v2, v10

    goto :goto_0

    .line 458
    :cond_0
    aput v9, v2, v9

    .line 460
    :goto_1
    aget v7, v2, v9

    add-int/lit8 v7, v7, 0x1

    invoke-static {v4, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->heightInLandscape(Landroid/content/res/Resources;I)I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v0

    sub-float v8, v5, v6

    cmpg-float v7, v7, v8

    if-gtz v7, :cond_1

    .line 461
    aget v7, v2, v9

    add-int/lit8 v7, v7, 0x1

    aput v7, v2, v9

    goto :goto_1

    .line 463
    :cond_1
    return-object v2
.end method

.method static getCellLayoutMetrics(Lcom/cyanogenmod/trebuchet/Launcher;I)Landroid/graphics/Rect;
    .locals 14
    .parameter "launcher"
    .parameter "orientation"

    .prologue
    .line 3113
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3114
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 3115
    .local v7, display:Landroid/view/Display;
    new-instance v13, Landroid/graphics/Point;

    invoke-direct {v13}, Landroid/graphics/Point;-><init>()V

    .line 3116
    .local v13, smallestSize:Landroid/graphics/Point;
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    .line 3117
    .local v8, largestSize:Landroid/graphics/Point;
    invoke-virtual {v7, v13, v8}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 3118
    if-nez p1, :cond_1

    .line 3119
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 3120
    const v0, 0x7f0d004e

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 3121
    .local v10, paddingLeft:I
    const v0, 0x7f0d0050

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 3122
    .local v11, paddingRight:I
    const v0, 0x7f0d0052

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 3123
    .local v12, paddingTop:I
    const v0, 0x7f0d0055

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 3124
    .local v9, paddingBottom:I
    iget v0, v8, Landroid/graphics/Point;->x:I

    sub-int/2addr v0, v10

    sub-int v2, v0, v11

    .line 3125
    .local v2, width:I
    iget v0, v13, Landroid/graphics/Point;->y:I

    sub-int/2addr v0, v12

    sub-int v3, v0, v9

    .line 3126
    .local v3, height:I
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 3127
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v4

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v5

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMetrics(Landroid/graphics/Rect;Landroid/content/res/Resources;IIIII)V

    .line 3131
    .end local v2           #width:I
    .end local v3           #height:I
    .end local v9           #paddingBottom:I
    .end local v10           #paddingLeft:I
    .end local v11           #paddingRight:I
    .end local v12           #paddingTop:I
    :cond_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLandscapeCellLayoutMetrics:Landroid/graphics/Rect;

    .line 3147
    :goto_0
    return-object v0

    .line 3132
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    .line 3133
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    if-nez v0, :cond_2

    .line 3134
    const v0, 0x7f0d004e

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 3135
    .restart local v10       #paddingLeft:I
    const v0, 0x7f0d0050

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 3136
    .restart local v11       #paddingRight:I
    const v0, 0x7f0d0052

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 3137
    .restart local v12       #paddingTop:I
    const v0, 0x7f0d0055

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 3138
    .restart local v9       #paddingBottom:I
    iget v0, v13, Landroid/graphics/Point;->x:I

    sub-int/2addr v0, v10

    sub-int v2, v0, v11

    .line 3139
    .restart local v2       #width:I
    iget v0, v8, Landroid/graphics/Point;->y:I

    sub-int/2addr v0, v12

    sub-int v3, v0, v9

    .line 3140
    .restart local v3       #height:I
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    .line 3141
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v4

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v5

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMetrics(Landroid/graphics/Rect;Landroid/content/res/Resources;IIIII)V

    .line 3145
    .end local v2           #width:I
    .end local v3           #height:I
    .end local v9           #paddingBottom:I
    .end local v10           #paddingLeft:I
    .end local v11           #paddingRight:I
    .end local v12           #paddingTop:I
    :cond_2
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace;->mPortraitCellLayoutMetrics:Landroid/graphics/Rect;

    goto :goto_0

    .line 3147
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F
    .locals 5
    .parameter "x"
    .parameter "y"
    .parameter "xOffset"
    .parameter "yOffset"
    .parameter "dragView"
    .parameter "recycle"

    .prologue
    .line 3398
    if-nez p6, :cond_0

    .line 3399
    const/4 v3, 0x2

    new-array v1, v3, [F

    .line 3406
    .local v1, res:[F
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0033

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr p1, v3

    .line 3407
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0034

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    add-int/2addr p2, v3

    .line 3413
    sub-int v0, p1, p3

    .line 3414
    .local v0, left:I
    sub-int v2, p2, p4

    .line 3417
    .local v2, top:I
    const/4 v3, 0x0

    invoke-virtual {p5}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    int-to-float v4, v4

    aput v4, v1, v3

    .line 3418
    const/4 v3, 0x1

    invoke-virtual {p5}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v2

    int-to-float v4, v4

    aput v4, v1, v3

    .line 3420
    return-object v1

    .line 3401
    .end local v0           #left:I
    .end local v1           #res:[F
    .end local v2           #top:I
    :cond_0
    move-object v1, p6

    .restart local v1       #res:[F
    goto :goto_0
.end method

.method private getFinalPositionForDropAnimation([I[FLcom/cyanogenmod/trebuchet/DragView;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/ItemInfo;[IZ)V
    .locals 10
    .parameter "loc"
    .parameter "scaleXY"
    .parameter "dragView"
    .parameter "layout"
    .parameter "info"
    .parameter "targetCell"
    .parameter "scale"

    .prologue
    .line 3893
    iget v4, p5, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 3894
    .local v4, spanX:I
    iget v5, p5, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 3896
    .local v5, spanY:I
    const/4 v0, 0x0

    aget v2, p6, v0

    const/4 v0, 0x1

    aget v3, p6, v0

    move-object v0, p0

    move-object v1, p4

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemPosition(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)Landroid/graphics/Rect;

    move-result-object v9

    .line 3897
    .local v9, r:Landroid/graphics/Rect;
    const/4 v0, 0x0

    iget v1, v9, Landroid/graphics/Rect;->left:I

    aput v1, p1, v0

    .line 3898
    const/4 v0, 0x1

    iget v1, v9, Landroid/graphics/Rect;->top:I

    aput v1, p1, v0

    .line 3900
    invoke-virtual {p0, p4}, Lcom/cyanogenmod/trebuchet/Workspace;->setFinalTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3901
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p4, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    move-result v6

    .line 3903
    .local v6, cellLayoutScale:F
    invoke-virtual {p0, p4}, Lcom/cyanogenmod/trebuchet/Workspace;->resetTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3907
    if-eqz p7, :cond_0

    .line 3908
    const/high16 v0, 0x3f80

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-virtual {p3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    div-float v7, v0, v1

    .line 3909
    .local v7, dragViewScaleX:F
    const/high16 v0, 0x3f80

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-virtual {p3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v8, v0, v1

    .line 3917
    .local v8, dragViewScaleY:F
    :goto_0
    const/4 v0, 0x0

    aget v1, p1, v0

    int-to-float v1, v1

    invoke-virtual {p3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    sub-float/2addr v2, v3

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    float-to-int v1, v1

    aput v1, p1, v0

    .line 3918
    const/4 v0, 0x1

    aget v1, p1, v0

    int-to-float v1, v1

    invoke-virtual {p3}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    sub-float/2addr v2, v3

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    float-to-int v1, v1

    aput v1, p1, v0

    .line 3920
    const/4 v0, 0x0

    mul-float v1, v7, v6

    aput v1, p2, v0

    .line 3921
    const/4 v0, 0x1

    mul-float v1, v8, v6

    aput v1, p2, v0

    .line 3922
    return-void

    .line 3911
    .end local v7           #dragViewScaleX:F
    .end local v8           #dragViewScaleY:F
    :cond_0
    const/high16 v7, 0x3f80

    .line 3912
    .restart local v7       #dragViewScaleX:F
    const/high16 v8, 0x3f80

    .restart local v8       #dragViewScaleY:F
    goto :goto_0
.end method

.method private getScrollRange()I
    .locals 2

    .prologue
    .line 1023
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildOffset(I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildOffset(I)I

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

    .line 749
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 750
    .local v1, page:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 751
    const/4 v4, 0x2

    new-array v0, v4, [F

    aput p2, v0, v3

    aput p3, v0, v2

    .line 752
    .local v0, localXY:[F
    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[F)V

    .line 753
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

    .line 756
    .end local v0           #localXY:[F
    :goto_0
    return v2

    .restart local v0       #localXY:[F
    :cond_0
    move v2, v3

    .line 753
    goto :goto_0

    .end local v0           #localXY:[F
    :cond_1
    move v2, v3

    .line 756
    goto :goto_0
.end method

.method private initAnimationArrays()V
    .locals 2

    .prologue
    .line 2136
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    .line 2137
    .local v0, childCount:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldTranslationXs:[F

    if-eqz v1, :cond_0

    .line 2154
    :goto_0
    return-void

    .line 2138
    :cond_0
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldTranslationXs:[F

    .line 2139
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldTranslationYs:[F

    .line 2140
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldScaleXs:[F

    .line 2141
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldScaleYs:[F

    .line 2142
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldBackgroundAlphas:[F

    .line 2143
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldAlphas:[F

    .line 2144
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldRotations:[F

    .line 2145
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldRotationYs:[F

    .line 2146
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationXs:[F

    .line 2147
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationYs:[F

    .line 2148
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleXs:[F

    .line 2149
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleYs:[F

    .line 2150
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F

    .line 2151
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    .line 2152
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotations:[F

    .line 2153
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotationYs:[F

    goto :goto_0
.end method

.method private isDragWidget(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 3424
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isExternalDragWidget(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 3428
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    if-eq v0, p0, :cond_0

    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->isDragWidget(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private manageFolderFeedback(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFLandroid/view/View;)V
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

    .line 3554
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/Workspace;->willCreateUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFZ)Z

    move-result v6

    .line 3557
    .local v6, userFolderPending:Z
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-nez v0, :cond_1

    if-eqz v6, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->alarmPending()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3559
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    new-instance v1, Lcom/cyanogenmod/trebuchet/Workspace$FolderCreationAlarmListener;

    aget v2, p3, v5

    aget v3, p3, v8

    invoke-direct {v1, p0, p2, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace$FolderCreationAlarmListener;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/CellLayout;II)V

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Alarm;->setOnAlarmListener(Lcom/cyanogenmod/trebuchet/OnAlarmListener;)V

    .line 3561
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFolderCreationAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Alarm;->setAlarm(J)V

    .line 3584
    .end local p5
    :cond_0
    :goto_0
    return-void

    .line 3565
    .restart local p5
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/Workspace;->willAddToExistingUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IF)Z

    move-result v7

    .line 3568
    .local v7, willAddToFolder:Z
    if-eqz v7, :cond_3

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-nez v0, :cond_3

    .line 3569
    check-cast p5, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .end local p5
    iput-object p5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 3570
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverFolderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDragEnter(Ljava/lang/Object;)V

    .line 3571
    if-eqz p2, :cond_2

    .line 3572
    invoke-virtual {p2}, Lcom/cyanogenmod/trebuchet/CellLayout;->clearDragOutlines()V

    .line 3574
    :cond_2
    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->setDragMode(I)V

    goto :goto_0

    .line 3578
    .restart local p5
    :cond_3
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-ne v0, v9, :cond_4

    if-nez v7, :cond_4

    .line 3579
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setDragMode(I)V

    .line 3581
    :cond_4
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-ne v0, v8, :cond_0

    if-nez v6, :cond_0

    .line 3582
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setDragMode(I)V

    goto :goto_0
.end method

.method private onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;Z)V
    .locals 6
    .parameter "touchXY"
    .parameter "dragInfo"
    .parameter "cellLayout"
    .parameter "insertAtFirst"

    .prologue
    .line 3674
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 3675
    return-void
.end method

.method private onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 55
    .parameter "touchXY"
    .parameter "dragInfo"
    .parameter "cellLayout"
    .parameter "insertAtFirst"
    .parameter "d"

    .prologue
    .line 3687
    new-instance v50, Lcom/cyanogenmod/trebuchet/Workspace$8;

    move-object/from16 v0, v50

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace$8;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;)V

    .local v50, exitSpringLoadedRunnable:Ljava/lang/Runnable;
    move-object/from16 v30, p2

    .line 3694
    check-cast v30, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3695
    .local v30, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v30

    iget v5, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 3696
    .local v5, spanX:I
    move-object/from16 v0, v30

    iget v6, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 3697
    .local v6, spanY:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v2, :cond_0

    .line 3698
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v5, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    .line 3699
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v6, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    .line 3702
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_c

    const-wide/16 v26, -0x65

    .line 3705
    .local v26, container:J
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v28

    .line 3709
    .local v28, screen:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-eq v2, v3, :cond_1

    .line 3710
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_e

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v0, v28

    if-eq v0, v2, :cond_e

    .line 3711
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    .line 3718
    :cond_1
    :goto_2
    move-object/from16 v0, v30

    instance-of v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    if-eqz v2, :cond_10

    move-object/from16 v24, p2

    .line 3719
    check-cast v24, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    .line 3721
    .local v24, pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    const/16 v51, 0x1

    .line 3722
    .local v51, findNearestVacantCell:Z
    move-object/from16 v0, v24

    iget v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    move-object/from16 v0, v24

    iget v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 3724
    :cond_2
    const/4 v2, 0x0

    aget v3, p1, v2

    const/4 v2, 0x1

    aget v4, p1, v2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 3726
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v11

    .line 3728
    .local v11, distance:F
    move-object/from16 v0, p5

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v8, Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v12, 0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p3

    invoke-virtual/range {v7 .. v12}, Lcom/cyanogenmod/trebuchet/Workspace;->willCreateUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFZ)Z

    move-result v2

    if-nez v2, :cond_3

    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v2, v1, v3, v11}, Lcom/cyanogenmod/trebuchet/Workspace;->willAddToExistingUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IF)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3731
    :cond_3
    const/16 v51, 0x0

    .line 3735
    .end local v11           #distance:F
    :cond_4
    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3736
    .local v25, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    const/16 v54, 0x0

    .line 3737
    .local v54, updateWidgetSize:Z
    if-eqz v51, :cond_8

    .line 3738
    move-object/from16 v0, v25

    iget v15, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 3739
    .local v15, minSpanX:I
    move-object/from16 v0, v25

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v16, v0

    .line 3740
    .local v16, minSpanY:I
    move-object/from16 v0, v25

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    if-lez v2, :cond_5

    move-object/from16 v0, v25

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    if-lez v2, :cond_5

    .line 3741
    move-object/from16 v0, v25

    iget v15, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    .line 3742
    move-object/from16 v0, v25

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    move/from16 v16, v0

    .line 3744
    :cond_5
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 v21, v0

    .line 3745
    .local v21, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v13, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v14, v2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v17, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v20, v0

    const/16 v22, 0x2

    move-object/from16 v12, p3

    invoke-virtual/range {v12 .. v22}, Lcom/cyanogenmod/trebuchet/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 3749
    const/4 v2, 0x0

    aget v2, v21, v2

    move-object/from16 v0, v25

    iget v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    if-ne v2, v3, :cond_6

    const/4 v2, 0x1

    aget v2, v21, v2

    move-object/from16 v0, v25

    iget v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    if-eq v2, v3, :cond_7

    .line 3750
    :cond_6
    const/16 v54, 0x1

    .line 3752
    :cond_7
    const/4 v2, 0x0

    aget v2, v21, v2

    move-object/from16 v0, v25

    iput v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 3753
    const/4 v2, 0x1

    aget v2, v21, v2

    move-object/from16 v0, v25

    iput v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 3756
    .end local v15           #minSpanX:I
    .end local v16           #minSpanY:I
    .end local v21           #resultSpan:[I
    :cond_8
    new-instance v22, Lcom/cyanogenmod/trebuchet/Workspace$9;

    move-object/from16 v23, p0

    invoke-direct/range {v22 .. v28}, Lcom/cyanogenmod/trebuchet/Workspace$9;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;Lcom/cyanogenmod/trebuchet/ItemInfo;JI)V

    .line 3779
    .local v22, onAnimationCompleteRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, v24

    iget v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_f

    move-object/from16 v2, v24

    check-cast v2, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget-object v0, v2, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v35, v0

    .line 3782
    .local v35, finalView:Landroid/view/View;
    :goto_3
    move-object/from16 v0, v35

    instance-of v2, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v2, :cond_9

    if-eqz v54, :cond_9

    move-object/from16 v49, v35

    .line 3783
    check-cast v49, Landroid/appwidget/AppWidgetHostView;

    .line 3784
    .local v49, awhv:Landroid/appwidget/AppWidgetHostView;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, v25

    iget v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move-object/from16 v0, v25

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move-object/from16 v0, v49

    invoke-static {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/cyanogenmod/trebuchet/Launcher;II)V

    .line 3788
    .end local v49           #awhv:Landroid/appwidget/AppWidgetHostView;
    :cond_9
    const/16 v34, 0x0

    .line 3789
    .local v34, animationStyle:I
    move-object/from16 v0, v24

    iget v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_a

    check-cast v24, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .end local v24           #pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v2, :cond_a

    .line 3791
    const/16 v34, 0x1

    .line 3793
    :cond_a
    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v32, v0

    const/16 v36, 0x1

    move-object/from16 v29, p0

    move-object/from16 v31, p3

    move-object/from16 v33, v22

    invoke-virtual/range {v29 .. v36}, Lcom/cyanogenmod/trebuchet/Workspace;->animateWidgetDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 3866
    .end local v22           #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .end local v25           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v34           #animationStyle:I
    .end local v35           #finalView:Landroid/view/View;
    .end local v51           #findNearestVacantCell:Z
    .end local v54           #updateWidgetSize:Z
    :cond_b
    :goto_4
    return-void

    .line 3702
    .end local v26           #container:J
    .end local v28           #screen:I
    :cond_c
    const-wide/16 v26, -0x64

    goto/16 :goto_0

    .line 3705
    .restart local v26       #container:J
    :cond_d
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v28

    goto/16 :goto_1

    .line 3712
    .restart local v28       #screen:I
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCurrentPage()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v2

    move/from16 v0, v28

    if-eq v0, v2, :cond_1

    .line 3714
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move/from16 v0, v28

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->snapToPage(I)V

    goto/16 :goto_2

    .line 3779
    .restart local v22       #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .restart local v24       #pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    .restart local v25       #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v51       #findNearestVacantCell:Z
    .restart local v54       #updateWidgetSize:Z
    :cond_f
    const/16 v35, 0x0

    goto/16 :goto_3

    .line 3799
    .end local v22           #onAnimationCompleteRunnable:Ljava/lang/Runnable;
    .end local v24           #pendingInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    .end local v25           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v51           #findNearestVacantCell:Z
    .end local v54           #updateWidgetSize:Z
    :cond_10
    move-object/from16 v0, v30

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    packed-switch v2, :pswitch_data_0

    .line 3816
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown item type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v30

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3803
    :pswitch_0
    move-object/from16 v0, v30

    iget-wide v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v7, -0x1

    cmp-long v2, v2, v7

    if-nez v2, :cond_11

    move-object/from16 v0, v30

    instance-of v2, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    if-eqz v2, :cond_11

    .line 3805
    new-instance v52, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    check-cast v30, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .end local v30           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v52

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;-><init>(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V

    .local v52, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v30, v52

    .line 3807
    .end local v52           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v30       #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v4, 0x7f040003

    move-object/from16 v2, v30

    check-cast v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-object/from16 v0, p3

    invoke-virtual {v3, v4, v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v37

    .line 3821
    .local v37, view:Landroid/view/View;
    :goto_5
    if-eqz p1, :cond_12

    .line 3822
    const/4 v2, 0x0

    aget v3, p1, v2

    const/4 v2, 0x1

    aget v4, p1, v2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 3824
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v11

    .line 3826
    .restart local v11       #distance:F
    move-object/from16 v0, v50

    move-object/from16 v1, p5

    iput-object v0, v1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    .line 3827
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v41, v0

    const/16 v43, 0x1

    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v44, v0

    move-object/from16 v0, p5

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    move-object/from16 v45, v0

    move-object/from16 v36, p0

    move-wide/from16 v38, v26

    move-object/from16 v40, p3

    move/from16 v42, v11

    invoke-virtual/range {v36 .. v45}, Lcom/cyanogenmod/trebuchet/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/cyanogenmod/trebuchet/CellLayout;[IFZLcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 3831
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v13, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p3

    move-object/from16 v12, p5

    invoke-virtual/range {v8 .. v13}, Lcom/cyanogenmod/trebuchet/Workspace;->addToExistingFolderIfNecessary(Lcom/cyanogenmod/trebuchet/CellLayout;[IFLcom/cyanogenmod/trebuchet/DropTarget$DragObject;Z)Z

    move-result v2

    if-nez v2, :cond_b

    .line 3837
    .end local v11           #distance:F
    :cond_12
    if-eqz p1, :cond_14

    .line 3839
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v0, v2

    move/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

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

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v46, v0

    const/16 v47, 0x0

    const/16 v48, 0x2

    move-object/from16 v38, p3

    invoke-virtual/range {v38 .. v48}, Lcom/cyanogenmod/trebuchet/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 3845
    :goto_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v41, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v42, v2, v3

    move-object/from16 v0, v30

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v43, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v44, v0

    move-object/from16 v36, p0

    move-wide/from16 v38, v26

    move/from16 v40, v28

    move/from16 v45, p4

    invoke-virtual/range {v36 .. v45}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3847
    move-object/from16 v0, p3

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->onDropChild(Landroid/view/View;)V

    .line 3848
    invoke-virtual/range {v37 .. v37}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v53

    check-cast v53, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3849
    .local v53, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, v53

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    .line 3850
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    move-object/from16 v0, v53

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 3851
    invoke-virtual/range {p3 .. p3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v2

    move-object/from16 v0, v37

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->measureChild(Landroid/view/View;)V

    .line 3853
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v38, v0

    move-object/from16 v0, v53

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    move/from16 v43, v0

    move-object/from16 v0, v53

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    move/from16 v44, v0

    move-object/from16 v39, v30

    move-wide/from16 v40, v26

    move/from16 v42, v28

    invoke-static/range {v38 .. v44}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 3856
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    if-eqz v2, :cond_b

    .line 3860
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setFinalTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3861
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v2

    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    invoke-virtual {v2, v3, v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 3863
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->resetTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    goto/16 :goto_4

    .line 3811
    .end local v37           #view:Landroid/view/View;
    .end local v53           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :pswitch_1
    const v3, 0x7f04000f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v2, v30

    check-cast v2, Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-object/from16 v0, p3

    invoke-static {v3, v4, v0, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->fromXml(ILcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/FolderInfo;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v37

    .restart local v37       #view:Landroid/view/View;
    move-object/from16 v2, v37

    .line 3813
    check-cast v2, Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    if-nez v3, :cond_13

    const/4 v3, 0x1

    :goto_7
    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    goto/16 :goto_5

    :cond_13
    const/4 v3, 0x0

    goto :goto_7

    .line 3843
    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    goto/16 :goto_6

    .line 3799
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onResetScrollArea()V
    .locals 1

    .prologue
    .line 4221
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 4222
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    .line 4223
    return-void
.end method

.method private screenScrolledAccordion(I)V
    .locals 7
    .parameter "screenScroll"

    .prologue
    const/4 v5, 0x0

    .line 1592
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_4

    .line 1593
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1594
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_1

    .line 1595
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1596
    .local v3, scrollProgress:F
    const/high16 v4, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sub-float v2, v4, v6

    .line 1598
    .local v2, scaleX:F
    cmpg-float v4, v3, v5

    if-gez v4, :cond_2

    move v4, v5

    :goto_1
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1599
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 1600
    cmpl-float v4, v2, v5

    if-nez v4, :cond_3

    .line 1601
    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 1605
    :cond_0
    :goto_2
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1606
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1592
    .end local v2           #scaleX:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1598
    .restart local v2       #scaleX:F
    .restart local v3       #scrollProgress:F
    :cond_2
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    goto :goto_1

    .line 1602
    :cond_3
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_0

    .line 1603
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    goto :goto_2

    .line 1610
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #scaleX:F
    .end local v3           #scrollProgress:F
    :cond_4
    return-void
.end method

.method private screenScrolledCarousel(IZ)V
    .locals 6
    .parameter "screenScroll"
    .parameter "left"

    .prologue
    .line 1678
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 1679
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1680
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_0

    .line 1681
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1682
    .local v3, scrollProgress:F
    const/high16 v4, 0x42b4

    neg-float v5, v3

    mul-float v2, v4, v5

    .line 1684
    .local v2, rotation:F
    iget v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCameraDistance:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 1685
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1686
    if-eqz p2, :cond_1

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1687
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1688
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1690
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1691
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1678
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1686
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    :cond_1
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    goto :goto_1

    .line 1695
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_2
    return-void
.end method

.method private screenScrolledCube(IZ)V
    .locals 10
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const/high16 v9, 0x3f80

    const/high16 v8, 0x3f00

    const/4 v6, 0x0

    .line 1527
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 1528
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1529
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_0

    .line 1530
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 1531
    .local v4, scrollProgress:F
    if-eqz p2, :cond_1

    const/high16 v5, 0x42b4

    :goto_1
    mul-float v2, v5, v4

    .line 1532
    .local v2, rotation:F
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v7, 0x3e4ccccd

    mul-float/2addr v5, v7

    sub-float v3, v9, v5

    .line 1534
    .local v3, scale:F
    if-eqz p2, :cond_3

    .line 1535
    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCameraDistance:I

    int-to-float v7, v7

    mul-float/2addr v5, v7

    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 1536
    cmpg-float v5, v4, v6

    if-gez v5, :cond_2

    move v5, v6

    :goto_2
    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1542
    :goto_3
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1543
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1544
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1545
    invoke-direct {p0, v0, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1527
    .end local v2           #rotation:F
    .end local v3           #scale:F
    .end local v4           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1531
    .restart local v4       #scrollProgress:F
    :cond_1
    const/high16 v5, -0x3d4c

    goto :goto_1

    .line 1536
    .restart local v2       #rotation:F
    .restart local v3       #scale:F
    :cond_2
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    goto :goto_2

    .line 1538
    :cond_3
    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 1539
    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 1540
    add-float v5, v4, v9

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v5, v7

    mul-float/2addr v5, v8

    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    goto :goto_3

    .line 1549
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #rotation:F
    .end local v3           #scale:F
    .end local v4           #scrollProgress:F
    :cond_4
    return-void
.end method

.method private screenScrolledCylinder(IZ)V
    .locals 7
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const/high16 v6, 0x3f00

    .line 1661
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 1662
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1663
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_0

    .line 1664
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1665
    .local v3, scrollProgress:F
    if-eqz p2, :cond_1

    const/high16 v4, 0x4148

    :goto_1
    mul-float v2, v4, v3

    .line 1667
    .local v2, rotation:F
    const/high16 v4, 0x3f80

    add-float/2addr v4, v3

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1668
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1669
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1670
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1671
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1661
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1665
    .restart local v3       #scrollProgress:F
    :cond_1
    const/high16 v4, -0x3eb8

    goto :goto_1

    .line 1675
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v3           #scrollProgress:F
    :cond_2
    return-void
.end method

.method private screenScrolledFlip(I)V
    .locals 7
    .parameter "screenScroll"

    .prologue
    const/high16 v6, 0x3f00

    .line 1634
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 1635
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1636
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_1

    .line 1637
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1638
    .local v3, scrollProgress:F
    const/high16 v4, -0x3ccc

    mul-float v2, v4, v3

    .line 1640
    .local v2, rotation:F
    const/high16 v4, -0x4100

    cmpl-float v4, v3, v4

    if-ltz v4, :cond_2

    cmpg-float v4, v3, v6

    if-gtz v4, :cond_2

    .line 1641
    iget v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCameraDistance:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 1642
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1643
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1644
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1645
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1646
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_0

    .line 1647
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 1649
    :cond_0
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1650
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1634
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1653
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    :cond_2
    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    goto :goto_1

    .line 1657
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 1658
    return-void
.end method

.method private screenScrolledRotate(IZ)V
    .locals 17
    .parameter "screenScroll"
    .parameter "up"

    .prologue
    .line 1492
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v8

    if-ge v3, v8, :cond_5

    .line 1493
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1494
    .local v2, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v2, :cond_1

    .line 1495
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v5

    .line 1496
    .local v5, scrollProgress:F
    if-eqz p2, :cond_2

    const/high16 v8, 0x4148

    :goto_1
    mul-float v4, v8, v5

    .line 1499
    .local v4, rotation:F
    move-object/from16 v0, p0

    iget v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    const/4 v9, 0x0

    cmpg-float v8, v8, v9

    if-gez v8, :cond_0

    .line 1500
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f00

    mul-float/2addr v8, v9

    const-wide/high16 v9, 0x4019

    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->tan(D)D

    move-result-wide v9

    double-to-float v9, v9

    div-float/2addr v8, v9

    move-object/from16 v0, p0

    iput v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    .line 1505
    :cond_0
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f00

    mul-float/2addr v8, v9

    invoke-virtual {v2, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1506
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f00

    mul-float/2addr v8, v9

    invoke-virtual {v2, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1508
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float v6, v8, v5

    .line 1509
    .local v6, translationX:F
    const/4 v7, 0x0

    .line 1511
    .local v7, translationY:F
    float-to-double v9, v6

    if-eqz p2, :cond_3

    const/high16 v8, -0x4080

    :goto_2
    float-to-double v11, v8

    float-to-double v13, v4

    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    move-object/from16 v0, p0

    iget v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v13

    int-to-float v13, v13

    const/high16 v14, 0x3f00

    mul-float/2addr v13, v14

    add-float/2addr v8, v13

    float-to-double v13, v8

    mul-double/2addr v11, v13

    add-double v8, v9, v11

    double-to-float v6, v8

    .line 1513
    float-to-double v9, v7

    if-eqz p2, :cond_4

    const/high16 v8, -0x4080

    :goto_3
    float-to-double v11, v8

    const-wide/high16 v13, 0x3ff0

    float-to-double v15, v4

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v15

    sub-double/2addr v13, v15

    mul-double/2addr v11, v13

    move-object/from16 v0, p0

    iget v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v13

    int-to-float v13, v13

    const/high16 v14, 0x3f00

    mul-float/2addr v13, v14

    add-float/2addr v8, v13

    float-to-double v13, v8

    mul-double/2addr v11, v13

    add-double v8, v9, v11

    double-to-float v7, v8

    .line 1516
    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotation(F)V

    .line 1517
    invoke-virtual {v2, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1518
    invoke-virtual {v2, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationY(F)V

    .line 1519
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v8, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v8

    if-nez v8, :cond_1

    .line 1520
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1492
    .end local v4           #rotation:F
    .end local v5           #scrollProgress:F
    .end local v6           #translationX:F
    .end local v7           #translationY:F
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1496
    .restart local v5       #scrollProgress:F
    :cond_2
    const/high16 v8, -0x3eb8

    goto/16 :goto_1

    .line 1511
    .restart local v4       #rotation:F
    .restart local v6       #translationX:F
    .restart local v7       #translationY:F
    :cond_3
    const/high16 v8, 0x3f80

    goto :goto_2

    .line 1513
    :cond_4
    const/high16 v8, 0x3f80

    goto :goto_3

    .line 1524
    .end local v2           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v4           #rotation:F
    .end local v5           #scrollProgress:F
    .end local v6           #translationX:F
    .end local v7           #translationY:F
    :cond_5
    return-void
.end method

.method private screenScrolledSpin(I)V
    .locals 7
    .parameter "screenScroll"

    .prologue
    .line 1613
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 1614
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1615
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_1

    .line 1616
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1617
    .local v3, scrollProgress:F
    const/high16 v5, 0x4334

    mul-float v2, v5, v3

    .line 1619
    .local v2, rotation:F
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredHeight()I

    move-result v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredWidth()I

    move-result v6

    if-le v5, v6, :cond_0

    .line 1620
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredHeight()I

    move-result v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredWidth()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    const/high16 v6, 0x4000

    div-float/2addr v5, v6

    neg-float v6, v3

    mul-float v4, v5, v6

    .line 1621
    .local v4, translationX:F
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1624
    .end local v4           #translationX:F
    :cond_0
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotation(F)V

    .line 1626
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1627
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1613
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1631
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_2
    return-void
.end method

.method private screenScrolledStack(I)V
    .locals 11
    .parameter "screenScroll"

    .prologue
    const/high16 v7, 0x3f80

    const/4 v10, 0x0

    .line 1552
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v8

    if-ge v2, v8, :cond_6

    .line 1553
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1554
    .local v1, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v1, :cond_2

    .line 1555
    invoke-virtual {p0, p1, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v5

    .line 1556
    .local v5, scrollProgress:F
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    invoke-static {v5, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    invoke-virtual {v8, v9}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v3

    .line 1558
    .local v3, interpolatedProgress:F
    sub-float v8, v7, v3

    const v9, 0x3f428f5c

    mul-float/2addr v9, v3

    add-float v4, v8, v9

    .line 1559
    .local v4, scale:F
    invoke-static {v10, v5}, Ljava/lang/Math;->min(FF)F

    move-result v8

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    mul-float v6, v8, v9

    .line 1562
    .local v6, translationX:F
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-eqz v8, :cond_0

    cmpg-float v8, v5, v10

    if-gez v8, :cond_4

    .line 1563
    :cond_0
    cmpg-float v8, v5, v10

    if-gez v8, :cond_3

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v9

    sub-float v9, v7, v9

    invoke-virtual {v8, v9}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .line 1569
    .local v0, alpha:F
    :goto_1
    invoke-virtual {v1, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1570
    invoke-virtual {v1, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 1571
    invoke-virtual {v1, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 1572
    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setAlpha(F)V

    .line 1577
    cmpg-float v8, v0, v10

    if-gtz v8, :cond_5

    .line 1578
    const/4 v8, 0x4

    invoke-virtual {v1, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 1579
    invoke-virtual {v1, v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1583
    :cond_1
    :goto_2
    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v8, :cond_2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v8

    if-nez v8, :cond_2

    .line 1584
    invoke-direct {p0, v1, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1552
    .end local v0           #alpha:F
    .end local v3           #interpolatedProgress:F
    .end local v4           #scale:F
    .end local v5           #scrollProgress:F
    .end local v6           #translationX:F
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .restart local v3       #interpolatedProgress:F
    .restart local v4       #scale:F
    .restart local v5       #scrollProgress:F
    .restart local v6       #translationX:F
    :cond_3
    move v0, v7

    .line 1563
    goto :goto_1

    .line 1567
    :cond_4
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    sub-float v9, v7, v5

    invoke-virtual {v8, v9}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .restart local v0       #alpha:F
    goto :goto_1

    .line 1580
    :cond_5
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getVisibility()I

    move-result v8

    if-eqz v8, :cond_1

    .line 1581
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    goto :goto_2

    .line 1588
    .end local v0           #alpha:F
    .end local v1           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v3           #interpolatedProgress:F
    .end local v4           #scale:F
    .end local v5           #scrollProgress:F
    .end local v6           #translationX:F
    :cond_6
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 1589
    return-void
.end method

.method private screenScrolledStandard(I)V
    .locals 4
    .parameter "screenScroll"

    .prologue
    .line 1440
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1441
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1442
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_0

    .line 1443
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v2

    .line 1444
    .local v2, scrollProgress:F
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1445
    invoke-direct {p0, v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1440
    .end local v2           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1449
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    return-void
.end method

.method private screenScrolledTablet(I)V
    .locals 7
    .parameter "screenScroll"

    .prologue
    .line 1452
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_1

    .line 1453
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1454
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_0

    .line 1455
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1456
    .local v3, scrollProgress:F
    const/high16 v5, 0x4148

    mul-float v2, v5, v3

    .line 1457
    .local v2, rotation:F
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v6

    invoke-virtual {p0, v2, v5, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getOffsetXForRotation(FII)F

    move-result v4

    .line 1459
    .local v4, translationX:F
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1460
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1461
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1462
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1452
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #translationX:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1466
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 1467
    return-void
.end method

.method private screenScrolledZoom(IZ)V
    .locals 9
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const v6, 0x3dcccccd

    .line 1470
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_3

    .line 1471
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1472
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_1

    .line 1473
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1474
    .local v3, scrollProgress:F
    const/high16 v7, 0x3f80

    if-eqz p2, :cond_2

    const v5, -0x41b33333

    :goto_1
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v8

    mul-float/2addr v5, v8

    add-float v2, v7, v5

    .line 1477
    .local v2, scale:F
    if-nez p2, :cond_0

    .line 1478
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v6

    neg-float v7, v3

    mul-float v4, v5, v7

    .line 1479
    .local v4, translationX:F
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 1482
    .end local v4           #translationX:F
    :cond_0
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 1483
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 1484
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1485
    invoke-direct {p0, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 1470
    .end local v2           #scale:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .restart local v3       #scrollProgress:F
    :cond_2
    move v5, v6

    .line 1474
    goto :goto_1

    .line 1489
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v3           #scrollProgress:F
    :cond_3
    return-void
.end method

.method private setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V
    .locals 3
    .parameter "child"
    .parameter "scrollProgress"

    .prologue
    const/high16 v2, 0x3f80

    .line 1807
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sub-float v0, v2, v1

    .line 1808
    .local v0, alpha:F
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setAlpha(F)V

    .line 1809
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsDragOccuring:Z

    if-nez v1, :cond_0

    .line 1810
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->backgroundAlphaInterpolator(F)F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlphaMultiplier(F)V

    .line 1815
    :goto_0
    return-void

    .line 1813
    :cond_0
    invoke-virtual {p1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlphaMultiplier(F)V

    goto :goto_0
.end method

.method private setChildrenBackgroundAlphaMultipliers(F)V
    .locals 3
    .parameter "a"

    .prologue
    .line 1433
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1434
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1435
    .local v0, child:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlphaMultiplier(F)V

    .line 1433
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1437
    .end local v0           #child:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method static squaredDistance([F[FZ)F
    .locals 10
    .parameter "point1"
    .parameter "point2"
    .parameter "spatial"

    .prologue
    const-wide/high16 v8, 0x4000

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 3329
    if-nez p2, :cond_0

    .line 3330
    aget v4, p0, v6

    aget v5, p1, v6

    sub-float v0, v4, v5

    .line 3331
    .local v0, distanceX:F
    aget v4, p1, v7

    aget v5, p1, v7

    sub-float v2, v4, v5

    .line 3332
    .local v2, distanceY:F
    mul-float v4, v0, v0

    mul-float v5, v2, v2

    add-float/2addr v4, v5

    .line 3337
    .end local v0           #distanceX:F
    .end local v2           #distanceY:F
    :goto_0
    return v4

    .line 3335
    :cond_0
    aget v4, p1, v6

    aget v5, p1, v7

    sub-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 3336
    .local v0, distanceX:D
    aget v4, p1, v7

    aget v5, p1, v6

    sub-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    .line 3337
    .local v2, distanceY:D
    add-double v4, v0, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v4, v4

    goto :goto_0
.end method

.method private syncWallpaperOffsetWithScroll()V
    .locals 3

    .prologue
    .line 1091
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isHardwareAccelerated()Z

    move-result v0

    .line 1092
    .local v0, enableWallpaperEffects:Z
    if-eqz v0, :cond_0

    .line 1093
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->wallpaperOffsetForCurrentScroll()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->setFinalX(F)V

    .line 1095
    :cond_0
    return-void
.end method

.method private updateChildrenLayersEnabled(Z)V
    .locals 7
    .parameter "force"

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 1972
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v6, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-eq v5, v6, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-eqz v5, :cond_4

    :cond_0
    move v3, v4

    .line 1973
    .local v3, small:Z
    :goto_0
    if-nez p1, :cond_1

    if-nez v3, :cond_1

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAnimatingViewIntoPlace:Z

    if-nez v5, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isPageMoving()Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    move v1, v4

    .line 1975
    .local v1, enableChildrenLayers:Z
    :cond_2
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenLayersEnabled:Z

    if-eq v1, v4, :cond_3

    .line 1976
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenLayersEnabled:Z

    .line 1977
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenLayersEnabled:Z

    if-eqz v4, :cond_5

    .line 1978
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->enableHwLayersOnVisiblePages()V

    .line 1986
    :cond_3
    return-void

    .end local v1           #enableChildrenLayers:Z
    .end local v3           #small:Z
    :cond_4
    move v3, v1

    .line 1972
    goto :goto_0

    .line 1980
    .restart local v1       #enableChildrenLayers:Z
    .restart local v3       #small:Z
    :cond_5
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageCount()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 1981
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1982
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->disableHardwareLayers()V

    .line 1980
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private updateWallpaperOffsets()V
    .locals 6

    .prologue
    .line 1112
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    if-eqz v2, :cond_2

    .line 1113
    const/4 v1, 0x1

    .line 1114
    .local v1, updateNow:Z
    const/4 v0, 0x0

    .line 1115
    .local v0, keepUpdating:Z
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->jumpToFinal()V

    .line 1116
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 1120
    :goto_0
    if-eqz v1, :cond_0

    .line 1121
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->getCurrX()F

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    .line 1122
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->getCurrY()F

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    .line 1123
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHack:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    if-eqz v2, :cond_0

    .line 1124
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    invoke-virtual {v2, v3, v4, v5}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V

    .line 1127
    :cond_0
    if-eqz v0, :cond_1

    .line 1128
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 1130
    :cond_1
    return-void

    .line 1118
    .end local v0           #keepUpdating:Z
    .end local v1           #updateNow:Z
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->computeScrollOffset()Z

    move-result v0

    .restart local v0       #keepUpdating:Z
    move v1, v0

    .restart local v1       #updateNow:Z
    goto :goto_0
.end method

.method private wallpaperOffsetForCurrentScroll()F
    .locals 10

    .prologue
    const/high16 v9, 0x3f80

    .line 1058
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    int-to-float v8, v8

    div-float v8, v9, v8

    invoke-virtual {v7, v8, v9}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 1063
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1064
    .local v1, layoutScale:F
    iput v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1065
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollRange()I

    move-result v5

    .line 1068
    .local v5, scrollRange:I
    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v8

    iget v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxScrollX:I

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-float v0, v7

    .line 1069
    .local v0, adjustedScrollX:F
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollRatio:F

    mul-float/2addr v0, v7

    .line 1070
    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLayoutScale:F

    .line 1072
    int-to-float v7, v5

    div-float v4, v0, v7

    .line 1075
    .local v4, scrollProgress:F
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v7

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsStaticWallpaper:Z

    if-eqz v7, :cond_0

    .line 1079
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperTravelWidth:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1081
    .local v6, wallpaperTravelWidth:I
    int-to-float v7, v6

    mul-float/2addr v7, v4

    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    sub-int/2addr v8, v6

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    add-float v3, v7, v8

    .line 1083
    .local v3, offsetInDips:F
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    int-to-float v7, v7

    div-float v2, v3, v7

    .line 1086
    .end local v3           #offsetInDips:F
    .end local v6           #wallpaperTravelWidth:I
    :goto_0
    return v2

    :cond_0
    move v2, v4

    goto :goto_0
.end method

.method private wallpaperTravelToScreenWidthRatio(II)F
    .locals 9
    .parameter "width"
    .parameter "height"

    .prologue
    .line 997
    int-to-float v7, p1

    int-to-float v8, p2

    div-float v4, v7, v8

    .line 1004
    .local v4, aspectRatio:F
    const v0, 0x3fcccccd

    .line 1005
    .local v0, ASPECT_RATIO_LANDSCAPE:F
    const/high16 v1, 0x3f20

    .line 1006
    .local v1, ASPECT_RATIO_PORTRAIT:F
    const/high16 v2, 0x3fc0

    .line 1007
    .local v2, WALLPAPER_WIDTH_TO_SCREEN_RATIO_LANDSCAPE:F
    const v3, 0x3f99999a

    .line 1014
    .local v3, WALLPAPER_WIDTH_TO_SCREEN_RATIO_PORTRAIT:F
    const v5, 0x3e9d89d7

    .line 1017
    .local v5, x:F
    const v6, 0x3f80fc10

    .line 1018
    .local v6, y:F
    const v7, 0x3e9d89d7

    mul-float/2addr v7, v4

    const v8, 0x3f80fc10

    add-float/2addr v7, v8

    return v7
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 25
    .parameter "d"

    .prologue
    .line 2687
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2688
    .local v8, dropTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    move-object/from16 v0, p0

    if-eq v1, v0, :cond_8

    .line 2690
    if-nez v8, :cond_0

    .line 2691
    const/4 v1, 0x0

    .line 2750
    :goto_0
    return v1

    .line 2693
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->transitionStateShouldAllowDrop()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 2695
    :cond_1
    move-object/from16 v0, p1

    iget v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/cyanogenmod/trebuchet/Workspace;->getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    .line 2699
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2700
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/cyanogenmod/trebuchet/Hotseat;[F)V

    .line 2707
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v1, :cond_4

    .line 2708
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    move-object/from16 v22, v0

    .line 2709
    .local v22, dragCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    move-object/from16 v0, v22

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    move/from16 v16, v0

    .line 2710
    .local v16, spanX:I
    move-object/from16 v0, v22

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    move/from16 v17, v0

    .line 2717
    .end local v22           #dragCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    .local v17, spanY:I
    :goto_2
    move/from16 v4, v16

    .line 2718
    .local v4, minSpanX:I
    move/from16 v5, v17

    .line 2719
    .local v5, minSpanY:I
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v1, :cond_2

    .line 2720
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v4, v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minSpanX:I

    .line 2721
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v5, v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minSpanY:I

    .line 2724
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    float-to-int v2, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v1, v1, v3

    float-to-int v3, v1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v1, p0

    move-object v6, v8

    invoke-direct/range {v1 .. v7}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 2727
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    invoke-virtual {v8, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v10

    .line 2729
    .local v10, distance:F
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v7, Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v11, 0x1

    move-object/from16 v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/cyanogenmod/trebuchet/Workspace;->willCreateUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFZ)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2731
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 2702
    .end local v4           #minSpanX:I
    .end local v5           #minSpanY:I
    .end local v10           #distance:F
    .end local v16           #spanX:I
    .end local v17           #spanY:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto/16 :goto_1

    .line 2712
    :cond_4
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2713
    .local v23, dragInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v23

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v16, v0

    .line 2714
    .restart local v16       #spanX:I
    move-object/from16 v0, v23

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v17, v0

    .restart local v17       #spanY:I
    goto/16 :goto_2

    .line 2733
    .end local v23           #dragInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v4       #minSpanX:I
    .restart local v5       #minSpanY:I
    .restart local v10       #distance:F
    :cond_5
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v8, v2, v10}, Lcom/cyanogenmod/trebuchet/Workspace;->willAddToExistingUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IF)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 2735
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 2738
    :cond_6
    const/4 v1, 0x2

    new-array v0, v1, [I

    move-object/from16 v20, v0

    .line 2739
    .local v20, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    float-to-int v12, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    float-to-int v13, v1

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v19, v0

    const/16 v21, 0x3

    move-object v11, v8

    move v14, v4

    move v15, v5

    invoke-virtual/range {v11 .. v21}, Lcom/cyanogenmod/trebuchet/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 2742
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ltz v1, :cond_7

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    if-ltz v1, :cond_7

    const/16 v24, 0x1

    .line 2745
    .local v24, foundCell:Z
    :goto_3
    if-nez v24, :cond_8

    .line 2746
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

    .line 2747
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 2742
    .end local v24           #foundCell:Z
    :cond_7
    const/16 v24, 0x0

    goto :goto_3

    .line 2750
    .end local v4           #minSpanX:I
    .end local v5           #minSpanY:I
    .end local v10           #distance:F
    .end local v16           #spanX:I
    .end local v17           #spanY:I
    .end local v20           #resultSpan:[I
    :cond_8
    const/4 v1, 0x1

    goto/16 :goto_0
.end method

.method addApplicationShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/CellLayout;JIZII)V
    .locals 13
    .parameter "info"
    .parameter "target"
    .parameter "container"
    .parameter "screen"
    .parameter "insertAtFirst"
    .parameter "intersectX"
    .parameter "intersectY"

    .prologue
    .line 2669
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v2, 0x7f040003

    invoke-virtual {v0, v2, p2, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v12

    .line 2671
    .local v12, view:Landroid/view/View;
    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 2672
    .local v1, cellXY:[I
    const/4 v2, 0x1

    const/4 v3, 0x1

    move-object v0, p2

    move/from16 v4, p7

    move/from16 v5, p8

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpanThatIntersects([IIIII)Z

    .line 2673
    const/4 v0, 0x0

    aget v7, v1, v0

    const/4 v0, 0x1

    aget v8, v1, v0

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v2, p0

    move-object v3, v12

    move-wide/from16 v4, p3

    move/from16 v6, p5

    move/from16 v11, p6

    invoke-virtual/range {v2 .. v11}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 2674
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v0, 0x0

    aget v7, v1, v0

    const/4 v0, 0x1

    aget v8, v1, v0

    move-object v3, p1

    move-wide/from16 v4, p3

    move/from16 v6, p5

    invoke-static/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addOrMoveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 2676
    return-void
.end method

.method public addExternalItemToScreen(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;)Z
    .locals 4
    .parameter "dragInfo"
    .parameter "layout"

    .prologue
    const/4 v0, 0x0

    .line 3664
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempEstimate:[I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iget v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-virtual {p2, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3665
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;Z)V

    .line 3666
    const/4 v0, 0x1

    .line 3669
    :goto_0
    return v0

    .line 3668
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

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
    .line 1925
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1926
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 1927
    .local v0, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v0, :cond_1

    .line 1928
    invoke-virtual {v0, p1, p2}, Lcom/cyanogenmod/trebuchet/Folder;->addFocusables(Ljava/util/ArrayList;I)V

    .line 1933
    .end local v0           #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :cond_0
    :goto_0
    return-void

    .line 1930
    .restart local v0       #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/PagedView;->addFocusables(Ljava/util/ArrayList;II)V

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
    .line 652
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v9}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 653
    return-void
.end method

.method addInScreen(Landroid/view/View;JIIIIIZ)V
    .locals 12
    .parameter "child"
    .parameter "container"
    .parameter "screen"
    .parameter "x"
    .parameter "y"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "insert"

    .prologue
    .line 669
    const-wide/16 v5, -0x64

    cmp-long v5, p2, v5

    if-nez v5, :cond_2

    .line 670
    if-ltz p4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    move/from16 v0, p4

    if-lt v0, v5, :cond_4

    .line 671
    :cond_0
    const-string v5, "Trebuchet.Workspace"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "The screen must be >= 0 and < "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " (was "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, "); skipping child"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    .end local p1
    :cond_1
    :goto_0
    return-void

    .line 675
    .restart local p1
    :cond_2
    const-wide/16 v5, -0x65

    cmp-long v5, p2, v5

    if-nez v5, :cond_4

    .line 676
    if-ltz p4, :cond_3

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v5

    move/from16 v0, p4

    if-lt v0, v5, :cond_4

    .line 677
    :cond_3
    const-string v5, "Trebuchet.Workspace"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "The screen must be >= 0 and < "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " (was "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, "); skipping child"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 684
    :cond_4
    const-wide/16 v5, -0x65

    cmp-long v5, p2, v5

    if-nez v5, :cond_d

    .line 687
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v5

    move/from16 v0, p5

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCellYFromOrder(I)I

    move-result p6

    .line 688
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v5

    move/from16 v0, p5

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCellXFromOrder(I)I

    move-result p5

    .line 689
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v5

    move/from16 v0, p4

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result p4

    .line 690
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v5

    move/from16 v0, p4

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 691
    .local v4, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 694
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v5, :cond_b

    move-object v5, p1

    .line 695
    check-cast v5, Lcom/cyanogenmod/trebuchet/FolderIcon;

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideDockIconLabels:Z

    if-nez v6, :cond_a

    const/4 v6, 0x1

    :goto_1
    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    .line 710
    :cond_5
    :goto_2
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 712
    .local v10, genericLp:Landroid/view/ViewGroup$LayoutParams;
    if-eqz v10, :cond_6

    instance-of v5, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    if-nez v5, :cond_12

    .line 713
    :cond_6
    new-instance v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    move/from16 v0, p5

    move/from16 v1, p6

    move/from16 v2, p7

    move/from16 v3, p8

    invoke-direct {v8, v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;-><init>(IIII)V

    .line 722
    .local v8, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :goto_3
    if-gez p7, :cond_7

    if-gez p8, :cond_7

    .line 723
    const/4 v5, 0x0

    iput-boolean v5, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 727
    :cond_7
    invoke-static/range {p2 .. p6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getCellLayoutChildId(JIII)I

    move-result v7

    .line 728
    .local v7, childId:I
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/Folder;

    if-nez v5, :cond_13

    const/4 v9, 0x1

    .line 729
    .local v9, markCellsAsOccupied:Z
    :goto_4
    if-eqz p9, :cond_14

    const/4 v6, 0x0

    :goto_5
    move-object v5, p1

    invoke-virtual/range {v4 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Z)Z

    move-result v5

    if-nez v5, :cond_8

    .line 733
    const-string v5, "Trebuchet.Workspace"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to add to item at ("

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v11, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, ","

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v11, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, ") to CellLayout"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    :cond_8
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/Folder;

    if-nez v5, :cond_9

    .line 737
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 738
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p1, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 740
    :cond_9
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v5, :cond_1

    .line 741
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    check-cast p1, Lcom/cyanogenmod/trebuchet/DropTarget;

    .end local p1
    invoke-virtual {v5, p1}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    goto/16 :goto_0

    .line 695
    .end local v7           #childId:I
    .end local v8           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v9           #markCellsAsOccupied:Z
    .end local v10           #genericLp:Landroid/view/ViewGroup$LayoutParams;
    .restart local p1
    :cond_a
    const/4 v6, 0x0

    goto :goto_1

    .line 696
    :cond_b
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v5, :cond_5

    move-object v5, p1

    .line 697
    check-cast v5, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideDockIconLabels:Z

    if-nez v6, :cond_c

    const/4 v6, 0x1

    :goto_6
    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setTextVisible(Z)V

    goto/16 :goto_2

    :cond_c
    const/4 v6, 0x0

    goto :goto_6

    .line 700
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_d
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v5, :cond_10

    move-object v5, p1

    .line 701
    check-cast v5, Lcom/cyanogenmod/trebuchet/FolderIcon;

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    if-nez v6, :cond_f

    const/4 v6, 0x1

    :goto_7
    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    .line 706
    :cond_e
    :goto_8
    move/from16 v0, p4

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 707
    .restart local v4       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    new-instance v5, Lcom/cyanogenmod/trebuchet/IconKeyEventListener;

    invoke-direct {v5}, Lcom/cyanogenmod/trebuchet/IconKeyEventListener;-><init>()V

    invoke-virtual {p1, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    goto/16 :goto_2

    .line 701
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_f
    const/4 v6, 0x0

    goto :goto_7

    .line 702
    :cond_10
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v5, :cond_e

    move-object v5, p1

    .line 703
    check-cast v5, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mHideIconLabels:Z

    if-nez v6, :cond_11

    const/4 v6, 0x1

    :goto_9
    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setTextVisible(Z)V

    goto :goto_8

    :cond_11
    const/4 v6, 0x0

    goto :goto_9

    .restart local v4       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v10       #genericLp:Landroid/view/ViewGroup$LayoutParams;
    :cond_12
    move-object v8, v10

    .line 715
    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 716
    .restart local v8       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move/from16 v0, p5

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    .line 717
    move/from16 v0, p6

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 718
    move/from16 v0, p7

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 719
    move/from16 v0, p8

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    goto/16 :goto_3

    .line 728
    .restart local v7       #childId:I
    :cond_13
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 729
    .restart local v9       #markCellsAsOccupied:Z
    :cond_14
    const/4 v6, -0x1

    goto/16 :goto_5
.end method

.method addToExistingFolderIfNecessary(Lcom/cyanogenmod/trebuchet/CellLayout;[IFLcom/cyanogenmod/trebuchet/DropTarget$DragObject;Z)Z
    .locals 6
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "d"
    .parameter "external"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2866
    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v2, p3, v2

    if-lez v2, :cond_0

    move v2, v3

    .line 2884
    :goto_0
    return v2

    .line 2868
    :cond_0
    aget v2, p2, v3

    aget v5, p2, v4

    invoke-virtual {p1, v2, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 2869
    .local v0, dropOverView:Landroid/view/View;
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAddToExistingFolderOnDrop:Z

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_0

    .line 2870
    :cond_1
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 2872
    instance-of v2, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v2, :cond_3

    move-object v1, v0

    .line 2873
    check-cast v1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 2874
    .local v1, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    iget-object v2, p4, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v2, Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->acceptDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2875
    invoke-virtual {v1, p4}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 2878
    if-nez p5, :cond_2

    .line 2879
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    :cond_2
    move v2, v4

    .line 2881
    goto :goto_0

    .end local v1           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    :cond_3
    move v2, v3

    .line 2884
    goto :goto_0
.end method

.method public animateWidgetDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V
    .locals 39
    .parameter "info"
    .parameter "cellLayout"
    .parameter "dragView"
    .parameter "onCompleteRunnable"
    .parameter "animationType"
    .parameter "finalView"
    .parameter "external"

    .prologue
    .line 3927
    new-instance v37, Landroid/graphics/Rect;

    invoke-direct/range {v37 .. v37}, Landroid/graphics/Rect;-><init>()V

    .line 3928
    .local v37, from:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v4

    move-object/from16 v0, p3

    move-object/from16 v1, v37

    invoke-virtual {v4, v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 3930
    const/4 v4, 0x2

    new-array v5, v4, [I

    .line 3931
    .local v5, finalPos:[I
    const/4 v4, 0x2

    new-array v6, v4, [F

    .line 3932
    .local v6, scaleXY:[F
    move-object/from16 v0, p1

    instance-of v4, v0, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;

    if-nez v4, :cond_3

    const/4 v11, 0x1

    .line 3933
    .local v11, scalePreview:Z
    :goto_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v4, p0

    move-object/from16 v7, p3

    move-object/from16 v8, p2

    move-object/from16 v9, p1

    invoke-direct/range {v4 .. v11}, Lcom/cyanogenmod/trebuchet/Workspace;->getFinalPositionForDropAnimation([I[FLcom/cyanogenmod/trebuchet/DragView;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/ItemInfo;[IZ)V

    .line 3936
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v38

    .line 3937
    .local v38, res:Landroid/content/res/Resources;
    const v4, 0x7f0c0012

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    add-int/lit16 v0, v4, -0xc8

    move/from16 v20, v0

    .line 3940
    .local v20, duration:I
    move-object/from16 v0, p6

    instance-of v4, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v4, :cond_0

    if-eqz p7, :cond_0

    .line 3941
    const-string v4, "Trebuchet.Workspace"

    const-string v7, "6557954 Animate widget drop, final view is appWidgetHostView"

    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3942
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 3944
    :cond_0
    const/4 v4, 0x2

    move/from16 v0, p5

    if-eq v0, v4, :cond_1

    if-eqz p7, :cond_4

    :cond_1
    if-eqz p6, :cond_4

    .line 3945
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->createWidgetBitmap(Lcom/cyanogenmod/trebuchet/ItemInfo;Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v36

    .line 3946
    .local v36, crossFadeBitmap:Landroid/graphics/Bitmap;
    move-object/from16 v0, p3

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setCrossFadeBitmap(Landroid/graphics/Bitmap;)V

    .line 3947
    move/from16 v0, v20

    int-to-float v4, v0

    const v7, 0x3f4ccccd

    mul-float/2addr v4, v7

    float-to-int v4, v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/DragView;->crossFade(I)V

    .line 3952
    .end local v36           #crossFadeBitmap:Landroid/graphics/Bitmap;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v21

    .line 3953
    .local v21, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    const/4 v4, 0x4

    move/from16 v0, p5

    if-ne v0, v4, :cond_5

    .line 3954
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v12

    const/4 v15, 0x0

    const v16, 0x3dcccccd

    const v17, 0x3dcccccd

    const/16 v18, 0x0

    move-object/from16 v13, p3

    move-object v14, v5

    move-object/from16 v19, p4

    invoke-virtual/range {v12 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;[IFFFILjava/lang/Runnable;I)V

    .line 3979
    :goto_2
    return-void

    .line 3932
    .end local v11           #scalePreview:Z
    .end local v20           #duration:I
    .end local v21           #dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    .end local v38           #res:Landroid/content/res/Resources;
    :cond_3
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 3948
    .restart local v11       #scalePreview:Z
    .restart local v20       #duration:I
    .restart local v38       #res:Landroid/content/res/Resources;
    :cond_4
    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    const/4 v7, 0x4

    if-ne v4, v7, :cond_2

    if-eqz p7, :cond_2

    .line 3949
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

    .line 3958
    .restart local v21       #dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    :cond_5
    const/4 v4, 0x1

    move/from16 v0, p5

    if-ne v0, v4, :cond_6

    .line 3959
    const/16 v33, 0x2

    .line 3964
    .local v33, endStyle:I
    :goto_3
    new-instance v32, Lcom/cyanogenmod/trebuchet/Workspace$10;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, p6

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace$10;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 3975
    .local v32, onComplete:Ljava/lang/Runnable;
    move-object/from16 v0, v37

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v23, v0

    move-object/from16 v0, v37

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v24, v0

    const/4 v4, 0x0

    aget v25, v5, v4

    const/4 v4, 0x1

    aget v26, v5, v4

    const/high16 v27, 0x3f80

    const/high16 v28, 0x3f80

    const/high16 v29, 0x3f80

    const/4 v4, 0x0

    aget v30, v6, v4

    const/4 v4, 0x1

    aget v31, v6, v4

    move-object/from16 v22, p3

    move/from16 v34, v20

    move-object/from16 v35, p0

    invoke-virtual/range {v21 .. v35}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;IIIIFFFFFLjava/lang/Runnable;IILandroid/view/View;)V

    goto :goto_2

    .line 3961
    .end local v32           #onComplete:Ljava/lang/Runnable;
    .end local v33           #endStyle:I
    :cond_6
    const/16 v33, 0x0

    .restart local v33       #endStyle:I
    goto :goto_3
.end method

.method backgroundAlphaInterpolator(F)F
    .locals 4
    .parameter "r"

    .prologue
    .line 1421
    const v0, 0x3dcccccd

    .line 1422
    .local v0, pivotA:F
    const v1, 0x3ecccccd

    .line 1423
    .local v1, pivotB:F
    cmpg-float v2, p1, v0

    if-gez v2, :cond_0

    .line 1424
    const/4 v2, 0x0

    .line 1428
    :goto_0
    return v2

    .line 1425
    :cond_0
    cmpl-float v2, p1, v1

    if-lez v2, :cond_1

    .line 1426
    const/high16 v2, 0x3f80

    goto :goto_0

    .line 1428
    :cond_1
    sub-float v2, p1, v0

    sub-float v3, v1, v0

    div-float/2addr v2, v3

    goto :goto_0
.end method

.method public beginDragShared(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DragSource;)V
    .locals 24
    .parameter "child"
    .parameter "source"

    .prologue
    .line 2618
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    .line 2621
    .local v21, r:Landroid/content/res/Resources;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3}, Landroid/graphics/Canvas;-><init>()V

    const/4 v7, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 2623
    .local v4, b:Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    .line 2624
    .local v14, bmpWidth:I
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    .line 2626
    .local v13, bmpHeight:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempXY:[I

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v7}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    move-result v12

    .line 2627
    .local v12, scale:F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempXY:[I

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

    .line 2629
    .local v5, dragLayerX:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempXY:[I

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

    .line 2633
    .local v6, dragLayerY:I
    const/4 v10, 0x0

    .line 2634
    .local v10, dragVisualizeOffset:Landroid/graphics/Point;
    const/4 v11, 0x0

    .line 2635
    .local v11, dragRect:Landroid/graphics/Rect;
    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-nez v3, :cond_0

    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v3, :cond_3

    .line 2636
    :cond_0
    const v3, 0x7f0d0022

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v18

    .line 2637
    .local v18, iconSize:I
    const v3, 0x7f0d001b

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v17

    .line 2638
    .local v17, iconPaddingTop:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingTop()I

    move-result v23

    .line 2639
    .local v23, top:I
    sub-int v3, v14, v18

    div-int/lit8 v19, v3, 0x2

    .line 2640
    .local v19, left:I
    add-int v22, v19, v18

    .line 2641
    .local v22, right:I
    add-int v15, v23, v18

    .line 2642
    .local v15, bottom:I
    add-int v6, v6, v23

    .line 2645
    new-instance v10, Landroid/graphics/Point;

    .end local v10           #dragVisualizeOffset:Landroid/graphics/Point;
    const/4 v3, -0x1

    add-int/lit8 v7, v17, -0x1

    invoke-direct {v10, v3, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 2647
    .restart local v10       #dragVisualizeOffset:Landroid/graphics/Point;
    new-instance v11, Landroid/graphics/Rect;

    .end local v11           #dragRect:Landroid/graphics/Rect;
    move/from16 v0, v19

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v11, v0, v1, v2, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2654
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

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v3, :cond_2

    move-object/from16 v16, p1

    .line 2655
    check-cast v16, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 2656
    .local v16, icon:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    invoke-virtual/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->clearPressedOrFocusedBackground()V

    .line 2659
    .end local v16           #icon:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    sget v9, Lcom/cyanogenmod/trebuchet/DragController;->DRAG_ACTION_MOVE:I

    move-object/from16 v7, p2

    invoke-virtual/range {v3 .. v12}, Lcom/cyanogenmod/trebuchet/DragController;->startDrag(Landroid/graphics/Bitmap;IILcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;ILandroid/graphics/Point;Landroid/graphics/Rect;F)V

    .line 2661
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 2664
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->showScrollingIndicator(Z)V

    .line 2665
    return-void

    .line 2648
    :cond_3
    move-object/from16 v0, p1

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v3, :cond_1

    .line 2649
    const v3, 0x7f0d003f

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v20

    .line 2650
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
    .line 2019
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 2020
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 2021
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    .line 2022
    .local v0, childCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 2023
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2024
    .local v1, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->buildHardwareLayer()V

    .line 2022
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2027
    .end local v0           #childCount:I
    .end local v1           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #i:I
    :cond_0
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 2028
    return-void
.end method

.method protected checkWallpaper()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 575
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHack:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    if-le v2, v1, :cond_1

    .line 576
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_0

    .line 577
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    .line 579
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    if-nez v2, :cond_1

    .line 580
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 581
    .local v0, wallpaper:Landroid/graphics/drawable/Drawable;
    instance-of v2, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v2, :cond_1

    .line 582
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0           #wallpaper:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    .line 586
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    if-nez v3, :cond_2

    :goto_0
    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->setWallpaperVisibility(Z)V

    .line 589
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 590
    return-void

    .line 586
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method clearChildrenCache()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1959
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v2

    .line 1960
    .local v2, screenCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 1961
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1962
    .local v1, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v1, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1964
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isHardwareAccelerated()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1965
    invoke-virtual {v1, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setChildrenDrawingCacheEnabled(Z)V

    .line 1960
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1968
    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    return-void
.end method

.method clearDropTargets()V
    .locals 7

    .prologue
    .line 4311
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 4313
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 4314
    .local v4, layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    .line 4315
    .local v0, childCount:I
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 4316
    invoke-virtual {v4, v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 4317
    .local v5, v:Landroid/view/View;
    instance-of v6, v5, Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v6, :cond_1

    .line 4318
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    check-cast v5, Lcom/cyanogenmod/trebuchet/DropTarget;

    .end local v5           #v:Landroid/view/View;
    invoke-virtual {v6, v5}, Lcom/cyanogenmod/trebuchet/DragController;->removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 4315
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 4322
    .end local v0           #childCount:I
    .end local v3           #j:I
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_2
    return-void
.end method

.method public computeScroll()V
    .locals 1

    .prologue
    .line 1304
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->computeScroll()V

    .line 1305
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v0, :cond_0

    .line 1306
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->syncWallpaperOffsetWithScroll()V

    .line 1308
    :cond_0
    return-void
.end method

.method public createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "v"
    .parameter "canvas"
    .parameter "padding"

    .prologue
    const/4 v5, 0x1

    .line 2534
    instance-of v2, p1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    move-object v2, p1

    .line 2535
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v1, v2, v5

    .line 2536
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

    .line 2543
    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    .local v0, b:Landroid/graphics/Bitmap;
    :goto_0
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2544
    invoke-direct {p0, p1, p2, p3, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->drawDragView(Landroid/view/View;Landroid/graphics/Canvas;IZ)V

    .line 2545
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2547
    return-object v0

    .line 2539
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

.method createUserFolderIfNecessary(Landroid/view/View;JLcom/cyanogenmod/trebuchet/CellLayout;[IFZLcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;)Z
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
    .line 2809
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v2, p6, v2

    if-lez v2, :cond_0

    const/4 v2, 0x0

    .line 2861
    :goto_0
    return v2

    .line 2810
    :cond_0
    const/4 v2, 0x0

    aget v2, p5, v2

    const/4 v3, 0x1

    aget v3, p5, v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v9

    .line 2812
    .local v9, v:Landroid/view/View;
    const/16 v19, 0x0

    .line 2813
    .local v19, hasntMoved:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v2, :cond_1

    .line 2814
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v17

    .line 2815
    .local v17, cellParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellX:I

    const/4 v3, 0x0

    aget v3, p5, v3

    if-ne v2, v3, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellY:I

    const/4 v3, 0x1

    aget v3, p5, v3

    if-ne v2, v3, :cond_3

    move-object/from16 v0, v17

    move-object/from16 v1, p4

    if-ne v0, v1, :cond_3

    const/16 v19, 0x1

    .line 2819
    .end local v17           #cellParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    :goto_1
    if-eqz v9, :cond_2

    if-nez v19, :cond_2

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    if-nez v2, :cond_4

    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 2815
    .restart local v17       #cellParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_3
    const/16 v19, 0x0

    goto :goto_1

    .line 2820
    .end local v17           #cellParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_4
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    .line 2821
    if-nez p5, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v6, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    .line 2828
    .local v6, screen:I
    :goto_2
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    instance-of v15, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 2829
    .local v15, aboveShortcut:Z
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    instance-of v0, v2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move/from16 v20, v0

    .line 2831
    .local v20, willBecomeShortcut:Z
    if-eqz v15, :cond_a

    if-eqz v20, :cond_a

    .line 2832
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 2833
    .local v10, sourceInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 2835
    .local v18, destInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-nez p7, :cond_5

    .line 2836
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 2839
    :cond_5
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 2840
    .local v12, folderLocation:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v2

    invoke-virtual {v2, v9, v12}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v13

    .line 2841
    .local v13, scale:F
    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 2843
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v3, 0x0

    aget v7, p5, v3

    const/4 v3, 0x1

    aget v8, p5, v3

    move-object/from16 v3, p4

    move-wide/from16 v4, p2

    invoke-virtual/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/Launcher;->addFolder(Lcom/cyanogenmod/trebuchet/CellLayout;JIII)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v7

    .line 2845
    .local v7, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    const/4 v2, -0x1

    move-object/from16 v0, v18

    iput v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 2846
    const/4 v2, -0x1

    move-object/from16 v0, v18

    iput v2, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 2847
    const/4 v2, -0x1

    iput v2, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 2848
    const/4 v2, -0x1

    iput v2, v10, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 2851
    if-eqz p8, :cond_8

    const/16 v16, 0x1

    .line 2852
    .local v16, animate:Z
    :goto_3
    if-eqz v16, :cond_9

    move-object/from16 v8, v18

    move-object/from16 v11, p8

    move-object/from16 v14, p9

    .line 2853
    invoke-virtual/range {v7 .. v14}, Lcom/cyanogenmod/trebuchet/FolderIcon;->performCreateAnimation(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/view/View;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FLjava/lang/Runnable;)V

    .line 2859
    :goto_4
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2821
    .end local v6           #screen:I
    .end local v7           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v10           #sourceInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v12           #folderLocation:Landroid/graphics/Rect;
    .end local v13           #scale:F
    .end local v15           #aboveShortcut:Z
    .end local v16           #animate:Z
    .end local v18           #destInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v20           #willBecomeShortcut:Z
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v6

    goto/16 :goto_2

    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v6

    goto/16 :goto_2

    .line 2851
    .restart local v6       #screen:I
    .restart local v7       #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .restart local v10       #sourceInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v12       #folderLocation:Landroid/graphics/Rect;
    .restart local v13       #scale:F
    .restart local v15       #aboveShortcut:Z
    .restart local v18       #destInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v20       #willBecomeShortcut:Z
    :cond_8
    const/16 v16, 0x0

    goto :goto_3

    .line 2856
    .restart local v16       #animate:Z
    :cond_9
    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 2857
    invoke-virtual {v7, v10}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    goto :goto_4

    .line 2861
    .end local v7           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v10           #sourceInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v12           #folderLocation:Landroid/graphics/Rect;
    .end local v13           #scale:F
    .end local v16           #animate:Z
    .end local v18           #destInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_a
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public createWidgetBitmap(Lcom/cyanogenmod/trebuchet/ItemInfo;Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 12
    .parameter "widgetInfo"
    .parameter "layout"

    .prologue
    const/high16 v11, 0x4000

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 3869
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v6

    iget v7, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iget v8, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-virtual {v6, v7, v8, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemSize(IIZ)[I

    move-result-object v3

    .line 3871
    .local v3, unScaledSize:[I
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v4

    .line 3872
    .local v4, visibility:I
    invoke-virtual {p2, v9}, Landroid/view/View;->setVisibility(I)V

    .line 3874
    aget v6, v3, v9

    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 3875
    .local v5, width:I
    aget v6, v3, v10

    invoke-static {v6, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 3876
    .local v2, height:I
    aget v6, v3, v9

    aget v7, v3, v10

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 3878
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 3880
    .local v1, c:Landroid/graphics/Canvas;
    invoke-virtual {p2, v5, v2}, Landroid/view/View;->measure(II)V

    .line 3881
    aget v6, v3, v9

    aget v7, v3, v10

    invoke-virtual {p2, v9, v9, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 3882
    invoke-virtual {p2, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 3883
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 3884
    invoke-virtual {p2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3885
    return-object v0
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 8
    .parameter "ev"

    .prologue
    const v7, 0x3f060a92

    .line 854
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 885
    :cond_0
    :goto_0
    return-void

    .line 855
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isFinishedSwitchingState()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 857
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mXDown:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 858
    .local v0, deltaX:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mYDown:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 860
    .local v1, deltaY:F
    const/4 v5, 0x0

    invoke-static {v0, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-eqz v5, :cond_0

    .line 862
    div-float v3, v1, v0

    .line 863
    .local v3, slope:F
    float-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->atan(D)D

    move-result-wide v5

    double-to-float v4, v5

    .line 865
    .local v4, theta:F
    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v0, v5

    if-gtz v5, :cond_2

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v1, v5

    if-lez v5, :cond_3

    .line 866
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cancelCurrentPageLongPress()V

    .line 869
    :cond_3
    const v5, 0x3f860a92

    cmpl-float v5, v4, v5

    if-gtz v5, :cond_0

    .line 872
    cmpl-float v5, v4, v7

    if-lez v5, :cond_4

    .line 877
    sub-float/2addr v4, v7

    .line 878
    div-float v5, v4, v7

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v2, v5

    .line 880
    .local v2, extraRatio:F
    const/high16 v5, 0x3f80

    const/high16 v6, 0x4080

    mul-float/2addr v6, v2

    add-float/2addr v5, v6

    invoke-super {p0, p1, v5}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    goto :goto_0

    .line 883
    .end local v2           #extraRatio:F
    :cond_4
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    goto :goto_0
.end method

.method disableBackground()V
    .locals 1

    .prologue
    .line 1350
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDrawBackground:Z

    .line 1351
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
    .line 4127
    .local p1, container:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedStates:Landroid/util/SparseArray;

    .line 4128
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .parameter "focused"
    .parameter "direction"

    .prologue
    .line 807
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isFinishedSwitchingState()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method enableBackground()V
    .locals 1

    .prologue
    .line 1353
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDrawBackground:Z

    .line 1354
    return-void
.end method

.method enableChildrenCache(II)V
    .locals 6
    .parameter "fromPage"
    .parameter "toPage"

    .prologue
    const/4 v5, 0x1

    .line 1940
    if-le p1, p2, :cond_0

    .line 1941
    move v3, p1

    .line 1942
    .local v3, temp:I
    move p1, p2

    .line 1943
    move p2, v3

    .line 1946
    .end local v3           #temp:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v2

    .line 1948
    .local v2, screenCount:I
    const/4 v4, 0x0

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1949
    add-int/lit8 v4, v2, -0x1

    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 1951
    move v0, p1

    .local v0, i:I
    :goto_0
    if-gt v0, p2, :cond_1

    .line 1952
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1953
    .local v1, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v1, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1954
    invoke-virtual {v1, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setChildrenDrawingCacheEnabled(Z)V

    .line 1951
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1956
    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    return-void
.end method

.method public estimateItemPosition(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)Landroid/graphics/Rect;
    .locals 6
    .parameter "cl"
    .parameter "hCell"
    .parameter "vCell"
    .parameter "hSpan"
    .parameter "vSpan"

    .prologue
    .line 488
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .local v5, r:Landroid/graphics/Rect;
    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    .line 489
    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToRect(IIIILandroid/graphics/Rect;)V

    .line 490
    return-object v5
.end method

.method public estimateItemSize(IIZ)[I
    .locals 9
    .parameter "hSpan"
    .parameter "vSpan"
    .parameter "springLoaded"

    .prologue
    const v3, 0x7fffffff

    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 470
    const/4 v0, 0x2

    new-array v7, v0, [I

    .line 471
    .local v7, size:[I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 472
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .local v1, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object v0, p0

    move v3, v2

    move v4, p1

    move v5, p2

    .line 473
    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemPosition(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)Landroid/graphics/Rect;

    move-result-object v6

    .line 474
    .local v6, r:Landroid/graphics/Rect;
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v0

    aput v0, v7, v2

    .line 475
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    aput v0, v7, v8

    .line 476
    if-eqz p3, :cond_0

    .line 477
    aget v0, v7, v2

    int-to-float v0, v0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedShrinkFactor:F

    mul-float/2addr v0, v3

    float-to-int v0, v0

    aput v0, v7, v2

    .line 478
    aget v0, v7, v8

    int-to-float v0, v0

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedShrinkFactor:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    aput v0, v7, v8

    .line 484
    .end local v1           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v6           #r:Landroid/graphics/Rect;
    :cond_0
    :goto_0
    return-object v7

    .line 482
    :cond_1
    aput v3, v7, v2

    .line 483
    aput v3, v7, v8

    goto :goto_0
.end method

.method public exitWidgetResizeMode()V
    .locals 2

    .prologue
    .line 2131
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    .line 2132
    .local v0, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->clearAllResizeFrames()V

    .line 2133
    return-void
.end method

.method protected flashScrollingIndicator(Z)V
    .locals 1
    .parameter "animated"

    .prologue
    .line 987
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_0

    .line 988
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->flashScrollingIndicator(Z)V

    .line 992
    :goto_0
    return-void

    .line 990
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->showScrollingIndicator(Z)V

    goto :goto_0
.end method

.method getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4264
    .local v0, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v3

    .line 4265
    .local v3, screenCount:I
    const/4 v2, 0x0

    .local v2, screen:I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 4266
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4265
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4268
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    .line 4269
    .local v1, hotseat:Lcom/cyanogenmod/trebuchet/Hotseat;
    if-eqz v1, :cond_1

    .line 4270
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 4271
    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4270
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4274
    :cond_1
    return-object v0
.end method

.method public getBackgroundAlpha()F
    .locals 1

    .prologue
    .line 1392
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    return v0
.end method

.method getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;Z)Landroid/animation/Animator;
    .locals 1
    .parameter "state"
    .parameter "animated"

    .prologue
    .line 2157
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;ZI)Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;ZI)Landroid/animation/Animator;
    .locals 40
    .parameter "state"
    .parameter "animated"
    .parameter "delay"

    .prologue
    .line 2161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_0

    .line 2162
    const/4 v6, 0x0

    .line 2437
    :goto_0
    return-object v6

    .line 2166
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->initAnimationArrays()V

    .line 2168
    if-eqz p2, :cond_17

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v6

    .line 2171
    .local v6, anim:Landroid/animation/AnimatorSet;
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getNextPage()I

    move-result v31

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentPage(I)V

    .line 2173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v17, v0

    .line 2174
    .local v17, oldState:Lcom/cyanogenmod/trebuchet/Workspace$State;
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_18

    const/16 v18, 0x1

    .line 2175
    .local v18, oldStateIsNormal:Z
    :goto_2
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_19

    const/16 v20, 0x1

    .line 2176
    .local v20, oldStateIsSpringLoaded:Z
    :goto_3
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_1a

    const/16 v19, 0x1

    .line 2177
    .local v19, oldStateIsSmall:Z
    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    .line 2178
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_1b

    const/16 v24, 0x1

    .line 2179
    .local v24, stateIsNormal:Z
    :goto_5
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_1c

    const/16 v26, 0x1

    .line 2180
    .local v26, stateIsSpringLoaded:Z
    :goto_6
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_1d

    const/16 v25, 0x1

    .line 2181
    .local v25, stateIsSmall:Z
    :goto_7
    const/high16 v13, 0x3f80

    .line 2182
    .local v13, finalScaleFactor:F
    if-eqz v26, :cond_1e

    const/high16 v12, 0x3f80

    .line 2183
    .local v12, finalBackgroundAlpha:F
    :goto_8
    const/16 v30, 0x1

    .line 2185
    .local v30, zoomIn:Z
    sget-object v31, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_21

    .line 2186
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedShrinkFactor:F

    move/from16 v32, v0

    if-eqz v25, :cond_1f

    const v31, 0x3dcccccd

    :goto_9
    sub-float v13, v32, v31

    .line 2187
    if-eqz v18, :cond_20

    if-eqz v25, :cond_20

    .line 2188
    const/16 v30, 0x0

    .line 2189
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/cyanogenmod/trebuchet/Workspace;->setLayoutScale(F)V

    .line 2190
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 2199
    :goto_a
    if-eqz v30, :cond_22

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v31

    const v32, 0x7f0c0002

    invoke-virtual/range {v31 .. v32}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    .line 2202
    .local v10, duration:I
    :goto_b
    const/4 v14, 0x0

    .local v14, i:I
    :goto_c
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v31

    move/from16 v0, v31

    if-ge v14, v0, :cond_35

    .line 2203
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2204
    .local v8, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/16 v21, 0x0

    .line 2205
    .local v21, rotation:F
    const/16 v22, 0x0

    .line 2206
    .local v22, rotationY:F
    const/16 v27, 0x0

    .line 2207
    .local v27, translationX:F
    const/16 v28, 0x0

    .line 2208
    .local v28, translationY:F
    move/from16 v23, v13

    .line 2209
    .local v23, scale:F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    move/from16 v31, v0

    if-eqz v31, :cond_1

    if-nez v26, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ne v14, v0, :cond_23

    :cond_1
    const/high16 v11, 0x3f80

    .line 2211
    .local v11, finalAlpha:F
    :goto_d
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v16

    .line 2214
    .local v16, initialAlpha:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Tablet:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_2

    if-nez v25, :cond_2

    if-eqz v26, :cond_3

    .line 2215
    :cond_2
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v31

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v32

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getOffsetXForRotation(FII)F

    move-result v27

    .line 2216
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_24

    .line 2217
    const/high16 v22, 0x4148

    .line 2223
    :cond_3
    :goto_e
    if-eqz v24, :cond_10

    .line 2225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->ZoomIn:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->ZoomOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_5

    .line 2226
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-eq v14, v0, :cond_5

    .line 2227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->ZoomIn:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_25

    const/high16 v23, 0x3f00

    .line 2232
    :cond_5
    :goto_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Stack:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_6

    .line 2233
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-gt v14, v0, :cond_26

    .line 2234
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 2235
    const/high16 v31, 0x3f80

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setAlpha(F)V

    .line 2236
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    move/from16 v31, v0

    if-eqz v31, :cond_6

    .line 2237
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 2250
    :cond_6
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Flip:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Accordion:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_8

    .line 2251
    :cond_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ne v14, v0, :cond_27

    .line 2252
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 2259
    :cond_8
    :goto_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->RotateUp:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->RotateDown:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_a

    .line 2260
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->RotateUp:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_28

    const/16 v29, 0x1

    .line 2261
    .local v29, up:Z
    :goto_12
    if-eqz v29, :cond_29

    const/high16 v31, 0x4148

    :goto_13
    const/high16 v32, -0x4080

    const/high16 v33, 0x3f80

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v34, v0

    sub-int v34, v34, v14

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->min(FF)F

    move-result v33

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->max(FF)F

    move-result v32

    mul-float v21, v31, v32

    .line 2262
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v31

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    const/high16 v32, -0x4080

    const/high16 v33, 0x3f80

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v34, v0

    sub-int v34, v14, v34

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->min(FF)F

    move-result v33

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->max(FF)F

    move-result v32

    mul-float v32, v32, v31

    if-eqz v29, :cond_2a

    const/high16 v31, -0x4080

    :goto_14
    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v33, v0

    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v33

    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->sin(D)D

    move-result-wide v33

    move-wide/from16 v0, v33

    double-to-float v0, v0

    move/from16 v33, v0

    mul-float v31, v31, v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    move/from16 v33, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v34

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    const/high16 v35, 0x3f00

    mul-float v34, v34, v35

    add-float v33, v33, v34

    mul-float v31, v31, v33

    add-float v27, v32, v31

    .line 2265
    move/from16 v0, v28

    float-to-double v0, v0

    move-wide/from16 v32, v0

    if-eqz v29, :cond_2b

    const/high16 v31, -0x4080

    :goto_15
    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v34, v0

    const-wide/high16 v36, 0x3ff0

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v38, v0

    invoke-static/range {v38 .. v39}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v38

    invoke-static/range {v38 .. v39}, Ljava/lang/Math;->cos(D)D

    move-result-wide v38

    sub-double v36, v36, v38

    mul-double v34, v34, v36

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mRotatePivotPoint:F

    move/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v36

    move/from16 v0, v36

    int-to-float v0, v0

    move/from16 v36, v0

    const/high16 v37, 0x3f00

    mul-float v36, v36, v37

    add-float v31, v31, v36

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v36, v0

    mul-double v34, v34, v36

    add-double v31, v32, v34

    move-wide/from16 v0, v31

    double-to-float v0, v0

    move/from16 v28, v0

    .line 2270
    .end local v29           #up:Z
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CubeIn:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CubeOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_c

    .line 2271
    :cond_b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_2d

    .line 2272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CubeOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_2c

    const/high16 v22, -0x3d4c

    .line 2279
    :cond_c
    :goto_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CylinderIn:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CylinderOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_e

    .line 2280
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_30

    .line 2281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CylinderOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_2f

    const/high16 v22, -0x3eb8

    .line 2282
    :goto_17
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v31

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 2283
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 2292
    :cond_e
    :goto_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CarouselLeft:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CarouselRight:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_10

    .line 2293
    :cond_f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_32

    .line 2294
    const/high16 v22, 0x42b4

    .line 2301
    :cond_10
    :goto_19
    if-nez v25, :cond_11

    if-eqz v26, :cond_12

    .line 2302
    :cond_11
    const/high16 v31, 0x44a0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    move/from16 v32, v0

    mul-float v31, v31, v32

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 2303
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v31

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    const/high16 v32, 0x3f00

    mul-float v31, v31, v32

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 2304
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v31

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    const/high16 v32, 0x3f00

    mul-float v31, v31, v32

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 2305
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 2308
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Stack:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_12

    .line 2309
    const/high16 v31, 0x3f80

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setAlpha(F)V

    .line 2310
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    move/from16 v31, v0

    if-eqz v31, :cond_12

    .line 2311
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    .line 2317
    :cond_12
    if-eqz v19, :cond_13

    if-nez v24, :cond_14

    :cond_13
    if-eqz v18, :cond_16

    if-eqz v25, :cond_16

    .line 2322
    :cond_14
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-eq v14, v0, :cond_15

    if-eqz p2, :cond_15

    if-eqz v20, :cond_33

    .line 2323
    :cond_15
    const/high16 v11, 0x3f80

    .line 2330
    :cond_16
    :goto_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldAlphas:[F

    move-object/from16 v31, v0

    aput v16, v31, v14

    .line 2331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v31, v0

    aput v11, v31, v14

    .line 2332
    if-eqz p2, :cond_34

    .line 2333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldTranslationXs:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationX()F

    move-result v32

    aput v32, v31, v14

    .line 2334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldTranslationYs:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationY()F

    move-result v32

    aput v32, v31, v14

    .line 2335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldScaleXs:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleX()F

    move-result v32

    aput v32, v31, v14

    .line 2336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldScaleYs:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleY()F

    move-result v32

    aput v32, v31, v14

    .line 2337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldBackgroundAlphas:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getBackgroundAlpha()F

    move-result v32

    aput v32, v31, v14

    .line 2338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldRotations:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getRotation()F

    move-result v32

    aput v32, v31, v14

    .line 2339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldRotationYs:[F

    move-object/from16 v31, v0

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getRotationY()F

    move-result v32

    aput v32, v31, v14

    .line 2341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationXs:[F

    move-object/from16 v31, v0

    aput v27, v31, v14

    .line 2342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationYs:[F

    move-object/from16 v31, v0

    aput v28, v31, v14

    .line 2343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleXs:[F

    move-object/from16 v31, v0

    aput v23, v31, v14

    .line 2344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleYs:[F

    move-object/from16 v31, v0

    aput v23, v31, v14

    .line 2345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v31, v0

    aput v12, v31, v14

    .line 2346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotations:[F

    move-object/from16 v31, v0

    aput v21, v31, v14

    .line 2347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotationYs:[F

    move-object/from16 v31, v0

    aput v22, v31, v14

    .line 2202
    :goto_1b
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_c

    .line 2168
    .end local v6           #anim:Landroid/animation/AnimatorSet;
    .end local v8           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v10           #duration:I
    .end local v11           #finalAlpha:F
    .end local v12           #finalBackgroundAlpha:F
    .end local v13           #finalScaleFactor:F
    .end local v14           #i:I
    .end local v16           #initialAlpha:F
    .end local v17           #oldState:Lcom/cyanogenmod/trebuchet/Workspace$State;
    .end local v18           #oldStateIsNormal:Z
    .end local v19           #oldStateIsSmall:Z
    .end local v20           #oldStateIsSpringLoaded:Z
    .end local v21           #rotation:F
    .end local v22           #rotationY:F
    .end local v23           #scale:F
    .end local v24           #stateIsNormal:Z
    .end local v25           #stateIsSmall:Z
    .end local v26           #stateIsSpringLoaded:Z
    .end local v27           #translationX:F
    .end local v28           #translationY:F
    .end local v30           #zoomIn:Z
    :cond_17
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 2174
    .restart local v6       #anim:Landroid/animation/AnimatorSet;
    .restart local v17       #oldState:Lcom/cyanogenmod/trebuchet/Workspace$State;
    :cond_18
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 2175
    .restart local v18       #oldStateIsNormal:Z
    :cond_19
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 2176
    .restart local v20       #oldStateIsSpringLoaded:Z
    :cond_1a
    const/16 v19, 0x0

    goto/16 :goto_4

    .line 2178
    .restart local v19       #oldStateIsSmall:Z
    :cond_1b
    const/16 v24, 0x0

    goto/16 :goto_5

    .line 2179
    .restart local v24       #stateIsNormal:Z
    :cond_1c
    const/16 v26, 0x0

    goto/16 :goto_6

    .line 2180
    .restart local v26       #stateIsSpringLoaded:Z
    :cond_1d
    const/16 v25, 0x0

    goto/16 :goto_7

    .line 2182
    .restart local v13       #finalScaleFactor:F
    .restart local v25       #stateIsSmall:Z
    :cond_1e
    const/4 v12, 0x0

    goto/16 :goto_8

    .line 2186
    .restart local v12       #finalBackgroundAlpha:F
    .restart local v30       #zoomIn:Z
    :cond_1f
    const/16 v31, 0x0

    goto/16 :goto_9

    .line 2192
    :cond_20
    const/high16 v12, 0x3f80

    .line 2193
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/cyanogenmod/trebuchet/Workspace;->setLayoutScale(F)V

    goto/16 :goto_a

    .line 2196
    :cond_21
    const/high16 v31, 0x3f80

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setLayoutScale(F)V

    goto/16 :goto_a

    .line 2199
    :cond_22
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v31

    const v32, 0x7f0c0009

    invoke-virtual/range {v31 .. v32}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    goto/16 :goto_b

    .line 2209
    .restart local v8       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v10       #duration:I
    .restart local v14       #i:I
    .restart local v21       #rotation:F
    .restart local v22       #rotationY:F
    .restart local v23       #scale:F
    .restart local v27       #translationX:F
    .restart local v28       #translationY:F
    :cond_23
    const/4 v11, 0x0

    goto/16 :goto_d

    .line 2218
    .restart local v11       #finalAlpha:F
    .restart local v16       #initialAlpha:F
    :cond_24
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-le v14, v0, :cond_3

    .line 2219
    const/high16 v22, -0x3eb8

    goto/16 :goto_e

    .line 2227
    :cond_25
    const v23, 0x3f8ccccd

    goto/16 :goto_f

    .line 2240
    :cond_26
    const/16 v31, 0x4

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    .line 2241
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setAlpha(F)V

    .line 2242
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    move/from16 v31, v0

    if-eqz v31, :cond_6

    .line 2243
    const/high16 v31, 0x3f80

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCellLayoutFadeAdjacent(Lcom/cyanogenmod/trebuchet/CellLayout;F)V

    goto/16 :goto_10

    .line 2254
    :cond_27
    const/16 v31, 0x4

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setVisibility(I)V

    goto/16 :goto_11

    .line 2260
    :cond_28
    const/16 v29, 0x0

    goto/16 :goto_12

    .line 2261
    .restart local v29       #up:Z
    :cond_29
    const/high16 v31, -0x3eb8

    goto/16 :goto_13

    .line 2262
    :cond_2a
    const/high16 v31, 0x3f80

    goto/16 :goto_14

    .line 2265
    :cond_2b
    const/high16 v31, 0x3f80

    goto/16 :goto_15

    .line 2272
    .end local v29           #up:Z
    :cond_2c
    const/high16 v22, 0x42b4

    goto/16 :goto_16

    .line 2273
    :cond_2d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-le v14, v0, :cond_c

    .line 2274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CubeOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_2e

    const/high16 v22, 0x42b4

    :goto_1c
    goto/16 :goto_16

    :cond_2e
    const/high16 v22, -0x3d4c

    goto :goto_1c

    .line 2281
    :cond_2f
    const/high16 v22, 0x4148

    goto/16 :goto_17

    .line 2284
    :cond_30
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-le v14, v0, :cond_e

    .line 2285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v31, v0

    sget-object v32, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->CylinderOut:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-ne v0, v1, :cond_31

    const/high16 v22, 0x4148

    .line 2286
    :goto_1d
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 2287
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    goto/16 :goto_18

    .line 2285
    :cond_31
    const/high16 v22, -0x3eb8

    goto :goto_1d

    .line 2295
    :cond_32
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-le v14, v0, :cond_10

    .line 2296
    const/high16 v22, -0x3d4c

    goto/16 :goto_19

    .line 2325
    :cond_33
    const/16 v16, 0x0

    .line 2326
    const/4 v11, 0x0

    goto/16 :goto_1a

    .line 2349
    :cond_34
    move/from16 v0, v27

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 2350
    move/from16 v0, v28

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationY(F)V

    .line 2351
    invoke-virtual {v8, v13}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 2352
    invoke-virtual {v8, v13}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 2353
    invoke-virtual {v8, v12}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlpha(F)V

    .line 2354
    invoke-virtual {v8, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 2355
    move/from16 v0, v21

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotation(F)V

    .line 2356
    move/from16 v0, v22

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    goto/16 :goto_1b

    .line 2360
    .end local v8           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v11           #finalAlpha:F
    .end local v16           #initialAlpha:F
    .end local v21           #rotation:F
    .end local v22           #rotationY:F
    .end local v23           #scale:F
    .end local v27           #translationX:F
    .end local v28           #translationY:F
    :cond_35
    if-eqz p2, :cond_3c

    .line 2362
    const/4 v15, 0x0

    .local v15, index:I
    :goto_1e
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v31

    move/from16 v0, v31

    if-ge v15, v0, :cond_3b

    .line 2363
    move v14, v15

    .line 2377
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2378
    .restart local v8       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v9

    .line 2379
    .local v9, currentAlpha:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    const/16 v32, 0x0

    cmpl-float v31, v31, v32

    if-nez v31, :cond_37

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    const/16 v32, 0x0

    cmpl-float v31, v31, v32

    if-nez v31, :cond_37

    .line 2380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationXs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 2381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationYs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationY(F)V

    .line 2382
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleXs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 2383
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleYs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 2384
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlpha(F)V

    .line 2385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 2386
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotations:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotation(F)V

    .line 2387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotationYs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 2362
    :cond_36
    :goto_1f
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1e

    .line 2389
    :cond_37
    new-instance v4, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    invoke-direct {v4, v8}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 2390
    .local v4, a:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationXs:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->translationX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationYs:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    invoke-virtual/range {v31 .. v32}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->translationY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleXs:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    invoke-virtual/range {v31 .. v32}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleYs:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    invoke-virtual/range {v31 .. v32}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotations:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    invoke-virtual/range {v31 .. v32}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->rotation(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotationYs:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    invoke-virtual/range {v31 .. v32}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->rotationY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    int-to-long v0, v10

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mZoomInInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2398
    invoke-virtual {v6, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 2400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v32, v0

    aget v32, v32, v14

    cmpl-float v31, v31, v32

    if-nez v31, :cond_38

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    cmpl-float v31, v9, v31

    if-eqz v31, :cond_39

    .line 2401
    :cond_38
    new-instance v5, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-direct {v5, v0}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 2403
    .local v5, alphaAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    move/from16 v0, v31

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->alpha(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v31

    int-to-long v0, v10

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mZoomInInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2406
    invoke-virtual {v6, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 2408
    .end local v5           #alphaAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    :cond_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mOldBackgroundAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    const/16 v32, 0x0

    cmpl-float v31, v31, v32

    if-nez v31, :cond_3a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewBackgroundAlphas:[F

    move-object/from16 v31, v0

    aget v31, v31, v14

    const/16 v32, 0x0

    cmpl-float v31, v31, v32

    if-eqz v31, :cond_36

    .line 2410
    :cond_3a
    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [F

    move-object/from16 v31, v0

    fill-array-data v31, :array_0

    invoke-static/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v31

    int-to-long v0, v10

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v7

    .line 2411
    .local v7, bgAnim:Landroid/animation/ValueAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mZoomInInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2412
    new-instance v31, Lcom/cyanogenmod/trebuchet/Workspace$4;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8, v14}, Lcom/cyanogenmod/trebuchet/Workspace$4;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/CellLayout;I)V

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2419
    invoke-virtual {v6, v7}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    goto/16 :goto_1f

    .line 2423
    .end local v4           #a:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .end local v7           #bgAnim:Landroid/animation/ValueAnimator;
    .end local v8           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v9           #currentAlpha:F
    :cond_3b
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->buildPageHardwareLayers()V

    .line 2424
    move/from16 v0, p3

    int-to-long v0, v0

    move-wide/from16 v31, v0

    move-wide/from16 v0, v31

    invoke-virtual {v6, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 2427
    .end local v15           #index:I
    :cond_3c
    if-eqz v26, :cond_3d

    .line 2431
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v31

    const v32, 0x7f0c0001

    invoke-virtual/range {v31 .. v32}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v31

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    const/high16 v32, 0x42c8

    div-float v31, v31, v32

    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->animateBackgroundGradient(FZ)V

    goto/16 :goto_0

    .line 2435
    :cond_3d
    const/16 v31, 0x0

    const/16 v32, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->animateBackgroundGradient(FZ)V

    goto/16 :goto_0

    .line 2410
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
    .line 1346
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineAlpha:F

    return v0
.end method

.method public getContent()Landroid/view/View;
    .locals 0

    .prologue
    .line 2474
    return-object p0
.end method

.method public getCurrentDropLayout()Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 1

    .prologue
    .line 4016
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getNextPage()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    return-object v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 5

    .prologue
    .line 4500
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    .line 4501
    .local v0, page:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0900c4

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

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 4500
    .end local v0           #page:I
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    goto :goto_0
.end method

.method public getDescendantFocusability()I
    .locals 1

    .prologue
    .line 1917
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1918
    const/high16 v0, 0x6

    .line 1920
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->getDescendantFocusability()I

    move-result v0

    goto :goto_0
.end method

.method public getDropTargetDelegate(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Lcom/cyanogenmod/trebuchet/DropTarget;
    .locals 1
    .parameter "d"

    .prologue
    .line 3266
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFolderForTag(Ljava/lang/Object;)Lcom/cyanogenmod/trebuchet/Folder;
    .locals 8
    .parameter "tag"

    .prologue
    .line 4278
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 4280
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 4281
    .local v6, layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 4282
    .local v2, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 4283
    invoke-virtual {v6, v4}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 4284
    .local v0, child:Landroid/view/View;
    instance-of v7, v0, Lcom/cyanogenmod/trebuchet/Folder;

    if-eqz v7, :cond_1

    move-object v3, v0

    .line 4285
    check-cast v3, Lcom/cyanogenmod/trebuchet/Folder;

    .line 4286
    .local v3, f:Lcom/cyanogenmod/trebuchet/Folder;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Folder;->getInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v7

    if-ne v7, p1, :cond_1

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Folder;->getInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v7

    iget-boolean v7, v7, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    if-eqz v7, :cond_1

    .line 4292
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #f:Lcom/cyanogenmod/trebuchet/Folder;
    .end local v4           #i:I
    .end local v6           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :goto_1
    return-object v3

    .line 4282
    .restart local v0       #child:Landroid/view/View;
    .restart local v2       #count:I
    .restart local v4       #i:I
    .restart local v6       #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4292
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v4           #i:I
    .end local v6           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getHitRect(Landroid/graphics/Rect;)V
    .locals 3
    .parameter "outRect"

    .prologue
    const/4 v2, 0x0

    .line 3656
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 3657
    return-void
.end method

.method public getLocationInDragLayer([I)V
    .locals 1
    .parameter "loc"

    .prologue
    .line 4506
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 4507
    return-void
.end method

.method protected getOffsetXForRotation(FII)F
    .locals 5
    .parameter "degrees"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x3f00

    .line 1406
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 1407
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v0}, Landroid/graphics/Camera;->save()V

    .line 1408
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCamera:Landroid/graphics/Camera;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Camera;->rotateY(F)V

    .line 1409
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCamera:Landroid/graphics/Camera;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 1410
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v0}, Landroid/graphics/Camera;->restore()V

    .line 1412
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    neg-int v1, p2

    int-to-float v1, v1

    mul-float/2addr v1, v3

    neg-int v2, p3

    int-to-float v2, v2

    mul-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 1413
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v1, p2

    mul-float/2addr v1, v3

    int-to-float v2, p3

    mul-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1414
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempFloat2:[F

    int-to-float v1, p2

    aput v1, v0, v4

    .line 1415
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempFloat2:[F

    const/4 v1, 0x1

    int-to-float v2, p3

    aput v2, v0, v1

    .line 1416
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempFloat2:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 1417
    int-to-float v0, p2

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempFloat2:[F

    aget v1, v1, v4

    sub-float v1, v0, v1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    const/high16 v0, 0x3f80

    :goto_0
    mul-float/2addr v0, v1

    return v0

    :cond_0
    const/high16 v0, -0x4080

    goto :goto_0
.end method

.method getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;
    .locals 6

    .prologue
    .line 623
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v2

    .line 624
    .local v2, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getChildCount()I

    move-result v1

    .line 625
    .local v1, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v1, :cond_1

    .line 626
    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragLayer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 627
    .local v0, child:Landroid/view/View;
    instance-of v5, v0, Lcom/cyanogenmod/trebuchet/Folder;

    if-eqz v5, :cond_0

    move-object v3, v0

    .line 628
    check-cast v3, Lcom/cyanogenmod/trebuchet/Folder;

    .line 629
    .local v3, folder:Lcom/cyanogenmod/trebuchet/Folder;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Folder;->getInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v5

    iget-boolean v5, v5, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    if-eqz v5, :cond_0

    .line 633
    .end local v0           #child:Landroid/view/View;
    .end local v3           #folder:Lcom/cyanogenmod/trebuchet/Folder;
    :goto_1
    return-object v3

    .line 625
    .restart local v0       #child:Landroid/view/View;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 633
    .end local v0           #child:Landroid/view/View;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 5
    .parameter "v"

    .prologue
    .line 4229
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;

    move-result-object v2

    .line 4230
    .local v2, layouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/CellLayout;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 4231
    .local v1, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->indexOfChild(Landroid/view/View;)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    .line 4235
    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getScrollInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    .prologue
    .line 1180
    new-instance v0, Lcom/cyanogenmod/trebuchet/PagedView$QuadInterpolator;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/PagedView$QuadInterpolator;-><init>()V

    return-object v0
.end method

.method protected getScrollingIndicatorId()I
    .locals 1

    .prologue
    .line 974
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollingIndicatorPosition:I

    packed-switch v0, :pswitch_data_0

    .line 981
    const v0, 0x7f07002f

    :goto_0
    return v0

    .line 976
    :pswitch_0
    const v0, 0x7f07000f

    goto :goto_0

    .line 978
    :pswitch_1
    const v0, 0x7f070011

    goto :goto_0

    .line 974
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getViewForTag(Ljava/lang/Object;)Landroid/view/View;
    .locals 7
    .parameter "tag"

    .prologue
    .line 4296
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v1

    .line 4298
    .local v1, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 4299
    .local v5, layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 4300
    .local v2, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 4301
    invoke-virtual {v5, v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 4302
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-ne v6, p1, :cond_1

    .line 4307
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #i:I
    .end local v5           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :goto_1
    return-object v0

    .line 4300
    .restart local v0       #child:Landroid/view/View;
    .restart local v2       #count:I
    .restart local v3       #i:I
    .restart local v5       #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 4307
    .end local v0           #child:Landroid/view/View;
    .end local v2           #count:I
    .end local v3           #i:I
    .end local v5           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/CellLayout;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4242
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4243
    .local v1, layouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/CellLayout;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v3

    .line 4244
    .local v3, screenCount:I
    const/4 v2, 0x0

    .local v2, screen:I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 4245
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4244
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4247
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    .line 4248
    .local v0, hotseat:Lcom/cyanogenmod/trebuchet/Hotseat;
    if-eqz v0, :cond_1

    .line 4249
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 4250
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4249
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4253
    :cond_1
    return-object v1
.end method

.method hideOutlines()V
    .locals 4

    .prologue
    .line 1321
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v0, :cond_2

    .line 1322
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1323
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1324
    :cond_1
    const-string v0, "childrenOutlineAlpha"

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    .line 1325
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x177

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1326
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 1327
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1329
    :cond_2
    return-void
.end method

.method protected hitsNextPage(FF)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 774
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    .line 778
    .local v0, current:I
    :goto_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_1

    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1, p1, p2}, Lcom/cyanogenmod/trebuchet/Workspace;->hitsPage(IFF)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 774
    .end local v0           #current:I
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    goto :goto_0

    .line 778
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
    .line 763
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    .line 767
    .local v0, current:I
    :goto_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-eqz v1, :cond_1

    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1, p1, p2}, Lcom/cyanogenmod/trebuchet/Workspace;->hitsPage(IFF)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 763
    .end local v0           #current:I
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    goto :goto_0

    .line 767
    .restart local v0       #current:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected initWorkspace()V
    .locals 15

    .prologue
    .line 518
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 519
    .local v1, context:Landroid/content/Context;
    iget v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    iput v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    .line 520
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 521
    .local v0, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getIconCache()Lcom/cyanogenmod/trebuchet/IconCache;

    move-result-object v12

    iput-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 522
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->setWillNotDraw(Z)V

    .line 523
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 525
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 527
    .local v10, res:Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v12

    const-string v13, "layout_inflater"

    invoke-virtual {v12, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/LayoutInflater;

    .line 529
    .local v5, inflater:Landroid/view/LayoutInflater;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    iget v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    if-ge v4, v12, :cond_1

    .line 530
    const v12, 0x7f040026

    const/4 v13, 0x0

    invoke-virtual {v5, v12, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 531
    .local v11, screen:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-boolean v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mStretchScreens:Z

    if-eqz v12, :cond_0

    .line 532
    const/4 v12, -0x1

    const/4 v13, -0x1

    invoke-virtual {v11, v12, v13}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCellGaps(II)V

    .line 534
    :cond_0
    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/Workspace;->addView(Landroid/view/View;)V

    .line 529
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 538
    .end local v11           #screen:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_1
    const v12, 0x7f020001

    :try_start_0
    invoke-virtual {v10, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    iput-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 543
    :goto_1
    iget-boolean v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowSearchBar:Z

    if-nez v12, :cond_2

    .line 544
    const v12, 0x7f0d0070

    invoke-virtual {v10, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v7, v12

    .line 545
    .local v7, paddingLeft:I
    const v12, 0x7f0d0072

    invoke-virtual {v10, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v9, v12

    .line 546
    .local v9, paddingTop:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingRight()I

    move-result v12

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingBottom()I

    move-result v13

    invoke-virtual {p0, v7, v9, v12, v13}, Lcom/cyanogenmod/trebuchet/Workspace;->setPadding(IIII)V

    .line 549
    .end local v7           #paddingLeft:I
    .end local v9           #paddingTop:I
    :cond_2
    iget-boolean v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowHotseat:Z

    if-nez v12, :cond_3

    .line 550
    const v12, 0x7f0d0071

    invoke-virtual {v10, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v8, v12

    .line 551
    .local v8, paddingRight:I
    const v12, 0x7f0d0073

    invoke-virtual {v10, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v6, v12

    .line 552
    .local v6, paddingBottom:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingLeft()I

    move-result v12

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingTop()I

    move-result v13

    invoke-virtual {p0, v12, v13, v8, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->setPadding(IIII)V

    .line 554
    const v12, 0x7f07002f

    invoke-virtual {p0, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 555
    .local v3, dockScrollingIndicator:Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v13, 0x0

    iput v13, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 558
    .end local v3           #dockScrollingIndicator:Landroid/view/View;
    .end local v6           #paddingBottom:I
    .end local v8           #paddingRight:I
    :cond_3
    iget-boolean v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowScrollingIndicator:Z

    if-nez v12, :cond_4

    .line 559
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->disableScrollingIndicator()V

    .line 562
    :cond_4
    new-instance v12, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-direct {v12, p0}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;)V

    iput-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    .line 563
    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v12}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 564
    .local v2, display:Landroid/view/Display;
    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    invoke-virtual {v2, v12}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 565
    iget-boolean v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v12, :cond_5

    .line 566
    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->x:I

    int-to-float v12, v12

    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v13, v13, Landroid/graphics/Point;->x:I

    iget-object v14, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDisplaySize:Landroid/graphics/Point;

    iget v14, v14, Landroid/graphics/Point;->y:I

    invoke-direct {p0, v13, v14}, Lcom/cyanogenmod/trebuchet/Workspace;->wallpaperTravelToScreenWidthRatio(II)F

    move-result v13

    mul-float/2addr v12, v13

    float-to-int v12, v12

    iput v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperTravelWidth:I

    .line 570
    :cond_5
    const v12, 0x3f0ccccd

    const v13, 0x7f0d0022

    invoke-virtual {v10, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    int-to-float v13, v13

    mul-float/2addr v12, v13

    iput v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxDistanceForFolderCreation:F

    .line 571
    const/high16 v12, 0x43fa

    iget v13, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    mul-float/2addr v12, v13

    float-to-int v12, v12

    iput v12, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFlingThresholdVelocity:I

    .line 572
    return-void

    .line 539
    .end local v2           #display:Landroid/view/Display;
    :catch_0
    move-exception v12

    goto/16 :goto_1
.end method

.method isDrawingBackgroundGradient()Z
    .locals 2

    .prologue
    .line 1899
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDrawBackground:Z

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
    .line 4119
    const/4 v0, 0x1

    return v0
.end method

.method public isFinishedSwitchingState()Z
    .locals 2

    .prologue
    .line 798
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionProgress:F

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

.method public isRenderingWallpaper()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 593
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHack:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNumberHomescreens:I

    if-le v1, v0, :cond_0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSmall()Z
    .locals 2

    .prologue
    .line 1936
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSwitchingState()Z
    .locals 1

    .prologue
    .line 792
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    return v0
.end method

.method isTouchActive()Z
    .locals 1

    .prologue
    .line 637
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTouchState:I

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
    .line 3318
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 3319
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v0

    .line 3320
    .local v0, scrollX:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 3321
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 3323
    :cond_0
    const/4 v1, 0x0

    aget v2, p2, v1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int v3, v0, v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 3324
    const/4 v1, 0x1

    aget v2, p2, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollY()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 3325
    return-void
.end method

.method mapPointFromSelfToChild(Landroid/view/View;[F)V
    .locals 1
    .parameter "v"
    .parameter "xy"

    .prologue
    .line 3276
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 3277
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

    .line 3290
    if-nez p3, :cond_0

    .line 3291
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 3292
    iget-object p3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 3294
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v0

    .line 3295
    .local v0, scrollX:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 3296
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 3298
    :cond_1
    aget v1, p2, v3

    int-to-float v2, v0

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v3

    .line 3299
    aget v1, p2, v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollY()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v4

    .line 3300
    invoke-virtual {p3, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 3301
    return-void
.end method

.method mapPointFromSelfToHotseatLayout(Lcom/cyanogenmod/trebuchet/Hotseat;[F)V
    .locals 5
    .parameter "hotseat"
    .parameter "xy"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 3305
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getNextPage()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 3306
    aget v0, p2, v3

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getLeft()I

    move-result v1

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollX()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getNextPage()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    aput v0, p2, v3

    .line 3307
    aget v0, p2, v4

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getTop()I

    move-result v1

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollY()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getNextPage()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    aput v0, p2, v4

    .line 3308
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 3309
    return-void
.end method

.method moveToDefaultScreen(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 4480
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v0, :cond_0

    .line 4481
    if-eqz p1, :cond_1

    .line 4482
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    .line 4487
    :cond_0
    :goto_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4488
    return-void

    .line 4484
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDefaultHomescreen:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentPage(I)V

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 1823
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onAttachedToWindow()V

    .line 1824
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    .line 1825
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->computeScroll()V

    .line 1826
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->setWindowToken(Landroid/os/IBinder;)V

    .line 1827
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 6
    .parameter "parent"
    .parameter "child"

    .prologue
    const/4 v3, 0x1

    .line 598
    instance-of v1, p2, Lcom/cyanogenmod/trebuchet/CellLayout;

    if-nez v1, :cond_0

    .line 599
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "A Workspace can only have CellLayout children."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    move-object v0, p2

    .line 601
    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 602
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 603
    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->setClickable(Z)V

    .line 604
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0900c2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 606
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 610
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 1830
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    .line 1831
    return-void
.end method

.method public onDragEnd()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 504
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsDragOccuring:Z

    .line 505
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 506
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->unlockScreenOrientation(Z)V

    .line 507
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->setChildrenOutlineAlpha(F)V

    .line 510
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->disableAndFlushInstallQueue(Landroid/content/Context;)V

    .line 511
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver;->disableAndFlushUninstallQueue(Landroid/content/Context;)V

    .line 512
    return-void
.end method

.method public onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, 0x0

    .line 3096
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->onDragEnter()V

    .line 3097
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    .line 3098
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAddToExistingFolderOnDrop:Z

    .line 3100
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3101
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentDropLayout()Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v0

    .line 3102
    .local v0, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3103
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3107
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowOutlines:Z

    if-eqz v1, :cond_0

    .line 3108
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->showOutlines()V

    .line 3110
    :cond_0
    return-void
.end method

.method public onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 7
    .parameter "d"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 3151
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->onDragExit()V

    .line 3155
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    if-eqz v1, :cond_4

    .line 3156
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-wide v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->container:J

    const-wide/16 v3, -0x65

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    .line 3158
    .local v0, target:Lcom/cyanogenmod/trebuchet/PagedView;
    :goto_0
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedView;->isPageMoving()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3161
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedView;->getNextPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3169
    .end local v0           #target:Lcom/cyanogenmod/trebuchet/PagedView;
    :goto_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-ne v1, v5, :cond_5

    .line 3170
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    .line 3176
    :cond_0
    :goto_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->onResetScrollArea()V

    .line 3177
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3178
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3180
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedDragController:Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->cancel()V

    .line 3182
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsPageMoving:Z

    if-nez v1, :cond_1

    .line 3183
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->hideOutlines()V

    .line 3185
    :cond_1
    return-void

    :cond_2
    move-object v0, p0

    .line 3156
    goto :goto_0

    .line 3163
    .restart local v0       #target:Lcom/cyanogenmod/trebuchet/PagedView;
    :cond_3
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    goto :goto_1

    .line 3166
    .end local v0           #target:Lcom/cyanogenmod/trebuchet/PagedView;
    :cond_4
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    goto :goto_1

    .line 3171
    :cond_5
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 3172
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mAddToExistingFolderOnDrop:Z

    goto :goto_2
.end method

.method public onDragOver(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 30
    .parameter "d"

    .prologue
    .line 3433
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-ne v2, v3, :cond_1

    .line 3550
    :cond_0
    :goto_0
    return-void

    .line 3435
    :cond_1
    new-instance v29, Landroid/graphics/Rect;

    invoke-direct/range {v29 .. v29}, Landroid/graphics/Rect;-><init>()V

    .line 3436
    .local v29, r:Landroid/graphics/Rect;
    const/16 v27, 0x0

    .line 3437
    .local v27, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3440
    .local v26, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v26

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    if-ltz v2, :cond_2

    move-object/from16 v0, v26

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    if-gez v2, :cond_3

    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Improper spans found"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3441
    :cond_3
    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    .line 3444
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-nez v2, :cond_b

    const/4 v13, 0x0

    .line 3446
    .local v13, child:Landroid/view/View;
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 3447
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-direct/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/Workspace;->isExternalDragWidget(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 3448
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 3449
    move-object/from16 v0, p1

    iget v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3450
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    int-to-float v3, v3

    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->findMatchingPageForDragOver(FFZ)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v27

    .line 3453
    :cond_4
    if-nez v27, :cond_5

    .line 3454
    move-object/from16 v0, p1

    iget v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    int-to-float v2, v2

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    int-to-float v3, v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->findMatchingPageForDragOver(FFZ)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v27

    .line 3456
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, v27

    if-eq v0, v2, :cond_7

    .line 3458
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3459
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3461
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-ne v2, v3, :cond_c

    const/16 v25, 0x1

    .line 3462
    .local v25, isInSpringLoadedMode:Z
    :goto_2
    if-nez v25, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 3463
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedDragController:Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->setAlarm(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3487
    .end local v25           #isInSpringLoadedMode:Z
    :cond_7
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_10

    const/high16 v2, 0x3f80

    :goto_4
    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->setChildrenOutlineAlpha(F)V

    .line 3490
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v2, :cond_0

    .line 3492
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 3493
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/cyanogenmod/trebuchet/Hotseat;[F)V

    .line 3498
    :goto_5
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3500
    .local v24, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v3, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x1

    aget v2, v2, v4

    float-to-int v4, v2

    move-object/from16 v0, v26

    iget v5, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move-object/from16 v0, v26

    iget v6, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 3504
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropOverCell(II)V

    .line 3506
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v5, 0x1

    aget v4, v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    invoke-virtual {v2, v3, v4, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v6

    .line 3509
    .local v6, targetCellDistance:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v7

    .line 3512
    .local v7, dragOverView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v2, p0

    move-object/from16 v3, v24

    invoke-direct/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/Workspace;->manageFolderFeedback(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFLandroid/view/View;)V

    .line 3515
    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v17, v0

    .line 3516
    .local v17, minSpanX:I
    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v18, v0

    .line 3517
    .local v18, minSpanY:I
    move-object/from16 v0, v26

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    if-lez v2, :cond_8

    move-object/from16 v0, v26

    iget v2, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    if-lez v2, :cond_8

    .line 3518
    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    move/from16 v17, v0

    .line 3519
    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    move/from16 v18, v0

    .line 3522
    :cond_8
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v9, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v10, v2

    move-object/from16 v0, v26

    iget v11, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move-object/from16 v0, v26

    iget v12, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    invoke-virtual/range {v8 .. v14}, Lcom/cyanogenmod/trebuchet/CellLayout;->isNearestDropLocationOccupied(IIIILandroid/view/View;[I)Z

    move-result v28

    .line 3526
    .local v28, nearestDropOccupied:Z
    if-nez v28, :cond_12

    .line 3527
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    float-to-int v15, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    float-to-int v0, v2

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x0

    aget v17, v2, v3

    .end local v17           #minSpanX:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v3, 0x1

    aget v18, v2, v3

    .end local v18           #minSpanY:I
    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v19, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getDragVisualizeOffset()Landroid/graphics/Point;

    move-result-object v22

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getDragRegion()Landroid/graphics/Rect;

    move-result-object v23

    invoke-virtual/range {v12 .. v23}, Lcom/cyanogenmod/trebuchet/CellLayout;->visualizeDropLocation(Landroid/view/View;Landroid/graphics/Bitmap;IIIIIIZLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 3543
    :cond_9
    :goto_6
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_a

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_a

    if-nez v28, :cond_0

    .line 3545
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v2, :cond_0

    .line 3546
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->revertTempState()V

    goto/16 :goto_0

    .line 3444
    .end local v6           #targetCellDistance:F
    .end local v7           #dragOverView:Landroid/view/View;
    .end local v13           #child:Landroid/view/View;
    .end local v24           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v28           #nearestDropOccupied:Z
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v13, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    goto/16 :goto_1

    .line 3461
    .restart local v13       #child:Landroid/view/View;
    :cond_c
    const/16 v25, 0x0

    goto/16 :goto_2

    .line 3468
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    if-eqz v2, :cond_e

    invoke-direct/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/Workspace;->isDragWidget(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 3469
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 3470
    move-object/from16 v0, p1

    iget v2, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    move-object/from16 v0, v29

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 3471
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    move-object/from16 v0, p1

    iget v3, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    int-to-float v3, v3

    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->findMatchingPageForDragOver(FFZ)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v27

    .line 3474
    :cond_e
    if-nez v27, :cond_f

    .line 3475
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentDropLayout()Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v27

    .line 3477
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, v27

    if-eq v0, v2, :cond_7

    .line 3478
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3479
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3481
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 3482
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedDragController:Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->setAlarm(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    goto/16 :goto_3

    .line 3487
    :cond_10
    const/4 v2, 0x0

    goto/16 :goto_4

    .line 3495
    :cond_11
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto/16 :goto_5

    .line 3531
    .restart local v6       #targetCellDistance:F
    .restart local v7       #dragOverView:Landroid/view/View;
    .restart local v17       #minSpanX:I
    .restart local v18       #minSpanY:I
    .restart local v24       #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v28       #nearestDropOccupied:Z
    :cond_12
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-eqz v2, :cond_13

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_9

    :cond_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Alarm;->alarmPending()Z

    move-result v2

    if-nez v2, :cond_9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderX:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    if-ne v2, v3, :cond_14

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLastReorderY:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    if-eq v2, v3, :cond_9

    .line 3537
    :cond_14
    new-instance v14, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v16, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v19, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v21, v0

    move-object/from16 v15, p0

    move-object/from16 v22, v13

    invoke-direct/range {v14 .. v22}, Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;[FIIIILcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;)V

    .line 3539
    .local v14, listener:Lcom/cyanogenmod/trebuchet/Workspace$ReorderAlarmListener;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v2, v14}, Lcom/cyanogenmod/trebuchet/Alarm;->setOnAlarmListener(Lcom/cyanogenmod/trebuchet/OnAlarmListener;)V

    .line 3540
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mReorderAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    const-wide/16 v3, 0xfa

    invoke-virtual {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/Alarm;->setAlarm(J)V

    goto/16 :goto_6
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 1
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 494
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsDragOccuring:Z

    .line 495
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 496
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->lockScreenOrientation()V

    .line 497
    const/high16 v0, 0x3f80

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setChildrenBackgroundAlphaMultipliers(F)V

    .line 499
    invoke-static {}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->enableInstallQueue()V

    .line 500
    invoke-static {}, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver;->enableUninstallQueue()V

    .line 501
    return-void
.end method

.method public onDragStartedWithItem(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 2114
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 2117
    .local v0, canvas:Landroid/graphics/Canvas;
    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 2118
    return-void
.end method

.method public onDragStartedWithItem(Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;Landroid/graphics/Bitmap;Z)V
    .locals 8
    .parameter "info"
    .parameter "b"
    .parameter "clipAlpha"

    .prologue
    const/4 v4, 0x0

    .line 2121
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2}, Landroid/graphics/Canvas;-><init>()V

    .line 2123
    .local v2, canvas:Landroid/graphics/Canvas;
    iget v0, p1, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanX:I

    iget v1, p1, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanY:I

    invoke-virtual {p0, v0, v1, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemSize(IIZ)[I

    move-result-object v7

    .line 2126
    .local v7, size:[I
    const/4 v3, 0x2

    aget v4, v7, v4

    const/4 v0, 0x1

    aget v5, v7, v0

    move-object v0, p0

    move-object v1, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Workspace;->createDragOutline(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;IIIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 2128
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .parameter "canvas"

    .prologue
    const/4 v9, 0x1

    const/4 v11, 0x0

    .line 1851
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v7, :cond_2

    .line 1852
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->updateWallpaperOffsets()V

    .line 1858
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isRenderingWallpaper()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1859
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v7

    int-to-float v5, v7

    .line 1860
    .local v5, x:F
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollY()I

    move-result v7

    int-to-float v6, v7

    .line 1862
    .local v6, y:F
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWidth()I

    move-result v4

    .line 1863
    .local v4, width:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getHeight()I

    move-result v1

    .line 1864
    .local v1, height:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 1865
    .local v3, wallpaperWidth:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 1867
    .local v2, wallpaperHeight:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v7, v7, v11

    add-int/2addr v7, v4

    if-le v7, v3, :cond_3

    .line 1869
    sub-int v7, v4, v3

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    add-float/2addr v5, v7

    .line 1873
    :goto_1
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v7, v7, v9

    add-int/2addr v7, v1

    if-le v7, v2, :cond_4

    .line 1875
    sub-int v7, v1, v2

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    add-float/2addr v6, v7

    .line 1880
    :goto_2
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperBitmap:Landroid/graphics/Bitmap;

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v5, v6, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1884
    .end local v1           #height:I
    .end local v2           #wallpaperHeight:I
    .end local v3           #wallpaperWidth:I
    .end local v4           #width:I
    .end local v5           #x:F
    .end local v6           #y:F
    :cond_0
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_1

    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    const/4 v8, 0x0

    cmpl-float v7, v7, v8

    if-lez v7, :cond_1

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDrawBackground:Z

    if-eqz v7, :cond_1

    .line 1885
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    const/high16 v8, 0x437f

    mul-float/2addr v7, v8

    float-to-int v0, v7

    .line 1886
    .local v0, alpha:I
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1887
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v8

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v9

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredHeight()I

    move-result v10

    invoke-virtual {v7, v8, v11, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1889
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1892
    .end local v0           #alpha:I
    :cond_1
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onDraw(Landroid/graphics/Canvas;)V

    .line 1895
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBindPages:Ljava/lang/Runnable;

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 1896
    return-void

    .line 1854
    :cond_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->centerWallpaperOffset()V

    goto/16 :goto_0

    .line 1871
    .restart local v1       #height:I
    .restart local v2       #wallpaperHeight:I
    .restart local v3       #wallpaperWidth:I
    .restart local v4       #width:I
    .restart local v5       #x:F
    .restart local v6       #y:F
    :cond_3
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v8, v8, v11

    add-int/2addr v8, v4

    sub-int v8, v3, v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v8, v8, v11

    int-to-float v8, v8

    add-float/2addr v7, v8

    sub-float/2addr v5, v7

    goto :goto_1

    .line 1877
    :cond_4
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v8, v8, v9

    add-int/2addr v8, v1

    sub-int v8, v2, v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    aget v8, v8, v9

    int-to-float v8, v8

    add-float/2addr v7, v8

    sub-float/2addr v6, v7

    goto :goto_2
.end method

.method public onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 62
    .parameter "d"

    .prologue
    .line 2888
    move-object/from16 v0, p1

    iget v5, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->x:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->y:I

    move-object/from16 v0, p1

    iget v7, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->xOffset:I

    move-object/from16 v0, p1

    iget v8, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->yOffset:I

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lcom/cyanogenmod/trebuchet/Workspace;->getDragViewVisualCenter(IIIILcom/cyanogenmod/trebuchet/DragView;[F)[F

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    .line 2891
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDropToLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2894
    .local v7, dropTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v7, :cond_0

    .line 2895
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2896
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToHotseatLayout(Lcom/cyanogenmod/trebuchet/Hotseat;[F)V

    .line 2902
    :cond_0
    :goto_0
    const/16 v61, -0x1

    .line 2903
    .local v61, snapScreen:I
    const/16 v59, 0x0

    .line 2904
    .local v59, resizeOnDrop:Z
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragSource:Lcom/cyanogenmod/trebuchet/DragSource;

    move-object/from16 v0, p0

    if-eq v4, v0, :cond_3

    .line 2905
    const/4 v4, 0x2

    new-array v5, v4, [I

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v8, 0x0

    aget v6, v6, v8

    float-to-int v6, v6

    aput v6, v5, v4

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v8, 0x1

    aget v6, v6, v8

    float-to-int v6, v6

    aput v6, v5, v4

    .line 2907
    .local v5, touchXY:[I
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v4, p0

    move-object/from16 v9, p1

    invoke-direct/range {v4 .. v9}, Lcom/cyanogenmod/trebuchet/Workspace;->onDropExternal([ILjava/lang/Object;Lcom/cyanogenmod/trebuchet/CellLayout;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 3071
    .end local v5           #touchXY:[I
    :cond_1
    :goto_1
    return-void

    .line 2898
    .end local v59           #resizeOnDrop:Z
    .end local v61           #snapScreen:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v4, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    goto :goto_0

    .line 2908
    .restart local v59       #resizeOnDrop:Z
    .restart local v61       #snapScreen:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v4, :cond_1

    .line 2909
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v0, v4, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    move-object/from16 v27, v0

    .line 2911
    .local v27, cell:Landroid/view/View;
    const/16 v60, 0x0

    .line 2912
    .local v60, resizeRunnable:Ljava/lang/Runnable;
    if-eqz v7, :cond_b

    .line 2914
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v4

    if-eq v4, v7, :cond_c

    const/16 v53, 0x1

    .line 2915
    .local v53, hasMovedLayouts:Z
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v52

    .line 2916
    .local v52, hasMovedIntoHotseat:Z
    if-eqz v52, :cond_d

    const-wide/16 v15, -0x65

    .line 2919
    .local v15, container:J
    :goto_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x0

    aget v4, v4, v6

    if-gez v4, :cond_e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v0, v4, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    move/from16 v34, v0

    .line 2925
    .local v34, screen:I
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v4, :cond_10

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v11, v4, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    .line 2926
    .local v11, spanX:I
    :goto_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v4, :cond_11

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v12, v4, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    .line 2930
    .local v12, spanY:I
    :goto_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x0

    aget v4, v4, v6

    float-to-int v9, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x1

    aget v4, v4, v6

    float-to-int v10, v4

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v8, p0

    move-object v13, v7

    invoke-direct/range {v8 .. v14}, Lcom/cyanogenmod/trebuchet/Workspace;->findNearestArea(IIIILcom/cyanogenmod/trebuchet/CellLayout;[I)[I

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 2932
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x0

    aget v4, v4, v6

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v8, 0x1

    aget v6, v6, v8

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    invoke-virtual {v7, v4, v6, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDistanceFromCell(FF[I)F

    move-result v19

    .line 2937
    .local v19, distance:F
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    if-nez v4, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v18, v0

    const/16 v20, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v13, p0

    move-object/from16 v14, v27

    move-object/from16 v17, v7

    invoke-virtual/range {v13 .. v22}, Lcom/cyanogenmod/trebuchet/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/cyanogenmod/trebuchet/CellLayout;[IFZLcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 2942
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v22, v0

    const/16 v25, 0x0

    move-object/from16 v20, p0

    move-object/from16 v21, v7

    move/from16 v23, v19

    move-object/from16 v24, p1

    invoke-virtual/range {v20 .. v25}, Lcom/cyanogenmod/trebuchet/Workspace;->addToExistingFolderIfNecessary(Lcom/cyanogenmod/trebuchet/CellLayout;[IFLcom/cyanogenmod/trebuchet/DropTarget$DragObject;Z)Z

    move-result v4

    if-nez v4, :cond_1

    .line 2949
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    move-object/from16 v56, v0

    check-cast v56, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2950
    .local v56, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v56

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v23, v0

    .line 2951
    .local v23, minSpanX:I
    move-object/from16 v0, v56

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v24, v0

    .line 2952
    .local v24, minSpanY:I
    move-object/from16 v0, v56

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    if-lez v4, :cond_5

    move-object/from16 v0, v56

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    if-lez v4, :cond_5

    .line 2953
    move-object/from16 v0, v56

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    move/from16 v23, v0

    .line 2954
    move-object/from16 v0, v56

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    move/from16 v24, v0

    .line 2957
    :cond_5
    const/4 v4, 0x2

    new-array v0, v4, [I

    move-object/from16 v29, v0

    .line 2958
    .local v29, resultSpan:[I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x0

    aget v4, v4, v6

    float-to-int v0, v4

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragViewVisualCenter:[F

    const/4 v6, 0x1

    aget v4, v4, v6

    float-to-int v0, v4

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    move-object/from16 v28, v0

    const/16 v30, 0x1

    move-object/from16 v20, v7

    move/from16 v25, v11

    move/from16 v26, v12

    invoke-virtual/range {v20 .. v30}, Lcom/cyanogenmod/trebuchet/CellLayout;->createArea(IIIIIILandroid/view/View;[I[II)[I

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    .line 2962
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x0

    aget v4, v4, v6

    if-ltz v4, :cond_12

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x1

    aget v4, v4, v6

    if-ltz v4, :cond_12

    const/16 v51, 0x1

    .line 2965
    .local v51, foundCell:Z
    :goto_7
    if-eqz v51, :cond_7

    move-object/from16 v0, v27

    instance-of v4, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v4, :cond_7

    const/4 v4, 0x0

    aget v4, v29, v4

    move-object/from16 v0, v56

    iget v6, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    if-ne v4, v6, :cond_6

    const/4 v4, 0x1

    aget v4, v29, v4

    move-object/from16 v0, v56

    iget v6, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    if-eq v4, v6, :cond_7

    .line 2967
    :cond_6
    const/16 v59, 0x1

    .line 2968
    const/4 v4, 0x0

    aget v4, v29, v4

    move-object/from16 v0, v56

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 2969
    const/4 v4, 0x1

    aget v4, v29, v4

    move-object/from16 v0, v56

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move-object/from16 v48, v27

    .line 2970
    check-cast v48, Landroid/appwidget/AppWidgetHostView;

    .line 2971
    .local v48, awhv:Landroid/appwidget/AppWidgetHostView;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v6, 0x0

    aget v6, v29, v6

    const/4 v8, 0x1

    aget v8, v29, v8

    move-object/from16 v0, v48

    invoke-static {v0, v4, v6, v8}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/cyanogenmod/trebuchet/Launcher;II)V

    .line 2975
    .end local v48           #awhv:Landroid/appwidget/AppWidgetHostView;
    :cond_7
    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    move/from16 v0, v34

    if-eq v4, v0, :cond_13

    if-nez v52, :cond_13

    .line 2976
    move/from16 v61, v34

    .line 2977
    move-object/from16 v0, p0

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    .line 2983
    :cond_8
    :goto_8
    if-eqz v51, :cond_14

    .line 2984
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v55

    check-cast v55, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2985
    .local v55, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-eqz v53, :cond_9

    .line 2987
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 2988
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x0

    aget v35, v4, v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x1

    aget v36, v4, v6

    move-object/from16 v0, v55

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move/from16 v37, v0

    move-object/from16 v0, v55

    iget v0, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move/from16 v38, v0

    move-object/from16 v30, p0

    move-object/from16 v31, v27

    move-wide/from16 v32, v15

    invoke-virtual/range {v30 .. v38}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIII)V

    .line 2993
    :cond_9
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v58

    check-cast v58, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2994
    .local v58, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x0

    aget v4, v4, v6

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    .line 2995
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x1

    aget v4, v4, v6

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 2996
    move-object/from16 v0, v56

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 2997
    move-object/from16 v0, v56

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    move-object/from16 v0, v58

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    .line 2998
    const/4 v4, 0x1

    move-object/from16 v0, v58

    iput-boolean v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 2999
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v4, v4, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v8, 0x0

    aget v6, v6, v8

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v9, 0x1

    aget v8, v8, v9

    move-wide v0, v15

    invoke-static {v0, v1, v4, v6, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getCellLayoutChildId(JIII)I

    move-result v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/view/View;->setId(I)V

    .line 3002
    const-wide/16 v8, -0x65

    cmp-long v4, v15, v8

    if-eqz v4, :cond_a

    move-object/from16 v0, v27

    instance-of v4, v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    if-eqz v4, :cond_a

    .line 3004
    move-object/from16 v49, v7

    .local v49, cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v54, v27

    .line 3008
    check-cast v54, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    .line 3009
    .local v54, hostView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;
    new-instance v47, Lcom/cyanogenmod/trebuchet/Workspace$5;

    move-object/from16 v0, v47

    move-object/from16 v1, p0

    move-object/from16 v2, v54

    move-object/from16 v3, v49

    invoke-direct {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace$5;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3015
    .local v47, addResizeFrame:Ljava/lang/Runnable;
    new-instance v60, Lcom/cyanogenmod/trebuchet/Workspace$6;

    .end local v60           #resizeRunnable:Ljava/lang/Runnable;
    move-object/from16 v0, v60

    move-object/from16 v1, p0

    move-object/from16 v2, v47

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace$6;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)V

    .line 3026
    .end local v47           #addResizeFrame:Ljava/lang/Runnable;
    .end local v49           #cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v54           #hostView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;
    .restart local v60       #resizeRunnable:Ljava/lang/Runnable;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v30, v0

    move-object/from16 v0, v58

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    move/from16 v35, v0

    move-object/from16 v0, v58

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    move/from16 v36, v0

    move-object/from16 v31, v55

    move-wide/from16 v32, v15

    invoke-static/range {v30 .. v36}, Lcom/cyanogenmod/trebuchet/LauncherModel;->moveItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIII)V

    .line 3038
    .end local v11           #spanX:I
    .end local v12           #spanY:I
    .end local v15           #container:J
    .end local v19           #distance:F
    .end local v23           #minSpanX:I
    .end local v24           #minSpanY:I
    .end local v29           #resultSpan:[I
    .end local v34           #screen:I
    .end local v51           #foundCell:Z
    .end local v52           #hasMovedIntoHotseat:Z
    .end local v53           #hasMovedLayouts:Z
    .end local v55           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v56           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v58           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_b
    :goto_9
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v37

    check-cast v37, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3039
    .local v37, parent:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v50, v60

    .line 3042
    .local v50, finalResizeRunnable:Ljava/lang/Runnable;
    new-instance v39, Lcom/cyanogenmod/trebuchet/Workspace$7;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    move-object/from16 v2, v50

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace$7;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)V

    .line 3052
    .local v39, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mAnimatingViewIntoPlace:Z

    .line 3053
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/DragView;->hasDrawn()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 3054
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3055
    .local v36, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v36

    iget v4, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    const/4 v6, 0x4

    if-ne v4, v6, :cond_16

    .line 3056
    if-eqz v59, :cond_15

    const/16 v40, 0x2

    .line 3058
    .local v40, animationType:I
    :goto_a
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v38, v0

    const/16 v42, 0x0

    move-object/from16 v35, p0

    move-object/from16 v41, v27

    invoke-virtual/range {v35 .. v42}, Lcom/cyanogenmod/trebuchet/Workspace;->animateWidgetDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 3069
    .end local v36           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v40           #animationType:I
    :goto_b
    move-object/from16 v0, v37

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->onDropChild(Landroid/view/View;)V

    goto/16 :goto_1

    .line 2914
    .end local v37           #parent:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v39           #onCompleteRunnable:Ljava/lang/Runnable;
    .end local v50           #finalResizeRunnable:Ljava/lang/Runnable;
    :cond_c
    const/16 v53, 0x0

    goto/16 :goto_2

    .line 2916
    .restart local v52       #hasMovedIntoHotseat:Z
    .restart local v53       #hasMovedLayouts:Z
    :cond_d
    const-wide/16 v15, -0x64

    goto/16 :goto_3

    .line 2919
    .restart local v15       #container:J
    :cond_e
    if-eqz v52, :cond_f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v6

    invoke-virtual {v6, v7}, Lcom/cyanogenmod/trebuchet/Hotseat;->indexOfChild(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v34

    goto/16 :goto_4

    :cond_f
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v34

    goto/16 :goto_4

    .line 2925
    .restart local v34       #screen:I
    :cond_10
    const/4 v11, 0x1

    goto/16 :goto_5

    .line 2926
    .restart local v11       #spanX:I
    :cond_11
    const/4 v12, 0x1

    goto/16 :goto_6

    .line 2962
    .restart local v12       #spanY:I
    .restart local v19       #distance:F
    .restart local v23       #minSpanX:I
    .restart local v24       #minSpanY:I
    .restart local v29       #resultSpan:[I
    .restart local v56       #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_12
    const/16 v51, 0x0

    goto/16 :goto_7

    .line 2978
    .restart local v51       #foundCell:Z
    :cond_13
    if-eqz v52, :cond_8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v6

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCurrentPage()I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v4

    move/from16 v0, v34

    if-eq v4, v0, :cond_8

    .line 2980
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v4

    move/from16 v0, v34

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->snapToPage(I)V

    goto/16 :goto_8

    .line 3030
    :cond_14
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v58

    check-cast v58, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3031
    .restart local v58       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x0

    move-object/from16 v0, v58

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    aput v8, v4, v6

    .line 3032
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mTargetCell:[I

    const/4 v6, 0x1

    move-object/from16 v0, v58

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    aput v8, v4, v6

    .line 3033
    invoke-virtual/range {v27 .. v27}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v57

    check-cast v57, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3034
    .local v57, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, v57

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;)V

    goto/16 :goto_9

    .line 3056
    .end local v11           #spanX:I
    .end local v12           #spanY:I
    .end local v15           #container:J
    .end local v19           #distance:F
    .end local v23           #minSpanX:I
    .end local v24           #minSpanY:I
    .end local v29           #resultSpan:[I
    .end local v34           #screen:I
    .end local v51           #foundCell:Z
    .end local v52           #hasMovedIntoHotseat:Z
    .end local v53           #hasMovedLayouts:Z
    .end local v56           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v57           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v58           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .restart local v36       #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v37       #parent:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v39       #onCompleteRunnable:Ljava/lang/Runnable;
    .restart local v50       #finalResizeRunnable:Ljava/lang/Runnable;
    :cond_15
    const/16 v40, 0x0

    goto/16 :goto_a

    .line 3061
    :cond_16
    if-gez v61, :cond_17

    const/16 v44, -0x1

    .line 3062
    .local v44, duration:I
    :goto_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v41

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    move-object/from16 v42, v0

    move-object/from16 v43, v27

    move-object/from16 v45, v39

    move-object/from16 v46, p0

    invoke-virtual/range {v41 .. v46}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateViewIntoPosition(Lcom/cyanogenmod/trebuchet/DragView;Landroid/view/View;ILjava/lang/Runnable;Landroid/view/View;)V

    goto/16 :goto_b

    .line 3061
    .end local v44           #duration:I
    :cond_17
    const/16 v44, 0x12c

    goto :goto_c

    .line 3066
    .end local v36           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_18
    const/4 v4, 0x0

    move-object/from16 v0, p1

    iput-boolean v4, v0, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 3067
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_b
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V
    .locals 5
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 4052
    if-eqz p4, :cond_1

    .line 4053
    if-eq p1, p0, :cond_0

    .line 4054
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v1, :cond_0

    .line 4055
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getParentCellLayoutForView(Landroid/view/View;)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 4056
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/DropTarget;

    if-eqz v1, :cond_0

    .line 4057
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    check-cast v1, Lcom/cyanogenmod/trebuchet/DropTarget;

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/DragController;->removeDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 4073
    :cond_0
    :goto_0
    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 4074
    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 4077
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    .line 4078
    return-void

    .line 4061
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v1, :cond_0

    .line 4063
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4064
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 4068
    .local v0, cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :goto_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->onDropChild(Landroid/view/View;)V

    .line 4069
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 4070
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 4066
    .end local v0           #cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .restart local v0       #cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    goto :goto_1
.end method

.method public onEnterScrollArea(III)Z
    .locals 8
    .parameter "x"
    .parameter "y"
    .parameter "direction"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 4173
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLandscape(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_0

    move v0, v5

    .line 4174
    .local v0, isPortrait:Z
    :goto_0
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v7

    if-eqz v7, :cond_1

    if-eqz v0, :cond_1

    .line 4175
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 4176
    .local v3, r:Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v7

    invoke-virtual {v7, v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getHitRect(Landroid/graphics/Rect;)V

    .line 4177
    invoke-virtual {v3, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 4202
    .end local v3           #r:Landroid/graphics/Rect;
    :goto_1
    return v6

    .end local v0           #isPortrait:Z
    :cond_0
    move v0, v6

    .line 4173
    goto :goto_0

    .line 4182
    .restart local v0       #isPortrait:Z
    :cond_1
    const/4 v4, 0x0

    .line 4183
    .local v4, result:Z
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v6

    if-nez v6, :cond_3

    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v6, :cond_3

    .line 4184
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    .line 4186
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getNextPage()I

    move-result v6

    if-nez p3, :cond_2

    const/4 v5, -0x1

    :cond_2
    add-int v2, v6, v5

    .line 4190
    .local v2, page:I
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 4192
    if-ltz v2, :cond_3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 4193
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 4194
    .local v1, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 4198
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 4199
    const/4 v4, 0x1

    .end local v1           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #page:I
    :cond_3
    move v6, v4

    .line 4202
    goto :goto_1
.end method

.method public onExitScrollArea()Z
    .locals 3

    .prologue
    .line 4207
    const/4 v1, 0x0

    .line 4208
    .local v1, result:Z
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    if-eqz v2, :cond_0

    .line 4209
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 4210
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentDropLayout()Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v0

    .line 4211
    .local v0, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 4212
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 4214
    const/4 v1, 0x1

    .line 4215
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mInScrollArea:Z

    .line 4217
    .end local v0           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return v1
.end method

.method public onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 0
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vec"

    .prologue
    .line 4111
    return-void
.end method

.method public onFlingToDeleteCompleted()V
    .locals 0

    .prologue
    .line 4116
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "ev"

    .prologue
    .line 812
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    sparse-switch v1, :sswitch_data_0

    .line 826
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 814
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mXDown:F

    .line 815
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mYDown:F

    goto :goto_0

    .line 819
    :sswitch_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTouchState:I

    if-nez v1, :cond_0

    .line 820
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 821
    .local v0, currentPage:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->lastDownOnOccupiedCell()Z

    move-result v1

    if-nez v1, :cond_0

    .line 822
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->onWallpaperTap(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 812
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x6 -> :sswitch_1
    .end sparse-switch
.end method

.method public onLauncherTransitionEnd(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 4
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v3, 0x0

    .line 2457
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    .line 2458
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace$WallpaperOffsetInterpolator;->setOverrideHorizontalCatchupConstant(Z)V

    .line 2459
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 2464
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-nez v2, :cond_0

    .line 2465
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 2466
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2467
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/high16 v2, 0x3f80

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 2465
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2470
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v1           #i:I
    :cond_0
    return-void
.end method

.method public onLauncherTransitionPrepare(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 1
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2442
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    .line 2443
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cancelScrollingIndicatorAnimations()V

    .line 2444
    return-void
.end method

.method public onLauncherTransitionStart(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 0
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2448
    return-void
.end method

.method public onLauncherTransitionStep(Lcom/cyanogenmod/trebuchet/Launcher;F)V
    .locals 0
    .parameter "l"
    .parameter "t"

    .prologue
    .line 2452
    iput p2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionProgress:F

    .line 2453
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
    .line 1835
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFirstLayout:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1836
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 1838
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/PagedView;->onLayout(ZIIII)V

    .line 1839
    return-void
.end method

.method protected onPageBeginMoving()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 888
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onPageBeginMoving()V

    .line 890
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 891
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 903
    :goto_0
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowOutlines:Z

    if-eqz v1, :cond_0

    .line 904
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->showOutlines()V

    .line 906
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v1}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v1

    if-nez v1, :cond_3

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsStaticWallpaper:Z

    .line 910
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeInAdjacentScreens:Z

    if-nez v1, :cond_4

    .line 911
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 912
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    const/high16 v3, 0x3f80

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->setShortcutAndWidgetAlpha(F)V

    .line 911
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 893
    .end local v0           #i:I
    :cond_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    .line 895
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNextPage:I

    invoke-virtual {p0, v1, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->enableChildrenCache(II)V

    goto :goto_0

    .line 899
    :cond_2
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    add-int/lit8 v1, v1, -0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v1, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->enableChildrenCache(II)V

    goto :goto_0

    :cond_3
    move v1, v2

    .line 906
    goto :goto_1

    .line 917
    :cond_4
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->showScrollingIndicator(Z)V

    .line 919
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isRenderingWallpaper()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 920
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->setWallpaperVisibility(Z)V

    .line 922
    :cond_5
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 925
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_0

    .line 926
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    .line 929
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 930
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 936
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->isDragging()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 937
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 940
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->forceMoveEvent()V

    .line 954
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 955
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 956
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;

    .line 959
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_3

    .line 960
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 961
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    .line 965
    :cond_3
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isRenderingWallpaper()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 966
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->setWallpaperVisibility(Z)V

    .line 967
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    div-float v1, v2, v1

    invoke-virtual {v0, v1, v2}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 968
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWindowToken:Landroid/os/IBinder;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollX:F

    iget v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperScrollY:F

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V

    .line 970
    :cond_4
    return-void

    .line 932
    :cond_5
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->clearChildrenCache()V

    goto :goto_0

    .line 944
    :cond_6
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowOutlines:Z

    if-eqz v0, :cond_7

    .line 945
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->hideOutlines()V

    .line 949
    :cond_7
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->isDragging()Z

    move-result v0

    if-nez v0, :cond_1

    .line 950
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    goto :goto_1
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 2
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 1904
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1905
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 1906
    .local v0, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v0, :cond_0

    .line 1907
    invoke-virtual {v0, p1, p2}, Lcom/cyanogenmod/trebuchet/Folder;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v1

    .line 1912
    .end local v0           #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :goto_0
    return v1

    .line 1909
    .restart local v0       #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z

    move-result v1

    goto :goto_0

    .line 1912
    .end local v0           #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 1843
    invoke-super {p0, p1, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/PagedView;->onSizeChanged(IIII)V

    .line 1845
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setupWallpaper()V

    .line 1846
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperOffsets:[I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getLocationOnScreen([I)V

    .line 1847
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 788
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isFinishedSwitchingState()Z

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

    .line 2031
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTempCell:[I

    .line 2032
    .local v8, position:[I
    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getLocationOnScreen([I)V

    .line 2034
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v7

    .line 2035
    .local v7, pointerIndex:I
    aget v0, v8, v5

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    aput v0, v8, v5

    .line 2036
    aget v0, v8, v4

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    aput v0, v8, v4

    .line 2038
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWindowToken()Landroid/os/IBinder;

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

    .line 2042
    return-void

    .line 2038
    :cond_0
    const-string v2, "android.wallpaper.secondaryTap"

    goto :goto_0
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .parameter "visibility"

    .prologue
    .line 802
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->onWindowVisibilityChanged(I)V

    .line 803
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 1819
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->acceleratedOverScroll(F)V

    .line 1820
    return-void
.end method

.method protected reinflateWidgetsIfNecessary()V
    .locals 10

    .prologue
    .line 830
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v1

    .line 831
    .local v1, clCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 832
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 833
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v7

    .line 834
    .local v7, swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v4

    .line 835
    .local v4, itemCount:I
    const/4 v5, 0x0

    .local v5, j:I
    :goto_1
    if-ge v5, v4, :cond_1

    .line 836
    invoke-virtual {v7, v5}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 838
    .local v8, v:Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    if-eqz v9, :cond_0

    .line 839
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    .line 840
    .local v3, info:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    iget-object v6, v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    check-cast v6, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    .line 841
    .local v6, lahv:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->orientationChangedSincedInflation()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 842
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v9, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->removeAppWidget(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V

    .line 844
    invoke-virtual {v0, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 845
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v9, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->bindAppWidget(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V

    .line 835
    .end local v3           #info:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    .end local v6           #lahv:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 831
    .end local v8           #v:Landroid/view/View;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 850
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v4           #itemCount:I
    .end local v5           #j:I
    .end local v7           #swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_2
    return-void
.end method

.method removeItems(Ljava/util/ArrayList;)V
    .locals 7
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
    .line 4325
    .local p1, packages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 4326
    .local v5, packageNames:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v5, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 4328
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getWorkspaceAndHotseatCellLayouts()Ljava/util/ArrayList;

    move-result-object v0

    .line 4329
    .local v0, cellLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/CellLayout;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 4330
    .local v4, layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v3

    .line 4333
    .local v3, layout:Landroid/view/ViewGroup;
    new-instance v6, Lcom/cyanogenmod/trebuchet/Workspace$11;

    invoke-direct {v6, p0, v3, v5, v4}, Lcom/cyanogenmod/trebuchet/Workspace$11;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Landroid/view/ViewGroup;Ljava/util/HashSet;Lcom/cyanogenmod/trebuchet/CellLayout;)V

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 4406
    .end local v3           #layout:Landroid/view/ViewGroup;
    .end local v4           #layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 4407
    .local v1, context:Landroid/content/Context;
    new-instance v6, Lcom/cyanogenmod/trebuchet/Workspace$12;

    invoke-direct {v6, p0, v1, v5}, Lcom/cyanogenmod/trebuchet/Workspace$12;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Landroid/content/Context;Ljava/util/HashSet;)V

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 4444
    return-void
.end method

.method public resetFinalScrollForPageChange(I)V
    .locals 2
    .parameter "screen"

    .prologue
    .line 3087
    if-ltz p1, :cond_0

    .line 3088
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3089
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedScrollX:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setScrollX(I)V

    .line 3090
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedTranslationX:F

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 3091
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedRotationY:F

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 3093
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method public resetTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 1
    .parameter "layout"

    .prologue
    .line 3997
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3998
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleX:F

    .line 3999
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleY()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleY:F

    .line 4000
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationX()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationX:F

    .line 4001
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationY()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationY:F

    .line 4002
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getRotationY()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentRotationY:F

    .line 4003
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleX:F

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 4004
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleY:F

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 4005
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationX:F

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 4006
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationY:F

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationY(F)V

    .line 4007
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentRotationY:F

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 4009
    :cond_0
    return-void
.end method

.method public restoreInstanceStateForChild(I)V
    .locals 3
    .parameter "child"

    .prologue
    .line 4131
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedStates:Landroid/util/SparseArray;

    if-eqz v1, :cond_0

    .line 4132
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4133
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 4134
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedStates:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->restoreInstanceState(Landroid/util/SparseArray;)V

    .line 4136
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method public restoreInstanceStateForRemainingPages()V
    .locals 4

    .prologue
    .line 4139
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    .line 4140
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4141
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4142
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->restoreInstanceStateForChild(I)V

    .line 4140
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4145
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mRestoredPages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 4146
    return-void
.end method

.method protected screenScrolled(I)V
    .locals 12
    .parameter "screenScroll"

    .prologue
    const/4 v11, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1699
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->screenScrolled(I)V

    .line 1700
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->enableHwLayersOnVisiblePages()V

    .line 1702
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1804
    :cond_0
    :goto_0
    return-void

    .line 1703
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1704
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 1705
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1706
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-eqz v0, :cond_2

    .line 1707
    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v6

    .line 1708
    .local v6, scrollProgress:F
    const/high16 v7, 0x4148

    mul-float v4, v7, v6

    .line 1709
    .local v4, rotation:F
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1704
    .end local v4           #rotation:F
    .end local v6           #scrollProgress:F
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1713
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v1           #i:I
    :cond_3
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverScrollX:I

    if-ltz v7, :cond_4

    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverScrollX:I

    iget v10, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxScrollX:I

    if-le v7, v10, :cond_b

    :cond_4
    move v3, v9

    .line 1715
    .local v3, isInOverscroll:Z
    :goto_2
    if-eqz v3, :cond_5

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    if-nez v7, :cond_5

    .line 1716
    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollTransformsDirty:Z

    .line 1718
    :cond_5
    if-eqz v3, :cond_6

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollTransformsDirty:Z

    if-eqz v7, :cond_9

    .line 1720
    :cond_6
    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollX:I

    .line 1723
    .local v5, scroll:I
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollFade:F

    cmpl-float v7, v7, v11

    if-eqz v7, :cond_7

    .line 1724
    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/Workspace;->setFadeForOverScroll(F)V

    .line 1726
    :cond_7
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    if-eqz v7, :cond_8

    .line 1727
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    .line 1728
    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->resetOverscrollTransforms()V

    .line 1729
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->resetOverscrollTransforms()V

    .line 1732
    :cond_8
    sget-object v7, Lcom/cyanogenmod/trebuchet/Workspace$13;->$SwitchMap$com$cyanogenmod$trebuchet$Workspace$TransitionEffect:[I

    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    invoke-virtual {v10}, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->ordinal()I

    move-result v10

    aget v7, v7, v10

    packed-switch v7, :pswitch_data_0

    .line 1782
    :goto_3
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollTransformsDirty:Z

    .line 1785
    .end local v5           #scroll:I
    :cond_9
    if-eqz v3, :cond_0

    .line 1786
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverScrollX:I

    if-gez v7, :cond_c

    move v2, v8

    .line 1787
    .local v2, index:I
    :goto_4
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1788
    .restart local v0       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v7

    if-le v7, v9, :cond_0

    .line 1789
    invoke-virtual {p0, p1, v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollProgress(ILandroid/view/View;I)F

    move-result v6

    .line 1790
    .restart local v6       #scrollProgress:F
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v7

    if-nez v2, :cond_a

    move v8, v9

    :cond_a
    invoke-virtual {v0, v7, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setOverScrollAmount(FZ)V

    .line 1791
    const/high16 v7, -0x3e40

    mul-float v4, v7, v6

    .line 1792
    .restart local v4       #rotation:F
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 1793
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->setFadeForOverScroll(F)V

    .line 1794
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    if-nez v7, :cond_0

    .line 1795
    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollTransformsDirty:Z

    .line 1796
    iget v7, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDensity:F

    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCameraDistance:I

    int-to-float v8, v8

    mul-float/2addr v7, v8

    invoke-virtual {v0, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 1797
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x3f00

    mul-float/2addr v7, v8

    invoke-virtual {v0, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 1798
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v7

    int-to-float v8, v7

    if-nez v2, :cond_d

    const/high16 v7, 0x3f40

    :goto_5
    mul-float/2addr v7, v8

    invoke-virtual {v0, v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 1799
    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->setOverscrollTransformsDirty(Z)V

    goto/16 :goto_0

    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v2           #index:I
    .end local v3           #isInOverscroll:Z
    .end local v4           #rotation:F
    .end local v6           #scrollProgress:F
    :cond_b
    move v3, v8

    .line 1713
    goto/16 :goto_2

    .line 1734
    .restart local v3       #isInOverscroll:Z
    .restart local v5       #scroll:I
    :pswitch_0
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledStandard(I)V

    goto :goto_3

    .line 1737
    :pswitch_1
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledTablet(I)V

    goto :goto_3

    .line 1740
    :pswitch_2
    invoke-direct {p0, v5, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledZoom(IZ)V

    goto :goto_3

    .line 1743
    :pswitch_3
    invoke-direct {p0, v5, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledZoom(IZ)V

    goto :goto_3

    .line 1746
    :pswitch_4
    invoke-direct {p0, v5, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledRotate(IZ)V

    goto :goto_3

    .line 1749
    :pswitch_5
    invoke-direct {p0, v5, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledRotate(IZ)V

    goto :goto_3

    .line 1752
    :pswitch_6
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledSpin(I)V

    goto :goto_3

    .line 1755
    :pswitch_7
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledFlip(I)V

    goto :goto_3

    .line 1758
    :pswitch_8
    invoke-direct {p0, v5, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCube(IZ)V

    goto/16 :goto_3

    .line 1761
    :pswitch_9
    invoke-direct {p0, v5, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCube(IZ)V

    goto/16 :goto_3

    .line 1764
    :pswitch_a
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledStack(I)V

    goto/16 :goto_3

    .line 1767
    :pswitch_b
    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledAccordion(I)V

    goto/16 :goto_3

    .line 1770
    :pswitch_c
    invoke-direct {p0, v5, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCylinder(IZ)V

    goto/16 :goto_3

    .line 1773
    :pswitch_d
    invoke-direct {p0, v5, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCylinder(IZ)V

    goto/16 :goto_3

    .line 1776
    :pswitch_e
    invoke-direct {p0, v5, v9}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCarousel(IZ)V

    goto/16 :goto_3

    .line 1779
    :pswitch_f
    invoke-direct {p0, v5, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->screenScrolledCarousel(IZ)V

    goto/16 :goto_3

    .line 1786
    .end local v5           #scroll:I
    :cond_c
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    goto/16 :goto_4

    .line 1798
    .restart local v0       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v2       #index:I
    .restart local v4       #rotation:F
    .restart local v6       #scrollProgress:F
    :cond_d
    const/high16 v7, 0x3e80

    goto :goto_5

    .line 1732
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method public scrollLeft()V
    .locals 2

    .prologue
    .line 4150
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v1, :cond_0

    .line 4151
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollLeft()V

    .line 4153
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 4154
    .local v0, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v0, :cond_1

    .line 4155
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->completeDragExit()V

    .line 4157
    :cond_1
    return-void
.end method

.method public scrollRight()V
    .locals 2

    .prologue
    .line 4161
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSmall()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v1, :cond_0

    .line 4162
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->scrollRight()V

    .line 4164
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 4165
    .local v0, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v0, :cond_1

    .line 4166
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->completeDragExit()V

    .line 4168
    :cond_1
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 1385
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 1386
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mBackgroundAlpha:F

    .line 1387
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 1389
    :cond_0
    return-void
.end method

.method public setChildrenOutlineAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 1338
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineAlpha:F

    .line 1339
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1340
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1341
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlpha(F)V

    .line 1339
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1343
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method setCurrentDragOverlappingLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    .line 3202
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_0

    .line 3203
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setIsDragOverlapping(Z)V

    .line 3205
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3206
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_1

    .line 3207
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverlappingLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setIsDragOverlapping(Z)V

    .line 3209
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->invalidate()V

    .line 3210
    return-void
.end method

.method setCurrentDropLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    const/4 v1, -0x1

    .line 3188
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_0

    .line 3189
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->revertTempState()V

    .line 3190
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->onDragExit()V

    .line 3192
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3193
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_1

    .line 3194
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragTargetLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->onDragEnter()V

    .line 3196
    :cond_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupReorder(Z)V

    .line 3197
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupFolderCreation()V

    .line 3198
    invoke-virtual {p0, v1, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentDropOverCell(II)V

    .line 3199
    return-void
.end method

.method setCurrentDropOverCell(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 3213
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverX:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverY:I

    if-eq p2, v0, :cond_1

    .line 3214
    :cond_0
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverX:I

    .line 3215
    iput p2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOverY:I

    .line 3216
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->setDragMode(I)V

    .line 3218
    :cond_1
    return-void
.end method

.method setDragMode(I)V
    .locals 2
    .parameter "dragMode"

    .prologue
    const/4 v1, 0x1

    .line 3221
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    if-eq p1, v0, :cond_1

    .line 3222
    if-nez p1, :cond_2

    .line 3223
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupAddToFolder()V

    .line 3226
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupReorder(Z)V

    .line 3227
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupFolderCreation()V

    .line 3238
    :cond_0
    :goto_0
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragMode:I

    .line 3240
    :cond_1
    return-void

    .line 3228
    :cond_2
    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 3229
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupReorder(Z)V

    .line 3230
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupFolderCreation()V

    goto :goto_0

    .line 3231
    :cond_3
    if-ne p1, v1, :cond_4

    .line 3232
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupAddToFolder()V

    .line 3233
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupReorder(Z)V

    goto :goto_0

    .line 3234
    :cond_4
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 3235
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupAddToFolder()V

    .line 3236
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cleanupFolderCreation()V

    goto :goto_0
.end method

.method setFadeForOverScroll(F)V
    .locals 8
    .parameter "fade"

    .prologue
    const/high16 v7, 0x3f80

    const/high16 v6, 0x3f00

    .line 4510
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isScrollingIndicatorEnabled()Z

    move-result v5

    if-nez v5, :cond_1

    .line 4523
    :cond_0
    :goto_0
    return-void

    .line 4512
    :cond_1
    iput p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mOverscrollFade:F

    .line 4513
    sub-float v5, v7, p1

    mul-float/2addr v5, v6

    add-float v3, v6, v5

    .line 4514
    .local v3, reducedFade:F
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 4515
    .local v1, parent:Landroid/view/ViewGroup;
    const v5, 0x7f07002d

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    move-object v2, v5

    check-cast v2, Landroid/widget/ImageView;

    .line 4516
    .local v2, qsbDivider:Landroid/widget/ImageView;
    const v5, 0x7f07002e

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    move-object v0, v5

    check-cast v0, Landroid/widget/ImageView;

    .line 4517
    .local v0, dockDivider:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollingIndicator()Landroid/view/View;

    move-result-object v4

    .line 4519
    .local v4, scrollIndicator:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->cancelScrollingIndicatorAnimations()V

    .line 4520
    if-eqz v2, :cond_2

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowSearchBar:Z

    if-eqz v5, :cond_2

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 4521
    :cond_2
    if-eqz v0, :cond_3

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowDockDivider:Z

    if-eqz v5, :cond_3

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 4522
    :cond_3
    if-eqz v4, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mShowScrollingIndicator:Z

    if-eqz v5, :cond_0

    sub-float v5, v7, p1

    invoke-virtual {v4, v5}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method public setFinalScrollForPageChange(I)V
    .locals 5
    .parameter "screen"

    .prologue
    const/4 v4, 0x0

    .line 3074
    if-ltz p1, :cond_0

    .line 3075
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedScrollX:I

    .line 3076
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3077
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationX()F

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedTranslationX:F

    .line 3078
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getRotationY()F

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSavedRotationY:F

    .line 3079
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildOffset(I)I

    move-result v2

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->getRelativeChildOffset(I)I

    move-result v3

    sub-int v1, v2, v3

    .line 3080
    .local v1, newX:I
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->setScrollX(I)V

    .line 3081
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 3082
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 3084
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v1           #newX:I
    :cond_0
    return-void
.end method

.method public setFinalTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 2
    .parameter "layout"

    .prologue
    .line 3982
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3983
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 3984
    .local v0, index:I
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleX()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleX:F

    .line 3985
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScaleY()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentScaleY:F

    .line 3986
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationX()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationX:F

    .line 3987
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTranslationY()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentTranslationY:F

    .line 3988
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getRotationY()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentRotationY:F

    .line 3989
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleXs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleX(F)V

    .line 3990
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewScaleYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setScaleY(F)V

    .line 3991
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationXs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 3992
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewTranslationYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationY(F)V

    .line 3993
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mNewRotationYs:[F

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 3995
    .end local v0           #index:I
    :cond_0
    return-void
.end method

.method protected setWallpaperDimension()V
    .locals 7

    .prologue
    .line 1027
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 1028
    .local v3, minDims:Landroid/graphics/Point;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 1029
    .local v1, maxDims:Landroid/graphics/Point;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5, v3, v1}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 1031
    iget v5, v1, Landroid/graphics/Point;->x:I

    iget v6, v1, Landroid/graphics/Point;->y:I

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1032
    .local v0, maxDim:I
    iget v5, v3, Landroid/graphics/Point;->x:I

    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1036
    .local v2, minDim:I
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1037
    int-to-float v5, v0

    invoke-direct {p0, v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->wallpaperTravelToScreenWidthRatio(II)F

    move-result v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    .line 1038
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHeight:I

    .line 1044
    :goto_0
    new-instance v5, Lcom/cyanogenmod/trebuchet/Workspace$2;

    const-string v6, "setWallpaperDimension"

    invoke-direct {v5, p0, v6}, Lcom/cyanogenmod/trebuchet/Workspace$2;-><init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace$2;->start()V

    .line 1054
    return-void

    .line 1040
    :cond_0
    iget v4, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperSize:I

    .line 1041
    .local v4, screens:I
    mul-int v5, v2, v4

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v5

    iput v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperWidth:I

    .line 1042
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mWallpaperHeight:I

    goto :goto_0
.end method

.method setup(Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 2
    .parameter "dragController"

    .prologue
    .line 4031
    new-instance v0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mSpringLoadedDragController:Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;

    .line 4032
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 4036
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V

    .line 4037
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setupWallpaper()V

    .line 4038
    return-void
.end method

.method setupWallpaper()V
    .locals 1

    .prologue
    .line 4041
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setWallpaperDimension()V

    .line 4042
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-nez v0, :cond_0

    .line 4043
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->centerWallpaperOffset()V

    .line 4045
    :cond_0
    return-void
.end method

.method protected shouldDrawChild(Landroid/view/View;)Z
    .locals 3
    .parameter "child"

    .prologue
    const/4 v2, 0x0

    .line 613
    move-object v0, p1

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 614
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->shouldDrawChild(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getBackgroundAlpha()F

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
    .line 1311
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsSwitchingState:Z

    if-nez v0, :cond_2

    .line 1312
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeOutAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1313
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 1314
    :cond_1
    const-string v0, "childrenOutlineAlpha"

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    .line 1315
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1316
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mChildrenOutlineFadeInAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 1318
    :cond_2
    return-void
.end method

.method public showOutlinesTemporarily()V
    .locals 1

    .prologue
    .line 1332
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIsPageMoving:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isTouchActive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1333
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    .line 1335
    :cond_0
    return-void
.end method

.method protected snapToPage(I)V
    .locals 1
    .parameter "whichPage"

    .prologue
    .line 1142
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 1143
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v0, :cond_0

    .line 1144
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->computeWallpaperScrollRatio(I)V

    .line 1146
    :cond_0
    return-void
.end method

.method protected snapToPage(II)V
    .locals 0
    .parameter "whichPage"
    .parameter "duration"

    .prologue
    .line 1150
    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(II)V

    .line 1151
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->computeWallpaperScrollRatio(I)V

    .line 1152
    return-void
.end method

.method protected snapToPage(ILjava/lang/Runnable;)V
    .locals 1
    .parameter "whichPage"
    .parameter "r"

    .prologue
    .line 1155
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 1156
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1158
    :cond_0
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedSnapToPageRunnable:Ljava/lang/Runnable;

    .line 1159
    const/16 v0, 0x2ee

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(II)V

    .line 1160
    return-void
.end method

.method startDrag(Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;)V
    .locals 4
    .parameter "cellInfo"

    .prologue
    .line 2595
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 2598
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->isInTouchMode()Z

    move-result v3

    if-nez v3, :cond_0

    .line 2615
    :goto_0
    return-void

    .line 2602
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 2603
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 2604
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2605
    .local v2, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->prepareChildForDrag(Landroid/view/View;)V

    .line 2607
    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    .line 2608
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/view/View;->setPressed(Z)V

    .line 2610
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 2613
    .local v0, canvas:Landroid/graphics/Canvas;
    const/4 v3, 0x2

    invoke-direct {p0, v1, v0, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->createDragOutline(Landroid/view/View;Landroid/graphics/Canvas;I)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragOutline:Landroid/graphics/Bitmap;

    .line 2614
    invoke-virtual {p0, v1, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->beginDragShared(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DragSource;)V

    goto :goto_0
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 4105
    const/4 v0, 0x1

    return v0
.end method

.method public syncPageItems(IZ)V
    .locals 0
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 4496
    return-void
.end method

.method public syncPages()V
    .locals 0

    .prologue
    .line 4492
    return-void
.end method

.method public transitionStateShouldAllowDrop()Z
    .locals 2

    .prologue
    .line 2679
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mTransitionProgress:F

    const/high16 v1, 0x3f00

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mState:Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected updateCurrentPageScroll()V
    .locals 1

    .prologue
    .line 1134
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->updateCurrentPageScroll()V

    .line 1135
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mScrollWallpaper:Z

    if-eqz v0, :cond_0

    .line 1136
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCurrentPage:I

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->computeWallpaperScrollRatio(I)V

    .line 1138
    :cond_0
    return-void
.end method

.method updateItemLocationsInDatabase(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 13
    .parameter "cl"

    .prologue
    .line 4081
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v10

    .line 4083
    .local v10, count:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v4

    .line 4084
    .local v4, screen:I
    const/16 v9, -0x64

    .line 4086
    .local v9, container:I
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4087
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v4

    .line 4088
    const/16 v9, -0x65

    .line 4091
    :cond_0
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v10, :cond_2

    .line 4092
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 4093
    .local v12, v:Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 4095
    .local v1, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-eqz v1, :cond_1

    iget-boolean v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->requiresDbUpdate:Z

    if-eqz v0, :cond_1

    .line 4096
    const/4 v0, 0x0

    iput-boolean v0, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->requiresDbUpdate:Z

    .line 4097
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    int-to-long v2, v9

    iget v5, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v6, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iget v7, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iget v8, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-static/range {v0 .. v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->modifyItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIII)V

    .line 4091
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 4101
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v12           #v:Landroid/view/View;
    :cond_2
    return-void
.end method

.method updateShortcuts(Ljava/util/ArrayList;)V
    .locals 15
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4447
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v2

    .line 4448
    .local v2, childrenLayouts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 4449
    .local v8, layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v1

    .line 4450
    .local v1, childCount:I
    const/4 v7, 0x0

    .local v7, j:I
    :goto_0
    if-ge v7, v1, :cond_0

    .line 4451
    invoke-virtual {v8, v7}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 4452
    .local v12, view:Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v11

    .line 4453
    .local v11, tag:Ljava/lang/Object;
    instance-of v13, v11, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v13, :cond_1

    move-object v5, v11

    .line 4454
    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 4458
    .local v5, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v6, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 4459
    .local v6, intent:Landroid/content/Intent;
    if-eqz v6, :cond_1

    iget v13, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    if-nez v13, :cond_1

    const-string v13, "android.intent.action.MAIN"

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 4461
    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v9

    .line 4462
    .local v9, name:Landroid/content/ComponentName;
    if-nez v9, :cond_2

    .line 4450
    .end local v5           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v6           #intent:Landroid/content/Intent;
    .end local v9           #name:Landroid/content/ComponentName;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 4465
    .restart local v5       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v6       #intent:Landroid/content/Intent;
    .restart local v9       #name:Landroid/content/ComponentName;
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 4466
    .local v0, app:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v13, v9}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    move-object v10, v12

    .line 4467
    check-cast v10, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 4468
    .local v10, shortcut:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v5, v13}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->updateIcon(Lcom/cyanogenmod/trebuchet/IconCache;)V

    .line 4469
    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 4470
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v10, v5, v13}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->applyFromShortcutInfo(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/IconCache;)V

    goto :goto_1

    .line 4477
    .end local v0           #app:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    .end local v1           #childCount:I
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v6           #intent:Landroid/content/Intent;
    .end local v7           #j:I
    .end local v8           #layout:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .end local v9           #name:Landroid/content/ComponentName;
    .end local v10           #shortcut:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    .end local v11           #tag:Ljava/lang/Object;
    .end local v12           #view:Landroid/view/View;
    :cond_4
    return-void
.end method

.method public updateWallpaperOffsetImmediately()V
    .locals 1

    .prologue
    .line 1106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mUpdateWallpaperOffsetImmediately:Z

    .line 1107
    return-void
.end method

.method willAddToExistingUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IF)Z
    .locals 7
    .parameter "dragInfo"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2787
    iget v5, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v5, p4, v5

    if-lez v5, :cond_1

    .line 2803
    :cond_0
    :goto_0
    return v3

    .line 2788
    :cond_1
    aget v5, p3, v3

    aget v6, p3, v4

    invoke-virtual {p2, v5, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    .line 2790
    .local v0, dropOverView:Landroid/view/View;
    if-eqz v0, :cond_2

    .line 2791
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2792
    .local v2, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget-boolean v5, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v5, :cond_2

    iget v5, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    iget v6, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    if-ne v5, v6, :cond_0

    iget v5, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    iget v6, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v5, v6, :cond_0

    .line 2797
    .end local v2           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_2
    instance-of v5, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v5, :cond_0

    move-object v1, v0

    .line 2798
    check-cast v1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 2799
    .local v1, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-virtual {v1, p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->acceptDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    .line 2800
    goto :goto_0
.end method

.method willCreateUserFolder(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;[IFZ)Z
    .locals 10
    .parameter "info"
    .parameter "target"
    .parameter "targetCell"
    .parameter "distance"
    .parameter "considerTimeout"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 2755
    iget v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mMaxDistanceForFolderCreation:F

    cmpl-float v8, p4, v8

    if-lez v8, :cond_1

    .line 2782
    :cond_0
    :goto_0
    return v7

    .line 2756
    :cond_1
    aget v8, p3, v7

    aget v9, p3, v6

    invoke-virtual {p2, v8, v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v2

    .line 2758
    .local v2, dropOverView:Landroid/view/View;
    if-eqz v2, :cond_2

    .line 2759
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2760
    .local v4, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget-boolean v8, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v8, :cond_2

    iget v8, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    iget v9, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    if-ne v8, v9, :cond_0

    iget v8, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    iget v9, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v8, v9, :cond_0

    .line 2765
    .end local v4           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_2
    const/4 v3, 0x0

    .line 2766
    .local v3, hasntMoved:Z
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    if-eqz v8, :cond_3

    .line 2767
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mDragInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    iget-object v8, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    if-ne v2, v8, :cond_7

    move v3, v6

    .line 2770
    :cond_3
    :goto_1
    if-eqz v2, :cond_0

    if-nez v3, :cond_0

    if-eqz p5, :cond_4

    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/Workspace;->mCreateUserFolderOnDrop:Z

    if-eqz v8, :cond_0

    .line 2774
    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2775
    .local v0, aboveInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget v8, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    if-eqz v8, :cond_5

    iget v8, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    if-ne v8, v6, :cond_8

    :cond_5
    move v1, v6

    .line 2778
    .local v1, aboveShortcut:Z
    :goto_2
    iget v8, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    if-eqz v8, :cond_6

    iget v8, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    if-ne v8, v6, :cond_9

    :cond_6
    move v5, v6

    .line 2782
    .local v5, willBecomeShortcut:Z
    :goto_3
    if-eqz v1, :cond_a

    if-eqz v5, :cond_a

    :goto_4
    move v7, v6

    goto :goto_0

    .end local v0           #aboveInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v1           #aboveShortcut:Z
    .end local v5           #willBecomeShortcut:Z
    :cond_7
    move v3, v7

    .line 2767
    goto :goto_1

    .restart local v0       #aboveInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_8
    move v1, v7

    .line 2775
    goto :goto_2

    .restart local v1       #aboveShortcut:Z
    :cond_9
    move v5, v7

    .line 2778
    goto :goto_3

    .restart local v5       #willBecomeShortcut:Z
    :cond_a
    move v6, v7

    .line 2782
    goto :goto_4
.end method
