.class public Lcom/cyanogenmod/trebuchet/DragView;
.super Landroid/view/View;
.source "DragView.java"


# static fields
.field private static sDragAlpha:F


# instance fields
.field mAnim:Landroid/animation/ValueAnimator;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mCrossFadeBitmap:Landroid/graphics/Bitmap;

.field private mCrossFadeProgress:F

.field private mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

.field private mDragRegion:Landroid/graphics/Rect;

.field private mDragVisualizeOffset:Landroid/graphics/Point;

.field private mHasDrawn:Z

.field private mInitialScale:F

.field private mOffsetX:F

.field private mOffsetY:F

.field private mPaint:Landroid/graphics/Paint;

.field private mRegistrationX:I

.field private mRegistrationY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const/high16 v0, 0x3f80

    sput v0, Lcom/cyanogenmod/trebuchet/DragView;->sDragAlpha:F

    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/graphics/Bitmap;IIIIIIF)V
    .locals 16
    .parameter "launcher"
    .parameter "bitmap"
    .parameter "registrationX"
    .parameter "registrationY"
    .parameter "left"
    .parameter "top"
    .parameter "width"
    .parameter "height"
    .parameter "initialScale"

    .prologue
    .line 68
    invoke-direct/range {p0 .. p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 44
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    .line 45
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    .line 46
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 47
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mHasDrawn:Z

    .line 48
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F

    .line 51
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    .line 52
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    .line 53
    const/high16 v5, 0x3f80

    move-object/from16 v0, p0

    iput v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mInitialScale:F

    .line 69
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 70
    move/from16 v0, p9

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/DragView;->mInitialScale:F

    .line 72
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/DragView;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 73
    .local v12, res:Landroid/content/res/Resources;
    const v5, 0x7f0d0033

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v7, v5

    .line 74
    .local v7, offsetX:F
    const v5, 0x7f0d0034

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v8, v5

    .line 75
    .local v8, offsetY:F
    const v5, 0x7f0d0035

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v13, v5

    .line 76
    .local v13, scaleDps:F
    move/from16 v0, p7

    int-to-float v5, v0

    add-float/2addr v5, v13

    move/from16 v0, p7

    int-to-float v6, v0

    div-float v10, v5, v6

    .line 79
    .local v10, scale:F
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleX(F)V

    .line 80
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleY(F)V

    .line 83
    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    .line 84
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    const-wide/16 v14, 0x96

    invoke-virtual {v5, v14, v15}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 85
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/cyanogenmod/trebuchet/DragView$1;

    move-object/from16 v6, p0

    move/from16 v9, p9

    invoke-direct/range {v5 .. v10}, Lcom/cyanogenmod/trebuchet/DragView$1;-><init>(Lcom/cyanogenmod/trebuchet/DragView;FFFF)V

    invoke-virtual {v14, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 110
    move-object/from16 v0, p2

    move/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    invoke-static {v0, v1, v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    .line 111
    new-instance v5, Landroid/graphics/Rect;

    const/4 v6, 0x0

    const/4 v9, 0x0

    move/from16 v0, p7

    move/from16 v1, p8

    invoke-direct {v5, v6, v9, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/DragView;->setDragRegion(Landroid/graphics/Rect;)V

    .line 114
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationX:I

    .line 115
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationY:I

    .line 118
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 119
    .local v11, ms:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v11}, Lcom/cyanogenmod/trebuchet/DragView;->measure(II)V

    .line 120
    new-instance v5, Landroid/graphics/Paint;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Landroid/graphics/Paint;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    .line 121
    return-void

    .line 83
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/DragView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 35
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    return v0
.end method

.method static synthetic access$016(Lcom/cyanogenmod/trebuchet/DragView;F)F
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    return v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/DragView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 35
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    return v0
.end method

.method static synthetic access$116(Lcom/cyanogenmod/trebuchet/DragView;F)F
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    return v0
.end method

.method static synthetic access$200()F
    .locals 1

    .prologue
    .line 35
    sget v0, Lcom/cyanogenmod/trebuchet/DragView;->sDragAlpha:F

    return v0
.end method

.method static synthetic access$302(Lcom/cyanogenmod/trebuchet/DragView;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F

    return p1
.end method


# virtual methods
.method public cancelAnimation()V
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 271
    :cond_0
    return-void
.end method

.method public crossFade(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 206
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 207
    .local v0, va:Landroid/animation/ValueAnimator;
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 208
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3fc0

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 209
    new-instance v1, Lcom/cyanogenmod/trebuchet/DragView$2;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/DragView$2;-><init>(Lcom/cyanogenmod/trebuchet/DragView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 215
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 216
    return-void

    .line 206
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public getDragRegion()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getDragRegionHeight()I
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getDragRegionLeft()I
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    return v0
.end method

.method public getDragRegionTop()I
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    return v0
.end method

.method public getDragRegionWidth()I
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getDragVisualizeOffset()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    return-object v0
.end method

.method public getInitialScale()F
    .locals 1

    .prologue
    .line 160
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mInitialScale:F

    return v0
.end method

.method public getOffsetY()F
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    return v0
.end method

.method public hasDrawn()Z
    .locals 1

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mHasDrawn:Z

    return v0
.end method

.method move(II)V
    .locals 2
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 285
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationX:I

    sub-int v0, p1, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    float-to-int v1, v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationX(F)V

    .line 286
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationY:I

    sub-int v0, p2, v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    float-to-int v1, v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationY(F)V

    .line 287
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v1, 0x1

    const/high16 v9, 0x437f

    const/high16 v8, 0x3f80

    const/4 v7, 0x0

    .line 175
    const/4 v2, 0x0

    .line 183
    .local v2, debug:Z
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mHasDrawn:Z

    .line 184
    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F

    cmpl-float v5, v5, v7

    if-lez v5, :cond_2

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_2

    .line 185
    .local v1, crossFade:Z
    :goto_0
    if-eqz v1, :cond_0

    .line 186
    if-eqz v1, :cond_3

    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F

    sub-float v5, v8, v5

    mul-float/2addr v5, v9

    float-to-int v0, v5

    .line 187
    .local v0, alpha:I
    :goto_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 189
    .end local v0           #alpha:I
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 190
    if-eqz v1, :cond_1

    .line 191
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeProgress:F

    mul-float/2addr v6, v9

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 192
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 193
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float v3, v5, v6

    .line 194
    .local v3, sX:F
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 195
    .local v4, sY:F
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 196
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 197
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 199
    .end local v3           #sX:F
    .end local v4           #sY:F
    :cond_1
    return-void

    .line 184
    .end local v1           #crossFade:Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 186
    .restart local v1       #crossFade:Z
    :cond_3
    const/16 v0, 0xff

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 169
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setMeasuredDimension(II)V

    .line 170
    return-void
.end method

.method remove()V
    .locals 1

    .prologue
    .line 290
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 291
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 293
    :cond_0
    return-void
.end method

.method public resetLayoutParams()V
    .locals 1

    .prologue
    .line 274
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F

    .line 275
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragView;->requestLayout()V

    .line 276
    return-void
.end method

.method public setAlpha(F)V
    .locals 2
    .parameter "alpha"

    .prologue
    .line 236
    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 237
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x437f

    mul-float/2addr v1, p1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 238
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragView;->invalidate()V

    .line 239
    return-void
.end method

.method public setColor(I)V
    .locals 3
    .parameter "color"

    .prologue
    .line 219
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    .line 222
    :cond_0
    if-eqz p1, :cond_1

    .line 223
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, p1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 227
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragView;->invalidate()V

    .line 228
    return-void

    .line 225
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_0
.end method

.method public setCrossFadeBitmap(Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "crossFadeBitmap"

    .prologue
    .line 202
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    .line 203
    return-void
.end method

.method public setDragRegion(Landroid/graphics/Rect;)V
    .locals 0
    .parameter "r"

    .prologue
    .line 152
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragRegion:Landroid/graphics/Rect;

    .line 153
    return-void
.end method

.method public setDragVisualizeOffset(Landroid/graphics/Point;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 144
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    .line 145
    return-void
.end method

.method public show(II)V
    .locals 3
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    const/4 v2, 0x0

    .line 249
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v1, p0}, Lcom/cyanogenmod/trebuchet/DragLayer;->addView(Landroid/view/View;)V

    .line 252
    new-instance v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    invoke-direct {v0, v2, v2}, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;-><init>(II)V

    .line 253
    .local v0, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 254
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 255
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 256
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/DragView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 257
    iget v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationX:I

    sub-int v1, p1, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationX(F)V

    .line 258
    iget v1, p0, Lcom/cyanogenmod/trebuchet/DragView;->mRegistrationY:I

    sub-int v1, p2, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationY(F)V

    .line 260
    new-instance v1, Lcom/cyanogenmod/trebuchet/DragView$3;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/DragView$3;-><init>(Lcom/cyanogenmod/trebuchet/DragView;)V

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/DragView;->post(Ljava/lang/Runnable;)Z

    .line 265
    return-void
.end method

.method public updateInitialScaleToCurrentScale()V
    .locals 1

    .prologue
    .line 164
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DragView;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DragView;->mInitialScale:F

    .line 165
    return-void
.end method
