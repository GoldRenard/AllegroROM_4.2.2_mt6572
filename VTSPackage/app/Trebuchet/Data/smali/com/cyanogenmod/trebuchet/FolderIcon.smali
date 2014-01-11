.class public Lcom/cyanogenmod/trebuchet/FolderIcon;
.super Landroid/widget/LinearLayout;
.source "FolderIcon.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/FolderInfo$FolderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;,
        Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;
    }
.end annotation


# static fields
.field private static final CONSUMPTION_ANIMATION_DURATION:I = 0x64

.field private static final DROP_IN_ANIMATION_DURATION:I = 0x190

.field private static final FINAL_ITEM_ANIMATION_DURATION:I = 0xc8

.field private static final INITIAL_ITEM_ANIMATION_DURATION:I = 0x15e

.field private static final INNER_RING_GROWTH_FACTOR:F = 0.15f

.field private static final NUM_ITEMS_IN_PREVIEW:I = 0x3

.field private static final OUTER_RING_GROWTH_FACTOR:F = 0.3f

.field private static final PERSPECTIVE_SCALE_FACTOR:F = 0.35f

.field private static final PERSPECTIVE_SHIFT_FACTOR:F = 0.24f

.field public static sSharedFolderLeaveBehind:Landroid/graphics/drawable/Drawable;

.field private static sStaticValuesDirty:Z


# instance fields
.field private mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

.field mAnimating:Z

.field private mAvailableSpaceInPreview:I

.field private mBaselineIconScale:F

.field private mBaselineIconSize:I

.field private mFolder:Lcom/cyanogenmod/trebuchet/Folder;

.field private mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

.field mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

.field private mHiddenItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

.field private mIntrinsicIconSize:I

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

.field private mMaxPerspectiveShift:F

.field private mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

.field private mPreviewBackground:Landroid/widget/ImageView;

.field private mPreviewOffsetX:I

.field private mPreviewOffsetY:I

.field private mTotalWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x1

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->sStaticValuesDirty:Z

    .line 78
    const/4 v0, 0x0

    sput-object v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->sSharedFolderLeaveBehind:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 107
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    .line 91
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mTotalWidth:I

    .line 95
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimating:Z

    .line 97
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-object v1, p0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 98
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-object v1, p0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;

    .line 108
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->init()V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 102
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    .line 91
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mTotalWidth:I

    .line 95
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimating:Z

    .line 97
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-object v1, p0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 98
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-object v1, p0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;

    .line 103
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->init()V

    .line 104
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 50
    sget-boolean v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->sStaticValuesDirty:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 50
    sput-boolean p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->sStaticValuesDirty:Z

    return p0
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/FolderIcon;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewBackground:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/FolderIcon;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/FolderIcon;)Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    return-object v0
.end method

.method private animateFirstItem(Landroid/graphics/drawable/Drawable;IZLjava/lang/Runnable;)V
    .locals 8
    .parameter "d"
    .parameter "duration"
    .parameter "reverse"
    .parameter "onCompleteRunnable"

    .prologue
    .line 559
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewItemDrawingParams(ILcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-result-object v4

    .line 561
    .local v4, finalParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;
    const/high16 v6, 0x3f80

    .line 562
    .local v6, scale0:F
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    int-to-float v3, v0

    .line 563
    .local v3, transX0:F
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    int-to-float v5, v0

    .line 564
    .local v5, transY0:F
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iput-object p1, v0, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->drawable:Landroid/graphics/drawable/Drawable;

    .line 566
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v7

    .line 567
    .local v7, va:Landroid/animation/ValueAnimator;
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$2;

    move-object v1, p0

    move v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$2;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;ZFLcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;F)V

    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 581
    new-instance v0, Lcom/cyanogenmod/trebuchet/FolderIcon$3;

    invoke-direct {v0, p0, p4}, Lcom/cyanogenmod/trebuchet/FolderIcon$3;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;Ljava/lang/Runnable;)V

    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 594
    int-to-long v0, p2

    invoke-virtual {v7, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 595
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    .line 596
    return-void

    .line 566
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private computePreviewDrawingParams(II)V
    .locals 6
    .parameter "drawableSize"
    .parameter "totalSize"

    .prologue
    .line 423
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    if-ne v4, p1, :cond_0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mTotalWidth:I

    if-eq v4, p2, :cond_1

    .line 424
    :cond_0
    iput p1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    .line 425
    iput p2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mTotalWidth:I

    .line 427
    sget v2, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->sPreviewSize:I

    .line 428
    .local v2, previewSize:I
    sget v1, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->sPreviewPadding:I

    .line 430
    .local v1, previewPadding:I
    mul-int/lit8 v4, v1, 0x2

    sub-int v4, v2, v4

    iput v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    .line 432
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    const v5, 0x3fe66666

    mul-float/2addr v4, v5

    float-to-int v0, v4

    .line 434
    .local v0, adjustedAvailableSpace:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    int-to-float v4, v4

    const v5, 0x3f9eb852

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 435
    .local v3, unscaledHeight:I
    const/high16 v4, 0x3f80

    int-to-float v5, v0

    mul-float/2addr v4, v5

    int-to-float v5, v3

    div-float/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconScale:F

    .line 437
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    int-to-float v4, v4

    iget v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconScale:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconSize:I

    .line 438
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconSize:I

    int-to-float v4, v4

    const v5, 0x3e75c28f

    mul-float/2addr v4, v5

    iput v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mMaxPerspectiveShift:F

    .line 440
    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mTotalWidth:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    iput v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetX:I

    .line 441
    iput v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetY:I

    .line 443
    .end local v0           #adjustedAvailableSpace:I
    .end local v1           #previewPadding:I
    .end local v2           #previewSize:I
    .end local v3           #unscaledHeight:I
    :cond_1
    return-void
.end method

.method private computePreviewDrawingParams(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 446
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getMeasuredWidth()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewDrawingParams(II)V

    .line 447
    return-void
.end method

.method private computePreviewItemDrawingParams(ILcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;
    .locals 12
    .parameter "index"
    .parameter "params"

    .prologue
    const/high16 v11, 0x3f80

    .line 478
    rsub-int/lit8 v0, p1, 0x3

    add-int/lit8 p1, v0, -0x1

    .line 479
    int-to-float v0, p1

    mul-float/2addr v0, v11

    const/high16 v1, 0x4000

    div-float v7, v0, v1

    .line 480
    .local v7, r:F
    const v0, 0x3eb33333

    sub-float v1, v11, v7

    mul-float/2addr v0, v1

    sub-float v8, v11, v0

    .line 482
    .local v8, scale:F
    sub-float v0, v11, v7

    iget v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mMaxPerspectiveShift:F

    mul-float v6, v0, v1

    .line 483
    .local v6, offset:F
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconSize:I

    int-to-float v0, v0

    mul-float v10, v8, v0

    .line 484
    .local v10, scaledSize:F
    sub-float v0, v11, v8

    iget v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconSize:I

    int-to-float v1, v1

    mul-float v9, v0, v1

    .line 488
    .local v9, scaleOffsetCorrection:F
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAvailableSpaceInPreview:I

    int-to-float v0, v0

    add-float v1, v6, v10

    add-float/2addr v1, v9

    sub-float v3, v0, v1

    .line 489
    .local v3, transY:F
    add-float v2, v6, v9

    .line 490
    .local v2, transX:F
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mBaselineIconScale:F

    mul-float v4, v0, v8

    .line 491
    .local v4, totalScale:F
    const/high16 v0, 0x42a0

    sub-float v1, v11, v7

    mul-float/2addr v0, v1

    float-to-int v5, v0

    .line 493
    .local v5, overlayAlpha:I
    if-nez p2, :cond_0

    .line 494
    new-instance p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .end local p2
    move-object v0, p2

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;FFFI)V

    .line 501
    .restart local p2
    :goto_0
    return-object p2

    .line 496
    :cond_0
    iput v2, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    .line 497
    iput v3, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    .line 498
    iput v4, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    .line 499
    iput v5, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->overlayAlpha:I

    goto :goto_0
.end method

.method private drawPreviewItem(Landroid/graphics/Canvas;Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)V
    .locals 5
    .parameter "canvas"
    .parameter "params"

    .prologue
    const/4 v4, 0x0

    .line 505
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 506
    iget v1, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    iget v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetX:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    iget v2, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    iget v3, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetY:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 507
    iget v1, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    iget v2, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 508
    iget-object v0, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->drawable:Landroid/graphics/drawable/Drawable;

    .line 510
    .local v0, d:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 511
    iget v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    invoke-virtual {v0, v4, v4, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 512
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 513
    iget v1, p2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->overlayAlpha:I

    invoke-static {v1, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 514
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 515
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 516
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 518
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 519
    return-void
.end method

.method static fromXml(ILcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/FolderInfo;)Lcom/cyanogenmod/trebuchet/FolderIcon;
    .locals 7
    .parameter "resId"
    .parameter "launcher"
    .parameter "group"
    .parameter "folderInfo"

    .prologue
    const/4 v6, 0x0

    .line 118
    const/4 v0, 0x0

    .line 125
    .local v0, error:Z
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    invoke-virtual {v3, p0, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 127
    .local v2, icon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    const v3, 0x7f070026

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    iput-object v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 128
    iget-object v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    iget-object v4, p3, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    const v3, 0x7f070025

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewBackground:Landroid/widget/ImageView;

    .line 131
    invoke-virtual {v2, p3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTag(Ljava/lang/Object;)V

    .line 132
    invoke-virtual {v2, p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    iput-object p3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 134
    iput-object p1, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 135
    const v3, 0x7f0900d6

    invoke-virtual {p1, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p3, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 137
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/Folder;->fromXml(Landroid/content/Context;)Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v1

    .line 138
    .local v1, folder:Lcom/cyanogenmod/trebuchet/Folder;
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragController()Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/Folder;->setDragController(Lcom/cyanogenmod/trebuchet/DragController;)V

    .line 139
    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Folder;->setFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 140
    invoke-virtual {v1, p3}, Lcom/cyanogenmod/trebuchet/Folder;->bind(Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 141
    iput-object v1, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    .line 143
    new-instance v3, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-direct {v3, p1, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    iput-object v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    .line 144
    invoke-virtual {p3, v2}, Lcom/cyanogenmod/trebuchet/FolderInfo;->addListener(Lcom/cyanogenmod/trebuchet/FolderInfo$FolderListener;)V

    .line 146
    return-object v2
.end method

.method private getLocalCenterForIndex(I[I)F
    .locals 6
    .parameter "index"
    .parameter "center"

    .prologue
    const/high16 v5, 0x4000

    .line 464
    const/4 v2, 0x3

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    invoke-direct {p0, v2, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewItemDrawingParams(ILcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 466
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetX:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    iput v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    .line 467
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mPreviewOffsetY:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    iput v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    .line 468
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transX:F

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    div-float/2addr v3, v5

    add-float v0, v2, v3

    .line 469
    .local v0, offsetX:F
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->transY:F

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    iget v4, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mIntrinsicIconSize:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    div-float/2addr v3, v5

    add-float v1, v2, v3

    .line 471
    .local v1, offsetY:F
    const/4 v2, 0x0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v3

    aput v3, p2, v2

    .line 472
    const/4 v2, 0x1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v3

    aput v3, p2, v2

    .line 473
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->scale:F

    return v2
.end method

.method private init()V
    .locals 1

    .prologue
    .line 112
    new-instance v0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    .line 113
    return-void
.end method

.method private onDrop(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FILjava/lang/Runnable;)V
    .locals 23
    .parameter "item"
    .parameter "animateView"
    .parameter "finalRect"
    .parameter "scaleRelativeToDragLayer"
    .parameter "index"
    .parameter "postAnimationRunnable"

    .prologue
    .line 346
    const/4 v4, -0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 347
    const/4 v4, -0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 352
    if-eqz p2, :cond_2

    .line 353
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v3

    .line 354
    .local v3, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 355
    .local v5, from:Landroid/graphics/Rect;
    move-object/from16 v0, p2

    invoke-virtual {v3, v0, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 356
    move-object/from16 v6, p3

    .line 357
    .local v6, to:Landroid/graphics/Rect;
    if-nez v6, :cond_0

    .line 358
    new-instance v6, Landroid/graphics/Rect;

    .end local v6           #to:Landroid/graphics/Rect;
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 359
    .restart local v6       #to:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v22

    .line 361
    .local v22, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->setFinalTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 362
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getScaleX()F

    move-result v20

    .line 363
    .local v20, scaleX:F
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getScaleY()F

    move-result v21

    .line 364
    .local v21, scaleY:F
    const/high16 v4, 0x3f80

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setScaleX(F)V

    .line 365
    const/high16 v4, 0x3f80

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setScaleY(F)V

    .line 366
    move-object/from16 v0, p0

    invoke-virtual {v3, v0, v6}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result p4

    .line 368
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setScaleX(F)V

    .line 369
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setScaleY(F)V

    .line 370
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->resetTransitionTransform(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 373
    .end local v20           #scaleX:F
    .end local v21           #scaleY:F
    .end local v22           #workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    :cond_0
    const/4 v4, 0x2

    new-array v0, v4, [I

    move-object/from16 v18, v0

    .line 374
    .local v18, center:[I
    move-object/from16 v0, p0

    move/from16 v1, p5

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getLocalCenterForIndex(I[I)F

    move-result v19

    .line 375
    .local v19, scale:F
    const/4 v4, 0x0

    const/4 v8, 0x0

    aget v8, v18, v8

    int-to-float v8, v8

    mul-float v8, v8, p4

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    aput v8, v18, v4

    .line 376
    const/4 v4, 0x1

    const/4 v8, 0x1

    aget v8, v18, v8

    int-to-float v8, v8

    mul-float v8, v8, p4

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    aput v8, v18, v4

    .line 378
    const/4 v4, 0x0

    aget v4, v18, v4

    invoke-virtual/range {p2 .. p2}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    sub-int/2addr v4, v8

    const/4 v8, 0x1

    aget v8, v18, v8

    invoke-virtual/range {p2 .. p2}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    sub-int/2addr v8, v9

    invoke-virtual {v6, v4, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 381
    const/4 v4, 0x3

    move/from16 v0, p5

    if-ge v0, v4, :cond_1

    const/high16 v7, 0x3f00

    .line 383
    .local v7, finalAlpha:F
    :goto_0
    mul-float v10, v19, p4

    .line 384
    .local v10, finalScale:F
    const/high16 v8, 0x3f80

    const/high16 v9, 0x3f80

    const/16 v12, 0x190

    new-instance v13, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v4, 0x4000

    invoke-direct {v13, v4}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    new-instance v14, Landroid/view/animation/AccelerateInterpolator;

    const/high16 v4, 0x4000

    invoke-direct {v14, v4}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v4, p2

    move v11, v10

    move-object/from16 v15, p6

    invoke-virtual/range {v3 .. v17}, Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;Landroid/graphics/Rect;FFFFFILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 388
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 389
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 390
    new-instance v4, Lcom/cyanogenmod/trebuchet/FolderIcon$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v4, v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon$1;-><init>(Lcom/cyanogenmod/trebuchet/FolderIcon;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    const-wide/16 v8, 0x190

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v8, v9}, Lcom/cyanogenmod/trebuchet/FolderIcon;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 399
    .end local v3           #dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    .end local v5           #from:Landroid/graphics/Rect;
    .end local v6           #to:Landroid/graphics/Rect;
    .end local v7           #finalAlpha:F
    .end local v10           #finalScale:F
    .end local v18           #center:[I
    .end local v19           #scale:F
    :goto_1
    return-void

    .line 381
    .restart local v3       #dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    .restart local v5       #from:Landroid/graphics/Rect;
    .restart local v6       #to:Landroid/graphics/Rect;
    .restart local v18       #center:[I
    .restart local v19       #scale:F
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 397
    .end local v3           #dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    .end local v5           #from:Landroid/graphics/Rect;
    .end local v6           #to:Landroid/graphics/Rect;
    .end local v18           #center:[I
    .end local v19           #scale:F
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    goto :goto_1
.end method

.method private willAcceptItem(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 285
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    .line 286
    .local v0, itemType:I
    if-eqz v0, :cond_0

    if-eq v0, v1, :cond_0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Folder;->isFull()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    if-eq p1, v2, :cond_1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-boolean v2, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    if-nez v2, :cond_1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z
    .locals 2
    .parameter "dragInfo"

    .prologue
    .line 293
    move-object v0, p1

    .line 294
    .local v0, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Folder;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->willAcceptItem(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 1
    .parameter "item"

    .prologue
    .line 298
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/FolderInfo;->add(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 299
    return-void
.end method

.method public cancelLongPress()V
    .locals 1

    .prologue
    .line 652
    invoke-super {p0}, Landroid/widget/LinearLayout;->cancelLongPress()V

    .line 654
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    .line 655
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .parameter "canvas"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 523
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 525
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    if-nez v5, :cond_1

    .line 555
    :cond_0
    :goto_0
    return-void

    .line 526
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Folder;->getItemCount()I

    move-result v5

    if-nez v5, :cond_2

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimating:Z

    if-eqz v5, :cond_0

    .line 528
    :cond_2
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/Folder;->getItemsInReadingOrder(Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 533
    .local v2, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimating:Z

    if-eqz v5, :cond_4

    .line 534
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iget-object v5, v5, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->drawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewDrawingParams(Landroid/graphics/drawable/Drawable;)V

    .line 541
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x3

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 542
    .local v3, nItemsInPreview:I
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimating:Z

    if-nez v5, :cond_5

    .line 543
    add-int/lit8 v1, v3, -0x1

    .local v1, i:I
    :goto_2
    if-ltz v1, :cond_0

    .line 544
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 545
    .local v4, v:Landroid/widget/TextView;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 546
    invoke-virtual {v4}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aget-object v0, v5, v7

    .line 547
    .local v0, d:Landroid/graphics/drawable/Drawable;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    invoke-direct {p0, v1, v5}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewItemDrawingParams(ILcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    .line 548
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    iput-object v0, v5, Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;->drawable:Landroid/graphics/drawable/Drawable;

    .line 549
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    invoke-direct {p0, p1, v5}, Lcom/cyanogenmod/trebuchet/FolderIcon;->drawPreviewItem(Landroid/graphics/Canvas;Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)V

    .line 543
    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 536
    .end local v1           #i:I
    .end local v3           #nItemsInPreview:I
    .end local v4           #v:Landroid/widget/TextView;
    :cond_4
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 537
    .restart local v4       #v:Landroid/widget/TextView;
    invoke-virtual {v4}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aget-object v0, v5, v7

    .line 538
    .restart local v0       #d:Landroid/graphics/drawable/Drawable;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewDrawingParams(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 553
    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    .end local v4           #v:Landroid/widget/TextView;
    .restart local v3       #nItemsInPreview:I
    :cond_5
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mAnimParams:Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;

    invoke-direct {p0, p1, v5}, Lcom/cyanogenmod/trebuchet/FolderIcon;->drawPreviewItem(Landroid/graphics/Canvas;Lcom/cyanogenmod/trebuchet/FolderIcon$PreviewItemDrawingParams;)V

    goto :goto_0
.end method

.method getFolder()Lcom/cyanogenmod/trebuchet/Folder;
    .locals 1

    .prologue
    .line 277
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    return-object v0
.end method

.method getFolderInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    return-object v0
.end method

.method public getTextVisible()Z
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAdd(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 617
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->invalidate()V

    .line 618
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->requestLayout()V

    .line 619
    return-void
.end method

.method public onDragEnter(Ljava/lang/Object;)V
    .locals 5
    .parameter "dragInfo"

    .prologue
    .line 302
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Folder;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    check-cast p1, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .end local p1
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->willAcceptItem(Lcom/cyanogenmod/trebuchet/ItemInfo;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 309
    :cond_0
    :goto_0
    return-void

    .line 303
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 304
    .local v1, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 305
    .local v0, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    iget v3, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v4, v1, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->setCell(II)V

    .line 306
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->setCellLayout(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 307
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->animateToAcceptState()V

    .line 308
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->showFolderAccept(Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;)V

    goto :goto_0
.end method

.method public onDragExit()V
    .locals 1

    .prologue
    .line 341
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderRingAnimator:Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon$FolderRingAnimator;->animateToNaturalState()V

    .line 342
    return-void
.end method

.method public onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 14
    .parameter "d"

    .prologue
    const/4 v3, 0x0

    const/high16 v4, 0x3f80

    .line 403
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    if-eqz v0, :cond_0

    .line 405
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->makeShortcut()Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v6

    .line 418
    .local v6, item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->notifyDrop()V

    .line 419
    iget-object v7, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    iget-object v11, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    move-object v5, p0

    move-object v8, v3

    move v9, v4

    invoke-direct/range {v5 .. v11}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FILjava/lang/Runnable;)V

    .line 420
    .end local v6           #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :goto_1
    return-void

    .line 406
    :cond_0
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;

    if-eqz v0, :cond_2

    .line 407
    iget-object v12, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v12, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 408
    .local v12, folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolder:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->notifyDrop()V

    .line 409
    iget-object v0, v12, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 410
    .local v1, fItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v2, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragView:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->postAnimationRunnable:Ljava/lang/Runnable;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FILjava/lang/Runnable;)V

    goto :goto_2

    .line 412
    .end local v1           #fItem:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, v12}, Lcom/cyanogenmod/trebuchet/Launcher;->removeFolder(Lcom/cyanogenmod/trebuchet/FolderInfo;)V

    .line 413
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-static {v0, v12}, Lcom/cyanogenmod/trebuchet/LauncherModel;->deleteItemFromDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    goto :goto_1

    .line 416
    .end local v12           #folder:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v13           #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v6, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .restart local v6       #item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    goto :goto_0
.end method

.method public onItemsChanged()V
    .locals 0

    .prologue
    .line 612
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->invalidate()V

    .line 613
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->requestLayout()V

    .line 614
    return-void
.end method

.method public onRemove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 622
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->invalidate()V

    .line 623
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->requestLayout()V

    .line 624
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 151
    const/4 v0, 0x1

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/FolderIcon;->sStaticValuesDirty:Z

    .line 152
    invoke-super {p0}, Landroid/widget/LinearLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "title"

    .prologue
    .line 627
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    .line 628
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900d6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 630
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    .line 636
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 638
    .local v0, result:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 647
    :goto_0
    :pswitch_0
    return v0

    .line 640
    :pswitch_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->postCheckForLongPress()V

    goto :goto_0

    .line 644
    :pswitch_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    goto :goto_0

    .line 638
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public performCreateAnimation(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/view/View;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FLjava/lang/Runnable;)V
    .locals 8
    .parameter "destInfo"
    .parameter "destView"
    .parameter "srcInfo"
    .parameter "srcView"
    .parameter "dstRect"
    .parameter "scaleRelativeToDragLayer"
    .parameter "postAnimationRunnable"

    .prologue
    const/4 v5, 0x1

    .line 316
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v7, v0, v5

    .line 317
    .local v7, animateDrawable:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewDrawingParams(II)V

    .line 322
    const/16 v0, 0x15e

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v7, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->animateFirstItem(Landroid/graphics/drawable/Drawable;IZLjava/lang/Runnable;)V

    .line 323
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move v4, p6

    move-object v6, p7

    .line 326
    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FILjava/lang/Runnable;)V

    .line 327
    return-void
.end method

.method public performDestroyAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 4
    .parameter "finalView"
    .parameter "onCompleteRunnable"

    .prologue
    const/4 v3, 0x1

    .line 330
    move-object v1, p1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aget-object v0, v1, v3

    .line 331
    .local v0, animateDrawable:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->computePreviewDrawingParams(II)V

    .line 336
    const/16 v1, 0xc8

    invoke-direct {p0, v0, v1, v3, p2}, Lcom/cyanogenmod/trebuchet/FolderIcon;->animateFirstItem(Landroid/graphics/drawable/Drawable;IZLjava/lang/Runnable;)V

    .line 338
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 2
    .parameter "visible"

    .prologue
    .line 599
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getTextVisible()Z

    move-result v0

    if-ne v0, p1, :cond_0

    .line 605
    :goto_0
    return-void

    .line 600
    :cond_0
    if-eqz p1, :cond_1

    .line 601
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setVisibility(I)V

    goto :goto_0

    .line 603
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon;->mFolderName:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setVisibility(I)V

    goto :goto_0
.end method
