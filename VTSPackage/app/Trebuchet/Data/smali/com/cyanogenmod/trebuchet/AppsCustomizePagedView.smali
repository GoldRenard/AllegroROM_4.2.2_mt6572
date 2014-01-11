.class public Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
.super Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/cyanogenmod/trebuchet/DragSource;
.implements Lcom/cyanogenmod/trebuchet/PagedViewIcon$PressedCallback;
.implements Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;
.implements Lcom/cyanogenmod/trebuchet/LauncherTransitionable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;,
        Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;,
        Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;,
        Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;
    }
.end annotation


# static fields
.field private static final FILTER_APPS_DOWNLOADED_FLAG:I = 0x2

.field private static final FILTER_APPS_SYSTEM_FLAG:I = 0x1

.field private static final SCROLLING_INDICATOR_BOTTOM:I = 0x0

.field private static final SCROLLING_INDICATOR_TOP:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Trebuchet.AppsCustomizePagedView"

.field private static final TRANSITION_MAX_ROTATION:F = 22.0f

.field private static final TRANSITION_PIVOT:F = 0.65f

.field private static final TRANSITION_SCREEN_ROTATION:F = 12.5f

.field static final WIDGET_BOUND:I = 0x1

.field static final WIDGET_INFLATED:I = 0x2

.field static final WIDGET_NO_CLEANUP_REQUIRED:I = -0x1

.field static final WIDGET_PRELOAD_PENDING:I = 0x0

.field private static final WIDGET_PREVIEW_ICON_PADDING_PERCENTAGE:F = 0.25f

.field static final sLookAheadPageCount:I = 0x3

.field static final sLookBehindPageCount:I = 0x3

.field private static final sPageSleepDelay:I = 0xc8


# instance fields
.field private mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

.field private mAppIconSize:I

.field private mApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mBindWidgetRunnable:Ljava/lang/Runnable;

.field mCachedAppWidgetPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

.field mCachedAppWidgetPreviewDestRect:Lcom/cyanogenmod/trebuchet/RectCache;

.field mCachedAppWidgetPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

.field mCachedAppWidgetPreviewSrcRect:Lcom/cyanogenmod/trebuchet/RectCache;

.field mCachedShortcutPreviewBitmap:Lcom/cyanogenmod/trebuchet/BitmapCache;

.field mCachedShortcutPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

.field mCachedShortcutPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

.field private mCameraDistance:I

.field private mCanvas:Landroid/graphics/Canvas;

.field private mClingFocusedX:I

.field private mClingFocusedY:I

.field private mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

.field private mContentWidth:I

.field mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

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
            "Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;",
            ">;"
        }
    .end annotation
.end field

.field private mDragController:Lcom/cyanogenmod/trebuchet/DragController;

.field private mDraggingWidget:Z

.field private mFadeScrollingIndicator:Z

.field private mFilterApps:I

.field private mFilteredApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHasShownAllAppsCling:Z

.field private mHasShownAllAppsSortCling:Z

.field private mHiddenApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field

.field private mHiddenAppsPackages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field private mInTransition:Z

.field private mInflateWidgetRunnable:Ljava/lang/Runnable;

.field private mJoinWidgetsApps:Z

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private final mLayoutInflater:Landroid/view/LayoutInflater;

.field private mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field private mMaxAppCellCountX:I

.field private mMaxAppCellCountY:I

.field private mNumAppsPages:I

.field private mNumWidgetPages:I

.field private mOverscrollTransformsDirty:Z

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field private mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

.field mRunningTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;",
            ">;"
        }
    .end annotation
.end field

.field private mSaveInstanceStateItemIndex:I

.field private mScrollTransformsDirty:Z

.field private mScrollingIndicatorPosition:I

.field private mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

.field private mTmpRect:Landroid/graphics/Rect;

.field private mTransitionEffect:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

.field mWidgetCleanupState:I

.field private mWidgetCountX:I

.field private mWidgetCountY:I

.field private mWidgetHeightGap:I

.field private mWidgetInstructionToast:Landroid/widget/Toast;

.field mWidgetLoadingId:I

.field private final mWidgetPreviewIconPaddedDimension:I

.field private mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

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

.field mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 367
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 245
    const/4 v9, 0x3

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    .line 257
    const/4 v9, -0x1

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 262
    sget-object v9, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->Title:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    .line 288
    const/4 v9, 0x0

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    .line 289
    const/4 v9, 0x0

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumWidgetPages:I

    .line 292
    new-instance v9, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    const/high16 v10, 0x3f00

    invoke-direct {v9, v10}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;-><init>(F)V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    .line 296
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollTransformsDirty:Z

    .line 297
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    .line 299
    new-instance v9, Landroid/view/animation/AccelerateInterpolator;

    const v10, 0x3f666666

    invoke-direct {v9, v10}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 300
    new-instance v9, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v10, 0x4080

    invoke-direct {v9, v10}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 319
    sget-object v9, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Standard:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    .line 325
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    .line 326
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    .line 331
    const/4 v9, -0x1

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 332
    const/4 v9, -0x1

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    .line 333
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .line 334
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 340
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    .line 342
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    .line 345
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    .line 348
    new-instance v9, Lcom/cyanogenmod/trebuchet/BitmapCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/BitmapCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/cyanogenmod/trebuchet/BitmapCache;

    .line 349
    new-instance v9, Lcom/cyanogenmod/trebuchet/PaintCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/PaintCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    .line 350
    new-instance v9, Lcom/cyanogenmod/trebuchet/CanvasCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/CanvasCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

    .line 353
    new-instance v9, Lcom/cyanogenmod/trebuchet/CanvasCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/CanvasCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

    .line 354
    new-instance v9, Lcom/cyanogenmod/trebuchet/RectCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/RectCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewSrcRect:Lcom/cyanogenmod/trebuchet/RectCache;

    .line 355
    new-instance v9, Lcom/cyanogenmod/trebuchet/RectCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/RectCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewDestRect:Lcom/cyanogenmod/trebuchet/RectCache;

    .line 356
    new-instance v9, Lcom/cyanogenmod/trebuchet/PaintCache;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/PaintCache;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    .line 368
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v9

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 369
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 370
    sget-object v9, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    .line 371
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    .line 372
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    .line 373
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenApps:Ljava/util/ArrayList;

    .line 374
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenAppsPackages:Ljava/util/ArrayList;

    .line 375
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    .line 376
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getIconCache()Lcom/cyanogenmod/trebuchet/IconCache;

    move-result-object v9

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 377
    new-instance v9, Landroid/graphics/Canvas;

    invoke-direct {v9}, Landroid/graphics/Canvas;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    .line 378
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    .line 380
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHandleFadeInAdjacentScreens:Z

    .line 382
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 384
    .local v7, resources:Landroid/content/res/Resources;
    const v9, 0x7f0c0017

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCameraDistance:I

    .line 387
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getJoinWidgetsApps()Z

    move-result v9

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    .line 388
    const v9, 0x7f090079

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Scrolling;->getTransitionEffect(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    move-result-object v9

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    .line 390
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Scrolling;->getFadeInAdjacentScreens()Z

    move-result v9

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    .line 391
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Indicator;->getShowScrollingIndicator()Z

    move-result v8

    .line 392
    .local v8, showScrollingIndicator:Z
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Indicator;->getFadeScrollingIndicator()Z

    move-result v9

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeScrollingIndicator:Z

    .line 393
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Indicator;->getScrollingIndicatorPosition()I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollingIndicatorPosition:I

    .line 395
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getHiddenApps()Ljava/lang/String;

    move-result-object v9

    const-string v10, "\\|"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 396
    .local v4, flattened:[Ljava/lang/String;
    move-object v1, v4

    .local v1, arr$:[Ljava/lang/String;
    array-length v6, v1

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v3, v1, v5

    .line 397
    .local v3, flat:Ljava/lang/String;
    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v2

    .line 398
    .local v2, cmp:Landroid/content/ComponentName;
    if-eqz v2, :cond_0

    .line 399
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenApps:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenAppsPackages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 396
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 405
    .end local v2           #cmp:Landroid/content/ComponentName;
    .end local v3           #flat:Ljava/lang/String;
    :cond_1
    if-nez v8, :cond_2

    .line 406
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->disableScrollingIndicator()V

    .line 410
    :cond_2
    const v9, 0x7f0d0022

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    .line 412
    sget-object v9, Lcom/cyanogenmod/trebuchet/R$styleable;->AppsCustomizePagedView:[I

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {p1, p2, v9, v10, v11}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 413
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v9, 0x0

    const/4 v10, -0x1

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountX:I

    .line 414
    const/4 v9, 0x1

    const/4 v10, -0x1

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountY:I

    .line 415
    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetWidthGap:I

    .line 417
    const/4 v9, 0x3

    const/4 v10, 0x0

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetHeightGap:I

    .line 419
    const/4 v9, 0x4

    const/4 v10, 0x2

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    .line 420
    const/4 v9, 0x5

    const/4 v10, 0x2

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    .line 421
    const/4 v9, 0x6

    const/4 v10, 0x0

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mClingFocusedX:I

    .line 422
    const/4 v9, 0x7

    const/4 v10, 0x0

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mClingFocusedY:I

    .line 423
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 424
    new-instance v9, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    .line 428
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v9, v9

    const/high16 v10, 0x3fc0

    mul-float/2addr v9, v10

    float-to-int v9, v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetPreviewIconPaddedDimension:I

    .line 430
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 223
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    return-object v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 223
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadWidgetPreviewsInBackground(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    return-void
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 223
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    return v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;
    .locals 1
    .parameter "x0"

    .prologue
    .line 223
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    return-object v0
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 223
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    return-void
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 223
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInTransition:Z

    return v0
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 223
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;ILjava/util/ArrayList;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 223
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;II)V

    return-void
.end method

.method private addAppsWithoutInvalidate(Ljava/util/ArrayList;)V
    .locals 5
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
    .line 2361
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 2362
    .local v2, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getAppNameComparator()Ljava/util/Comparator;

    move-result-object v4

    invoke-static {v3, v2, v4}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v1

    .line 2363
    .local v1, index:I
    if-gez v1, :cond_0

    .line 2364
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    add-int/lit8 v4, v1, 0x1

    neg-int v4, v4

    invoke-virtual {v3, v4, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 2367
    .end local v1           #index:I
    .end local v2           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_1
    return-void
.end method

.method private beginDraggingApplication(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 745
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->onDragStartedWithItem(Landroid/view/View;)V

    .line 746
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->beginDragShared(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DragSource;)V

    .line 747
    return-void
.end method

.method private beginDraggingWidget(Landroid/view/View;)Z
    .locals 33
    .parameter "v"

    .prologue
    .line 886
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 888
    const v3, 0x7f070015

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v26

    check-cast v26, Landroid/widget/ImageView;

    .line 889
    .local v26, image:Landroid/widget/ImageView;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    .line 893
    .local v18, createItemInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_0

    .line 894
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 895
    const/4 v3, 0x0

    .line 975
    :goto_0
    return v3

    .line 901
    :cond_0
    const/high16 v21, 0x3f80

    .line 902
    .local v21, scale:F
    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v3, :cond_3

    .line 905
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-nez v3, :cond_1

    .line 906
    const/4 v3, 0x0

    goto :goto_0

    .line 909
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    move-object/from16 v24, v0

    .line 910
    .local v24, createWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;
    move-object/from16 v18, v24

    .line 911
    move-object/from16 v0, v18

    iget v7, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanX:I

    .line 912
    .local v7, spanX:I
    move-object/from16 v0, v18

    iget v8, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanY:I

    .line 913
    .local v8, spanY:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v7, v8, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemSize(IIZ)[I

    move-result-object v32

    .line 916
    .local v32, size:[I
    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v31

    check-cast v31, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    .line 917
    .local v31, previewDrawable:Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;
    const/high16 v28, 0x3fa0

    .line 919
    .local v28, minScale:F
    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v28

    float-to-int v3, v3

    const/4 v4, 0x0

    aget v4, v32, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 920
    .local v9, maxWidth:I
    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getIntrinsicHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v28

    float-to-int v3, v3

    const/4 v4, 0x1

    aget v4, v32, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 921
    .local v10, maxHeight:I
    move-object/from16 v0, v24

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    move-object/from16 v0, v24

    iget v5, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->previewImage:I

    move-object/from16 v0, v24

    iget v6, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->icon:I

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 925
    .local v13, preview:Landroid/graphics/Bitmap;
    const/16 v3, 0x9

    new-array v0, v3, [F

    move-object/from16 v29, v0

    .line 926
    .local v29, mv:[F
    new-instance v27, Landroid/graphics/Matrix;

    invoke-direct/range {v27 .. v27}, Landroid/graphics/Matrix;-><init>()V

    .line 927
    .local v27, m:Landroid/graphics/Matrix;
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

    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getIntrinsicWidth()I

    move-result v11

    int-to-float v11, v11

    invoke-virtual/range {v31 .. v31}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getIntrinsicHeight()I

    move-result v14

    int-to-float v14, v14

    invoke-direct {v4, v5, v6, v11, v14}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 932
    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 933
    const/4 v3, 0x0

    aget v21, v29, v3

    .line 961
    .end local v7           #spanX:I
    .end local v8           #spanY:I
    .end local v9           #maxWidth:I
    .end local v10           #maxHeight:I
    .end local v24           #createWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;
    .end local v27           #m:Landroid/graphics/Matrix;
    .end local v28           #minScale:F
    .end local v29           #mv:[F
    .end local v31           #previewDrawable:Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;
    .end local v32           #size:[I
    :goto_1
    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v3, :cond_2

    move-object/from16 v3, v18

    check-cast v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->previewImage:I

    if-eqz v3, :cond_5

    :cond_2
    const/16 v22, 0x1

    .line 965
    .local v22, clipAlpha:Z
    :goto_2
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v5, 0x0

    invoke-static {v13, v3, v4, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v30

    .line 969
    .local v30, outline:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->lockScreenOrientation()V

    .line 970
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v30

    move/from16 v2, v22

    invoke-virtual {v3, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->onDragStartedWithItem(Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;Landroid/graphics/Bitmap;Z)V

    .line 971
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    sget v19, Lcom/cyanogenmod/trebuchet/DragController;->DRAG_ACTION_COPY:I

    const/16 v20, 0x0

    move-object/from16 v15, v26

    move-object/from16 v16, v13

    move-object/from16 v17, p0

    invoke-virtual/range {v14 .. v21}, Lcom/cyanogenmod/trebuchet/DragController;->startDrag(Landroid/view/View;Landroid/graphics/Bitmap;Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;ILandroid/graphics/Rect;F)V

    .line 973
    invoke-virtual/range {v30 .. v30}, Landroid/graphics/Bitmap;->recycle()V

    .line 974
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->recycle()V

    .line 975
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 934
    .end local v13           #preview:Landroid/graphics/Bitmap;
    .end local v22           #clipAlpha:Z
    .end local v30           #outline:Landroid/graphics/Bitmap;
    :cond_3
    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;

    if-eqz v3, :cond_4

    move-object/from16 v23, v18

    .line 935
    check-cast v23, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;

    .line 936
    .local v23, createShortcutInfo:Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    move-object/from16 v0, v23

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;->shortcutActivityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResIcon(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    .line 937
    .local v12, icon:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 940
    .restart local v13       #preview:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v13}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 941
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 942
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v16

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v17

    move-object/from16 v11, p0

    invoke-direct/range {v11 .. v17}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 944
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    .line 945
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 946
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanY:I

    move-object/from16 v0, v18

    iput v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanX:I

    goto/16 :goto_1

    .line 951
    .end local v12           #icon:Landroid/graphics/drawable/Drawable;
    .end local v13           #preview:Landroid/graphics/Bitmap;
    .end local v23           #createShortcutInfo:Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;
    :cond_4
    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetPreviewIconPaddedDimension:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetPreviewIconPaddedDimension:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 953
    .restart local v13       #preview:Landroid/graphics/Bitmap;
    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v25

    .line 954
    .local v25, d:Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v13}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 955
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 956
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCanvas:Landroid/graphics/Canvas;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 957
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanY:I

    move-object/from16 v0, v18

    iput v3, v0, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanX:I

    goto/16 :goto_1

    .line 961
    .end local v25           #d:Landroid/graphics/drawable/Drawable;
    :cond_5
    const/16 v22, 0x0

    goto/16 :goto_2
.end method

.method private cancelAllTasks()V
    .locals 6

    .prologue
    .line 1128
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1129
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    .line 1131
    .local v1, task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->cancel(Z)Z

    .line 1132
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 1133
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    iget v4, v1, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1136
    iget v3, v1, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 1137
    .local v2, v:Landroid/view/View;
    instance-of v3, v2, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    if-eqz v3, :cond_0

    .line 1138
    check-cast v2, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->removeAllViewsOnPage()V

    goto :goto_0

    .line 1141
    .end local v1           #task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    :cond_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1142
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1143
    return-void
.end method

.method private cleanupWidgetPreloading(Z)V
    .locals 6
    .parameter "widgetWasAdded"

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 844
    if-nez p1, :cond_0

    .line 846
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .line 847
    .local v0, info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;
    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .line 849
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    if-nez v2, :cond_1

    .line 851
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 852
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 872
    .end local v0           #info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;
    :cond_0
    :goto_0
    iput v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 873
    iput v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    .line 874
    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .line 875
    invoke-static {}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->resetShortPressTarget()V

    .line 876
    return-void

    .line 853
    .restart local v0       #info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;
    :cond_1
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 855
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    if-eq v2, v4, :cond_2

    .line 856
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 860
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 861
    :cond_3
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 863
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    if-eq v2, v4, :cond_4

    .line 864
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 868
    :cond_4
    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 869
    .local v1, widget:Landroid/appwidget/AppWidgetHostView;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

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
    .line 2493
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

    .line 2494
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

    .line 2495
    .local v0, i:Ljava/lang/Object;
    instance-of v3, v0, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v3, :cond_1

    move-object v2, v0

    .line 2496
    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    .line 2497
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

    .line 2501
    .end local v2           #info:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_1
    instance-of v3, v0, Landroid/content/pm/ResolveInfo;

    if-eqz v3, :cond_0

    move-object v2, v0

    .line 2502
    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 2503
    .local v2, info:Landroid/content/pm/ResolveInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   label=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

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

    .line 2507
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
    .line 1018
    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    if-eq p1, v0, :cond_1

    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    if-nez v0, :cond_1

    .line 1022
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragMode()V

    .line 1024
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->unlockScreenOrientation(Z)V

    .line 1025
    return-void
.end method

.method private findAppByComponent(Ljava/util/List;Lcom/cyanogenmod/trebuchet/ApplicationInfo;)I
    .locals 5
    .parameter
    .parameter "item"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ")I"
        }
    .end annotation

    .prologue
    .line 2375
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v4, p2, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    .line 2376
    .local v3, removeComponent:Landroid/content/ComponentName;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .line 2377
    .local v2, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 2378
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 2379
    .local v1, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v4, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2383
    .end local v0           #i:I
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :goto_1
    return v0

    .line 2377
    .restart local v0       #i:I
    .restart local v1       #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2383
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private findAppByPackage(Ljava/util/List;Ljava/lang/String;)I
    .locals 4
    .parameter
    .parameter "packageName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 2386
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .line 2387
    .local v2, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 2388
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 2389
    .local v1, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/ItemInfo;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2393
    .end local v0           #i:I
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :goto_1
    return v0

    .line 2387
    .restart local v0       #i:I
    .restart local v1       #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2393
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private getMiddleComponentIndexOnCurrentPage()I
    .locals 9

    .prologue
    .line 446
    const/4 v3, -0x1

    .line 447
    .local v3, i:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageCount()I

    move-result v7

    if-lez v7, :cond_0

    .line 448
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v2

    .line 449
    .local v2, currentPage:I
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v7, :cond_2

    .line 450
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v2, v7, :cond_1

    .line 451
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    .line 452
    .local v4, layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildrenLayout()Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    move-result-object v1

    .line 453
    .local v1, childrenLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int v6, v7, v8

    .line 454
    .local v6, numItemsPerPage:I
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 455
    .local v0, childCount:I
    if-lez v0, :cond_0

    .line 456
    mul-int v7, v2, v6

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    .line 490
    .end local v0           #childCount:I
    .end local v1           #childrenLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
    .end local v2           #currentPage:I
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    .end local v6           #numItemsPerPage:I
    :cond_0
    :goto_0
    return v3

    .line 459
    .restart local v2       #currentPage:I
    :cond_1
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 460
    .local v5, numApps:I
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .line 461
    .local v4, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v6, v7, v8

    .line 462
    .restart local v6       #numItemsPerPage:I
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildCount()I

    move-result v0

    .line 463
    .restart local v0       #childCount:I
    if-lez v0, :cond_0

    .line 464
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int v7, v2, v7

    mul-int/2addr v7, v6

    add-int/2addr v7, v5

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    goto :goto_0

    .line 469
    .end local v0           #childCount:I
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    .end local v5           #numApps:I
    .end local v6           #numItemsPerPage:I
    :cond_2
    sget-object v7, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    goto :goto_0

    .line 471
    :pswitch_0
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    .line 472
    .local v4, layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildrenLayout()Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    move-result-object v1

    .line 473
    .restart local v1       #childrenLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int v6, v7, v8

    .line 474
    .restart local v6       #numItemsPerPage:I
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 475
    .restart local v0       #childCount:I
    if-lez v0, :cond_0

    .line 476
    mul-int v7, v2, v6

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    goto :goto_0

    .line 480
    .end local v0           #childCount:I
    .end local v1           #childrenLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    .end local v6           #numItemsPerPage:I
    :pswitch_1
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .line 481
    .local v4, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v6, v7, v8

    .line 482
    .restart local v6       #numItemsPerPage:I
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildCount()I

    move-result v0

    .line 483
    .restart local v0       #childCount:I
    if-lez v0, :cond_0

    .line 484
    mul-int v7, v2, v6

    div-int/lit8 v8, v0, 0x2

    add-int v3, v7, v8

    goto :goto_0

    .line 469
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getShortcutPreview(Landroid/content/pm/ResolveInfo;II)Landroid/graphics/Bitmap;
    .locals 19
    .parameter "info"
    .parameter "maxWidth"
    .parameter "maxHeight"

    .prologue
    .line 1400
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/cyanogenmod/trebuchet/BitmapCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/BitmapCache;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 1401
    .local v4, tempBitmap:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Canvas;

    .line 1402
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

    .line 1405
    :cond_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1406
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewBitmap:Lcom/cyanogenmod/trebuchet/BitmapCache;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/BitmapCache;->set(Ljava/lang/Object;)V

    .line 1413
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResIcon(Landroid/content/pm/ResolveInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1415
    .local v3, icon:Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0d003e

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    .line 1417
    .local v6, paddingTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0d003c

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    .line 1419
    .local v5, paddingLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0d003d

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v18

    .line 1422
    .local v18, paddingRight:I
    sub-int v2, p2, v5

    sub-int v7, v2, v18

    .local v7, scaledIconWidth:I
    move-object/from16 v2, p0

    move v8, v7

    .line 1424
    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1427
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 1428
    .local v10, preview:Landroid/graphics/Bitmap;
    invoke-virtual {v15, v10}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1429
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PaintCache;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/graphics/Paint;

    .line 1430
    .local v17, p:Landroid/graphics/Paint;
    if-nez v17, :cond_1

    .line 1431
    new-instance v17, Landroid/graphics/Paint;

    .end local v17           #p:Landroid/graphics/Paint;
    invoke-direct/range {v17 .. v17}, Landroid/graphics/Paint;-><init>()V

    .line 1432
    .restart local v17       #p:Landroid/graphics/Paint;
    new-instance v16, Landroid/graphics/ColorMatrix;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 1433
    .local v16, colorMatrix:Landroid/graphics/ColorMatrix;
    const/4 v2, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 1434
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1435
    const/16 v2, 0xf

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1438
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedShortcutPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/PaintCache;->set(Ljava/lang/Object;)V

    .line 1440
    .end local v16           #colorMatrix:Landroid/graphics/ColorMatrix;
    :cond_1
    const/4 v2, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v15, v4, v2, v8, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1441
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1443
    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    move-object/from16 v8, p0

    move-object v9, v3

    invoke-direct/range {v8 .. v14}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1445
    return-object v10

    .line 1408
    .end local v3           #icon:Landroid/graphics/drawable/Drawable;
    .end local v5           #paddingLeft:I
    .end local v6           #paddingTop:I
    .end local v7           #scaledIconWidth:I
    .end local v10           #preview:Landroid/graphics/Bitmap;
    .end local v17           #p:Landroid/graphics/Paint;
    .end local v18           #paddingRight:I
    :cond_2
    invoke-virtual {v15, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1409
    const/4 v2, 0x0

    sget-object v8, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v15, v2, v8}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 1410
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0
.end method

.method private getSleepForPage(I)I
    .locals 3
    .parameter "page"

    .prologue
    .line 1302
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getWidgetPageLoadPriority(I)I

    move-result v0

    .line 1303
    .local v0, pageDiff:I
    const/4 v1, 0x0

    mul-int/lit16 v2, v0, 0xc8

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1
.end method

.method private getTabHost()Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    .locals 2

    .prologue
    .line 2482
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v1, 0x7f070036

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    return-object v0
.end method

.method private getThreadPriorityForPage(I)I
    .locals 3
    .parameter "page"

    .prologue
    const/16 v2, 0x13

    const/4 v1, 0x1

    .line 1292
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getWidgetPageLoadPriority(I)I

    move-result v0

    .line 1293
    .local v0, pageDiff:I
    if-gtz v0, :cond_0

    .line 1298
    :goto_0
    return v1

    .line 1295
    :cond_0
    if-gt v0, v1, :cond_1

    move v1, v2

    .line 1296
    goto :goto_0

    :cond_1
    move v1, v2

    .line 1298
    goto :goto_0
.end method

.method private getWidgetPageLoadPriority(I)I
    .locals 7
    .parameter "page"

    .prologue
    .line 1268
    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    .line 1269
    .local v4, toPage:I
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    const/4 v6, -0x1

    if-le v5, v6, :cond_0

    .line 1270
    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    .line 1276
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1277
    .local v0, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;>;"
    const v1, 0x7fffffff

    .line 1278
    .local v1, minPageDiff:I
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1279
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    .line 1280
    .local v3, task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    iget v5, v3, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    sub-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 1281
    goto :goto_0

    .line 1283
    .end local v3           #task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    :cond_1
    sub-int v5, p1, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 1284
    .local v2, rawPageDiff:I
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    sub-int v5, v2, v5

    return v5
.end method

.method private getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;
    .locals 28
    .parameter "provider"
    .parameter "previewImage"
    .parameter "iconId"
    .parameter "cellHSpan"
    .parameter "cellVSpan"
    .parameter "maxWidth"
    .parameter "maxHeight"

    .prologue
    .line 1451
    invoke-virtual/range {p1 .. p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v20

    .line 1452
    .local v20, packageName:Ljava/lang/String;
    if-gez p6, :cond_0

    const p6, 0x7fffffff

    .line 1453
    :cond_0
    if-gez p7, :cond_1

    const p7, 0x7fffffff

    .line 1455
    :cond_1
    const/16 v16, 0x0

    .line 1456
    .local v16, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz p2, :cond_2

    .line 1457
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v7, 0x0

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v2, v0, v1, v7}, Landroid/content/pm/PackageManager;->getDrawable(Ljava/lang/String;ILandroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 1458
    if-nez v16, :cond_2

    .line 1459
    const-string v2, "Trebuchet.AppsCustomizePagedView"

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

    .line 1466
    :cond_2
    const/4 v4, 0x0

    .line 1467
    .local v4, defaultPreview:Landroid/graphics/Bitmap;
    if-eqz v16, :cond_6

    const/16 v27, 0x1

    .line 1468
    .local v27, widgetPreviewExists:Z
    :goto_0
    if-eqz v27, :cond_7

    .line 1469
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v12

    .line 1470
    .local v12, bitmapWidth:I
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v13

    .line 1521
    .local v13, bitmapHeight:I
    :cond_3
    :goto_1
    const/high16 v24, 0x3f80

    .line 1522
    .local v24, scale:F
    move/from16 v0, p6

    if-le v12, v0, :cond_4

    .line 1523
    move/from16 v0, p6

    int-to-float v2, v0

    int-to-float v7, v12

    div-float v24, v2, v7

    .line 1525
    :cond_4
    const/high16 v2, 0x3f80

    cmpl-float v2, v24, v2

    if-eqz v2, :cond_5

    .line 1526
    int-to-float v2, v12

    mul-float v2, v2, v24

    float-to-int v12, v2

    .line 1527
    int-to-float v2, v13

    mul-float v2, v2, v24

    float-to-int v13, v2

    .line 1530
    :cond_5
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v13, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 1534
    .local v9, preview:Landroid/graphics/Bitmap;
    if-eqz v27, :cond_b

    .line 1535
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, v16

    invoke-direct/range {v7 .. v13}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V

    .line 1554
    :goto_2
    return-object v9

    .line 1467
    .end local v9           #preview:Landroid/graphics/Bitmap;
    .end local v12           #bitmapWidth:I
    .end local v13           #bitmapHeight:I
    .end local v24           #scale:F
    .end local v27           #widgetPreviewExists:Z
    :cond_6
    const/16 v27, 0x0

    goto :goto_0

    .line 1473
    .restart local v27       #widgetPreviewExists:Z
    :cond_7
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ge v0, v2, :cond_8

    const/16 p4, 0x1

    .line 1474
    :cond_8
    const/4 v2, 0x1

    move/from16 v0, p5

    if-ge v0, v2, :cond_9

    const/16 p5, 0x1

    .line 1476
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v7, 0x7f02005f

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v21

    check-cast v21, Landroid/graphics/drawable/BitmapDrawable;

    .line 1478
    .local v21, previewDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v23

    .line 1480
    .local v23, previewDrawableWidth:I
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v22

    .line 1482
    .local v22, previewDrawableHeight:I
    mul-int v12, v23, p4

    .line 1483
    .restart local v12       #bitmapWidth:I
    mul-int v13, v22, p5

    .line 1485
    .restart local v13       #bitmapHeight:I
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v13, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1487
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/graphics/Canvas;

    .line 1488
    .local v14, c:Landroid/graphics/Canvas;
    invoke-virtual {v14, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1489
    const/4 v2, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v7, v12, v13}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 1490
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v7}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeXY(Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 1492
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1493
    const/4 v2, 0x0

    invoke-virtual {v14, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1496
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    const/high16 v7, 0x3e80

    mul-float/2addr v2, v7

    float-to-int v0, v2

    move/from16 v18, v0

    .line 1497
    .local v18, minOffset:I
    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v25

    .line 1498
    .local v25, smallestSide:I
    move/from16 v0, v25

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    mul-int/lit8 v8, v18, 0x2

    add-int/2addr v7, v8

    int-to-float v7, v7

    div-float/2addr v2, v7

    const/high16 v7, 0x3f80

    invoke-static {v2, v7}, Ljava/lang/Math;->min(FF)F

    move-result v17

    .line 1502
    .local v17, iconScale:F
    const/4 v3, 0x0

    .line 1503
    .local v3, icon:Landroid/graphics/drawable/Drawable;
    move/from16 v0, v23

    int-to-float v2, v0

    :try_start_0
    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v7, v7

    mul-float v7, v7, v17

    sub-float/2addr v2, v7

    const/high16 v7, 0x4000

    div-float/2addr v2, v7

    float-to-int v5, v2

    .line 1505
    .local v5, hoffset:I
    move/from16 v0, v22

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v7, v7

    mul-float v7, v7, v17

    sub-float/2addr v2, v7

    const/high16 v7, 0x4000

    div-float/2addr v2, v7

    float-to-int v6, v2

    .line 1507
    .local v6, yoffset:I
    if-lez p3, :cond_a

    .line 1508
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    move-object/from16 v0, v20

    move/from16 v1, p3

    invoke-virtual {v2, v0, v1}, Lcom/cyanogenmod/trebuchet/IconCache;->getFullResIcon(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1509
    :cond_a
    if-eqz v3, :cond_3

    .line 1510
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v7, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAppIconSize:I

    int-to-float v2, v2

    mul-float v2, v2, v17

    float-to-int v8, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIII)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 1514
    .end local v5           #hoffset:I
    .end local v6           #yoffset:I
    :catch_0
    move-exception v2

    goto/16 :goto_1

    .line 1538
    .end local v3           #icon:Landroid/graphics/drawable/Drawable;
    .end local v14           #c:Landroid/graphics/Canvas;
    .end local v17           #iconScale:F
    .end local v18           #minOffset:I
    .end local v21           #previewDrawable:Landroid/graphics/drawable/BitmapDrawable;
    .end local v22           #previewDrawableHeight:I
    .end local v23           #previewDrawableWidth:I
    .end local v25           #smallestSide:I
    .restart local v9       #preview:Landroid/graphics/Bitmap;
    .restart local v24       #scale:F
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewCanvas:Lcom/cyanogenmod/trebuchet/CanvasCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CanvasCache;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/graphics/Canvas;

    .line 1539
    .restart local v14       #c:Landroid/graphics/Canvas;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewSrcRect:Lcom/cyanogenmod/trebuchet/RectCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/RectCache;->get()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Landroid/graphics/Rect;

    .line 1540
    .local v26, src:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewDestRect:Lcom/cyanogenmod/trebuchet/RectCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/RectCache;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Rect;

    .line 1541
    .local v15, dest:Landroid/graphics/Rect;
    invoke-virtual {v14, v9}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1542
    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    move-object/from16 v0, v26

    invoke-virtual {v0, v2, v7, v8, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 1543
    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    invoke-virtual {v15, v2, v7, v8, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 1545
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PaintCache;->get()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/graphics/Paint;

    .line 1546
    .local v19, p:Landroid/graphics/Paint;
    if-nez v19, :cond_c

    .line 1547
    new-instance v19, Landroid/graphics/Paint;

    .end local v19           #p:Landroid/graphics/Paint;
    invoke-direct/range {v19 .. v19}, Landroid/graphics/Paint;-><init>()V

    .line 1548
    .restart local v19       #p:Landroid/graphics/Paint;
    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1549
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCachedAppWidgetPreviewPaint:Lcom/cyanogenmod/trebuchet/PaintCache;

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/PaintCache;->set(Ljava/lang/Object;)V

    .line 1551
    :cond_c
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v14, v4, v0, v15, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1552
    const/4 v2, 0x0

    invoke-virtual {v14, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_2
.end method

.method private invalidateOnDataChange()V
    .locals 1

    .prologue
    .line 2303
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->isDataReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2306
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->requestLayout()V

    .line 2311
    :goto_0
    return-void

    .line 2308
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 2309
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData()V

    goto :goto_0
.end method

.method private loadWidgetPreviewsInBackground(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 16
    .parameter "task"
    .parameter "data"

    .prologue
    .line 1675
    if-eqz p1, :cond_0

    .line 1677
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->syncThreadPriority()V

    .line 1681
    :cond_0
    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 1682
    .local v15, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    .line 1683
    .local v12, images:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/graphics/Bitmap;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 1684
    .local v14, item:Ljava/lang/Object;
    if-eqz p1, :cond_4

    .line 1686
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1709
    .end local v14           #item:Ljava/lang/Object;
    :cond_2
    return-void

    .line 1689
    .restart local v14       #item:Ljava/lang/Object;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->syncThreadPriority()V

    .line 1692
    :cond_4
    instance-of v1, v14, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v1, :cond_5

    move-object v13, v14

    .line 1693
    check-cast v13, Landroid/appwidget/AppWidgetProviderInfo;

    .line 1694
    .local v13, info:Landroid/appwidget/AppWidgetProviderInfo;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v1, v13}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v10

    .line 1696
    .local v10, cellSpans:[I
    move-object/from16 v0, p2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->maxImageWidth:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    const/4 v3, 0x0

    aget v3, v10, v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->estimateCellWidth(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1698
    .local v7, maxWidth:I
    move-object/from16 v0, p2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->maxImageHeight:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    const/4 v3, 0x1

    aget v3, v10, v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->estimateCellHeight(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 1700
    .local v8, maxHeight:I
    iget-object v2, v13, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v3, v13, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    iget v4, v13, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    const/4 v1, 0x0

    aget v5, v10, v1

    const/4 v1, 0x1

    aget v6, v10, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getWidgetPreview(Landroid/content/ComponentName;IIIIII)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 1702
    .local v9, b:Landroid/graphics/Bitmap;
    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1703
    .end local v7           #maxWidth:I
    .end local v8           #maxHeight:I
    .end local v9           #b:Landroid/graphics/Bitmap;
    .end local v10           #cellSpans:[I
    .end local v13           #info:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_5
    instance-of v1, v14, Landroid/content/pm/ResolveInfo;

    if-eqz v1, :cond_1

    move-object v13, v14

    .line 1705
    check-cast v13, Landroid/content/pm/ResolveInfo;

    .line 1706
    .local v13, info:Landroid/content/pm/ResolveInfo;
    move-object/from16 v0, p2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->maxImageWidth:I

    move-object/from16 v0, p2

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->maxImageHeight:I

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getShortcutPreview(Landroid/content/pm/ResolveInfo;II)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private onSyncWidgetPageItems(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 12
    .parameter "data"

    .prologue
    const/4 v11, 0x0

    .line 1712
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInTransition:Z

    if-eqz v10, :cond_0

    .line 1713
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1741
    :goto_0
    return-void

    .line 1717
    :cond_0
    :try_start_0
    iget v5, p1, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->page:I

    .line 1718
    .local v5, page:I
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .line 1720
    .local v4, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    iget-object v3, p1, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 1721
    .local v3, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1722
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 1723
    invoke-virtual {v4, v1}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    .line 1724
    .local v9, widget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    if-eqz v9, :cond_1

    .line 1725
    iget-object v10, p1, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Bitmap;

    .line 1726
    .local v7, preview:Landroid/graphics/Bitmap;
    new-instance v10, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    invoke-direct {v10, v7}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v9, v10}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->applyPreview(Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;)V

    .line 1722
    .end local v7           #preview:Landroid/graphics/Bitmap;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1730
    .end local v9           #widget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    :cond_2
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->createHardwareLayer()V

    .line 1731
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidate()V

    .line 1734
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    .line 1735
    .local v8, task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    iget v6, v8, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    .line 1736
    .local v6, pageIndex:I
    invoke-direct {p0, v6}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v10

    invoke-virtual {v8, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->setThreadPriority(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 1739
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    .end local v5           #page:I
    .end local v6           #pageIndex:I
    .end local v8           #task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    :catchall_0
    move-exception v10

    invoke-virtual {p1, v11}, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->cleanup(Z)V

    throw v10

    .restart local v0       #count:I
    .restart local v1       #i:I
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v3       #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v4       #layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    .restart local v5       #page:I
    :cond_3
    invoke-virtual {p1, v11}, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->cleanup(Z)V

    goto :goto_0
.end method

.method private preloadWidget(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V
    .locals 3
    .parameter "info"

    .prologue
    .line 774
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    .line 775
    .local v1, pInfo:Landroid/appwidget/AppWidgetProviderInfo;
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getDefaultOptionsForWidget(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)Landroid/os/Bundle;

    move-result-object v0

    .line 777
    .local v0, options:Landroid/os/Bundle;
    iget-object v2, v1, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v2, :cond_0

    .line 778
    iput-object v0, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 829
    :goto_0
    return-void

    .line 782
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 783
    new-instance v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Landroid/os/Bundle;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    .line 802
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mBindWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    .line 804
    new-instance v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;

    invoke-direct {v2, p0, v1, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Landroid/appwidget/AppWidgetProviderInfo;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    .line 828
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInflateWidgetRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;II)V
    .locals 12
    .parameter "page"
    .parameter
    .parameter "cellWidth"
    .parameter "cellHeight"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 1312
    .local p2, widgets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 1313
    .local v7, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;>;"
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1314
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    .line 1315
    .local v10, task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    iget v11, v10, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    .line 1316
    .local v11, taskPage:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getAssociatedLowerPageBound(I)I

    move-result v1

    if-lt v11, v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getAssociatedUpperPageBound(I)I

    move-result v1

    if-le v11, v1, :cond_1

    .line 1318
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->cancel(Z)Z

    .line 1319
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 1321
    :cond_1
    invoke-direct {p0, v11}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v1

    invoke-virtual {v10, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1326
    .end local v10           #task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    .end local v11           #taskPage:I
    :cond_2
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getSleepForPage(I)I

    move-result v8

    .line 1327
    .local v8, sleepMs:I
    new-instance v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    new-instance v5, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$5;

    invoke-direct {v5, p0, v8}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$5;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;I)V

    new-instance v6, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;

    invoke-direct {v6, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V

    move v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;-><init>(ILjava/util/ArrayList;IILcom/cyanogenmod/trebuchet/AsyncTaskCallback;Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;)V

    .line 1360
    .local v0, pageData:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    new-instance v9, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    sget-object v2, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;->LoadWidgetPreviewData:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;

    invoke-direct {v9, p1, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;-><init>(ILcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;)V

    .line 1362
    .local v9, t:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v1

    invoke-virtual {v9, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    .line 1363
    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v9, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1364
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1365
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
    .line 2406
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

    .line 2407
    .local v1, pn:Ljava/lang/String;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->findAppByPackage(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    .line 2408
    .local v2, removeIndex:I
    :goto_0
    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 2409
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2410
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->findAppByPackage(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 2413
    .end local v1           #pn:Ljava/lang/String;
    .end local v2           #removeIndex:I
    :cond_1
    return-void
.end method

.method private removeAppsWithoutInvalidate(Ljava/util/ArrayList;)V
    .locals 4
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
    .line 2397
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 2398
    .local v1, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->findAppByComponent(Ljava/util/List;Lcom/cyanogenmod/trebuchet/ApplicationInfo;)I

    move-result v2

    .line 2399
    .local v2, removeIndex:I
    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 2400
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 2403
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    .end local v2           #removeIndex:I
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
    .line 1383
    const/high16 v7, 0x3f80

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->renderDrawableToBitmap(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;IIIIF)V

    .line 1384
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
    .line 1388
    if-eqz p2, :cond_0

    .line 1389
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1390
    .local v0, c:Landroid/graphics/Canvas;
    invoke-virtual {v0, p7, p7}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1391
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->copyBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 1392
    .local v1, oldBounds:Landroid/graphics/Rect;
    add-int v2, p3, p5

    add-int v3, p4, p6

    invoke-virtual {p1, p3, p4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1393
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1394
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 1395
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1397
    .end local v0           #c:Landroid/graphics/Canvas;
    .end local v1           #oldBounds:Landroid/graphics/Rect;
    :cond_0
    return-void
.end method

.method private screenScrolledAccordion(I)V
    .locals 8
    .parameter "screenScroll"

    .prologue
    const/high16 v7, 0x3f80

    const/4 v6, 0x0

    .line 1988
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 1989
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    .line 1990
    .local v4, v:Landroid/view/View;
    if-eqz v4, :cond_0

    .line 1991
    invoke-virtual {p0, p1, v4, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1992
    .local v3, scrollProgress:F
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v2, v7, v5

    .line 1994
    .local v2, scale:F
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v5, :cond_2

    .line 1995
    cmpg-float v5, v3, v6

    if-gez v5, :cond_1

    move v5, v6

    :goto_1
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 1996
    invoke-virtual {v4, v2}, Landroid/view/View;->setScaleX(F)V

    .line 2002
    :goto_2
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_0

    .line 2003
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v0, v7, v5

    .line 2004
    .local v0, alpha:F
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1988
    .end local v0           #alpha:F
    .end local v2           #scale:F
    .end local v3           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1995
    .restart local v2       #scale:F
    .restart local v3       #scrollProgress:F
    :cond_1
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    goto :goto_1

    .line 1998
    :cond_2
    cmpg-float v5, v3, v6

    if-gez v5, :cond_3

    move v5, v6

    :goto_3
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 1999
    invoke-virtual {v4, v2}, Landroid/view/View;->setScaleY(F)V

    goto :goto_2

    .line 1998
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    goto :goto_3

    .line 2008
    .end local v2           #scale:F
    .end local v3           #scrollProgress:F
    .end local v4           #v:Landroid/view/View;
    :cond_4
    return-void
.end method

.method private screenScrolledCarousel(IZ)V
    .locals 8
    .parameter "screenScroll"
    .parameter "left"

    .prologue
    const/4 v6, 0x0

    .line 2091
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 2092
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    .line 2093
    .local v4, v:Landroid/view/View;
    if-eqz v4, :cond_0

    .line 2094
    invoke-virtual {p0, p1, v4, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 2095
    .local v3, scrollProgress:F
    const/high16 v5, 0x42b4

    mul-float v2, v5, v3

    .line 2097
    .local v2, rotation:F
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCameraDistance:I

    int-to-float v7, v7

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setCameraDistance(F)V

    .line 2098
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v5, :cond_2

    .line 2099
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 2100
    if-eqz p2, :cond_1

    move v5, v6

    :goto_1
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 2101
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 2102
    neg-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/View;->setRotationY(F)V

    .line 2110
    :goto_2
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_0

    .line 2111
    const/high16 v5, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v0, v5, v7

    .line 2112
    .local v0, alpha:F
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 2091
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2100
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    :cond_1
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    goto :goto_1

    .line 2104
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 2105
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 2106
    if-eqz p2, :cond_3

    move v5, v6

    :goto_3
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 2107
    invoke-virtual {v4, v2}, Landroid/view/View;->setRotationX(F)V

    goto :goto_2

    .line 2106
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    goto :goto_3

    .line 2116
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #v:Landroid/view/View;
    :cond_4
    return-void
.end method

.method private screenScrolledCube(IZ)V
    .locals 9
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const/high16 v8, 0x3f00

    const/4 v6, 0x0

    .line 1919
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_6

    .line 1920
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    .line 1921
    .local v4, v:Landroid/view/View;
    if-eqz v4, :cond_1

    .line 1922
    invoke-virtual {p0, p1, v4, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1923
    .local v3, scrollProgress:F
    if-eqz p2, :cond_2

    const/high16 v5, 0x42b4

    :goto_1
    mul-float v2, v5, v3

    .line 1925
    .local v2, rotation:F
    if-eqz p2, :cond_0

    .line 1926
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCameraDistance:I

    int-to-float v7, v7

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setCameraDistance(F)V

    .line 1929
    :cond_0
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v5, :cond_4

    .line 1930
    cmpg-float v5, v3, v6

    if-gez v5, :cond_3

    move v5, v6

    :goto_2
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 1931
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 1932
    invoke-virtual {v4, v2}, Landroid/view/View;->setRotationY(F)V

    .line 1938
    :goto_3
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_1

    .line 1939
    const/high16 v5, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v0, v5, v7

    .line 1940
    .local v0, alpha:F
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1919
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1923
    .restart local v3       #scrollProgress:F
    :cond_2
    const/high16 v5, -0x3d4c

    goto :goto_1

    .line 1930
    .restart local v2       #rotation:F
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    goto :goto_2

    .line 1934
    :cond_4
    cmpg-float v5, v3, v6

    if-gez v5, :cond_5

    move v5, v6

    :goto_4
    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 1935
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 1936
    neg-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/View;->setRotationX(F)V

    goto :goto_3

    .line 1934
    :cond_5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    goto :goto_4

    .line 1944
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #v:Landroid/view/View;
    :cond_6
    return-void
.end method

.method private screenScrolledCylinder(IZ)V
    .locals 9
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const/high16 v8, 0x3f80

    const/high16 v7, 0x3f00

    .line 2066
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_3

    .line 2067
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    .line 2068
    .local v4, v:Landroid/view/View;
    if-eqz v4, :cond_0

    .line 2069
    invoke-virtual {p0, p1, v4, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 2070
    .local v3, scrollProgress:F
    if-eqz p2, :cond_1

    const/high16 v5, 0x4148

    :goto_1
    mul-float v2, v5, v3

    .line 2072
    .local v2, rotation:F
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v5, :cond_2

    .line 2073
    add-float v5, v3, v8

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 2074
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 2075
    invoke-virtual {v4, v2}, Landroid/view/View;->setRotationY(F)V

    .line 2082
    :goto_2
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_0

    .line 2083
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v0, v8, v5

    .line 2084
    .local v0, alpha:F
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 2066
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2070
    .restart local v3       #scrollProgress:F
    :cond_1
    const/high16 v5, -0x3eb8

    goto :goto_1

    .line 2077
    .restart local v2       #rotation:F
    :cond_2
    add-float v5, v3, v8

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 2078
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 2079
    neg-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/View;->setRotationX(F)V

    goto :goto_2

    .line 2088
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #v:Landroid/view/View;
    :cond_3
    return-void
.end method

.method private screenScrolledFlip(I)V
    .locals 8
    .parameter "screenScroll"

    .prologue
    const/high16 v7, 0x3f00

    .line 2034
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 2035
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v4

    .line 2036
    .local v4, v:Landroid/view/View;
    if-eqz v4, :cond_1

    .line 2037
    invoke-virtual {p0, p1, v4, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 2038
    .local v3, scrollProgress:F
    const/high16 v5, -0x3ccc

    mul-float v2, v5, v3

    .line 2040
    .local v2, rotation:F
    const/high16 v5, -0x4100

    cmpl-float v5, v3, v5

    if-ltz v5, :cond_3

    cmpg-float v5, v3, v7

    if-gtz v5, :cond_3

    .line 2041
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotX(F)V

    .line 2042
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v7

    invoke-virtual {v4, v5}, Landroid/view/View;->setPivotY(F)V

    .line 2043
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v5, :cond_2

    .line 2044
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 2045
    invoke-virtual {v4, v2}, Landroid/view/View;->setRotationY(F)V

    .line 2051
    :goto_1
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_0

    .line 2052
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 2054
    :cond_0
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v5, :cond_1

    .line 2055
    const/high16 v5, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sub-float v0, v5, v6

    .line 2056
    .local v0, alpha:F
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 2034
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2047
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 2048
    neg-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/View;->setRotationX(F)V

    .line 2049
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    iget v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCameraDistance:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/view/View;->setCameraDistance(F)V

    goto :goto_1

    .line 2059
    :cond_3
    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    .line 2063
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #v:Landroid/view/View;
    :cond_4
    return-void
.end method

.method private screenScrolledRotate(IZ)V
    .locals 11
    .parameter "screenScroll"
    .parameter "up"

    .prologue
    .line 1872
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v8

    if-ge v1, v8, :cond_5

    .line 1873
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v7

    .line 1874
    .local v7, v:Landroid/view/View;
    if-eqz v7, :cond_0

    .line 1875
    invoke-virtual {p0, p1, v7, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 1876
    .local v4, scrollProgress:F
    if-eqz p2, :cond_1

    const/high16 v8, 0x4148

    :goto_1
    mul-float v3, v8, v4

    .line 1879
    .local v3, rotation:F
    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v8, :cond_3

    .line 1880
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float v5, v8, v4

    .line 1882
    .local v5, translationX:F
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

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

    div-float v2, v8, v9

    .line 1886
    .local v2, rotatePoint:F
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f00

    mul-float/2addr v8, v9

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotX(F)V

    .line 1887
    if-eqz p2, :cond_2

    .line 1888
    neg-float v8, v2

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotY(F)V

    .line 1892
    :goto_2
    invoke-virtual {v7, v3}, Landroid/view/View;->setRotation(F)V

    .line 1893
    invoke-virtual {v7, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 1910
    .end local v5           #translationX:F
    :goto_3
    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v8, :cond_0

    .line 1911
    const/high16 v8, 0x3f80

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v9

    sub-float v0, v8, v9

    .line 1912
    .local v0, alpha:F
    invoke-virtual {v7, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1872
    .end local v0           #alpha:F
    .end local v2           #rotatePoint:F
    .end local v3           #rotation:F
    .end local v4           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1876
    .restart local v4       #scrollProgress:F
    :cond_1
    const/high16 v8, -0x3eb8

    goto :goto_1

    .line 1890
    .restart local v2       #rotatePoint:F
    .restart local v3       #rotation:F
    .restart local v5       #translationX:F
    :cond_2
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v8, v2

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotY(F)V

    goto :goto_2

    .line 1895
    .end local v2           #rotatePoint:F
    .end local v5           #translationX:F
    :cond_3
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float v6, v8, v4

    .line 1897
    .local v6, translationY:F
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

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

    div-float v2, v8, v9

    .line 1901
    .restart local v2       #rotatePoint:F
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f00

    mul-float/2addr v8, v9

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotY(F)V

    .line 1902
    if-eqz p2, :cond_4

    .line 1903
    neg-float v8, v2

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotX(F)V

    .line 1907
    :goto_4
    neg-float v8, v3

    invoke-virtual {v7, v8}, Landroid/view/View;->setRotation(F)V

    .line 1908
    invoke-virtual {v7, v6}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_3

    .line 1905
    :cond_4
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v8, v2

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotX(F)V

    goto :goto_4

    .line 1916
    .end local v2           #rotatePoint:F
    .end local v3           #rotation:F
    .end local v4           #scrollProgress:F
    .end local v6           #translationY:F
    .end local v7           #v:Landroid/view/View;
    :cond_5
    return-void
.end method

.method private screenScrolledSpin(I)V
    .locals 8
    .parameter "screenScroll"

    .prologue
    .line 2011
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 2012
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v5

    .line 2013
    .local v5, v:Landroid/view/View;
    if-eqz v5, :cond_1

    .line 2014
    invoke-virtual {p0, p1, v5, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 2015
    .local v3, scrollProgress:F
    const/high16 v6, 0x4334

    mul-float v2, v6, v3

    .line 2017
    .local v2, rotation:F
    invoke-virtual {v5, v2}, Landroid/view/View;->setRotation(F)V

    .line 2019
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v7

    if-le v6, v7, :cond_0

    .line 2020
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    const/high16 v7, 0x4000

    div-float/2addr v6, v7

    neg-float v7, v3

    mul-float v4, v6, v7

    .line 2022
    .local v4, translationX:F
    invoke-virtual {v5, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 2025
    .end local v4           #translationX:F
    :cond_0
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v6, :cond_1

    .line 2026
    const/high16 v6, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v0, v6, v7

    .line 2027
    .local v0, alpha:F
    invoke-virtual {v5, v0}, Landroid/view/View;->setAlpha(F)V

    .line 2011
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2031
    .end local v5           #v:Landroid/view/View;
    :cond_2
    return-void
.end method

.method private screenScrolledStack(I)V
    .locals 11
    .parameter "screenScroll"

    .prologue
    const/high16 v8, 0x3f80

    const/4 v10, 0x0

    .line 1947
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 1948
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    .line 1949
    .local v6, v:Landroid/view/View;
    if-eqz v6, :cond_1

    .line 1950
    invoke-virtual {p0, p1, v6, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 1951
    .local v4, scrollProgress:F
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mZInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    invoke-static {v4, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    invoke-virtual {v7, v9}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v2

    .line 1953
    .local v2, interpolatedProgress:F
    sub-float v7, v8, v2

    const v9, 0x3f428f5c

    mul-float/2addr v9, v2

    add-float v3, v7, v9

    .line 1954
    .local v3, scale:F
    invoke-static {v10, v4}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v7, :cond_2

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    :goto_1
    int-to-float v7, v7

    mul-float v5, v9, v7

    .line 1958
    .local v5, translation:F
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v7

    if-eqz v7, :cond_0

    cmpg-float v7, v4, v10

    if-gez v7, :cond_4

    .line 1959
    :cond_0
    cmpg-float v7, v4, v10

    if-gez v7, :cond_3

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mAlphaInterpolator:Landroid/view/animation/AccelerateInterpolator;

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v9

    sub-float v9, v8, v9

    invoke-virtual {v7, v9}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .line 1966
    .local v0, alpha:F
    :goto_2
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v7, :cond_5

    .line 1967
    invoke-virtual {v6, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 1971
    :goto_3
    invoke-virtual {v6, v3}, Landroid/view/View;->setScaleX(F)V

    .line 1972
    invoke-virtual {v6, v3}, Landroid/view/View;->setScaleY(F)V

    .line 1973
    invoke-virtual {v6, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1977
    cmpg-float v7, v0, v10

    if-gtz v7, :cond_6

    .line 1978
    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1947
    .end local v0           #alpha:F
    .end local v2           #interpolatedProgress:F
    .end local v3           #scale:F
    .end local v4           #scrollProgress:F
    .end local v5           #translation:F
    :cond_1
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1954
    .restart local v2       #interpolatedProgress:F
    .restart local v3       #scale:F
    .restart local v4       #scrollProgress:F
    :cond_2
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    goto :goto_1

    .restart local v5       #translation:F
    :cond_3
    move v0, v8

    .line 1959
    goto :goto_2

    .line 1963
    :cond_4
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLeftScreenAlphaInterpolator:Landroid/view/animation/DecelerateInterpolator;

    sub-float v9, v8, v4

    invoke-virtual {v7, v9}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v0

    .restart local v0       #alpha:F
    goto :goto_2

    .line 1969
    :cond_5
    invoke-virtual {v6, v5}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_3

    .line 1979
    :cond_6
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eqz v7, :cond_1

    .line 1980
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    .line 1984
    .end local v0           #alpha:F
    .end local v2           #interpolatedProgress:F
    .end local v3           #scale:F
    .end local v4           #scrollProgress:F
    .end local v5           #translation:F
    .end local v6           #v:Landroid/view/View;
    :cond_7
    return-void
.end method

.method private screenScrolledStandard(I)V
    .locals 6
    .parameter "screenScroll"

    .prologue
    .line 1808
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 1809
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v3

    .line 1810
    .local v3, v:Landroid/view/View;
    if-eqz v3, :cond_0

    .line 1811
    invoke-virtual {p0, p1, v3, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v2

    .line 1812
    .local v2, scrollProgress:F
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v4, :cond_0

    .line 1813
    const/high16 v4, 0x3f80

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    sub-float v0, v4, v5

    .line 1814
    .local v0, alpha:F
    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1808
    .end local v0           #alpha:F
    .end local v2           #scrollProgress:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1818
    .end local v3           #v:Landroid/view/View;
    :cond_1
    return-void
.end method

.method private screenScrolledTablet(I)V
    .locals 9
    .parameter "screenScroll"

    .prologue
    .line 1821
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 1822
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v5

    .line 1823
    .local v5, v:Landroid/view/View;
    if-eqz v5, :cond_0

    .line 1824
    invoke-virtual {p0, p1, v5, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1825
    .local v3, scrollProgress:F
    const/high16 v6, 0x4148

    mul-float v2, v6, v3

    .line 1826
    .local v2, rotation:F
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v6

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-virtual {v6, v2, v7, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getOffsetXForRotation(FII)F

    move-result v4

    .line 1828
    .local v4, translation:F
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v6, :cond_1

    .line 1829
    invoke-virtual {v5, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 1830
    invoke-virtual {v5, v2}, Landroid/view/View;->setRotationY(F)V

    .line 1835
    :goto_1
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v6, :cond_0

    .line 1836
    const/high16 v6, 0x3f80

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v0, v6, v7

    .line 1837
    .local v0, alpha:F
    invoke-virtual {v5, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1821
    .end local v0           #alpha:F
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #translation:F
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1832
    .restart local v2       #rotation:F
    .restart local v3       #scrollProgress:F
    .restart local v4       #translation:F
    :cond_1
    invoke-virtual {v5, v4}, Landroid/view/View;->setTranslationY(F)V

    .line 1833
    neg-float v6, v2

    invoke-virtual {v5, v6}, Landroid/view/View;->setRotationX(F)V

    goto :goto_1

    .line 1841
    .end local v2           #rotation:F
    .end local v3           #scrollProgress:F
    .end local v4           #translation:F
    .end local v5           #v:Landroid/view/View;
    :cond_2
    return-void
.end method

.method private screenScrolledZoom(IZ)V
    .locals 11
    .parameter "screenScroll"
    .parameter "in"

    .prologue
    const/high16 v10, 0x3f80

    const v8, 0x3dcccccd

    .line 1844
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v7

    if-ge v1, v7, :cond_4

    .line 1845
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    .line 1846
    .local v6, v:Landroid/view/View;
    if-eqz v6, :cond_1

    .line 1847
    invoke-virtual {p0, p1, v6, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v3

    .line 1848
    .local v3, scrollProgress:F
    if-eqz p2, :cond_2

    const v7, -0x41b33333

    :goto_1
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v9

    mul-float/2addr v7, v9

    add-float v2, v10, v7

    .line 1851
    .local v2, scale:F
    if-nez p2, :cond_0

    .line 1852
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v7, :cond_3

    .line 1853
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v8

    neg-float v9, v3

    mul-float v4, v7, v9

    .line 1854
    .local v4, translationX:F
    invoke-virtual {v6, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 1861
    .end local v4           #translationX:F
    :cond_0
    :goto_2
    invoke-virtual {v6, v2}, Landroid/view/View;->setScaleX(F)V

    .line 1862
    invoke-virtual {v6, v2}, Landroid/view/View;->setScaleY(F)V

    .line 1863
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeInAdjacentScreens:Z

    if-eqz v7, :cond_1

    .line 1864
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v0, v10, v7

    .line 1865
    .local v0, alpha:F
    invoke-virtual {v6, v0}, Landroid/view/View;->setAlpha(F)V

    .line 1844
    .end local v0           #alpha:F
    .end local v2           #scale:F
    .end local v3           #scrollProgress:F
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .restart local v3       #scrollProgress:F
    :cond_2
    move v7, v8

    .line 1848
    goto :goto_1

    .line 1856
    .restart local v2       #scale:F
    :cond_3
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v8

    neg-float v9, v3

    mul-float v5, v7, v9

    .line 1857
    .local v5, translationY:F
    invoke-virtual {v6, v5}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_2

    .line 1869
    .end local v2           #scale:F
    .end local v3           #scrollProgress:F
    .end local v5           #translationY:F
    .end local v6           #v:Landroid/view/View;
    :cond_4
    return-void
.end method

.method private setVisibilityOnChildren(Landroid/view/ViewGroup;I)V
    .locals 3
    .parameter "layout"
    .parameter "visibility"

    .prologue
    .line 1204
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 1205
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1206
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/view/View;->setVisibility(I)V

    .line 1205
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1208
    :cond_0
    return-void
.end method

.method private setupPage(Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;)V
    .locals 7
    .parameter "layout"

    .prologue
    const/high16 v6, -0x8000

    .line 1210
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    invoke-virtual {p1, v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setCellCount(II)V

    .line 1211
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutWidthGap:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutHeightGap:I

    invoke-virtual {p1, v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setGap(II)V

    .line 1212
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingLeft:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingTop:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingRight:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setPadding(IIII)V

    .line 1219
    const/16 v2, 0x8

    invoke-direct {p0, p1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setVisibilityOnChildren(Landroid/view/ViewGroup;I)V

    .line 1220
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1221
    .local v1, widthSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 1222
    .local v0, heightSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageContentWidth()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setMinimumWidth(I)V

    .line 1223
    invoke-virtual {p1, v1, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->measure(II)V

    .line 1224
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setVisibilityOnChildren(Landroid/view/ViewGroup;I)V

    .line 1225
    return-void
.end method

.method private setupPage(Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;)V
    .locals 7
    .parameter "layout"

    .prologue
    const/high16 v6, -0x8000

    .line 1371
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingLeft:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingTop:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingRight:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->setPadding(IIII)V

    .line 1376
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1377
    .local v1, widthSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 1378
    .local v0, heightSpec:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageContentWidth()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->setMinimumWidth(I)V

    .line 1379
    invoke-virtual {p1, v1, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->measure(II)V

    .line 1380
    return-void
.end method

.method private updateCurrentTab(I)V
    .locals 3
    .parameter "currentPage"

    .prologue
    .line 1177
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getTabHost()Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v0

    .line 1178
    .local v0, tabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    if-eqz v0, :cond_0

    .line 1179
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    .line 1180
    .local v1, tag:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1181
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-lt p1, v2, :cond_1

    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1183
    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 1190
    .end local v1           #tag:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1184
    .restart local v1       #tag:Ljava/lang/String;
    :cond_1
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge p1, v2, :cond_0

    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1186
    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    goto :goto_0
.end method

.method private updatePageCounts()V
    .locals 3

    .prologue
    .line 535
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v0, :cond_0

    .line 536
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumWidgetPages:I

    .line 538
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    .line 540
    :cond_0
    return-void
.end method


# virtual methods
.method public addApps(Ljava/util/ArrayList;)V
    .locals 0
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
    .line 2369
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2370
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterAppsWithoutInvalidate()V

    .line 2371
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 2372
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2373
    return-void
.end method

.method protected beginDragging(Landroid/view/View;)Z
    .locals 3
    .parameter "v"

    .prologue
    const/4 v0, 0x0

    .line 980
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->beginDragging(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1009
    :goto_0
    return v0

    .line 982
    :cond_0
    instance-of v1, p1, Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v1, :cond_2

    .line 983
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->beginDraggingApplication(Landroid/view/View;)V

    .line 992
    :cond_1
    new-instance v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V

    const-wide/16 v1, 0x96

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1009
    const/4 v0, 0x1

    goto :goto_0

    .line 984
    :cond_2
    instance-of v1, p1, Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    if-eqz v1, :cond_1

    .line 985
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->beginDraggingWidget(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0
.end method

.method public cleanUpShortPress(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 880
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    if-nez v0, :cond_0

    .line 881
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 883
    :cond_0
    return-void
.end method

.method public clearAllWidgetPages()V
    .locals 5

    .prologue
    .line 1115
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1116
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 1117
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1118
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v2

    .line 1119
    .local v2, v:Landroid/view/View;
    instance-of v3, v2, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    if-eqz v3, :cond_0

    .line 1120
    check-cast v2, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->removeAllViewsOnPage()V

    .line 1121
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDirtyPageContent:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1117
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1124
    :cond_1
    return-void
.end method

.method protected determineDraggingStart(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "ev"

    .prologue
    .line 742
    return-void
.end method

.method public dumpState()V
    .locals 3

    .prologue
    .line 2487
    const-string v0, "Trebuchet.AppsCustomizePagedView"

    const-string v1, "mApps"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2488
    const-string v0, "Trebuchet.AppsCustomizePagedView"

    const-string v1, "mWidgets"

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->dumpAppWidgetProviderInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2489
    return-void
.end method

.method public filterApps()V
    .locals 0

    .prologue
    .line 2449
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterAppsWithoutInvalidate()V

    .line 2450
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 2451
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2452
    return-void
.end method

.method public filterAppsWithoutInvalidate()V
    .locals 5

    .prologue
    .line 2431
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    .line 2432
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2433
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2434
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 2435
    .local v0, appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget v3, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_3

    const/4 v2, 0x1

    .line 2436
    .local v2, system:Z
    :goto_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenApps:Ljava/util/ArrayList;

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getShowSystemApps()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getShowDownloadedApps()Z

    move-result v3

    if-nez v3, :cond_0

    .line 2439
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 2435
    .end local v2           #system:Z
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 2442
    .end local v0           #appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_4
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    sget-object v4, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->Title:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    if-ne v3, v4, :cond_6

    .line 2443
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getAppNameComparator()Ljava/util/Comparator;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 2447
    :cond_5
    :goto_2
    return-void

    .line 2444
    :cond_6
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    sget-object v4, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->InstallDate:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    if-ne v3, v4, :cond_5

    .line 2445
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    sget-object v4, Lcom/cyanogenmod/trebuchet/LauncherModel;->APP_INSTALL_TIME_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_2
.end method

.method protected flashScrollingIndicator(Z)V
    .locals 1
    .parameter "animated"

    .prologue
    .line 2281
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_0

    .line 2282
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->flashScrollingIndicator(Z)V

    .line 2286
    :goto_0
    return-void

    .line 2284
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->showScrollingIndicator(Z)V

    goto :goto_0
.end method

.method protected getAssociatedLowerPageBound(I)I
    .locals 4
    .parameter "page"

    .prologue
    .line 2541
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 2542
    .local v0, count:I
    const/4 v2, 0x7

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 2543
    .local v1, windowSize:I
    add-int/lit8 v2, p1, -0x3

    sub-int v3, v0, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    return v2
.end method

.method protected getAssociatedUpperPageBound(I)I
    .locals 4
    .parameter "page"

    .prologue
    .line 2546
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    .line 2547
    .local v0, count:I
    const/4 v2, 0x7

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 2548
    .local v1, windowSize:I
    add-int/lit8 v2, p1, 0x3

    add-int/lit8 v3, v1, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/lit8 v3, v0, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    return v2
.end method

.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 1029
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 2554
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    .line 2555
    .local v1, page:I
    :goto_0
    const v2, 0x7f0900c3

    .line 2557
    .local v2, stringId:I
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v3, :cond_2

    .line 2560
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v1, v3, :cond_1

    .line 2561
    const v2, 0x7f0900c5

    .line 2562
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    .line 2569
    .local v0, count:I
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    add-int/lit8 v5, v1, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 2579
    .end local v0           #count:I
    :goto_2
    return-object v3

    .line 2554
    .end local v1           #page:I
    .end local v2           #stringId:I
    :cond_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    goto :goto_0

    .line 2564
    .restart local v1       #page:I
    .restart local v2       #stringId:I
    :cond_1
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int/2addr v1, v3

    .line 2565
    const v2, 0x7f0900c6

    .line 2566
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumWidgetPages:I

    .restart local v0       #count:I
    goto :goto_1

    .line 2571
    .end local v0           #count:I
    :cond_2
    sget-object v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 2579
    :goto_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    add-int/lit8 v5, v1, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 2573
    :pswitch_0
    const v2, 0x7f0900c5

    .line 2574
    goto :goto_3

    .line 2576
    :pswitch_1
    const v2, 0x7f0900c6

    goto :goto_3

    .line 2571
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method getDefaultOptionsForWidget(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)Landroid/os/Bundle;
    .locals 9
    .parameter "info"

    .prologue
    .line 750
    const/4 v1, 0x0

    .line 751
    .local v1, options:Landroid/os/Bundle;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v5, v6, :cond_0

    .line 752
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->spanX:I

    iget v7, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->spanY:I

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    invoke-static {v5, v6, v7, v8}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getWidgetSizeRanges(Lcom/cyanogenmod/trebuchet/Launcher;IILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 753
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v2

    .line 756
    .local v2, padding:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v0, v5, Landroid/util/DisplayMetrics;->density:F

    .line 757
    .local v0, density:F
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v3, v5

    .line 758
    .local v3, xPaddingDips:I
    iget v5, v2, Landroid/graphics/Rect;->top:I

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v4, v5

    .line 760
    .local v4, yPaddingDips:I
    new-instance v1, Landroid/os/Bundle;

    .end local v1           #options:Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 761
    .restart local v1       #options:Landroid/os/Bundle;
    const-string v5, "appWidgetMinWidth"

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v6, v3

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 763
    const-string v5, "appWidgetMinHeight"

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v4

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 765
    const-string v5, "appWidgetMaxWidth"

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v3

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 767
    const-string v5, "appWidgetMaxHeight"

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v4

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 770
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
    .line 1798
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->indexToPage(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getPageContentWidth()I
    .locals 1

    .prologue
    .line 2246
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentWidth:I

    return v0
.end method

.method getPageForComponent(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 504
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v1, :cond_2

    .line 505
    if-gez p1, :cond_0

    const/4 v1, 0x0

    .line 524
    :goto_0
    return v1

    .line 507
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 508
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int v0, v1, v2

    .line 509
    .local v0, numItemsPerPage:I
    div-int v1, p1, v0

    goto :goto_0

    .line 511
    .end local v0           #numItemsPerPage:I
    :cond_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v0, v1, v2

    .line 512
    .restart local v0       #numItemsPerPage:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int v2, p1, v2

    div-int/2addr v2, v0

    add-int/2addr v1, v2

    goto :goto_0

    .line 515
    .end local v0           #numItemsPerPage:I
    :cond_2
    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 524
    const/4 v1, -0x1

    goto :goto_0

    .line 517
    :pswitch_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int v0, v1, v2

    .line 518
    .restart local v0       #numItemsPerPage:I
    div-int v1, p1, v0

    goto :goto_0

    .line 521
    .end local v0           #numItemsPerPage:I
    :pswitch_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v0, v1, v2

    .line 522
    .restart local v0       #numItemsPerPage:I
    div-int v1, p1, v0

    goto :goto_0

    .line 515
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method getSaveInstanceStateIndex()I
    .locals 2

    .prologue
    .line 495
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 496
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMiddleComponentIndexOnCurrentPage()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 498
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    return v0
.end method

.method protected getScrollingIndicatorId()I
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 2263
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v0, :cond_1

    .line 2264
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollingIndicatorPosition:I

    if-nez v0, :cond_0

    .line 2265
    const v0, 0x7f070011

    .line 2276
    :goto_0
    return v0

    .line 2266
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollingIndicatorPosition:I

    if-ne v0, v1, :cond_3

    .line 2267
    const v0, 0x7f07000f

    goto :goto_0

    .line 2270
    :cond_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollingIndicatorPosition:I

    if-nez v0, :cond_2

    .line 2271
    const v0, 0x7f070010

    goto :goto_0

    .line 2272
    :cond_2
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollingIndicatorPosition:I

    if-ne v0, v1, :cond_3

    .line 2273
    const v0, 0x7f07000e

    goto :goto_0

    .line 2276
    :cond_3
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getShowDownloadedApps()Z
    .locals 1

    .prologue
    .line 2350
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getShowSystemApps()Z
    .locals 1

    .prologue
    .line 2346
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSortMode()Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;
    .locals 1

    .prologue
    .line 2314
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    return-object v0
.end method

.method public iconPressed(Lcom/cyanogenmod/trebuchet/PagedViewIcon;)V
    .locals 1
    .parameter "icon"

    .prologue
    .line 2521
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v0, :cond_0

    .line 2522
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->resetDrawableState()V

    .line 2524
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    .line 2525
    return-void
.end method

.method protected indexToPage(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 1803
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 434
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->init()V

    .line 435
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;->getVertical()Z

    move-result v2

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    .line 436
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCenterPages:Z

    .line 438
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 439
    .local v0, context:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 440
    .local v1, r:Landroid/content/res/Resources;
    const v2, 0x7f0c000d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42c8

    div-float/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setDragSlopeThreshold(F)V

    .line 441
    return-void

    .line 436
    .end local v0           #context:Landroid/content/Context;
    .end local v1           #r:Landroid/content/res/Resources;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Z
    .locals 1
    .parameter "type"

    .prologue
    .line 1193
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .parameter "v"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 691
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v6

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 730
    :cond_0
    :goto_0
    return-void

    .line 694
    :cond_1
    instance-of v6, p1, Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v6, :cond_3

    .line 696
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 699
    .local v0, appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v6, :cond_2

    .line 700
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->lockDrawableState()V

    .line 706
    :cond_2
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 707
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v6, p1, v7, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    goto :goto_0

    .line 709
    .end local v0           #appInfo:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_3
    instance-of v6, p1, Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    if-eqz v6, :cond_0

    .line 711
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    if-eqz v6, :cond_4

    .line 712
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    invoke-virtual {v6}, Landroid/widget/Toast;->cancel()V

    .line 714
    :cond_4
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f090084

    invoke-static {v6, v7, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    .line 716
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetInstructionToast:Landroid/widget/Toast;

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 719
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0034

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    int-to-float v2, v6

    .line 720
    .local v2, offsetY:F
    const v6, 0x7f070015

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 721
    .local v3, p:Landroid/widget/ImageView;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v1

    .line 722
    .local v1, bounce:Landroid/animation/AnimatorSet;
    const-string v6, "translationY"

    new-array v7, v8, [F

    aput v2, v7, v9

    invoke-static {v3, v6, v7}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 723
    .local v5, tyuAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x7d

    invoke-virtual {v5, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 724
    const-string v6, "translationY"

    new-array v7, v8, [F

    const/4 v8, 0x0

    aput v8, v7, v9

    invoke-static {v3, v6, v7}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 725
    .local v4, tydAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x64

    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 726
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 727
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 728
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0
.end method

.method protected onDataReady(II)V
    .locals 16
    .parameter "width"
    .parameter "height"

    .prologue
    .line 544
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    iget v11, v11, Landroid/content/res/Configuration;->orientation:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_4

    const/4 v5, 0x1

    .line 546
    .local v5, isLandscape:Z
    :goto_0
    const v6, 0x7fffffff

    .line 547
    .local v6, maxCellCountX:I
    const v7, 0x7fffffff

    .line 548
    .local v7, maxCellCountY:I
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 549
    if-eqz v5, :cond_5

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v6

    .line 551
    :goto_1
    if-eqz v5, :cond_6

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v7

    .line 554
    :cond_0
    :goto_2
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountX:I

    const/4 v12, -0x1

    if-le v11, v12, :cond_1

    .line 555
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountX:I

    invoke-static {v6, v11}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 558
    :cond_1
    move v8, v7

    .line 559
    .local v8, maxWidgetCellCountY:I
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountY:I

    const/4 v12, -0x1

    if-le v11, v12, :cond_2

    .line 560
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxAppCellCountY:I

    invoke-static {v8, v11}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 565
    :cond_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutWidthGap:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutHeightGap:I

    invoke-virtual {v11, v12, v13}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setGap(II)V

    .line 566
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingLeft:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingTop:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingRight:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingBottom:I

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setPadding(IIII)V

    .line 568
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v11, v0, v1, v6, v7}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->calculateCellCount(IIII)V

    .line 569
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountX()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    .line 570
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountY()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    .line 571
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 574
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v11

    const/high16 v12, -0x8000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 575
    .local v10, widthSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredHeight()I

    move-result v11

    const/high16 v12, -0x8000

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 576
    .local v2, heightSpec:I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v11, v0, v1, v6, v8}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->calculateCellCount(IIII)V

    .line 577
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v11, v10, v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->measure(II)V

    .line 578
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getContentWidth()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentWidth:I

    .line 580
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getTabHost()Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v3

    .line 581
    .local v3, host:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v4

    .line 584
    .local v4, hostIsTransitioning:Z
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageForComponent(I)I

    move-result v9

    .line 585
    .local v9, page:I
    const/4 v11, 0x0

    invoke-static {v11, v9}, Ljava/lang/Math;->max(II)I

    move-result v11

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(IZ)V

    .line 590
    if-nez v4, :cond_3

    .line 591
    new-instance v11, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$1;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$1;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->post(Ljava/lang/Runnable;)Z

    .line 598
    :cond_3
    return-void

    .line 544
    .end local v2           #heightSpec:I
    .end local v3           #host:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
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

    .line 549
    .restart local v5       #isLandscape:Z
    .restart local v6       #maxCellCountX:I
    .restart local v7       #maxCellCountY:I
    :cond_5
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v6

    goto/16 :goto_1

    .line 551
    :cond_6
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v7

    goto/16 :goto_2
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 1110
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->onDetachedFromWindow()V

    .line 1111
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1112
    return-void
.end method

.method public onDropCompleted(Landroid/view/View;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;ZZ)V
    .locals 9
    .parameter "target"
    .parameter "d"
    .parameter "isFlingToDelete"
    .parameter "success"

    .prologue
    const/4 v5, 0x0

    .line 1066
    if-eqz p3, :cond_0

    .line 1093
    :goto_0
    return-void

    .line 1068
    :cond_0
    invoke-direct {p0, p1, v5, p4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->endDragging(Landroid/view/View;ZZ)V

    .line 1072
    if-nez p4, :cond_3

    .line 1073
    const/4 v3, 0x0

    .line 1074
    .local v3, showOutOfSpaceMessage:Z
    instance-of v6, p1, Lcom/cyanogenmod/trebuchet/Workspace;

    if-eqz v6, :cond_1

    .line 1075
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentWorkspaceScreen()I

    move-result v0

    .local v0, currentScreen:I
    move-object v4, p1

    .line 1076
    check-cast v4, Lcom/cyanogenmod/trebuchet/Workspace;

    .line 1077
    .local v4, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 1078
    .local v2, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-object v1, p2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1079
    .local v1, itemInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-eqz v2, :cond_1

    .line 1080
    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->calculateSpans(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1081
    const/4 v6, 0x0

    iget v7, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iget v8, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-virtual {v2, v6, v7, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v6

    if-nez v6, :cond_4

    const/4 v3, 0x1

    .line 1085
    .end local v0           #currentScreen:I
    .end local v1           #itemInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v2           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v4           #workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    .line 1086
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v6, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

    .line 1089
    :cond_2
    iput-boolean v5, p2, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 1091
    .end local v3           #showOutOfSpaceMessage:Z
    :cond_3
    invoke-direct {p0, p4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 1092
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    goto :goto_0

    .restart local v0       #currentScreen:I
    .restart local v1       #itemInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .restart local v2       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v3       #showOutOfSpaceMessage:Z
    .restart local v4       #workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    :cond_4
    move v3, v5

    .line 1081
    goto :goto_1
.end method

.method public onFlingToDeleteCompleted()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1098
    const/4 v0, 0x0

    invoke-direct {p0, v0, v2, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->endDragging(Landroid/view/View;ZZ)V

    .line 1099
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 1100
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDraggingWidget:Z

    .line 1101
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 733
    invoke-static {p1, p2, p3}, Lcom/cyanogenmod/trebuchet/FocusHelper;->handleAppsCustomizeKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLauncherTransitionEnd(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 5
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    const/4 v3, 0x0

    .line 1050
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInTransition:Z

    .line 1051
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    .line 1052
    .local v0, d:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    goto :goto_0

    .line 1054
    .end local v0           #d:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredSyncWidgetPageItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1055
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    .line 1056
    .local v2, r:Ljava/lang/Runnable;
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 1058
    .end local v2           #r:Ljava/lang/Runnable;
    :cond_1
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1059
    if-nez p3, :cond_2

    const/4 v3, 0x1

    :cond_2
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 1060
    return-void
.end method

.method public onLauncherTransitionPrepare(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 1
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 1034
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInTransition:Z

    .line 1035
    if-eqz p3, :cond_0

    .line 1036
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1038
    :cond_0
    return-void
.end method

.method public onLauncherTransitionStart(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V
    .locals 0
    .parameter "l"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 1042
    return-void
.end method

.method public onLauncherTransitionStep(Lcom/cyanogenmod/trebuchet/Launcher;F)V
    .locals 0
    .parameter "l"
    .parameter "t"

    .prologue
    .line 1046
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 631
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 632
    .local v2, width:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 633
    .local v0, height:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->isDataReady()Z

    move-result v4

    if-nez v4, :cond_1

    .line 635
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    sget-object v5, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-eq v4, v5, :cond_0

    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v4, :cond_3

    .line 636
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 641
    .local v1, isReady:Z
    :goto_0
    if-eqz v1, :cond_1

    .line 642
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setDataIsReady()V

    .line 643
    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setMeasuredDimension(II)V

    .line 644
    invoke-virtual {p0, v2, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onDataReady(II)V

    .line 648
    .end local v1           #isReady:Z
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->onMeasure(II)V

    .line 649
    return-void

    :cond_2
    move v1, v3

    .line 636
    goto :goto_0

    .line 638
    :cond_3
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .restart local v1       #isReady:Z
    :goto_1
    goto :goto_0

    .end local v1           #isReady:Z
    :cond_4
    move v1, v3

    goto :goto_1
.end method

.method public onPackagesUpdated()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 653
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 654
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v9}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/appwidget/AppWidgetManager;->getInstalledProviders()Ljava/util/List;

    move-result-object v8

    .line 656
    .local v8, widgets:Ljava/util/List;,"Ljava/util/List<Landroid/appwidget/AppWidgetProviderInfo;>;"
    new-instance v5, Landroid/content/Intent;

    const-string v9, "android.intent.action.CREATE_SHORTCUT"

    invoke-direct {v5, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 657
    .local v5, shortcutsIntent:Landroid/content/Intent;
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v9, v5, v12}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 658
    .local v4, shortcuts:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/appwidget/AppWidgetProviderInfo;

    .line 659
    .local v7, widget:Landroid/appwidget/AppWidgetProviderInfo;
    iget v9, v7, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    if-lez v9, :cond_2

    iget v9, v7, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    if-lez v9, :cond_2

    .line 661
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v9, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v6

    .line 662
    .local v6, spanXY:[I
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v9, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v2

    .line 663
    .local v2, minSpanXY:[I
    aget v9, v6, v12

    aget v10, v2, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 664
    .local v1, minSpanX:I
    aget v9, v6, v13

    aget v10, v2, v13

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 665
    .local v3, minSpanY:I
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v9

    if-gt v1, v9, :cond_1

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v9

    if-gt v3, v9, :cond_1

    .line 667
    iget-object v9, v7, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    if-eqz v9, :cond_0

    .line 668
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHiddenAppsPackages:Ljava/util/ArrayList;

    iget-object v10, v7, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v10}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 669
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 673
    :cond_1
    const-string v9, "Trebuchet.AppsCustomizePagedView"

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

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 677
    .end local v1           #minSpanX:I
    .end local v2           #minSpanXY:[I
    .end local v3           #minSpanY:I
    .end local v6           #spanXY:[I
    :cond_2
    const-string v9, "Trebuchet.AppsCustomizePagedView"

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

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 681
    .end local v7           #widget:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_3
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 682
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    new-instance v10, Lcom/cyanogenmod/trebuchet/LauncherModel$WidgetAndShortcutNameComparator;

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-direct {v10, v11}, Lcom/cyanogenmod/trebuchet/LauncherModel$WidgetAndShortcutNameComparator;-><init>(Landroid/content/pm/PackageManager;)V

    invoke-static {v9, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 684
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 685
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 686
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 1

    .prologue
    .line 2251
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFadeScrollingIndicator:Z

    if-eqz v0, :cond_0

    .line 2252
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->hideScrollingIndicator(Z)V

    .line 2254
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mForceDrawAllChildrenNextFrame:Z

    .line 2258
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 2259
    return-void
.end method

.method public onShortPress(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 835
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v0, :cond_0

    .line 837
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cleanupWidgetPreloading(Z)V

    .line 839
    :cond_0
    new-instance v1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    invoke-direct {v1, v0}, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;-><init>(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    .line 840
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCreateWidgetInfo:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->preloadWidget(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V

    .line 841
    return-void
.end method

.method protected overScroll(F)V
    .locals 0
    .parameter "amount"

    .prologue
    .line 2238
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->acceleratedOverScroll(F)V

    .line 2239
    return-void
.end method

.method public removeApps(Ljava/util/ArrayList;)V
    .locals 0
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
    .line 2415
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeAppsWithPackageNameWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2416
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterAppsWithoutInvalidate()V

    .line 2417
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 2418
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2419
    return-void
.end method

.method public reset()V
    .locals 5

    .prologue
    .line 2456
    const/4 v3, -0x1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    .line 2458
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v3, :cond_2

    .line 2459
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getTabHost()Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v0

    .line 2460
    .local v0, tabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v2

    .line 2461
    .local v2, tag:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 2462
    sget-object v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getTabTagForContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2463
    sget-object v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setCurrentTabFromContent(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 2476
    .end local v0           #tabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    .end local v2           #tag:Ljava/lang/String;
    :cond_0
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    if-eqz v3, :cond_1

    .line 2477
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(I)V

    .line 2479
    :cond_1
    :goto_0
    return-void

    .line 2467
    :cond_2
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    sget-object v4, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-eq v3, v4, :cond_0

    .line 2469
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v4, 0x7f070036

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    .line 2471
    .local v1, tabs:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->selectAppsTab()V

    goto :goto_0
.end method

.method public resetDrawableState()V
    .locals 1

    .prologue
    .line 2528
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    if-eqz v0, :cond_0

    .line 2529
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->resetDrawableState()V

    .line 2530
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPressedIcon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    .line 2532
    :cond_0
    return-void
.end method

.method restorePageForIndex(I)V
    .locals 0
    .parameter "index"

    .prologue
    .line 530
    if-gez p1, :cond_0

    .line 532
    :goto_0
    return-void

    .line 531
    :cond_0
    iput p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSaveInstanceStateItemIndex:I

    goto :goto_0
.end method

.method protected screenScrolled(I)V
    .locals 14
    .parameter "screenScroll"

    .prologue
    const/high16 v13, 0x3f00

    const v8, 0x3eb33334

    const/4 v10, 0x1

    const/4 v12, 0x0

    const/4 v0, 0x0

    .line 2121
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->screenScrolled(I)V

    .line 2123
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v9, :cond_9

    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollX:I

    if-ltz v9, :cond_0

    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollX:I

    iget v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxScrollX:I

    if-le v9, v11, :cond_8

    :cond_0
    move v1, v10

    .line 2125
    .local v1, isInOverscroll:Z
    :goto_0
    if-eqz v1, :cond_1

    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    if-nez v9, :cond_1

    .line 2126
    iput-boolean v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollTransformsDirty:Z

    .line 2128
    :cond_1
    if-eqz v1, :cond_2

    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollTransformsDirty:Z

    if-eqz v9, :cond_4

    .line 2130
    :cond_2
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v9, :cond_c

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollX:I

    .line 2133
    .local v3, scroll:I
    :goto_1
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    if-eqz v9, :cond_3

    .line 2134
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    .line 2135
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    .line 2136
    .local v6, v0:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v7

    .line 2137
    .local v7, v1:Landroid/view/View;
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v9, :cond_d

    .line 2138
    invoke-virtual {v6, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 2139
    invoke-virtual {v7, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 2140
    invoke-virtual {v6, v12}, Landroid/view/View;->setRotationY(F)V

    .line 2141
    invoke-virtual {v7, v12}, Landroid/view/View;->setRotationY(F)V

    .line 2148
    :goto_2
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    const/high16 v11, 0x44a0

    mul-float/2addr v9, v11

    invoke-virtual {v6, v9}, Landroid/view/View;->setCameraDistance(F)V

    .line 2149
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    const/high16 v11, 0x44a0

    mul-float/2addr v9, v11

    invoke-virtual {v7, v9}, Landroid/view/View;->setCameraDistance(F)V

    .line 2150
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v6, v9}, Landroid/view/View;->setPivotX(F)V

    .line 2151
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v7, v9}, Landroid/view/View;->setPivotX(F)V

    .line 2152
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v6, v9}, Landroid/view/View;->setPivotY(F)V

    .line 2153
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v7, v9}, Landroid/view/View;->setPivotY(F)V

    .line 2156
    .end local v6           #v0:Landroid/view/View;
    .end local v7           #v1:Landroid/view/View;
    :cond_3
    sget-object v9, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mTransitionEffect:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v11

    aget v9, v9, v11

    packed-switch v9, :pswitch_data_0

    .line 2206
    :goto_3
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollTransformsDirty:Z

    .line 2209
    .end local v3           #scroll:I
    :cond_4
    if-eqz v1, :cond_7

    .line 2210
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v9, :cond_e

    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollX:I

    :goto_4
    if-gez v9, :cond_f

    .line 2211
    .local v0, index:I
    :goto_5
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v5

    .line 2212
    .local v5, v:Landroid/view/View;
    if-eqz v5, :cond_7

    .line 2213
    invoke-virtual {p0, p1, v5, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getScrollProgress(ILandroid/view/View;I)F

    move-result v4

    .line 2214
    .local v4, scrollProgress:F
    const/high16 v9, -0x3e50

    mul-float v2, v9, v4

    .line 2215
    .local v2, rotation:F
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    if-nez v9, :cond_6

    .line 2216
    iput-boolean v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverscrollTransformsDirty:Z

    .line 2217
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDensity:F

    iget v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCameraDistance:I

    int-to-float v10, v10

    mul-float/2addr v9, v10

    invoke-virtual {v5, v9}, Landroid/view/View;->setCameraDistance(F)V

    .line 2218
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v9, :cond_10

    .line 2219
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    if-nez v0, :cond_5

    const v8, 0x3f266666

    :cond_5
    mul-float/2addr v8, v9

    invoke-virtual {v5, v8}, Landroid/view/View;->setPivotX(F)V

    .line 2220
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v13

    invoke-virtual {v5, v8}, Landroid/view/View;->setPivotY(F)V

    .line 2221
    invoke-virtual {v5, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 2228
    :cond_6
    :goto_6
    iget-boolean v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mVertical:Z

    if-nez v8, :cond_12

    .line 2229
    invoke-virtual {v5, v2}, Landroid/view/View;->setRotationY(F)V

    .line 2235
    .end local v0           #index:I
    .end local v2           #rotation:F
    .end local v4           #scrollProgress:F
    .end local v5           #v:Landroid/view/View;
    :cond_7
    :goto_7
    return-void

    .end local v1           #isInOverscroll:Z
    :cond_8
    move v1, v0

    .line 2123
    goto/16 :goto_0

    :cond_9
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollY:I

    if-ltz v9, :cond_a

    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollY:I

    iget v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mMaxScrollY:I

    if-le v9, v11, :cond_b

    :cond_a
    move v1, v10

    goto/16 :goto_0

    :cond_b
    move v1, v0

    goto/16 :goto_0

    .line 2130
    .restart local v1       #isInOverscroll:Z
    :cond_c
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mScrollY:I

    goto/16 :goto_1

    .line 2143
    .restart local v3       #scroll:I
    .restart local v6       #v0:Landroid/view/View;
    .restart local v7       #v1:Landroid/view/View;
    :cond_d
    invoke-virtual {v6, v12}, Landroid/view/View;->setTranslationY(F)V

    .line 2144
    invoke-virtual {v7, v12}, Landroid/view/View;->setTranslationY(F)V

    .line 2145
    invoke-virtual {v6, v12}, Landroid/view/View;->setRotationX(F)V

    .line 2146
    invoke-virtual {v7, v12}, Landroid/view/View;->setRotationX(F)V

    goto/16 :goto_2

    .line 2158
    .end local v6           #v0:Landroid/view/View;
    .end local v7           #v1:Landroid/view/View;
    :pswitch_0
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledStandard(I)V

    goto :goto_3

    .line 2161
    :pswitch_1
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledTablet(I)V

    goto :goto_3

    .line 2164
    :pswitch_2
    invoke-direct {p0, v3, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledZoom(IZ)V

    goto :goto_3

    .line 2167
    :pswitch_3
    invoke-direct {p0, v3, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledZoom(IZ)V

    goto/16 :goto_3

    .line 2170
    :pswitch_4
    invoke-direct {p0, v3, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledRotate(IZ)V

    goto/16 :goto_3

    .line 2173
    :pswitch_5
    invoke-direct {p0, v3, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledRotate(IZ)V

    goto/16 :goto_3

    .line 2176
    :pswitch_6
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledSpin(I)V

    goto/16 :goto_3

    .line 2179
    :pswitch_7
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledFlip(I)V

    goto/16 :goto_3

    .line 2182
    :pswitch_8
    invoke-direct {p0, v3, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCube(IZ)V

    goto/16 :goto_3

    .line 2185
    :pswitch_9
    invoke-direct {p0, v3, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCube(IZ)V

    goto/16 :goto_3

    .line 2188
    :pswitch_a
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledStack(I)V

    goto/16 :goto_3

    .line 2191
    :pswitch_b
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledAccordion(I)V

    goto/16 :goto_3

    .line 2194
    :pswitch_c
    invoke-direct {p0, v3, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCylinder(IZ)V

    goto/16 :goto_3

    .line 2197
    :pswitch_d
    invoke-direct {p0, v3, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCylinder(IZ)V

    goto/16 :goto_3

    .line 2200
    :pswitch_e
    invoke-direct {p0, v3, v10}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCarousel(IZ)V

    goto/16 :goto_3

    .line 2203
    :pswitch_f
    invoke-direct {p0, v3, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->screenScrolledCarousel(IZ)V

    goto/16 :goto_3

    .line 2210
    .end local v3           #scroll:I
    :cond_e
    iget v9, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mOverScrollY:I

    goto/16 :goto_4

    :cond_f
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getChildCount()I

    move-result v9

    add-int/lit8 v0, v9, -0x1

    goto/16 :goto_5

    .line 2223
    .restart local v0       #index:I
    .restart local v2       #rotation:F
    .restart local v4       #scrollProgress:F
    .restart local v5       #v:Landroid/view/View;
    :cond_10
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v13

    invoke-virtual {v5, v9}, Landroid/view/View;->setPivotX(F)V

    .line 2224
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    int-to-float v9, v9

    if-nez v0, :cond_11

    const v8, 0x3f266666

    :cond_11
    mul-float/2addr v8, v9

    invoke-virtual {v5, v8}, Landroid/view/View;->setPivotY(F)V

    .line 2225
    invoke-virtual {v5, v12}, Landroid/view/View;->setTranslationY(F)V

    goto/16 :goto_6

    .line 2231
    :cond_12
    neg-float v8, v2

    invoke-virtual {v5, v8}, Landroid/view/View;->setRotationX(F)V

    goto/16 :goto_7

    .line 2156
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

.method public setApps(Ljava/util/ArrayList;)V
    .locals 0
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
    .line 2354
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mApps:Ljava/util/ArrayList;

    .line 2355
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterAppsWithoutInvalidate()V

    .line 2356
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 2357
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2358
    return-void
.end method

.method public setContentType(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V
    .locals 3
    .parameter "type"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1146
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v2, :cond_2

    .line 1147
    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-ne p1, v2, :cond_1

    .line 1148
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(IZ)V

    .line 1156
    :cond_0
    :goto_0
    return-void

    .line 1149
    :cond_1
    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-ne p1, v2, :cond_0

    .line 1150
    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(IZ)V

    goto :goto_0

    .line 1153
    :cond_2
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    .line 1154
    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    if-eq p1, v2, :cond_3

    :goto_1
    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(IZ)V

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method public setCurrentPageToWidgets()V
    .locals 1

    .prologue
    .line 1197
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidatePageData(I)V

    .line 1198
    return-void
.end method

.method public setShowDownloadedApps(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 2337
    if-eqz p1, :cond_0

    .line 2338
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    .line 2342
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterApps()V

    .line 2343
    return-void

    .line 2340
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    goto :goto_0
.end method

.method public setShowSystemApps(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 2328
    if-eqz p1, :cond_0

    .line 2329
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    .line 2333
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterApps()V

    .line 2334
    return-void

    .line 2331
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilterApps:I

    goto :goto_0
.end method

.method public setSortMode(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;)V
    .locals 1
    .parameter "sortMode"

    .prologue
    .line 2318
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    if-ne v0, p1, :cond_0

    .line 2325
    :goto_0
    return-void

    .line 2322
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mSortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    .line 2324
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterApps()V

    goto :goto_0
.end method

.method public setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 0
    .parameter "launcher"
    .parameter "dragController"

    .prologue
    .line 2292
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 2293
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 2294
    return-void
.end method

.method showAllAppsCling()V
    .locals 10

    .prologue
    const/4 v6, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 601
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getTabHost()Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v4

    .line 602
    .local v4, tabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    if-eqz v4, :cond_0

    .line 603
    const v5, 0x7f070012

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 604
    .local v0, allAppsCling:Lcom/cyanogenmod/trebuchet/Cling;
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHasShownAllAppsCling:Z

    if-nez v5, :cond_1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->isDataReady()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 605
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHasShownAllAppsCling:Z

    .line 607
    new-array v2, v6, [I

    .line 608
    .local v2, offset:[I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    iget v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mClingFocusedX:I

    iget v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mClingFocusedY:I

    invoke-virtual {v5, v6, v7}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->estimateCellPosition(II)[I

    move-result-object v3

    .line 609
    .local v3, pos:[I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v5

    invoke-virtual {v5, p0, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 612
    aget v5, v3, v9

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getMeasuredWidth()I

    move-result v6

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getMeasuredWidth()I

    move-result v7

    sub-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x2

    aget v7, v2, v9

    add-int/2addr v6, v7

    add-int/2addr v5, v6

    aput v5, v3, v9

    .line 614
    aget v5, v3, v8

    aget v6, v2, v8

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v7

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/DragLayer;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    add-int/2addr v5, v6

    aput v5, v3, v8

    .line 615
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->showFirstRunAllAppsCling([I)V

    .line 627
    .end local v0           #allAppsCling:Lcom/cyanogenmod/trebuchet/Cling;
    .end local v2           #offset:[I
    .end local v3           #pos:[I
    :cond_0
    :goto_0
    return-void

    .line 616
    .restart local v0       #allAppsCling:Lcom/cyanogenmod/trebuchet/Cling;
    :cond_1
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHasShownAllAppsSortCling:Z

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->isDataReady()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->isDismissed()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 618
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mHasShownAllAppsSortCling:Z

    .line 619
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->selectAppsTab()V

    .line 621
    new-array v2, v6, [I

    .line 622
    .restart local v2       #offset:[I
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getCurrentTabView()Landroid/view/View;

    move-result-object v1

    .line 623
    .local v1, appsTab:Landroid/view/View;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 624
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showFirstRunAllAppsSortCling([I)V

    goto :goto_0
.end method

.method protected snapToPage(III)V
    .locals 5
    .parameter "whichPage"
    .parameter "delta"
    .parameter "duration"

    .prologue
    .line 1159
    invoke-super {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->snapToPage(III)V

    .line 1160
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v3, :cond_3

    .line 1161
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updateCurrentTab(I)V

    .line 1164
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;

    .line 1165
    .local v2, task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    iget v1, v2, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    .line 1166
    .local v1, pageIndex:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    if-le v3, v4, :cond_0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    if-ge v1, v3, :cond_1

    :cond_0
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNextPage:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    if-ge v3, v4, :cond_2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCurrentPage:I

    if-gt v1, v3, :cond_2

    .line 1168
    :cond_1
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getThreadPriorityForPage(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1170
    :cond_2
    const/16 v3, 0x13

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->setThreadPriority(I)V

    goto :goto_0

    .line 1174
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #pageIndex:I
    .end local v2           #task:Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
    :cond_3
    return-void
.end method

.method public supportsFlingToDelete()Z
    .locals 1

    .prologue
    .line 1105
    const/4 v0, 0x1

    return v0
.end method

.method public surrender()V
    .locals 0

    .prologue
    .line 2514
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 2515
    return-void
.end method

.method public syncAppsPageItems(I)V
    .locals 14
    .parameter "page"

    .prologue
    const/4 v13, 0x1

    .line 1238
    iget v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int v6, v10, v11

    .line 1239
    .local v6, numCells:I
    mul-int v7, p1, v6

    .line 1240
    .local v7, startIndex:I
    add-int v10, v7, v6

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1241
    .local v0, endIndex:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    .line 1243
    .local v5, layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->removeAllViewsOnPage()V

    .line 1244
    move v1, v7

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1245
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 1246
    .local v4, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v11, 0x7f040004

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v5, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    .line 1248
    .local v2, icon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;
    invoke-virtual {v2, v4, v13, p0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->applyFromApplicationInfo(Lcom/cyanogenmod/trebuchet/ApplicationInfo;ZLcom/cyanogenmod/trebuchet/PagedViewIcon$PressedCallback;)V

    .line 1249
    invoke-virtual {v2, p0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1250
    invoke-virtual {v2, p0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1251
    invoke-virtual {v2, p0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1252
    invoke-virtual {v2, p0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1254
    sub-int v3, v1, v7

    .line 1255
    .local v3, index:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    rem-int v8, v3, v10

    .line 1256
    .local v8, x:I
    iget v10, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    div-int v9, v3, v10

    .line 1257
    .local v9, y:I
    const/4 v10, -0x1

    new-instance v11, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    invoke-direct {v11, v8, v9, v13, v13}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v5, v2, v10, v1, v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;)Z

    .line 1244
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1260
    .end local v2           #icon:Lcom/cyanogenmod/trebuchet/PagedViewIcon;
    .end local v3           #index:I
    .end local v4           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    .end local v8           #x:I
    .end local v9           #y:I
    :cond_0
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->createHardwareLayers()V

    .line 1261
    return-void
.end method

.method public syncAppsPages()V
    .locals 7

    .prologue
    .line 1228
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1229
    .local v0, context:Landroid/content/Context;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mFilteredApps:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountX:I

    iget v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mCellCountY:I

    mul-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v3, v4

    .line 1230
    .local v3, numPages:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 1231
    new-instance v2, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-direct {v2, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;-><init>(Landroid/content/Context;)V

    .line 1232
    .local v2, layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setupPage(Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;)V

    .line 1233
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addView(Landroid/view/View;)V

    .line 1230
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1235
    .end local v2           #layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    :cond_0
    return-void
.end method

.method public syncPageItems(IZ)V
    .locals 2
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 1777
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v0, :cond_1

    .line 1778
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge p1, v0, :cond_0

    .line 1779
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncAppsPageItems(I)V

    .line 1793
    :goto_0
    return-void

    .line 1781
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncWidgetPageItems(IZ)V

    goto :goto_0

    .line 1784
    :cond_1
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1786
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncAppsPageItems(I)V

    goto :goto_0

    .line 1789
    :pswitch_1
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncWidgetPageItems(IZ)V

    goto :goto_0

    .line 1784
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public syncPages()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 1745
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeAllViews()V

    .line 1746
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->cancelAllTasks()V

    .line 1748
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z

    if-eqz v4, :cond_1

    .line 1749
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1750
    .local v0, context:Landroid/content/Context;
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumWidgetPages:I

    if-ge v2, v4, :cond_0

    .line 1751
    new-instance v3, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    invoke-direct {v3, v0, v4, v5}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;-><init>(Landroid/content/Context;II)V

    .line 1753
    .local v3, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setupPage(Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;)V

    .line 1754
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v3, v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1750
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1758
    .end local v3           #layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    if-ge v1, v4, :cond_2

    .line 1759
    new-instance v3, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-direct {v3, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;-><init>(Landroid/content/Context;)V

    .line 1760
    .local v3, layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setupPage(Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;)V

    .line 1761
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addView(Landroid/view/View;)V

    .line 1758
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1764
    .end local v0           #context:Landroid/content/Context;
    .end local v1           #i:I
    .end local v2           #j:I
    .end local v3           #layout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
    :cond_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 1773
    :cond_2
    :goto_2
    return-void

    .line 1766
    :pswitch_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncAppsPages()V

    goto :goto_2

    .line 1769
    :pswitch_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncWidgetPages()V

    goto :goto_2

    .line 1764
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public syncWidgetPageItems(IZ)V
    .locals 24
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 1571
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int v19, v2, v3

    .line 1574
    .local v19, numItemsPerPage:I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1575
    .local v9, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getContentWidth()I

    move-result v11

    .line 1576
    .local v11, contentWidth:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingLeft:I

    sub-int v2, v11, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingRight:I

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetWidthGap:I

    mul-int/2addr v3, v7

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    div-int v4, v2, v3

    .line 1578
    .local v4, cellWidth:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetSpacingLayout:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getContentHeight()I

    move-result v10

    .line 1579
    .local v10, contentHeight:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingTop:I

    sub-int v2, v10, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPageLayoutPaddingBottom:I

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetHeightGap:I

    mul-int/2addr v3, v7

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    div-int v5, v2, v3

    .line 1583
    .local v5, cellHeight:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mNumAppsPages:I

    sub-int v2, p1, v2

    mul-int v20, v2, v19

    .line 1584
    .local v20, offset:I
    move/from16 v13, v20

    .local v13, i:I
    :goto_0
    add-int v2, v20, v19

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v13, v2, :cond_0

    .line 1585
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1584
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1589
    :cond_0
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .line 1590
    .local v6, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getCellCountX()I

    move-result v2

    invoke-virtual {v6, v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->setColumnCount(I)V

    .line 1591
    const/4 v13, 0x0

    :goto_1
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v13, v2, :cond_5

    .line 1592
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    .line 1594
    .local v21, rawInfo:Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040007

    const/4 v7, 0x0

    invoke-virtual {v2, v3, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v23

    check-cast v23, Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    .line 1596
    .local v23, widget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    move-object/from16 v0, v21

    instance-of v2, v0, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v2, :cond_4

    move-object/from16 v14, v21

    .line 1598
    check-cast v14, Landroid/appwidget/AppWidgetProviderInfo;

    .line 1599
    .local v14, info:Landroid/appwidget/AppWidgetProviderInfo;
    new-instance v12, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v12, v14, v2, v3}, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;-><init>(Landroid/appwidget/AppWidgetProviderInfo;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1602
    .local v12, createItemInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v2, v14}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v22

    .line 1603
    .local v22, spanXY:[I
    const/4 v2, 0x0

    aget v2, v22, v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanX:I

    .line 1604
    const/4 v2, 0x1

    aget v2, v22, v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->spanY:I

    .line 1605
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v2, v14}, Lcom/cyanogenmod/trebuchet/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v18

    .line 1606
    .local v18, minSpanXY:[I
    const/4 v2, 0x0

    aget v2, v18, v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->minSpanX:I

    .line 1607
    const/4 v2, 0x1

    aget v2, v18, v2

    iput v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->minSpanY:I

    .line 1609
    const/4 v2, -0x1

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v2, v1}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->applyFromAppWidgetProviderInfo(Landroid/appwidget/AppWidgetProviderInfo;I[I)V

    .line 1610
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setTag(Ljava/lang/Object;)V

    .line 1611
    invoke-virtual/range {v23 .. v24}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setShortPressListener(Lcom/cyanogenmod/trebuchet/PagedViewWidget$ShortPressListener;)V

    .line 1622
    .end local v12           #createItemInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    .end local v14           #info:Landroid/appwidget/AppWidgetProviderInfo;
    .end local v18           #minSpanXY:[I
    .end local v22           #spanXY:[I
    :cond_1
    :goto_2
    invoke-virtual/range {v23 .. v24}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1623
    invoke-virtual/range {v23 .. v24}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1624
    invoke-virtual/range {v23 .. v24}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1625
    invoke-virtual/range {v23 .. v24}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1628
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    rem-int v15, v13, v2

    .line 1629
    .local v15, ix:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    div-int v16, v13, v2

    .line 1630
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

    .line 1633
    .local v17, lp:Landroid/widget/GridLayout$LayoutParams;
    move-object/from16 v0, v17

    iput v4, v0, Landroid/widget/GridLayout$LayoutParams;->width:I

    .line 1634
    move-object/from16 v0, v17

    iput v5, v0, Landroid/widget/GridLayout$LayoutParams;->height:I

    .line 1635
    const/16 v2, 0x33

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/widget/GridLayout$LayoutParams;->setGravity(I)V

    .line 1636
    if-lez v15, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetWidthGap:I

    move-object/from16 v0, v17

    iput v2, v0, Landroid/widget/GridLayout$LayoutParams;->leftMargin:I

    .line 1637
    :cond_2
    if-lez v16, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetHeightGap:I

    move-object/from16 v0, v17

    iput v2, v0, Landroid/widget/GridLayout$LayoutParams;->topMargin:I

    .line 1638
    :cond_3
    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v6, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1591
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 1612
    .end local v15           #ix:I
    .end local v16           #iy:I
    .end local v17           #lp:Landroid/widget/GridLayout$LayoutParams;
    :cond_4
    move-object/from16 v0, v21

    instance-of v2, v0, Landroid/content/pm/ResolveInfo;

    if-eqz v2, :cond_1

    move-object/from16 v14, v21

    .line 1614
    check-cast v14, Landroid/content/pm/ResolveInfo;

    .line 1615
    .local v14, info:Landroid/content/pm/ResolveInfo;
    new-instance v12, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;

    iget-object v2, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-direct {v12, v2}, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;-><init>(Landroid/content/pm/ActivityInfo;)V

    .line 1616
    .restart local v12       #createItemInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    const/4 v2, 0x1

    iput v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->itemType:I

    .line 1617
    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v7, v14, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, v12, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    .line 1619
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mPackageManager:Landroid/content/pm/PackageManager;

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v14}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->applyFromResolveInfo(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;)V

    .line 1620
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 1644
    .end local v12           #createItemInfo:Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
    .end local v14           #info:Landroid/content/pm/ResolveInfo;
    .end local v21           #rawInfo:Ljava/lang/Object;
    .end local v23           #widget:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    :cond_5
    new-instance v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;

    move-object/from16 v3, p0

    move/from16 v7, p2

    move/from16 v8, p1

    invoke-direct/range {v2 .. v9}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;-><init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;IILcom/cyanogenmod/trebuchet/PagedViewGridLayout;ZILjava/util/ArrayList;)V

    invoke-virtual {v6, v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->setOnLayoutListener(Ljava/lang/Runnable;)V

    .line 1670
    return-void
.end method

.method public syncWidgetPages()V
    .locals 8

    .prologue
    const/4 v7, -0x1

    .line 1558
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1559
    .local v0, context:Landroid/content/Context;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    mul-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v3, v4

    .line 1561
    .local v3, numPages:I
    const/4 v1, 0x0

    .local v1, j:I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 1562
    new-instance v2, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountX:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCountY:I

    invoke-direct {v2, v0, v4, v5}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;-><init>(Landroid/content/Context;II)V

    .line 1564
    .local v2, layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setupPage(Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;)V

    .line 1565
    new-instance v4, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout$LayoutParams;

    invoke-direct {v4, v7, v7}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2, v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1561
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1568
    .end local v2           #layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    :cond_0
    return-void
.end method

.method public updateApps(Ljava/util/ArrayList;)V
    .locals 0
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
    .line 2424
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2425
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addAppsWithoutInvalidate(Ljava/util/ArrayList;)V

    .line 2426
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->filterAppsWithoutInvalidate()V

    .line 2427
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updatePageCounts()V

    .line 2428
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->invalidateOnDataChange()V

    .line 2429
    return-void
.end method
