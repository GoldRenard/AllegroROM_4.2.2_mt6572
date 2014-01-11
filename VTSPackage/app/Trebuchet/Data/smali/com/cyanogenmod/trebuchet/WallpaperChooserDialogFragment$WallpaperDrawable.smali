.class Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "WallpaperChooserDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;
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
    .line 319
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .parameter "canvas"

    .prologue
    .line 335
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v4, :cond_0

    .line 341
    :goto_0
    return-void

    .line 336
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    .line 337
    .local v1, width:I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    .line 338
    .local v0, height:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    sub-int v4, v1, v4

    div-int/lit8 v2, v4, 0x2

    .line 339
    .local v2, x:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    sub-int v4, v0, v4

    div-int/lit8 v3, v4, 0x2

    .line 340
    .local v3, y:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    int-to-float v5, v2

    int-to-float v6, v3

    const/4 v7, 0x0

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 345
    const/4 v0, -0x1

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .parameter "alpha"

    .prologue
    .line 351
    return-void
.end method

.method setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 326
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 327
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 331
    :goto_0
    return-void

    .line 329
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicWidth:I

    .line 330
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$WallpaperDrawable;->mIntrinsicHeight:I

    goto :goto_0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .parameter "cf"

    .prologue
    .line 356
    return-void
.end method
