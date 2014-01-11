.class public Lcom/android/launcher2/DragView;
.super Landroid/view/View;
.source "DragView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DragView"

.field private static sDragAlpha:F


# instance fields
.field mAnim:Landroid/animation/ValueAnimator;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mCrossFadeBitmap:Landroid/graphics/Bitmap;

.field private mCrossFadeProgress:F

.field private mDragLayer:Lcom/android/launcher2/DragLayer;

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
    .line 38
    const/high16 v0, 0x3f80

    sput v0, Lcom/android/launcher2/DragView;->sDragAlpha:F

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher2/Launcher;Landroid/graphics/Bitmap;IIIIIIF)V
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
    .line 70
    invoke-direct/range {p0 .. p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 46
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    .line 47
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    .line 48
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mDragLayer:Lcom/android/launcher2/DragLayer;

    .line 49
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/launcher2/DragView;->mHasDrawn:Z

    .line 50
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/android/launcher2/DragView;->mCrossFadeProgress:F

    .line 53
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/android/launcher2/DragView;->mOffsetX:F

    .line 54
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/android/launcher2/DragView;->mOffsetY:F

    .line 55
    const/high16 v5, 0x3f80

    move-object/from16 v0, p0

    iput v5, v0, Lcom/android/launcher2/DragView;->mInitialScale:F

    .line 71
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mDragLayer:Lcom/android/launcher2/DragLayer;

    .line 72
    move/from16 v0, p9

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/DragView;->mInitialScale:F

    .line 74
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/DragView;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 75
    .local v12, res:Landroid/content/res/Resources;
    const v5, 0x7f0b0030

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v7, v5

    .line 76
    .local v7, offsetX:F
    const v5, 0x7f0b0031

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v8, v5

    .line 77
    .local v8, offsetY:F
    const v5, 0x7f0b0032

    invoke-virtual {v12, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v13, v5

    .line 78
    .local v13, scaleDps:F
    move/from16 v0, p7

    int-to-float v5, v0

    add-float/2addr v5, v13

    move/from16 v0, p7

    int-to-float v6, v0

    div-float v10, v5, v6

    .line 81
    .local v10, scale:F
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setScaleX(F)V

    .line 82
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setScaleY(F)V

    .line 85
    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-static {v5}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    .line 86
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    const-wide/16 v14, 0x96

    invoke-virtual {v5, v14, v15}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 87
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/android/launcher2/DragView$1;

    move-object/from16 v6, p0

    move/from16 v9, p9

    invoke-direct/range {v5 .. v10}, Lcom/android/launcher2/DragView$1;-><init>(Lcom/android/launcher2/DragView;FFFF)V

    invoke-virtual {v14, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 112
    move-object/from16 v0, p2

    move/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    invoke-static {v0, v1, v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    .line 113
    new-instance v5, Landroid/graphics/Rect;

    const/4 v6, 0x0

    const/4 v9, 0x0

    move/from16 v0, p7

    move/from16 v1, p8

    invoke-direct {v5, v6, v9, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/launcher2/DragView;->setDragRegion(Landroid/graphics/Rect;)V

    .line 116
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/DragView;->mRegistrationX:I

    .line 117
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/DragView;->mRegistrationY:I

    .line 120
    const-string v5, "DragView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DragView constructor: mRegistrationX = "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/launcher2/DragView;->mRegistrationX:I

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, ", mRegistrationY = "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/launcher2/DragView;->mRegistrationY:I

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, ", this = "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 126
    .local v11, ms:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v11}, Lcom/android/launcher2/DragView;->measure(II)V

    .line 127
    new-instance v5, Landroid/graphics/Paint;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Landroid/graphics/Paint;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    .line 128
    return-void

    .line 85
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/launcher2/DragView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/android/launcher2/DragView;->mOffsetX:F

    return v0
.end method

.method static synthetic access$016(Lcom/android/launcher2/DragView;F)F
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iget v0, p0, Lcom/android/launcher2/DragView;->mOffsetX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/android/launcher2/DragView;->mOffsetX:F

    return v0
.end method

.method static synthetic access$100(Lcom/android/launcher2/DragView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    return v0
.end method

.method static synthetic access$116(Lcom/android/launcher2/DragView;F)F
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iget v0, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    return v0
.end method

.method static synthetic access$200()F
    .locals 1

    .prologue
    .line 36
    sget v0, Lcom/android/launcher2/DragView;->sDragAlpha:F

    return v0
.end method

.method static synthetic access$302(Lcom/android/launcher2/DragView;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput p1, p0, Lcom/android/launcher2/DragView;->mCrossFadeProgress:F

    return p1
.end method


# virtual methods
.method public cancelAnimation()V
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 281
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 283
    :cond_0
    return-void
.end method

.method public crossFade(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 213
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 214
    .local v0, va:Landroid/animation/ValueAnimator;
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 215
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3fc0

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 216
    new-instance v1, Lcom/android/launcher2/DragView$2;

    invoke-direct {v1, p0}, Lcom/android/launcher2/DragView$2;-><init>(Lcom/android/launcher2/DragView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 222
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 223
    return-void

    .line 213
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method public getDragRegion()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getDragRegionHeight()I
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getDragRegionLeft()I
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    return v0
.end method

.method public getDragRegionTop()I
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    return v0
.end method

.method public getDragRegionWidth()I
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getDragVisualizeOffset()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    return-object v0
.end method

.method public getInitialScale()F
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lcom/android/launcher2/DragView;->mInitialScale:F

    return v0
.end method

.method public getOffsetY()F
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    return v0
.end method

.method public hasDrawn()Z
    .locals 1

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/android/launcher2/DragView;->mHasDrawn:Z

    return v0
.end method

.method move(II)V
    .locals 4
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    const-wide/16 v2, 0x4

    .line 298
    const-string v0, "posX"

    invoke-static {v2, v3, v0, p1}, Landroid/os/Trace;->traceCounter(JLjava/lang/String;I)V

    .line 299
    const-string v0, "posY"

    invoke-static {v2, v3, v0, p2}, Landroid/os/Trace;->traceCounter(JLjava/lang/String;I)V

    .line 300
    const-string v0, "move"

    invoke-static {v2, v3, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 302
    iget v0, p0, Lcom/android/launcher2/DragView;->mRegistrationX:I

    sub-int v0, p1, v0

    iget v1, p0, Lcom/android/launcher2/DragView;->mOffsetX:F

    float-to-int v1, v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/DragView;->setTranslationX(F)V

    .line 303
    iget v0, p0, Lcom/android/launcher2/DragView;->mRegistrationY:I

    sub-int v0, p2, v0

    iget v1, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    float-to-int v1, v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/DragView;->setTranslationY(F)V

    .line 305
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 307
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

    .line 182
    const/4 v2, 0x0

    .line 190
    .local v2, debug:Z
    iput-boolean v1, p0, Lcom/android/launcher2/DragView;->mHasDrawn:Z

    .line 191
    iget v5, p0, Lcom/android/launcher2/DragView;->mCrossFadeProgress:F

    cmpl-float v5, v5, v7

    if-lez v5, :cond_2

    iget-object v5, p0, Lcom/android/launcher2/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_2

    .line 192
    .local v1, crossFade:Z
    :goto_0
    if-eqz v1, :cond_0

    .line 193
    if-eqz v1, :cond_3

    iget v5, p0, Lcom/android/launcher2/DragView;->mCrossFadeProgress:F

    sub-float v5, v8, v5

    mul-float/2addr v5, v9

    float-to-int v0, v5

    .line 194
    .local v0, alpha:I
    :goto_1
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 196
    .end local v0           #alpha:I
    :cond_0
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 197
    if-eqz v1, :cond_1

    .line 198
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/android/launcher2/DragView;->mCrossFadeProgress:F

    mul-float/2addr v6, v9

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 199
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 200
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    iget-object v6, p0, Lcom/android/launcher2/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float v3, v5, v6

    .line 201
    .local v3, sX:F
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v8

    iget-object v6, p0, Lcom/android/launcher2/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 202
    .local v4, sY:F
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 203
    iget-object v5, p0, Lcom/android/launcher2/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 204
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 206
    .end local v3           #sX:F
    .end local v4           #sY:F
    :cond_1
    return-void

    .line 191
    .end local v1           #crossFade:Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 193
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
    .line 176
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/DragView;->setMeasuredDimension(II)V

    .line 177
    return-void
.end method

.method remove()V
    .locals 3

    .prologue
    .line 311
    const-string v0, "DragView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remove DragView: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    invoke-virtual {p0}, Lcom/android/launcher2/DragView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v0, p0}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    .line 317
    :cond_0
    return-void
.end method

.method public resetLayoutParams()V
    .locals 1

    .prologue
    .line 286
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/launcher2/DragView;->mOffsetY:F

    iput v0, p0, Lcom/android/launcher2/DragView;->mOffsetX:F

    .line 287
    invoke-virtual {p0}, Lcom/android/launcher2/DragView;->requestLayout()V

    .line 288
    return-void
.end method

.method public setAlpha(F)V
    .locals 2
    .parameter "alpha"

    .prologue
    .line 243
    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 244
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x437f

    mul-float/2addr v1, p1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 245
    invoke-virtual {p0}, Lcom/android/launcher2/DragView;->invalidate()V

    .line 246
    return-void
.end method

.method public setColor(I)V
    .locals 3
    .parameter "color"

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    .line 229
    :cond_0
    if-eqz p1, :cond_1

    .line 230
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, p1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 234
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/DragView;->invalidate()V

    .line 235
    return-void

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/DragView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_0
.end method

.method public setCrossFadeBitmap(Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "crossFadeBitmap"

    .prologue
    .line 209
    iput-object p1, p0, Lcom/android/launcher2/DragView;->mCrossFadeBitmap:Landroid/graphics/Bitmap;

    .line 210
    return-void
.end method

.method public setDragRegion(Landroid/graphics/Rect;)V
    .locals 0
    .parameter "r"

    .prologue
    .line 159
    iput-object p1, p0, Lcom/android/launcher2/DragView;->mDragRegion:Landroid/graphics/Rect;

    .line 160
    return-void
.end method

.method public setDragVisualizeOffset(Landroid/graphics/Point;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 151
    iput-object p1, p0, Lcom/android/launcher2/DragView;->mDragVisualizeOffset:Landroid/graphics/Point;

    .line 152
    return-void
.end method

.method public show(II)V
    .locals 4
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    const/4 v2, 0x0

    .line 256
    iget-object v1, p0, Lcom/android/launcher2/DragView;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v1, p0}, Lcom/android/launcher2/DragLayer;->addView(Landroid/view/View;)V

    .line 259
    new-instance v0, Lcom/android/launcher2/DragLayer$LayoutParams;

    invoke-direct {v0, v2, v2}, Lcom/android/launcher2/DragLayer$LayoutParams;-><init>(II)V

    .line 260
    .local v0, lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    iget-object v1, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 261
    iget-object v1, p0, Lcom/android/launcher2/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 262
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/launcher2/DragLayer$LayoutParams;->customPosition:Z

    .line 263
    invoke-virtual {p0, v0}, Lcom/android/launcher2/DragView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    iget v1, p0, Lcom/android/launcher2/DragView;->mRegistrationX:I

    sub-int v1, p1, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/DragView;->setTranslationX(F)V

    .line 265
    iget v1, p0, Lcom/android/launcher2/DragView;->mRegistrationY:I

    sub-int v1, p2, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/DragView;->setTranslationY(F)V

    .line 267
    const-string v1, "DragView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "show DragView: x = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/android/launcher2/DragLayer$LayoutParams;->x:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", y = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/android/launcher2/DragLayer$LayoutParams;->y:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", width = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", height = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", this = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    new-instance v1, Lcom/android/launcher2/DragView$3;

    invoke-direct {v1, p0}, Lcom/android/launcher2/DragView$3;-><init>(Lcom/android/launcher2/DragView;)V

    invoke-virtual {p0, v1}, Lcom/android/launcher2/DragView;->post(Ljava/lang/Runnable;)Z

    .line 277
    return-void
.end method

.method public updateInitialScaleToCurrentScale()V
    .locals 1

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/android/launcher2/DragView;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/DragView;->mInitialScale:F

    .line 172
    return-void
.end method
