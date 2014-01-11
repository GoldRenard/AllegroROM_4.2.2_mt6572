.class Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "WallpaperChooserDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/WallpaperChooserDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WallpaperDrawable"
.end annotation


# instance fields
.field mBitmap:Landroid/graphics/Bitmap;

.field mIntrinsicHeight:I

.field mIntrinsicWidth:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 355
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 14
    .parameter "canvas"

    .prologue
    .line 372
    iget-object v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v10, :cond_0

    .line 411
    :goto_0
    return-void

    .line 375
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    .line 376
    .local v7, width:I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    .line 379
    .local v0, height:I
    const-string v10, "WallpaperChooserDialogFragment"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Bitmap width is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", height is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ". Canvas width is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", height is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    int-to-float v10, v7

    iget v11, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    int-to-float v11, v11

    div-float v6, v10, v11

    .line 385
    .local v6, scalew:F
    int-to-float v10, v0

    iget v11, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    int-to-float v11, v11

    div-float v5, v10, v11

    .line 387
    .local v5, scaleh:F
    float-to-double v10, v6

    const-wide/high16 v12, 0x3ff0

    cmpl-double v10, v10, v12

    if-gtz v10, :cond_1

    float-to-double v10, v5

    const-wide/high16 v12, 0x3ff0

    cmpl-double v10, v10, v12

    if-lez v10, :cond_3

    .line 389
    :cond_1
    const-string v10, "WallpaperChooserDialogFragment"

    const-string v11, "Draw by scale size"

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    cmpl-float v10, v6, v5

    if-lez v10, :cond_2

    move v1, v6

    .line 392
    .local v1, scale:F
    :goto_1
    iget v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    int-to-float v10, v10

    mul-float/2addr v10, v1

    float-to-int v4, v10

    .line 393
    .local v4, scaledWidth:I
    iget v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    int-to-float v10, v10

    mul-float/2addr v10, v1

    float-to-int v3, v10

    .line 394
    .local v3, scaledHeight:I
    sub-int v10, v7, v4

    div-int/lit8 v8, v10, 0x2

    .line 395
    .local v8, x:I
    sub-int v10, v0, v3

    div-int/lit8 v9, v10, 0x2

    .line 397
    .local v9, y:I
    iget-object v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v11, 0x1

    invoke-static {v10, v4, v3, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 398
    .local v2, scaledBitmap:Landroid/graphics/Bitmap;
    new-instance v10, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v11, 0x0

    const/4 v12, 0x3

    invoke-direct {v10, v11, v12}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 399
    int-to-float v10, v8

    int-to-float v11, v9

    const/4 v12, 0x0

    invoke-virtual {p1, v2, v10, v11, v12}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 400
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    goto/16 :goto_0

    .end local v1           #scale:F
    .end local v2           #scaledBitmap:Landroid/graphics/Bitmap;
    .end local v3           #scaledHeight:I
    .end local v4           #scaledWidth:I
    .end local v8           #x:I
    .end local v9           #y:I
    :cond_2
    move v1, v5

    .line 391
    goto :goto_1

    .line 404
    :cond_3
    const-string v10, "WallpaperChooserDialogFragment"

    const-string v11, "Draw by original size"

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    iget v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    sub-int v10, v7, v10

    div-int/lit8 v8, v10, 0x2

    .line 407
    .restart local v8       #x:I
    iget v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    sub-int v10, v0, v10

    div-int/lit8 v9, v10, 0x2

    .line 408
    .restart local v9       #y:I
    iget-object v10, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    int-to-float v11, v8

    int-to-float v12, v9

    const/4 v13, 0x0

    invoke-virtual {p1, v10, v11, v12, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto/16 :goto_0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 415
    const/4 v0, -0x1

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .parameter "alpha"

    .prologue
    .line 421
    return-void
.end method

.method setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 362
    iput-object p1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 363
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 368
    :goto_0
    return-void

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    .line 367
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    goto :goto_0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .parameter "cf"

    .prologue
    .line 426
    return-void
.end method
