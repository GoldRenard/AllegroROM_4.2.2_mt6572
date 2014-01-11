.class public Lcom/android/systemui/BeanBag$Board;
.super Landroid/widget/FrameLayout;
.source "BeanBag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/BeanBag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Board"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/BeanBag$Board$Bean;
    }
.end annotation


# static fields
.field static BEANS:[I

.field static COLORS:[I

.field static LUCKY:F

.field static MAX_RADIUS:I

.field static MAX_SCALE:F

.field static MIN_SCALE:F

.field static NUM_BEANS:I

.field static sRNG:Ljava/util/Random;


# instance fields
.field private boardHeight:I

.field private boardWidth:I

.field mAnim:Landroid/animation/TimeAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 64
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    .line 104
    const/16 v0, 0x28

    sput v0, Lcom/android/systemui/BeanBag$Board;->NUM_BEANS:I

    .line 105
    const v0, 0x3e4ccccd

    sput v0, Lcom/android/systemui/BeanBag$Board;->MIN_SCALE:F

    .line 106
    const/high16 v0, 0x3f80

    sput v0, Lcom/android/systemui/BeanBag$Board;->MAX_SCALE:F

    .line 108
    const v0, 0x3a83126f

    sput v0, Lcom/android/systemui/BeanBag$Board;->LUCKY:F

    .line 110
    const/high16 v0, 0x4410

    sget v1, Lcom/android/systemui/BeanBag$Board;->MAX_SCALE:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Lcom/android/systemui/BeanBag$Board;->MAX_RADIUS:I

    .line 112
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/systemui/BeanBag$Board;->BEANS:[I

    .line 124
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/systemui/BeanBag$Board;->COLORS:[I

    return-void

    .line 112
    :array_0
    .array-data 0x4
        0x2ft 0x1t 0x2t 0x7ft
        0x2ft 0x1t 0x2t 0x7ft
        0x2ft 0x1t 0x2t 0x7ft
        0x2ft 0x1t 0x2t 0x7ft
        0x30t 0x1t 0x2t 0x7ft
        0x30t 0x1t 0x2t 0x7ft
        0x31t 0x1t 0x2t 0x7ft
        0x31t 0x1t 0x2t 0x7ft
        0x32t 0x1t 0x2t 0x7ft
    .end array-data

    .line 124
    :array_1
    .array-data 0x4
        0x0t 0xcct 0x0t 0xfft
        0x0t 0x0t 0xcct 0xfft
        0xcct 0x0t 0x0t 0xfft
        0x0t 0xfft 0xfft 0xfft
        0x0t 0x80t 0xfft 0xfft
        0xfft 0xcct 0x0t 0xfft
        0x80t 0x0t 0xfft 0xfft
        0xfft 0x0t 0x80t 0xfft
        0x80t 0x80t 0xfft 0xfft
        0xfft 0x80t 0x80t 0xfft
        0xd0t 0xc0t 0xb0t 0xfft
        0xddt 0xddt 0xddt 0xfft
        0x33t 0x33t 0x33t 0xfft
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "as"

    .prologue
    const/4 v0, 0x1

    .line 271
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 273
    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBag$Board;->setSystemUiVisibility(I)V

    .line 275
    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBag$Board;->setWillNotDraw(Z)V

    .line 276
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/BeanBag$Board;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget v0, p0, Lcom/android/systemui/BeanBag$Board;->boardHeight:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/systemui/BeanBag$Board;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget v0, p0, Lcom/android/systemui/BeanBag$Board;->boardWidth:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/systemui/BeanBag$Board;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/android/systemui/BeanBag$Board;->reset()V

    return-void
.end method

.method static clamp(FFF)F
    .locals 1
    .parameter "x"
    .parameter "a"
    .parameter "b"

    .prologue
    .line 87
    cmpg-float v0, p0, p1

    if-gez v0, :cond_0

    .end local p1
    :goto_0
    return p1

    .restart local p1
    :cond_0
    cmpl-float v0, p0, p2

    if-lez v0, :cond_1

    move p1, p2

    goto :goto_0

    :cond_1
    move p1, p0

    goto :goto_0
.end method

.method static dot(FFFF)F
    .locals 1
    .parameter "x1"
    .parameter "y1"
    .parameter "x2"
    .parameter "y2"

    .prologue
    .line 91
    mul-float v0, p0, p2

    add-float/2addr v0, p1

    add-float/2addr v0, p3

    return v0
.end method

.method static flip()Z
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextBoolean()Z

    move-result v0

    return v0
.end method

.method static lerp(FFF)F
    .locals 1
    .parameter "a"
    .parameter "b"
    .parameter "f"

    .prologue
    .line 67
    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method

.method static mag(FF)F
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 83
    mul-float v0, p0, p0

    mul-float v1, p1, p1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method static pick([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;)TE;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, array:[Ljava/lang/Object;,"[TE;"
    array-length v0, p0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 96
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    array-length v1, p0

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    aget-object v0, p0, v0

    goto :goto_0
.end method

.method static pickInt([I)I
    .locals 2
    .parameter "array"

    .prologue
    .line 100
    array-length v0, p0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 101
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    array-length v1, p0

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    aget v0, p0, v0

    goto :goto_0
.end method

.method static randfrange(FF)F
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 71
    sget-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/android/systemui/BeanBag$Board;->lerp(FFF)F

    move-result v0

    return v0
.end method

.method static randsign()I
    .locals 1

    .prologue
    .line 75
    sget-object v0, Lcom/android/systemui/BeanBag$Board;->sRNG:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextBoolean()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private reset()V
    .locals 6

    .prologue
    const/4 v3, -0x2

    const/4 v5, 0x0

    .line 280
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board;->removeAllViews()V

    .line 282
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 286
    .local v2, wrap:Landroid/view/ViewGroup$LayoutParams;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v3, Lcom/android/systemui/BeanBag$Board;->NUM_BEANS:I

    if-ge v0, v3, :cond_0

    .line 287
    new-instance v1, Lcom/android/systemui/BeanBag$Board$Bean;

    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, p0, v3, v4}, Lcom/android/systemui/BeanBag$Board$Bean;-><init>(Lcom/android/systemui/BeanBag$Board;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 288
    .local v1, nv:Lcom/android/systemui/BeanBag$Board$Bean;
    invoke-virtual {p0, v1, v2}, Lcom/android/systemui/BeanBag$Board;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    int-to-float v3, v0

    sget v4, Lcom/android/systemui/BeanBag$Board;->NUM_BEANS:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    iput v3, v1, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    .line 290
    iget v3, v1, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    iget v4, v1, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    mul-float/2addr v3, v4

    iput v3, v1, Lcom/android/systemui/BeanBag$Board$Bean;->z:F

    .line 291
    invoke-virtual {v1}, Lcom/android/systemui/BeanBag$Board$Bean;->reset()V

    .line 292
    iget v3, p0, Lcom/android/systemui/BeanBag$Board;->boardWidth:I

    int-to-float v3, v3

    invoke-static {v5, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iput v3, v1, Lcom/android/systemui/BeanBag$Board$Bean;->x:F

    .line 293
    iget v3, p0, Lcom/android/systemui/BeanBag$Board;->boardHeight:I

    int-to-float v3, v3

    invoke-static {v5, v3}, Lcom/android/systemui/BeanBag$Board;->randfrange(FF)F

    move-result v3

    iput v3, v1, Lcom/android/systemui/BeanBag$Board$Bean;->y:F

    .line 286
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 296
    .end local v1           #nv:Lcom/android/systemui/BeanBag$Board$Bean;
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    if-eqz v3, :cond_1

    .line 297
    iget-object v3, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    invoke-virtual {v3}, Landroid/animation/TimeAnimator;->cancel()V

    .line 299
    :cond_1
    new-instance v3, Landroid/animation/TimeAnimator;

    invoke-direct {v3}, Landroid/animation/TimeAnimator;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    .line 300
    iget-object v3, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    new-instance v4, Lcom/android/systemui/BeanBag$Board$1;

    invoke-direct {v4, p0}, Lcom/android/systemui/BeanBag$Board$1;-><init>(Lcom/android/systemui/BeanBag$Board;)V

    invoke-virtual {v3, v4}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    .line 339
    return-void
.end method


# virtual methods
.method public isOpaque()Z
    .locals 1

    .prologue
    .line 373
    const/4 v0, 0x0

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 367
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 368
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board;->stopAnimation()V

    .line 369
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 398
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 343
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 344
    iput p1, p0, Lcom/android/systemui/BeanBag$Board;->boardWidth:I

    .line 345
    iput p2, p0, Lcom/android/systemui/BeanBag$Board;->boardHeight:I

    .line 347
    return-void
.end method

.method public startAnimation()V
    .locals 1

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag$Board;->stopAnimation()V

    .line 351
    iget-object v0, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    if-nez v0, :cond_0

    .line 352
    new-instance v0, Lcom/android/systemui/BeanBag$Board$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/BeanBag$Board$2;-><init>(Lcom/android/systemui/BeanBag$Board;)V

    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBag$Board;->post(Ljava/lang/Runnable;)Z

    .line 359
    :goto_0
    return-void

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    invoke-virtual {v0}, Landroid/animation/TimeAnimator;->start()V

    goto :goto_0
.end method

.method public stopAnimation()V
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/BeanBag$Board;->mAnim:Landroid/animation/TimeAnimator;

    invoke-virtual {v0}, Landroid/animation/TimeAnimator;->cancel()V

    .line 363
    :cond_0
    return-void
.end method
