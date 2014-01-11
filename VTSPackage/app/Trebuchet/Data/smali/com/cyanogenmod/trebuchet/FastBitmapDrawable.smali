.class Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FastBitmapDrawable.java"


# instance fields
.field private mAlpha:I

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mHeight:I

.field private final mPaint:Landroid/graphics/Paint;

.field private mWidth:I


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "b"

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 32
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 35
    const/16 v0, 0xff

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mAlpha:I

    .line 36
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 37
    if-eqz p1, :cond_0

    .line 38
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    .line 39
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    .line 43
    :goto_0
    return-void

    .line 41
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    goto :goto_0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .parameter "canvas"

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 48
    .local v0, r:Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 49
    return-void
.end method

.method public getAlpha()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mAlpha:I

    return v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 58
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 63
    iput p1, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mAlpha:I

    .line 64
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 65
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 96
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 97
    if-eqz p1, :cond_0

    .line 98
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    .line 99
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    .line 103
    :goto_0
    return-void

    .line 101
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mHeight:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mWidth:I

    goto :goto_0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .parameter "cf"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 54
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1
    .parameter "filterBitmap"

    .prologue
    .line 68
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 69
    return-void
.end method
