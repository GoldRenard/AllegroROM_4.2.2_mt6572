.class public Lcom/android/launcher2/CellLayout;
.super Landroid/view/ViewGroup;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/CellLayout$CellInfo;,
        Lcom/android/launcher2/CellLayout$LayoutParams;,
        Lcom/android/launcher2/CellLayout$CellLayoutAnimationController;,
        Lcom/android/launcher2/CellLayout$CellAndSpan;,
        Lcom/android/launcher2/CellLayout$ItemConfiguration;,
        Lcom/android/launcher2/CellLayout$ReorderHintAnimation;,
        Lcom/android/launcher2/CellLayout$ViewCluster;
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

.field static final TAG:Ljava/lang/String; = "CellLayout"

.field private static final sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

.field private static final sPaint:Landroid/graphics/Paint;


# instance fields
.field private mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

.field private mBackgroundAlpha:F

.field private mBackgroundAlphaMultiplier:F

.field private mBackgroundRect:Landroid/graphics/Rect;

.field private mCellHeight:I

.field private final mCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;

.field private mCellWidth:I

.field private mCountX:I

.field private mCountY:I

.field private mDirectionVector:[I

.field private final mDragCell:[I

.field private final mDragCenter:Landroid/graphics/Point;

.field private mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

.field private mDragOutlineAlphas:[F

.field private mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

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
            "Lcom/android/launcher2/FolderIcon$FolderRingAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private mForegroundAlpha:I

.field private mForegroundPadding:I

.field private mForegroundRect:Landroid/graphics/Rect;

.field private mHeightGap:I

.field private mHotseatScale:F

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

.field private mIsHotseat:Z

.field private mItemPlacementDirty:Z

.field private mLastDownOnOccupiedCell:Z

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mMaxGap:I

.field private mNormalBackground:Landroid/graphics/drawable/Drawable;

.field mOccupied:[[Z

.field private mOccupiedRect:Landroid/graphics/Rect;

.field private mOriginalHeightGap:I

.field private mOriginalWidthGap:I

.field private mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mOverScrollLeft:Landroid/graphics/drawable/Drawable;

.field private mOverScrollRight:Landroid/graphics/drawable/Drawable;

.field private mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

.field mPreviousReorderDirection:[I

.field private final mRect:Landroid/graphics/Rect;

.field private mReorderAnimators:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/launcher2/CellLayout$LayoutParams;",
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
            "Lcom/android/launcher2/CellLayout$ReorderHintAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

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
    .line 165
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    sput-object v0, Lcom/android/launcher2/CellLayout;->sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

    .line 167
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/android/launcher2/CellLayout;->sPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 170
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 171
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 174
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 175
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 17
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 178
    invoke-direct/range {p0 .. p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 76
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mScrollingTransformsDirty:Z

    .line 78
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mRect:Landroid/graphics/Rect;

    .line 79
    new-instance v11, Lcom/android/launcher2/CellLayout$CellInfo;

    invoke-direct {v11}, Lcom/android/launcher2/CellLayout$CellInfo;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    .line 83
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mTmpXY:[I

    .line 84
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    .line 85
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    .line 89
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mLastDownOnOccupiedCell:Z

    .line 93
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    .line 94
    const/4 v11, 0x2

    new-array v11, v11, [I

    fill-array-data v11, :array_0

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    .line 96
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mForegroundAlpha:I

    .line 98
    const/high16 v11, 0x3f80

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mBackgroundAlphaMultiplier:F

    .line 110
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mIsDragOverlapping:Z

    .line 111
    new-instance v11, Landroid/graphics/Point;

    invoke-direct {v11}, Landroid/graphics/Point;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragCenter:Landroid/graphics/Point;

    .line 115
    const/4 v11, 0x4

    new-array v11, v11, [Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    .line 116
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    new-array v11, v11, [F

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAlphas:[F

    .line 117
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    new-array v11, v11, [Lcom/android/launcher2/InterruptibleInOutAnimator;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    .line 121
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    .line 122
    new-instance v11, Landroid/graphics/Paint;

    invoke-direct {v11}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlinePaint:Landroid/graphics/Paint;

    .line 126
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    .line 128
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    .line 131
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mItemPlacementDirty:Z

    .line 134
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    .line 136
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mDragging:Z

    .line 141
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/launcher2/CellLayout;->mIsHotseat:Z

    .line 142
    const/high16 v11, 0x3f80

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mHotseatScale:F

    .line 158
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    .line 159
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    .line 160
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    .line 161
    const/4 v11, 0x2

    new-array v11, v11, [I

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    .line 406
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->temp:Landroid/graphics/Rect;

    .line 1335
    new-instance v11, Ljava/util/Stack;

    invoke-direct {v11}, Ljava/util/Stack;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    .line 179
    new-instance v11, Lcom/android/launcher2/DropTarget$DragEnforcer;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lcom/android/launcher2/DropTarget$DragEnforcer;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    .line 183
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/CellLayout;->setWillNotDraw(Z)V

    move-object/from16 v11, p1

    .line 184
    check-cast v11, Lcom/android/launcher2/Launcher;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 186
    sget-object v11, Lcom/android/launcher/R$styleable;->CellLayout:[I

    const/4 v12, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v1, v11, v2, v12}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 188
    .local v3, a:Landroid/content/res/TypedArray;
    const/4 v11, 0x0

    const/16 v12, 0xa

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    .line 189
    const/4 v11, 0x1

    const/16 v12, 0xa

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    .line 190
    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mOriginalWidthGap:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    .line 191
    const/4 v11, 0x3

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mOriginalHeightGap:I

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    .line 192
    const/4 v11, 0x4

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mMaxGap:I

    .line 193
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 194
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 195
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Z

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    .line 196
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Z

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    .line 197
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v12, 0x0

    const/16 v13, -0x64

    aput v13, v11, v12

    .line 198
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v12, 0x1

    const/16 v13, -0x64

    aput v13, v11, v12

    .line 200
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 202
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/CellLayout;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 204
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 205
    .local v8, res:Landroid/content/res/Resources;
    const v11, 0x7f0a0021

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v11

    int-to-float v11, v11

    const/high16 v12, 0x42c8

    div-float/2addr v11, v12

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mHotseatScale:F

    .line 207
    const v11, 0x7f020028

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    .line 208
    const v11, 0x7f020029

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    .line 210
    const v11, 0x7f02003e

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    .line 211
    const v11, 0x7f02003f

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    .line 212
    const v11, 0x7f0b0016

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mForegroundPadding:I

    .line 215
    const v11, 0x3df5c28f

    const v12, 0x7f0b0022

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    int-to-float v12, v12

    mul-float/2addr v11, v12

    move-object/from16 v0, p0

    iput v11, v0, Lcom/android/launcher2/CellLayout;->mReorderHintAnimationMagnitude:F

    .line 218
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 219
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 223
    new-instance v11, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v12, 0x4020

    invoke-direct {v11, v12}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    .line 226
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v14, 0x1

    const/4 v15, -0x1

    aput v15, v13, v14

    aput v15, v11, v12

    .line 227
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v11, v11

    if-ge v7, v11, :cond_0

    .line 228
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    new-instance v12, Landroid/graphics/Rect;

    const/4 v13, -0x1

    const/4 v14, -0x1

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-direct/range {v12 .. v16}, Landroid/graphics/Rect;-><init>(IIII)V

    aput-object v12, v11, v7

    .line 227
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 235
    :cond_0
    const v11, 0x7f0a0011

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .line 236
    .local v5, duration:I
    const/4 v6, 0x0

    .line 237
    .local v6, fromAlphaValue:F
    const v11, 0x7f0a0012

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v11

    int-to-float v10, v11

    .line 239
    .local v10, toAlphaValue:F
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAlphas:[F

    const/4 v12, 0x0

    invoke-static {v11, v12}, Ljava/util/Arrays;->fill([FF)V

    .line 241
    const/4 v7, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    array-length v11, v11

    if-ge v7, v11, :cond_1

    .line 242
    new-instance v4, Lcom/android/launcher2/InterruptibleInOutAnimator;

    int-to-long v11, v5

    const/4 v13, 0x0

    invoke-direct {v4, v11, v12, v13, v10}, Lcom/android/launcher2/InterruptibleInOutAnimator;-><init>(JFF)V

    .line 244
    .local v4, anim:Lcom/android/launcher2/InterruptibleInOutAnimator;
    invoke-virtual {v4}, Lcom/android/launcher2/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/launcher2/CellLayout;->mEaseOutInterpolator:Landroid/animation/TimeInterpolator;

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 245
    move v9, v7

    .line 246
    .local v9, thisIndex:I
    invoke-virtual {v4}, Lcom/android/launcher2/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    new-instance v12, Lcom/android/launcher2/CellLayout$1;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4, v9}, Lcom/android/launcher2/CellLayout$1;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/InterruptibleInOutAnimator;I)V

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 270
    invoke-virtual {v4}, Lcom/android/launcher2/InterruptibleInOutAnimator;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object v11

    new-instance v12, Lcom/android/launcher2/CellLayout$2;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4}, Lcom/android/launcher2/CellLayout$2;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/InterruptibleInOutAnimator;)V

    invoke-virtual {v11, v12}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 278
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    aput-object v4, v11, v7

    .line 241
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 281
    .end local v4           #anim:Lcom/android/launcher2/InterruptibleInOutAnimator;
    .end local v9           #thisIndex:I
    :cond_1
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    .line 282
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    .line 284
    new-instance v11, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 285
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 286
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/CellLayout;->addView(Landroid/view/View;)V

    .line 287
    return-void

    .line 94
    nop

    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/launcher2/CellLayout;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAlphas:[F

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/launcher2/CellLayout;)[Landroid/graphics/Rect;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/launcher2/CellLayout;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/launcher2/CellLayout;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/launcher2/CellLayout;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    return v0
.end method

.method static synthetic access$500(Lcom/android/launcher2/CellLayout;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/launcher2/CellLayout;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mReorderHintAnimationMagnitude:F

    return v0
.end method

.method static synthetic access$700(Lcom/android/launcher2/CellLayout;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    return-object v0
.end method

.method private addViewToTempLocation(Landroid/view/View;Landroid/graphics/Rect;[ILcom/android/launcher2/CellLayout$ItemConfiguration;)Z
    .locals 11
    .parameter "v"
    .parameter "rectOccupiedByPotentialDrop"
    .parameter "direction"
    .parameter "currentState"

    .prologue
    .line 1565
    iget-object v0, p4, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1566
    .local v9, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    const/4 v10, 0x0

    .line 1567
    .local v10, success:Z
    iget v1, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1568
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v1, 0x1

    invoke-direct {p0, p2, v0, v1}, Lcom/android/launcher2/CellLayout;->markCellsForRect(Landroid/graphics/Rect;[[ZZ)V

    .line 1570
    iget v1, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    iget-object v6, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v7, 0x0

    check-cast v7, [[Z

    iget-object v8, p0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object v0, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v8}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I[[Z[[Z[I)[I

    .line 1572
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    if-ltz v0, :cond_0

    .line 1573
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    .line 1574
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iput v0, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    .line 1575
    const/4 v10, 0x1

    .line 1577
    :cond_0
    iget v1, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v2, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v3, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v4, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v6, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1578
    return v10
.end method

.method private addViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z
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
            "Lcom/android/launcher2/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1913
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1

    const/16 v23, 0x1

    .line 1965
    :cond_0
    return v23

    .line 1915
    :cond_1
    const/16 v23, 0x0

    .line 1916
    .local v23, success:Z
    const/16 v17, 0x0

    .line 1918
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

    .line 1919
    .local v25, v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1920
    .local v18, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    if-nez v17, :cond_2

    .line 1921
    new-instance v17, Landroid/graphics/Rect;

    .end local v17           #boundingRect:Landroid/graphics/Rect;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    move-object/from16 v0, v17

    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v17       #boundingRect:Landroid/graphics/Rect;
    goto :goto_0

    .line 1923
    :cond_2
    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;->union(IIII)V

    goto :goto_0

    .line 1928
    .end local v18           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
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

    .line 1929
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1930
    .restart local v18       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v4, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v8, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_1

    .line 1933
    .end local v18           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
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

    .line 1934
    .local v7, blockOccupied:[[Z
    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v24, v0

    .line 1935
    .local v24, top:I
    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v22, v0

    .line 1938
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

    .line 1939
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1940
    .restart local v18       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    sub-int v3, v2, v22

    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    sub-int v4, v2, v24

    move-object/from16 v0, v18

    iget v5, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v6, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    const/4 v8, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_2

    .line 1943
    .end local v18           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->markCellsForRect(Landroid/graphics/Rect;[[ZZ)V

    .line 1945
    move-object/from16 v0, v17

    iget v9, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, v17

    iget v10, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->width()I

    move-result v11

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Rect;->height()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v16, v0

    move-object/from16 v8, p0

    move-object/from16 v13, p3

    move-object v15, v7

    invoke-direct/range {v8 .. v16}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I[[Z[[Z[I)[I

    .line 1949
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ltz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ltz v2, :cond_7

    .line 1950
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/Rect;->left:I

    sub-int v19, v2, v3

    .line 1951
    .local v19, deltaX:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/Rect;->top:I

    sub-int v20, v2, v3

    .line 1952
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

    .line 1953
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1954
    .restart local v18       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    add-int v2, v2, v19

    move-object/from16 v0, v18

    iput v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    .line 1955
    move-object/from16 v0, v18

    iget v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    add-int v2, v2, v20

    move-object/from16 v0, v18

    iput v2, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    goto :goto_3

    .line 1957
    .end local v18           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v25           #v:Landroid/view/View;
    :cond_6
    const/16 v23, 0x1

    .line 1961
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

    .line 1962
    .restart local v25       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1963
    .restart local v18       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    move-object/from16 v0, v18

    iget v9, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    move-object/from16 v0, v18

    iget v10, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    move-object/from16 v0, v18

    iget v11, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    move-object/from16 v0, v18

    iget v12, v0, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v14, 0x1

    move-object/from16 v8, p0

    invoke-direct/range {v8 .. v14}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_4
.end method

.method private animateItemsToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;Z)V
    .locals 15
    .parameter "solution"
    .parameter "dragView"
    .parameter "commitDragView"

    .prologue
    .line 2231
    iget-object v14, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    check-cast v14, [[Z

    .line 2232
    .local v14, occupied:[[Z
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v12, v1, :cond_1

    .line 2233
    const/4 v13, 0x0

    .local v13, j:I
    :goto_1
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v13, v1, :cond_0

    .line 2234
    aget-object v1, v14, v12

    const/4 v3, 0x0

    aput-boolean v3, v1, v13

    .line 2233
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 2232
    :cond_0
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 2238
    .end local v13           #j:I
    :cond_1
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v11

    .line 2239
    .local v11, childCount:I
    const/4 v12, 0x0

    :goto_2
    if-ge v12, v11, :cond_4

    .line 2240
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v12}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2241
    .local v2, child:Landroid/view/View;
    move-object/from16 v0, p2

    if-ne v2, v0, :cond_3

    .line 2239
    :cond_2
    :goto_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 2242
    :cond_3
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 2243
    .local v10, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    if-eqz v10, :cond_2

    .line 2244
    iget v3, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v4, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    const/16 v5, 0x96

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher2/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    .line 2246
    iget v4, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    const/4 v9, 0x1

    move-object v3, p0

    move-object v8, v14

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 2249
    .end local v2           #child:Landroid/view/View;
    .end local v10           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    :cond_4
    if-eqz p3, :cond_5

    .line 2250
    move-object/from16 v0, p1

    iget v4, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewX:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewY:I

    move-object/from16 v0, p1

    iget v6, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    move-object/from16 v0, p1

    iget v7, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

    const/4 v9, 0x1

    move-object v3, p0

    move-object v8, v14

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 2253
    :cond_5
    return-void
.end method

.method private attemptPushInDirection(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z
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
            "Lcom/android/launcher2/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, intersectingViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1977
    aget v3, p3, v2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    aget v4, p3, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    add-int/2addr v3, v4

    if-le v3, v1, :cond_2

    .line 1980
    aget v0, p3, v1

    .line 1981
    .local v0, temp:I
    aput v2, p3, v1

    .line 1983
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2066
    .end local v0           #temp:I
    :cond_0
    :goto_0
    return v1

    .line 1987
    .restart local v0       #temp:I
    :cond_1
    aput v0, p3, v1

    .line 1988
    aget v0, p3, v2

    .line 1989
    aput v2, p3, v2

    .line 1991
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1996
    aput v0, p3, v2

    .line 1999
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2000
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2001
    aget v0, p3, v1

    .line 2002
    aput v2, p3, v1

    .line 2003
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2008
    aput v0, p3, v1

    .line 2009
    aget v0, p3, v2

    .line 2010
    aput v2, p3, v2

    .line 2011
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2016
    aput v0, p3, v2

    .line 2017
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2018
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    :goto_1
    move v1, v2

    .line 2066
    goto :goto_0

    .line 2023
    .end local v0           #temp:I
    :cond_2
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2028
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2029
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2030
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2035
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2036
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2042
    aget v0, p3, v1

    .line 2043
    .restart local v0       #temp:I
    aget v3, p3, v2

    aput v3, p3, v1

    .line 2044
    aput v0, p3, v2

    .line 2045
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2051
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2052
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2053
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher2/CellLayout;->pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2058
    aget v3, p3, v2

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v2

    .line 2059
    aget v3, p3, v1

    mul-int/lit8 v3, v3, -0x1

    aput v3, p3, v1

    .line 2062
    aget v0, p3, v1

    .line 2063
    aget v3, p3, v2

    aput v3, p3, v1

    .line 2064
    aput v0, p3, v2

    goto :goto_1
.end method

.method private beginOrAdjustHintAnimations(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;I)V
    .locals 13
    .parameter "solution"
    .parameter "dragView"
    .parameter "delay"

    .prologue
    .line 2257
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v10

    .line 2258
    .local v10, childCount:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v10, :cond_2

    .line 2259
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v11}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2260
    .local v2, child:Landroid/view/View;
    if-ne v2, p2, :cond_1

    .line 2258
    :cond_0
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 2261
    :cond_1
    iget-object v1, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 2262
    .local v9, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2263
    .local v12, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    if-eqz v9, :cond_0

    .line 2264
    new-instance v0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    iget v3, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v4, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v5, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v6, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v7, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v8, v9, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;-><init>(Lcom/android/launcher2/CellLayout;Landroid/view/View;IIIIII)V

    .line 2266
    .local v0, rha:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;
    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->animate()V

    goto :goto_1

    .line 2269
    .end local v0           #rha:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;
    .end local v2           #child:Landroid/view/View;
    .end local v9           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v12           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_2
    return-void
.end method

.method private clearOccupiedCells()V
    .locals 4

    .prologue
    .line 3087
    const/4 v0, 0x0

    .local v0, x:I
    :goto_0
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v0, v2, :cond_1

    .line 3088
    const/4 v1, 0x0

    .local v1, y:I
    :goto_1
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v1, v2, :cond_0

    .line 3089
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    aget-object v2, v2, v0

    const/4 v3, 0x0

    aput-boolean v3, v2, v1

    .line 3088
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3087
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3092
    .end local v1           #y:I
    :cond_1
    return-void
.end method

.method private clearTagCellInfo()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 781
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    .line 782
    .local v0, cellInfo:Lcom/android/launcher2/CellLayout$CellInfo;
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 783
    iput v2, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellX:I

    .line 784
    iput v2, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellY:I

    .line 785
    iput v3, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    .line 786
    iput v3, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    .line 787
    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->setTag(Ljava/lang/Object;)V

    .line 788
    return-void
.end method

.method private commitTempPlacement()V
    .locals 8

    .prologue
    .line 2394
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget v6, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v2, v6, :cond_1

    .line 2395
    const/4 v4, 0x0

    .local v4, j:I
    :goto_1
    iget v6, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v4, v6, :cond_0

    .line 2396
    iget-object v6, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    aget-object v6, v6, v2

    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    aget-object v7, v7, v2

    aget-boolean v7, v7, v4

    aput-boolean v7, v6, v4

    .line 2395
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2394
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2399
    .end local v4           #j:I
    :cond_1
    iget-object v6, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v6}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v1

    .line 2400
    .local v1, childCount:I
    const/4 v2, 0x0

    :goto_2
    if-ge v2, v1, :cond_5

    .line 2401
    iget-object v6, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v6, v2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2402
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2403
    .local v5, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/ItemInfo;

    .line 2406
    .local v3, info:Lcom/android/launcher2/ItemInfo;
    if-eqz v3, :cond_4

    .line 2407
    iget v6, v3, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v7, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    if-ne v6, v7, :cond_2

    iget v6, v3, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v7, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    if-ne v6, v7, :cond_2

    iget v6, v3, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v7, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    if-ne v6, v7, :cond_2

    iget v6, v3, Lcom/android/launcher2/ItemInfo;->spanY:I

    iget v7, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    if-eq v6, v7, :cond_3

    .line 2409
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, v3, Lcom/android/launcher2/ItemInfo;->requiresDbUpdate:Z

    .line 2411
    :cond_3
    iget v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    iput v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iput v6, v3, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 2412
    iget v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    iput v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iput v6, v3, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 2413
    iget v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iput v6, v3, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 2414
    iget v6, v5, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    iput v6, v3, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 2400
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 2417
    .end local v0           #child:Landroid/view/View;
    .end local v3           #info:Lcom/android/launcher2/ItemInfo;
    .end local v5           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_5
    iget-object v6, p0, Lcom/android/launcher2/CellLayout;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v6}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/android/launcher2/Workspace;->updateItemLocationsInDatabase(Lcom/android/launcher2/CellLayout;)V

    .line 2418
    return-void
.end method

.method private completeAndClearReorderHintAnimations()V
    .locals 3

    .prologue
    .line 2387
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

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

    check-cast v0, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;

    .line 2388
    .local v0, a:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;
    #calls: Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->completeAnimationImmediately()V
    invoke-static {v0}, Lcom/android/launcher2/CellLayout$ReorderHintAnimation;->access$800(Lcom/android/launcher2/CellLayout$ReorderHintAnimation;)V

    goto :goto_0

    .line 2390
    .end local v0           #a:Lcom/android/launcher2/CellLayout$ReorderHintAnimation;
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mShakeAnimators:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 2391
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

    .line 2128
    div-float v2, p2, p1

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->atan(D)D

    move-result-wide v0

    .line 2130
    .local v0, angle:D
    aput v4, p3, v4

    .line 2131
    aput v4, p3, v7

    .line 2132
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpl-double v2, v2, v5

    if-lez v2, :cond_0

    .line 2133
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    aput v2, p3, v4

    .line 2135
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpl-double v2, v2, v5

    if-lez v2, :cond_1

    .line 2136
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    aput v2, p3, v7

    .line 2138
    :cond_1
    return-void
.end method

.method private copyCurrentStateToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Z)V
    .locals 10
    .parameter "solution"
    .parameter "temp"

    .prologue
    .line 2189
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v7

    .line 2190
    .local v7, childCount:I
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    if-ge v8, v7, :cond_1

    .line 2191
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v8}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 2192
    .local v6, child:Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2194
    .local v9, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    if-eqz p2, :cond_0

    .line 2195
    new-instance v0, Lcom/android/launcher2/CellLayout$CellAndSpan;

    iget v2, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    iget v3, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    iget v4, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iget v5, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher2/CellLayout$CellAndSpan;-><init>(Lcom/android/launcher2/CellLayout;IIII)V

    .line 2199
    .local v0, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    :goto_1
    invoke-virtual {p1, v6, v0}, Lcom/android/launcher2/CellLayout$ItemConfiguration;->add(Landroid/view/View;Lcom/android/launcher2/CellLayout$CellAndSpan;)V

    .line 2190
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2197
    .end local v0           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    :cond_0
    new-instance v0, Lcom/android/launcher2/CellLayout$CellAndSpan;

    iget v2, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v3, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v4, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iget v5, v9, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher2/CellLayout$CellAndSpan;-><init>(Lcom/android/launcher2/CellLayout;IIII)V

    .restart local v0       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    goto :goto_1

    .line 2201
    .end local v0           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v6           #child:Landroid/view/View;
    .end local v9           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_1
    return-void
.end method

.method private copyOccupiedArray([[Z)V
    .locals 4
    .parameter "occupied"

    .prologue
    .line 2141
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v0, v2, :cond_1

    .line 2142
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v1, v2, :cond_0

    .line 2143
    aget-object v2, p1, v0

    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    aget-object v3, v3, v0

    aget-boolean v3, v3, v1

    aput-boolean v3, v2, v1

    .line 2142
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2141
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2146
    .end local v1           #j:I
    :cond_1
    return-void
.end method

.method private copySolutionToTempState(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;)V
    .locals 13
    .parameter "solution"
    .parameter "dragView"

    .prologue
    const/4 v6, 0x1

    .line 2204
    const/4 v10, 0x0

    .local v10, i:I
    :goto_0
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v10, v0, :cond_1

    .line 2205
    const/4 v11, 0x0

    .local v11, j:I
    :goto_1
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v11, v0, :cond_0

    .line 2206
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    aget-object v0, v0, v10

    const/4 v1, 0x0

    aput-boolean v1, v0, v11

    .line 2205
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 2204
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 2210
    .end local v11           #j:I
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v9

    .line 2211
    .local v9, childCount:I
    const/4 v10, 0x0

    :goto_2
    if-ge v10, v9, :cond_4

    .line 2212
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, v10}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 2213
    .local v8, child:Landroid/view/View;
    if-ne v8, p2, :cond_3

    .line 2211
    :cond_2
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 2214
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2215
    .local v12, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget-object v0, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 2216
    .local v7, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    if-eqz v7, :cond_2

    .line 2217
    iget v0, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iput v0, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    .line 2218
    iget v0, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iput v0, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    .line 2219
    iget v0, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iput v0, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 2220
    iget v0, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    iput v0, v12, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 2221
    iget v1, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v2, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v3, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v4, v7, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 2224
    .end local v7           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v8           #child:Landroid/view/View;
    .end local v12           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_4
    iget v1, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewX:I

    iget v2, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewY:I

    iget v3, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    iget v4, p1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 2226
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
    .line 1514
    if-eqz p8, :cond_1

    move-object/from16 v5, p8

    .line 1515
    .local v5, bestXY:[I
    :goto_0
    const v4, 0x7f7fffff

    .line 1516
    .local v4, bestDistance:F
    const/high16 v3, -0x8000

    .line 1518
    .local v3, bestDirectionScore:I
    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 1519
    .local v6, countX:I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 1521
    .local v7, countY:I
    const/16 v16, 0x0

    .local v16, y:I
    :goto_1
    add-int/lit8 v17, p4, -0x1

    sub-int v17, v7, v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_a

    .line 1523
    const/4 v15, 0x0

    .local v15, x:I
    :goto_2
    add-int/lit8 v17, p3, -0x1

    sub-int v17, v6, v17

    move/from16 v0, v17

    if-ge v15, v0, :cond_9

    .line 1525
    const/4 v13, 0x0

    .local v13, i:I
    :goto_3
    move/from16 v0, p3

    if-ge v13, v0, :cond_4

    .line 1526
    const/4 v14, 0x0

    .local v14, j:I
    :goto_4
    move/from16 v0, p4

    if-ge v14, v0, :cond_3

    .line 1527
    add-int v17, v15, v13

    aget-object v17, p6, v17

    add-int v18, v16, v14

    aget-boolean v17, v17, v18

    if-eqz v17, :cond_2

    if-eqz p7, :cond_0

    aget-object v17, p7, v13

    aget-boolean v17, v17, v14

    if-eqz v17, :cond_2

    .line 1523
    .end local v14           #j:I
    :cond_0
    :goto_5
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 1514
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

    .line 1526
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

    .line 1525
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 1533
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

    .line 1535
    .local v11, distance:F
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    .line 1536
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

    invoke-direct {v0, v1, v2, v8}, Lcom/android/launcher2/CellLayout;->computeDirectionVector(FF[I)V

    .line 1539
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

    .line 1541
    .local v9, curDirectionScore:I
    const/4 v12, 0x0

    .line 1542
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

    .line 1544
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

    .line 1547
    :cond_7
    move v4, v11

    .line 1548
    move v3, v9

    .line 1549
    const/16 v17, 0x0

    aput v15, v5, v17

    .line 1550
    const/16 v17, 0x1

    aput v16, v5, v17

    goto/16 :goto_5

    .line 1542
    .end local v10           #directionMatches:Z
    :cond_8
    const/4 v10, 0x0

    goto :goto_6

    .line 1521
    .end local v8           #curDirection:[I
    .end local v9           #curDirectionScore:I
    .end local v11           #distance:F
    .end local v12           #exactDirectionOnly:Z
    .end local v13           #i:I
    :cond_9
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_1

    .line 1556
    .end local v15           #x:I
    :cond_a
    const v17, 0x7f7fffff

    cmpl-float v17, v4, v17

    if-nez v17, :cond_b

    .line 1557
    const/16 v17, 0x0

    const/16 v18, -0x1

    aput v18, v5, v17

    .line 1558
    const/16 v17, 0x1

    const/16 v18, -0x1

    aput v18, v5, v17

    .line 1560
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

    .line 3065
    const/4 v4, 0x0

    .local v4, y:I
    :goto_0
    if-ge v4, p4, :cond_7

    .line 3066
    const/4 v3, 0x0

    .local v3, x:I
    :goto_1
    if-ge v3, p3, :cond_6

    .line 3067
    aget-object v7, p5, v3

    aget-boolean v7, v7, v4

    if-nez v7, :cond_1

    move v0, v5

    .line 3068
    .local v0, available:Z
    :goto_2
    move v1, v3

    .local v1, i:I
    :goto_3
    add-int v7, v3, p1

    add-int/lit8 v7, v7, -0x1

    if-ge v1, v7, :cond_0

    if-ge v3, p3, :cond_0

    .line 3069
    move v2, v4

    .local v2, j:I
    :goto_4
    add-int v7, v4, p2

    add-int/lit8 v7, v7, -0x1

    if-ge v2, v7, :cond_4

    if-ge v4, p4, :cond_4

    .line 3070
    if-eqz v0, :cond_2

    aget-object v7, p5, v1

    aget-boolean v7, v7, v2

    if-nez v7, :cond_2

    move v0, v5

    .line 3071
    :goto_5
    if-nez v0, :cond_3

    .line 3075
    .end local v2           #j:I
    :cond_0
    if-eqz v0, :cond_5

    .line 3076
    aput v3, p0, v6

    .line 3077
    aput v4, p0, v5

    .line 3083
    .end local v0           #available:Z
    .end local v1           #i:I
    .end local v3           #x:I
    :goto_6
    return v5

    .restart local v3       #x:I
    :cond_1
    move v0, v6

    .line 3067
    goto :goto_2

    .restart local v0       #available:Z
    .restart local v1       #i:I
    .restart local v2       #j:I
    :cond_2
    move v0, v6

    .line 3070
    goto :goto_5

    .line 3069
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 3068
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 3066
    .end local v2           #j:I
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 3065
    .end local v0           #available:Z
    .end local v1           #i:I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v3           #x:I
    :cond_7
    move v5, v6

    .line 3083
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
    .line 2461
    const/4 v2, 0x2

    new-array v7, v2, [I

    .local v7, targetDestination:[I
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    .line 2463
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    .line 2464
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 2465
    .local v13, dragRect:Landroid/graphics/Rect;
    const/4 v2, 0x0

    aget v9, v7, v2

    const/4 v2, 0x1

    aget v10, v7, v2

    move-object/from16 v8, p0

    move/from16 v11, p3

    move/from16 v12, p4

    invoke-virtual/range {v8 .. v13}, Lcom/android/launcher2/CellLayout;->regionToRect(IIIILandroid/graphics/Rect;)V

    .line 2466
    invoke-virtual {v13}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    sub-int v2, p1, v2

    invoke-virtual {v13}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    sub-int v3, p2, v3

    invoke-virtual {v13, v2, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 2468
    new-instance v20, Landroid/graphics/Rect;

    invoke-direct/range {v20 .. v20}, Landroid/graphics/Rect;-><init>()V

    .line 2469
    .local v20, dropRegionRect:Landroid/graphics/Rect;
    const/4 v2, 0x0

    aget v15, v7, v2

    const/4 v2, 0x1

    aget v16, v7, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    move-object/from16 v14, p0

    move/from16 v17, p3

    move/from16 v18, p4

    move-object/from16 v19, p5

    invoke-direct/range {v14 .. v21}, Lcom/android/launcher2/CellLayout;->getViewsIntersectingRegion(IIIILandroid/view/View;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 2472
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->width()I

    move-result v24

    .line 2473
    .local v24, dropRegionSpanX:I
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->height()I

    move-result v25

    .line 2475
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

    invoke-virtual/range {v15 .. v20}, Lcom/android/launcher2/CellLayout;->regionToRect(IIIILandroid/graphics/Rect;)V

    .line 2478
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    sub-int v2, v2, p1

    div-int v22, v2, p3

    .line 2479
    .local v22, deltaX:I
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    sub-int v2, v2, p2

    div-int v23, v2, p4

    .line 2481
    .local v23, deltaY:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v0, v24

    if-eq v0, v2, :cond_0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v0, p3

    if-ne v0, v2, :cond_1

    .line 2482
    :cond_0
    const/16 v22, 0x0

    .line 2484
    :cond_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v0, v25

    if-eq v0, v2, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v0, p4

    if-ne v0, v2, :cond_3

    .line 2485
    :cond_2
    const/16 v23, 0x0

    .line 2488
    :cond_3
    if-nez v22, :cond_4

    if-nez v23, :cond_4

    .line 2490
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput v3, p6, v2

    .line 2491
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, p6, v2

    .line 2495
    :goto_0
    return-void

    .line 2493
    :cond_4
    move/from16 v0, v22

    int-to-float v2, v0

    move/from16 v0, v23

    int-to-float v3, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher2/CellLayout;->computeDirectionVector(FF[I)V

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
    .line 924
    add-int/lit8 v9, p4, -0x1

    .line 925
    .local v9, numWidthGaps:I
    add-int/lit8 v8, p5, -0x1

    .line 936
    .local v8, numHeightGaps:I
    const v17, 0x7f0b000a

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 937
    .local v7, maxGap:I
    if-nez p6, :cond_2

    .line 938
    const v17, 0x7f0b0052

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 939
    .local v3, cellWidth:I
    const v17, 0x7f0b0054

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 940
    .local v2, cellHeight:I
    const v17, 0x7f0b0056

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v16

    .line 941
    .local v16, widthGap:I
    const v17, 0x7f0b0058

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 942
    .local v6, heightGap:I
    const v17, 0x7f0b0043

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 943
    .local v11, paddingLeft:I
    const v17, 0x7f0b0045

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 944
    .local v12, paddingRight:I
    const v17, 0x7f0b0047

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 945
    .local v13, paddingTop:I
    const v17, 0x7f0b0049

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 958
    .local v10, paddingBottom:I
    :goto_0
    if-ltz v16, :cond_0

    if-gez v6, :cond_1

    .line 959
    :cond_0
    sub-int v17, p2, v11

    sub-int v5, v17, v12

    .line 960
    .local v5, hSpace:I
    sub-int v17, p3, v13

    sub-int v15, v17, v10

    .line 961
    .local v15, vSpace:I
    mul-int v17, p4, v3

    sub-int v4, v5, v17

    .line 962
    .local v4, hFreeSpace:I
    mul-int v17, p5, v2

    sub-int v14, v15, v17

    .line 963
    .local v14, vFreeSpace:I
    if-lez v9, :cond_3

    div-int v17, v4, v9

    :goto_1
    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 964
    if-lez v8, :cond_4

    div-int v17, v14, v8

    :goto_2
    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 966
    .end local v4           #hFreeSpace:I
    .end local v5           #hSpace:I
    .end local v14           #vFreeSpace:I
    .end local v15           #vSpace:I
    :cond_1
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v3, v2, v1, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 967
    return-void

    .line 948
    .end local v2           #cellHeight:I
    .end local v3           #cellWidth:I
    .end local v6           #heightGap:I
    .end local v10           #paddingBottom:I
    .end local v11           #paddingLeft:I
    .end local v12           #paddingRight:I
    .end local v13           #paddingTop:I
    .end local v16           #widthGap:I
    :cond_2
    const v17, 0x7f0b0053

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 949
    .restart local v3       #cellWidth:I
    const v17, 0x7f0b0055

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 950
    .restart local v2       #cellHeight:I
    const v17, 0x7f0b0057

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v16

    .line 951
    .restart local v16       #widthGap:I
    const v17, 0x7f0b0059

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 952
    .restart local v6       #heightGap:I
    const v17, 0x7f0b0042

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 953
    .restart local v11       #paddingLeft:I
    const v17, 0x7f0b0044

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 954
    .restart local v12       #paddingRight:I
    const v17, 0x7f0b0046

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 955
    .restart local v13       #paddingTop:I
    const v17, 0x7f0b0048

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .restart local v10       #paddingBottom:I
    goto/16 :goto_0

    .line 963
    .restart local v4       #hFreeSpace:I
    .restart local v5       #hSpace:I
    .restart local v14       #vFreeSpace:I
    .restart local v15       #vSpace:I
    :cond_3
    const/16 v17, 0x0

    goto :goto_1

    .line 964
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
    .line 2500
    .local p7, intersectingViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    if-eqz p6, :cond_0

    .line 2501
    add-int v7, p1, p3

    add-int v8, p2, p4

    move-object/from16 v0, p6

    invoke-virtual {v0, p1, p2, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 2503
    :cond_0
    invoke-virtual/range {p7 .. p7}, Ljava/util/ArrayList;->clear()V

    .line 2504
    new-instance v5, Landroid/graphics/Rect;

    add-int v7, p1, p3

    add-int v8, p2, p4

    invoke-direct {v5, p1, p2, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2505
    .local v5, r0:Landroid/graphics/Rect;
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 2506
    .local v6, r1:Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v7}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v2

    .line 2507
    .local v2, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v2, :cond_3

    .line 2508
    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v7, v3}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2509
    .local v1, child:Landroid/view/View;
    move-object/from16 v0, p5

    if-ne v1, v0, :cond_2

    .line 2507
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2510
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2511
    .local v4, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v7, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v8, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v9, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v10, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    add-int/2addr v9, v10

    iget v10, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v11, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    add-int/2addr v10, v11

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 2512
    invoke-static {v5, v6}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2513
    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2514
    if-eqz p6, :cond_1

    .line 2515
    move-object/from16 v0, p6

    invoke-virtual {v0, v6}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    goto :goto_1

    .line 2519
    .end local v1           #child:Landroid/view/View;
    .end local v4           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_3
    return-void
.end method

.method static heightInLandscape(Landroid/content/res/Resources;I)I
    .locals 4
    .parameter "r"
    .parameter "numCells"

    .prologue
    .line 304
    const v2, 0x7f0b007a

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 305
    .local v0, cellHeight:I
    const v2, 0x7f0b007b

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f0b007c

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 308
    .local v1, minGap:I
    add-int/lit8 v2, p1, -0x1

    mul-int/2addr v2, v1

    mul-int v3, v0, p1

    add-int/2addr v2, v3

    return v2
.end method

.method private invalidateBubbleTextView(Lcom/android/launcher2/BubbleTextView;)V
    .locals 6
    .parameter "icon"

    .prologue
    .line 337
    invoke-virtual {p1}, Lcom/android/launcher2/BubbleTextView;->getPressedOrFocusedBackgroundPadding()I

    move-result v0

    .line 338
    .local v0, padding:I
    invoke-virtual {p1}, Lcom/android/launcher2/BubbleTextView;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v1, v0

    invoke-virtual {p1}, Lcom/android/launcher2/BubbleTextView;->getTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v2, v0

    invoke-virtual {p1}, Lcom/android/launcher2/BubbleTextView;->getRight()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v3, v0

    invoke-virtual {p1}, Lcom/android/launcher2/BubbleTextView;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/android/launcher2/CellLayout;->invalidate(IIII)V

    .line 342
    return-void
.end method

.method private lazyInitTempRectStack()V
    .locals 3

    .prologue
    .line 1337
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1338
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    mul-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    .line 1339
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1338
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1342
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
    .line 1969
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    move-object v0, p0

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 1970
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
    .line 3119
    if-ltz p1, :cond_0

    if-gez p2, :cond_1

    .line 3125
    :cond_0
    return-void

    .line 3120
    :cond_1
    move v0, p1

    .local v0, x:I
    :goto_0
    add-int v2, p1, p3

    if-ge v0, v2, :cond_0

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge v0, v2, :cond_0

    .line 3121
    move v1, p2

    .local v1, y:I
    :goto_1
    add-int v2, p2, p4

    if-ge v1, v2, :cond_2

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge v1, v2, :cond_2

    .line 3122
    aget-object v2, p5, v0

    aput-boolean p6, v2, v1

    .line 3121
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3120
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private pushViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z
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
            "Lcom/android/launcher2/CellLayout$ItemConfiguration;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1819
    .local p1, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v11, Lcom/android/launcher2/CellLayout$ViewCluster;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-direct {v11, v0, v1, v2}, Lcom/android/launcher2/CellLayout$ViewCluster;-><init>(Lcom/android/launcher2/CellLayout;Ljava/util/ArrayList;Lcom/android/launcher2/CellLayout$ItemConfiguration;)V

    .line 1820
    .local v11, cluster:Lcom/android/launcher2/CellLayout$ViewCluster;
    invoke-virtual {v11}, Lcom/android/launcher2/CellLayout$ViewCluster;->getBoundingRect()Landroid/graphics/Rect;

    move-result-object v12

    .line 1823
    .local v12, clusterRect:Landroid/graphics/Rect;
    const/4 v13, 0x0

    .line 1827
    .local v13, fail:Z
    const/4 v3, 0x0

    aget v3, p3, v3

    if-gez v3, :cond_1

    .line 1828
    const/16 v19, 0x0

    .line 1829
    .local v19, whichEdge:I
    iget v3, v12, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/Rect;->left:I

    sub-int v17, v3, v4

    .line 1842
    .local v17, pushDistance:I
    :goto_0
    if-gtz v17, :cond_4

    .line 1843
    const/4 v14, 0x0

    .line 1908
    :cond_0
    return v14

    .line 1830
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_1
    const/4 v3, 0x0

    aget v3, p3, v3

    if-lez v3, :cond_2

    .line 1831
    const/16 v19, 0x2

    .line 1832
    .restart local v19       #whichEdge:I
    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, v12, Landroid/graphics/Rect;->left:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1833
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_2
    const/4 v3, 0x1

    aget v3, p3, v3

    if-gez v3, :cond_3

    .line 1834
    const/16 v19, 0x1

    .line 1835
    .restart local v19       #whichEdge:I
    iget v3, v12, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/Rect;->top:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1837
    .end local v17           #pushDistance:I
    .end local v19           #whichEdge:I
    :cond_3
    const/16 v19, 0x3

    .line 1838
    .restart local v19       #whichEdge:I
    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    iget v4, v12, Landroid/graphics/Rect;->top:I

    sub-int v17, v3, v4

    .restart local v17       #pushDistance:I
    goto :goto_0

    .line 1847
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

    .line 1848
    .local v18, v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1849
    .local v10, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_1

    .line 1855
    .end local v10           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v18           #v:Landroid/view/View;
    :cond_5
    invoke-virtual/range {p5 .. p5}, Lcom/android/launcher2/CellLayout$ItemConfiguration;->save()V

    .line 1860
    move/from16 v0, v19

    invoke-virtual {v11, v0}, Lcom/android/launcher2/CellLayout$ViewCluster;->sortConfigurationForEdgePush(I)V

    .line 1862
    :goto_2
    if-lez v17, :cond_9

    if-nez v13, :cond_9

    .line 1863
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

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

    .line 1867
    .restart local v18       #v:Landroid/view/View;
    iget-object v3, v11, Lcom/android/launcher2/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move-object/from16 v0, v18

    move-object/from16 v1, p4

    if-eq v0, v1, :cond_6

    .line 1868
    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Lcom/android/launcher2/CellLayout$ViewCluster;->isViewTouchingEdge(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1869
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    check-cast v16, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 1870
    .local v16, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    move-object/from16 v0, v16

    iget-boolean v3, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    if-nez v3, :cond_8

    .line 1872
    const/4 v13, 0x1

    .line 1883
    .end local v16           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v18           #v:Landroid/view/View;
    :cond_7
    add-int/lit8 v17, v17, -0x1

    .line 1887
    const/4 v3, 0x1

    move/from16 v0, v19

    invoke-virtual {v11, v0, v3}, Lcom/android/launcher2/CellLayout$ViewCluster;->shift(II)V

    goto :goto_2

    .line 1875
    .restart local v16       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .restart local v18       #v:Landroid/view/View;
    :cond_8
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lcom/android/launcher2/CellLayout$ViewCluster;->addView(Landroid/view/View;)V

    .line 1876
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1879
    .restart local v10       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_3

    .line 1890
    .end local v10           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v16           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v18           #v:Landroid/view/View;
    :cond_9
    const/4 v14, 0x0

    .line 1891
    .local v14, foundSolution:Z
    invoke-virtual {v11}, Lcom/android/launcher2/CellLayout$ViewCluster;->getBoundingRect()Landroid/graphics/Rect;

    move-result-object v12

    .line 1895
    if-nez v13, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->left:I

    if-ltz v3, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-gt v3, v4, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->top:I

    if-ltz v3, :cond_a

    iget v3, v12, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-gt v3, v4, :cond_a

    .line 1897
    const/4 v14, 0x1

    .line 1903
    :goto_4
    iget-object v3, v11, Lcom/android/launcher2/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/View;

    .line 1904
    .restart local v18       #v:Landroid/view/View;
    move-object/from16 v0, p5

    iget-object v3, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 1905
    .restart local v10       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    iget v4, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v5, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v6, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    iget v7, v10, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    const/4 v9, 0x1

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_5

    .line 1899
    .end local v10           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v18           #v:Landroid/view/View;
    :cond_a
    invoke-virtual/range {p5 .. p5}, Lcom/android/launcher2/CellLayout$ItemConfiguration;->restore()V

    goto :goto_4
.end method

.method private rearrangementExists(IIII[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z
    .locals 15
    .parameter "cellX"
    .parameter "cellY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "direction"
    .parameter "ignoreView"
    .parameter "solution"

    .prologue
    .line 2072
    if-ltz p1, :cond_0

    if-gez p2, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 2120
    :goto_0
    return v2

    .line 2074
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 2075
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    add-int v3, p1, p3

    add-int v4, p2, p4

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v2, v0, v1, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 2078
    if-eqz p6, :cond_2

    .line 2079
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    move-object/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 2080
    .local v8, c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    if-eqz v8, :cond_2

    .line 2081
    move/from16 v0, p1

    iput v0, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    .line 2082
    move/from16 v0, p2

    iput v0, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    .line 2085
    .end local v8           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    :cond_2
    new-instance v12, Landroid/graphics/Rect;

    add-int v2, p1, p3

    add-int v3, p2, p4

    move/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v12, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2086
    .local v12, r0:Landroid/graphics/Rect;
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 2087
    .local v13, r1:Landroid/graphics/Rect;
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

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

    .line 2088
    .local v9, child:Landroid/view/View;
    move-object/from16 v0, p6

    if-eq v9, v0, :cond_3

    .line 2089
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/launcher2/CellLayout$CellAndSpan;

    .line 2090
    .restart local v8       #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2091
    .local v11, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v2, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v3, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v4, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->x:I

    iget v5, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    iget v5, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->y:I

    iget v6, v8, Lcom/android/launcher2/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    invoke-virtual {v13, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 2092
    invoke-static {v12, v13}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2093
    iget-boolean v2, v11, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    if-nez v2, :cond_4

    .line 2094
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2096
    :cond_4
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2103
    .end local v8           #c:Lcom/android/launcher2/CellLayout$CellAndSpan;
    .end local v9           #child:Landroid/view/View;
    .end local v11           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_5
    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/launcher2/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object v2, p0

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->attemptPushInDirection(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2105
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2109
    :cond_6
    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/launcher2/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object v2, p0

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->addViewsToTempLocation(Ljava/util/ArrayList;Landroid/graphics/Rect;[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2111
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 2115
    :cond_7
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_8
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/View;

    .line 2116
    .local v14, v:Landroid/view/View;
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mOccupiedRect:Landroid/graphics/Rect;

    move-object/from16 v0, p5

    move-object/from16 v1, p7

    invoke-direct {p0, v14, v2, v0, v1}, Lcom/android/launcher2/CellLayout;->addViewToTempLocation(Landroid/view/View;Landroid/graphics/Rect;[ILcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 2117
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 2120
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

    .line 3002
    const v5, 0x7f0b0079

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 3003
    .local v1, actualWidth:I
    const v5, 0x7f0b007a

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 3004
    .local v0, actualHeight:I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 3007
    .local v2, smallerSize:I
    int-to-float v5, p1

    int-to-float v6, v2

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 3008
    .local v3, spanX:I
    int-to-float v5, p2

    int-to-float v6, v2

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v4, v5

    .line 3010
    .local v4, spanY:I
    if-nez p3, :cond_0

    .line 3011
    const/4 v5, 0x2

    new-array p3, v5, [I

    .end local p3
    aput v3, p3, v7

    aput v4, p3, v8

    .line 3015
    :goto_0
    return-object p3

    .line 3013
    .restart local p3
    :cond_0
    aput v3, p3, v7

    .line 3014
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
    .line 1345
    .local p1, used:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    :goto_0
    invoke-virtual {p1}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1346
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1348
    :cond_0
    return-void
.end method

.method static widthInPortrait(Landroid/content/res/Resources;I)I
    .locals 4
    .parameter "r"
    .parameter "numCells"

    .prologue
    .line 293
    const v2, 0x7f0b0079

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 294
    .local v0, cellWidth:I
    const v2, 0x7f0b007b

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f0b007c

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 297
    .local v1, minGap:I
    add-int/lit8 v2, p1, -0x1

    mul-int/2addr v2, v1

    mul-int v3, v0, p1

    add-int/2addr v2, v3

    return v2
.end method


# virtual methods
.method public addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z
    .locals 5
    .parameter "child"
    .parameter "index"
    .parameter "childId"
    .parameter "params"
    .parameter "markCells"

    .prologue
    .line 607
    move-object v1, p4

    .line 610
    .local v1, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    instance-of v3, p1, Lcom/android/launcher2/BubbleTextView;

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 611
    check-cast v0, Lcom/android/launcher2/BubbleTextView;

    .line 613
    .local v0, bubbleChild:Lcom/android/launcher2/BubbleTextView;
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 614
    .local v2, res:Landroid/content/res/Resources;
    iget-boolean v3, p0, Lcom/android/launcher2/CellLayout;->mIsHotseat:Z

    if-eqz v3, :cond_4

    .line 615
    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/launcher2/BubbleTextView;->setTextColor(I)V

    .line 621
    .end local v0           #bubbleChild:Lcom/android/launcher2/BubbleTextView;
    .end local v2           #res:Landroid/content/res/Resources;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildrenScale()F

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleX(F)V

    .line 622
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildrenScale()F

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleY(F)V

    .line 626
    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    if-ltz v3, :cond_5

    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_5

    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    if-ltz v3, :cond_5

    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_5

    .line 629
    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    if-gez v3, :cond_1

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iput v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    .line 630
    :cond_1
    iget v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    if-gez v3, :cond_2

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    iput v3, v1, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    .line 632
    :cond_2
    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    .line 634
    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v3, p1, p2, v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 636
    if-eqz p5, :cond_3

    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;)V

    .line 638
    :cond_3
    const/4 v3, 0x1

    .line 640
    :goto_1
    return v3

    .line 617
    .restart local v0       #bubbleChild:Lcom/android/launcher2/BubbleTextView;
    .restart local v2       #res:Landroid/content/res/Resources;
    :cond_4
    const v3, 0x7f080006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/launcher2/BubbleTextView;->setTextColor(I)V

    goto :goto_0

    .line 640
    .end local v0           #bubbleChild:Lcom/android/launcher2/BubbleTextView;
    .end local v2           #res:Landroid/content/res/Resources;
    :cond_5
    const/4 v3, 0x0

    goto :goto_1
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
    .line 1090
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 1091
    .local v9, clc:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    .line 1092
    .local v11, occupied:[[Z
    if-nez p6, :cond_0

    .line 1093
    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    .line 1096
    :cond_0
    invoke-virtual {v9, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_5

    .line 1097
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 1098
    .local v3, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/ItemInfo;

    .line 1101
    .local v10, info:Lcom/android/launcher2/ItemInfo;
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1102
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 1103
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1106
    :cond_1
    iget v4, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    .line 1107
    .local v4, oldX:I
    iget v6, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    .line 1108
    .local v6, oldY:I
    if-eqz p7, :cond_2

    .line 1109
    iget v1, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    aget-object v1, v11, v1

    iget v2, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    const/4 v8, 0x0

    aput-boolean v8, v1, v2

    .line 1110
    aget-object v1, v11, p2

    const/4 v2, 0x1

    aput-boolean v2, v1, p3

    .line 1112
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1113
    if-eqz p6, :cond_3

    .line 1114
    iput p2, v10, Lcom/android/launcher2/ItemInfo;->cellX:I

    iput p2, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    .line 1115
    move/from16 v0, p3

    iput v0, v10, Lcom/android/launcher2/ItemInfo;->cellY:I

    move/from16 v0, p3

    iput v0, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 1120
    :goto_0
    invoke-virtual {v9, v3}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setupLp(Lcom/android/launcher2/CellLayout$LayoutParams;)V

    .line 1121
    const/4 v1, 0x0

    iput-boolean v1, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1122
    iget v5, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    .line 1123
    .local v5, newX:I
    iget v7, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    .line 1125
    .local v7, newY:I
    iput v4, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->x:I

    .line 1126
    iput v6, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->y:I

    .line 1129
    if-ne v4, v5, :cond_4

    if-ne v6, v7, :cond_4

    .line 1130
    const/4 v1, 0x1

    iput-boolean v1, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    .line 1131
    const/4 v1, 0x1

    .line 1169
    .end local v3           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v4           #oldX:I
    .end local v5           #newX:I
    .end local v6           #oldY:I
    .end local v7           #newY:I
    .end local v10           #info:Lcom/android/launcher2/ItemInfo;
    :goto_1
    return v1

    .line 1117
    .restart local v3       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .restart local v4       #oldX:I
    .restart local v6       #oldY:I
    .restart local v10       #info:Lcom/android/launcher2/ItemInfo;
    :cond_3
    iput p2, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    .line 1118
    move/from16 v0, p3

    iput v0, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    goto :goto_0

    .line 1134
    .restart local v5       #newX:I
    .restart local v7       #newY:I
    :cond_4
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v12

    .line 1135
    .local v12, va:Landroid/animation/ValueAnimator;
    move/from16 v0, p4

    int-to-long v1, v0

    invoke-virtual {v12, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1136
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mReorderAnimators:Ljava/util/HashMap;

    invoke-virtual {v1, v3, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1138
    new-instance v1, Lcom/android/launcher2/CellLayout$3;

    move-object v2, p0

    move-object v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/android/launcher2/CellLayout$3;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$LayoutParams;IIIILandroid/view/View;)V

    invoke-virtual {v12, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1147
    new-instance v1, Lcom/android/launcher2/CellLayout$4;

    invoke-direct {v1, p0, v3, p1}, Lcom/android/launcher2/CellLayout$4;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$LayoutParams;Landroid/view/View;)V

    invoke-virtual {v12, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1165
    move/from16 v0, p5

    int-to-long v1, v0

    invoke-virtual {v12, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 1166
    invoke-virtual {v12}, Landroid/animation/ValueAnimator;->start()V

    .line 1167
    const/4 v1, 0x1

    goto :goto_1

    .line 1169
    .end local v3           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v4           #oldX:I
    .end local v5           #newX:I
    .end local v6           #oldY:I
    .end local v7           #newY:I
    .end local v10           #info:Lcom/android/launcher2/ItemInfo;
    .end local v12           #va:Landroid/animation/ValueAnimator;
    :cond_5
    const/4 v1, 0x0

    goto :goto_1

    .line 1134
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public buildHardwareLayer()V
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->buildLayer()V

    .line 321
    return-void
.end method

.method public calculateSpans(Lcom/android/launcher2/ItemInfo;)V
    .locals 5
    .parameter "info"

    .prologue
    const/4 v4, 0x1

    .line 3032
    instance-of v3, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;

    if-eqz v3, :cond_0

    move-object v3, p1

    .line 3033
    check-cast v3, Lcom/android/launcher2/LauncherAppWidgetInfo;

    iget v1, v3, Lcom/android/launcher2/LauncherAppWidgetInfo;->minWidth:I

    .local v1, minWidth:I
    move-object v3, p1

    .line 3034
    check-cast v3, Lcom/android/launcher2/LauncherAppWidgetInfo;

    iget v0, v3, Lcom/android/launcher2/LauncherAppWidgetInfo;->minHeight:I

    .line 3043
    .local v0, minHeight:I
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v0, v3}, Lcom/android/launcher2/CellLayout;->rectToCell(II[I)[I

    move-result-object v2

    .line 3044
    .local v2, spans:[I
    const/4 v3, 0x0

    aget v3, v2, v3

    iput v3, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 3045
    aget v3, v2, v4

    iput v3, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 3046
    .end local v0           #minHeight:I
    .end local v1           #minWidth:I
    .end local v2           #spans:[I
    :goto_1
    return-void

    .line 3035
    :cond_0
    instance-of v3, p1, Lcom/android/launcher2/PendingAddWidgetInfo;

    if-eqz v3, :cond_1

    move-object v3, p1

    .line 3036
    check-cast v3, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget v1, v3, Lcom/android/launcher2/PendingAddWidgetInfo;->minWidth:I

    .restart local v1       #minWidth:I
    move-object v3, p1

    .line 3037
    check-cast v3, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget v0, v3, Lcom/android/launcher2/PendingAddWidgetInfo;->minHeight:I

    .restart local v0       #minHeight:I
    goto :goto_0

    .line 3040
    .end local v0           #minHeight:I
    .end local v1           #minWidth:I
    :cond_1
    iput v4, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    iput v4, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    goto :goto_1
.end method

.method public cancelLongPress()V
    .locals 3

    .prologue
    .line 579
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 582
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildCount()I

    move-result v1

    .line 583
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 584
    invoke-virtual {p0, v2}, Lcom/android/launcher2/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 585
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 583
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 587
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public cellSpansToSize(II)[I
    .locals 5
    .parameter "hSpans"
    .parameter "vSpans"

    .prologue
    .line 3019
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 3020
    .local v0, size:[I
    const/4 v1, 0x0

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int/2addr v2, p1

    add-int/lit8 v3, p1, -0x1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 3021
    const/4 v1, 0x1

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    mul-int/2addr v2, p2

    add-int/lit8 v3, p2, -0x1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 3022
    return-object v0
.end method

.method cellToCenterPoint(II[I)V
    .locals 6
    .parameter "cellX"
    .parameter "cellY"
    .parameter "result"

    .prologue
    const/4 v3, 0x1

    .line 851
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, v3

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 852
    return-void
.end method

.method cellToPoint(II[I)V
    .locals 5
    .parameter "cellX"
    .parameter "cellY"
    .parameter "result"

    .prologue
    .line 835
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 836
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v1

    .line 838
    .local v1, vStartPadding:I
    const/4 v2, 0x0

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p1

    add-int/2addr v3, v0

    aput v3, p3, v2

    .line 839
    const/4 v2, 0x1

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p2

    add-int/2addr v3, v1

    aput v3, p3, v2

    .line 840
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
    .line 2970
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    .line 2971
    .local v2, cellWidth:I
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    .line 2972
    .local v1, cellHeight:I
    iget v8, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    .line 2973
    .local v8, widthGap:I
    iget v5, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    .line 2975
    .local v5, heightGap:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v3

    .line 2976
    .local v3, hStartPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v6

    .line 2978
    .local v6, vStartPadding:I
    mul-int v11, p3, v2

    add-int/lit8 v12, p3, -0x1

    mul-int/2addr v12, v8

    add-int v7, v11, v12

    .line 2979
    .local v7, width:I
    mul-int v11, p4, v1

    add-int/lit8 v12, p4, -0x1

    mul-int/2addr v12, v5

    add-int v4, v11, v12

    .line 2981
    .local v4, height:I
    add-int v11, v2, v8

    mul-int/2addr v11, p1

    add-int v9, v3, v11

    .line 2982
    .local v9, x:I
    add-int v11, v1, v5

    mul-int/2addr v11, p2

    add-int v10, v6, v11

    .line 2984
    .local v10, y:I
    add-int v11, v9, v7

    add-int v12, v10, v4

    move-object/from16 v0, p5

    invoke-virtual {v0, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 2985
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 3152
    instance-of v0, p1, Lcom/android/launcher2/CellLayout$LayoutParams;

    return v0
.end method

.method public clearDragOutlines()V
    .locals 6

    .prologue
    .line 1271
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    .line 1272
    .local v0, oldIndex:I
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/android/launcher2/InterruptibleInOutAnimator;->animateOut()V

    .line 1273
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v4, 0x1

    const/4 v5, -0x1

    aput v5, v3, v4

    aput v5, v1, v2

    .line 1274
    return-void
.end method

.method public clearFolderLeaveBehind()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 563
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x0

    aput v2, v0, v1

    .line 564
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 565
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 566
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
    .line 2580
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object p8

    .line 2582
    if-nez p9, :cond_0

    .line 2583
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 p9, v0

    .line 2589
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

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    const/16 v3, -0x64

    if-eq v2, v3, :cond_a

    .line 2591
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2592
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2594
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_3

    .line 2595
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    const/16 v4, -0x64

    aput v4, v2, v3

    .line 2596
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x1

    const/16 v4, -0x64

    aput v4, v2, v3

    .line 2604
    :cond_3
    :goto_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    const/4 v11, 0x1

    new-instance v12, Lcom/android/launcher2/CellLayout$ItemConfiguration;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v2}, Lcom/android/launcher2/CellLayout$ItemConfiguration;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$1;)V

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v2 .. v12}, Lcom/android/launcher2/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;

    move-result-object v16

    .line 2608
    .local v16, swapSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    new-instance v10, Lcom/android/launcher2/CellLayout$ItemConfiguration;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v2}, Lcom/android/launcher2/CellLayout$ItemConfiguration;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$1;)V

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    invoke-virtual/range {v2 .. v10}, Lcom/android/launcher2/CellLayout;->findConfigurationNoShuffle(IIIIIILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;

    move-result-object v15

    .line 2611
    .local v15, noShuffleSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    const/4 v13, 0x0

    .line 2612
    .local v13, finalSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    move-object/from16 v0, v16

    iget-boolean v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v2, :cond_b

    invoke-virtual/range {v16 .. v16}, Lcom/android/launcher2/CellLayout$ItemConfiguration;->area()I

    move-result v2

    invoke-virtual {v15}, Lcom/android/launcher2/CellLayout$ItemConfiguration;->area()I

    move-result v3

    if-lt v2, v3, :cond_b

    .line 2613
    move-object/from16 v13, v16

    .line 2618
    :cond_4
    :goto_1
    const/4 v14, 0x1

    .line 2620
    .local v14, foundSolution:Z
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setUseTempCoords(Z)V

    .line 2623
    if-eqz v13, :cond_e

    .line 2624
    const/4 v2, 0x0

    iget v3, v13, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewX:I

    aput v3, p8, v2

    .line 2625
    const/4 v2, 0x1

    iget v3, v13, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewY:I

    aput v3, p8, v2

    .line 2626
    const/4 v2, 0x0

    iget v3, v13, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    aput v3, p9, v2

    .line 2627
    const/4 v2, 0x1

    iget v3, v13, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

    aput v3, p9, v2

    .line 2632
    if-eqz p10, :cond_5

    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_5

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_7

    .line 2634
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1}, Lcom/android/launcher2/CellLayout;->copySolutionToTempState(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;)V

    .line 2636
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setItemPlacementDirty(Z)V

    .line 2637
    const/4 v2, 0x1

    move/from16 v0, p10

    if-ne v0, v2, :cond_c

    const/4 v2, 0x1

    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1, v2}, Lcom/android/launcher2/CellLayout;->animateItemsToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;Z)V

    .line 2639
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_6

    const/4 v2, 0x2

    move/from16 v0, p10

    if-ne v0, v2, :cond_d

    .line 2641
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->commitTempPlacement()V

    .line 2642
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2643
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setItemPlacementDirty(Z)V

    .line 2654
    :cond_7
    :goto_3
    const/4 v2, 0x1

    move/from16 v0, p10

    if-eq v0, v2, :cond_8

    if-nez v14, :cond_9

    .line 2655
    :cond_8
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/CellLayout;->setUseTempCoords(Z)V

    .line 2658
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->requestLayout()V

    .line 2659
    return-object p8

    .line 2599
    .end local v13           #finalSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    .end local v14           #foundSolution:Z
    .end local v15           #noShuffleSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    .end local v16           #swapSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    :cond_a
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher2/CellLayout;->getDirectionVectorForDrop(IIIILandroid/view/View;[I)V

    .line 2600
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    aput v4, v2, v3

    .line 2601
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mPreviousReorderDirection:[I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/CellLayout;->mDirectionVector:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    aput v4, v2, v3

    goto/16 :goto_0

    .line 2614
    .restart local v13       #finalSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    .restart local v15       #noShuffleSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    .restart local v16       #swapSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    :cond_b
    iget-boolean v2, v15, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v2, :cond_4

    .line 2615
    move-object v13, v15

    goto/16 :goto_1

    .line 2637
    .restart local v14       #foundSolution:Z
    :cond_c
    const/4 v2, 0x0

    goto :goto_2

    .line 2645
    :cond_d
    const/16 v2, 0x96

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v13, v1, v2}, Lcom/android/launcher2/CellLayout;->beginOrAdjustHintAnimations(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;I)V

    goto :goto_3

    .line 2650
    :cond_e
    const/4 v14, 0x0

    .line 2651
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
    .line 2548
    const/4 v4, 0x2

    new-array v9, v4, [I

    .local v9, pixelXY:[I
    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    .line 2549
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher2/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 2552
    const/4 v4, 0x0

    aget v11, v9, v4

    const/4 v4, 0x1

    aget v12, v9, v4

    const/16 v19, 0x1

    new-instance v20, Lcom/android/launcher2/CellLayout$ItemConfiguration;

    const/4 v4, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/android/launcher2/CellLayout$ItemConfiguration;-><init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$1;)V

    move-object/from16 v10, p0

    move/from16 v13, p3

    move/from16 v14, p4

    move/from16 v15, p3

    move/from16 v16, p4

    move-object/from16 v17, p6

    move-object/from16 v18, p5

    invoke-virtual/range {v10 .. v20}, Lcom/android/launcher2/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;

    move-result-object v21

    .line 2555
    .local v21, swapSolution:Lcom/android/launcher2/CellLayout$ItemConfiguration;
    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setUseTempCoords(Z)V

    .line 2556
    if-eqz v21, :cond_0

    move-object/from16 v0, v21

    iget-boolean v4, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    if-eqz v4, :cond_0

    .line 2560
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/CellLayout;->copySolutionToTempState(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;)V

    .line 2561
    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setItemPlacementDirty(Z)V

    .line 2562
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    move/from16 v3, p7

    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->animateItemsToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;Z)V

    .line 2564
    if-eqz p7, :cond_1

    .line 2565
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->commitTempPlacement()V

    .line 2566
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2567
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/launcher2/CellLayout;->setItemPlacementDirty(Z)V

    .line 2572
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v4}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->requestLayout()V

    .line 2574
    :cond_0
    move-object/from16 v0, v21

    iget-boolean v4, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    return v4

    .line 2569
    :cond_1
    const/16 v4, 0x96

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2, v4}, Lcom/android/launcher2/CellLayout;->beginOrAdjustHintAnimations(Lcom/android/launcher2/CellLayout$ItemConfiguration;Landroid/view/View;I)V

    goto :goto_0
.end method

.method public disableHardwareLayers()V
    .locals 3

    .prologue
    .line 316
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    const/4 v1, 0x0

    sget-object v2, Lcom/android/launcher2/CellLayout;->sPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 317
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .parameter "canvas"

    .prologue
    .line 535
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 536
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mForegroundAlpha:I

    if-lez v1, :cond_0

    .line 537
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 538
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/NinePatchDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    .line 539
    .local v0, p:Landroid/graphics/Paint;
    sget-object v1, Lcom/android/launcher2/CellLayout;->sAddBlendMode:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 540
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 541
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 543
    .end local v0           #p:Landroid/graphics/Paint;
    :cond_0
    return-void
.end method

.method public enableHardwareLayers()V
    .locals 3

    .prologue
    .line 312
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    const/4 v1, 0x2

    sget-object v2, Lcom/android/launcher2/CellLayout;->sPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 313
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

    .line 1182
    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 1183
    .local v1, countX:I
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 1187
    .local v2, countY:I
    invoke-virtual {p0, p1, p2, p5}, Lcom/android/launcher2/CellLayout;->pointToCellRounded(II[I)V

    .line 1190
    aget v4, p5, v5

    add-int/2addr v4, p3

    sub-int v3, v4, v1

    .line 1191
    .local v3, rightOverhang:I
    if-lez v3, :cond_0

    .line 1192
    aget v4, p5, v5

    sub-int/2addr v4, v3

    aput v4, p5, v5

    .line 1194
    :cond_0
    aget v4, p5, v5

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p5, v5

    .line 1195
    aget v4, p5, v6

    add-int/2addr v4, p4

    sub-int v0, v4, v2

    .line 1196
    .local v0, bottomOverhang:I
    if-lez v0, :cond_1

    .line 1197
    aget v4, p5, v6

    sub-int/2addr v4, v0

    aput v4, p5, v6

    .line 1199
    :cond_1
    aget v4, p5, v6

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, p5, v6

    .line 1200
    return-void
.end method

.method existsEmptyCell()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 2786
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, v1}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

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

    .line 2803
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

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

    .line 2817
    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    move-object v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

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
    .line 2835
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->findCellForSpanThatIntersectsIgnoring([IIIIILandroid/view/View;[[Z)Z

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
    .line 2845
    move-object/from16 v0, p6

    move-object/from16 v1, p7

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 2847
    const/4 v4, 0x0

    .line 2849
    .local v4, foundCell:Z
    :goto_0
    const/4 v7, 0x0

    .line 2850
    .local v7, startX:I
    if-ltz p4, :cond_0

    .line 2851
    add-int/lit8 v11, p2, -0x1

    sub-int v11, p4, v11

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 2853
    :cond_0
    iget v11, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    add-int/lit8 v12, p2, -0x1

    sub-int v2, v11, v12

    .line 2854
    .local v2, endX:I
    if-ltz p4, :cond_1

    .line 2855
    add-int/lit8 v11, p2, -0x1

    add-int v12, p4, v11

    const/4 v11, 0x1

    if-ne p2, v11, :cond_4

    const/4 v11, 0x1

    :goto_1
    add-int/2addr v11, v12

    invoke-static {v2, v11}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 2857
    :cond_1
    const/4 v8, 0x0

    .line 2858
    .local v8, startY:I
    if-ltz p5, :cond_2

    .line 2859
    add-int/lit8 v11, p3, -0x1

    sub-int v11, p5, v11

    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 2861
    :cond_2
    iget v11, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    add-int/lit8 v12, p3, -0x1

    sub-int v3, v11, v12

    .line 2862
    .local v3, endY:I
    if-ltz p5, :cond_3

    .line 2863
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

    .line 2866
    :cond_3
    move v10, v8

    .local v10, y:I
    :goto_3
    if-ge v10, v3, :cond_b

    if-nez v4, :cond_b

    .line 2868
    move v9, v7

    .local v9, x:I
    :goto_4
    if-ge v9, v2, :cond_a

    .line 2869
    const/4 v5, 0x0

    .local v5, i:I
    :goto_5
    if-ge v5, p2, :cond_8

    .line 2870
    const/4 v6, 0x0

    .local v6, j:I
    :goto_6
    move/from16 v0, p3

    if-ge v6, v0, :cond_7

    .line 2871
    add-int v11, v9, v5

    aget-object v11, p7, v11

    add-int v12, v10, v6

    aget-boolean v11, v11, v12

    if-eqz v11, :cond_6

    .line 2874
    add-int/2addr v9, v5

    .line 2868
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 2855
    .end local v3           #endY:I
    .end local v5           #i:I
    .end local v6           #j:I
    .end local v8           #startY:I
    .end local v9           #x:I
    .end local v10           #y:I
    :cond_4
    const/4 v11, 0x0

    goto :goto_1

    .line 2863
    .restart local v3       #endY:I
    .restart local v8       #startY:I
    :cond_5
    const/4 v11, 0x0

    goto :goto_2

    .line 2870
    .restart local v5       #i:I
    .restart local v6       #j:I
    .restart local v9       #x:I
    .restart local v10       #y:I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 2869
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 2879
    .end local v6           #j:I
    :cond_8
    if-eqz p1, :cond_9

    .line 2880
    const/4 v11, 0x0

    aput v9, p1, v11

    .line 2881
    const/4 v11, 0x1

    aput v10, p1, v11

    .line 2883
    :cond_9
    const/4 v4, 0x1

    .line 2866
    .end local v5           #i:I
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 2887
    .end local v9           #x:I
    :cond_b
    const/4 v11, -0x1

    move/from16 v0, p4

    if-ne v0, v11, :cond_c

    const/4 v11, -0x1

    move/from16 v0, p5

    if-ne v0, v11, :cond_c

    .line 2899
    move-object/from16 v0, p6

    move-object/from16 v1, p7

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 2900
    return v4

    .line 2892
    :cond_c
    const/16 p4, -0x1

    .line 2893
    const/16 p5, -0x1

    .line 2894
    goto/16 :goto_0
.end method

.method findConfigurationNoShuffle(IIIIIILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;
    .locals 11
    .parameter "pixelX"
    .parameter "pixelY"
    .parameter "minSpanX"
    .parameter "minSpanY"
    .parameter "spanX"
    .parameter "spanY"
    .parameter "dragView"
    .parameter "solution"

    .prologue
    .line 2430
    const/4 v1, 0x2

    new-array v9, v1, [I

    .line 2431
    .local v9, result:[I
    const/4 v1, 0x2

    new-array v10, v1, [I

    .line 2432
    .local v10, resultSpan:[I
    const/4 v8, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher2/CellLayout;->findNearestVacantArea(IIIIIILandroid/view/View;[I[I)[I

    .line 2434
    const/4 v1, 0x0

    aget v1, v9, v1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    aget v1, v9, v1

    if-ltz v1, :cond_0

    .line 2435
    const/4 v1, 0x0

    move-object/from16 v0, p8

    invoke-direct {p0, v0, v1}, Lcom/android/launcher2/CellLayout;->copyCurrentStateToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Z)V

    .line 2436
    const/4 v1, 0x0

    aget v1, v9, v1

    move-object/from16 v0, p8

    iput v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewX:I

    .line 2437
    const/4 v1, 0x1

    aget v1, v9, v1

    move-object/from16 v0, p8

    iput v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewY:I

    .line 2438
    const/4 v1, 0x0

    aget v1, v10, v1

    move-object/from16 v0, p8

    iput v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    .line 2439
    const/4 v1, 0x1

    aget v1, v10, v1

    move-object/from16 v0, p8

    iput v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

    .line 2440
    const/4 v1, 0x1

    move-object/from16 v0, p8

    iput-boolean v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    .line 2444
    :goto_0
    return-object p8

    .line 2442
    :cond_0
    const/4 v1, 0x0

    move-object/from16 v0, p8

    iput-boolean v1, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

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
    .line 1369
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->lazyInitTempRectStack()V

    .line 1371
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 1376
    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

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

    .line 1377
    move/from16 v0, p2

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

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

    .line 1380
    if-eqz p9, :cond_1

    move-object/from16 v7, p9

    .line 1381
    .local v7, bestXY:[I
    :goto_0
    const-wide v4, 0x7fefffffffffffffL

    .line 1382
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

    .line 1383
    .local v6, bestRect:Landroid/graphics/Rect;
    new-instance v22, Ljava/util/Stack;

    invoke-direct/range {v22 .. v22}, Ljava/util/Stack;-><init>()V

    .line 1385
    .local v22, validRegions:Ljava/util/Stack;,"Ljava/util/Stack<Landroid/graphics/Rect;>;"
    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 1386
    .local v10, countX:I
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 1388
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

    .line 1487
    :cond_0
    :goto_1
    return-object v7

    .line 1380
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

    .line 1393
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

    if-ge v0, v1, :cond_1e

    .line 1395
    const/16 v23, 0x0

    .local v23, x:I
    :goto_3
    add-int/lit8 v27, p3, -0x1

    sub-int v27, v10, v27

    move/from16 v0, v23

    move/from16 v1, v27

    if-ge v0, v1, :cond_1d

    .line 1396
    const/16 v26, -0x1

    .line 1397
    .local v26, ySize:I
    const/16 v24, -0x1

    .line 1398
    .local v24, xSize:I
    if-eqz p8, :cond_16

    .line 1400
    const/16 v17, 0x0

    .local v17, i:I
    :goto_4
    move/from16 v0, v17

    move/from16 v1, p3

    if-ge v0, v1, :cond_6

    .line 1401
    const/16 v20, 0x0

    .local v20, j:I
    :goto_5
    move/from16 v0, v20

    move/from16 v1, p4

    if-ge v0, v1, :cond_5

    .line 1402
    add-int v27, v23, v17

    aget-object v27, p11, v27

    add-int v28, v25, v20

    aget-boolean v27, v27, v28

    if-eqz v27, :cond_4

    .line 1395
    .end local v17           #i:I
    .end local v20           #j:I
    :cond_3
    :goto_6
    add-int/lit8 v23, v23, 0x1

    goto :goto_3

    .line 1401
    .restart local v17       #i:I
    .restart local v20       #j:I
    :cond_4
    add-int/lit8 v20, v20, 0x1

    goto :goto_5

    .line 1400
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto :goto_4

    .line 1407
    .end local v20           #j:I
    :cond_6
    move/from16 v24, p3

    .line 1408
    move/from16 v26, p4

    .line 1413
    const/16 v19, 0x1

    .line 1414
    .local v19, incX:Z
    move/from16 v0, v24

    move/from16 v1, p5

    if-lt v0, v1, :cond_a

    const/4 v15, 0x1

    .line 1415
    .local v15, hitMaxX:Z
    :goto_7
    move/from16 v0, v26

    move/from16 v1, p6

    if-lt v0, v1, :cond_b

    const/16 v16, 0x1

    .line 1416
    .local v16, hitMaxY:Z
    :goto_8
    if-eqz v15, :cond_7

    if-nez v16, :cond_15

    .line 1417
    :cond_7
    if-eqz v19, :cond_e

    if-nez v15, :cond_e

    .line 1418
    const/16 v20, 0x0

    .restart local v20       #j:I
    :goto_9
    move/from16 v0, v20

    move/from16 v1, v26

    if-ge v0, v1, :cond_c

    .line 1419
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

    .line 1421
    :cond_8
    const/4 v15, 0x1

    .line 1418
    :cond_9
    add-int/lit8 v20, v20, 0x1

    goto :goto_9

    .line 1414
    .end local v15           #hitMaxX:Z
    .end local v16           #hitMaxY:Z
    .end local v20           #j:I
    :cond_a
    const/4 v15, 0x0

    goto :goto_7

    .line 1415
    .restart local v15       #hitMaxX:Z
    :cond_b
    const/16 v16, 0x0

    goto :goto_8

    .line 1424
    .restart local v16       #hitMaxY:Z
    .restart local v20       #j:I
    :cond_c
    if-nez v15, :cond_d

    .line 1425
    add-int/lit8 v24, v24, 0x1

    .line 1438
    .end local v20           #j:I
    :cond_d
    :goto_a
    move/from16 v0, v24

    move/from16 v1, p5

    if-lt v0, v1, :cond_12

    const/16 v27, 0x1

    :goto_b
    or-int v15, v15, v27

    .line 1439
    move/from16 v0, v26

    move/from16 v1, p6

    if-lt v0, v1, :cond_13

    const/16 v27, 0x1

    :goto_c
    or-int v16, v16, v27

    .line 1440
    if-nez v19, :cond_14

    const/16 v19, 0x1

    :goto_d
    goto :goto_8

    .line 1427
    :cond_e
    if-nez v16, :cond_d

    .line 1428
    const/16 v17, 0x0

    :goto_e
    move/from16 v0, v17

    move/from16 v1, v24

    if-ge v0, v1, :cond_11

    .line 1429
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

    .line 1431
    :cond_f
    const/16 v16, 0x1

    .line 1428
    :cond_10
    add-int/lit8 v17, v17, 0x1

    goto :goto_e

    .line 1434
    :cond_11
    if-nez v16, :cond_d

    .line 1435
    add-int/lit8 v26, v26, 0x1

    goto :goto_a

    .line 1438
    :cond_12
    const/16 v27, 0x0

    goto :goto_b

    .line 1439
    :cond_13
    const/16 v27, 0x0

    goto :goto_c

    .line 1440
    :cond_14
    const/16 v19, 0x0

    goto :goto_d

    .line 1442
    :cond_15
    const/16 v19, 0x1

    .line 1443
    move/from16 v0, v24

    move/from16 v1, p5

    if-lt v0, v1, :cond_1c

    const/4 v15, 0x1

    .line 1444
    :goto_f
    move/from16 v0, v26

    move/from16 v1, p6

    if-lt v0, v1, :cond_16

    .line 1446
    .end local v15           #hitMaxX:Z
    .end local v16           #hitMaxY:Z
    .end local v17           #i:I
    .end local v19           #incX:Z
    :cond_16
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/CellLayout;->mTmpXY:[I

    .line 1447
    .local v8, cellXY:[I
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2, v8}, Lcom/android/launcher2/CellLayout;->cellToCenterPoint(II[I)V

    .line 1452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/graphics/Rect;

    .line 1453
    .local v12, currentRect:Landroid/graphics/Rect;
    add-int v27, v23, v24

    add-int v28, v25, v26

    move/from16 v0, v23

    move/from16 v1, v25

    move/from16 v2, v27

    move/from16 v3, v28

    invoke-virtual {v12, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 1454
    const/4 v9, 0x0

    .line 1455
    .local v9, contained:Z
    invoke-virtual/range {v22 .. v22}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, i$:Ljava/util/Iterator;
    :cond_17
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_18

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroid/graphics/Rect;

    .line 1456
    .local v21, r:Landroid/graphics/Rect;
    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v27

    if-eqz v27, :cond_17

    .line 1457
    const/4 v9, 0x1

    .line 1461
    .end local v21           #r:Landroid/graphics/Rect;
    :cond_18
    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1462
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

    .line 1465
    .local v13, distance:D
    cmpg-double v27, v13, v4

    if-gtz v27, :cond_19

    if-eqz v9, :cond_1a

    :cond_19
    invoke-virtual {v12, v6}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v27

    if-eqz v27, :cond_3

    .line 1467
    :cond_1a
    move-wide v4, v13

    .line 1468
    const/16 v27, 0x0

    aput v23, v7, v27

    .line 1469
    const/16 v27, 0x1

    aput v25, v7, v27

    .line 1470
    if-eqz p10, :cond_1b

    .line 1471
    const/16 v27, 0x0

    aput v24, p10, v27

    .line 1472
    const/16 v27, 0x1

    aput v26, p10, v27

    .line 1474
    :cond_1b
    invoke-virtual {v6, v12}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto/16 :goto_6

    .line 1443
    .end local v8           #cellXY:[I
    .end local v9           #contained:Z
    .end local v12           #currentRect:Landroid/graphics/Rect;
    .end local v13           #distance:D
    .end local v18           #i$:Ljava/util/Iterator;
    .restart local v15       #hitMaxX:Z
    .restart local v16       #hitMaxY:Z
    .restart local v17       #i:I
    .restart local v19       #incX:Z
    :cond_1c
    const/4 v15, 0x0

    goto/16 :goto_f

    .line 1393
    .end local v15           #hitMaxX:Z
    .end local v16           #hitMaxY:Z
    .end local v17           #i:I
    .end local v19           #incX:Z
    .end local v24           #xSize:I
    .end local v26           #ySize:I
    :cond_1d
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_2

    .line 1479
    .end local v23           #x:I
    :cond_1e
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 1482
    const-wide v27, 0x7fefffffffffffffL

    cmpl-double v27, v4, v27

    if-nez v27, :cond_1f

    .line 1483
    const/16 v27, 0x0

    const/16 v28, -0x1

    aput v28, v7, v27

    .line 1484
    const/16 v27, 0x1

    const/16 v28, -0x1

    aput v28, v7, v27

    .line 1486
    :cond_1f
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/android/launcher2/CellLayout;->recycleTempRects(Ljava/util/Stack;)V

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
    .line 1331
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

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

    invoke-virtual/range {v0 .. v11}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIIIIILandroid/view/View;Z[I[I[[Z)[I

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
    .line 2782
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIIILandroid/view/View;Z[I)[I

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
    .line 2763
    const/4 v8, 0x1

    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

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

    invoke-virtual/range {v0 .. v11}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIIIIILandroid/view/View;Z[I[I[[Z)[I

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
    .line 1311
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

    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher2/CellLayout;->findNearestVacantArea(IIIIIILandroid/view/View;[I[I)[I

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
    .line 2743
    const/4 v6, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIIILandroid/view/View;Z[I)[I

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
    .line 1291
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->findNearestVacantArea(IIIILandroid/view/View;[I)[I

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 3147
    new-instance v0, Lcom/android/launcher2/CellLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/android/launcher2/CellLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 3157
    new-instance v0, Lcom/android/launcher2/CellLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/android/launcher2/CellLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getBackgroundAlpha()F
    .locals 1

    .prologue
    .line 1049
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlpha:F

    return v0
.end method

.method public getBackgroundAlphaMultiplier()F
    .locals 1

    .prologue
    .line 1060
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlphaMultiplier:F

    return v0
.end method

.method getCellHeight()I
    .locals 1

    .prologue
    .line 899
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    return v0
.end method

.method getCellWidth()I
    .locals 1

    .prologue
    .line 895
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    return v0
.end method

.method public getChildAt(II)Landroid/view/View;
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1085
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1, p2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenScale()F
    .locals 1

    .prologue
    .line 324
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mIsHotseat:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/CellLayout;->mHotseatScale:F

    :goto_0
    return v0

    :cond_0
    const/high16 v0, 0x3f80

    goto :goto_0
.end method

.method getContentRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 6
    .parameter "r"

    .prologue
    .line 911
    if-nez p1, :cond_0

    .line 912
    new-instance p1, Landroid/graphics/Rect;

    .end local p1
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 914
    .restart local p1
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v1

    .line 915
    .local v1, left:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v3

    .line 916
    .local v3, top:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getWidth()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 917
    .local v2, right:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getHeight()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 918
    .local v0, bottom:I
    invoke-virtual {p1, v1, v3, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 919
    return-object p1
.end method

.method getCountX()I
    .locals 1

    .prologue
    .line 594
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    return v0
.end method

.method getCountY()I
    .locals 1

    .prologue
    .line 598
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    return v0
.end method

.method public getDesiredHeight()I
    .locals 3

    .prologue
    .line 3133
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public getDesiredWidth()I
    .locals 3

    .prologue
    .line 3128
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public getDistanceFromCell(FF[I)F
    .locals 8
    .parameter "x"
    .parameter "y"
    .parameter "cell"

    .prologue
    const/4 v7, 0x1

    const/4 v4, 0x0

    const-wide/high16 v5, 0x4000

    .line 888
    aget v1, p3, v4

    aget v2, p3, v7

    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->cellToCenterPoint(II[I)V

    .line 889
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    aget v1, v1, v4

    int-to-float v1, v1

    sub-float v1, p1, v1

    float-to-double v1, v1

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    aget v3, v3, v7

    int-to-float v3, v3

    sub-float v3, p2, v3

    float-to-double v3, v3

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    add-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v0, v1

    .line 891
    .local v0, distance:F
    return v0
.end method

.method getHeightGap()I
    .locals 1

    .prologue
    .line 907
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    return v0
.end method

.method getIsDragOverlapping()Z
    .locals 1

    .prologue
    .line 377
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mIsDragOverlapping:Z

    return v0
.end method

.method public getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .locals 1

    .prologue
    .line 1078
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1079
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 1081
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTag()Lcom/android/launcher2/CellLayout$CellInfo;
    .locals 1

    .prologue
    .line 791
    invoke-super {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout$CellInfo;

    return-object v0
.end method

.method public bridge synthetic getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getTag()Lcom/android/launcher2/CellLayout$CellInfo;

    move-result-object v0

    return-object v0
.end method

.method public getVacantCell([III)Z
    .locals 6
    .parameter "vacant"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 3059
    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    move-object v0, p1

    move v1, p2

    move v2, p3

    invoke-static/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->findVacantCell([IIIII[[Z)Z

    move-result v0

    return v0
.end method

.method getWidthGap()I
    .locals 1

    .prologue
    .line 903
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    return v0
.end method

.method public hideFolderAccept(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)V
    .locals 1
    .parameter "fra"

    .prologue
    .line 550
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 553
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 554
    return-void
.end method

.method isItemPlacementDirty()Z
    .locals 1

    .prologue
    .line 2666
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mItemPlacementDirty:Z

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
    .line 2523
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object p6

    .line 2524
    const/4 v0, 0x0

    aget v1, p6, v0

    const/4 v0, 0x1

    aget v2, p6, v0

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

    move-object v0, p0

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->getViewsIntersectingRegion(IIIILandroid/view/View;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 2526
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mIntersectingViews:Ljava/util/ArrayList;

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
    .line 3138
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    if-ge p1, v0, :cond_0

    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    if-ge p2, v0, :cond_0

    .line 3139
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    aget-object v0, v0, p1

    aget-boolean v0, v0, p2

    return v0

    .line 3141
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Position exceeds the bound of this CellLayout"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public lastDownOnOccupiedCell()Z
    .locals 1

    .prologue
    .line 3336
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mLastDownOnOccupiedCell:Z

    return v0
.end method

.method public markCellsAsOccupiedForView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 3100
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/CellLayout;->markCellsAsOccupiedForView(Landroid/view/View;[[Z)V

    .line 3101
    return-void
.end method

.method public markCellsAsOccupiedForView(Landroid/view/View;[[Z)V
    .locals 8
    .parameter "view"
    .parameter "occupied"

    .prologue
    .line 3103
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    if-eq v0, v1, :cond_1

    .line 3106
    :cond_0
    :goto_0
    return-void

    .line 3104
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 3105
    .local v7, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v1, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v2, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v3, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iget v4, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    const/4 v6, 0x1

    move-object v0, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_0
.end method

.method public markCellsAsUnoccupiedForView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 3109
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V

    .line 3110
    return-void
.end method

.method public markCellsAsUnoccupiedForView(Landroid/view/View;[[Z)V
    .locals 8
    .parameter "view"
    .parameter "occupied"

    .prologue
    .line 3112
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    if-eq v0, v1, :cond_1

    .line 3115
    :cond_0
    :goto_0
    return-void

    .line 3113
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 3114
    .local v7, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v1, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v2, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iget v3, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iget v4, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    const/4 v6, 0x0

    move-object v0, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 697
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 698
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    iput v0, v1, Lcom/android/launcher2/CellLayout$CellInfo;->screen:I

    .line 699
    return-void
.end method

.method onDragEnter()V
    .locals 1

    .prologue
    .line 2913
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    invoke-virtual {v0}, Lcom/android/launcher2/DropTarget$DragEnforcer;->onDragEnter()V

    .line 2914
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mDragging:Z

    .line 2915
    return-void
.end method

.method onDragExit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 2925
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragEnforcer:Lcom/android/launcher2/DropTarget$DragEnforcer;

    invoke-virtual {v0}, Lcom/android/launcher2/DropTarget$DragEnforcer;->onDragExit()V

    .line 2929
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mDragging:Z

    if-eqz v0, :cond_0

    .line 2930
    iput-boolean v4, p0, Lcom/android/launcher2/CellLayout;->mDragging:Z

    .line 2934
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v2, 0x1

    const/4 v3, -0x1

    aput v3, v1, v2

    aput v3, v0, v4

    .line 2935
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/android/launcher2/InterruptibleInOutAnimator;->animateOut()V

    .line 2936
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    .line 2937
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->revertTempState()V

    .line 2938
    invoke-virtual {p0, v4}, Lcom/android/launcher2/CellLayout;->setIsDragOverlapping(Z)V

    .line 2939
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21
    .parameter "canvas"

    .prologue
    .line 423
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mBackgroundAlpha:F

    move/from16 v18, v0

    const/16 v19, 0x0

    cmpl-float v18, v18, v19

    if-lez v18, :cond_0

    .line 426
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/CellLayout;->mIsDragOverlapping:Z

    move/from16 v18, v0

    if-eqz v18, :cond_2

    .line 428
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/CellLayout;->mActiveGlowBackground:Landroid/graphics/drawable/Drawable;

    .line 433
    .local v6, bg:Landroid/graphics/drawable/Drawable;
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mBackgroundAlpha:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mBackgroundAlphaMultiplier:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    const/high16 v19, 0x437f

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 435
    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 438
    .end local v6           #bg:Landroid/graphics/drawable/Drawable;
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/CellLayout;->mDragOutlinePaint:Landroid/graphics/Paint;

    .line 439
    .local v14, paint:Landroid/graphics/Paint;
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v12, v0, :cond_3

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAlphas:[F

    move-object/from16 v18, v0

    aget v4, v18, v12

    .line 441
    .local v4, alpha:F
    const/16 v18, 0x0

    cmpl-float v18, v4, v18

    if-lez v18, :cond_1

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    move-object/from16 v18, v0

    aget-object v16, v18, v12

    .line 443
    .local v16, r:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->temp:Landroid/graphics/Rect;

    move-object/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getChildrenScale()F

    move-result v19

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->scaleRectAboutCenter(Landroid/graphics/Rect;Landroid/graphics/Rect;F)V

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    move-object/from16 v18, v0

    aget-object v18, v18, v12

    invoke-virtual/range {v18 .. v18}, Lcom/android/launcher2/InterruptibleInOutAnimator;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    .line 445
    .local v5, b:Landroid/graphics/Bitmap;
    const/high16 v18, 0x3f00

    add-float v18, v18, v4

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 446
    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->temp:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v5, v1, v2, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 439
    .end local v5           #b:Landroid/graphics/Bitmap;
    .end local v16           #r:Landroid/graphics/Rect;
    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 430
    .end local v4           #alpha:F
    .end local v12           #i:I
    .end local v14           #paint:Landroid/graphics/Paint;
    :cond_2
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/CellLayout;->mNormalBackground:Landroid/graphics/drawable/Drawable;

    .restart local v6       #bg:Landroid/graphics/drawable/Drawable;
    goto/16 :goto_0

    .line 452
    .end local v6           #bg:Landroid/graphics/drawable/Drawable;
    .restart local v12       #i:I
    .restart local v14       #paint:Landroid/graphics/Paint;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    move-object/from16 v18, v0

    if-eqz v18, :cond_4

    .line 453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/launcher2/BubbleTextView;->getPressedOrFocusedBackgroundPadding()I

    move-result v13

    .line 454
    .local v13, padding:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/launcher2/BubbleTextView;->getPressedOrFocusedBackground()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 455
    .restart local v5       #b:Landroid/graphics/Bitmap;
    if-eqz v5, :cond_4

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/launcher2/BubbleTextView;->getLeft()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v19

    add-int v18, v18, v19

    sub-int v18, v18, v13

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher2/BubbleTextView;->getTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v20

    add-int v19, v19, v20

    sub-int v19, v19, v13

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v5, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 480
    .end local v5           #b:Landroid/graphics/Bitmap;
    .end local v13           #padding:I
    :cond_4
    sget v15, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 483
    .local v15, previewOffset:I
    const/4 v12, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v12, v0, :cond_5

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;

    .line 487
    .local v10, fra:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;
    sget-object v9, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedOuterRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 488
    .local v9, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v10}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->getOuterRingSize()F

    move-result v18

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v17, v0

    .line 489
    .local v17, width:I
    move/from16 v11, v17

    .line 490
    .local v11, height:I
    iget v0, v10, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellX:I

    move/from16 v18, v0

    iget v0, v10, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellY:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->cellToPoint(II[I)V

    .line 492
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    add-int v7, v18, v19

    .line 493
    .local v7, centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x1

    aget v18, v18, v19

    div-int/lit8 v19, v15, 0x2

    add-int v8, v18, v19

    .line 495
    .local v8, centerY:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 496
    div-int/lit8 v18, v17, 0x2

    sub-int v18, v7, v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    div-int/lit8 v19, v11, 0x2

    sub-int v19, v8, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 497
    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v9, v0, v1, v2, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 498
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 499
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 502
    sget-object v9, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->sSharedInnerRingDrawable:Landroid/graphics/drawable/Drawable;

    .line 503
    invoke-virtual {v10}, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->getInnerRingSize()F

    move-result v18

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v17, v0

    .line 504
    move/from16 v11, v17

    .line 505
    iget v0, v10, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellX:I

    move/from16 v18, v0

    iget v0, v10, Lcom/android/launcher2/FolderIcon$FolderRingAnimator;->mCellY:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->cellToPoint(II[I)V

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    add-int v7, v18, v19

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x1

    aget v18, v18, v19

    div-int/lit8 v19, v15, 0x2

    add-int v8, v18, v19

    .line 509
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 510
    div-int/lit8 v18, v17, 0x2

    sub-int v18, v7, v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    div-int/lit8 v19, v17, 0x2

    sub-int v19, v8, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 511
    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v9, v0, v1, v2, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 512
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 513
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 483
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_2

    .line 516
    .end local v7           #centerX:I
    .end local v8           #centerY:I
    .end local v9           #d:Landroid/graphics/drawable/Drawable;
    .end local v10           #fra:Lcom/android/launcher2/FolderIcon$FolderRingAnimator;
    .end local v11           #height:I
    .end local v17           #width:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget v18, v18, v19

    if-ltz v18, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v18, v0

    const/16 v19, 0x1

    aget v18, v18, v19

    if-ltz v18, :cond_6

    .line 517
    sget-object v9, Lcom/android/launcher2/FolderIcon;->sSharedFolderLeaveBehind:Landroid/graphics/drawable/Drawable;

    .line 518
    .restart local v9       #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v17

    .line 519
    .restart local v17       #width:I
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    .line 521
    .restart local v11       #height:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    move-object/from16 v19, v0

    const/16 v20, 0x1

    aget v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/CellLayout;->cellToPoint(II[I)V

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aget v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    add-int v7, v18, v19

    .line 523
    .restart local v7       #centerX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mTempLocation:[I

    move-object/from16 v18, v0

    const/16 v19, 0x1

    aget v18, v18, v19

    div-int/lit8 v19, v15, 0x2

    add-int v8, v18, v19

    .line 525
    .restart local v8       #centerY:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 526
    div-int/lit8 v18, v17, 0x2

    sub-int v18, v7, v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    div-int/lit8 v19, v17, 0x2

    sub-int v19, v8, v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 527
    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v9, v0, v1, v2, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 528
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 529
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 531
    .end local v7           #centerX:I
    .end local v8           #centerY:I
    .end local v9           #d:Landroid/graphics/drawable/Drawable;
    .end local v11           #height:I
    .end local v17           #width:I
    :cond_6
    return-void
.end method

.method onDropChild(Landroid/view/View;)V
    .locals 2
    .parameter "child"

    .prologue
    .line 2953
    if-eqz p1, :cond_0

    .line 2954
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2955
    .local v0, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/launcher2/CellLayout$LayoutParams;->dropped:Z

    .line 2956
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 2958
    .end local v0           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "ev"

    .prologue
    .line 759
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 765
    .local v0, action:I
    if-nez v0, :cond_0

    .line 766
    invoke-direct {p0}, Lcom/android/launcher2/CellLayout;->clearTagCellInfo()V

    .line 769
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    invoke-interface {v1, p0, p1}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 770
    const/4 v1, 0x1

    .line 777
    :goto_0
    return v1

    .line 773
    :cond_1
    if-nez v0, :cond_2

    .line 774
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p0, v1, v2}, Lcom/android/launcher2/CellLayout;->setTagToCellInfoForPoint(II)V

    .line 777
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
    .line 1022
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildCount()I

    move-result v1

    .line 1023
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1024
    invoke-virtual {p0, v2}, Lcom/android/launcher2/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1025
    .local v0, child:Landroid/view/View;
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v4

    sub-int v5, p4, p2

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 1023
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1028
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 24
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 971
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v17

    .line 972
    .local v17, widthSpecMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 974
    .local v18, widthSpecSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 975
    .local v8, heightSpecMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 977
    .local v9, heightSpecSize:I
    if-eqz v17, :cond_0

    if-nez v8, :cond_1

    .line 978
    :cond_0
    new-instance v19, Ljava/lang/RuntimeException;

    const-string v20, "CellLayout cannot have UNSPECIFIED dimensions"

    invoke-direct/range {v19 .. v20}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 981
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v19, v0

    add-int/lit8 v14, v19, -0x1

    .line 982
    .local v14, numWidthGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v19, v0

    add-int/lit8 v13, v19, -0x1

    .line 984
    .local v13, numHeightGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    if-ltz v19, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    if-gez v19, :cond_6

    .line 985
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v20

    sub-int v7, v19, v20

    .line 986
    .local v7, hSpace:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v9, v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v16, v19, v20

    .line 987
    .local v16, vSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v6, v7, v19

    .line 988
    .local v6, hFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v15, v16, v19

    .line 989
    .local v15, vFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mMaxGap:I

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

    iput v0, v1, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    .line 990
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mMaxGap:I

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

    iput v0, v1, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    .line 991
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    move/from16 v23, v0

    invoke-virtual/range {v19 .. v23}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setCellDimensions(IIII)V

    .line 998
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :goto_2
    move/from16 v12, v18

    .line 999
    .local v12, newWidth:I
    move v11, v9

    .line 1000
    .local v11, newHeight:I
    const/high16 v19, -0x8000

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 1001
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountX:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v12, v19, v20

    .line 1003
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mCountY:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v11, v19, v20

    .line 1005
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/android/launcher2/CellLayout;->setMeasuredDimension(II)V

    .line 1008
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getChildCount()I

    move-result v5

    .line 1009
    .local v5, count:I
    const/4 v10, 0x0

    .local v10, i:I
    :goto_3
    if-ge v10, v5, :cond_7

    .line 1010
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/launcher2/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1011
    .local v2, child:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v12, v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingRight()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 1013
    .local v3, childWidthMeasureSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v11, v19

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 1015
    .local v4, childheightMeasureSpec:I
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 1009
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 989
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

    .line 990
    :cond_5
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 993
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    .line 994
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/CellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    goto/16 :goto_2

    .line 1017
    .restart local v5       #count:I
    .restart local v10       #i:I
    .restart local v11       #newHeight:I
    .restart local v12       #newWidth:I
    :cond_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/android/launcher2/CellLayout;->setMeasuredDimension(II)V

    .line 1018
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
    .line 3095
    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 3096
    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    const/4 v6, 0x1

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/CellLayout;->markCellsForView(IIII[[ZZ)V

    .line 3097
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

    .line 1032
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1033
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mBackgroundRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 1034
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mForegroundRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mForegroundPadding:I

    iget v2, p0, Lcom/android/launcher2/CellLayout;->mForegroundPadding:I

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mForegroundPadding:I

    sub-int v3, p1, v3

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mForegroundPadding:I

    sub-int v4, p2, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 1036
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

    .line 801
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 802
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v1

    .line 804
    .local v1, vStartPadding:I
    sub-int v4, p1, v0

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    iget v6, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    add-int/2addr v5, v6

    div-int/2addr v4, v5

    aput v4, p3, v7

    .line 805
    sub-int v4, p2, v1

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    iget v6, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    add-int/2addr v5, v6

    div-int/2addr v4, v5

    aput v4, p3, v8

    .line 807
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 808
    .local v2, xAxis:I
    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 810
    .local v3, yAxis:I
    aget v4, p3, v7

    if-gez v4, :cond_0

    aput v7, p3, v7

    .line 811
    :cond_0
    aget v4, p3, v7

    if-lt v4, v2, :cond_1

    add-int/lit8 v4, v2, -0x1

    aput v4, p3, v7

    .line 812
    :cond_1
    aget v4, p3, v8

    if-gez v4, :cond_2

    aput v7, p3, v8

    .line 813
    :cond_2
    aget v4, p3, v8

    if-lt v4, v3, :cond_3

    add-int/lit8 v4, v3, -0x1

    aput v4, p3, v8

    .line 814
    :cond_3
    return-void
.end method

.method pointToCellRounded(II[I)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "result"

    .prologue
    .line 823
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p1

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p2

    invoke-virtual {p0, v0, v1, p3}, Lcom/android/launcher2/CellLayout;->pointToCellExact(II[I)V

    .line 824
    return-void
.end method

.method public prepareChildForDrag(Landroid/view/View;)V
    .locals 0
    .parameter "child"

    .prologue
    .line 2448
    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 2449
    return-void
.end method

.method public rectToCell(II[I)[I
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "result"

    .prologue
    .line 2996
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lcom/android/launcher2/CellLayout;->rectToCell(Landroid/content/res/Resources;II[I)[I

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
    .line 863
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 864
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v1

    .line 865
    .local v1, vStartPadding:I
    const/4 v2, 0x0

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p1

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int/2addr v4, p3

    add-int/lit8 v5, p3, -0x1

    iget v6, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    aput v3, p5, v2

    .line 867
    const/4 v2, 0x1

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    add-int/2addr v3, v4

    mul-int/2addr v3, p2

    add-int/2addr v3, v1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    mul-int/2addr v4, p4

    add-int/lit8 v5, p4, -0x1

    iget v6, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    aput v3, p5, v2

    .line 869
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
    .line 879
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v0

    .line 880
    .local v0, hStartPadding:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v3

    .line 881
    .local v3, vStartPadding:I
    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    add-int/2addr v4, v5

    mul-int/2addr v4, p1

    add-int v1, v0, v4

    .line 882
    .local v1, left:I
    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    add-int/2addr v4, v5

    mul-int/2addr v4, p2

    add-int v2, v3, v4

    .line 883
    .local v2, top:I
    iget v4, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int/2addr v4, p3

    add-int/lit8 v5, p3, -0x1

    iget v6, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    add-int/2addr v4, v1

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    mul-int/2addr v5, p4

    add-int/lit8 v6, p4, -0x1

    iget v7, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    add-int/2addr v5, v2

    invoke-virtual {p5, v1, v2, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 885
    return-void
.end method

.method public removeAllViews()V
    .locals 1

    .prologue
    .line 645
    invoke-direct {p0}, Lcom/android/launcher2/CellLayout;->clearOccupiedCells()V

    .line 646
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeAllViews()V

    .line 647
    return-void
.end method

.method public removeAllViewsInLayout()V
    .locals 1

    .prologue
    .line 651
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 652
    invoke-direct {p0}, Lcom/android/launcher2/CellLayout;->clearOccupiedCells()V

    .line 653
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeAllViewsInLayout()V

    .line 655
    :cond_0
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 663
    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 664
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeView(Landroid/view/View;)V

    .line 665
    return-void
.end method

.method public removeViewAt(I)V
    .locals 1
    .parameter "index"

    .prologue
    .line 669
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 670
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeViewAt(I)V

    .line 671
    return-void
.end method

.method public removeViewInLayout(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 675
    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 676
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeViewInLayout(Landroid/view/View;)V

    .line 677
    return-void
.end method

.method public removeViewWithoutMarkingCells(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 658
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeView(Landroid/view/View;)V

    .line 659
    return-void
.end method

.method public removeViews(II)V
    .locals 2
    .parameter "start"
    .parameter "count"

    .prologue
    .line 681
    move v0, p1

    .local v0, i:I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    .line 682
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 681
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 684
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, p1, p2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeViews(II)V

    .line 685
    return-void
.end method

.method public removeViewsInLayout(II)V
    .locals 2
    .parameter "start"
    .parameter "count"

    .prologue
    .line 689
    move v0, p1

    .local v0, i:I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    .line 690
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/CellLayout;->markCellsAsUnoccupiedForView(Landroid/view/View;)V

    .line 689
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 692
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, p1, p2}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->removeViewsInLayout(II)V

    .line 693
    return-void
.end method

.method public requestChildLayout()V
    .locals 3

    .prologue
    .line 3344
    const-string v0, "CellLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestChildLayout: mShortcutsAndWidgets = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3346
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    if-eqz v0, :cond_0

    .line 3347
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->requestLayout()V

    .line 3349
    :cond_0
    return-void
.end method

.method protected resetOverscrollTransforms()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 385
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mScrollingTransformsDirty:Z

    if-eqz v0, :cond_0

    .line 386
    invoke-virtual {p0, v2}, Lcom/android/launcher2/CellLayout;->setOverscrollTransformsDirty(Z)V

    .line 387
    invoke-virtual {p0, v1}, Lcom/android/launcher2/CellLayout;->setTranslationX(F)V

    .line 388
    invoke-virtual {p0, v1}, Lcom/android/launcher2/CellLayout;->setRotationY(F)V

    .line 391
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher2/CellLayout;->setOverScrollAmount(FZ)V

    .line 392
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getMeasuredWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->setPivotX(F)V

    .line 393
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getMeasuredHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->setPivotY(F)V

    .line 395
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
    .line 574
    .local p1, states:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    invoke-virtual {p0, p1}, Lcom/android/launcher2/CellLayout;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    .line 575
    return-void
.end method

.method revertTempState()V
    .locals 11

    .prologue
    const/4 v5, 0x0

    .line 2530
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->isItemPlacementDirty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2531
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v8

    .line 2532
    .local v8, count:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    if-ge v9, v8, :cond_2

    .line 2533
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2534
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2535
    .local v10, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    iget v2, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    if-ne v0, v2, :cond_0

    iget v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    iget v2, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    if-eq v0, v2, :cond_1

    .line 2536
    :cond_0
    iget v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iput v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellX:I

    .line 2537
    iget v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iput v0, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->tmpCellY:I

    .line 2538
    iget v2, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v3, v10, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    const/16 v4, 0x96

    move-object v0, p0

    move v6, v5

    move v7, v5

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/CellLayout;->animateChildToPosition(Landroid/view/View;IIIIZZ)Z

    .line 2532
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 2542
    .end local v1           #child:Landroid/view/View;
    .end local v10           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher2/CellLayout;->completeAndClearReorderHintAnimations()V

    .line 2543
    invoke-virtual {p0, v5}, Lcom/android/launcher2/CellLayout;->setItemPlacementDirty(Z)V

    .line 2544
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

    .line 398
    const/high16 v0, 0x3f80

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    .line 399
    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 400
    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 401
    iget v0, p1, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 402
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 404
    :cond_0
    return-void
.end method

.method scaleRectAboutCenter(Landroid/graphics/Rect;Landroid/graphics/Rect;F)V
    .locals 4
    .parameter "in"
    .parameter "out"
    .parameter "scale"

    .prologue
    .line 408
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    .line 409
    .local v0, cx:I
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    .line 410
    .local v1, cy:I
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 411
    neg-int v2, v0

    neg-int v3, v1

    invoke-virtual {p2, v2, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 412
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher2/CellLayout;->scaleRect(Landroid/graphics/Rect;F)V

    .line 413
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 414
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 1064
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlpha:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 1065
    iput p1, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlpha:F

    .line 1066
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 1068
    :cond_0
    return-void
.end method

.method public setBackgroundAlphaMultiplier(F)V
    .locals 1
    .parameter "multiplier"

    .prologue
    .line 1053
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlphaMultiplier:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 1054
    iput p1, p0, Lcom/android/launcher2/CellLayout;->mBackgroundAlphaMultiplier:F

    .line 1055
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 1057
    :cond_0
    return-void
.end method

.method protected setChildrenDrawingCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1040
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setChildrenDrawingCacheEnabled(Z)V

    .line 1041
    return-void
.end method

.method protected setChildrenDrawnWithCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 1046
    return-void
.end method

.method public setFolderLeaveBehindCell(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 557
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 558
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderLeaveBehindCell:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 559
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 560
    return-void
.end method

.method public setGridSize(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 328
    iput p1, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    .line 329
    iput p2, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    .line 330
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    iput-object v0, p0, Lcom/android/launcher2/CellLayout;->mOccupied:[[Z

    .line 331
    iget v0, p0, Lcom/android/launcher2/CellLayout;->mCountX:I

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mCountY:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    iput-object v0, p0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    .line 332
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mTempRectStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 333
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->requestLayout()V

    .line 334
    return-void
.end method

.method setIsDragOverlapping(Z)V
    .locals 1
    .parameter "isDragOverlapping"

    .prologue
    .line 370
    iget-boolean v0, p0, Lcom/android/launcher2/CellLayout;->mIsDragOverlapping:Z

    if-eq v0, p1, :cond_0

    .line 371
    iput-boolean p1, p0, Lcom/android/launcher2/CellLayout;->mIsDragOverlapping:Z

    .line 372
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 374
    :cond_0
    return-void
.end method

.method public setIsHotseat(Z)V
    .locals 0
    .parameter "isHotseat"

    .prologue
    .line 602
    iput-boolean p1, p0, Lcom/android/launcher2/CellLayout;->mIsHotseat:Z

    .line 603
    return-void
.end method

.method setItemPlacementDirty(Z)V
    .locals 0
    .parameter "dirty"

    .prologue
    .line 2663
    iput-boolean p1, p0, Lcom/android/launcher2/CellLayout;->mItemPlacementDirty:Z

    .line 2664
    return-void
.end method

.method public setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 590
    iput-object p1, p0, Lcom/android/launcher2/CellLayout;->mInterceptTouchListener:Landroid/view/View$OnTouchListener;

    .line 591
    return-void
.end method

.method setOverScrollAmount(FZ)V
    .locals 2
    .parameter "r"
    .parameter "left"

    .prologue
    .line 345
    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_1

    .line 346
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollLeft:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 351
    :cond_0
    :goto_0
    const/high16 v0, 0x437f

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/CellLayout;->mForegroundAlpha:I

    .line 352
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/android/launcher2/CellLayout;->mForegroundAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 353
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->invalidate()V

    .line 354
    return-void

    .line 347
    :cond_1
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_0

    .line 348
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollRight:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/android/launcher2/CellLayout;->mOverScrollForegroundDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method protected setOverscrollTransformsDirty(Z)V
    .locals 0
    .parameter "dirty"

    .prologue
    .line 381
    iput-boolean p1, p0, Lcom/android/launcher2/CellLayout;->mScrollingTransformsDirty:Z

    .line 382
    return-void
.end method

.method setPressedOrFocusedIcon(Lcom/android/launcher2/BubbleTextView;)V
    .locals 2
    .parameter "icon"

    .prologue
    .line 359
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    .line 360
    .local v0, oldIcon:Lcom/android/launcher2/BubbleTextView;
    iput-object p1, p0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    .line 361
    if-eqz v0, :cond_0

    .line 362
    invoke-direct {p0, v0}, Lcom/android/launcher2/CellLayout;->invalidateBubbleTextView(Lcom/android/launcher2/BubbleTextView;)V

    .line 364
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    if-eqz v1, :cond_1

    .line 365
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mPressedOrFocusedIcon:Lcom/android/launcher2/BubbleTextView;

    invoke-direct {p0, v1}, Lcom/android/launcher2/CellLayout;->invalidateBubbleTextView(Lcom/android/launcher2/BubbleTextView;)V

    .line 367
    :cond_1
    return-void
.end method

.method public setShortcutAndWidgetAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 1071
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getChildCount()I

    move-result v0

    .line 1072
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1073
    invoke-virtual {p0, v1}, Lcom/android/launcher2/CellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 1072
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1075
    :cond_0
    return-void
.end method

.method public setTagToCellInfoForPoint(II)V
    .locals 15
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 702
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;

    .line 703
    .local v0, cellInfo:Lcom/android/launcher2/CellLayout$CellInfo;
    iget-object v5, p0, Lcom/android/launcher2/CellLayout;->mRect:Landroid/graphics/Rect;

    .line 704
    .local v5, frame:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getScrollX()I

    move-result v11

    add-int v9, p1, v11

    .line 705
    .local v9, x:I
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getScrollY()I

    move-result v11

    add-int v10, p2, v11

    .line 706
    .local v10, y:I
    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v11}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v3

    .line 708
    .local v3, count:I
    const/4 v4, 0x0

    .line 709
    .local v4, found:Z
    add-int/lit8 v6, v3, -0x1

    .local v6, i:I
    :goto_0
    if-ltz v6, :cond_1

    .line 710
    iget-object v11, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v11, v6}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 711
    .local v2, child:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 713
    .local v7, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v11

    if-eqz v11, :cond_3

    :cond_0
    iget-boolean v11, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->isLockedToGrid:Z

    if-eqz v11, :cond_3

    .line 715
    invoke-virtual {v2, v5}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 717
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v8

    .line 718
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

    .line 723
    .restart local v5       #frame:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingLeft()I

    move-result v11

    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getPaddingTop()I

    move-result v12

    invoke-virtual {v5, v11, v12}, Landroid/graphics/Rect;->offset(II)V

    .line 724
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

    .line 727
    invoke-virtual {v5, v9, v10}, Landroid/graphics/Rect;->contains(II)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 728
    iput-object v2, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 729
    iget v11, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellX:I

    .line 730
    iget v11, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellY:I

    .line 731
    iget v11, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellHSpan:I

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    .line 732
    iget v11, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellVSpan:I

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    .line 733
    const/4 v4, 0x1

    .line 739
    .end local v2           #child:Landroid/view/View;
    .end local v7           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    .end local v8           #scale:F
    :cond_1
    iput-boolean v4, p0, Lcom/android/launcher2/CellLayout;->mLastDownOnOccupiedCell:Z

    .line 741
    if-nez v4, :cond_2

    .line 742
    iget-object v1, p0, Lcom/android/launcher2/CellLayout;->mTmpXY:[I

    .line 743
    .local v1, cellXY:[I
    invoke-virtual {p0, v9, v10, v1}, Lcom/android/launcher2/CellLayout;->pointToCellExact(II[I)V

    .line 745
    const/4 v11, 0x0

    iput-object v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 746
    const/4 v11, 0x0

    aget v11, v1, v11

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellX:I

    .line 747
    const/4 v11, 0x1

    aget v11, v1, v11

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->cellY:I

    .line 748
    const/4 v11, 0x1

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanX:I

    .line 749
    const/4 v11, 0x1

    iput v11, v0, Lcom/android/launcher2/CellLayout$CellInfo;->spanY:I

    .line 751
    .end local v1           #cellXY:[I
    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/launcher2/CellLayout;->setTag(Ljava/lang/Object;)V

    .line 752
    return-void

    .line 709
    .restart local v2       #child:Landroid/view/View;
    .restart local v7       #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_3
    add-int/lit8 v6, v6, -0x1

    goto/16 :goto_0
.end method

.method public setUseTempCoords(Z)V
    .locals 4
    .parameter "useTempCoords"

    .prologue
    .line 2421
    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v3}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v0

    .line 2422
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 2423
    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mShortcutsAndWidgets:Lcom/android/launcher2/ShortcutAndWidgetContainer;

    invoke-virtual {v3, v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2424
    .local v2, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iput-boolean p1, v2, Lcom/android/launcher2/CellLayout$LayoutParams;->useTmpCoords:Z

    .line 2422
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2426
    .end local v2           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 1

    .prologue
    .line 570
    const/4 v0, 0x0

    return v0
.end method

.method public showFolderAccept(Lcom/android/launcher2/FolderIcon$FolderRingAnimator;)V
    .locals 1
    .parameter "fra"

    .prologue
    .line 546
    iget-object v0, p0, Lcom/android/launcher2/CellLayout;->mFolderOuterRings:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    return-void
.end method

.method simpleSwap(IIIIII[ILandroid/view/View;ZLcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;
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
    .line 2151
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p10

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/CellLayout;->copyCurrentStateToSolution(Lcom/android/launcher2/CellLayout$ItemConfiguration;Z)V

    .line 2154
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/CellLayout;->mTmpOccupied:[[Z

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/launcher2/CellLayout;->copyOccupiedArray([[Z)V

    .line 2158
    const/4 v2, 0x2

    new-array v7, v2, [I

    .local v7, result:[I
    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    .line 2159
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->findNearestArea(IIII[I)[I

    move-result-object v7

    .line 2161
    const/16 v19, 0x0

    .line 2164
    .local v19, success:Z
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

    invoke-direct/range {v8 .. v15}, Lcom/android/launcher2/CellLayout;->rearrangementExists(IIII[ILandroid/view/View;Lcom/android/launcher2/CellLayout$ItemConfiguration;)Z

    move-result v19

    .line 2167
    if-nez v19, :cond_3

    .line 2170
    move/from16 v0, p5

    move/from16 v1, p3

    if-le v0, v1, :cond_1

    move/from16 v0, p4

    move/from16 v1, p6

    if-eq v0, v1, :cond_0

    if-eqz p9, :cond_1

    .line 2171
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

    invoke-virtual/range {v8 .. v18}, Lcom/android/launcher2/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;

    move-result-object p10

    .line 2185
    .end local p10
    :goto_0
    return-object p10

    .line 2173
    .restart local p10
    :cond_1
    move/from16 v0, p6

    move/from16 v1, p4

    if-le v0, v1, :cond_2

    .line 2174
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

    invoke-virtual/range {v8 .. v18}, Lcom/android/launcher2/CellLayout;->simpleSwap(IIIIII[ILandroid/view/View;ZLcom/android/launcher2/CellLayout$ItemConfiguration;)Lcom/android/launcher2/CellLayout$ItemConfiguration;

    move-result-object p10

    goto :goto_0

    .line 2177
    :cond_2
    const/4 v2, 0x0

    move-object/from16 v0, p10

    iput-boolean v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    goto :goto_0

    .line 2179
    :cond_3
    const/4 v2, 0x1

    move-object/from16 v0, p10

    iput-boolean v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    .line 2180
    const/4 v2, 0x0

    aget v2, v7, v2

    move-object/from16 v0, p10

    iput v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewX:I

    .line 2181
    const/4 v2, 0x1

    aget v2, v7, v2

    move-object/from16 v0, p10

    iput v2, v0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewY:I

    .line 2182
    move/from16 v0, p5

    move-object/from16 v1, p10

    iput v0, v1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    .line 2183
    move/from16 v0, p6

    move-object/from16 v1, p10

    iput v0, v1, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

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
    .line 1204
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v3, 0x0

    aget v10, v2, v3

    .line 1205
    .local v10, oldDragCellX:I
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v3, 0x1

    aget v11, v2, v3

    .line 1207
    .local v11, oldDragCellY:I
    if-eqz p1, :cond_1

    if-nez p10, :cond_1

    .line 1208
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCenter:Landroid/graphics/Point;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int v3, v3, p3

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int v4, v4, p4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 1213
    :goto_0
    if-nez p2, :cond_2

    if-nez p1, :cond_2

    .line 1268
    :cond_0
    :goto_1
    return-void

    .line 1210
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCenter:Landroid/graphics/Point;

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Point;->set(II)V

    goto :goto_0

    .line 1217
    :cond_2
    move/from16 v0, p5

    if-ne v0, v10, :cond_3

    move/from16 v0, p6

    if-eq v0, v11, :cond_0

    .line 1218
    :cond_3
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v3, 0x0

    aput p5, v2, v3

    .line 1219
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragCell:[I

    const/4 v3, 0x1

    aput p6, v2, v3

    .line 1221
    iget-object v14, p0, Lcom/android/launcher2/CellLayout;->mTmpPoint:[I

    .line 1222
    .local v14, topLeft:[I
    move/from16 v0, p5

    move/from16 v1, p6

    invoke-virtual {p0, v0, v1, v14}, Lcom/android/launcher2/CellLayout;->cellToPoint(II[I)V

    .line 1224
    const/4 v2, 0x0

    aget v8, v14, v2

    .line 1225
    .local v8, left:I
    const/4 v2, 0x1

    aget v13, v14, v2

    .line 1227
    .local v13, top:I
    if-eqz p1, :cond_5

    if-nez p10, :cond_5

    .line 1230
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1231
    .local v9, lp:Landroid/view/ViewGroup$MarginLayoutParams;
    iget v2, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v8, v2

    .line 1232
    iget v2, v9, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v13, v2

    .line 1237
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v13, v2

    .line 1239
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int v2, v2, p7

    add-int/lit8 v3, p7, -0x1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v8, v2

    .line 1256
    .end local v9           #lp:Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_2
    iget v12, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    .line 1257
    .local v12, oldIndex:I
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    aget-object v2, v2, v12

    invoke-virtual {v2}, Lcom/android/launcher2/InterruptibleInOutAnimator;->animateOut()V

    .line 1258
    add-int/lit8 v2, v12, 0x1

    iget-object v3, p0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    array-length v3, v3

    rem-int/2addr v2, v3

    iput v2, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    .line 1259
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    aget-object v7, v2, v3

    .line 1260
    .local v7, r:Landroid/graphics/Rect;
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    add-int/2addr v2, v8

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    add-int/2addr v3, v13

    invoke-virtual {v7, v8, v13, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 1261
    if-eqz p9, :cond_4

    move-object v2, p0

    move/from16 v3, p5

    move/from16 v4, p6

    move/from16 v5, p7

    move/from16 v6, p8

    .line 1262
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher2/CellLayout;->cellToRect(IIIILandroid/graphics/Rect;)V

    .line 1265
    :cond_4
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    aget-object v2, v2, v3

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/android/launcher2/InterruptibleInOutAnimator;->setTag(Ljava/lang/Object;)V

    .line 1266
    iget-object v2, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineAnims:[Lcom/android/launcher2/InterruptibleInOutAnimator;

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mDragOutlineCurrent:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/android/launcher2/InterruptibleInOutAnimator;->animateIn()V

    goto/16 :goto_1

    .line 1242
    .end local v7           #r:Landroid/graphics/Rect;
    .end local v12           #oldIndex:I
    :cond_5
    if-eqz p10, :cond_6

    if-eqz p11, :cond_6

    .line 1245
    move-object/from16 v0, p10

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int v3, v3, p7

    add-int/lit8 v4, p7, -0x1

    iget v5, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    invoke-virtual/range {p11 .. p11}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    add-int/2addr v8, v2

    .line 1247
    move-object/from16 v0, p10

    iget v2, v0, Landroid/graphics/Point;->y:I

    add-int/2addr v13, v2

    goto :goto_2

    .line 1250
    :cond_6
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellWidth:I

    mul-int v2, v2, p7

    add-int/lit8 v3, p7, -0x1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mWidthGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v8, v2

    .line 1252
    iget v2, p0, Lcom/android/launcher2/CellLayout;->mCellHeight:I

    mul-int v2, v2, p8

    add-int/lit8 v3, p8, -0x1

    iget v4, p0, Lcom/android/launcher2/CellLayout;->mHeightGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v13, v2

    goto/16 :goto_2
.end method
