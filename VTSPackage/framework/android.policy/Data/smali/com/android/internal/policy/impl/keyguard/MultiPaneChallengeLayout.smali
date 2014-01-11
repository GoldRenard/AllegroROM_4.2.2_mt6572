.class public Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;
.super Landroid/view/ViewGroup;
.source "MultiPaneChallengeLayout.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard/ChallengeLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    }
.end annotation


# static fields
.field public static final ANIMATE_BOUNCE_DURATION:I = 0x15e

.field public static final HORIZONTAL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "MultiPaneChallengeLayout"

.field public static final VERTICAL:I = 0x1


# instance fields
.field private mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

.field private mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

.field private final mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mIsBouncing:Z

.field private mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

.field private mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

.field private mKeyguardLayerBackgroundView:Landroid/view/View;

.field private mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

.field private mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

.field private mKeyguardLayerForegroundView:Landroid/view/View;

.field final mOrientation:I

.field private final mScrimClickListener:Landroid/view/View$OnClickListener;

.field private mScrimView:Landroid/view/View;

.field private mShowKeyguardLayer:Z

.field private mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mUserSwitcherView:Landroid/view/View;

.field private final mZeroPadding:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyleAttr"

    .prologue
    const/4 v3, 0x0

    .line 79
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mTempRect:Landroid/graphics/Rect;

    .line 59
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mZeroPadding:Landroid/graphics/Rect;

    .line 63
    new-instance v2, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$1;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$1;-><init>(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimClickListener:Landroid/view/View$OnClickListener;

    .line 615
    new-instance v2, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$4;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$4;-><init>(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    .line 81
    sget-object v2, Lcom/android/internal/R$styleable;->MultiPaneChallengeLayout:[I

    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 83
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mOrientation:I

    .line 85
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 88
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 90
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->setSystemUiVisibility(I)V

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayer:Z

    return v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->updateKeyguardLayerView(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private getVirtualHeight(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;II)I
    .locals 4
    .parameter "lp"
    .parameter "height"
    .parameter "heightUsed"

    .prologue
    .line 210
    move v1, p2

    .line 211
    .local v1, virtualHeight:I
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 212
    .local v0, root:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 216
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int v1, v2, v3

    .line 218
    :cond_0
    iget v2, p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    iget v2, p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    .line 223
    :cond_1
    sub-int p2, v1, p3

    .line 227
    .end local p2
    :cond_2
    :goto_0
    return p2

    .line 224
    .restart local p2
    :cond_3
    iget v2, p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v3, 0x7

    if-eq v2, v3, :cond_2

    .line 227
    sub-int v2, v1, p3

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    goto :goto_0
.end method

.method private layoutWithGravity(IILandroid/view/View;Landroid/graphics/Rect;Z)V
    .locals 23
    .parameter "width"
    .parameter "height"
    .parameter "child"
    .parameter "padding"
    .parameter "adjustPadding"

    .prologue
    .line 397
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    check-cast v16, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .line 399
    .local v16, lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v22, v0

    add-int v21, v21, v22

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingTop()I

    move-result v22

    sub-int v21, v21, v22

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingBottom()I

    move-result v22

    sub-int v12, v21, v22

    .line 400
    .local v12, heightUsed:I
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move/from16 v2, p2

    invoke-direct {v0, v1, v2, v12}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getVirtualHeight(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;II)I

    move-result p2

    .line 402
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->gravity:I

    move/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getLayoutDirection()I

    move-result v22

    invoke-static/range {v21 .. v22}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v11

    .line 404
    .local v11, gravity:I
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    move/from16 v21, v0

    const/16 v22, 0x0

    cmpl-float v21, v21, v22

    if-lez v21, :cond_2

    const/4 v9, 0x1

    .line 405
    .local v9, fixedLayoutSize:Z
    :goto_0
    if-eqz v9, :cond_3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mOrientation:I

    move/from16 v21, v0

    if-nez v21, :cond_3

    const/4 v8, 0x1

    .line 406
    .local v8, fixedLayoutHorizontal:Z
    :goto_1
    if-eqz v9, :cond_4

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mOrientation:I

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_4

    const/4 v10, 0x1

    .line 410
    .local v10, fixedLayoutVertical:Z
    :goto_2
    if-eqz v8, :cond_5

    .line 411
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    sub-int v21, p1, v21

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v22, v0

    sub-int v18, v21, v22

    .line 412
    .local v18, paddedWidth:I
    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    const/high16 v22, 0x3f00

    add-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v4, v0

    .line 413
    .local v4, adjustedWidth:I
    move/from16 v3, p2

    .line 423
    .end local v18           #paddedWidth:I
    .local v3, adjustedHeight:I
    :goto_3
    invoke-static {v11}, Landroid/view/Gravity;->isVertical(I)Z

    move-result v14

    .line 424
    .local v14, isVertical:Z
    invoke-static {v11}, Landroid/view/Gravity;->isHorizontal(I)Z

    move-result v13

    .line 425
    .local v13, isHorizontal:Z
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    .line 426
    .local v7, childWidth:I
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 428
    .local v6, childHeight:I
    move-object/from16 v0, p4

    iget v15, v0, Landroid/graphics/Rect;->left:I

    .line 429
    .local v15, left:I
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    .line 430
    .local v20, top:I
    add-int v19, v15, v7

    .line 431
    .local v19, right:I
    add-int v5, v20, v6

    .line 432
    .local v5, bottom:I
    and-int/lit8 v21, v11, 0x70

    sparse-switch v21, :sswitch_data_0

    .line 457
    :cond_0
    :goto_4
    and-int/lit8 v21, v11, 0x7

    packed-switch v21, :pswitch_data_0

    .line 483
    :cond_1
    :goto_5
    :pswitch_0
    move-object/from16 v0, p3

    move/from16 v1, v20

    move/from16 v2, v19

    invoke-virtual {v0, v15, v1, v2, v5}, Landroid/view/View;->layout(IIII)V

    .line 484
    return-void

    .line 404
    .end local v3           #adjustedHeight:I
    .end local v4           #adjustedWidth:I
    .end local v5           #bottom:I
    .end local v6           #childHeight:I
    .end local v7           #childWidth:I
    .end local v8           #fixedLayoutHorizontal:Z
    .end local v9           #fixedLayoutSize:Z
    .end local v10           #fixedLayoutVertical:Z
    .end local v13           #isHorizontal:Z
    .end local v14           #isVertical:Z
    .end local v15           #left:I
    .end local v19           #right:I
    .end local v20           #top:I
    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 405
    .restart local v9       #fixedLayoutSize:Z
    :cond_3
    const/4 v8, 0x0

    goto :goto_1

    .line 406
    .restart local v8       #fixedLayoutHorizontal:Z
    :cond_4
    const/4 v10, 0x0

    goto :goto_2

    .line 414
    .restart local v10       #fixedLayoutVertical:Z
    :cond_5
    if-eqz v10, :cond_6

    .line 415
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingTop()I

    move-result v21

    sub-int v21, p2, v21

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingBottom()I

    move-result v22

    sub-int v17, v21, v22

    .line 416
    .local v17, paddedHeight:I
    move/from16 v4, p1

    .line 417
    .restart local v4       #adjustedWidth:I
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    const/high16 v22, 0x3f00

    add-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v3, v0

    .line 418
    .restart local v3       #adjustedHeight:I
    goto :goto_3

    .line 419
    .end local v3           #adjustedHeight:I
    .end local v4           #adjustedWidth:I
    .end local v17           #paddedHeight:I
    :cond_6
    move/from16 v4, p1

    .line 420
    .restart local v4       #adjustedWidth:I
    move/from16 v3, p2

    .restart local v3       #adjustedHeight:I
    goto :goto_3

    .line 434
    .restart local v5       #bottom:I
    .restart local v6       #childHeight:I
    .restart local v7       #childWidth:I
    .restart local v13       #isHorizontal:Z
    .restart local v14       #isVertical:Z
    .restart local v15       #left:I
    .restart local v19       #right:I
    .restart local v20       #top:I
    :sswitch_0
    if-eqz v10, :cond_7

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    sub-int v22, v3, v6

    div-int/lit8 v22, v22, 0x2

    add-int v20, v21, v22

    .line 436
    :goto_6
    add-int v5, v20, v6

    .line 437
    if-eqz p5, :cond_0

    if-eqz v14, :cond_0

    .line 438
    move-object/from16 v0, p4

    iput v5, v0, Landroid/graphics/Rect;->top:I

    .line 439
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v21, v0

    div-int/lit8 v22, v6, 0x2

    add-int v21, v21, v22

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->bottom:I

    goto :goto_4

    .line 434
    :cond_7
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    goto :goto_6

    .line 443
    :sswitch_1
    if-eqz v10, :cond_8

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    add-int v21, v21, p2

    sub-int v22, v3, v6

    div-int/lit8 v22, v22, 0x2

    sub-int v5, v21, v22

    .line 446
    :goto_7
    sub-int v20, v5, v6

    .line 447
    if-eqz p5, :cond_0

    if-eqz v14, :cond_0

    .line 448
    sub-int v21, p2, v20

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->bottom:I

    .line 449
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    div-int/lit8 v22, v6, 0x2

    add-int v21, v21, v22

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->top:I

    goto/16 :goto_4

    .line 443
    :cond_8
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    add-int v5, v21, p2

    goto :goto_7

    .line 453
    :sswitch_2
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v21, v0

    sub-int v22, p2, v6

    div-int/lit8 v22, v22, 0x2

    add-int v20, v21, v22

    .line 454
    add-int v5, v20, v6

    goto/16 :goto_4

    .line 459
    :pswitch_1
    if-eqz v8, :cond_9

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    sub-int v22, v4, v7

    div-int/lit8 v22, v22, 0x2

    add-int v15, v21, v22

    .line 461
    :goto_8
    add-int v19, v15, v7

    .line 462
    if-eqz p5, :cond_1

    if-eqz v13, :cond_1

    if-nez v14, :cond_1

    .line 463
    move/from16 v0, v19

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->left:I

    .line 464
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v21, v0

    div-int/lit8 v22, v7, 0x2

    add-int v21, v21, v22

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->right:I

    goto/16 :goto_5

    .line 459
    :cond_9
    move-object/from16 v0, p4

    iget v15, v0, Landroid/graphics/Rect;->left:I

    goto :goto_8

    .line 468
    :pswitch_2
    if-eqz v8, :cond_a

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v21, v0

    sub-int v21, p1, v21

    sub-int v22, v4, v7

    div-int/lit8 v22, v22, 0x2

    sub-int v19, v21, v22

    .line 471
    :goto_9
    sub-int v15, v19, v7

    .line 472
    if-eqz p5, :cond_1

    if-eqz v13, :cond_1

    if-nez v14, :cond_1

    .line 473
    sub-int v21, p1, v15

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->right:I

    .line 474
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    div-int/lit8 v22, v7, 0x2

    add-int v21, v21, v22

    move/from16 v0, v21

    move-object/from16 v1, p4

    iput v0, v1, Landroid/graphics/Rect;->left:I

    goto/16 :goto_5

    .line 468
    :cond_a
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v21, v0

    sub-int v19, p1, v21

    goto :goto_9

    .line 478
    :pswitch_3
    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    sub-int v21, p1, v21

    move-object/from16 v0, p4

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v22, v0

    sub-int v18, v21, v22

    .line 479
    .restart local v18       #paddedWidth:I
    sub-int v21, v18, v7

    div-int/lit8 v15, v21, 0x2

    .line 480
    add-int v19, v15, v7

    goto/16 :goto_5

    .line 432
    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_2
        0x30 -> :sswitch_0
        0x50 -> :sswitch_1
    .end sparse-switch

    .line 457
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private updateKeyguardLayerPosition(I)V
    .locals 4
    .parameter "bottom"

    .prologue
    .line 706
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v0, :cond_0

    .line 707
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    sub-int v2, p1, v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getRight()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 723
    :cond_0
    return-void
.end method

.method private updateKeyguardLayerView(Z)V
    .locals 12
    .parameter "show"

    .prologue
    .line 649
    const-string v8, "MultiPaneChallengeLayout"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateDataUsageView show="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 650
    if-eqz p1, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    if-nez v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    if-nez v8, :cond_1

    .line 652
    :try_start_0
    const-class v8, Lcom/mediatek/common/pluginmanager/IPluginManager;

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "create"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mContext:Landroid/content/Context;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-class v11, Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const/4 v11, 0x0

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Lcom/mediatek/common/MediatekClassFactory;->createInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/common/pluginmanager/IPluginManager;

    .line 657
    .local v5, plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    invoke-interface {v5}, Lcom/mediatek/common/pluginmanager/IPluginManager;->getPluginCount()I

    move-result v7

    .line 658
    .local v7, pluginCount:I
    if-eqz v7, :cond_2

    .line 662
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v7, :cond_2

    .line 663
    invoke-interface {v5, v1}, Lcom/mediatek/common/pluginmanager/IPluginManager;->getPlugin(I)Lcom/mediatek/common/pluginmanager/IPlugin;

    move-result-object v6

    .line 664
    .local v6, plugin:Lcom/mediatek/common/pluginmanager/IPlugin;
    invoke-interface {v6}, Lcom/mediatek/common/pluginmanager/IPlugin;->createObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 665
    .local v2, keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    invoke-interface {v2}, Lcom/mediatek/common/policy/IKeyguardLayer;->create()Landroid/view/View;

    move-result-object v3

    .line 666
    .local v3, keyguardLayerView:Landroid/view/View;
    invoke-interface {v2}, Lcom/mediatek/common/policy/IKeyguardLayer;->getKeyguardLayerInfo()Lcom/mediatek/common/policy/KeyguardLayerInfo;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 667
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 668
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    .line 662
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 670
    :cond_0
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 671
    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 687
    .end local v1           #i:I
    .end local v2           #keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    .end local v3           #keyguardLayerView:Landroid/view/View;
    .end local v5           #plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    .end local v6           #plugin:Lcom/mediatek/common/pluginmanager/IPlugin;
    .end local v7           #pluginCount:I
    :catch_0
    move-exception v0

    .line 688
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 691
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    :goto_2
    return-void

    .line 676
    .restart local v5       #plugManager:Lcom/mediatek/common/pluginmanager/IPluginManager;
    .restart local v7       #pluginCount:I
    :cond_2
    :try_start_1
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    if-eqz v8, :cond_3

    .line 677
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v4, v8, v9}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(II)V

    .line 678
    .local v4, layoutParam:Landroid/view/ViewGroup$LayoutParams;
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    invoke-virtual {v8, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 679
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundView:Landroid/view/View;

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 682
    .end local v4           #layoutParam:Landroid/view/ViewGroup$LayoutParams;
    :cond_3
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    if-eqz v8, :cond_1

    .line 683
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v4, v8, v9}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(II)V

    .line 684
    .restart local v4       #layoutParam:Landroid/view/ViewGroup$LayoutParams;
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    invoke-virtual {v8, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 685
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundView:Landroid/view/View;

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 505
    instance-of v0, p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .prologue
    .line 500
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 488
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 493
    instance-of v0, p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    check-cast p1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .end local p1
    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;)V

    :goto_0
    return-object v0

    .restart local p1
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1
    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_0

    .restart local p1
    :cond_1
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public getBouncerAnimationDuration()I
    .locals 1

    .prologue
    .line 109
    const/16 v0, 0x15e

    return v0
.end method

.method public hideBouncer()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 138
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    if-nez v1, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    .line 140
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 141
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v1, :cond_2

    .line 142
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/16 v2, 0x15e

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->hideBouncer(I)V

    .line 145
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    const-string v2, "alpha"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v4, v3, v5

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 146
    .local v0, anim:Landroid/animation/Animator;
    const-wide/16 v1, 0x15e

    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 147
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$3;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$3;-><init>(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 153
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 155
    .end local v0           #anim:Landroid/animation/Animator;
    :cond_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    if-eqz v1, :cond_0

    .line 156
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    invoke-interface {v1, v5}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;->onBouncerStateChanged(Z)V

    goto :goto_0
.end method

.method public isBouncing()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    return v0
.end method

.method public isChallengeOverlapping()Z
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public isChallengeShowing()Z
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 173
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 176
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 179
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-interface {v0}, Lcom/mediatek/common/policy/IKeyguardLayer;->destroy()V

    .line 181
    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    if-eqz v0, :cond_1

    .line 184
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-interface {v0}, Lcom/mediatek/common/policy/IKeyguardLayer;->destroy()V

    .line 185
    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForeground:Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 187
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .prologue
    .line 629
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 630
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildCount()I

    move-result v1

    .line 631
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_4

    .line 632
    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 633
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .line 634
    .local v3, lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    .line 635
    check-cast v0, Landroid/widget/FrameLayout;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    .line 631
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 636
    .restart local v0       #child:Landroid/view/View;
    :cond_1
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/16 v5, 0x9

    if-ne v4, v5, :cond_2

    .line 637
    check-cast v0, Landroid/widget/FrameLayout;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerBackgroundLayout:Landroid/widget/FrameLayout;

    goto :goto_1

    .line 638
    .restart local v0       #child:Landroid/view/View;
    :cond_2
    iget v4, v3, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 639
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v4, :cond_3

    .line 640
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "There may only be one child with layout_isChallenge=\"true\""

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 643
    :cond_3
    check-cast v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .end local v0           #child:Landroid/view/View;
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    goto :goto_1

    .line 646
    .end local v3           #lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    :cond_4
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 18
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 352
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mTempRect:Landroid/graphics/Rect;

    .line 353
    .local v8, padding:Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingLeft()I

    move-result v4

    iput v4, v8, Landroid/graphics/Rect;->left:I

    .line 354
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingTop()I

    move-result v4

    iput v4, v8, Landroid/graphics/Rect;->top:I

    .line 355
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingRight()I

    move-result v4

    iput v4, v8, Landroid/graphics/Rect;->right:I

    .line 356
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getPaddingBottom()I

    move-result v4

    iput v4, v8, Landroid/graphics/Rect;->bottom:I

    .line 357
    sub-int v5, p4, p2

    .line 358
    .local v5, width:I
    sub-int v6, p5, p3

    .line 362
    .local v6, height:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v7, 0x8

    if-eq v4, v7, :cond_0

    .line 363
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    const/4 v9, 0x1

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->layoutWithGravity(IILandroid/view/View;Landroid/graphics/Rect;Z)V

    .line 366
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildCount()I

    move-result v15

    .line 367
    .local v15, count:I
    const/16 v16, 0x0

    .local v16, i:I
    :goto_0
    move/from16 v0, v16

    if-ge v0, v15, :cond_7

    .line 368
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 369
    .local v12, child:Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .line 372
    .local v17, lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    if-eq v12, v4, :cond_1

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v7, 0x8

    if-ne v4, v7, :cond_2

    .line 367
    :cond_1
    :goto_1
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 374
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    if-ne v12, v4, :cond_3

    .line 375
    const/4 v4, 0x0

    const/4 v7, 0x0

    invoke-virtual {v12, v4, v7, v5, v6}, Landroid/view/View;->layout(IIII)V

    goto :goto_1

    .line 377
    :cond_3
    move-object/from16 v0, v17

    iget v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v7, 0x7

    if-ne v4, v7, :cond_4

    .line 378
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mZeroPadding:Landroid/graphics/Rect;

    const/4 v14, 0x0

    move-object/from16 v9, p0

    move v10, v5

    move v11, v6

    invoke-direct/range {v9 .. v14}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->layoutWithGravity(IILandroid/view/View;Landroid/graphics/Rect;Z)V

    goto :goto_1

    .line 380
    :cond_4
    move-object/from16 v0, v17

    iget v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/16 v7, 0x8

    if-eq v4, v7, :cond_1

    .line 382
    move-object/from16 v0, v17

    iget v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/16 v7, 0x9

    if-ne v4, v7, :cond_5

    .line 383
    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v12, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 386
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_6

    .line 388
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v7

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v9

    sub-int/2addr v7, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->getBottom()I

    move-result v9

    move/from16 v0, p2

    move/from16 v1, p4

    invoke-virtual {v4, v0, v7, v1, v9}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 391
    :cond_6
    const/4 v9, 0x0

    move-object/from16 v4, p0

    move-object v7, v12

    invoke-direct/range {v4 .. v9}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->layoutWithGravity(IILandroid/view/View;Landroid/graphics/Rect;Z)V

    goto :goto_1

    .line 393
    .end local v12           #child:Landroid/view/View;
    .end local v17           #lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    :cond_7
    return-void
.end method

.method protected onMeasure(II)V
    .locals 16
    .parameter "widthSpec"
    .parameter "heightSpec"

    .prologue
    .line 232
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    const/high16 v5, 0x4000

    if-ne v2, v5, :cond_0

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    const/high16 v5, 0x4000

    if-eq v2, v5, :cond_1

    .line 234
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v5, "MultiPaneChallengeLayout must be measured with an exact size"

    invoke-direct {v2, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 238
    :cond_1
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v14

    .line 239
    .local v14, width:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 240
    .local v9, height:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v9}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->setMeasuredDimension(II)V

    .line 242
    const/4 v15, 0x0

    .line 243
    .local v15, widthUsed:I
    const/4 v10, 0x0

    .line 247
    .local v10, heightUsed:I
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .line 248
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    .line 249
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildCount()I

    move-result v8

    .line 250
    .local v8, count:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    if-ge v11, v8, :cond_b

    .line 251
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 252
    .local v3, child:Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .line 254
    .local v12, lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x2

    if-ne v2, v5, :cond_5

    .line 255
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v2, :cond_2

    .line 256
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v5, "There may only be one child of type challenge"

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 259
    :cond_2
    instance-of v2, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-nez v2, :cond_3

    .line 260
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v5, "Challenge must be a KeyguardSecurityContainer"

    invoke-direct {v2, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 263
    :cond_3
    check-cast v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .end local v3           #child:Landroid/view/View;
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    .line 250
    :cond_4
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 264
    .restart local v3       #child:Landroid/view/View;
    :cond_5
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x3

    if-ne v2, v5, :cond_a

    .line 265
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    if-eqz v2, :cond_6

    .line 266
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v5, "There may only be one child of type userSwitcher"

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 269
    :cond_6
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mUserSwitcherView:Landroid/view/View;

    .line 271
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v5, 0x8

    if-eq v2, v5, :cond_4

    .line 273
    move/from16 v4, p1

    .line 274
    .local v4, adjustedWidthSpec:I
    move/from16 v6, p2

    .line 275
    .local v6, adjustedHeightSpec:I
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxWidth:I

    if-ltz v2, :cond_7

    .line 276
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxWidth:I

    invoke-static {v2, v14}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 279
    :cond_7
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxHeight:I

    if-ltz v2, :cond_8

    .line 280
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxHeight:I

    invoke-static {v2, v9}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 284
    :cond_8
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 288
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->gravity:I

    invoke-static {v2}, Landroid/view/Gravity;->isVertical(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 289
    int-to-float v2, v10

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    const/high16 v7, 0x3fc0

    mul-float/2addr v5, v7

    add-float/2addr v2, v5

    float-to-int v10, v2

    goto :goto_1

    .line 290
    :cond_9
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->gravity:I

    invoke-static {v2}, Landroid/view/Gravity;->isHorizontal(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 291
    int-to-float v2, v15

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    const/high16 v7, 0x3fc0

    mul-float/2addr v5, v7

    add-float/2addr v2, v5

    float-to-int v15, v2

    goto :goto_1

    .line 293
    .end local v4           #adjustedWidthSpec:I
    .end local v6           #adjustedHeightSpec:I
    :cond_a
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x4

    if-ne v2, v5, :cond_4

    .line 294
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->setScrimView(Landroid/view/View;)V

    .line 295
    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v3, v0, v1}, Landroid/view/View;->measure(II)V

    goto/16 :goto_1

    .line 300
    .end local v3           #child:Landroid/view/View;
    .end local v12           #lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    :cond_b
    const/4 v11, 0x0

    :goto_2
    if-ge v11, v8, :cond_12

    .line 301
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 302
    .restart local v3       #child:Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;

    .line 304
    .restart local v12       #lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x3

    if-eq v2, v5, :cond_c

    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->childType:I

    const/4 v5, 0x4

    if-eq v2, v5, :cond_c

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v5, 0x8

    if-ne v2, v5, :cond_d

    .line 300
    :cond_c
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 311
    :cond_d
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v9, v10}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->getVirtualHeight(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;II)I

    move-result v13

    .line 315
    .local v13, virtualHeight:I
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    const/4 v5, 0x0

    cmpl-float v2, v2, v5

    if-lez v2, :cond_11

    .line 316
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mOrientation:I

    if-nez v2, :cond_10

    .line 317
    sub-int v2, v14, v15

    int-to-float v2, v2

    iget v5, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    mul-float/2addr v2, v5

    const/high16 v5, 0x3f00

    add-float/2addr v2, v5

    float-to-int v2, v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 320
    .restart local v4       #adjustedWidthSpec:I
    const/high16 v2, 0x4000

    invoke-static {v13, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 335
    .restart local v6       #adjustedHeightSpec:I
    :goto_4
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxWidth:I

    if-ltz v2, :cond_e

    .line 336
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxWidth:I

    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 340
    :cond_e
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxHeight:I

    if-ltz v2, :cond_f

    .line 341
    iget v2, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->maxHeight:I

    invoke-static {v6}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 346
    :cond_f
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    goto :goto_3

    .line 323
    .end local v4           #adjustedWidthSpec:I
    .end local v6           #adjustedHeightSpec:I
    :cond_10
    sub-int v2, v14, v15

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 325
    .restart local v4       #adjustedWidthSpec:I
    int-to-float v2, v13

    iget v5, v12, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;->centerWithinArea:F

    mul-float/2addr v2, v5

    const/high16 v5, 0x3f00

    add-float/2addr v2, v5

    float-to-int v2, v2

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .restart local v6       #adjustedHeightSpec:I
    goto :goto_4

    .line 330
    .end local v4           #adjustedWidthSpec:I
    .end local v6           #adjustedHeightSpec:I
    :cond_11
    sub-int v2, v14, v15

    const/high16 v5, 0x4000

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 332
    .restart local v4       #adjustedWidthSpec:I
    const/high16 v2, 0x4000

    invoke-static {v13, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .restart local v6       #adjustedHeightSpec:I
    goto :goto_4

    .line 348
    .end local v3           #child:Landroid/view/View;
    .end local v4           #adjustedWidthSpec:I
    .end local v6           #adjustedHeightSpec:I
    .end local v12           #lp:Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$LayoutParams;
    .end local v13           #virtualHeight:I
    :cond_12
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "child"
    .parameter "focused"

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eq p1, v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->hideBouncer()V

    .line 195
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 196
    return-void
.end method

.method public setClipChildrenForNewEventView(Z)V
    .locals 1
    .parameter "clipChildren"

    .prologue
    .line 726
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->setClipChildren(Z)V

    .line 727
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    invoke-virtual {v0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->setClipChildrenForNewEventView(Z)V

    .line 730
    :cond_0
    return-void
.end method

.method public setOnBouncerStateChangedListener(Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    .line 168
    return-void
.end method

.method setScrimView(Landroid/view/View;)V
    .locals 2
    .parameter "scrim"

    .prologue
    .line 199
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    :cond_0
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    .line 203
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    if-eqz v0, :cond_1

    const/high16 v0, 0x3f80

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 204
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 205
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 206
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    return-void

    .line 203
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 204
    :cond_2
    const/4 v0, 0x4

    goto :goto_1
.end method

.method public setTouchRecepientForKeyguardLayer(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V
    .locals 1
    .parameter "glowPadView"

    .prologue
    .line 700
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 701
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mKeyguardLayerForegroundLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setTouchRecepient(Landroid/view/View;)V

    .line 703
    :cond_0
    return-void
.end method

.method public showBouncer()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 114
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    if-eqz v1, :cond_1

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    iput-boolean v6, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mIsBouncing:Z

    .line 116
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 117
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    if-eqz v1, :cond_2

    .line 118
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mChallengeView:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;

    const/16 v2, 0x15e

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityContainer;->showBouncer(I)V

    .line 121
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mScrimView:Landroid/view/View;

    const-string v2, "alpha"

    new-array v3, v6, [F

    const/4 v4, 0x0

    const/high16 v5, 0x3f80

    aput v5, v3, v4

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 122
    .local v0, anim:Landroid/animation/Animator;
    const-wide/16 v1, 0x15e

    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 123
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$2;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout$2;-><init>(Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 129
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 131
    .end local v0           #anim:Landroid/animation/Animator;
    :cond_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    if-eqz v1, :cond_0

    .line 132
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mBouncerListener:Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;

    invoke-interface {v1, v6}, Lcom/android/internal/policy/impl/keyguard/ChallengeLayout$OnBouncerStateChangedListener;->onBouncerStateChanged(Z)V

    goto :goto_0
.end method

.method public showChallenge(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 105
    return-void
.end method

.method public updateKeyguardLayerVisibility(Z)V
    .locals 1
    .parameter "show"

    .prologue
    .line 694
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayer:Z

    .line 695
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 696
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->mShowKeyguardLayerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MultiPaneChallengeLayout;->post(Ljava/lang/Runnable;)Z

    .line 697
    return-void
.end method
