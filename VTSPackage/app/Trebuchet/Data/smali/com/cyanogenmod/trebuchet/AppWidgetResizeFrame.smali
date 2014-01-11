.class public Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;
.super Landroid/widget/FrameLayout;
.source "AppWidgetResizeFrame.java"


# static fields
.field private static mTmpRect:Landroid/graphics/Rect;


# instance fields
.field final BACKGROUND_PADDING:I

.field final DIMMED_HANDLE_ALPHA:F

.field final RESIZE_THRESHOLD:F

.field final SNAP_DURATION:I

.field private mBackgroundPadding:I

.field private mBaselineHeight:I

.field private mBaselineWidth:I

.field private mBaselineX:I

.field private mBaselineY:I

.field private mBottomBorderActive:Z

.field private mBottomHandle:Landroid/widget/ImageView;

.field private mBottomTouchRegionAdjustment:I

.field private mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

.field private mDeltaX:I

.field private mDeltaXAddOn:I

.field private mDeltaY:I

.field private mDeltaYAddOn:I

.field mDirectionVector:[I

.field private mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

.field mLastDirectionVector:[I

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mLeftBorderActive:Z

.field private mLeftHandle:Landroid/widget/ImageView;

.field private mMinHSpan:I

.field private mMinVSpan:I

.field private mResizeMode:I

.field private mRightBorderActive:Z

.field private mRightHandle:Landroid/widget/ImageView;

.field private mRunningHInc:I

.field private mRunningVInc:I

.field private mTopBorderActive:Z

.field private mTopHandle:Landroid/widget/ImageView;

.field private mTopTouchRegionAdjustment:I

.field private mTouchTargetWidth:I

.field private mWidgetPaddingBottom:I

.field private mWidgetPaddingLeft:I

.field private mWidgetPaddingRight:I

.field private mWidgetPaddingTop:I

.field private mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

.field private mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragLayer;)V
    .locals 10
    .parameter "context"
    .parameter "widgetView"
    .parameter "cellLayout"
    .parameter "dragLayer"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v6, 0x0

    const/4 v7, -0x2

    .line 72
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 54
    iput v6, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopTouchRegionAdjustment:I

    .line 55
    iput v6, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomTouchRegionAdjustment:I

    .line 57
    new-array v5, v9, [I

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    .line 58
    new-array v5, v9, [I

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLastDirectionVector:[I

    .line 60
    const/16 v5, 0x96

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->SNAP_DURATION:I

    .line 61
    const/16 v5, 0x18

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->BACKGROUND_PADDING:I

    .line 62
    const/4 v5, 0x0

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->DIMMED_HANDLE_ALPHA:F

    .line 63
    const v5, 0x3f28f5c3

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->RESIZE_THRESHOLD:F

    move-object v5, p1

    .line 73
    check-cast v5, Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 74
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 75
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    .line 76
    invoke-virtual {p2}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v5

    iget v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    .line 77
    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 78
    const v5, 0x7f07002c

    invoke-virtual {p4, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 80
    invoke-virtual {p2}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v1

    .line 81
    .local v1, info:Landroid/appwidget/AppWidgetProviderInfo;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v5, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v4

    .line 82
    .local v4, result:[I
    aget v5, v4, v6

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinHSpan:I

    .line 83
    aget v5, v4, v8

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinVSpan:I

    .line 85
    const v5, 0x7f020060

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->setBackgroundResource(I)V

    .line 86
    invoke-virtual {p0, v6, v6, v6, v6}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->setPadding(IIII)V

    .line 89
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    .line 90
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    const v6, 0x7f020062

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 91
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x13

    invoke-direct {v2, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 93
    .local v2, lp:Landroid/widget/FrameLayout$LayoutParams;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    invoke-virtual {p0, v5, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    .line 96
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    const v6, 0x7f020063

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 97
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .end local v2           #lp:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 0x15

    invoke-direct {v2, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 99
    .restart local v2       #lp:Landroid/widget/FrameLayout$LayoutParams;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    invoke-virtual {p0, v5, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    .line 102
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    const v6, 0x7f020064

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 103
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .end local v2           #lp:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 0x31

    invoke-direct {v2, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 105
    .restart local v2       #lp:Landroid/widget/FrameLayout$LayoutParams;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    invoke-virtual {p0, v5, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    .line 108
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    const v6, 0x7f020061

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 109
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .end local v2           #lp:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v5, 0x51

    invoke-direct {v2, v7, v7, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 111
    .restart local v2       #lp:Landroid/widget/FrameLayout$LayoutParams;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    invoke-virtual {p0, v5, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    invoke-virtual {p2}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v5

    iget-object v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    const/4 v6, 0x0

    invoke-static {p1, v5, v6}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v3

    .line 115
    .local v3, p:Landroid/graphics/Rect;
    iget v5, v3, Landroid/graphics/Rect;->left:I

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingLeft:I

    .line 116
    iget v5, v3, Landroid/graphics/Rect;->top:I

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingTop:I

    .line 117
    iget v5, v3, Landroid/graphics/Rect;->right:I

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingRight:I

    .line 118
    iget v5, v3, Landroid/graphics/Rect;->bottom:I

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingBottom:I

    .line 121
    const/4 v5, 0x3

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    .line 122
    iput v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinHSpan:I

    .line 123
    iput v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinVSpan:I

    .line 125
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v0, v5, Landroid/util/DisplayMetrics;->density:F

    .line 126
    .local v0, density:F
    const/high16 v5, 0x41c0

    mul-float/2addr v5, v0

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v5, v5

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    .line 127
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    mul-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    .line 132
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 133
    return-void
.end method

.method static getWidgetSizeRanges(Lcom/cyanogenmod/trebuchet/Launcher;IILandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 14
    .parameter "launcher"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "rect"

    .prologue
    .line 338
    if-nez p3, :cond_0

    .line 339
    new-instance p3, Landroid/graphics/Rect;

    .end local p3
    invoke-direct/range {p3 .. p3}, Landroid/graphics/Rect;-><init>()V

    .line 341
    .restart local p3
    :cond_0
    const/4 v12, 0x0

    invoke-static {p0, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->getCellLayoutMetrics(Lcom/cyanogenmod/trebuchet/Launcher;I)Landroid/graphics/Rect;

    move-result-object v6

    .line 342
    .local v6, landMetrics:Landroid/graphics/Rect;
    const/4 v12, 0x1

    invoke-static {p0, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->getCellLayoutMetrics(Lcom/cyanogenmod/trebuchet/Launcher;I)Landroid/graphics/Rect;

    move-result-object v9

    .line 343
    .local v9, portMetrics:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v3, v12, Landroid/util/DisplayMetrics;->density:F

    .line 346
    .local v3, density:F
    iget v2, v6, Landroid/graphics/Rect;->left:I

    .line 347
    .local v2, cellWidth:I
    iget v1, v6, Landroid/graphics/Rect;->top:I

    .line 348
    .local v1, cellHeight:I
    iget v11, v6, Landroid/graphics/Rect;->right:I

    .line 349
    .local v11, widthGap:I
    iget v4, v6, Landroid/graphics/Rect;->bottom:I

    .line 350
    .local v4, heightGap:I
    mul-int v12, p1, v2

    add-int/lit8 v13, p1, -0x1

    mul-int/2addr v13, v11

    add-int/2addr v12, v13

    int-to-float v12, v12

    div-float/2addr v12, v3

    float-to-int v7, v12

    .line 351
    .local v7, landWidth:I
    mul-int v12, p2, v1

    add-int/lit8 v13, p2, -0x1

    mul-int/2addr v13, v4

    add-int/2addr v12, v13

    int-to-float v12, v12

    div-float/2addr v12, v3

    float-to-int v5, v12

    .line 354
    .local v5, landHeight:I
    iget v2, v9, Landroid/graphics/Rect;->left:I

    .line 355
    iget v1, v9, Landroid/graphics/Rect;->top:I

    .line 356
    iget v11, v9, Landroid/graphics/Rect;->right:I

    .line 357
    iget v4, v9, Landroid/graphics/Rect;->bottom:I

    .line 358
    mul-int v12, p1, v2

    add-int/lit8 v13, p1, -0x1

    mul-int/2addr v13, v11

    add-int/2addr v12, v13

    int-to-float v12, v12

    div-float/2addr v12, v3

    float-to-int v10, v12

    .line 359
    .local v10, portWidth:I
    mul-int v12, p2, v1

    add-int/lit8 v13, p2, -0x1

    mul-int/2addr v13, v4

    add-int/2addr v12, v13

    int-to-float v12, v12

    div-float/2addr v12, v3

    float-to-int v8, v12

    .line 360
    .local v8, portHeight:I
    move-object/from16 v0, p3

    invoke-virtual {v0, v10, v5, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 361
    return-object p3
.end method

.method private resizeWidgetIfNeeded(Z)V
    .locals 24
    .parameter "onDismiss"

    .prologue
    .line 217
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCellWidth()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidthGap()I

    move-result v6

    add-int v22, v1, v6

    .line 218
    .local v22, xThreshold:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCellHeight()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeightGap()I

    move-result v6

    add-int v23, v1, v6

    .line 220
    .local v23, yThreshold:I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaXAddOn:I

    add-int v13, v1, v6

    .line 221
    .local v13, deltaX:I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaYAddOn:I

    add-int v14, v1, v6

    .line 223
    .local v14, deltaY:I
    const/high16 v1, 0x3f80

    int-to-float v6, v13

    mul-float/2addr v1, v6

    move/from16 v0, v22

    int-to-float v6, v0

    div-float/2addr v1, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningHInc:I

    int-to-float v6, v6

    sub-float v17, v1, v6

    .line 224
    .local v17, hSpanIncF:F
    const/high16 v1, 0x3f80

    int-to-float v6, v14

    mul-float/2addr v1, v6

    move/from16 v0, v23

    int-to-float v6, v0

    div-float/2addr v1, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningVInc:I

    int-to-float v6, v6

    sub-float v21, v1, v6

    .line 226
    .local v21, vSpanIncF:F
    const/16 v16, 0x0

    .line 227
    .local v16, hSpanInc:I
    const/16 v20, 0x0

    .line 228
    .local v20, vSpanInc:I
    const/4 v9, 0x0

    .line 229
    .local v9, cellXInc:I
    const/4 v10, 0x0

    .line 231
    .local v10, cellYInc:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v11

    .line 232
    .local v11, countX:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v12

    .line 234
    .local v12, countY:I
    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v6, 0x3f28f5c3

    cmpl-float v1, v1, v6

    if-lez v1, :cond_0

    .line 235
    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v16

    .line 237
    :cond_0
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v6, 0x3f28f5c3

    cmpl-float v1, v1, v6

    if-lez v1, :cond_1

    .line 238
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->round(F)I

    move-result v20

    .line 241
    :cond_1
    if-nez p1, :cond_3

    if-nez v16, :cond_3

    if-nez v20, :cond_3

    .line 327
    :cond_2
    :goto_0
    return-void

    .line 244
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 246
    .local v18, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, v18

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 247
    .local v4, spanX:I
    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    .line 248
    .local v5, spanY:I
    move-object/from16 v0, v18

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v1, :cond_c

    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    .line 249
    .local v2, cellX:I
    :goto_1
    move-object/from16 v0, v18

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->useTmpCoords:Z

    if-eqz v1, :cond_d

    move-object/from16 v0, v18

    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    .line 251
    .local v3, cellY:I
    :goto_2
    const/4 v15, 0x0

    .line 252
    .local v15, hSpanDelta:I
    const/16 v19, 0x0

    .line 256
    .local v19, vSpanDelta:I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-eqz v1, :cond_e

    .line 257
    neg-int v1, v2

    move/from16 v0, v16

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 258
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinHSpan:I

    sub-int/2addr v1, v6

    invoke-static {v1, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 259
    mul-int/lit8 v16, v16, -0x1

    .line 260
    move/from16 v0, v16

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 261
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinHSpan:I

    sub-int/2addr v1, v6

    neg-int v1, v1

    move/from16 v0, v16

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 262
    move/from16 v0, v16

    neg-int v15, v0

    .line 270
    :cond_4
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-eqz v1, :cond_f

    .line 271
    neg-int v1, v3

    move/from16 v0, v20

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 272
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinVSpan:I

    sub-int/2addr v1, v6

    invoke-static {v1, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 273
    mul-int/lit8 v20, v20, -0x1

    .line 274
    move/from16 v0, v20

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v20

    .line 275
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinVSpan:I

    sub-int/2addr v1, v6

    neg-int v1, v1

    move/from16 v0, v20

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 276
    move/from16 v0, v20

    neg-int v0, v0

    move/from16 v19, v0

    .line 283
    :cond_5
    :goto_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput v7, v1, v6

    .line 284
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v6, 0x1

    const/4 v7, 0x0

    aput v7, v1, v6

    .line 286
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-nez v1, :cond_6

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-eqz v1, :cond_7

    .line 287
    :cond_6
    add-int v4, v4, v16

    .line 288
    add-int/2addr v2, v9

    .line 289
    if-eqz v15, :cond_7

    .line 290
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-eqz v1, :cond_10

    const/4 v1, -0x1

    :goto_5
    aput v1, v6, v7

    .line 294
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-nez v1, :cond_8

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v1, :cond_9

    .line 295
    :cond_8
    add-int v5, v5, v20

    .line 296
    add-int/2addr v3, v10

    .line 297
    if-eqz v19, :cond_9

    .line 298
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v7, 0x1

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-eqz v1, :cond_11

    const/4 v1, -0x1

    :goto_6
    aput v1, v6, v7

    .line 302
    :cond_9
    if-nez p1, :cond_a

    if-nez v19, :cond_a

    if-eqz v15, :cond_2

    .line 306
    :cond_a
    if-eqz p1, :cond_12

    .line 307
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLastDirectionVector:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v1, v6

    .line 308
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLastDirectionVector:[I

    const/4 v8, 0x1

    aget v7, v7, v8

    aput v7, v1, v6

    .line 314
    :goto_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    move/from16 v8, p1

    invoke-virtual/range {v1 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->createAreaForResize(IIIILandroid/view/View;[IZ)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 316
    move-object/from16 v0, v18

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    .line 317
    move-object/from16 v0, v18

    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    .line 318
    move-object/from16 v0, v18

    iput v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 319
    move-object/from16 v0, v18

    iput v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    .line 320
    move-object/from16 v0, p0

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningVInc:I

    add-int v1, v1, v19

    move-object/from16 v0, p0

    iput v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningVInc:I

    .line 321
    move-object/from16 v0, p0

    iget v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningHInc:I

    add-int/2addr v1, v15

    move-object/from16 v0, p0

    iput v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningHInc:I

    .line 322
    if-nez p1, :cond_b

    .line 323
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v1, v6, v4, v5}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/cyanogenmod/trebuchet/Launcher;II)V

    .line 326
    :cond_b
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->requestLayout()V

    goto/16 :goto_0

    .line 248
    .end local v2           #cellX:I
    .end local v3           #cellY:I
    .end local v15           #hSpanDelta:I
    .end local v19           #vSpanDelta:I
    :cond_c
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    goto/16 :goto_1

    .line 249
    .restart local v2       #cellX:I
    :cond_d
    move-object/from16 v0, v18

    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    goto/16 :goto_2

    .line 264
    .restart local v3       #cellY:I
    .restart local v15       #hSpanDelta:I
    .restart local v19       #vSpanDelta:I
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-eqz v1, :cond_4

    .line 265
    add-int v1, v2, v4

    sub-int v1, v11, v1

    move/from16 v0, v16

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 266
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinHSpan:I

    sub-int/2addr v1, v6

    neg-int v1, v1

    move/from16 v0, v16

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 267
    move/from16 v15, v16

    goto/16 :goto_3

    .line 277
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v1, :cond_5

    .line 278
    add-int v1, v3, v5

    sub-int v1, v12, v1

    move/from16 v0, v20

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v20

    .line 279
    move-object/from16 v0, v18

    iget v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mMinVSpan:I

    sub-int/2addr v1, v6

    neg-int v1, v1

    move/from16 v0, v20

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 280
    move/from16 v19, v20

    goto/16 :goto_4

    .line 290
    :cond_10
    const/4 v1, 0x1

    goto/16 :goto_5

    .line 298
    :cond_11
    const/4 v1, 0x1

    goto/16 :goto_6

    .line 310
    :cond_12
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLastDirectionVector:[I

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v1, v6

    .line 311
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLastDirectionVector:[I

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDirectionVector:[I

    const/4 v8, 0x1

    aget v7, v7, v8

    aput v7, v1, v6

    goto/16 :goto_7
.end method

.method static updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/cyanogenmod/trebuchet/Launcher;II)V
    .locals 6
    .parameter "widgetView"
    .parameter "launcher"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 332
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    invoke-static {p1, p2, p3, v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getWidgetSizeRanges(Lcom/cyanogenmod/trebuchet/Launcher;IILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 333
    const/4 v1, 0x0

    sget-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    sget-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v0, Landroid/graphics/Rect;->top:I

    sget-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    iget v4, v0, Landroid/graphics/Rect;->right:I

    sget-object v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTmpRect:Landroid/graphics/Rect;

    iget v5, v0, Landroid/graphics/Rect;->bottom:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/appwidget/AppWidgetHostView;->updateAppWidgetSize(Landroid/os/Bundle;IIII)V

    .line 335
    return-void
.end method

.method private visualizeResizeForDelta(IIZ)V
    .locals 3
    .parameter "deltaX"
    .parameter "deltaY"
    .parameter "onDismiss"

    .prologue
    .line 192
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->updateDeltas(II)V

    .line 193
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 195
    .local v0, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-eqz v1, :cond_2

    .line 196
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 197
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 202
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-eqz v1, :cond_3

    .line 203
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineY:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    .line 204
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 209
    :cond_1
    :goto_1
    invoke-direct {p0, p3}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->resizeWidgetIfNeeded(Z)V

    .line 210
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->requestLayout()V

    .line 211
    return-void

    .line 198
    :cond_2
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-eqz v1, :cond_0

    .line 199
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    goto :goto_0

    .line 205
    :cond_3
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v1, :cond_1

    .line 206
    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    goto :goto_1
.end method


# virtual methods
.method public beginResizeIfPointInRegion(II)Z
    .locals 9
    .parameter "x"
    .parameter "y"

    .prologue
    const/high16 v6, 0x3f80

    const/4 v7, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 136
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_2

    move v1, v3

    .line 137
    .local v1, horizontalActive:Z
    :goto_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_3

    move v2, v3

    .line 139
    .local v2, verticalActive:Z
    :goto_1
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    if-ge p1, v5, :cond_4

    if-eqz v1, :cond_4

    move v5, v3

    :goto_2
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    .line 140
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getWidth()I

    move-result v5

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    sub-int/2addr v5, v8

    if-le p1, v5, :cond_5

    if-eqz v1, :cond_5

    move v5, v3

    :goto_3
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    .line 141
    iget v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopTouchRegionAdjustment:I

    add-int/2addr v5, v8

    if-ge p2, v5, :cond_6

    if-eqz v2, :cond_6

    move v5, v3

    :goto_4
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    .line 142
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getHeight()I

    move-result v5

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    sub-int/2addr v5, v8

    iget v8, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomTouchRegionAdjustment:I

    add-int/2addr v5, v8

    if-le p2, v5, :cond_7

    if-eqz v2, :cond_7

    move v5, v3

    :goto_5
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    .line 145
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-nez v5, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-nez v5, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-nez v5, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v5, :cond_8

    :cond_0
    move v0, v3

    .line 148
    .local v0, anyBordersActive:Z
    :goto_6
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getMeasuredWidth()I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    .line 149
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getMeasuredHeight()I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    .line 150
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getLeft()I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineX:I

    .line 151
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getTop()I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineY:I

    .line 153
    if-eqz v0, :cond_1

    .line 154
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-eqz v3, :cond_9

    move v3, v6

    :goto_7
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 155
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-eqz v3, :cond_a

    move v3, v6

    :goto_8
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 156
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-eqz v3, :cond_b

    move v3, v6

    :goto_9
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 157
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v4, :cond_c

    :goto_a
    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 159
    :cond_1
    return v0

    .end local v0           #anyBordersActive:Z
    .end local v1           #horizontalActive:Z
    .end local v2           #verticalActive:Z
    :cond_2
    move v1, v4

    .line 136
    goto/16 :goto_0

    .restart local v1       #horizontalActive:Z
    :cond_3
    move v2, v4

    .line 137
    goto/16 :goto_1

    .restart local v2       #verticalActive:Z
    :cond_4
    move v5, v4

    .line 139
    goto/16 :goto_2

    :cond_5
    move v5, v4

    .line 140
    goto :goto_3

    :cond_6
    move v5, v4

    .line 141
    goto :goto_4

    :cond_7
    move v5, v4

    .line 142
    goto :goto_5

    :cond_8
    move v0, v4

    .line 145
    goto :goto_6

    .restart local v0       #anyBordersActive:Z
    :cond_9
    move v3, v7

    .line 154
    goto :goto_7

    :cond_a
    move v3, v7

    .line 155
    goto :goto_8

    :cond_b
    move v3, v7

    .line 156
    goto :goto_9

    :cond_c
    move v6, v7

    .line 157
    goto :goto_a
.end method

.method public commitResize()V
    .locals 1

    .prologue
    .line 369
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->resizeWidgetIfNeeded(Z)V

    .line 370
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->requestLayout()V

    .line 371
    return-void
.end method

.method public onTouchUp()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 374
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCellWidth()I

    move-result v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidthGap()I

    move-result v3

    add-int v0, v2, v3

    .line 375
    .local v0, xThreshold:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCellHeight()I

    move-result v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeightGap()I

    move-result v3

    add-int v1, v2, v3

    .line 377
    .local v1, yThreshold:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningHInc:I

    mul-int/2addr v2, v0

    iput v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaXAddOn:I

    .line 378
    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRunningVInc:I

    mul-int/2addr v2, v1

    iput v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaYAddOn:I

    .line 379
    iput v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    .line 380
    iput v4, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    .line 382
    new-instance v2, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$1;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$1;-><init>(Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;)V

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->post(Ljava/lang/Runnable;)Z

    .line 388
    return-void
.end method

.method public snapToWidget(Z)V
    .locals 24
    .parameter "animate"

    .prologue
    .line 391
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 392
    .local v5, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/CellLayout;->getLeft()I

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->getPaddingLeft()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollX()I

    move-result v20

    sub-int v16, v19, v20

    .line 394
    .local v16, xOffset:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTop()I

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mCellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->getPaddingTop()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/Workspace;->getScrollY()I

    move-result v20

    sub-int v18, v19, v20

    .line 397
    .local v18, yOffset:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getWidth()I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    move/from16 v20, v0

    mul-int/lit8 v20, v20, 0x2

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingLeft:I

    move/from16 v20, v0

    sub-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingRight:I

    move/from16 v20, v0

    sub-int v7, v19, v20

    .line 399
    .local v7, newWidth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getHeight()I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    move/from16 v20, v0

    mul-int/lit8 v20, v20, 0x2

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingTop:I

    move/from16 v20, v0

    sub-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingBottom:I

    move/from16 v20, v0

    sub-int v6, v19, v20

    .line 402
    .local v6, newHeight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getLeft()I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    move/from16 v20, v0

    sub-int v19, v19, v20

    add-int v19, v19, v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingLeft:I

    move/from16 v20, v0

    add-int v8, v19, v20

    .line 403
    .local v8, newX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->getTop()I

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBackgroundPadding:I

    move/from16 v20, v0

    sub-int v19, v19, v20

    add-int v19, v19, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mWidgetPaddingTop:I

    move/from16 v20, v0

    add-int v9, v19, v20

    .line 408
    .local v9, newY:I
    if-gez v9, :cond_0

    .line 410
    neg-int v0, v9

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopTouchRegionAdjustment:I

    .line 414
    :goto_0
    add-int v19, v9, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->getHeight()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_1

    .line 416
    add-int v19, v9, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/DragLayer;->getHeight()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomTouchRegionAdjustment:I

    .line 421
    :goto_1
    if-nez p1, :cond_2

    .line 422
    iput v7, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 423
    iput v6, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 424
    iput v8, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 425
    iput v9, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    .line 426
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/high16 v20, 0x3f80

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/high16 v20, 0x3f80

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/high16 v20, 0x3f80

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/high16 v20, 0x3f80

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 430
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->requestLayout()V

    .line 459
    :goto_2
    return-void

    .line 412
    :cond_0
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopTouchRegionAdjustment:I

    goto :goto_0

    .line 418
    :cond_1
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomTouchRegionAdjustment:I

    goto :goto_1

    .line 432
    :cond_2
    const-string v19, "width"

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget v0, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    move/from16 v22, v0

    aput v22, v20, v21

    const/16 v21, 0x1

    aput v7, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v14

    .line 433
    .local v14, width:Landroid/animation/PropertyValuesHolder;
    const-string v19, "height"

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget v0, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    move/from16 v22, v0

    aput v22, v20, v21

    const/16 v21, 0x1

    aput v6, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 435
    .local v3, height:Landroid/animation/PropertyValuesHolder;
    const-string v19, "x"

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget v0, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    move/from16 v22, v0

    aput v22, v20, v21

    const/16 v21, 0x1

    aput v8, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v15

    .line 436
    .local v15, x:Landroid/animation/PropertyValuesHolder;
    const-string v19, "y"

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget v0, v5, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    move/from16 v22, v0

    aput v22, v20, v21

    const/16 v21, 0x1

    aput v9, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v17

    .line 437
    .local v17, y:Landroid/animation/PropertyValuesHolder;
    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v14, v19, v20

    const/16 v20, 0x1

    aput-object v3, v19, v20

    const/16 v20, 0x2

    aput-object v15, v19, v20

    const/16 v20, 0x3

    aput-object v17, v19, v20

    move-object/from16 v0, v19

    invoke-static {v5, v0}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 438
    .local v10, oa:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const-string v20, "alpha"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/high16 v23, 0x3f80

    aput v23, v21, v22

    invoke-static/range {v19 .. v21}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 439
    .local v4, leftOa:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const-string v20, "alpha"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/high16 v23, 0x3f80

    aput v23, v21, v22

    invoke-static/range {v19 .. v21}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    .line 440
    .local v11, rightOa:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const-string v20, "alpha"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/high16 v23, 0x3f80

    aput v23, v21, v22

    invoke-static/range {v19 .. v21}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    .line 441
    .local v13, topOa:Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomHandle:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const-string v20, "alpha"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/high16 v23, 0x3f80

    aput v23, v21, v22

    invoke-static/range {v19 .. v21}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 442
    .local v2, bottomOa:Landroid/animation/ObjectAnimator;
    new-instance v19, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$2;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$2;-><init>(Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;)V

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 447
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v12

    .line 448
    .local v12, set:Landroid/animation/AnimatorSet;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_3

    .line 449
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v10, v19, v20

    const/16 v20, 0x1

    aput-object v13, v19, v20

    const/16 v20, 0x2

    aput-object v2, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 456
    :goto_3
    const-wide/16 v19, 0x96

    move-wide/from16 v0, v19

    invoke-virtual {v12, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 457
    invoke-virtual {v12}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_2

    .line 450
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mResizeMode:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 451
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v10, v19, v20

    const/16 v20, 0x1

    aput-object v4, v19, v20

    const/16 v20, 0x2

    aput-object v11, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_3

    .line 453
    :cond_4
    const/16 v19, 0x5

    move/from16 v0, v19

    new-array v0, v0, [Landroid/animation/Animator;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v10, v19, v20

    const/16 v20, 0x1

    aput-object v4, v19, v20

    const/16 v20, 0x2

    aput-object v11, v19, v20

    const/16 v20, 0x3

    aput-object v13, v19, v20

    const/16 v20, 0x4

    aput-object v2, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_3
.end method

.method public updateDeltas(II)V
    .locals 3
    .parameter "deltaX"
    .parameter "deltaY"

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mLeftBorderActive:Z

    if-eqz v0, :cond_2

    .line 168
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineX:I

    neg-int v0, v0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    .line 169
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    .line 175
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTopBorderActive:Z

    if-eqz v0, :cond_3

    .line 176
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineY:I

    neg-int v0, v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    .line 177
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    .line 182
    :cond_1
    :goto_1
    return-void

    .line 170
    :cond_2
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mRightBorderActive:Z

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    .line 172
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineWidth:I

    neg-int v0, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaX:I

    goto :goto_0

    .line 178
    :cond_3
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBottomBorderActive:Z

    if-eqz v0, :cond_1

    .line 179
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineY:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    .line 180
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mBaselineHeight:I

    neg-int v0, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mTouchTargetWidth:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->mDeltaY:I

    goto :goto_1
.end method

.method public visualizeResizeForDelta(II)V
    .locals 1
    .parameter "deltaX"
    .parameter "deltaY"

    .prologue
    .line 185
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->visualizeResizeForDelta(IIZ)V

    .line 186
    return-void
.end method
