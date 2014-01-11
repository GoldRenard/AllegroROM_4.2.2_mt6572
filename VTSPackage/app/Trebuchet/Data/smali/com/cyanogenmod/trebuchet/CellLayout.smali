.class public Lcom/cyanogenmod/trebuchet/CellLayout;
.super Landroid/view/ViewGroup;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;,
        Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;,
        Lcom/cyanogenmod/trebuchet/CellLayout$CellLayoutAnimationController;,
        Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;,
        Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;,
        Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;,
        Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;
    }
.end annotation


# static fields
.field private static final DEBUG_VISUALIZE_OCCUPIED:Z = false

.field private static final DESTRUCTIVE_REORDER:Z = false

.field private static final INVALID_DIRECTION:I = -0x64

.field static final LANDSCAPE:I = 0x0

.field public static final MODE_ACCEPT_DROP:I = 0x3

.field public static final MODE_DRAG_OVER:I = 0x0

.field public static final MODE_ON_DROP:I = 0x1

.field public static final MODE_ON_DROP_EXTERNAL:I = 0x2

.field static final PORTRAIT:I = 0x1

.field private static final REORDER_ANIMATION_DURATION:I = 0x96

.field private static final REORDER_HINT_MAGNITUDE:F = 0.12f

.field private static final TAG:Ljava/lang/String; = "Trebuchet.CellLayout"

.field private static final sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

.field private static final sPaint:Landroid/graphics/Paint;


# instance fields
.field private mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

.field private mBackgroundAlpha:F

.field private mBackgroundAlphaMultiplier:F

.field private mBackgroundRect:Landroid/graphics/Rect;

.field private mCellHeight:I

.field private final mCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

.field private mCellWidth:I

.field private mChildrenScale:F

.field private mCountX:I

.field private mCountY:I

.field private mDirectionVector:[I

.field private final mDragCell:[I

.field private final mDragCenter:Landroid/graphics/Point;

.field private mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

.field private mDragOutlineAlphas:[F

.field private mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

.field private mDragOutlineCurrent:I

.field private final mDragOutlinePaint:Landroid/graphics/Paint;

.field private mDragOutlines:[Landroid/graphics/Rect;

.field private mDragging:Z

.field private mEaseOutInterpolator:Landroid/animation/TimeInterpolator;

.field private mFolderLeaveBehindCell:[I

.field private mFolderOuterRings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private mForegroundAlpha:I

.field private mForegroundPadding:I

.field private mForegroundRect:Landroid/graphics/Rect;

.field private mHeightGap:I

.field private mInterceptTouchListener:Landroid/view/View$OnTouchListener;

.field private mIntersectingViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mIsDragOverlapping:Z

.field private mItemPlacementDirty:Z

.field private mLastDownOnOccupiedCell:Z

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mMaxGap:I

.field private mNormalBackground:Landroid/graphics/drawable/Drawable;

.field mOccupied:[[Z

.field private mOccupiedRect:Landroid/graphics/Rect;

.field private mOriginalCellHeight:I

.field private mOriginalCellWidth:I

.field private mOriginalHeightGap:I

.field private mOriginalWidthGap:I

.field private mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mOverScrollLeft:Landroid/graphics/drawable/Drawable;

.field private mOverScrollRight:Landroid/graphics/drawable/Drawable;

.field private mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

.field mPreviousReorderDirection:[I

.field private final mRect:Landroid/graphics/Rect;

.field private mReorderAnimators:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mReorderHintAnimationMagnitude:F

.field private mScrollingTransformsDirty:Z

.field private mShakeAnimators:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

.field mTempLocation:[I

.field private final mTempRectStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field mTmpOccupied:[[Z

.field private final mTmpPoint:[I

.field private final mTmpXY:[I

.field private mWidthGap:I

.field temp:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 166
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/CellLayout;->sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

    .line 168
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/CellLayout;->sPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 171
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 172
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 175
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 176
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 17
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 179
    invoke-direct/range {p0 .. p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mScrollingTransformsDirty:Z

    .line 80
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mRect:Landroid/graphics/Rect;

    .line 81
    new-instance v11, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    invoke-direct {v11}, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 85
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpXY:[I

    .line 86
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    .line 87
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    .line 91
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mLastDownOnOccupiedCell:Z

    .line 95
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    .line 96
    const/4 v11, 0x2

    new-array v11, v11, [I

    fill-array-data v11, :array_0

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    .line 98
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundAlpha:I

    .line 100
    const/high16 v11, 0x3f80

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlphaMultiplier:F

    .line 112
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIsDragOverlapping:Z

    .line 113
    new-instance v11, Landroid/graphics/Point;

    invoke-direct {v11}, Landroid/graphics/Point;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCenter:Landroid/graphics/Point;

    .line 117
    const/4 v11, 0x4

    new-array v11, v11, [Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    .line 118
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    new-array v11, v11, [F

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAlphas:[F

    .line 119
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    new-array v11, v11, [Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    .line 123
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    .line 124
    new-instance v11, Landroid/graphics/Paint;

    invoke-direct {v11}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlinePaint:Landroid/graphics/Paint;

    .line 128
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    .line 130
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    .line 133
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mItemPlacementDirty:Z

    .line 136
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    .line 138
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragging:Z

    .line 143
    const/high16 v11, 0x3f80

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mChildrenScale:F

    .line 159
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    .line 160
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    .line 161
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    .line 162
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    .line 431
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->temp:Landroid/graphics/Rect;

    .line 1350
    new-instance v11, Ljava/util/Stack;

    invoke-direct {v11}, Ljava/util/Stack;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    .line 180
    new-instance v11, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    .line 184
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setWillNotDraw(Z)V

    move-object/from16 v11, p1

    .line 185
    check-cast v11, Lcom/cyanogenmod/trebuchet/Launcher;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 187
    sget-object v11, Lcom/cyanogenmod/trebuchet/R$styleable;->CellLayout:[I

    const/4 v12, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v1, v11, v2, v12}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 189
    .local v3, a:Landroid/content/res/TypedArray;
    const/4 v11, 0x0

    const/16 v12, 0xa

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalCellWidth:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    .line 190
    const/4 v11, 0x1

    const/16 v12, 0xa

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalCellHeight:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    .line 191
    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalWidthGap:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 192
    const/4 v11, 0x3

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalHeightGap:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    .line 193
    const/4 v11, 0x4

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mMaxGap:I

    .line 194
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 195
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 196
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Z

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    .line 197
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Z

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    .line 198
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v12, 0x0

    const/16 v13, -0x64

    aput v13, v11, v12

    .line 199
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v12, 0x1

    const/16 v13, -0x64

    aput v13, v11, v12

    .line 201
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 203
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 205
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 206
    .local v8, res:Landroid/content/res/Resources;
    const v11, 0x7f020017

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    .line 207
    const v11, 0x7f020018

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    .line 209
    const v11, 0x7f02002b

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    .line 210
    const v11, 0x7f02002c

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    .line 211
    const v11, 0x7f0d0017

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundPadding:I

    .line 214
    const v11, 0x3df5c28f

    const v12, 0x7f0d0022

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    int-to-float v12, v12

    mul-float/2addr v11, v12

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F

    .line 217
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 218
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 222
    new-instance v11, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v12, 0x4020

    invoke-direct {v11, v12}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    .line 225
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v14, 0x1

    const/4 v15, -0x1

    aput v15, v13, v14

    aput v15, v11, v12

    .line 226
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    if-ge v7, v11, :cond_0

    .line 227
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    new-instance v12, Landroid/graphics/Rect;

    const/4 v13, -0x1

    const/4 v14, -0x1

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-direct/range {v12 .. v16}, Landroid/graphics/Rect;-><init>(IIII)V

    aput-object v12, v11, v7

    .line 226
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 234
    :cond_0
    const v11, 0x7f0c000f

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 235
    .local v5, duration:I
    const/4 v6, 0x0

    .line 236
    .local v6, fromAlphaValue:F
    const v11, 0x7f0c0010

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v11

    int-to-float v10, v11

    .line 238
    .local v10, toAlphaValue:F
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAlphas:[F

    const/4 v12, 0x0

    invoke-static {v11, v12}, Ljava/util/Arrays;->fill([FF)V

    .line 240
    const/4 v7, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    array-length v11, v11

    if-ge v7, v11, :cond_1

    .line 241
    new-instance v4, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    int-to-long v11, v5

    const/4 v13, 0x0

    invoke-direct {v4, v11, v12, v13, v10}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;-><init>(JFF)V

    .line 243
    .local v4, anim:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 244
    move v9, v7

    .line 245
    .local v9, thisIndex:I
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    new-instance v12, Lcom/cyanogenmod/trebuchet/CellLayout$1;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4, v9}, Lcom/cyanogenmod/trebuchet/CellLayout$1;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;I)V

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 269
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    new-instance v12, Lcom/cyanogenmod/trebuchet/CellLayout$2;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout$2;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;)V

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 277
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    aput-object v4, v11, v7

    .line 240
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 280
    .end local v4           #anim:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;
    .end local v9           #thisIndex:I
    :cond_1
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    .line 281
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    .line 283
    new-instance v11, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 285
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v11

    if-nez v11, :cond_2

    .line 286
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    const v12, 0x7f0c001f

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v12

    mul-int/2addr v11, v12

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    div-int/2addr v11, v12

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    .line 287
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    const v12, 0x7f0c0020

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v12

    mul-int/2addr v11, v12

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    div-int/2addr v11, v12

    move-object/from16 v0, p0

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    .line 290
    :cond_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 291
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->addView(Landroid/view/View;)V

    .line 292
    return-void

    .line 96
    nop

    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/CellLayout;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAlphas:[F

    return-object v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/CellLayout;)[Landroid/graphics/Rect;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/CellLayout;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    return v0
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/CellLayout;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    return v0
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    return-object v0
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/CellLayout;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F

    return v0
.end method

.method static synthetic access$700(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    return-object v0
.end method

.method private addViewToTempLocation(Landroid/view/View;Landroid/graphics/Rect;[ILcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z
    .locals 11
    .parameter "v"
    .parameter "rectOccupiedByPotentialDrop"
    .parameter "direction"
    .parameter "currentState"

    .prologue
    .line 1577
    iget-object v0, p4, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1578
    .local v9, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    const/4 v10, 0x0

    .line 1579
    .local v10, success:Z
    iget v1, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1580
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v1, 0x1

    invoke-direct {p0, p2, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForRect(Landroid/graphics/Rect;[[ZZ)V

    .line 1582
    iget v1, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v7, 0x0

    check-cast v7, [[Z

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object v0, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I[[Z[[Z[I)[I

    .line 1584
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    if-ltz v0, :cond_0

    .line 1585
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 1586
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iput v0, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .line 1587
    const/4 v10, 0x1

    .line 1589
    :cond_0
    iget v1, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v6, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1590
    return v10
.end method

.method private addViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z
    .locals 26
    .parameter
    .parameter "rectOccupiedByPotentialDrop"
    .parameter "direction"
    .parameter "dragView"
    .parameter "currentState"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1925
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1

    const/16 v23, 0x1

    .line 1977
    :cond_0
    return v23

    .line 1927
    :cond_1
    const/16 v23, 0x0

    .line 1928
    .local v23, success:Z
    const/16 v17, 0x0

    .line 1930
    .local v17, boundingRect:Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/View;

    .line 1931
    .local v25, v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1932
    .local v18, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    if-nez v17, :cond_2

    .line 1933
    new-instance v17, Landroid/graphics/Rect;

    .end local v17           #boundingRect:Landroid/graphics/Rect;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    move-object/from16 v0, v17

    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v17       #boundingRect:Landroid/graphics/Rect;
    goto :goto_0

    .line 1935
    :cond_2
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;->union(IIII)V

    goto :goto_0

    .line 1940
    .end local v18           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_1
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/View;

    .line 1941
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1942
    .restart local v18       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v8, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_1

    .line 1945
    .end local v18           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_4
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->height()I

    move-result v3

    filled-new-array {v2, v3}, [I

    move-result-object v2

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[Z

    .line 1946
    .local v7, blockOccupied:[[Z
    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v24, v0

    .line 1947
    .local v24, top:I
    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v22, v0

    .line 1950
    .local v22, left:I
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_2
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/View;

    .line 1951
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1952
    .restart local v18       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    sub-int v3, v2, v22

    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    sub-int v4, v2, v24

    move-object/from16 v0, v18

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    const/4 v8, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_2

    .line 1955
    .end local v18           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForRect(Landroid/graphics/Rect;[[ZZ)V

    .line 1957
    move-object/from16 v0, v17

    iget v9, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, v17

    iget v10, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->width()I

    move-result v11

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->height()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v16, v0

    move-object/from16 v8, p0

    move-object/from16 v13, p3

    move-object v15, v7

    invoke-direct/range {v8 .. v16}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I[[Z[[Z[I)[I

    .line 1961
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ltz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ltz v2, :cond_7

    .line 1962
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int v19, v2, v3

    .line 1963
    .local v19, deltaX:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/Rect;->top:I

    sub-int v20, v2, v3

    .line 1964
    .local v20, deltaY:I
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_3
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/View;

    .line 1965
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1966
    .restart local v18       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    add-int v2, v2, v19

    move-object/from16 v0, v18

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 1967
    move-object/from16 v0, v18

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    add-int v2, v2, v20

    move-object/from16 v0, v18

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    goto :goto_3

    .line 1969
    .end local v18           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_6
    const/16 v23, 0x1

    .line 1973
    .end local v19           #deltaX:I
    .end local v20           #deltaY:I
    :cond_7
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_4
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/View;

    .line 1974
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1975
    .restart local v18       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v9, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v10, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v12, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v14, 0x1

    move-object/from16 v8, p0

    invoke-direct/range {v8 .. v14}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_4
.end method

.method private animateItemsToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;Z)V
    .locals 15
    .parameter "solution"
    .parameter "dragView"
    .parameter "commitDragView"

    .prologue
    .line 2240
    iget-object v14, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    check-cast v14, [[Z

    .line 2241
    .local v14, occupied:[[Z
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v12, v1, :cond_1

    .line 2242
    const/4 v13, 0x0

    .local v13, j:I
    :goto_1
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-ge v13, v1, :cond_0

    .line 2243
    aget-object v1, v14, v12

    const/4 v3, 0x0

    aput-boolean v3, v1, v13

    .line 2242
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 2241
    :cond_0
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 2247
    .end local v13           #j:I
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v11

    .line 2248
    .local v11, childCount:I
    const/4 v12, 0x0

    :goto_2
    if-ge v12, v11, :cond_4

    .line 2249
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v12}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2250
    .local v2, child:Landroid/view/View;
    move-object/from16 v0, p2

    if-ne v2, v0, :cond_3

    .line 2248
    :cond_2
    :goto_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 2251
    :cond_3
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 2252
    .local v10, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    if-eqz v10, :cond_2

    .line 2253
    iget v3, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v4, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    const/16 v5, 0x96

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    .line 2255
    iget v4, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    const/4 v9, 0x1

    move-object v3, p0

    move-object v8, v14

    invoke-direct/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 2258
    .end local v2           #child:Landroid/view/View;
    .end local v10           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    :cond_4
    if-eqz p3, :cond_5

    .line 2259
    move-object/from16 v0, p1

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewX:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewY:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    move-object/from16 v0, p1

    iget v7, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    const/4 v9, 0x1

    move-object v3, p0

    move-object v8, v14

    invoke-direct/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 2262
    :cond_5
    return-void
.end method

.method private attemptPushInDirection(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z
    .locals 5
    .parameter
    .parameter "occupied"
    .parameter "direction"
    .parameter "ignoreView"
    .parameter "solution"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, intersectingViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1989
    aget v3, p3, v2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    aget v4, p3, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    add-int/2addr v3, v4

    if-le v3, v1, :cond_2

    .line 1992
    aget v0, p3, v1

    .line 1993
    .local v0, temp:I
    aput v2, p3, v1

    .line 1995
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2078
    .end local v0           #temp:I
    :cond_0
    :goto_0
    return v1

    .line 1999
    .restart local v0       #temp:I
    :cond_1
    aput v0, p3, v1

    .line 2000
    aget v0, p3, v2

    .line 2001
    aput v2, p3, v2

    .line 2003
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2008
    aput v0, p3, v2

    .line 2011
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2012
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2013
    aget v0, p3, v1

    .line 2014
    aput v2, p3, v1

    .line 2015
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2020
    aput v0, p3, v1

    .line 2021
    aget v0, p3, v2

    .line 2022
    aput v2, p3, v2

    .line 2023
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2028
    aput v0, p3, v2

    .line 2029
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2030
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    :goto_1
    move v1, v2

    .line 2078
    goto :goto_0

    .line 2035
    .end local v0           #temp:I
    :cond_2
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2040
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2041
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2042
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2047
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2048
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2054
    aget v0, p3, v1

    .line 2055
    .restart local v0       #temp:I
    aget v3, p3, v2

    aput v3, p3, v1

    .line 2056
    aput v0, p3, v2

    .line 2057
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2063
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2064
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2065
    invoke-direct/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2070
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2071
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2074
    aget v0, p3, v1

    .line 2075
    aget v3, p3, v2

    aput v3, p3, v1

    .line 2076
    aput v0, p3, v2

    goto :goto_1
.end method

.method private beginOrAdjustHintAnimations(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;I)V
    .locals 13
    .parameter "solution"
    .parameter "dragView"
    .parameter "delay"

    .prologue
    .line 2266
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v10

    .line 2267
    .local v10, childCount:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v10, :cond_2

    .line 2268
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v11}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2269
    .local v2, child:Landroid/view/View;
    if-ne v2, p2, :cond_1

    .line 2267
    :cond_0
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 2270
    :cond_1
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 2271
    .local v9, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2272
    .local v12, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    if-eqz v9, :cond_0

    .line 2273
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    iget v3, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v4, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v5, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v6, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v7, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v8, v9, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/View;IIIIII)V

    .line 2275
    .local v0, rha:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->animate()V

    goto :goto_1

    .line 2278
    .end local v0           #rha:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    .end local v2           #child:Landroid/view/View;
    .end local v9           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v12           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_2
    return-void
.end method

.method private clearOccupiedCells()V
    .locals 4

    .prologue
    .line 3081
    const/4 v0, 0x0

    .local v0, x:I
    :goto_0
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v0, v2, :cond_1

    .line 3082
    const/4 v1, 0x0

    .local v1, y:I
    :goto_1
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-ge v1, v2, :cond_0

    .line 3083
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    aget-object v2, v2, v0

    const/4 v3, 0x0

    aput-boolean v3, v2, v1

    .line 3082
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3081
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3086
    .end local v1           #y:I
    :cond_1
    return-void
.end method

.method private clearTagCellInfo()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 791
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 792
    .local v0, cellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 793
    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellX:I

    .line 794
    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellY:I

    .line 795
    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    .line 796
    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    .line 797
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTag(Ljava/lang/Object;)V

    .line 798
    return-void
.end method

.method private commitTempPlacement()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 2403
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v2, v5, :cond_0

    .line 2404
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    aget-object v5, v5, v2

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    aget-object v6, v6, v2

    iget v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    invoke-static {v5, v8, v6, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2403
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2406
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v1

    .line 2407
    .local v1, childCount:I
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_4

    .line 2408
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v5, v2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2409
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2410
    .local v4, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 2413
    .local v3, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    if-eqz v3, :cond_3

    .line 2414
    iget v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    if-ne v5, v6, :cond_1

    iget v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v5, v6, :cond_1

    iget v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    if-ne v5, v6, :cond_1

    iget v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    iget v6, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    if-eq v5, v6, :cond_2

    .line 2416
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->requiresDbUpdate:Z

    .line 2418
    :cond_2
    iget v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    iput v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iput v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 2419
    iget v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    iput v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iput v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 2420
    iget v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iput v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 2421
    iget v5, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    iput v5, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 2407
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2424
    .end local v0           #child:Landroid/view/View;
    .end local v3           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v4           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_4
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v5

    invoke-virtual {v5, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->updateItemLocationsInDatabase(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 2425
    return-void
.end method

.method private completeAndClearReorderHintAnimations()V
    .locals 3

    .prologue
    .line 2396
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    .line 2397
    .local v0, a:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    #calls: Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->completeAnimationImmediately()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->access$800(Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;)V

    goto :goto_0

    .line 2399
    .end local v0           #a:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 2400
    return-void
.end method

.method private computeDirectionVector(FF[I)V
    .locals 8
    .parameter "deltaX"
    .parameter "deltaY"
    .parameter "result"

    .prologue
    const/4 v7, 0x1

    const-wide/high16 v5, 0x3fe0

    const/4 v4, 0x0

    .line 2140
    div-float v2, p2, p1

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->atan(D)D

    move-result-wide v0

    .line 2142
    .local v0, angle:D
    aput v4, p3, v4

    .line 2143
    aput v4, p3, v7

    .line 2144
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpl-double v2, v2, v5

    if-lez v2, :cond_0

    .line 2145
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    aput v2, p3, v4

    .line 2147
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpl-double v2, v2, v5

    if-lez v2, :cond_1

    .line 2148
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    aput v2, p3, v7

    .line 2150
    :cond_1
    return-void
.end method

.method private copyCurrentStateToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Z)V
    .locals 10
    .parameter "solution"
    .parameter "temp"

    .prologue
    .line 2198
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v7

    .line 2199
    .local v7, childCount:I
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    if-ge v8, v7, :cond_1

    .line 2200
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 2201
    .local v6, child:Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2203
    .local v9, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    if-eqz p2, :cond_0

    .line 2204
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    iget v2, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    iget v3, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    iget v4, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iget v5, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)V

    .line 2208
    .local v0, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    :goto_1
    invoke-virtual {p1, v6, v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->add(Landroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;)V

    .line 2199
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2206
    .end local v0           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    :cond_0
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    iget v2, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v3, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v4, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iget v5, v9, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;IIII)V

    .restart local v0       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    goto :goto_1

    .line 2210
    .end local v0           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v6           #child:Landroid/view/View;
    .end local v9           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_1
    return-void
.end method

.method private copyOccupiedArray([[Z)V
    .locals 5
    .parameter "occupied"

    .prologue
    const/4 v4, 0x0

    .line 2153
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v0, v1, :cond_0

    .line 2154
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    aget-object v1, v1, v0

    aget-object v2, p1, v0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2153
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2156
    :cond_0
    return-void
.end method

.method private copySolutionToTempState(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;)V
    .locals 13
    .parameter "solution"
    .parameter "dragView"

    .prologue
    const/4 v6, 0x1

    .line 2213
    const/4 v10, 0x0

    .local v10, i:I
    :goto_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v10, v0, :cond_1

    .line 2214
    const/4 v11, 0x0

    .local v11, j:I
    :goto_1
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-ge v11, v0, :cond_0

    .line 2215
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    aget-object v0, v0, v10

    const/4 v1, 0x0

    aput-boolean v1, v0, v11

    .line 2214
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 2213
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 2219
    .end local v11           #j:I
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v9

    .line 2220
    .local v9, childCount:I
    const/4 v10, 0x0

    :goto_2
    if-ge v10, v9, :cond_4

    .line 2221
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 2222
    .local v8, child:Landroid/view/View;
    if-ne v8, p2, :cond_3

    .line 2220
    :cond_2
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 2223
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2224
    .local v12, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 2225
    .local v7, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    if-eqz v7, :cond_2

    .line 2226
    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iput v0, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    .line 2227
    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iput v0, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    .line 2228
    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iput v0, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 2229
    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iput v0, v12, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    .line 2230
    iget v1, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v2, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v3, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v4, v7, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 2233
    .end local v7           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v8           #child:Landroid/view/View;
    .end local v12           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_4
    iget v1, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewX:I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewY:I

    iget v3, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    iget v4, p1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 2235
    return-void
.end method

.method private findNearestArea(IIII[I[[Z[[Z[I)[I
    .locals 20
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "direction"
    .parameter "occupied"
    .parameter "blockOccupied"
    .parameter "result"

    .prologue
    .line 1526
    if-eqz p8, :cond_1

    move-object/from16 v5, p8

    .line 1527
    .local v5, bestXY:[I
    :goto_0
    const v4, 0x7f7fffff

    .line 1528
    .local v4, bestDistance:F
    const/high16 v3, -0x8000

    .line 1530
    .local v3, bestDirectionScore:I
    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 1531
    .local v6, countX:I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 1533
    .local v7, countY:I
    const/16 v16, 0x0

    .local v16, y:I
    :goto_1
    add-int/lit8 v17, p4, -0x1

    sub-int v17, v7, v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_a

    .line 1535
    const/4 v15, 0x0

    .local v15, x:I
    :goto_2
    add-int/lit8 v17, p3, -0x1

    sub-int v17, v6, v17

    move/from16 v0, v17

    if-ge v15, v0, :cond_9

    .line 1537
    const/4 v13, 0x0

    .local v13, i:I
    :goto_3
    move/from16 v0, p3

    if-ge v13, v0, :cond_4

    .line 1538
    const/4 v14, 0x0

    .local v14, j:I
    :goto_4
    move/from16 v0, p4

    if-ge v14, v0, :cond_3

    .line 1539
    add-int v17, v15, v13

    aget-object v17, p6, v17

    add-int v18, v16, v14

    aget-boolean v17, v17, v18

    if-eqz v17, :cond_2

    if-eqz p7, :cond_0

    aget-object v17, p7, v13

    aget-boolean v17, v17, v14

    if-eqz v17, :cond_2

    .line 1535
    .end local v14           #j:I
    :cond_0
    :goto_5
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 1526
    .end local v3           #bestDirectionScore:I
    .end local v4           #bestDistance:F
    .end local v5           #bestXY:[I
    .end local v6           #countX:I
    .end local v7           #countY:I
    .end local v13           #i:I
    .end local v15           #x:I
    .end local v16           #y:I
    :cond_1
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v5, v0, [I

    goto :goto_0

    .line 1538
    .restart local v3       #bestDirectionScore:I
    .restart local v4       #bestDistance:F
    .restart local v5       #bestXY:[I
    .restart local v6       #countX:I
    .restart local v7       #countY:I
    .restart local v13       #i:I
    .restart local v14       #j:I
    .restart local v15       #x:I
    .restart local v16       #y:I
    :cond_2
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 1537
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 1545
    .end local v14           #j:I
    :cond_4
    sub-int v17, v15, p1

    sub-int v18, v15, p1

    mul-int v17, v17, v18

    sub-int v18, v16, p2

    sub-int v19, v16, p2

    mul-int v18, v18, v19

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v17

    move-wide/from16 v0, v17

    double-to-float v11, v0

    .line 1547
    .local v11, distance:F
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    .line 1548
    .local v8, curDirection:[I
    sub-int v17, v15, p1

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    sub-int v18, v16, p2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-direct {v0, v1, v2, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->computeDirectionVector(FF[I)V

    .line 1551
    const/16 v17, 0x0

    aget v17, p5, v17

    const/16 v18, 0x0

    aget v18, v8, v18

    mul-int v17, v17, v18

    const/16 v18, 0x1

    aget v18, p5, v18

    const/16 v19, 0x1

    aget v19, v8, v19

    mul-int v18, v18, v19

    add-int v9, v17, v18

    .line 1553
    .local v9, curDirectionScore:I
    const/4 v12, 0x0

    .line 1554
    .local v12, exactDirectionOnly:Z
    const/16 v17, 0x0

    aget v17, p5, v17

    const/16 v18, 0x0

    aget v18, v8, v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_8

    const/16 v17, 0x0

    aget v17, p5, v17

    const/16 v18, 0x0

    aget v18, v8, v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_8

    const/4 v10, 0x1

    .line 1556
    .local v10, directionMatches:Z
    :goto_6
    if-nez v10, :cond_5

    if-nez v12, :cond_6

    :cond_5
    invoke-static {v11, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-ltz v17, :cond_7

    :cond_6
    invoke-static {v11, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-nez v17, :cond_0

    if-le v9, v3, :cond_0

    .line 1559
    :cond_7
    move v4, v11

    .line 1560
    move v3, v9

    .line 1561
    const/16 v17, 0x0

    aput v15, v5, v17

    .line 1562
    const/16 v17, 0x1

    aput v16, v5, v17

    goto/16 :goto_5

    .line 1554
    .end local v10           #directionMatches:Z
    :cond_8
    const/4 v10, 0x0

    goto :goto_6

    .line 1533
    .end local v8           #curDirection:[I
    .end local v9           #curDirectionScore:I
    .end local v11           #distance:F
    .end local v12           #exactDirectionOnly:Z
    .end local v13           #i:I
    :cond_9
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_1

    .line 1568
    .end local v15           #x:I
    :cond_a
    const v17, 0x7f7fffff

    cmpl-float v17, v4, v17

    if-nez v17, :cond_b

    .line 1569
    const/16 v17, 0x0

    const/16 v18, -0x1

    aput v18, v5, v17

    .line 1570
    const/16 v17, 0x1

    const/16 v18, -0x1

    aput v18, v5, v17

    .line 1572
    :cond_b
    return-object v5
.end method

.method static findVacantCell([IIIII[[Z)Z
    .locals 8
    .parameter "vacant"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "xCount"
    .parameter "yCount"
    .parameter "occupied"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 3059
    const/4 v4, 0x0

    .local v4, y:I
    :goto_0
    if-ge v4, p4, :cond_7

    .line 3060
    const/4 v3, 0x0

    .local v3, x:I
    :goto_1
    if-ge v3, p3, :cond_6

    .line 3061
    aget-object v7, p5, v3

    aget-boolean v7, v7, v4

    if-nez v7, :cond_1

    move v0, v5

    .line 3062
    .local v0, available:Z
    :goto_2
    move v1, v3

    .local v1, i:I
    :goto_3
    add-int v7, v3, p1

    add-int/lit8 v7, v7, -0x1

    if-ge v1, v7, :cond_0

    if-ge v3, p3, :cond_0

    .line 3063
    move v2, v4

    .local v2, j:I
    :goto_4
    add-int v7, v4, p2

    add-int/lit8 v7, v7, -0x1

    if-ge v2, v7, :cond_4

    if-ge v4, p4, :cond_4

    .line 3064
    if-eqz v0, :cond_2

    aget-object v7, p5, v1

    aget-boolean v7, v7, v2

    if-nez v7, :cond_2

    move v0, v5

    .line 3065
    :goto_5
    if-nez v0, :cond_3

    .line 3069
    .end local v2           #j:I
    :cond_0
    if-eqz v0, :cond_5

    .line 3070
    aput v3, p0, v6

    .line 3071
    aput v4, p0, v5

    .line 3077
    .end local v0           #available:Z
    .end local v1           #i:I
    .end local v3           #x:I
    :goto_6
    return v5

    .restart local v3       #x:I
    :cond_1
    move v0, v6

    .line 3061
    goto :goto_2

    .restart local v0       #available:Z
    .restart local v1       #i:I
    .restart local v2       #j:I
    :cond_2
    move v0, v6

    .line 3064
    goto :goto_5

    .line 3063
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 3062
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 3060
    .end local v2           #j:I
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 3059
    .end local v0           #available:Z
    .end local v1           #i:I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v3           #x:I
    :cond_7
    move v5, v6

    .line 3077
    goto :goto_6
.end method

.method private getDirectionVectorForDrop(IIIILandroid/view/View;[I)V
    .locals 26
    .parameter "dragViewCenterX"
    .parameter "dragViewCenterY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "resultDirection"

    .prologue
    .line 2468
    const/4 v2, 0x2

    new-array v7, v2, [I

    .local v7, targetDestination:[I
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    .line 2470
    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    .line 2471
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 2472
    .local v13, dragRect:Landroid/graphics/Rect;
    const/4 v2, 0x0

    aget v9, v7, v2

    const/4 v2, 0x1

    aget v10, v7, v2

    move-object/from16 v8, p0

    move/from16 v11, p3

    move/from16 v12, p4

    invoke-virtual/range {v8 .. v13}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToRect(IIIILandroid/graphics/Rect;)V

    .line 2473
    invoke-virtual {v13}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    sub-int v2, p1, v2

    invoke-virtual {v13}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    sub-int v3, p2, v3

    invoke-virtual {v13, v2, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 2475
    new-instance v20, Landroid/graphics/Rect;

    invoke-direct/range {v20 .. v20}, Landroid/graphics/Rect;-><init>()V

    .line 2476
    .local v20, dropRegionRect:Landroid/graphics/Rect;
    const/4 v2, 0x0

    aget v15, v7, v2

    const/4 v2, 0x1

    aget v16, v7, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    move-object/from16 v14, p0

    move/from16 v17, p3

    move/from16 v18, p4

    move-object/from16 v19, p5

    invoke-direct/range {v14 .. v21}, Lcom/cyanogenmod/trebuchet/CellLayout;->getViewsIntersectingRegion(IIIILandroid/view/View;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 2479
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->width()I

    move-result v24

    .line 2480
    .local v24, dropRegionSpanX:I
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->height()I

    move-result v25

    .line 2482
    .local v25, dropRegionSpanY:I
    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v16, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v17, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->width()I

    move-result v18

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->height()I

    move-result v19

    move-object/from16 v15, p0

    invoke-virtual/range {v15 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToRect(IIIILandroid/graphics/Rect;)V

    .line 2485
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    sub-int v2, v2, p1

    div-int v22, v2, p3

    .line 2486
    .local v22, deltaX:I
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    sub-int v2, v2, p2

    div-int v23, v2, p4

    .line 2488
    .local v23, deltaY:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v0, v24

    if-eq v0, v2, :cond_0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v0, p3

    if-ne v0, v2, :cond_1

    .line 2489
    :cond_0
    const/16 v22, 0x0

    .line 2491
    :cond_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v0, v25

    if-eq v0, v2, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v0, p4

    if-ne v0, v2, :cond_3

    .line 2492
    :cond_2
    const/16 v23, 0x0

    .line 2495
    :cond_3
    if-nez v22, :cond_4

    if-nez v23, :cond_4

    .line 2497
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput v3, p6, v2

    .line 2498
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, p6, v2

    .line 2502
    :goto_0
    return-void

    .line 2500
    :cond_4
    move/from16 v0, v22

    int-to-float v2, v0

    move/from16 v0, v23

    int-to-float v3, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-direct {v0, v2, v3, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->computeDirectionVector(FF[I)V

    goto :goto_0
.end method

.method static getMetrics(Landroid/graphics/Rect;Landroid/content/res/Resources;IIIII)V
    .locals 18
    .parameter "metrics"
    .parameter "res"
    .parameter "measureWidth"
    .parameter "measureHeight"
    .parameter "countX"
    .parameter "countY"
    .parameter "orientation"

    .prologue
    .line 938
    add-int/lit8 v9, p4, -0x1

    .line 939
    .local v9, numWidthGaps:I
    add-int/lit8 v8, p5, -0x1

    .line 950
    .local v8, numHeightGaps:I
    const v17, 0x7f0d000b

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 951
    .local v7, maxGap:I
    if-nez p6, :cond_2

    .line 952
    const v17, 0x7f0d005e

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 953
    .local v3, cellWidth:I
    const v17, 0x7f0d0060

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 954
    .local v2, cellHeight:I
    const v17, 0x7f0d0062

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v16

    .line 955
    .local v16, widthGap:I
    const v17, 0x7f0d0064

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 956
    .local v6, heightGap:I
    const v17, 0x7f0d0046

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 957
    .local v11, paddingLeft:I
    const v17, 0x7f0d0048

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 958
    .local v12, paddingRight:I
    const v17, 0x7f0d004a

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 959
    .local v13, paddingTop:I
    const v17, 0x7f0d004c

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 972
    .local v10, paddingBottom:I
    :goto_0
    if-ltz v16, :cond_0

    if-gez v6, :cond_1

    .line 973
    :cond_0
    sub-int v17, p2, v11

    sub-int v5, v17, v12

    .line 974
    .local v5, hSpace:I
    sub-int v17, p3, v13

    sub-int v15, v17, v10

    .line 975
    .local v15, vSpace:I
    mul-int v17, p4, v3

    sub-int v4, v5, v17

    .line 976
    .local v4, hFreeSpace:I
    mul-int v17, p5, v2

    sub-int v14, v15, v17

    .line 977
    .local v14, vFreeSpace:I
    if-lez v9, :cond_3

    div-int v17, v4, v9

    :goto_1
    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 978
    if-lez v8, :cond_4

    div-int v17, v14, v8

    :goto_2
    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 980
    .end local v4           #hFreeSpace:I
    .end local v5           #hSpace:I
    .end local v14           #vFreeSpace:I
    .end local v15           #vSpace:I
    :cond_1
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v3, v2, v1, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 981
    return-void

    .line 962
    .end local v2           #cellHeight:I
    .end local v3           #cellWidth:I
    .end local v6           #heightGap:I
    .end local v10           #paddingBottom:I
    .end local v11           #paddingLeft:I
    .end local v12           #paddingRight:I
    .end local v13           #paddingTop:I
    .end local v16           #widthGap:I
    :cond_2
    const v17, 0x7f0d005f

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 963
    .restart local v3       #cellWidth:I
    const v17, 0x7f0d0061

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 964
    .restart local v2       #cellHeight:I
    const v17, 0x7f0d0063

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v16

    .line 965
    .restart local v16       #widthGap:I
    const v17, 0x7f0d0065

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 966
    .restart local v6       #heightGap:I
    const v17, 0x7f0d0045

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 967
    .restart local v11       #paddingLeft:I
    const v17, 0x7f0d0047

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 968
    .restart local v12       #paddingRight:I
    const v17, 0x7f0d0049

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 969
    .restart local v13       #paddingTop:I
    const v17, 0x7f0d004b

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .restart local v10       #paddingBottom:I
    goto/16 :goto_0

    .line 977
    .restart local v4       #hFreeSpace:I
    .restart local v5       #hSpace:I
    .restart local v14       #vFreeSpace:I
    .restart local v15       #vSpace:I
    :cond_3
    const/16 v17, 0x0

    goto :goto_1

    .line 978
    :cond_4
    const/16 v17, 0x0

    goto :goto_2
.end method

.method private getViewsIntersectingRegion(IIIILandroid/view/View;Landroid/graphics/Rect;Ljava/util/ArrayList;)V
    .locals 12
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "boundingRect"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Landroid/view/View;",
            "Landroid/graphics/Rect;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2507
    .local p7, intersectingViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    if-eqz p6, :cond_0

    .line 2508
    add-int v7, p1, p3

    add-int v8, p2, p4

    move-object/from16 v0, p6

    invoke-virtual {v0, p1, p2, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 2510
    :cond_0
    invoke-virtual/range {p7 .. p7}, Ljava/util/ArrayList;->clear()V

    .line 2511
    new-instance v5, Landroid/graphics/Rect;

    add-int v7, p1, p3

    add-int v8, p2, p4

    invoke-direct {v5, p1, p2, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2512
    .local v5, r0:Landroid/graphics/Rect;
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 2513
    .local v6, r1:Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 2514
    .local v2, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v2, :cond_3

    .line 2515
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v7, v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2516
    .local v1, child:Landroid/view/View;
    move-object/from16 v0, p5

    if-ne v1, v0, :cond_2

    .line 2514
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2517
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2518
    .local v4, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v7, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v8, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v9, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v10, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    add-int/2addr v9, v10

    iget v10, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v11, v4, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    add-int/2addr v10, v11

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 2519
    invoke-static {v5, v6}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2520
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2521
    if-eqz p6, :cond_1

    .line 2522
    move-object/from16 v0, p6

    invoke-virtual {v0, v6}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    goto :goto_1

    .line 2526
    .end local v1           #child:Landroid/view/View;
    .end local v4           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_3
    return-void
.end method

.method static heightInLandscape(Landroid/content/res/Resources;I)I
    .locals 4
    .parameter "r"
    .parameter "numCells"

    .prologue
    .line 309
    const v2, 0x7f0d007b

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 310
    .local v0, cellHeight:I
    const v2, 0x7f0d007c

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f0d007d

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 313
    .local v1, minGap:I
    add-int/lit8 v2, p1, -0x1

    mul-int/2addr v2, v1

    mul-int v3, v0, p1

    add-int/2addr v2, v3

    return v2
.end method

.method private invalidateBubbleTextView(Lcom/cyanogenmod/trebuchet/BubbleTextView;)V
    .locals 6
    .parameter "icon"

    .prologue
    .line 361
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPressedOrFocusedBackgroundPadding()I

    move-result v0

    .line 362
    .local v0, padding:I
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v1, v0

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v2, v0

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getRight()I

    move-result v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v3, v0

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate(IIII)V

    .line 366
    return-void
.end method

.method private lazyInitTempRectStack()V
    .locals 3

    .prologue
    .line 1352
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1353
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    mul-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    .line 1354
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1357
    .end local v0           #i:I
    :cond_0
    return-void
.end method

.method private markCellsForRect(Landroid/graphics/Rect;[[ZZ)V
    .locals 7
    .parameter "r"
    .parameter "occupied"
    .parameter "value"

    .prologue
    .line 1981
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    move-object v0, p0

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1982
    return-void
.end method

.method private markCellsForView(IIII[[ZZ)V
    .locals 3
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "occupied"
    .parameter "value"

    .prologue
    .line 3113
    if-ltz p1, :cond_0

    if-gez p2, :cond_1

    .line 3119
    :cond_0
    return-void

    .line 3114
    :cond_1
    move v0, p1

    .local v0, x:I
    :goto_0
    add-int v2, p1, p3

    if-ge v0, v2, :cond_0

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge v0, v2, :cond_0

    .line 3115
    move v1, p2

    .local v1, y:I
    :goto_1
    add-int v2, p2, p4

    if-ge v1, v2, :cond_2

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-ge v1, v2, :cond_2

    .line 3116
    aget-object v2, p5, v0

    aput-boolean p6, v2, v1

    .line 3115
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3114
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z
    .locals 20
    .parameter
    .parameter "rectOccupiedByPotentialDrop"
    .parameter "direction"
    .parameter "dragView"
    .parameter "currentState"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Landroid/graphics/Rect;",
            "[I",
            "Landroid/view/View;",
            "Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1831
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v11, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-direct {v11, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Ljava/util/ArrayList;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)V

    .line 1832
    .local v11, cluster:Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getBoundingRect()Landroid/graphics/Rect;

    move-result-object v12

    .line 1835
    .local v12, clusterRect:Landroid/graphics/Rect;
    const/4 v13, 0x0

    .line 1839
    .local v13, fail:Z
    const/4 v3, 0x0

    aget v3, p3, v3

    if-gez v3, :cond_1

    .line 1840
    const/16 v19, 0x0

    .line 1841
    .local v19, whichEdge:I
    iget v3, v12, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/Rect;->left:I

    sub-int v17, v3, v4

    .line 1854
    .local v17, pushDistance:I
    :goto_0
    if-gtz v17, :cond_4

    .line 1855
    const/4 v14, 0x0

    .line 1920
    :cond_0
    return v14

    .line 1842
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_1
    const/4 v3, 0x0

    aget v3, p3, v3

    if-lez v3, :cond_2

    .line 1843
    const/16 v19, 0x2

    .line 1844
    .restart local v19       #whichEdge:I
    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, v12, Landroid/graphics/Rect;->left:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1845
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_2
    const/4 v3, 0x1

    aget v3, p3, v3

    if-gez v3, :cond_3

    .line 1846
    const/16 v19, 0x1

    .line 1847
    .restart local v19       #whichEdge:I
    iget v3, v12, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/Rect;->top:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1849
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_3
    const/16 v19, 0x3

    .line 1850
    .restart local v19       #whichEdge:I
    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    iget v4, v12, Landroid/graphics/Rect;->top:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1859
    :cond_4
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/View;

    .line 1860
    .local v18, v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1861
    .local v10, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_1

    .line 1867
    .end local v10           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v18           #v:Landroid/view/View;
    :cond_5
    invoke-virtual/range {p5 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->save()V

    .line 1872
    move/from16 v0, v19

    invoke-virtual {v11, v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->sortConfigurationForEdgePush(I)V

    .line 1874
    :goto_2
    if-lez v17, :cond_9

    if-nez v13, :cond_9

    .line 1875
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_6
    :goto_3
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/View;

    .line 1879
    .restart local v18       #v:Landroid/view/View;
    iget-object v3, v11, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move-object/from16 v0, v18

    move-object/from16 v1, p4

    if-eq v0, v1, :cond_6

    .line 1880
    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->isViewTouchingEdge(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1881
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    check-cast v16, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 1882
    .local v16, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    move-object/from16 v0, v16

    iget-boolean v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->canReorder:Z

    if-nez v3, :cond_8

    .line 1884
    const/4 v13, 0x1

    .line 1895
    .end local v16           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v18           #v:Landroid/view/View;
    :cond_7
    add-int/lit8 v17, v17, -0x1

    .line 1899
    const/4 v3, 0x1

    move/from16 v0, v19

    invoke-virtual {v11, v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->shift(II)V

    goto :goto_2

    .line 1887
    .restart local v16       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .restart local v18       #v:Landroid/view/View;
    :cond_8
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->addView(Landroid/view/View;)V

    .line 1888
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1891
    .restart local v10       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 1902
    .end local v10           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v16           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v18           #v:Landroid/view/View;
    :cond_9
    const/4 v14, 0x0

    .line 1903
    .local v14, foundSolution:Z
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getBoundingRect()Landroid/graphics/Rect;

    move-result-object v12

    .line 1907
    if-nez v13, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->left:I

    if-ltz v3, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-gt v3, v4, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->top:I

    if-ltz v3, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-gt v3, v4, :cond_a

    .line 1909
    const/4 v14, 0x1

    .line 1915
    :goto_4
    iget-object v3, v11, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/View;

    .line 1916
    .restart local v18       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1917
    .restart local v10       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x1

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_5

    .line 1911
    .end local v10           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v18           #v:Landroid/view/View;
    :cond_a
    invoke-virtual/range {p5 .. p5}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->restore()V

    goto :goto_4
.end method

.method private rearrangementExists(IIII[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z
    .locals 15
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "direction"
    .parameter "ignoreView"
    .parameter "solution"

    .prologue
    .line 2084
    if-ltz p1, :cond_0

    if-gez p2, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 2132
    :goto_0
    return v2

    .line 2086
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 2087
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    add-int v3, p1, p3

    add-int v4, p2, p4

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v2, v0, v1, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 2090
    if-eqz p6, :cond_2

    .line 2091
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 2092
    .local v8, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    if-eqz v8, :cond_2

    .line 2093
    move/from16 v0, p1

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 2094
    move/from16 v0, p2

    iput v0, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .line 2097
    .end local v8           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    :cond_2
    new-instance v12, Landroid/graphics/Rect;

    add-int v2, p1, p3

    add-int v3, p2, p4

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v12, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2098
    .local v12, r0:Landroid/graphics/Rect;
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 2099
    .local v13, r1:Landroid/graphics/Rect;
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 2100
    .local v9, child:Landroid/view/View;
    move-object/from16 v0, p6

    if-eq v9, v0, :cond_3

    .line 2101
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 2102
    .restart local v8       #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2103
    .local v11, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v2, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v3, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v4, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    iget v5, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v8, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    invoke-virtual {v13, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 2104
    invoke-static {v12, v13}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2105
    iget-boolean v2, v11, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->canReorder:Z

    if-nez v2, :cond_4

    .line 2106
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2108
    :cond_4
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2115
    .end local v8           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v9           #child:Landroid/view/View;
    .end local v11           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_5
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object v2, p0

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->attemptPushInDirection(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2117
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2121
    :cond_6
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object v2, p0

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2123
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2127
    :cond_7
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_8
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/View;

    .line 2128
    .local v14, v:Landroid/view/View;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object/from16 v0, p5

    move-object/from16 v1, p7

    invoke-direct {p0, v14, v2, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->addViewToTempLocation(Landroid/view/View;Landroid/graphics/Rect;[ILcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 2129
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2132
    .end local v14           #v:Landroid/view/View;
    :cond_9
    const/4 v2, 0x1

    goto/16 :goto_0
.end method

.method public static rectToCell(Landroid/content/res/Resources;II[I)[I
    .locals 9
    .parameter "resources"
    .parameter "width"
    .parameter "height"
    .parameter "result"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2996
    const v5, 0x7f0d007a

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 2997
    .local v1, actualWidth:I
    const v5, 0x7f0d007b

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 2998
    .local v0, actualHeight:I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 3001
    .local v2, smallerSize:I
    int-to-float v5, p1

    int-to-float v6, v2

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 3002
    .local v3, spanX:I
    int-to-float v5, p2

    int-to-float v6, v2

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v4, v5

    .line 3004
    .local v4, spanY:I
    if-nez p3, :cond_0

    .line 3005
    const/4 v5, 0x2

    new-array p3, v5, [I

    .end local p3
    aput v3, p3, v7

    aput v4, p3, v8

    .line 3009
    :goto_0
    return-object p3

    .line 3007
    .restart local p3
    :cond_0
    aput v3, p3, v7

    .line 3008
    aput v4, p3, v8

    goto :goto_0
.end method

.method private recycleTempRects(Ljava/util/Stack;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack",
            "<",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1360
    .local p1, used:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    :goto_0
    invoke-virtual {p1}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1361
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1363
    :cond_0
    return-void
.end method

.method static widthInPortrait(Landroid/content/res/Resources;I)I
    .locals 4
    .parameter "r"
    .parameter "numCells"

    .prologue
    .line 298
    const v2, 0x7f0d007a

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 299
    .local v0, cellWidth:I
    const v2, 0x7f0d007c

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f0d007d

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 302
    .local v1, minGap:I
    add-int/lit8 v2, p1, -0x1

    mul-int/2addr v2, v1

    mul-int v3, v0, p1

    add-int/2addr v2, v3

    return v2
.end method


# virtual methods
.method public addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Z)Z
    .locals 5
    .parameter "child"
    .parameter "index"
    .parameter "childId"
    .parameter "params"
    .parameter "markCells"

    .prologue
    .line 626
    move-object v1, p4

    .line 628
    .local v1, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    instance-of v3, p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 629
    check-cast v0, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 631
    .local v0, bubbleChild:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 632
    .local v2, res:Landroid/content/res/Resources;
    const v3, 0x7f0a0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setTextColor(I)V

    .line 635
    .end local v0           #bubbleChild:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    .end local v2           #res:Landroid/content/res/Resources;
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleX(F)V

    .line 636
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleY(F)V

    .line 640
    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    if-ltz v3, :cond_4

    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_4

    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    if-ltz v3, :cond_4

    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_4

    .line 643
    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    if-gez v3, :cond_1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iput v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    .line 644
    :cond_1
    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    if-gez v3, :cond_2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    iput v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    .line 646
    :cond_2
    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    .line 648
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v3, p1, p2, v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 650
    if-eqz p5, :cond_3

    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;)V

    .line 652
    :cond_3
    const/4 v3, 0x1

    .line 654
    :goto_0
    return v3

    :cond_4
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public animateChildToPosition(Landroid/view/View;IIIIZZ)Z
    .locals 13
    .parameter "child"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "duration"
    .parameter "delay"
    .parameter "permanent"
    .parameter "adjustOccupied"

    .prologue
    .line 1105
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 1106
    .local v9, clc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    .line 1107
    .local v11, occupied:[[Z
    if-nez p6, :cond_0

    .line 1108
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    .line 1111
    :cond_0
    invoke-virtual {v9, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_5

    .line 1112
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 1113
    .local v3, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 1116
    .local v10, info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1117
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 1118
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1121
    :cond_1
    iget v4, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->x:I

    .line 1122
    .local v4, oldX:I
    iget v6, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->y:I

    .line 1123
    .local v6, oldY:I
    if-eqz p7, :cond_2

    .line 1124
    iget v1, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    aget-object v1, v11, v1

    iget v2, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    const/4 v8, 0x0

    aput-boolean v8, v1, v2

    .line 1125
    aget-object v1, v11, p2

    const/4 v2, 0x1

    aput-boolean v2, v1, p3

    .line 1127
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1128
    if-eqz p6, :cond_3

    .line 1129
    iput p2, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iput p2, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    .line 1130
    move/from16 v0, p3

    iput v0, v10, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    move/from16 v0, p3

    iput v0, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 1135
    :goto_0
    invoke-virtual {v9, v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setupLp(Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;)V

    .line 1136
    const/4 v1, 0x0

    iput-boolean v1, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1137
    iget v5, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->x:I

    .line 1138
    .local v5, newX:I
    iget v7, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->y:I

    .line 1140
    .local v7, newY:I
    iput v4, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->x:I

    .line 1141
    iput v6, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->y:I

    .line 1144
    if-ne v4, v5, :cond_4

    if-ne v6, v7, :cond_4

    .line 1145
    const/4 v1, 0x1

    iput-boolean v1, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1146
    const/4 v1, 0x1

    .line 1184
    .end local v3           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v4           #oldX:I
    .end local v5           #newX:I
    .end local v6           #oldY:I
    .end local v7           #newY:I
    .end local v10           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :goto_1
    return v1

    .line 1132
    .restart local v3       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .restart local v4       #oldX:I
    .restart local v6       #oldY:I
    .restart local v10       #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_3
    iput p2, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    .line 1133
    move/from16 v0, p3

    iput v0, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    goto :goto_0

    .line 1149
    .restart local v5       #newX:I
    .restart local v7       #newY:I
    :cond_4
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v12

    .line 1150
    .local v12, va:Landroid/animation/ValueAnimator;
    move/from16 v0, p4

    int-to-long v1, v0

    invoke-virtual {v12, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1151
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    new-instance v1, Lcom/cyanogenmod/trebuchet/CellLayout$3;

    move-object v2, p0

    move-object v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout$3;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;IIIILandroid/view/View;)V

    invoke-virtual {v12, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1162
    new-instance v1, Lcom/cyanogenmod/trebuchet/CellLayout$4;

    invoke-direct {v1, p0, v3, p1}, Lcom/cyanogenmod/trebuchet/CellLayout$4;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;Landroid/view/View;)V

    invoke-virtual {v12, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1180
    move/from16 v0, p5

    int-to-long v1, v0

    invoke-virtual {v12, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 1181
    invoke-virtual {v12}, Landroid/animation/ValueAnimator;->start()V

    .line 1182
    const/4 v1, 0x1

    goto :goto_1

    .line 1184
    .end local v3           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v4           #oldX:I
    .end local v5           #newX:I
    .end local v6           #oldY:I
    .end local v7           #newY:I
    .end local v10           #info:Lcom/cyanogenmod/trebuchet/ItemInfo;
    .end local v12           #va:Landroid/animation/ValueAnimator;
    :cond_5
    const/4 v1, 0x0

    goto :goto_1

    .line 1149
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public buildHardwareLayer()V
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->buildLayer()V

    .line 326
    return-void
.end method

.method public calculateSpans(Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 5
    .parameter "info"

    .prologue
    const/4 v4, 0x1

    .line 3026
    instance-of v3, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    if-eqz v3, :cond_0

    move-object v3, p1

    .line 3027
    check-cast v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    iget v1, v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minWidth:I

    .local v1, minWidth:I
    move-object v3, p1

    .line 3028
    check-cast v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    iget v0, v3, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minHeight:I

    .line 3037
    .local v0, minHeight:I
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->rectToCell(II[I)[I

    move-result-object v2

    .line 3038
    .local v2, spans:[I
    const/4 v3, 0x0

    aget v3, v2, v3

    iput v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 3039
    aget v3, v2, v4

    iput v3, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 3040
    .end local v0           #minHeight:I
    .end local v1           #minWidth:I
    .end local v2           #spans:[I
    :goto_1
    return-void

    .line 3029
    :cond_0
    instance-of v3, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    if-eqz v3, :cond_1

    move-object v3, p1

    .line 3030
    check-cast v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v1, v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minWidth:I

    .restart local v1       #minWidth:I
    move-object v3, p1

    .line 3031
    check-cast v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v0, v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minHeight:I

    .restart local v0       #minHeight:I
    goto :goto_0

    .line 3034
    .end local v0           #minHeight:I
    .end local v1           #minWidth:I
    :cond_1
    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    iput v4, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    goto :goto_1
.end method

.method public cancelLongPress()V
    .locals 3

    .prologue
    .line 602
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 605
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildCount()I

    move-result v1

    .line 606
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 607
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 608
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 606
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 610
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public cellSpansToSize(II)[I
    .locals 5
    .parameter "hSpans"
    .parameter "vSpans"

    .prologue
    .line 3013
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 3014
    .local v0, size:[I
    const/4 v1, 0x0

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int/2addr v2, p1

    add-int/lit8 v3, p1, -0x1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 3015
    const/4 v1, 0x1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    mul-int/2addr v2, p2

    add-int/lit8 v3, p2, -0x1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 3016
    return-object v0
.end method

.method cellToCenterPoint(II[I)V
    .locals 6
    .parameter "cellX"
    .parameter "cellY"
    .parameter "result"

    .prologue
    const/4 v3, 0x1

    .line 861
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, v3

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 862
    return-void
.end method

.method cellToPoint(II[I)V
    .locals 5
    .parameter "cellX"
    .parameter "cellY"
    .parameter "result"

    .prologue
    .line 845
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 846
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v1

    .line 848
    .local v1, vStartPadding:I
    const/4 v2, 0x0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p1

    add-int/2addr v3, v0

    aput v3, p3, v2

    .line 849
    const/4 v2, 0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p2

    add-int/2addr v3, v1

    aput v3, p3, v2

    .line 850
    return-void
.end method

.method public cellToRect(IIIILandroid/graphics/Rect;)V
    .locals 13
    .parameter "cellX"
    .parameter "cellY"
    .parameter "cellHSpan"
    .parameter "cellVSpan"
    .parameter "resultRect"

    .prologue
    .line 2964
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    .line 2965
    .local v2, cellWidth:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    .line 2966
    .local v1, cellHeight:I
    iget v8, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 2967
    .local v8, widthGap:I
    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    .line 2969
    .local v5, heightGap:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v3

    .line 2970
    .local v3, hStartPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v6

    .line 2972
    .local v6, vStartPadding:I
    mul-int v11, p3, v2

    add-int/lit8 v12, p3, -0x1

    mul-int/2addr v12, v8

    add-int v7, v11, v12

    .line 2973
    .local v7, width:I
    mul-int v11, p4, v1

    add-int/lit8 v12, p4, -0x1

    mul-int/2addr v12, v5

    add-int v4, v11, v12

    .line 2975
    .local v4, height:I
    add-int v11, v2, v8

    mul-int/2addr v11, p1

    add-int v9, v3, v11

    .line 2976
    .local v9, x:I
    add-int v11, v1, v5

    mul-int/2addr v11, p2

    add-int v10, v6, v11

    .line 2978
    .local v10, y:I
    add-int v11, v9, v7

    add-int v12, v10, v4

    move-object/from16 v0, p5

    invoke-virtual {v0, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 2979
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 3146
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    return v0
.end method

.method public clearDragOutlines()V
    .locals 6

    .prologue
    .line 1286
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    .line 1287
    .local v0, oldIndex:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animateOut()V

    .line 1288
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v4, 0x1

    const/4 v5, -0x1

    aput v5, v3, v4

    aput v5, v1, v2

    .line 1289
    return-void
.end method

.method public clearFolderLeaveBehind()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 586
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x0

    aput v2, v0, v1

    .line 587
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 588
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 589
    return-void
.end method

.method createArea(IIIIIILandroid/view/View;[I[II)[I
    .locals 17
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "result"
    .parameter "resultSpan"
    .parameter "mode"

    .prologue
    .line 2587
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object p8

    .line 2589
    if-nez p9, :cond_0

    .line 2590
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 p9, v0

    .line 2596
    :cond_0
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_1

    const/4 v2, 0x2

    move/from16 v0, p10

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    move/from16 v0, p10

    if-ne v0, v2, :cond_a

    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    const/16 v3, -0x64

    if-eq v2, v3, :cond_a

    .line 2598
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2599
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2601
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_3

    .line 2602
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    const/16 v4, -0x64

    aput v4, v2, v3

    .line 2603
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x1

    const/16 v4, -0x64

    aput v4, v2, v3

    .line 2611
    :cond_3
    :goto_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    const/4 v11, 0x1

    new-instance v12, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$1;)V

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v2 .. v12}, Lcom/cyanogenmod/trebuchet/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    move-result-object v16

    .line 2615
    .local v16, swapSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    new-instance v9, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v9, v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$1;)V

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v2 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->findConfigurationNoShuffle(IIIIIILcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    move-result-object v15

    .line 2618
    .local v15, noShuffleSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    const/4 v13, 0x0

    .line 2619
    .local v13, finalSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    move-object/from16 v0, v16

    iget-boolean v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v2, :cond_b

    invoke-virtual/range {v16 .. v16}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->area()I

    move-result v2

    invoke-virtual {v15}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->area()I

    move-result v3

    if-lt v2, v3, :cond_b

    .line 2620
    move-object/from16 v13, v16

    .line 2625
    :cond_4
    :goto_1
    const/4 v14, 0x1

    .line 2627
    .local v14, foundSolution:Z
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setUseTempCoords(Z)V

    .line 2630
    if-eqz v13, :cond_e

    .line 2631
    const/4 v2, 0x0

    iget v3, v13, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewX:I

    aput v3, p8, v2

    .line 2632
    const/4 v2, 0x1

    iget v3, v13, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewY:I

    aput v3, p8, v2

    .line 2633
    const/4 v2, 0x0

    iget v3, v13, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    aput v3, p9, v2

    .line 2634
    const/4 v2, 0x1

    iget v3, v13, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    aput v3, p9, v2

    .line 2639
    if-eqz p10, :cond_5

    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_5

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_7

    .line 2641
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->copySolutionToTempState(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;)V

    .line 2643
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setItemPlacementDirty(Z)V

    .line 2644
    const/4 v2, 0x1

    move/from16 v0, p10

    if-ne v0, v2, :cond_c

    const/4 v2, 0x1

    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateItemsToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;Z)V

    .line 2646
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_6

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_d

    .line 2648
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->commitTempPlacement()V

    .line 2649
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2650
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setItemPlacementDirty(Z)V

    .line 2661
    :cond_7
    :goto_3
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_8

    if-nez v14, :cond_9

    .line 2662
    :cond_8
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setUseTempCoords(Z)V

    .line 2665
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->requestLayout()V

    .line 2666
    return-object p8

    .line 2606
    .end local v13           #finalSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .end local v14           #foundSolution:Z
    .end local v15           #noShuffleSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .end local v16           #swapSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    :cond_a
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->getDirectionVectorForDrop(IIIILandroid/view/View;[I)V

    .line 2607
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2608
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDirectionVector:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    aput v4, v2, v3

    goto/16 :goto_0

    .line 2621
    .restart local v13       #finalSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .restart local v15       #noShuffleSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .restart local v16       #swapSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    :cond_b
    iget-boolean v2, v15, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v2, :cond_4

    .line 2622
    move-object v13, v15

    goto/16 :goto_1

    .line 2644
    .restart local v14       #foundSolution:Z
    :cond_c
    const/4 v2, 0x0

    goto :goto_2

    .line 2652
    :cond_d
    const/16 v2, 0x96

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->beginOrAdjustHintAnimations(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;I)V

    goto :goto_3

    .line 2657
    :cond_e
    const/4 v14, 0x0

    .line 2658
    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, -0x1

    aput v6, p9, v5

    aput v6, p9, v4

    aput v6, p8, v3

    aput v6, p8, v2

    goto :goto_3
.end method

.method createAreaForResize(IIIILandroid/view/View;[IZ)Z
    .locals 22
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "direction"
    .parameter "commit"

    .prologue
    .line 2555
    const/4 v4, 0x2

    new-array v9, v4, [I

    .local v9, pixelXY:[I
    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    .line 2556
    invoke-virtual/range {v4 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 2559
    const/4 v4, 0x0

    aget v11, v9, v4

    const/4 v4, 0x1

    aget v12, v9, v4

    const/16 v19, 0x1

    new-instance v20, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    const/4 v4, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$1;)V

    move-object/from16 v10, p0

    move/from16 v13, p3

    move/from16 v14, p4

    move/from16 v15, p3

    move/from16 v16, p4

    move-object/from16 v17, p6

    move-object/from16 v18, p5

    invoke-virtual/range {v10 .. v20}, Lcom/cyanogenmod/trebuchet/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    move-result-object v21

    .line 2562
    .local v21, swapSolution:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setUseTempCoords(Z)V

    .line 2563
    if-eqz v21, :cond_0

    move-object/from16 v0, v21

    iget-boolean v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v4, :cond_0

    .line 2567
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->copySolutionToTempState(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;)V

    .line 2568
    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setItemPlacementDirty(Z)V

    .line 2569
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    move/from16 v3, p7

    invoke-direct {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateItemsToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;Z)V

    .line 2571
    if-eqz p7, :cond_1

    .line 2572
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->commitTempPlacement()V

    .line 2573
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2574
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setItemPlacementDirty(Z)V

    .line 2579
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->requestLayout()V

    .line 2581
    :cond_0
    move-object/from16 v0, v21

    iget-boolean v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    return v4

    .line 2576
    :cond_1
    const/16 v4, 0x96

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->beginOrAdjustHintAnimations(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Landroid/view/View;I)V

    goto :goto_0
.end method

.method public disableHardwareLayers()V
    .locals 3

    .prologue
    .line 321
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    const/4 v1, 0x0

    sget-object v2, Lcom/cyanogenmod/trebuchet/CellLayout;->sPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 322
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .parameter "canvas"

    .prologue
    .line 558
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 559
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundAlpha:I

    if-lez v1, :cond_0

    .line 560
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 561
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/NinePatchDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    .line 562
    .local v0, p:Landroid/graphics/Paint;
    sget-object v1, Lcom/cyanogenmod/trebuchet/CellLayout;->sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 563
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 564
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 566
    .end local v0           #p:Landroid/graphics/Paint;
    :cond_0
    return-void
.end method

.method public enableHardwareLayers()V
    .locals 3

    .prologue
    .line 317
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    const/4 v1, 0x2

    sget-object v2, Lcom/cyanogenmod/trebuchet/CellLayout;->sPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 318
    return-void
.end method

.method estimateDropCell(IIII[I)V
    .locals 7
    .parameter "originX"
    .parameter "originY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1197
    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 1198
    .local v1, countX:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 1202
    .local v2, countY:I
    invoke-virtual {p0, p1, p2, p5}, Lcom/cyanogenmod/trebuchet/CellLayout;->pointToCellRounded(II[I)V

    .line 1205
    aget v4, p5, v5

    add-int/2addr v4, p3

    sub-int v3, v4, v1

    .line 1206
    .local v3, rightOverhang:I
    if-lez v3, :cond_0

    .line 1207
    aget v4, p5, v5

    sub-int/2addr v4, v3

    aput v4, p5, v5

    .line 1209
    :cond_0
    aget v4, p5, v5

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p5, v5

    .line 1210
    aget v4, p5, v6

    add-int/2addr v4, p4

    sub-int v0, v4, v2

    .line 1211
    .local v0, bottomOverhang:I
    if-lez v0, :cond_1

    .line 1212
    aget v4, p5, v6

    sub-int/2addr v4, v0

    aput v4, p5, v6

    .line 1214
    :cond_1
    aget v4, p5, v6

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p5, v6

    .line 1215
    return-void
.end method

.method existsEmptyCell()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 2793
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v0

    return v0
.end method

.method findCellForSpan([III)Z
    .locals 8
    .parameter "cellXY"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    const/4 v4, -0x1

    .line 2810
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

    move-result v0

    return v0
.end method

.method findCellForSpanIgnoring([IIILandroid/view/View;)Z
    .locals 8
    .parameter "cellXY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "ignoreView"

    .prologue
    const/4 v4, -0x1

    .line 2824
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    move-object v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

    move-result v0

    return v0
.end method

.method findCellForSpanThatIntersects([IIIII)Z
    .locals 8
    .parameter "cellXY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "intersectX"
    .parameter "intersectY"

    .prologue
    .line 2842
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

    move-result v0

    return v0
.end method

.method findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z
    .locals 13
    .parameter "cellXY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "intersectX"
    .parameter "intersectY"
    .parameter "ignoreView"
    .parameter "occupied"

    .prologue
    .line 2852
    move-object/from16 v0, p6

    move-object/from16 v1, p7

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 2854
    const/4 v4, 0x0

    .line 2856
    .local v4, foundCell:Z
    :goto_0
    const/4 v7, 0x0

    .line 2857
    .local v7, startX:I
    if-ltz p4, :cond_0

    .line 2858
    add-int/lit8 v11, p2, -0x1

    sub-int v11, p4, v11

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 2860
    :cond_0
    iget v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    add-int/lit8 v12, p2, -0x1

    sub-int v2, v11, v12

    .line 2861
    .local v2, endX:I
    if-ltz p4, :cond_1

    .line 2862
    add-int/lit8 v11, p2, -0x1

    add-int v12, p4, v11

    const/4 v11, 0x1

    if-ne p2, v11, :cond_4

    const/4 v11, 0x1

    :goto_1
    add-int/2addr v11, v12

    invoke-static {v2, v11}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 2864
    :cond_1
    const/4 v8, 0x0

    .line 2865
    .local v8, startY:I
    if-ltz p5, :cond_2

    .line 2866
    add-int/lit8 v11, p3, -0x1

    sub-int v11, p5, v11

    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 2868
    :cond_2
    iget v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    add-int/lit8 v12, p3, -0x1

    sub-int v3, v11, v12

    .line 2869
    .local v3, endY:I
    if-ltz p5, :cond_3

    .line 2870
    add-int/lit8 v11, p3, -0x1

    add-int v12, p5, v11

    const/4 v11, 0x1

    move/from16 v0, p3

    if-ne v0, v11, :cond_5

    const/4 v11, 0x1

    :goto_2
    add-int/2addr v11, v12

    invoke-static {v3, v11}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 2873
    :cond_3
    move v10, v8

    .local v10, y:I
    :goto_3
    if-ge v10, v3, :cond_b

    if-nez v4, :cond_b

    .line 2875
    move v9, v7

    .local v9, x:I
    :goto_4
    if-ge v9, v2, :cond_a

    .line 2876
    const/4 v5, 0x0

    .local v5, i:I
    :goto_5
    if-ge v5, p2, :cond_8

    .line 2877
    const/4 v6, 0x0

    .local v6, j:I
    :goto_6
    move/from16 v0, p3

    if-ge v6, v0, :cond_7

    .line 2878
    add-int v11, v9, v5

    aget-object v11, p7, v11

    add-int v12, v10, v6

    aget-boolean v11, v11, v12

    if-eqz v11, :cond_6

    .line 2881
    add-int/2addr v9, v5

    .line 2875
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 2862
    .end local v3           #endY:I
    .end local v5           #i:I
    .end local v6           #j:I
    .end local v8           #startY:I
    .end local v9           #x:I
    .end local v10           #y:I
    :cond_4
    const/4 v11, 0x0

    goto :goto_1

    .line 2870
    .restart local v3       #endY:I
    .restart local v8       #startY:I
    :cond_5
    const/4 v11, 0x0

    goto :goto_2

    .line 2877
    .restart local v5       #i:I
    .restart local v6       #j:I
    .restart local v9       #x:I
    .restart local v10       #y:I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 2876
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 2886
    .end local v6           #j:I
    :cond_8
    if-eqz p1, :cond_9

    .line 2887
    const/4 v11, 0x0

    aput v9, p1, v11

    .line 2888
    const/4 v11, 0x1

    aput v10, p1, v11

    .line 2890
    :cond_9
    const/4 v4, 0x1

    .line 2873
    .end local v5           #i:I
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 2894
    .end local v9           #x:I
    :cond_b
    const/4 v11, -0x1

    move/from16 v0, p4

    if-ne v0, v11, :cond_c

    const/4 v11, -0x1

    move/from16 v0, p5

    if-ne v0, v11, :cond_c

    .line 2905
    move-object/from16 v0, p6

    move-object/from16 v1, p7

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 2906
    return v4

    .line 2899
    :cond_c
    const/16 p4, -0x1

    .line 2900
    const/16 p5, -0x1

    .line 2902
    goto/16 :goto_0
.end method

.method findConfigurationNoShuffle(IIIIIILcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .locals 11
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "solution"

    .prologue
    .line 2437
    const/4 v1, 0x2

    new-array v9, v1, [I

    .line 2438
    .local v9, result:[I
    const/4 v1, 0x2

    new-array v10, v1, [I

    .line 2439
    .local v10, resultSpan:[I
    const/4 v8, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-virtual/range {v1 .. v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestVacantArea(IIIIIILandroid/view/View;[I[I)[I

    .line 2441
    const/4 v1, 0x0

    aget v1, v9, v1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    aget v1, v9, v1

    if-ltz v1, :cond_0

    .line 2442
    const/4 v1, 0x0

    move-object/from16 v0, p7

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->copyCurrentStateToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Z)V

    .line 2443
    const/4 v1, 0x0

    aget v1, v9, v1

    move-object/from16 v0, p7

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewX:I

    .line 2444
    const/4 v1, 0x1

    aget v1, v9, v1

    move-object/from16 v0, p7

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewY:I

    .line 2445
    const/4 v1, 0x0

    aget v1, v10, v1

    move-object/from16 v0, p7

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    .line 2446
    const/4 v1, 0x1

    aget v1, v10, v1

    move-object/from16 v0, p7

    iput v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    .line 2447
    const/4 v1, 0x1

    move-object/from16 v0, p7

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    .line 2451
    :goto_0
    return-object p7

    .line 2449
    :cond_0
    const/4 v1, 0x0

    move-object/from16 v0, p7

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    goto :goto_0
.end method

.method findNearestArea(IIIIIILandroid/view/View;Z[I[I[[Z)[I
    .locals 33
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "ignoreView"
    .parameter "ignoreOccupied"
    .parameter "result"
    .parameter "resultSpan"
    .parameter "occupied"

    .prologue
    .line 1384
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->lazyInitTempRectStack()V

    .line 1386
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 1391
    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    move/from16 v29, v0

    add-int v28, v28, v29

    add-int/lit8 v29, p5, -0x1

    mul-int v28, v28, v29

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x4000

    div-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 p1, v0

    .line 1392
    move/from16 v0, p2

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    move/from16 v29, v0

    add-int v28, v28, v29

    add-int/lit8 v29, p6, -0x1

    mul-int v28, v28, v29

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x4000

    div-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 p2, v0

    .line 1395
    if-eqz p9, :cond_1

    move-object/from16 v7, p9

    .line 1396
    .local v7, bestXY:[I
    :goto_0
    const-wide v4, 0x7fefffffffffffffL

    .line 1397
    .local v4, bestDistance:D
    new-instance v6, Landroid/graphics/Rect;

    const/16 v27, -0x1

    const/16 v28, -0x1

    const/16 v29, -0x1

    const/16 v30, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    move/from16 v2, v29

    move/from16 v3, v30

    invoke-direct {v6, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1398
    .local v6, bestRect:Landroid/graphics/Rect;
    new-instance v22, Ljava/util/Stack;

    invoke-direct/range {v22 .. v22}, Ljava/util/Stack;-><init>()V

    .line 1400
    .local v22, validRegions:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    move-object/from16 v0, p0

    iget v10, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 1401
    .local v10, countX:I
    move-object/from16 v0, p0

    iget v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 1403
    .local v11, countY:I
    if-lez p3, :cond_0

    if-lez p4, :cond_0

    if-lez p5, :cond_0

    if-lez p6, :cond_0

    move/from16 v0, p5

    move/from16 v1, p3

    if-lt v0, v1, :cond_0

    move/from16 v0, p6

    move/from16 v1, p4

    if-ge v0, v1, :cond_2

    .line 1499
    :cond_0
    :goto_1
    return-object v7

    .line 1395
    .end local v4           #bestDistance:D
    .end local v6           #bestRect:Landroid/graphics/Rect;
    .end local v7           #bestXY:[I
    .end local v10           #countX:I
    .end local v11           #countY:I
    .end local v22           #validRegions:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    :cond_1
    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v7, v0, [I

    goto :goto_0

    .line 1408
    .restart local v4       #bestDistance:D
    .restart local v6       #bestRect:Landroid/graphics/Rect;
    .restart local v7       #bestXY:[I
    .restart local v10       #countX:I
    .restart local v11       #countY:I
    .restart local v22       #validRegions:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    :cond_2
    const/16 v25, 0x0

    .local v25, y:I
    :goto_2
    add-int/lit8 v27, p4, -0x1

    sub-int v27, v11, v27

    move/from16 v0, v25

    move/from16 v1, v27

    if-ge v0, v1, :cond_1c

    .line 1410
    const/16 v23, 0x0

    .local v23, x:I
    :goto_3
    add-int/lit8 v27, p3, -0x1

    sub-int v27, v10, v27

    move/from16 v0, v23

    move/from16 v1, v27

    if-ge v0, v1, :cond_1b

    .line 1411
    const/16 v26, -0x1

    .line 1412
    .local v26, ySize:I
    const/16 v24, -0x1

    .line 1413
    .local v24, xSize:I
    if-eqz p8, :cond_15

    .line 1415
    const/16 v17, 0x0

    .local v17, i:I
    :goto_4
    move/from16 v0, v17

    move/from16 v1, p3

    if-ge v0, v1, :cond_6

    .line 1416
    const/16 v20, 0x0

    .local v20, j:I
    :goto_5
    move/from16 v0, v20

    move/from16 v1, p4

    if-ge v0, v1, :cond_5

    .line 1417
    add-int v27, v23, v17

    aget-object v27, p11, v27

    add-int v28, v25, v20

    aget-boolean v27, v27, v28

    if-eqz v27, :cond_4

    .line 1410
    .end local v17           #i:I
    .end local v20           #j:I
    :cond_3
    :goto_6
    add-int/lit8 v23, v23, 0x1

    goto :goto_3

    .line 1416
    .restart local v17       #i:I
    .restart local v20       #j:I
    :cond_4
    add-int/lit8 v20, v20, 0x1

    goto :goto_5

    .line 1415
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto :goto_4

    .line 1422
    .end local v20           #j:I
    :cond_6
    move/from16 v24, p3

    .line 1423
    move/from16 v26, p4

    .line 1428
    const/16 v19, 0x1

    .line 1429
    .local v19, incX:Z
    move/from16 v0, v24

    move/from16 v1, p5

    if-lt v0, v1, :cond_a

    const/4 v15, 0x1

    .line 1430
    .local v15, hitMaxX:Z
    :goto_7
    move/from16 v0, v26

    move/from16 v1, p6

    if-lt v0, v1, :cond_b

    const/16 v16, 0x1

    .line 1431
    .local v16, hitMaxY:Z
    :goto_8
    if-eqz v15, :cond_7

    if-nez v16, :cond_15

    .line 1432
    :cond_7
    if-eqz v19, :cond_e

    if-nez v15, :cond_e

    .line 1433
    const/16 v20, 0x0

    .restart local v20       #j:I
    :goto_9
    move/from16 v0, v20

    move/from16 v1, v26

    if-ge v0, v1, :cond_c

    .line 1434
    add-int v27, v23, v24

    add-int/lit8 v28, v10, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-gt v0, v1, :cond_8

    add-int v27, v23, v24

    aget-object v27, p11, v27

    add-int v28, v25, v20

    aget-boolean v27, v27, v28

    if-eqz v27, :cond_9

    .line 1436
    :cond_8
    const/4 v15, 0x1

    .line 1433
    :cond_9
    add-int/lit8 v20, v20, 0x1

    goto :goto_9

    .line 1429
    .end local v15           #hitMaxX:Z
    .end local v16           #hitMaxY:Z
    .end local v20           #j:I
    :cond_a
    const/4 v15, 0x0

    goto :goto_7

    .line 1430
    .restart local v15       #hitMaxX:Z
    :cond_b
    const/16 v16, 0x0

    goto :goto_8

    .line 1439
    .restart local v16       #hitMaxY:Z
    .restart local v20       #j:I
    :cond_c
    if-nez v15, :cond_d

    .line 1440
    add-int/lit8 v24, v24, 0x1

    .line 1453
    .end local v20           #j:I
    :cond_d
    :goto_a
    move/from16 v0, v24

    move/from16 v1, p5

    if-lt v0, v1, :cond_12

    const/16 v27, 0x1

    :goto_b
    or-int v15, v15, v27

    .line 1454
    move/from16 v0, v26

    move/from16 v1, p6

    if-lt v0, v1, :cond_13

    const/16 v27, 0x1

    :goto_c
    or-int v16, v16, v27

    .line 1455
    if-nez v19, :cond_14

    const/16 v19, 0x1

    :goto_d
    goto :goto_8

    .line 1442
    :cond_e
    if-nez v16, :cond_d

    .line 1443
    const/16 v17, 0x0

    :goto_e
    move/from16 v0, v17

    move/from16 v1, v24

    if-ge v0, v1, :cond_11

    .line 1444
    add-int v27, v25, v26

    add-int/lit8 v28, v11, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-gt v0, v1, :cond_f

    add-int v27, v23, v17

    aget-object v27, p11, v27

    add-int v28, v25, v26

    aget-boolean v27, v27, v28

    if-eqz v27, :cond_10

    .line 1446
    :cond_f
    const/16 v16, 0x1

    .line 1443
    :cond_10
    add-int/lit8 v17, v17, 0x1

    goto :goto_e

    .line 1449
    :cond_11
    if-nez v16, :cond_d

    .line 1450
    add-int/lit8 v26, v26, 0x1

    goto :goto_a

    .line 1453
    :cond_12
    const/16 v27, 0x0

    goto :goto_b

    .line 1454
    :cond_13
    const/16 v27, 0x0

    goto :goto_c

    .line 1455
    :cond_14
    const/16 v19, 0x0

    goto :goto_d

    .line 1458
    .end local v15           #hitMaxX:Z
    .end local v16           #hitMaxY:Z
    .end local v17           #i:I
    .end local v19           #incX:Z
    :cond_15
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpXY:[I

    .line 1459
    .local v8, cellXY:[I
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToCenterPoint(II[I)V

    .line 1464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/graphics/Rect;

    .line 1465
    .local v12, currentRect:Landroid/graphics/Rect;
    add-int v27, v23, v24

    add-int v28, v25, v26

    move/from16 v0, v23

    move/from16 v1, v25

    move/from16 v2, v27

    move/from16 v3, v28

    invoke-virtual {v12, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 1466
    const/4 v9, 0x0

    .line 1467
    .local v9, contained:Z
    invoke-virtual/range {v22 .. v22}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, i$:Ljava/util/Iterator;
    :cond_16
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_17

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroid/graphics/Rect;

    .line 1468
    .local v21, r:Landroid/graphics/Rect;
    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v27

    if-eqz v27, :cond_16

    .line 1469
    const/4 v9, 0x1

    .line 1473
    .end local v21           #r:Landroid/graphics/Rect;
    :cond_17
    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1474
    const/16 v27, 0x0

    aget v27, v8, v27

    sub-int v27, v27, p1

    move/from16 v0, v27

    int-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide/high16 v29, 0x4000

    invoke-static/range {v27 .. v30}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v27

    const/16 v29, 0x1

    aget v29, v8, v29

    sub-int v29, v29, p2

    move/from16 v0, v29

    int-to-double v0, v0

    move-wide/from16 v29, v0

    const-wide/high16 v31, 0x4000

    invoke-static/range {v29 .. v32}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v29

    add-double v27, v27, v29

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    .line 1477
    .local v13, distance:D
    cmpg-double v27, v13, v4

    if-gtz v27, :cond_18

    if-eqz v9, :cond_19

    :cond_18
    invoke-virtual {v12, v6}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v27

    if-eqz v27, :cond_3

    .line 1479
    :cond_19
    move-wide v4, v13

    .line 1480
    const/16 v27, 0x0

    aput v23, v7, v27

    .line 1481
    const/16 v27, 0x1

    aput v25, v7, v27

    .line 1482
    if-eqz p10, :cond_1a

    .line 1483
    const/16 v27, 0x0

    aput v24, p10, v27

    .line 1484
    const/16 v27, 0x1

    aput v26, p10, v27

    .line 1486
    :cond_1a
    invoke-virtual {v6, v12}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto/16 :goto_6

    .line 1408
    .end local v8           #cellXY:[I
    .end local v9           #contained:Z
    .end local v12           #currentRect:Landroid/graphics/Rect;
    .end local v13           #distance:D
    .end local v18           #i$:Ljava/util/Iterator;
    .end local v24           #xSize:I
    .end local v26           #ySize:I
    :cond_1b
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_2

    .line 1491
    .end local v23           #x:I
    :cond_1c
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 1494
    const-wide v27, 0x7fefffffffffffffL

    cmpl-double v27, v4, v27

    if-nez v27, :cond_1d

    .line 1495
    const/16 v27, 0x0

    const/16 v28, -0x1

    aput v28, v7, v27

    .line 1496
    const/16 v27, 0x1

    const/16 v28, -0x1

    aput v28, v7, v27

    .line 1498
    :cond_1d
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->recycleTempRects(Ljava/util/Stack;)V

    goto/16 :goto_1
.end method

.method findNearestArea(IIIILandroid/view/View;Z[I)[I
    .locals 12
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "ignoreView"
    .parameter "ignoreOccupied"
    .parameter "result"

    .prologue
    .line 1346
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move v5, p3

    move/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    invoke-virtual/range {v0 .. v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIIIIILandroid/view/View;Z[I[I[[Z)[I

    move-result-object v0

    return-object v0
.end method

.method findNearestArea(IIII[I)[I
    .locals 8
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"

    .prologue
    .line 2789
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIIILandroid/view/View;Z[I)[I

    move-result-object v0

    return-object v0
.end method

.method findNearestVacantArea(IIIIIILandroid/view/View;[I[I)[I
    .locals 12
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "ignoreView"
    .parameter "result"
    .parameter "resultSpan"

    .prologue
    .line 2770
    const/4 v8, 0x1

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIIIIILandroid/view/View;Z[I[I[[Z)[I

    move-result-object v0

    return-object v0
.end method

.method findNearestVacantArea(IIIIII[I[I)[I
    .locals 10
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"
    .parameter "resultSpan"

    .prologue
    .line 1326
    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestVacantArea(IIIIIILandroid/view/View;[I[I)[I

    move-result-object v0

    return-object v0
.end method

.method findNearestVacantArea(IIIILandroid/view/View;[I)[I
    .locals 8
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "ignoreView"
    .parameter "result"

    .prologue
    .line 2750
    const/4 v6, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIIILandroid/view/View;Z[I)[I

    move-result-object v0

    return-object v0
.end method

.method findNearestVacantArea(IIII[I)[I
    .locals 7
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"

    .prologue
    .line 1306
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestVacantArea(IIIILandroid/view/View;[I)[I

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 3141
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 3151
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getBackgroundAlpha()F
    .locals 1

    .prologue
    .line 1064
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlpha:F

    return v0
.end method

.method public getBackgroundAlphaMultiplier()F
    .locals 1

    .prologue
    .line 1075
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlphaMultiplier:F

    return v0
.end method

.method getCellHeight()I
    .locals 1

    .prologue
    .line 913
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    return v0
.end method

.method getCellWidth()I
    .locals 1

    .prologue
    .line 909
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    return v0
.end method

.method public getChildAt(II)Landroid/view/View;
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1100
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1, p2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenScale()F
    .locals 1

    .prologue
    .line 333
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mChildrenScale:F

    return v0
.end method

.method getContentRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 6
    .parameter "r"

    .prologue
    .line 925
    if-nez p1, :cond_0

    .line 926
    new-instance p1, Landroid/graphics/Rect;

    .end local p1
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 928
    .restart local p1
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v1

    .line 929
    .local v1, left:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v3

    .line 930
    .local v3, top:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 931
    .local v2, right:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 932
    .local v0, bottom:I
    invoke-virtual {p1, v1, v3, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 933
    return-object p1
.end method

.method getCountX()I
    .locals 1

    .prologue
    .line 617
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    return v0
.end method

.method getCountY()I
    .locals 1

    .prologue
    .line 621
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    return v0
.end method

.method public getDesiredHeight()I
    .locals 3

    .prologue
    .line 3127
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public getDesiredWidth()I
    .locals 3

    .prologue
    .line 3122
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public getDistanceFromCell(FF[I)F
    .locals 7
    .parameter "x"
    .parameter "y"
    .parameter "cell"

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    const-wide/high16 v4, 0x4000

    .line 898
    aget v0, p3, v3

    aget v1, p3, v6

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToCenterPoint(II[I)V

    .line 899
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    aget v0, v0, v3

    int-to-float v0, v0

    sub-float v0, p1, v0

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    aget v2, v2, v6

    int-to-float v2, v2

    sub-float v2, p2, v2

    float-to-double v2, v2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method getHeightGap()I
    .locals 1

    .prologue
    .line 921
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    return v0
.end method

.method getIsDragOverlapping()Z
    .locals 1

    .prologue
    .line 401
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIsDragOverlapping:Z

    return v0
.end method

.method public getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .locals 1

    .prologue
    .line 1093
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1094
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 1096
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTag()Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    .locals 1

    .prologue
    .line 801
    invoke-super {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    return-object v0
.end method

.method public bridge synthetic getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getTag()Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    move-result-object v0

    return-object v0
.end method

.method public getVacantCell([III)Z
    .locals 6
    .parameter "vacant"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 3053
    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    move-object v0, p1

    move v1, p2

    move v2, p3

    invoke-static/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findVacantCell([IIIII[[Z)Z

    move-result v0

    return v0
.end method

.method getWidthGap()I
    .locals 1

    .prologue
    .line 917
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    return v0
.end method

.method public hideFolderAccept(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)V
    .locals 1
    .parameter "fra"

    .prologue
    .line 573
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 574
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 576
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 577
    return-void
.end method

.method isItemPlacementDirty()Z
    .locals 1

    .prologue
    .line 2673
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mItemPlacementDirty:Z

    return v0
.end method

.method isNearestDropLocationOccupied(IIIILandroid/view/View;[I)Z
    .locals 8
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "result"

    .prologue
    .line 2530
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object p6

    .line 2531
    const/4 v0, 0x0

    aget v1, p6, v0

    const/4 v0, 0x1

    aget v2, p6, v0

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    move-object v0, p0

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->getViewsIntersectingRegion(IIIILandroid/view/View;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 2533
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOccupied(II)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 3132
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    if-ge p1, v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    if-ge p2, v0, :cond_0

    .line 3133
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    aget-object v0, v0, p1

    aget-boolean v0, v0, p2

    return v0

    .line 3135
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Position exceeds the bound of this CellLayout"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public lastDownOnOccupiedCell()Z
    .locals 1

    .prologue
    .line 3330
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mLastDownOnOccupiedCell:Z

    return v0
.end method

.method public markCellsAsOccupiedForView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 3094
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 3095
    return-void
.end method

.method public markCellsAsOccupiedForView(Landroid/view/View;[[Z)V
    .locals 8
    .parameter "view"
    .parameter "occupied"

    .prologue
    .line 3097
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    if-eq v0, v1, :cond_1

    .line 3100
    :cond_0
    :goto_0
    return-void

    .line 3098
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3099
    .local v7, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v1, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v2, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v3, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iget v4, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    const/4 v6, 0x1

    move-object v0, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_0
.end method

.method public markCellsAsUnoccupiedForView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 3103
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 3104
    return-void
.end method

.method public markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V
    .locals 8
    .parameter "view"
    .parameter "occupied"

    .prologue
    .line 3106
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    if-eq v0, v1, :cond_1

    .line 3109
    :cond_0
    :goto_0
    return-void

    .line 3107
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 3108
    .local v7, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v1, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v2, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iget v3, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iget v4, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    const/4 v6, 0x0

    move-object v0, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 711
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 712
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->screen:I

    .line 713
    return-void
.end method

.method onDragEnter()V
    .locals 1

    .prologue
    .line 2915
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->onDragEnter()V

    .line 2916
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragging:Z

    .line 2917
    return-void
.end method

.method onDragExit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 2923
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragEnforcer:Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DropTarget$DragEnforcer;->onDragExit()V

    .line 2927
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragging:Z

    if-eqz v0, :cond_0

    .line 2928
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragging:Z

    .line 2932
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v2, 0x1

    const/4 v3, -0x1

    aput v3, v1, v2

    aput v3, v0, v4

    .line 2933
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animateOut()V

    .line 2934
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    .line 2935
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->revertTempState()V

    .line 2936
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->setIsDragOverlapping(Z)V

    .line 2937
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 22
    .parameter "canvas"

    .prologue
    .line 448
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlpha:F

    move/from16 v19, v0

    const/16 v20, 0x0

    cmpl-float v19, v19, v20

    if-lez v19, :cond_0

    .line 451
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIsDragOverlapping:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 453
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    .line 458
    .local v6, bg:Landroid/graphics/drawable/Drawable;
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlpha:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlphaMultiplier:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    const/high16 v20, 0x437f

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 460
    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 463
    .end local v6           #bg:Landroid/graphics/drawable/Drawable;
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlinePaint:Landroid/graphics/Paint;

    .line 464
    .local v14, paint:Landroid/graphics/Paint;
    const/4 v11, 0x0

    .local v11, i:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v11, v0, :cond_3

    .line 465
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAlphas:[F

    move-object/from16 v19, v0

    aget v4, v19, v11

    .line 466
    .local v4, alpha:F
    const/16 v19, 0x0

    cmpl-float v19, v4, v19

    if-lez v19, :cond_1

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    move-object/from16 v19, v0

    aget-object v16, v19, v11

    .line 468
    .local v16, r:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->temp:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v20

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->scaleRectAboutCenter(Landroid/graphics/Rect;Landroid/graphics/Rect;F)V

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    move-object/from16 v19, v0

    aget-object v19, v19, v11

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    .line 470
    .local v5, b:Landroid/graphics/Bitmap;
    const/high16 v19, 0x3f00

    add-float v19, v19, v4

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 471
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->temp:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v5, v1, v2, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 464
    .end local v5           #b:Landroid/graphics/Bitmap;
    .end local v16           #r:Landroid/graphics/Rect;
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 455
    .end local v4           #alpha:F
    .end local v11           #i:I
    .end local v14           #paint:Landroid/graphics/Paint;
    :cond_2
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    .restart local v6       #bg:Landroid/graphics/drawable/Drawable;
    goto/16 :goto_0

    .line 477
    .end local v6           #bg:Landroid/graphics/drawable/Drawable;
    .restart local v11       #i:I
    .restart local v14       #paint:Landroid/graphics/Paint;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    move-object/from16 v19, v0

    if-eqz v19, :cond_4

    .line 478
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPressedOrFocusedBackgroundPadding()I

    move-result v13

    .line 479
    .local v13, padding:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPressedOrFocusedBackground()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 480
    .restart local v5       #b:Landroid/graphics/Bitmap;
    if-eqz v5, :cond_4

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v20

    add-int v19, v19, v20

    sub-int v19, v19, v13

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getTop()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v21

    add-int v20, v20, v21

    sub-int v20, v20, v13

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v5, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 505
    .end local v5           #b:Landroid/graphics/Bitmap;
    .end local v13           #padding:I
    :cond_4
    sget v15, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 508
    .local v15, previewOffset:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    .line 510
    .local v17, ringAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;
    sget-object v9, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->sSharedOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 511
    .local v9, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {v17 .. v17}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->getOuterRingSize()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v18, v0

    .line 512
    .local v18, width:I
    move/from16 v10, v18

    .line 513
    .local v10, height:I
    move-object/from16 v0, v17

    iget v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellX:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToPoint(II[I)V

    .line 515
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    div-int/lit8 v20, v20, 0x2

    add-int v7, v19, v20

    .line 516
    .local v7, centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x1

    aget v19, v19, v20

    div-int/lit8 v20, v15, 0x2

    add-int v8, v19, v20

    .line 518
    .local v8, centerY:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 519
    div-int/lit8 v19, v18, 0x2

    sub-int v19, v7, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    div-int/lit8 v20, v10, 0x2

    sub-int v20, v8, v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 520
    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v9, v0, v1, v2, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 521
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 522
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 525
    sget-object v9, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->sSharedInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 526
    invoke-virtual/range {v17 .. v17}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->getInnerRingSize()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v18, v0

    .line 527
    move/from16 v10, v18

    .line 528
    move-object/from16 v0, v17

    iget v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellX:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->mCellY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToPoint(II[I)V

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    div-int/lit8 v20, v20, 0x2

    add-int v7, v19, v20

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x1

    aget v19, v19, v20

    div-int/lit8 v20, v15, 0x2

    add-int v8, v19, v20

    .line 532
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 533
    div-int/lit8 v19, v18, 0x2

    sub-int v19, v7, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    div-int/lit8 v20, v18, 0x2

    sub-int v20, v8, v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 534
    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v9, v0, v1, v2, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 535
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 536
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_2

    .line 539
    .end local v7           #centerX:I
    .end local v8           #centerY:I
    .end local v9           #d:Landroid/graphics/drawable/Drawable;
    .end local v10           #height:I
    .end local v17           #ringAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;
    .end local v18           #width:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget v19, v19, v20

    if-ltz v19, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v19, v0

    const/16 v20, 0x1

    aget v19, v19, v20

    if-ltz v19, :cond_6

    .line 540
    sget-object v9, Lcom/cyanogenmod/trebuchet/FolderIcon;->sSharedFolderLeaveBehind:Landroid/graphics/drawable/Drawable;

    .line 541
    .restart local v9       #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v18

    .line 542
    .restart local v18       #width:I
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    .line 544
    .restart local v10       #height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToPoint(II[I)V

    .line 545
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    div-int/lit8 v20, v20, 0x2

    add-int v7, v19, v20

    .line 546
    .restart local v7       #centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempLocation:[I

    move-object/from16 v19, v0

    const/16 v20, 0x1

    aget v19, v19, v20

    div-int/lit8 v20, v15, 0x2

    add-int v8, v19, v20

    .line 548
    .restart local v8       #centerY:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 549
    div-int/lit8 v19, v18, 0x2

    sub-int v19, v7, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    div-int/lit8 v20, v18, 0x2

    sub-int v20, v8, v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 550
    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v9, v0, v1, v2, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 551
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 552
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 554
    .end local v7           #centerX:I
    .end local v8           #centerY:I
    .end local v9           #d:Landroid/graphics/drawable/Drawable;
    .end local v10           #height:I
    .end local v18           #width:I
    :cond_6
    return-void
.end method

.method onDropChild(Landroid/view/View;)V
    .locals 2
    .parameter "child"

    .prologue
    .line 2947
    if-eqz p1, :cond_0

    .line 2948
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2949
    .local v0, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->dropped:Z

    .line 2950
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 2952
    .end local v0           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "ev"

    .prologue
    .line 773
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 775
    .local v0, action:I
    if-nez v0, :cond_0

    .line 776
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->clearTagCellInfo()V

    .line 779
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    invoke-interface {v1, p0, p1}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 780
    const/4 v1, 0x1

    .line 787
    :goto_0
    return v1

    .line 783
    :cond_1
    if-nez v0, :cond_2

    .line 784
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTagToCellInfoForPoint(II)V

    .line 787
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onLayout(ZIIII)V
    .locals 8
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 1037
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildCount()I

    move-result v1

    .line 1038
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1039
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1040
    .local v0, child:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v4

    sub-int v5, p4, p2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 1038
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1043
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 24
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 985
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v17

    .line 986
    .local v17, widthSpecMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 988
    .local v18, widthSpecSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 989
    .local v8, heightSpecMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 991
    .local v9, heightSpecSize:I
    if-eqz v17, :cond_0

    if-nez v8, :cond_1

    .line 992
    :cond_0
    new-instance v19, Ljava/lang/RuntimeException;

    const-string v20, "CellLayout cannot have UNSPECIFIED dimensions"

    invoke-direct/range {v19 .. v20}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 995
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v19, v0

    add-int/lit8 v14, v19, -0x1

    .line 996
    .local v14, numWidthGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v19, v0

    add-int/lit8 v13, v19, -0x1

    .line 998
    .local v13, numHeightGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    if-ltz v19, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    if-gez v19, :cond_6

    .line 999
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v20

    sub-int v7, v19, v20

    .line 1000
    .local v7, hSpace:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v9, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v16, v19, v20

    .line 1001
    .local v16, vSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v6, v7, v19

    .line 1002
    .local v6, hFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v15, v16, v19

    .line 1003
    .local v15, vFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mMaxGap:I

    move/from16 v20, v0

    if-lez v14, :cond_4

    div-int v19, v6, v14

    :goto_0
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 1004
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mMaxGap:I

    move/from16 v20, v0

    if-lez v13, :cond_5

    div-int v19, v15, v13

    :goto_1
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    .line 1005
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    move/from16 v23, v0

    invoke-virtual/range {v19 .. v23}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 1013
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :goto_2
    move/from16 v12, v18

    .line 1014
    .local v12, newWidth:I
    move v11, v9

    .line 1015
    .local v11, newHeight:I
    const/high16 v19, -0x8000

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 1016
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v12, v19, v20

    .line 1018
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v11, v19, v20

    .line 1020
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setMeasuredDimension(II)V

    .line 1023
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildCount()I

    move-result v5

    .line 1024
    .local v5, count:I
    const/4 v10, 0x0

    .local v10, i:I
    :goto_3
    if-ge v10, v5, :cond_7

    .line 1025
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1026
    .local v2, child:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v12, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingRight()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 1028
    .local v3, childWidthMeasureSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v11, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 1030
    .local v4, childheightMeasureSpec:I
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 1024
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 1003
    .end local v2           #child:Landroid/view/View;
    .end local v3           #childWidthMeasureSpec:I
    .end local v4           #childheightMeasureSpec:I
    .end local v5           #count:I
    .end local v10           #i:I
    .end local v11           #newHeight:I
    .end local v12           #newWidth:I
    .restart local v6       #hFreeSpace:I
    .restart local v7       #hSpace:I
    .restart local v15       #vFreeSpace:I
    .restart local v16       #vSpace:I
    :cond_4
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 1004
    :cond_5
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 1007
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 1008
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    goto/16 :goto_2

    .line 1032
    .restart local v5       #count:I
    .restart local v10       #i:I
    .restart local v11       #newHeight:I
    .restart local v12       #newWidth:I
    :cond_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setMeasuredDimension(II)V

    .line 1033
    return-void
.end method

.method public onMove(Landroid/view/View;IIII)V
    .locals 7
    .parameter "view"
    .parameter "newCellX"
    .parameter "newCellY"
    .parameter "newSpanX"
    .parameter "newSpanY"

    .prologue
    .line 3089
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 3090
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    const/4 v6, 0x1

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 3091
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 5
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    const/4 v1, 0x0

    .line 1047
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1048
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 1049
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundPadding:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundPadding:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundPadding:I

    sub-int v3, p1, v3

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundPadding:I

    sub-int v4, p2, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 1051
    return-void
.end method

.method pointToCellExact(II[I)V
    .locals 9
    .parameter "x"
    .parameter "y"
    .parameter "result"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 811
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 812
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v1

    .line 814
    .local v1, vStartPadding:I
    sub-int v4, p1, v0

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    add-int/2addr v5, v6

    div-int/2addr v4, v5

    aput v4, p3, v7

    .line 815
    sub-int v4, p2, v1

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    add-int/2addr v5, v6

    div-int/2addr v4, v5

    aput v4, p3, v8

    .line 817
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 818
    .local v2, xAxis:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 820
    .local v3, yAxis:I
    aget v4, p3, v7

    if-gez v4, :cond_0

    aput v7, p3, v7

    .line 821
    :cond_0
    aget v4, p3, v7

    if-lt v4, v2, :cond_1

    add-int/lit8 v4, v2, -0x1

    aput v4, p3, v7

    .line 822
    :cond_1
    aget v4, p3, v8

    if-gez v4, :cond_2

    aput v7, p3, v8

    .line 823
    :cond_2
    aget v4, p3, v8

    if-lt v4, v3, :cond_3

    add-int/lit8 v4, v3, -0x1

    aput v4, p3, v8

    .line 824
    :cond_3
    return-void
.end method

.method pointToCellRounded(II[I)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "result"

    .prologue
    .line 833
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p2

    invoke-virtual {p0, v0, v1, p3}, Lcom/cyanogenmod/trebuchet/CellLayout;->pointToCellExact(II[I)V

    .line 834
    return-void
.end method

.method public prepareChildForDrag(Landroid/view/View;)V
    .locals 0
    .parameter "child"

    .prologue
    .line 2455
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 2456
    return-void
.end method

.method public rectToCell(II[I)[I
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "result"

    .prologue
    .line 2990
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/CellLayout;->rectToCell(Landroid/content/res/Resources;II[I)[I

    move-result-object v0

    return-object v0
.end method

.method regionToCenterPoint(IIII[I)V
    .locals 7
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"

    .prologue
    .line 873
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 874
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v1

    .line 875
    .local v1, vStartPadding:I
    const/4 v2, 0x0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p1

    add-int/2addr v3, v0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int/2addr v4, p3

    add-int/lit8 v5, p3, -0x1

    iget v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    aput v3, p5, v2

    .line 877
    const/4 v2, 0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p2

    add-int/2addr v3, v1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    mul-int/2addr v4, p4

    add-int/lit8 v5, p4, -0x1

    iget v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    aput v3, p5, v2

    .line 879
    return-void
.end method

.method regionToRect(IIIILandroid/graphics/Rect;)V
    .locals 8
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "result"

    .prologue
    .line 889
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 890
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v3

    .line 891
    .local v3, vStartPadding:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    add-int/2addr v4, v5

    mul-int/2addr v4, p1

    add-int v1, v0, v4

    .line 892
    .local v1, left:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    add-int/2addr v4, v5

    mul-int/2addr v4, p2

    add-int v2, v3, v4

    .line 893
    .local v2, top:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int/2addr v4, p3

    add-int/lit8 v5, p3, -0x1

    iget v6, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    add-int/2addr v4, v1

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    mul-int/2addr v5, p4

    add-int/lit8 v6, p4, -0x1

    iget v7, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    add-int/2addr v5, v2

    invoke-virtual {p5, v1, v2, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 895
    return-void
.end method

.method public removeAllViews()V
    .locals 1

    .prologue
    .line 659
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->clearOccupiedCells()V

    .line 660
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeAllViews()V

    .line 661
    return-void
.end method

.method public removeAllViewsInLayout()V
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 666
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->clearOccupiedCells()V

    .line 667
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeAllViewsInLayout()V

    .line 669
    :cond_0
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 677
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 678
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeView(Landroid/view/View;)V

    .line 679
    return-void
.end method

.method public removeViewAt(I)V
    .locals 1
    .parameter "index"

    .prologue
    .line 683
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 684
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeViewAt(I)V

    .line 685
    return-void
.end method

.method public removeViewInLayout(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 689
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 690
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeViewInLayout(Landroid/view/View;)V

    .line 691
    return-void
.end method

.method public removeViewWithoutMarkingCells(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 672
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeView(Landroid/view/View;)V

    .line 673
    return-void
.end method

.method public removeViews(II)V
    .locals 2
    .parameter "start"
    .parameter "count"

    .prologue
    .line 695
    move v0, p1

    .local v0, i:I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    .line 696
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 695
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 698
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, p1, p2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeViews(II)V

    .line 699
    return-void
.end method

.method public removeViewsInLayout(II)V
    .locals 2
    .parameter "start"
    .parameter "count"

    .prologue
    .line 703
    move v0, p1

    .local v0, i:I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    .line 704
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 703
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 706
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v1, p1, p2}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->removeViewsInLayout(II)V

    .line 707
    return-void
.end method

.method protected resetOverscrollTransforms()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 409
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mScrollingTransformsDirty:Z

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setOverscrollTransformsDirty(Z)V

    .line 411
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTranslationX(F)V

    .line 412
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setRotationY(F)V

    .line 415
    invoke-virtual {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setOverScrollAmount(FZ)V

    .line 416
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotX(F)V

    .line 417
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMeasuredHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPivotY(F)V

    .line 418
    const/high16 v0, 0x44a0

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getScreenDensity()F

    move-result v1

    mul-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCameraDistance(F)V

    .line 420
    :cond_0
    return-void
.end method

.method public restoreInstanceState(Landroid/util/SparseArray;)V
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
    .line 597
    .local p1, states:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    .line 598
    return-void
.end method

.method revertTempState()V
    .locals 11

    .prologue
    const/4 v5, 0x0

    .line 2537
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->isItemPlacementDirty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2538
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v8

    .line 2539
    .local v8, count:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    if-ge v9, v8, :cond_2

    .line 2540
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, v9}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2541
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2542
    .local v10, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    iget v2, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    if-ne v0, v2, :cond_0

    iget v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    iget v2, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    if-eq v0, v2, :cond_1

    .line 2543
    :cond_0
    iget v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iput v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellX:I

    .line 2544
    iget v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iput v0, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->tmpCellY:I

    .line 2545
    iget v2, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v3, v10, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    const/16 v4, 0x96

    move-object v0, p0

    move v6, v5

    move v7, v5

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    .line 2539
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 2549
    .end local v1           #child:Landroid/view/View;
    .end local v10           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2550
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->setItemPlacementDirty(Z)V

    .line 2551
    .end local v8           #count:I
    .end local v9           #i:I
    :cond_3
    return-void
.end method

.method public scaleRect(Landroid/graphics/Rect;F)V
    .locals 2
    .parameter "r"
    .parameter "scale"

    .prologue
    const/high16 v1, 0x3f00

    .line 423
    const/high16 v0, 0x3f80

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    .line 424
    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 425
    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 426
    iget v0, p1, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 427
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 429
    :cond_0
    return-void
.end method

.method scaleRectAboutCenter(Landroid/graphics/Rect;Landroid/graphics/Rect;F)V
    .locals 4
    .parameter "in"
    .parameter "out"
    .parameter "scale"

    .prologue
    .line 433
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    .line 434
    .local v0, cx:I
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    .line 435
    .local v1, cy:I
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 436
    neg-int v2, v0

    neg-int v3, v1

    invoke-virtual {p2, v2, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 437
    invoke-virtual {p0, p2, p3}, Lcom/cyanogenmod/trebuchet/CellLayout;->scaleRect(Landroid/graphics/Rect;F)V

    .line 438
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 439
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 1079
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlpha:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 1080
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlpha:F

    .line 1081
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 1083
    :cond_0
    return-void
.end method

.method public setBackgroundAlphaMultiplier(F)V
    .locals 1
    .parameter "multiplier"

    .prologue
    .line 1068
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlphaMultiplier:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 1069
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mBackgroundAlphaMultiplier:F

    .line 1070
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 1072
    :cond_0
    return-void
.end method

.method setCellDimensions(IIII)V
    .locals 5
    .parameter "cellWidth"
    .parameter "cellHeight"
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 352
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    .line 353
    iput p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    .line 354
    iput p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 355
    iput p4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    .line 356
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 357
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->requestLayout()V

    .line 358
    return-void
.end method

.method setCellGaps(II)V
    .locals 0
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 904
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalWidthGap:I

    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    .line 905
    iput p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalHeightGap:I

    iput p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    .line 906
    return-void
.end method

.method protected setChildrenDrawingCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1055
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setChildrenDrawingCacheEnabled(Z)V

    .line 1056
    return-void
.end method

.method protected setChildrenDrawnWithCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1060
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1061
    return-void
.end method

.method public setChildrenScale(F)V
    .locals 0
    .parameter "childrenScale"

    .prologue
    .line 329
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mChildrenScale:F

    .line 330
    return-void
.end method

.method public setFolderLeaveBehindCell(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 580
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 581
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 582
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 583
    return-void
.end method

.method public setGridSize(II)V
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    .line 337
    iput p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    .line 338
    iput p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    .line 339
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOccupied:[[Z

    .line 340
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    .line 341
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 344
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalCellWidth:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    .line 345
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOriginalCellHeight:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    .line 346
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 348
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->requestLayout()V

    .line 349
    return-void
.end method

.method setIsDragOverlapping(Z)V
    .locals 1
    .parameter "isDragOverlapping"

    .prologue
    .line 394
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIsDragOverlapping:Z

    if-eq v0, p1, :cond_0

    .line 395
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mIsDragOverlapping:Z

    .line 396
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 398
    :cond_0
    return-void
.end method

.method setItemPlacementDirty(Z)V
    .locals 0
    .parameter "dirty"

    .prologue
    .line 2670
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mItemPlacementDirty:Z

    .line 2671
    return-void
.end method

.method public setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 613
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    .line 614
    return-void
.end method

.method setOverScrollAmount(FZ)V
    .locals 2
    .parameter "r"
    .parameter "left"

    .prologue
    .line 369
    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_1

    .line 370
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 375
    :cond_0
    :goto_0
    const/high16 v0, 0x437f

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundAlpha:I

    .line 376
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mForegroundAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 377
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate()V

    .line 378
    return-void

    .line 371
    :cond_1
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_0

    .line 372
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method protected setOverscrollTransformsDirty(Z)V
    .locals 0
    .parameter "dirty"

    .prologue
    .line 405
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mScrollingTransformsDirty:Z

    .line 406
    return-void
.end method

.method setPressedOrFocusedIcon(Lcom/cyanogenmod/trebuchet/BubbleTextView;)V
    .locals 2
    .parameter "icon"

    .prologue
    .line 383
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 384
    .local v0, oldIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 385
    if-eqz v0, :cond_0

    .line 386
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidateBubbleTextView(Lcom/cyanogenmod/trebuchet/BubbleTextView;)V

    .line 388
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v1, :cond_1

    .line 389
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mPressedOrFocusedIcon:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidateBubbleTextView(Lcom/cyanogenmod/trebuchet/BubbleTextView;)V

    .line 391
    :cond_1
    return-void
.end method

.method public setShortcutAndWidgetAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 1086
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildCount()I

    move-result v0

    .line 1087
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1088
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 1087
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1090
    :cond_0
    return-void
.end method

.method public setTagToCellInfoForPoint(II)V
    .locals 15
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 716
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 717
    .local v0, cellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mRect:Landroid/graphics/Rect;

    .line 718
    .local v5, frame:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScrollX()I

    move-result v11

    add-int v9, p1, v11

    .line 719
    .local v9, x:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getScrollY()I

    move-result v11

    add-int v10, p2, v11

    .line 720
    .local v10, y:I
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v3

    .line 722
    .local v3, count:I
    const/4 v4, 0x0

    .line 723
    .local v4, found:Z
    add-int/lit8 v6, v3, -0x1

    .local v6, i:I
    :goto_0
    if-ltz v6, :cond_1

    .line 724
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v11, v6}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 725
    .local v2, child:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 727
    .local v7, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v11

    if-eqz v11, :cond_3

    :cond_0
    iget-boolean v11, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->isLockedToGrid:Z

    if-eqz v11, :cond_3

    .line 729
    invoke-virtual {v2, v5}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 731
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v8

    .line 732
    .local v8, scale:F
    new-instance v5, Landroid/graphics/Rect;

    .end local v5           #frame:Landroid/graphics/Rect;
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v11

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v12

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v13

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v14

    invoke-direct {v5, v11, v12, v13, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 737
    .restart local v5       #frame:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingLeft()I

    move-result v11

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getPaddingTop()I

    move-result v12

    invoke-virtual {v5, v11, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 738
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v11, v11

    const/high16 v12, 0x3f80

    sub-float/2addr v12, v8

    mul-float/2addr v11, v12

    const/high16 v12, 0x4000

    div-float/2addr v11, v12

    float-to-int v11, v11

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x3f80

    sub-float/2addr v13, v8

    mul-float/2addr v12, v13

    const/high16 v13, 0x4000

    div-float/2addr v12, v13

    float-to-int v12, v12

    invoke-virtual {v5, v11, v12}, Landroid/graphics/Rect;->inset(II)V

    .line 741
    invoke-virtual {v5, v9, v10}, Landroid/graphics/Rect;->contains(II)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 742
    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 743
    iget v11, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellX:I

    .line 744
    iget v11, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellY:I

    .line 745
    iget v11, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellHSpan:I

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    .line 746
    iget v11, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellVSpan:I

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    .line 747
    const/4 v4, 0x1

    .line 753
    .end local v2           #child:Landroid/view/View;
    .end local v7           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    .end local v8           #scale:F
    :cond_1
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mLastDownOnOccupiedCell:Z

    .line 755
    if-nez v4, :cond_2

    .line 756
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpXY:[I

    .line 757
    .local v1, cellXY:[I
    invoke-virtual {p0, v9, v10, v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->pointToCellExact(II[I)V

    .line 759
    const/4 v11, 0x0

    iput-object v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 760
    const/4 v11, 0x0

    aget v11, v1, v11

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellX:I

    .line 761
    const/4 v11, 0x1

    aget v11, v1, v11

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cellY:I

    .line 762
    const/4 v11, 0x1

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanX:I

    .line 763
    const/4 v11, 0x1

    iput v11, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->spanY:I

    .line 765
    .end local v1           #cellXY:[I
    :cond_2
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setTag(Ljava/lang/Object;)V

    .line 766
    return-void

    .line 723
    .restart local v2       #child:Landroid/view/View;
    .restart local v7       #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_3
    add-int/lit8 v6, v6, -0x1

    goto/16 :goto_0
.end method

.method public setUseTempCoords(Z)V
    .locals 4
    .parameter "useTempCoords"

    .prologue
    .line 2428
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    .line 2429
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 2430
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mShortcutsAndWidgets:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    invoke-virtual {v3, v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2431
    .local v2, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iput-boolean p1, v2, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->useTmpCoords:Z

    .line 2429
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2433
    .end local v2           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 1

    .prologue
    .line 593
    const/4 v0, 0x0

    return v0
.end method

.method public showFolderAccept(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)V
    .locals 1
    .parameter "fra"

    .prologue
    .line 569
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 570
    return-void
.end method

.method simpleSwap(IIIIII[ILandroid/view/View;ZLcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
    .locals 20
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "direction"
    .parameter "dragView"
    .parameter "decX"
    .parameter "solution"

    .prologue
    .line 2161
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p10

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->copyCurrentStateToSolution(Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;Z)V

    .line 2164
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpOccupied:[[Z

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->copyOccupiedArray([[Z)V

    .line 2168
    const/4 v2, 0x2

    new-array v7, v2, [I

    .local v7, result:[I
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    .line 2169
    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v7

    .line 2173
    const/4 v2, 0x0

    aget v9, v7, v2

    const/4 v2, 0x1

    aget v10, v7, v2

    move-object/from16 v8, p0

    move/from16 v11, p5

    move/from16 v12, p6

    move-object/from16 v13, p7

    move-object/from16 v14, p8

    move-object/from16 v15, p10

    invoke-direct/range {v8 .. v15}, Lcom/cyanogenmod/trebuchet/CellLayout;->rearrangementExists(IIII[ILandroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Z

    move-result v19

    .line 2176
    .local v19, success:Z
    if-nez v19, :cond_3

    .line 2179
    move/from16 v0, p5

    move/from16 v1, p3

    if-le v0, v1, :cond_1

    move/from16 v0, p4

    move/from16 v1, p6

    if-eq v0, v1, :cond_0

    if-eqz p9, :cond_1

    .line 2180
    :cond_0
    add-int/lit8 v13, p5, -0x1

    const/16 v17, 0x0

    move-object/from16 v8, p0

    move/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v14, p6

    move-object/from16 v15, p7

    move-object/from16 v16, p8

    move-object/from16 v18, p10

    invoke-virtual/range {v8 .. v18}, Lcom/cyanogenmod/trebuchet/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    move-result-object p10

    .line 2194
    .end local p10
    :goto_0
    return-object p10

    .line 2182
    .restart local p10
    :cond_1
    move/from16 v0, p6

    move/from16 v1, p4

    if-le v0, v1, :cond_2

    .line 2183
    add-int/lit8 v14, p6, -0x1

    const/16 v17, 0x1

    move-object/from16 v8, p0

    move/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-object/from16 v15, p7

    move-object/from16 v16, p8

    move-object/from16 v18, p10

    invoke-virtual/range {v8 .. v18}, Lcom/cyanogenmod/trebuchet/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    move-result-object p10

    goto :goto_0

    .line 2186
    :cond_2
    const/4 v2, 0x0

    move-object/from16 v0, p10

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    goto :goto_0

    .line 2188
    :cond_3
    const/4 v2, 0x1

    move-object/from16 v0, p10

    iput-boolean v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    .line 2189
    const/4 v2, 0x0

    aget v2, v7, v2

    move-object/from16 v0, p10

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewX:I

    .line 2190
    const/4 v2, 0x1

    aget v2, v7, v2

    move-object/from16 v0, p10

    iput v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewY:I

    .line 2191
    move/from16 v0, p5

    move-object/from16 v1, p10

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    .line 2192
    move/from16 v0, p6

    move-object/from16 v1, p10

    iput v0, v1, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    goto :goto_0
.end method

.method visualizeDropLocation(Landroid/view/View;Landroid/graphics/Bitmap;IIIIIIZLandroid/graphics/Point;Landroid/graphics/Rect;)V
    .locals 15
    .parameter "v"
    .parameter "dragOutline"
    .parameter "originX"
    .parameter "originY"
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "resize"
    .parameter "dragOffset"
    .parameter "dragRegion"

    .prologue
    .line 1219
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v3, 0x0

    aget v10, v2, v3

    .line 1220
    .local v10, oldDragCellX:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v3, 0x1

    aget v11, v2, v3

    .line 1222
    .local v11, oldDragCellY:I
    if-eqz p1, :cond_1

    if-nez p10, :cond_1

    .line 1223
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCenter:Landroid/graphics/Point;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int v3, v3, p3

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int v4, v4, p4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 1228
    :goto_0
    if-nez p2, :cond_2

    if-nez p1, :cond_2

    .line 1283
    :cond_0
    :goto_1
    return-void

    .line 1225
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCenter:Landroid/graphics/Point;

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Point;->set(II)V

    goto :goto_0

    .line 1232
    :cond_2
    move/from16 v0, p5

    if-ne v0, v10, :cond_3

    move/from16 v0, p6

    if-eq v0, v11, :cond_0

    .line 1233
    :cond_3
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v3, 0x0

    aput p5, v2, v3

    .line 1234
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragCell:[I

    const/4 v3, 0x1

    aput p6, v2, v3

    .line 1236
    iget-object v14, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I

    .line 1237
    .local v14, topLeft:[I
    move/from16 v0, p5

    move/from16 v1, p6

    invoke-virtual {p0, v0, v1, v14}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToPoint(II[I)V

    .line 1239
    const/4 v2, 0x0

    aget v8, v14, v2

    .line 1240
    .local v8, left:I
    const/4 v2, 0x1

    aget v13, v14, v2

    .line 1242
    .local v13, top:I
    if-eqz p1, :cond_5

    if-nez p10, :cond_5

    .line 1245
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1246
    .local v9, lp:Landroid/view/ViewGroup$MarginLayoutParams;
    iget v2, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v8, v2

    .line 1247
    iget v2, v9, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v13, v2

    .line 1252
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v13, v2

    .line 1254
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int v2, v2, p7

    add-int/lit8 v3, p7, -0x1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v8, v2

    .line 1271
    .end local v9           #lp:Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_2
    iget v12, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    .line 1272
    .local v12, oldIndex:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    aget-object v2, v2, v12

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animateOut()V

    .line 1273
    add-int/lit8 v2, v12, 0x1

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v3, v3

    rem-int/2addr v2, v3

    iput v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    .line 1274
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    aget-object v7, v2, v3

    .line 1275
    .local v7, r:Landroid/graphics/Rect;
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    add-int/2addr v2, v8

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    add-int/2addr v3, v13

    invoke-virtual {v7, v8, v13, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 1276
    if-eqz p9, :cond_4

    move-object v2, p0

    move/from16 v3, p5

    move/from16 v4, p6

    move/from16 v5, p7

    move/from16 v6, p8

    .line 1277
    invoke-virtual/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/CellLayout;->cellToRect(IIIILandroid/graphics/Rect;)V

    .line 1280
    :cond_4
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    aget-object v2, v2, v3

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->setTag(Ljava/lang/Object;)V

    .line 1281
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAnims:[Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineCurrent:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animateIn()V

    goto/16 :goto_1

    .line 1257
    .end local v7           #r:Landroid/graphics/Rect;
    .end local v12           #oldIndex:I
    :cond_5
    if-eqz p10, :cond_6

    if-eqz p11, :cond_6

    .line 1260
    move-object/from16 v0, p10

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int v3, v3, p7

    add-int/lit8 v4, p7, -0x1

    iget v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    invoke-virtual/range {p11 .. p11}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    add-int/2addr v8, v2

    .line 1262
    move-object/from16 v0, p10

    iget v2, v0, Landroid/graphics/Point;->y:I

    add-int/2addr v13, v2

    goto :goto_2

    .line 1265
    :cond_6
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellWidth:I

    mul-int v2, v2, p7

    add-int/lit8 v3, p7, -0x1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v8, v2

    .line 1267
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mCellHeight:I

    mul-int v2, v2, p8

    add-int/lit8 v3, p8, -0x1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout;->mHeightGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v13, v2

    goto/16 :goto_2
.end method
