.class public Lcom/android/launcher2/HolographicViewHelper;
.super Ljava/lang/Object;
.source "HolographicViewHelper.java"


# instance fields
.field private mHighlightColor:I

.field private mStatesUpdated:Z

.field private final mTempCanvas:Landroid/graphics/Canvas;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 35
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1}, Landroid/graphics/Canvas;-><init>()V

    iput-object v1, p0, Lcom/android/launcher2/HolographicViewHelper;->mTempCanvas:Landroid/graphics/Canvas;

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 39
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x1060012

    invoke-static {v0, v1}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/HolographicViewHelper;->mHighlightColor:I

    .line 40
    return-void
.end method

.method private createOriginalImage(Landroid/widget/ImageView;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "v"
    .parameter "canvas"

    .prologue
    .line 75
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 76
    .local v1, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 79
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 80
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 81
    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 82
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 83
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 85
    return-object v0
.end method

.method private createPressImage(Landroid/widget/ImageView;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "v"
    .parameter "canvas"

    .prologue
    .line 93
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 94
    .local v1, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 97
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 98
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 99
    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 100
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 101
    iget v2, p0, Lcom/android/launcher2/HolographicViewHelper;->mHighlightColor:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p2, v2, v3}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 102
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 104
    return-object v0
.end method


# virtual methods
.method generatePressedFocusedStates(Landroid/widget/ImageView;)V
    .locals 9
    .parameter "v"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 46
    iget-boolean v5, p0, Lcom/android/launcher2/HolographicViewHelper;->mStatesUpdated:Z

    if-nez v5, :cond_0

    if-eqz p1, :cond_0

    .line 47
    iput-boolean v8, p0, Lcom/android/launcher2/HolographicViewHelper;->mStatesUpdated:Z

    .line 48
    iget-object v5, p0, Lcom/android/launcher2/HolographicViewHelper;->mTempCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0, p1, v5}, Lcom/android/launcher2/HolographicViewHelper;->createOriginalImage(Landroid/widget/ImageView;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 49
    .local v0, original:Landroid/graphics/Bitmap;
    iget-object v5, p0, Lcom/android/launcher2/HolographicViewHelper;->mTempCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0, p1, v5}, Lcom/android/launcher2/HolographicViewHelper;->createPressImage(Landroid/widget/ImageView;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 50
    .local v2, outline:Landroid/graphics/Bitmap;
    new-instance v1, Lcom/android/launcher2/FastBitmapDrawable;

    invoke-direct {v1, v0}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 51
    .local v1, originalD:Lcom/android/launcher2/FastBitmapDrawable;
    new-instance v3, Lcom/android/launcher2/FastBitmapDrawable;

    invoke-direct {v3, v2}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 53
    .local v3, outlineD:Lcom/android/launcher2/FastBitmapDrawable;
    new-instance v4, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 54
    .local v4, states:Landroid/graphics/drawable/StateListDrawable;
    new-array v5, v8, [I

    const v6, 0x10100a7

    aput v6, v5, v7

    invoke-virtual {v4, v5, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 55
    new-array v5, v8, [I

    const v6, 0x101009c

    aput v6, v5, v7

    invoke-virtual {v4, v5, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 56
    new-array v5, v7, [I

    invoke-virtual {v4, v5, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 57
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .end local v0           #original:Landroid/graphics/Bitmap;
    .end local v1           #originalD:Lcom/android/launcher2/FastBitmapDrawable;
    .end local v2           #outline:Landroid/graphics/Bitmap;
    .end local v3           #outlineD:Lcom/android/launcher2/FastBitmapDrawable;
    .end local v4           #states:Landroid/graphics/drawable/StateListDrawable;
    :cond_0
    return-void
.end method

.method invalidatePressedFocusedStates(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/HolographicViewHelper;->mStatesUpdated:Z

    .line 66
    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1}, Landroid/widget/ImageView;->invalidate()V

    .line 69
    :cond_0
    return-void
.end method
