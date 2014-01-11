.class public Lcom/android/systemui/statusbar/phone/TrackingPatternView;
.super Landroid/view/View;
.source "TrackingPatternView.java"


# instance fields
.field private mPaint:Landroid/graphics/Paint;

.field private mTexture:Landroid/graphics/Bitmap;

.field private mTextureHeight:I

.field private mTextureWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x108056f

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTexture:Landroid/graphics/Bitmap;

    .line 40
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTexture:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTextureWidth:I

    .line 41
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTexture:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTextureHeight:I

    .line 43
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mPaint:Landroid/graphics/Paint;

    .line 44
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 45
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 12
    .parameter "canvas"

    .prologue
    .line 49
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTexture:Landroid/graphics/Bitmap;

    .line 50
    .local v2, texture:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mPaint:Landroid/graphics/Paint;

    .line 52
    .local v1, paint:Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->getWidth()I

    move-result v5

    .line 53
    .local v5, width:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->getHeight()I

    move-result v0

    .line 55
    .local v0, height:I
    iget v4, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTextureWidth:I

    .line 56
    .local v4, textureWidth:I
    iget v3, p0, Lcom/android/systemui/statusbar/phone/TrackingPatternView;->mTextureHeight:I

    .line 58
    .local v3, textureHeight:I
    const/4 v6, 0x0

    .line 61
    .local v6, x:I
    :goto_11
    if-ge v6, v5, :cond_1f

    .line 62
    const/4 v7, 0x0

    .line 63
    .local v7, y:I
    :goto_14
    if-ge v7, v0, :cond_1d

    .line 64
    int-to-float v8, v6

    int-to-float v9, v7

    invoke-virtual {p1, v2, v8, v9, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 65
    add-int/2addr v7, v3

    goto :goto_14

    .line 67
    :cond_1d
    add-int/2addr v6, v4

    goto :goto_11

    .line 69
    .end local v7           #y:I
    :cond_1f
    return-void
.end method
