.class Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "KeyguardCircleFramedDrawable.java"


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private mDstRect:Landroid/graphics/RectF;

.field private final mFrameColor:I

.field private mFramePath:Landroid/graphics/Path;

.field private mFrameRect:Landroid/graphics/RectF;

.field private final mFrameShadowColor:I

.field private final mHighlightColor:I

.field private final mPaint:Landroid/graphics/Paint;

.field private mPressed:Z

.field private mScale:F

.field private final mShadowRadius:F

.field private final mSize:I

.field private mSrcRect:Landroid/graphics/Rect;

.field private final mStrokeWidth:F


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIFIFI)V
    .locals 13
    .parameter "bitmap"
    .parameter "size"
    .parameter "frameColor"
    .parameter "strokeWidth"
    .parameter "frameShadowColor"
    .parameter "shadowRadius"
    .parameter "highlightColor"

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 57
    iput p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    .line 58
    move/from16 v0, p6

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    .line 59
    move/from16 v0, p3

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameColor:I

    .line 60
    move/from16 v0, p5

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameShadowColor:I

    .line 61
    move/from16 v0, p4

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    .line 62
    move/from16 v0, p7

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mHighlightColor:I

    .line 64
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 65
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 67
    .local v1, canvas:Landroid/graphics/Canvas;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 68
    .local v7, width:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 69
    .local v5, height:I
    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 71
    .local v6, square:I
    new-instance v3, Landroid/graphics/Rect;

    sub-int v8, v7, v6

    div-int/lit8 v8, v8, 0x2

    sub-int v9, v5, v6

    div-int/lit8 v9, v9, 0x2

    invoke-direct {v3, v8, v9, v6, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 72
    .local v3, cropRect:Landroid/graphics/Rect;
    new-instance v2, Landroid/graphics/RectF;

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget v10, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    int-to-float v10, v10

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    int-to-float v11, v11

    invoke-direct {v2, v8, v9, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 73
    .local v2, circleRect:Landroid/graphics/RectF;
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    const/high16 v9, 0x4000

    div-float/2addr v8, v9

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    const/high16 v10, 0x4000

    div-float/2addr v9, v10

    invoke-virtual {v2, v8, v9}, Landroid/graphics/RectF;->inset(FF)V

    .line 74
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    invoke-virtual {v2, v8, v9}, Landroid/graphics/RectF;->inset(FF)V

    .line 76
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 77
    .local v4, fillPath:Landroid/graphics/Path;
    const/4 v8, 0x0

    const/high16 v9, 0x43b4

    invoke-virtual {v4, v2, v8, v9}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 79
    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v8, v9}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 82
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    .line 83
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 84
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    const/high16 v9, -0x100

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 85
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 86
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v8}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 89
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    new-instance v9, Landroid/graphics/PorterDuffXfermode;

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v9, v10}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 90
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1, v3, v2, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 93
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 95
    const/high16 v8, 0x3f80

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mScale:F

    .line 97
    new-instance v8, Landroid/graphics/Rect;

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    iget v12, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSrcRect:Landroid/graphics/Rect;

    .line 98
    new-instance v8, Landroid/graphics/RectF;

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    int-to-float v11, v11

    iget v12, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSize:I

    int-to-float v12, v12

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mDstRect:Landroid/graphics/RectF;

    .line 99
    new-instance v8, Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mDstRect:Landroid/graphics/RectF;

    invoke-direct {v8, v9}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameRect:Landroid/graphics/RectF;

    .line 100
    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFramePath:Landroid/graphics/Path;

    .line 101
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9
    .parameter "canvas"

    .prologue
    const/high16 v7, 0x4000

    const/4 v8, 0x0

    .line 106
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v1, v3

    .line 107
    .local v1, outside:F
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mScale:F

    mul-float v0, v3, v1

    .line 108
    .local v0, inside:F
    sub-float v3, v1, v0

    div-float v2, v3, v7

    .line 110
    .local v2, pad:F
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mDstRect:Landroid/graphics/RectF;

    sub-float v4, v1, v2

    sub-float v5, v1, v2

    invoke-virtual {v3, v2, v2, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 111
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mSrcRect:Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mDstRect:Landroid/graphics/RectF;

    const/4 v6, 0x0

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 113
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mDstRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 114
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 115
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 117
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFramePath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 118
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFramePath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43b4

    invoke-virtual {v3, v4, v8, v5}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 121
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPressed:Z

    if-eqz v3, :cond_0

    .line 122
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 123
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    const/16 v4, 0x54

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mHighlightColor:I

    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v5

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mHighlightColor:I

    invoke-static {v6}, Landroid/graphics/Color;->green(I)I

    move-result v6

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mHighlightColor:I

    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    invoke-static {v4, v5, v6, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 127
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFramePath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 129
    :cond_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mStrokeWidth:F

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 130
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    iget-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPressed:Z

    if-eqz v3, :cond_1

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mHighlightColor:I

    :goto_0
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 132
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mShadowRadius:F

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameShadowColor:I

    invoke-virtual {v3, v4, v8, v8, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 133
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFramePath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 134
    return-void

    .line 131
    :cond_1
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mFrameColor:I

    goto :goto_0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 150
    const/4 v0, -0x3

    return v0
.end method

.method public getScale()F
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mScale:F

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .parameter "alpha"

    .prologue
    .line 155
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .parameter "cf"

    .prologue
    .line 159
    return-void
.end method

.method public setPressed(Z)V
    .locals 0
    .parameter "pressed"

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mPressed:Z

    .line 146
    return-void
.end method

.method public setScale(F)V
    .locals 0
    .parameter "scale"

    .prologue
    .line 137
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardCircleFramedDrawable;->mScale:F

    .line 138
    return-void
.end method
