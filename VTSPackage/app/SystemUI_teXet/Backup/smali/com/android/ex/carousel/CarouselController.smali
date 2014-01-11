.class public Lcom/android/ex/carousel/CarouselController;
.super Ljava/lang/Object;
.source "CarouselController.java"


# static fields
.field private static final DBG:Z = false

.field public static final STORE_CONFIG_ALPHA:I = 0x1

.field public static final STORE_CONFIG_DEPTH_READS:I = 0x2

.field public static final STORE_CONFIG_DEPTH_WRITES:I = 0x4

.field private static final TAG:Ljava/lang/String; = "CarouselController"


# instance fields
.field private final DEFAULT_DETAIL_ALIGNMENT:I

.field private final DEFAULT_DRAG_FACTOR:F

.field private final DEFAULT_FRICTION_COEFFICIENT:F

.field private final DEFAULT_OVERSCROLL_SLOTS:F

.field private final DEFAULT_PREFETCH_CARD_COUNT:I

.field private final DEFAULT_RADIUS:F

.field private final DEFAULT_ROW_COUNT:I

.field private final DEFAULT_ROW_SPACING:F

.field private final DEFAULT_SLOT_COUNT:I

.field private final DEFAULT_SWAY_SENSITIVITY:F

.field private final DEFAULT_VISIBLE_DETAIL_COUNT:I

.field private mAt:[F

.field private mBackgroundBitmap:Landroid/graphics/Bitmap;

.field private mBackgroundColor:Landroid/renderscript/Float4;

.field private mCardCount:I

.field private mCardCreationFadeDuration:J

.field private mCardRotation:F

.field private mCardsFaceTangent:Z

.field private mCarouselCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

.field private mCarouselRotationAngle:F

.field private mDefaultBitmap:Landroid/graphics/Bitmap;

.field private mDefaultCardMatrix:[F

.field private mDefaultGeometry:I

.field private mDefaultLineBitmap:Landroid/graphics/Bitmap;

.field private mDetailLoadingBitmap:Landroid/graphics/Bitmap;

.field private mDetailTextureAlignment:I

.field private mDragFactor:F

.field private mDragModel:I

.field private mDrawRuler:Z

.field private mEye:[F

.field private mFadeInDuration:J

.field private mFillDirection:I

.field private mFirstCardTop:Z

.field private mForceBlendCardsWithZ:Z

.field private mFrictionCoefficient:F

.field private mLoadingBitmap:Landroid/graphics/Bitmap;

.field private mLoadingGeometry:I

.field private mOverscrollSlots:F

.field private mPrefetchCardCount:I

.field private mRS:Landroid/renderscript/RenderScriptGL;

.field private mRadius:F

.field private mRenderScript:Lcom/android/ex/carousel/CarouselRS;

.field private mRezInCardCount:F

.field private mRowCount:I

.field private mRowSpacing:F

.field private mSlotCount:I

.field private mStartAngle:F

.field private mStoreConfigs:[I

.field private mSwaySensitivity:F

.field private mUp:[F

.field private mVisibleDetails:I

.field private mVisibleSlots:I


# direct methods
.method public constructor <init>()V
    .registers 10

    .prologue
    const/high16 v8, 0x3f80

    const/4 v2, 0x3

    const/4 v4, 0x1

    const/4 v7, 0x0

    const/4 v1, 0x0

    .line 98
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_SLOT_COUNT:I

    .line 38
    const/high16 v0, 0x41a0

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_RADIUS:F

    .line 39
    iput v2, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_VISIBLE_DETAIL_COUNT:I

    .line 40
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_PREFETCH_CARD_COUNT:I

    .line 41
    iput v4, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_ROW_COUNT:I

    .line 42
    iput v8, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_OVERSCROLL_SLOTS:F

    .line 43
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_ROW_SPACING:F

    .line 44
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_SWAY_SENSITIVITY:F

    .line 45
    const/high16 v0, 0x4120

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_FRICTION_COEFFICIENT:F

    .line 46
    const/high16 v0, 0x3e80

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_DRAG_FACTOR:F

    .line 47
    const/16 v0, 0x202

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->DEFAULT_DETAIL_ALIGNMENT:I

    .line 59
    new-array v0, v2, [I

    fill-array-data v0, :array_a2

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    move v3, v2

    invoke-static/range {v0 .. v5}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultLineBitmap:Landroid/graphics/Bitmap;

    .line 64
    iput v1, p0, Lcom/android/ex/carousel/CarouselController;->mCardCount:I

    .line 65
    iput v1, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleSlots:I

    .line 66
    iput v2, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleDetails:I

    .line 67
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mPrefetchCardCount:I

    .line 68
    const/16 v0, 0x202

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mDetailTextureAlignment:I

    .line 69
    iput-boolean v1, p0, Lcom/android/ex/carousel/CarouselController;->mForceBlendCardsWithZ:Z

    .line 70
    iput-boolean v4, p0, Lcom/android/ex/carousel/CarouselController;->mDrawRuler:Z

    .line 73
    const/high16 v0, 0x41a0

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mRadius:F

    .line 74
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->mCardRotation:F

    .line 75
    iput-boolean v1, p0, Lcom/android/ex/carousel/CarouselController;->mCardsFaceTangent:Z

    .line 76
    iput v8, p0, Lcom/android/ex/carousel/CarouselController;->mOverscrollSlots:F

    .line 77
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->mSwaySensitivity:F

    .line 78
    const/high16 v0, 0x4120

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mFrictionCoefficient:F

    .line 79
    const/high16 v0, 0x3e80

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mDragFactor:F

    .line 80
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/ex/carousel/CarouselController;->mSlotCount:I

    .line 81
    iput v4, p0, Lcom/android/ex/carousel/CarouselController;->mRowCount:I

    .line 82
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->mRowSpacing:F

    .line 83
    new-array v0, v2, [F

    fill-array-data v0, :array_ac

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mEye:[F

    .line 84
    new-array v0, v2, [F

    fill-array-data v0, :array_b6

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mAt:[F

    .line 85
    new-array v0, v2, [F

    fill-array-data v0, :array_c0

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mUp:[F

    .line 86
    new-instance v0, Landroid/renderscript/Float4;

    invoke-direct {v0, v7, v7, v7, v8}, Landroid/renderscript/Float4;-><init>(FFFF)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    .line 88
    iput v7, p0, Lcom/android/ex/carousel/CarouselController;->mRezInCardCount:F

    .line 89
    const-wide/16 v2, 0xfa

    iput-wide v2, p0, Lcom/android/ex/carousel/CarouselController;->mFadeInDuration:J

    .line 90
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/ex/carousel/CarouselController;->mCardCreationFadeDuration:J

    .line 91
    new-array v0, v4, [I

    aput v1, v0, v1

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    move v2, v4

    move v3, v4

    invoke-static/range {v0 .. v5}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDetailLoadingBitmap:Landroid/graphics/Bitmap;

    .line 93
    iput v1, p0, Lcom/android/ex/carousel/CarouselController;->mDragModel:I

    .line 94
    iput v4, p0, Lcom/android/ex/carousel/CarouselController;->mFillDirection:I

    .line 95
    iput-boolean v1, p0, Lcom/android/ex/carousel/CarouselController;->mFirstCardTop:Z

    .line 99
    const/4 v6, 0x1

    .line 100
    .local v6, useDepthBuffer:Z
    return-void

    .line 59
    nop

    :array_a2
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0xfft 0xfft 0xfft 0xfft
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 83
    :array_ac
    .array-data 0x4
        0x94t 0x76t 0xa5t 0x41t
        0xf3t 0x54t 0x31t 0x40t
        0xe8t 0xd9t 0x85t 0x41t
    .end array-data

    .line 84
    :array_b6
    .array-data 0x4
        0xa6t 0x9bt 0x6bt 0x41t
        0xc4t 0x99t 0x59t 0xc0t
        0xb1t 0xa2t 0xa6t 0xbft
    .end array-data

    .line 85
    :array_c0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method


# virtual methods
.method public createCards(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 350
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mCardCount:I

    .line 351
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 352
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->createCards(I)V

    .line 354
    :cond_b
    return-void
.end method

.method public getCallback()Lcom/android/ex/carousel/CarouselRS$CarouselCallback;
    .registers 2

    .prologue
    .line 587
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mCarouselCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

    return-object v0
.end method

.method public getCardCount()I
    .registers 2

    .prologue
    .line 357
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mCardCount:I

    return v0
.end method

.method public invalidateDetailTexture(IZ)V
    .registers 4
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 430
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRS:Landroid/renderscript/RenderScriptGL;

    if-eqz v0, :cond_d

    .line 432
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->invalidateDetailTexture(IZ)V

    .line 435
    :cond_d
    return-void
.end method

.method public invalidateTexture(IZ)V
    .registers 4
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 414
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRS:Landroid/renderscript/RenderScriptGL;

    if-eqz v0, :cond_d

    .line 416
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->invalidateTexture(IZ)V

    .line 419
    :cond_d
    return-void
.end method

.method public loadGeometry(I)Landroid/renderscript/Mesh;
    .registers 3
    .parameter "resId"

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 156
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->loadGeometry(I)Landroid/renderscript/Mesh;

    move-result-object v0

    .line 158
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onLongPress()V
    .registers 2

    .prologue
    .line 792
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0}, Lcom/android/ex/carousel/CarouselRS;->doLongPress()V

    .line 793
    return-void
.end method

.method public onSurfaceChanged()V
    .registers 5

    .prologue
    .line 108
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mSlotCount:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setSlotCount(I)V

    .line 109
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultCardMatrix:[F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDefaultCardMatrix([F)V

    .line 110
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mCardCount:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->createCards(I)V

    .line 111
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleSlots:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setVisibleSlots(I)V

    .line 112
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleDetails:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setVisibleDetails(I)V

    .line 113
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mPrefetchCardCount:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setPrefetchCardCount(I)V

    .line 114
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mOverscrollSlots:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setOverscrollSlots(F)V

    .line 115
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mRowCount:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setRowCount(I)V

    .line 116
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mRowSpacing:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setRowSpacing(F)V

    .line 117
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselController;->mFirstCardTop:Z

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setFirstCardTop(Z)V

    .line 118
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mDetailTextureAlignment:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDetailTextureAlignment(I)V

    .line 119
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselController;->mForceBlendCardsWithZ:Z

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setForceBlendCardsWithZ(Z)V

    .line 120
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselController;->mDrawRuler:Z

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDrawRuler(Z)V

    .line 121
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mCarouselCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setCallback(Lcom/android/ex/carousel/CarouselRS$CarouselCallback;)V

    .line 122
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDefaultBitmap(Landroid/graphics/Bitmap;)V

    .line 123
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mLoadingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setLoadingBitmap(Landroid/graphics/Bitmap;)V

    .line 124
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultGeometry:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDefaultGeometry(I)V

    .line 125
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mLoadingGeometry:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setLoadingGeometry(I)V

    .line 126
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    iget v0, v0, Landroid/renderscript/Float4;->x:F

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    iget v1, v1, Landroid/renderscript/Float4;->y:F

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    iget v2, v2, Landroid/renderscript/Float4;->z:F

    iget-object v3, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    iget v3, v3, Landroid/renderscript/Float4;->w:F

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/ex/carousel/CarouselController;->setBackgroundColor(FFFF)V

    .line 128
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setBackgroundBitmap(Landroid/graphics/Bitmap;)V

    .line 129
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultLineBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDetailLineBitmap(Landroid/graphics/Bitmap;)V

    .line 130
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mStartAngle:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setStartAngle(F)V

    .line 131
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mCarouselRotationAngle:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setCarouselRotationAngle(F)V

    .line 132
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mRadius:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setRadius(F)V

    .line 133
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mCardRotation:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setCardRotation(F)V

    .line 134
    iget-boolean v0, p0, Lcom/android/ex/carousel/CarouselController;->mCardsFaceTangent:Z

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setCardsFaceTangent(Z)V

    .line 135
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mSwaySensitivity:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setSwaySensitivity(F)V

    .line 136
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mFrictionCoefficient:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setFrictionCoefficient(F)V

    .line 137
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mDragFactor:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDragFactor(F)V

    .line 138
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mDragModel:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDragModel(I)V

    .line 139
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mFillDirection:I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setFillDirection(I)V

    .line 140
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mEye:[F

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mAt:[F

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselController;->mUp:[F

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/ex/carousel/CarouselController;->setLookAt([F[F[F)V

    .line 141
    iget v0, p0, Lcom/android/ex/carousel/CarouselController;->mRezInCardCount:F

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setRezInCardCount(F)V

    .line 142
    iget-wide v0, p0, Lcom/android/ex/carousel/CarouselController;->mFadeInDuration:J

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/CarouselController;->setFadeInDuration(J)V

    .line 143
    iget-wide v0, p0, Lcom/android/ex/carousel/CarouselController;->mCardCreationFadeDuration:J

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/CarouselController;->setCardCreationFadeDuration(J)V

    .line 144
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mDetailLoadingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setDetailLoadingBitmap(Landroid/graphics/Bitmap;)V

    .line 145
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mStoreConfigs:[I

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselController;->setStoreConfigs([I)V

    .line 146
    return-void
.end method

.method public onTouchMoved(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 785
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/CarouselRS;->doMotion(FFJ)V

    .line 786
    return-void
.end method

.method public onTouchStarted(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 775
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/CarouselRS;->doStart(FFJ)V

    .line 776
    return-void
.end method

.method public onTouchStopped(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 802
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/CarouselRS;->doStop(FFJ)V

    .line 803
    return-void
.end method

.method public setBackgroundBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .parameter "bitmap"

    .prologue
    .line 490
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundBitmap:Landroid/graphics/Bitmap;

    .line 491
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 492
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setBackgroundTexture(Landroid/graphics/Bitmap;)V

    .line 494
    :cond_b
    return-void
.end method

.method public setBackgroundColor(FFFF)V
    .registers 7
    .parameter "red"
    .parameter "green"
    .parameter "blue"
    .parameter "alpha"

    .prologue
    .line 477
    new-instance v0, Landroid/renderscript/Float4;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/renderscript/Float4;-><init>(FFFF)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    .line 478
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_12

    .line 479
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mBackgroundColor:Landroid/renderscript/Float4;

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/CarouselRS;->setBackgroundColor(Landroid/renderscript/Float4;)V

    .line 481
    :cond_12
    return-void
.end method

.method public setCallback(Lcom/android/ex/carousel/CarouselRS$CarouselCallback;)V
    .registers 3
    .parameter "callback"

    .prologue
    .line 577
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mCarouselCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

    .line 578
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 579
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setCallback(Lcom/android/ex/carousel/CarouselRS$CarouselCallback;)V

    .line 581
    :cond_b
    return-void
.end method

.method public setCardCreationFadeDuration(J)V
    .registers 4
    .parameter "t"

    .prologue
    .line 762
    iput-wide p1, p0, Lcom/android/ex/carousel/CarouselController;->mCardCreationFadeDuration:J

    .line 763
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 764
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->setCardCreationFadeDuration(J)V

    .line 766
    :cond_b
    return-void
.end method

.method public setCardRotation(F)V
    .registers 3
    .parameter "cardRotation"

    .prologue
    .line 681
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mCardRotation:F

    .line 682
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 683
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setCardRotation(F)V

    .line 685
    :cond_b
    return-void
.end method

.method public setCardsFaceTangent(Z)V
    .registers 3
    .parameter "faceTangent"

    .prologue
    .line 688
    iput-boolean p1, p0, Lcom/android/ex/carousel/CarouselController;->mCardsFaceTangent:Z

    .line 689
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 690
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setCardsFaceTangent(Z)V

    .line 692
    :cond_b
    return-void
.end method

.method public setCarouselRotationAngle(F)V
    .registers 3
    .parameter "angle"

    .prologue
    .line 616
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mCarouselRotationAngle:F

    .line 617
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 618
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setCarouselRotationAngle(F)V

    .line 620
    :cond_b
    return-void
.end method

.method public setCarouselRotationAngle(FIIF)V
    .registers 6
    .parameter "endAngle"
    .parameter "milliseconds"
    .parameter "interpolationMode"
    .parameter "maxAnimatedArc"

    .prologue
    .line 639
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_9

    .line 640
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/CarouselRS;->setCarouselRotationAngle(FIIF)V

    .line 643
    :cond_9
    return-void
.end method

.method public setDefaultBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .parameter "bitmap"

    .prologue
    .line 446
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultBitmap:Landroid/graphics/Bitmap;

    .line 447
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 448
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDefaultBitmap(Landroid/graphics/Bitmap;)V

    .line 450
    :cond_b
    return-void
.end method

.method public setDefaultCardMatrix([F)V
    .registers 3
    .parameter "matrix"

    .prologue
    .line 548
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultCardMatrix:[F

    .line 549
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 550
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDefaultCardMatrix([F)V

    .line 552
    :cond_b
    return-void
.end method

.method public setDefaultGeometry(I)V
    .registers 4
    .parameter "resId"

    .prologue
    .line 532
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultGeometry:I

    .line 533
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v1, :cond_11

    .line 534
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, p1}, Lcom/android/ex/carousel/CarouselRS;->loadGeometry(I)Landroid/renderscript/Mesh;

    move-result-object v0

    .line 535
    .local v0, mesh:Landroid/renderscript/Mesh;
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, v0}, Lcom/android/ex/carousel/CarouselRS;->setDefaultGeometry(Landroid/renderscript/Mesh;)V

    .line 537
    .end local v0           #mesh:Landroid/renderscript/Mesh;
    :cond_11
    return-void
.end method

.method public setDetailLineBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .parameter "bitmap"

    .prologue
    .line 517
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mDefaultLineBitmap:Landroid/graphics/Bitmap;

    .line 518
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 519
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDetailLineTexture(Landroid/graphics/Bitmap;)V

    .line 521
    :cond_b
    return-void
.end method

.method public setDetailLoadingBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .parameter "bitmap"

    .prologue
    .line 503
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mDetailLoadingBitmap:Landroid/graphics/Bitmap;

    .line 504
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 505
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDetailLoadingTexture(Landroid/graphics/Bitmap;)V

    .line 507
    :cond_b
    return-void
.end method

.method public setDetailTextureAlignment(I)V
    .registers 6
    .parameter "alignment"

    .prologue
    .line 297
    const v2, 0xff00

    and-int v0, p1, v2

    .line 298
    .local v0, xBits:I
    if-eqz v0, :cond_c

    add-int/lit8 v2, v0, -0x1

    and-int/2addr v2, v0

    if-eqz v2, :cond_14

    .line 299
    :cond_c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must specify exactly one horizontal alignment flag"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 302
    :cond_14
    and-int/lit16 v1, p1, 0xff

    .line 303
    .local v1, yBits:I
    if-eqz v1, :cond_1d

    add-int/lit8 v2, v1, -0x1

    and-int/2addr v2, v1

    if-eqz v2, :cond_25

    .line 304
    :cond_1d
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must specify exactly one vertical alignment flag"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 308
    :cond_25
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mDetailTextureAlignment:I

    .line 309
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v2, :cond_30

    .line 310
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v2, p1}, Lcom/android/ex/carousel/CarouselRS;->setDetailTextureAlignment(I)V

    .line 312
    :cond_30
    return-void
.end method

.method public setDetailTextureForItem(IFFFFLandroid/graphics/Bitmap;)V
    .registers 14
    .parameter "n"
    .parameter "offx"
    .parameter "offy"
    .parameter "loffx"
    .parameter "loffy"
    .parameter "bitmap"

    .prologue
    .line 396
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRS:Landroid/renderscript/RenderScriptGL;

    if-eqz v0, :cond_13

    .line 398
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/android/ex/carousel/CarouselRS;->setDetailTexture(IFFFFLandroid/graphics/Bitmap;)V

    .line 401
    :cond_13
    return-void
.end method

.method public setDragFactor(F)V
    .registers 3
    .parameter "dragFactor"

    .prologue
    .line 709
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mDragFactor:F

    .line 710
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 711
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDragFactor(F)V

    .line 713
    :cond_b
    return-void
.end method

.method public setDragModel(I)V
    .registers 3
    .parameter "model"

    .prologue
    .line 662
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mDragModel:I

    .line 663
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 664
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDragModel(I)V

    .line 666
    :cond_b
    return-void
.end method

.method public setDrawRuler(Z)V
    .registers 3
    .parameter "drawRuler"

    .prologue
    .line 335
    iput-boolean p1, p0, Lcom/android/ex/carousel/CarouselController;->mDrawRuler:Z

    .line 336
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 337
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setDrawRuler(Z)V

    .line 339
    :cond_b
    return-void
.end method

.method public setFadeInDuration(J)V
    .registers 4
    .parameter "t"

    .prologue
    .line 749
    iput-wide p1, p0, Lcom/android/ex/carousel/CarouselController;->mFadeInDuration:J

    .line 750
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 751
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->setFadeInDuration(J)V

    .line 753
    :cond_b
    return-void
.end method

.method public setFillDirection(I)V
    .registers 3
    .parameter "direction"

    .prologue
    .line 674
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mFillDirection:I

    .line 675
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 676
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setFillDirection(I)V

    .line 678
    :cond_b
    return-void
.end method

.method public setFirstCardTop(Z)V
    .registers 3
    .parameter "f"

    .prologue
    .line 275
    iput-boolean p1, p0, Lcom/android/ex/carousel/CarouselController;->mFirstCardTop:Z

    .line 276
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 277
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setFirstCardTop(Z)V

    .line 279
    :cond_b
    return-void
.end method

.method public setForceBlendCardsWithZ(Z)V
    .registers 3
    .parameter "enabled"

    .prologue
    .line 323
    iput-boolean p1, p0, Lcom/android/ex/carousel/CarouselController;->mForceBlendCardsWithZ:Z

    .line 324
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 325
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setForceBlendCardsWithZ(Z)V

    .line 327
    :cond_b
    return-void
.end method

.method public setFrictionCoefficient(F)V
    .registers 3
    .parameter "frictionCoefficient"

    .prologue
    .line 702
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mFrictionCoefficient:F

    .line 703
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 704
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setFrictionCoefficient(F)V

    .line 706
    :cond_b
    return-void
.end method

.method public setGeometryForItem(II)V
    .registers 5
    .parameter "n"
    .parameter "resId"

    .prologue
    .line 180
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v1, :cond_f

    .line 181
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, p2}, Lcom/android/ex/carousel/CarouselRS;->loadGeometry(I)Landroid/renderscript/Mesh;

    move-result-object v0

    .line 182
    .local v0, mesh:Landroid/renderscript/Mesh;
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setGeometry(ILandroid/renderscript/Mesh;)V

    .line 184
    .end local v0           #mesh:Landroid/renderscript/Mesh;
    :cond_f
    return-void
.end method

.method public setGeometryForItem(ILandroid/renderscript/Mesh;)V
    .registers 4
    .parameter "n"
    .parameter "mesh"

    .prologue
    .line 168
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_9

    .line 169
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->setGeometry(ILandroid/renderscript/Mesh;)V

    .line 171
    :cond_9
    return-void
.end method

.method public setLoadingBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .parameter "bitmap"

    .prologue
    .line 461
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mLoadingBitmap:Landroid/graphics/Bitmap;

    .line 462
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 463
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setLoadingBitmap(Landroid/graphics/Bitmap;)V

    .line 465
    :cond_b
    return-void
.end method

.method public setLoadingGeometry(I)V
    .registers 4
    .parameter "resId"

    .prologue
    .line 563
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mLoadingGeometry:I

    .line 564
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v1, :cond_11

    .line 565
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, p1}, Lcom/android/ex/carousel/CarouselRS;->loadGeometry(I)Landroid/renderscript/Mesh;

    move-result-object v0

    .line 566
    .local v0, mesh:Landroid/renderscript/Mesh;
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v1, v0}, Lcom/android/ex/carousel/CarouselRS;->setLoadingGeometry(Landroid/renderscript/Mesh;)V

    .line 568
    .end local v0           #mesh:Landroid/renderscript/Mesh;
    :cond_11
    return-void
.end method

.method public setLookAt([F[F[F)V
    .registers 5
    .parameter "eye"
    .parameter "at"
    .parameter "up"

    .prologue
    .line 716
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mEye:[F

    .line 717
    iput-object p2, p0, Lcom/android/ex/carousel/CarouselController;->mAt:[F

    .line 718
    iput-object p3, p0, Lcom/android/ex/carousel/CarouselController;->mUp:[F

    .line 719
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_f

    .line 720
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/ex/carousel/CarouselRS;->setLookAt([F[F[F)V

    .line 722
    :cond_f
    return-void
.end method

.method public setMatrixForItem(I[F)V
    .registers 4
    .parameter "n"
    .parameter "matrix"

    .prologue
    .line 193
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_9

    .line 194
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->setMatrix(I[F)V

    .line 196
    :cond_9
    return-void
.end method

.method public setOverscrollSlots(F)V
    .registers 3
    .parameter "slots"

    .prologue
    .line 285
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mOverscrollSlots:F

    .line 286
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 287
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setOverscrollSlots(F)V

    .line 289
    :cond_b
    return-void
.end method

.method public setPrefetchCardCount(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 245
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mPrefetchCardCount:I

    .line 246
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 247
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setPrefetchCardCount(I)V

    .line 249
    :cond_b
    return-void
.end method

.method public setRS(Landroid/renderscript/RenderScriptGL;Lcom/android/ex/carousel/CarouselRS;)V
    .registers 3
    .parameter "rs"
    .parameter "renderScript"

    .prologue
    .line 103
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mRS:Landroid/renderscript/RenderScriptGL;

    .line 104
    iput-object p2, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    .line 105
    return-void
.end method

.method public setRadius(F)V
    .registers 3
    .parameter "radius"

    .prologue
    .line 646
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mRadius:F

    .line 647
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 648
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setRadius(F)V

    .line 650
    :cond_b
    return-void
.end method

.method public setRezInCardCount(F)V
    .registers 3
    .parameter "n"

    .prologue
    .line 733
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mRezInCardCount:F

    .line 734
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 735
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setRezInCardCount(F)V

    .line 737
    :cond_b
    return-void
.end method

.method public setRowCount(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 255
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mRowCount:I

    .line 256
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 257
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setRowCount(I)V

    .line 259
    :cond_b
    return-void
.end method

.method public setRowSpacing(F)V
    .registers 3
    .parameter "s"

    .prologue
    .line 265
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mRowSpacing:F

    .line 266
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 267
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setRowSpacing(F)V

    .line 269
    :cond_b
    return-void
.end method

.method public setSlotCount(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 205
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mSlotCount:I

    .line 206
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 207
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setSlotCount(I)V

    .line 209
    :cond_b
    return-void
.end method

.method public setStartAngle(F)V
    .registers 3
    .parameter "angle"

    .prologue
    .line 599
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mStartAngle:F

    .line 600
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 601
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setStartAngle(F)V

    .line 603
    :cond_b
    return-void
.end method

.method public setStoreConfigs([I)V
    .registers 3
    .parameter "configs"

    .prologue
    .line 837
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselController;->mStoreConfigs:[I

    .line 838
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 839
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setStoreConfigs([I)V

    .line 841
    :cond_b
    return-void
.end method

.method public setSwaySensitivity(F)V
    .registers 3
    .parameter "swaySensitivity"

    .prologue
    .line 695
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mSwaySensitivity:F

    .line 696
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 697
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setSwaySensitivity(F)V

    .line 699
    :cond_b
    return-void
.end method

.method public setTextureForItem(ILandroid/graphics/Bitmap;)V
    .registers 4
    .parameter "n"
    .parameter "bitmap"

    .prologue
    .line 373
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRS:Landroid/renderscript/RenderScriptGL;

    if-eqz v0, :cond_d

    .line 375
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1, p2}, Lcom/android/ex/carousel/CarouselRS;->setTexture(ILandroid/graphics/Bitmap;)V

    .line 378
    :cond_d
    return-void
.end method

.method public setVisibleDetails(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 229
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleDetails:I

    .line 230
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 231
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setVisibleDetails(I)V

    .line 233
    :cond_b
    return-void
.end method

.method public setVisibleSlots(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 217
    iput p1, p0, Lcom/android/ex/carousel/CarouselController;->mVisibleSlots:I

    .line 218
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    if-eqz v0, :cond_b

    .line 219
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselController;->mRenderScript:Lcom/android/ex/carousel/CarouselRS;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/CarouselRS;->setVisibleSlots(I)V

    .line 221
    :cond_b
    return-void
.end method
