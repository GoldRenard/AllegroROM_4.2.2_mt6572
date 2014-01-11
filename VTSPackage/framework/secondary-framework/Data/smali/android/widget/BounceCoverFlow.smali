.class public Landroid/widget/BounceCoverFlow;
.super Landroid/widget/BounceGallery;
.source "BounceCoverFlow.java"


# static fields
.field private static final DBG:Z = false

.field private static DEFAULT_MAX_ROTATION:I = 0x0

.field private static DEFAULT_MAX_ZOOM:F = 0.0f

.field private static final TAG:Ljava/lang/String; = "BounceCoverFlow"


# instance fields
.field private final mCamera:Landroid/graphics/Camera;

.field private mMaxRotationAngle:I

.field private mMaxZoom:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const/16 v0, 0x3c

    sput v0, Landroid/widget/BounceCoverFlow;->DEFAULT_MAX_ROTATION:I

    .line 66
    const/high16 v0, 0x43c8

    sput v0, Landroid/widget/BounceCoverFlow;->DEFAULT_MAX_ZOOM:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/BounceCoverFlow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/BounceCoverFlow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 82
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/BounceGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 68
    sget v0, Landroid/widget/BounceCoverFlow;->DEFAULT_MAX_ROTATION:I

    iput v0, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    .line 69
    sget v0, Landroid/widget/BounceCoverFlow;->DEFAULT_MAX_ZOOM:F

    iput v0, p0, Landroid/widget/BounceCoverFlow;->mMaxZoom:F

    .line 71
    new-instance v0, Landroid/graphics/Camera;

    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    iput-object v0, p0, Landroid/widget/BounceCoverFlow;->mCamera:Landroid/graphics/Camera;

    .line 83
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/BounceCoverFlow;->setStaticTransformationsEnabled(Z)V

    .line 84
    return-void
.end method

.method private getCenterOfCoverflow()I
    .locals 2

    .prologue
    .line 92
    invoke-virtual {p0}, Landroid/widget/BounceCoverFlow;->getMeasuredWidth()I

    move-result v0

    iget v1, p0, Landroid/view/View;->mPaddingLeft:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroid/view/View;->mPaddingRight:I

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/view/View;->mPaddingLeft:I

    add-int/2addr v0, v1

    return v0
.end method

.method private transformImageBitmap(Landroid/view/View;Landroid/view/animation/Transformation;I)V
    .locals 8
    .parameter "child"
    .parameter "t"
    .parameter "rotationAngle"

    .prologue
    const/4 v7, 0x0

    .line 158
    iget-object v4, p0, Landroid/widget/BounceCoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v4}, Landroid/graphics/Camera;->save()V

    .line 160
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    .line 161
    .local v1, imageMatrix:Landroid/graphics/Matrix;
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 162
    .local v0, imageHeight:I
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 164
    .local v2, imageWidth:I
    int-to-float v4, p3

    iget v5, p0, Landroid/widget/BounceCoverFlow;->mMaxZoom:F

    iget v6, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    int-to-float v6, v6

    div-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float v3, v4, v5

    .line 170
    .local v3, zoomAmount:F
    iget-object v4, p0, Landroid/widget/BounceCoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v4, v7, v7, v3}, Landroid/graphics/Camera;->translate(FFF)V

    .line 171
    iget-object v4, p0, Landroid/widget/BounceCoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v4, v1}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 173
    div-int/lit8 v4, v2, 0x2

    neg-int v4, v4

    int-to-float v4, v4

    div-int/lit8 v5, v0, 0x2

    neg-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 174
    div-int/lit8 v4, v2, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, v0, 0x2

    int-to-float v5, v5

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 176
    iget-object v4, p0, Landroid/widget/BounceCoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v4}, Landroid/graphics/Camera;->restore()V

    .line 177
    return-void
.end method


# virtual methods
.method protected getChildStaticTransformation(Landroid/view/View;Landroid/view/animation/Transformation;)Z
    .locals 6
    .parameter "child"
    .parameter "t"

    .prologue
    .line 117
    invoke-virtual {p0, p1}, Landroid/widget/BounceCoverFlow;->getCenterOfChildWithScroll(Landroid/view/View;)I

    move-result v0

    .line 118
    .local v0, childCenter:I
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 119
    .local v1, childWidth:I
    const/4 v3, 0x0

    .line 121
    .local v3, rotationAngle:I
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->clear()V

    .line 122
    sget v4, Landroid/view/animation/Transformation;->TYPE_MATRIX:I

    invoke-virtual {p2, v4}, Landroid/view/animation/Transformation;->setTransformationType(I)V

    .line 124
    invoke-direct {p0}, Landroid/widget/BounceCoverFlow;->getCenterOfCoverflow()I

    move-result v4

    if-ne v0, v4, :cond_0

    .line 125
    const/4 v4, 0x0

    invoke-direct {p0, p1, p2, v4}, Landroid/widget/BounceCoverFlow;->transformImageBitmap(Landroid/view/View;Landroid/view/animation/Transformation;I)V

    .line 141
    :goto_0
    const/4 v4, 0x1

    return v4

    .line 127
    :cond_0
    invoke-direct {p0}, Landroid/widget/BounceCoverFlow;->getCenterOfCoverflow()I

    move-result v4

    sub-int v2, v4, v0

    .line 128
    .local v2, distToCenter:I
    int-to-float v4, v2

    int-to-float v5, v1

    div-float/2addr v4, v5

    iget v5, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-int v3, v4

    .line 135
    iget v4, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    if-le v3, v4, :cond_1

    .line 136
    iget v3, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    .line 138
    :cond_1
    invoke-direct {p0, p1, p2, v3}, Landroid/widget/BounceCoverFlow;->transformImageBitmap(Landroid/view/View;Landroid/view/animation/Transformation;I)V

    goto :goto_0
.end method

.method public setMaxRotationAngle(I)V
    .locals 0
    .parameter "maxAngle"

    .prologue
    .line 112
    iput p1, p0, Landroid/widget/BounceCoverFlow;->mMaxRotationAngle:I

    .line 113
    return-void
.end method

.method public setMaxZoomOut(F)V
    .locals 0
    .parameter "maxZoom"

    .prologue
    .line 103
    iput p1, p0, Landroid/widget/BounceCoverFlow;->mMaxZoom:F

    .line 104
    return-void
.end method

.method public setNextSelectedPositionInt(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 189
    invoke-super {p0, p1}, Landroid/widget/BounceGallery;->setNextSelectedPositionInt(I)V

    .line 190
    return-void
.end method
