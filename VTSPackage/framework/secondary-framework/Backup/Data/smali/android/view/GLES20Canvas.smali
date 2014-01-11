.class Landroid/view/GLES20Canvas;
.super Landroid/view/HardwareCanvas;
.source "GLES20Canvas.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/view/GLES20Canvas$CanvasFinalizer;
    }
.end annotation


# static fields
.field public static final FLUSH_CACHES_FULL:I = 0x2

.field public static final FLUSH_CACHES_LAYERS:I = 0x0

.field public static final FLUSH_CACHES_MODERATE:I = 0x1

.field private static final MODIFIER_COLOR_FILTER:I = 0x4

.field private static final MODIFIER_NONE:I = 0x0

.field private static final MODIFIER_SHADER:I = 0x2

.field private static final MODIFIER_SHADOW:I = 0x1

.field private static sIsAvailable:Z


# instance fields
.field private final mClipBounds:Landroid/graphics/Rect;

.field private mFilter:Landroid/graphics/DrawFilter;

.field private mFinalizer:Landroid/view/GLES20Canvas$CanvasFinalizer;

.field private mHeight:I

.field private final mLine:[F

.field private final mOpaque:Z

.field private final mPathBounds:Landroid/graphics/RectF;

.field private final mPoint:[F

.field private mRenderer:I

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Landroid/view/GLES20Canvas;->nIsAvailable()Z

    move-result v0

    sput-boolean v0, Landroid/view/GLES20Canvas;->sIsAvailable:Z

    return-void
.end method

.method constructor <init>(IZ)V
    .locals 1
    .parameter "layer"
    .parameter "translucent"

    .prologue
    .line 94
    invoke-direct {p0}, Landroid/view/HardwareCanvas;-><init>()V

    .line 61
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mPoint:[F

    .line 62
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    .line 65
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    .line 95
    if-nez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Landroid/view/GLES20Canvas;->mOpaque:Z

    .line 96
    invoke-static {p1}, Landroid/view/GLES20Canvas;->nCreateLayerRenderer(I)I

    move-result v0

    iput v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    .line 97
    invoke-direct {p0}, Landroid/view/GLES20Canvas;->setupFinalizer()V

    .line 98
    return-void

    .line 95
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Z)V
    .locals 1
    .parameter "translucent"

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Landroid/view/GLES20Canvas;-><init>(ZZ)V

    .line 89
    return-void
.end method

.method protected constructor <init>(ZZ)V
    .locals 1
    .parameter "record"
    .parameter "translucent"

    .prologue
    .line 100
    invoke-direct {p0}, Landroid/view/HardwareCanvas;-><init>()V

    .line 61
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mPoint:[F

    .line 62
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    .line 65
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    .line 101
    if-nez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Landroid/view/GLES20Canvas;->mOpaque:Z

    .line 103
    if-eqz p1, :cond_1

    .line 104
    invoke-static {}, Landroid/view/GLES20Canvas;->nCreateDisplayListRenderer()I

    move-result v0

    iput v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    .line 109
    :goto_1
    invoke-direct {p0}, Landroid/view/GLES20Canvas;->setupFinalizer()V

    .line 110
    return-void

    .line 101
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 106
    :cond_1
    invoke-static {}, Landroid/view/GLES20Canvas;->nCreateRenderer()I

    move-result v0

    iput v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    goto :goto_1
.end method

.method static synthetic access$000(I)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 43
    invoke-static {p0}, Landroid/view/GLES20Canvas;->nDestroyRenderer(I)V

    return-void
.end method

.method static destroyDisplayList(I)V
    .locals 0
    .parameter "displayList"

    .prologue
    .line 374
    invoke-static {p0}, Landroid/view/GLES20Canvas;->nDestroyDisplayList(I)V

    .line 375
    return-void
.end method

.method public static flushCaches(I)V
    .locals 0
    .parameter "level"

    .prologue
    .line 337
    invoke-static {p0}, Landroid/view/GLES20Canvas;->nFlushCaches(I)V

    .line 338
    return-void
.end method

.method static getDisplayListSize(I)I
    .locals 1
    .parameter "displayList"

    .prologue
    .line 380
    invoke-static {p0}, Landroid/view/GLES20Canvas;->nGetDisplayListSize(I)I

    move-result v0

    return v0
.end method

.method public static getStencilSize()I
    .locals 1

    .prologue
    .line 263
    invoke-static {}, Landroid/view/GLES20Canvas;->nGetStencilSize()I

    move-result v0

    return v0
.end method

.method public static initCaches()V
    .locals 0

    .prologue
    .line 358
    invoke-static {}, Landroid/view/GLES20Canvas;->nInitCaches()V

    .line 359
    return-void
.end method

.method static isAvailable()Z
    .locals 1

    .prologue
    .line 77
    sget-boolean v0, Landroid/view/GLES20Canvas;->sIsAvailable:Z

    return v0
.end method

.method private static native nAttachFunctor(II)V
.end method

.method private static native nCallDrawGLFunction(II)I
.end method

.method static native nClearLayerTexture(I)V
.end method

.method private static native nClearLayerUpdates(I)V
.end method

.method private static native nClipRect(IFFFFI)Z
.end method

.method private static native nClipRect(IIIIII)Z
.end method

.method private static native nConcatMatrix(II)V
.end method

.method static native nCopyLayer(II)Z
.end method

.method private static native nCreateDisplayListRenderer()I
.end method

.method static native nCreateLayer(IIZ[I)I
.end method

.method private static native nCreateLayerRenderer(I)I
.end method

.method private static native nCreateRenderer()I
.end method

.method static native nCreateTextureLayer(Z[I)I
.end method

.method private static native nDestroyDisplayList(I)V
.end method

.method static native nDestroyLayer(I)V
.end method

.method static native nDestroyLayerDeferred(I)V
.end method

.method private static native nDestroyRenderer(I)V
.end method

.method private static native nDetachFunctor(II)V
.end method

.method private static native nDrawArc(IFFFFFFZI)V
.end method

.method private static native nDrawBitmap(II[BFFFFFFFFI)V
.end method

.method private static native nDrawBitmap(II[BFFI)V
.end method

.method private static native nDrawBitmap(II[BII)V
.end method

.method private static native nDrawBitmap(I[IIIFFIIZI)V
.end method

.method private static native nDrawBitmapMesh(II[BII[FI[III)V
.end method

.method private static native nDrawCircle(IFFFI)V
.end method

.method private static native nDrawColor(III)V
.end method

.method private static native nDrawDisplayList(IILandroid/graphics/Rect;I)I
.end method

.method private static native nDrawLayer(IIFFI)V
.end method

.method private static native nDrawLines(I[FIII)V
.end method

.method private static native nDrawOval(IFFFFI)V
.end method

.method private static native nDrawPatch(II[B[BFFFFI)V
.end method

.method private static native nDrawPath(III)V
.end method

.method private static native nDrawPoints(I[FIII)V
.end method

.method private static native nDrawPosText(ILjava/lang/String;II[FI)V
.end method

.method private static native nDrawPosText(I[CII[FI)V
.end method

.method private static native nDrawRect(IFFFFI)V
.end method

.method private static native nDrawRects(III)V
.end method

.method private static native nDrawRoundRect(IFFFFFFI)V
.end method

.method private static native nDrawText(ILjava/lang/String;IIFFII)V
.end method

.method private static native nDrawText(I[CIIFFII)V
.end method

.method private static native nDrawTextOnPath(ILjava/lang/String;IIIFFII)V
.end method

.method private static native nDrawTextOnPath(I[CIIIFFII)V
.end method

.method private static native nDrawTextRun(ILjava/lang/String;IIIIFFII)V
.end method

.method private static native nDrawTextRun(I[CIIIIFFII)V
.end method

.method private static native nFinish(I)V
.end method

.method private static native nFlushCaches(I)V
.end method

.method private static native nGetClipBounds(ILandroid/graphics/Rect;)Z
.end method

.method private static native nGetDisplayList(II)I
.end method

.method private static native nGetDisplayListSize(I)I
.end method

.method private static native nGetMatrix(II)V
.end method

.method private static native nGetMaximumTextureHeight()I
.end method

.method private static native nGetMaximumTextureWidth()I
.end method

.method private static native nGetSaveCount(I)I
.end method

.method private static native nGetStencilSize()I
.end method

.method private static native nInitCaches()V
.end method

.method private static native nInterrupt(I)V
.end method

.method private static native nInvokeFunctors(ILandroid/graphics/Rect;)I
.end method

.method private static native nIsAvailable()Z
.end method

.method private static native nOutputDisplayList(II)V
.end method

.method private static native nPrepare(IZ)I
.end method

.method private static native nPrepareDirty(IIIIIZ)I
.end method

.method private static native nPushLayerUpdate(II)V
.end method

.method private static native nQuickReject(IFFFFI)Z
.end method

.method private static native nResetDisplayListRenderer(I)V
.end method

.method private static native nResetModifiers(II)V
.end method

.method private static native nResetPaintFilter(I)V
.end method

.method static native nResizeLayer(III[I)Z
.end method

.method private static native nRestore(I)V
.end method

.method private static native nRestoreToCount(II)V
.end method

.method private static native nResume(I)V
.end method

.method private static native nRotate(IF)V
.end method

.method private static native nSave(II)I
.end method

.method private static native nSaveLayer(IFFFFII)I
.end method

.method private static native nSaveLayer(III)I
.end method

.method private static native nSaveLayerAlpha(IFFFFII)I
.end method

.method private static native nSaveLayerAlpha(III)I
.end method

.method private static native nScale(IFF)V
.end method

.method private static native nSetDisplayListName(ILjava/lang/String;)V
.end method

.method static native nSetLayerColorFilter(II)V
.end method

.method static native nSetLayerPaint(II)V
.end method

.method private static native nSetMatrix(II)V
.end method

.method static native nSetOpaqueLayer(IZ)V
.end method

.method static native nSetTextureLayerTransform(II)V
.end method

.method private static native nSetViewport(III)V
.end method

.method private static native nSetupColorFilter(II)V
.end method

.method private static native nSetupPaintFilter(III)V
.end method

.method private static native nSetupShader(II)V
.end method

.method private static native nSetupShadow(IFFFI)V
.end method

.method private static native nSkew(IFF)V
.end method

.method private static native nTerminateCaches()V
.end method

.method private static native nTranslate(IFF)V
.end method

.method static native nUpdateRenderLayer(IIIIIII)V
.end method

.method static native nUpdateTextureLayer(IIIZLandroid/graphics/SurfaceTexture;)V
.end method

.method static setDisplayListName(ILjava/lang/String;)V
    .locals 0
    .parameter "displayList"
    .parameter "name"

    .prologue
    .line 386
    invoke-static {p0, p1}, Landroid/view/GLES20Canvas;->nSetDisplayListName(ILjava/lang/String;)V

    .line 387
    return-void
.end method

.method private setupColorFilter(Landroid/graphics/Paint;)I
    .locals 3
    .parameter "paint"

    .prologue
    .line 1391
    invoke-virtual {p1}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    .line 1392
    .local v0, filter:Landroid/graphics/ColorFilter;
    if-eqz v0, :cond_0

    .line 1393
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, v0, Landroid/graphics/ColorFilter;->nativeColorFilter:I

    invoke-static {v1, v2}, Landroid/view/GLES20Canvas;->nSetupColorFilter(II)V

    .line 1394
    const/4 v1, 0x4

    .line 1396
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setupFinalizer()V
    .locals 2

    .prologue
    .line 113
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not create GLES20Canvas renderer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_0
    new-instance v0, Landroid/view/GLES20Canvas$CanvasFinalizer;

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-direct {v0, v1}, Landroid/view/GLES20Canvas$CanvasFinalizer;-><init>(I)V

    iput-object v0, p0, Landroid/view/GLES20Canvas;->mFinalizer:Landroid/view/GLES20Canvas$CanvasFinalizer;

    .line 118
    return-void
.end method

.method private setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I
    .locals 3
    .parameter "b"
    .parameter "paint"

    .prologue
    .line 1329
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-eq v1, v2, :cond_1

    .line 1330
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    .line 1331
    .local v0, filter:Landroid/graphics/ColorFilter;
    if-eqz v0, :cond_0

    .line 1332
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, v0, Landroid/graphics/ColorFilter;->nativeColorFilter:I

    invoke-static {v1, v2}, Landroid/view/GLES20Canvas;->nSetupColorFilter(II)V

    .line 1333
    const/4 v1, 0x4

    .line 1338
    .end local v0           #filter:Landroid/graphics/ColorFilter;
    :goto_0
    return v1

    .line 1336
    .restart local v0       #filter:Landroid/graphics/ColorFilter;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1338
    .end local v0           #filter:Landroid/graphics/ColorFilter;
    :cond_1
    invoke-direct {p0, p2}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v1

    goto :goto_0
.end method

.method private setupModifiers(Landroid/graphics/Paint;)I
    .locals 8
    .parameter "paint"

    .prologue
    .line 1343
    const/4 v1, 0x0

    .line 1345
    .local v1, modifiers:I
    iget-boolean v3, p1, Landroid/graphics/Paint;->hasShadow:Z

    if-eqz v3, :cond_0

    .line 1346
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, p1, Landroid/graphics/Paint;->shadowRadius:F

    iget v5, p1, Landroid/graphics/Paint;->shadowDx:F

    iget v6, p1, Landroid/graphics/Paint;->shadowDy:F

    iget v7, p1, Landroid/graphics/Paint;->shadowColor:I

    invoke-static {v3, v4, v5, v6, v7}, Landroid/view/GLES20Canvas;->nSetupShadow(IFFFI)V

    .line 1348
    or-int/lit8 v1, v1, 0x1

    .line 1351
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v2

    .line 1352
    .local v2, shader:Landroid/graphics/Shader;
    if-eqz v2, :cond_1

    .line 1353
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, v2, Landroid/graphics/Shader;->native_shader:I

    invoke-static {v3, v4}, Landroid/view/GLES20Canvas;->nSetupShader(II)V

    .line 1354
    or-int/lit8 v1, v1, 0x2

    .line 1357
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    .line 1358
    .local v0, filter:Landroid/graphics/ColorFilter;
    if-eqz v0, :cond_2

    .line 1359
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, v0, Landroid/graphics/ColorFilter;->nativeColorFilter:I

    invoke-static {v3, v4}, Landroid/view/GLES20Canvas;->nSetupColorFilter(II)V

    .line 1360
    or-int/lit8 v1, v1, 0x4

    .line 1363
    :cond_2
    return v1
.end method

.method private setupModifiers(Landroid/graphics/Paint;I)I
    .locals 8
    .parameter "paint"
    .parameter "flags"

    .prologue
    .line 1367
    const/4 v1, 0x0

    .line 1369
    .local v1, modifiers:I
    iget-boolean v3, p1, Landroid/graphics/Paint;->hasShadow:Z

    if-eqz v3, :cond_0

    and-int/lit8 v3, p2, 0x1

    if-eqz v3, :cond_0

    .line 1370
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, p1, Landroid/graphics/Paint;->shadowRadius:F

    iget v5, p1, Landroid/graphics/Paint;->shadowDx:F

    iget v6, p1, Landroid/graphics/Paint;->shadowDy:F

    iget v7, p1, Landroid/graphics/Paint;->shadowColor:I

    invoke-static {v3, v4, v5, v6, v7}, Landroid/view/GLES20Canvas;->nSetupShadow(IFFFI)V

    .line 1372
    or-int/lit8 v1, v1, 0x1

    .line 1375
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v2

    .line 1376
    .local v2, shader:Landroid/graphics/Shader;
    if-eqz v2, :cond_1

    and-int/lit8 v3, p2, 0x2

    if-eqz v3, :cond_1

    .line 1377
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, v2, Landroid/graphics/Shader;->native_shader:I

    invoke-static {v3, v4}, Landroid/view/GLES20Canvas;->nSetupShader(II)V

    .line 1378
    or-int/lit8 v1, v1, 0x2

    .line 1381
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    .line 1382
    .local v0, filter:Landroid/graphics/ColorFilter;
    if-eqz v0, :cond_2

    and-int/lit8 v3, p2, 0x4

    if-eqz v3, :cond_2

    .line 1383
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v4, v0, Landroid/graphics/ColorFilter;->nativeColorFilter:I

    invoke-static {v3, v4}, Landroid/view/GLES20Canvas;->nSetupColorFilter(II)V

    .line 1384
    or-int/lit8 v1, v1, 0x4

    .line 1387
    :cond_2
    return v1
.end method

.method public static terminateCaches()V
    .locals 0

    .prologue
    .line 349
    invoke-static {}, Landroid/view/GLES20Canvas;->nTerminateCaches()V

    .line 350
    return-void
.end method


# virtual methods
.method public attachFunctor(I)V
    .locals 1
    .parameter "functor"

    .prologue
    .line 295
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nAttachFunctor(II)V

    .line 296
    return-void
.end method

.method public callDrawGLFunction(I)I
    .locals 1
    .parameter "drawGLFunction"

    .prologue
    .line 274
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nCallDrawGLFunction(II)I

    move-result v0

    return v0
.end method

.method clearLayerUpdates()V
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nClearLayerUpdates(I)V

    .line 159
    return-void
.end method

.method public clipPath(Landroid/graphics/Path;)Z
    .locals 6
    .parameter "path"

    .prologue
    .line 439
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 440
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v1, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v5, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z
    .locals 6
    .parameter "path"
    .parameter "op"

    .prologue
    .line 447
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 448
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v1, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipRect(FFFF)Z
    .locals 6
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 454
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    sget-object v1, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v1, Landroid/graphics/Region$Op;->nativeInt:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipRect(FFFFLandroid/graphics/Region$Op;)Z
    .locals 6
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"
    .parameter "op"

    .prologue
    .line 462
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v5, p5, Landroid/graphics/Region$Op;->nativeInt:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipRect(IIII)Z
    .locals 6
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 467
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    sget-object v1, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v1, Landroid/graphics/Region$Op;->nativeInt:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IIIIII)Z

    move-result v0

    return v0
.end method

.method public clipRect(Landroid/graphics/Rect;)Z
    .locals 6
    .parameter "rect"

    .prologue
    .line 475
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v5, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IIIIII)Z

    move-result v0

    return v0
.end method

.method public clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z
    .locals 6
    .parameter "rect"
    .parameter "op"

    .prologue
    .line 481
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    iget v5, p2, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IIIIII)Z

    move-result v0

    return v0
.end method

.method public clipRect(Landroid/graphics/RectF;)Z
    .locals 6
    .parameter "rect"

    .prologue
    .line 486
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v5, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z
    .locals 6
    .parameter "rect"
    .parameter "op"

    .prologue
    .line 492
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public clipRegion(Landroid/graphics/Region;)Z
    .locals 6
    .parameter "region"

    .prologue
    .line 498
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Region;->getBounds(Landroid/graphics/Rect;)Z

    .line 499
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v1, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    iget v5, v5, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IIIIII)Z

    move-result v0

    return v0
.end method

.method public clipRegion(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z
    .locals 6
    .parameter "region"
    .parameter "op"

    .prologue
    .line 506
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Region;->getBounds(Landroid/graphics/Rect;)Z

    .line 507
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v1, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    iget v5, p2, Landroid/graphics/Region$Op;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nClipRect(IIIIII)Z

    move-result v0

    return v0
.end method

.method public concat(Landroid/graphics/Matrix;)V
    .locals 2
    .parameter "matrix"

    .prologue
    .line 587
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Matrix;->native_instance:I

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nConcatMatrix(II)V

    .line 588
    return-void
.end method

.method public detachFunctor(I)V
    .locals 1
    .parameter "functor"

    .prologue
    .line 288
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nDetachFunctor(II)V

    .line 289
    return-void
.end method

.method public drawARGB(IIII)V
    .locals 2
    .parameter "a"
    .parameter "r"
    .parameter "g"
    .parameter "b"

    .prologue
    .line 736
    and-int/lit16 v0, p1, 0xff

    shl-int/lit8 v0, v0, 0x18

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 v1, p3, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, p4, 0xff

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/view/GLES20Canvas;->drawColor(I)V

    .line 737
    return-void
.end method

.method public drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V
    .locals 10
    .parameter "oval"
    .parameter "startAngle"
    .parameter "sweepAngle"
    .parameter "useCenter"
    .parameter "paint"

    .prologue
    .line 721
    const/4 v0, 0x6

    invoke-direct {p0, p5, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v9

    .line 723
    .local v9, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v8, p5, Landroid/graphics/Paint;->mNativePaint:I

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-static/range {v0 .. v8}, Landroid/view/GLES20Canvas;->nDrawArc(IFFFFFFZI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 726
    if-eqz v9, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 728
    :cond_0
    return-void

    .line 726
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v0
.end method

.method public drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    .locals 7
    .parameter "bitmap"
    .parameter "left"
    .parameter "top"
    .parameter "paint"

    .prologue
    const/4 v0, 0x0

    .line 758
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot draw recycled bitmaps"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 760
    :cond_0
    if-eqz p4, :cond_2

    invoke-direct {p0, p1, p4}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I

    move-result v6

    .line 762
    .local v6, modifiers:I
    :goto_0
    if-nez p4, :cond_3

    move v5, v0

    .line 763
    .local v5, nativePaint:I
    :goto_1
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Bitmap;->mNativeBitmap:I

    iget-object v2, p1, Landroid/graphics/Bitmap;->mBuffer:[B

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nDrawBitmap(II[BFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 765
    if-eqz v6, :cond_1

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 767
    :cond_1
    return-void

    .end local v5           #nativePaint:I
    .end local v6           #modifiers:I
    :cond_2
    move v6, v0

    .line 760
    goto :goto_0

    .line 762
    .restart local v6       #modifiers:I
    :cond_3
    :try_start_1
    iget v5, p4, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 765
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_4
    throw v0
.end method

.method public drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
    .locals 6
    .parameter "bitmap"
    .parameter "matrix"
    .parameter "paint"

    .prologue
    const/4 v2, 0x0

    .line 774
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Cannot draw recycled bitmaps"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 776
    :cond_0
    if-eqz p3, :cond_2

    invoke-direct {p0, p1, p3}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I

    move-result v0

    .line 778
    .local v0, modifiers:I
    :goto_0
    if-nez p3, :cond_3

    move v1, v2

    .line 779
    .local v1, nativePaint:I
    :goto_1
    :try_start_0
    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v3, p1, Landroid/graphics/Bitmap;->mNativeBitmap:I

    iget-object v4, p1, Landroid/graphics/Bitmap;->mBuffer:[B

    iget v5, p2, Landroid/graphics/Matrix;->native_instance:I

    invoke-static {v2, v3, v4, v5, v1}, Landroid/view/GLES20Canvas;->nDrawBitmap(II[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 782
    if-eqz v0, :cond_1

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 784
    :cond_1
    return-void

    .end local v0           #modifiers:I
    .end local v1           #nativePaint:I
    :cond_2
    move v0, v2

    .line 776
    goto :goto_0

    .line 778
    .restart local v0       #modifiers:I
    :cond_3
    :try_start_1
    iget v1, p3, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 782
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_4

    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v3, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_4
    throw v2
.end method

.method public drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 20
    .parameter "bitmap"
    .parameter "src"
    .parameter "dst"
    .parameter "paint"

    .prologue
    .line 791
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Cannot draw recycled bitmaps"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 793
    :cond_0
    if-eqz p4, :cond_2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I

    move-result v17

    .line 795
    .local v17, modifiers:I
    :goto_0
    if-nez p4, :cond_3

    const/4 v14, 0x0

    .line 798
    .local v14, nativePaint:I
    :goto_1
    if-nez p2, :cond_4

    .line 799
    const/16 v19, 0x0

    .local v19, top:I
    move/from16 v16, v19

    .line 800
    .local v16, left:I
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v18

    .line 801
    .local v18, right:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    .line 809
    .local v15, bottom:I
    :goto_2
    move-object/from16 v0, p0

    iget v3, v0, Landroid/view/GLES20Canvas;->mRenderer:I

    move-object/from16 v0, p1

    iget v4, v0, Landroid/graphics/Bitmap;->mNativeBitmap:I

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/graphics/Bitmap;->mBuffer:[B

    move/from16 v0, v16

    int-to-float v6, v0

    move/from16 v0, v19

    int-to-float v7, v0

    move/from16 v0, v18

    int-to-float v8, v0

    int-to-float v9, v15

    move-object/from16 v0, p3

    iget v10, v0, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    move-object/from16 v0, p3

    iget v11, v0, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    move-object/from16 v0, p3

    iget v12, v0, Landroid/graphics/Rect;->right:I

    int-to-float v12, v12

    move-object/from16 v0, p3

    iget v13, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v13

    invoke-static/range {v3 .. v14}, Landroid/view/GLES20Canvas;->nDrawBitmap(II[BFFFFFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 812
    if-eqz v17, :cond_1

    move-object/from16 v0, p0

    iget v3, v0, Landroid/view/GLES20Canvas;->mRenderer:I

    move/from16 v0, v17

    invoke-static {v3, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 814
    :cond_1
    return-void

    .line 793
    .end local v14           #nativePaint:I
    .end local v15           #bottom:I
    .end local v16           #left:I
    .end local v17           #modifiers:I
    .end local v18           #right:I
    .end local v19           #top:I
    :cond_2
    const/16 v17, 0x0

    goto :goto_0

    .line 795
    .restart local v17       #modifiers:I
    :cond_3
    :try_start_1
    move-object/from16 v0, p4

    iget v14, v0, Landroid/graphics/Paint;->mNativePaint:I

    goto :goto_1

    .line 803
    .restart local v14       #nativePaint:I
    :cond_4
    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v16, v0

    .line 804
    .restart local v16       #left:I
    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v18, v0

    .line 805
    .restart local v18       #right:I
    move-object/from16 v0, p2

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    .line 806
    .restart local v19       #top:I
    move-object/from16 v0, p2

    iget v15, v0, Landroid/graphics/Rect;->bottom:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v15       #bottom:I
    goto :goto_2

    .line 812
    .end local v14           #nativePaint:I
    .end local v15           #bottom:I
    .end local v16           #left:I
    .end local v18           #right:I
    .end local v19           #top:I
    :catchall_0
    move-exception v3

    if-eqz v17, :cond_5

    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/GLES20Canvas;->mRenderer:I

    move/from16 v0, v17

    invoke-static {v4, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_5
    throw v3
.end method

.method public drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 14
    .parameter "bitmap"
    .parameter "src"
    .parameter "dst"
    .parameter "paint"

    .prologue
    .line 818
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot draw recycled bitmaps"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 820
    :cond_0
    if-eqz p4, :cond_2

    move-object/from16 v0, p4

    invoke-direct {p0, p1, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I

    move-result v13

    .line 822
    .local v13, modifiers:I
    :goto_0
    if-nez p4, :cond_3

    const/4 v12, 0x0

    .line 825
    .local v12, nativePaint:I
    :goto_1
    if-nez p2, :cond_4

    .line 826
    const/4 v5, 0x0

    .local v5, top:F
    move v4, v5

    .line 827
    .local v4, left:F
    :try_start_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v6, v1

    .line 828
    .local v6, right:F
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v7, v1

    .line 836
    .local v7, bottom:F
    :goto_2
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p1, Landroid/graphics/Bitmap;->mNativeBitmap:I

    iget-object v3, p1, Landroid/graphics/Bitmap;->mBuffer:[B

    move-object/from16 v0, p3

    iget v8, v0, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p3

    iget v9, v0, Landroid/graphics/RectF;->top:F

    move-object/from16 v0, p3

    iget v10, v0, Landroid/graphics/RectF;->right:F

    move-object/from16 v0, p3

    iget v11, v0, Landroid/graphics/RectF;->bottom:F

    invoke-static/range {v1 .. v12}, Landroid/view/GLES20Canvas;->nDrawBitmap(II[BFFFFFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 839
    if-eqz v13, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v13}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 841
    :cond_1
    return-void

    .line 820
    .end local v4           #left:F
    .end local v5           #top:F
    .end local v6           #right:F
    .end local v7           #bottom:F
    .end local v12           #nativePaint:I
    .end local v13           #modifiers:I
    :cond_2
    const/4 v13, 0x0

    goto :goto_0

    .line 822
    .restart local v13       #modifiers:I
    :cond_3
    :try_start_1
    move-object/from16 v0, p4

    iget v12, v0, Landroid/graphics/Paint;->mNativePaint:I

    goto :goto_1

    .line 830
    .restart local v12       #nativePaint:I
    :cond_4
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v1

    .line 831
    .restart local v4       #left:F
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v6, v1

    .line 832
    .restart local v6       #right:F
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v5, v1

    .line 833
    .restart local v5       #top:F
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->bottom:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-float v7, v1

    .restart local v7       #bottom:F
    goto :goto_2

    .line 839
    .end local v4           #left:F
    .end local v5           #top:F
    .end local v6           #right:F
    .end local v7           #bottom:F
    .end local v12           #nativePaint:I
    :catchall_0
    move-exception v1

    if-eqz v13, :cond_5

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v13}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_5
    throw v1
.end method

.method public drawBitmap([IIIFFIIZLandroid/graphics/Paint;)V
    .locals 14
    .parameter "colors"
    .parameter "offset"
    .parameter "stride"
    .parameter "x"
    .parameter "y"
    .parameter "width"
    .parameter "height"
    .parameter "hasAlpha"
    .parameter "paint"

    .prologue
    .line 850
    if-gez p6, :cond_0

    .line 851
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "width must be >= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 854
    :cond_0
    if-gez p7, :cond_1

    .line 855
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "height must be >= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 858
    :cond_1
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    move/from16 v0, p6

    if-ge v1, v0, :cond_2

    .line 859
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "abs(stride) must be >= width"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 862
    :cond_2
    add-int/lit8 v1, p7, -0x1

    mul-int v1, v1, p3

    add-int v11, p2, v1

    .line 863
    .local v11, lastScanline:I
    array-length v12, p1

    .line 865
    .local v12, length:I
    if-ltz p2, :cond_3

    add-int v1, p2, p6

    if-gt v1, v12, :cond_3

    if-ltz v11, :cond_3

    add-int v1, v11, p6

    if-le v1, v12, :cond_4

    .line 867
    :cond_3
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 871
    :cond_4
    if-eqz p9, :cond_6

    move-object/from16 v0, p9

    invoke-direct {p0, v0}, Landroid/view/GLES20Canvas;->setupColorFilter(Landroid/graphics/Paint;)I

    move-result v13

    .line 873
    .local v13, modifier:I
    :goto_0
    if-nez p9, :cond_7

    const/4 v10, 0x0

    .line 874
    .local v10, nativePaint:I
    :goto_1
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    move-object v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-static/range {v1 .. v10}, Landroid/view/GLES20Canvas;->nDrawBitmap(I[IIIFFIIZI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 877
    if-eqz v13, :cond_5

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v13}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 879
    :cond_5
    return-void

    .line 871
    .end local v10           #nativePaint:I
    .end local v13           #modifier:I
    :cond_6
    const/4 v13, 0x0

    goto :goto_0

    .line 873
    .restart local v13       #modifier:I
    :cond_7
    :try_start_1
    move-object/from16 v0, p9

    iget v10, v0, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 877
    :catchall_0
    move-exception v1

    if-eqz v13, :cond_8

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v13}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_8
    throw v1
.end method

.method public drawBitmap([IIIIIIIZLandroid/graphics/Paint;)V
    .locals 10
    .parameter "colors"
    .parameter "offset"
    .parameter "stride"
    .parameter "x"
    .parameter "y"
    .parameter "width"
    .parameter "height"
    .parameter "hasAlpha"
    .parameter "paint"

    .prologue
    .line 888
    int-to-float v4, p4

    int-to-float v5, p5

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-virtual/range {v0 .. v9}, Landroid/view/GLES20Canvas;->drawBitmap([IIIFFIIZLandroid/graphics/Paint;)V

    .line 889
    return-void
.end method

.method public drawBitmapMesh(Landroid/graphics/Bitmap;II[FI[IILandroid/graphics/Paint;)V
    .locals 13
    .parameter "bitmap"
    .parameter "meshWidth"
    .parameter "meshHeight"
    .parameter "verts"
    .parameter "vertOffset"
    .parameter "colors"
    .parameter "colorOffset"
    .parameter "paint"

    .prologue
    .line 894
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot draw recycled bitmaps"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 895
    :cond_0
    if-ltz p2, :cond_1

    if-ltz p3, :cond_1

    if-ltz p5, :cond_1

    if-gez p7, :cond_2

    .line 896
    :cond_1
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 899
    :cond_2
    if-eqz p2, :cond_3

    if-nez p3, :cond_4

    .line 918
    :cond_3
    :goto_0
    return-void

    .line 903
    :cond_4
    add-int/lit8 v1, p2, 0x1

    add-int/lit8 v2, p3, 0x1

    mul-int v11, v1, v2

    .line 904
    .local v11, count:I
    move-object/from16 v0, p4

    array-length v1, v0

    mul-int/lit8 v2, v11, 0x2

    move/from16 v0, p5

    invoke-static {v1, v0, v2}, Landroid/view/GLES20Canvas;->checkRange(III)V

    .line 907
    const/16 p6, 0x0

    .line 908
    const/16 p7, 0x0

    .line 910
    if-eqz p8, :cond_5

    move-object/from16 v0, p8

    invoke-direct {p0, p1, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Bitmap;Landroid/graphics/Paint;)I

    move-result v12

    .line 912
    .local v12, modifiers:I
    :goto_1
    if-nez p8, :cond_6

    const/4 v10, 0x0

    .line 913
    .local v10, nativePaint:I
    :goto_2
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p1, Landroid/graphics/Bitmap;->mNativeBitmap:I

    iget-object v3, p1, Landroid/graphics/Bitmap;->mBuffer:[B

    move v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    invoke-static/range {v1 .. v10}, Landroid/view/GLES20Canvas;->nDrawBitmapMesh(II[BII[FI[III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 916
    if-eqz v12, :cond_3

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v12}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    goto :goto_0

    .line 910
    .end local v10           #nativePaint:I
    .end local v12           #modifiers:I
    :cond_5
    const/4 v12, 0x0

    goto :goto_1

    .line 912
    .restart local v12       #modifiers:I
    :cond_6
    :try_start_1
    move-object/from16 v0, p8

    iget v10, v0, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 916
    :catchall_0
    move-exception v1

    if-eqz v12, :cond_7

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v12}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_7
    throw v1
.end method

.method public drawCircle(FFFLandroid/graphics/Paint;)V
    .locals 3
    .parameter "cx"
    .parameter "cy"
    .parameter "radius"
    .parameter "paint"

    .prologue
    .line 926
    const/4 v1, 0x6

    invoke-direct {p0, p4, v1}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v0

    .line 928
    .local v0, modifiers:I
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p4, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static {v1, p1, p2, p3, v2}, Landroid/view/GLES20Canvas;->nDrawCircle(IFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 930
    if-eqz v0, :cond_0

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 932
    :cond_0
    return-void

    .line 930
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v1
.end method

.method public drawColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 939
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, v0}, Landroid/view/GLES20Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 940
    return-void
.end method

.method public drawColor(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 2
    .parameter "color"
    .parameter "mode"

    .prologue
    .line 944
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p2, Landroid/graphics/PorterDuff$Mode;->nativeInt:I

    invoke-static {v0, p1, v1}, Landroid/view/GLES20Canvas;->nDrawColor(III)V

    .line 945
    return-void
.end method

.method public drawDisplayList(Landroid/view/DisplayList;Landroid/graphics/Rect;I)I
    .locals 2
    .parameter "displayList"
    .parameter "dirty"
    .parameter "flags"

    .prologue
    .line 393
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    check-cast p1, Landroid/view/GLES20DisplayList;

    .end local p1
    invoke-virtual {p1}, Landroid/view/GLES20DisplayList;->getNativeDisplayList()I

    move-result v1

    invoke-static {v0, v1, p2, p3}, Landroid/view/GLES20Canvas;->nDrawDisplayList(IILandroid/graphics/Rect;I)I

    move-result v0

    return v0
.end method

.method drawHardwareLayer(Landroid/view/HardwareLayer;FFLandroid/graphics/Paint;)V
    .locals 4
    .parameter "layer"
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    .line 412
    move-object v0, p1

    check-cast v0, Landroid/view/GLES20Layer;

    .line 413
    .local v0, glLayer:Landroid/view/GLES20Layer;
    invoke-virtual {v0}, Landroid/view/GLES20Layer;->getLayer()I

    move-result v1

    .line 414
    .local v1, nativeLayer:I
    if-nez p4, :cond_0

    const/4 v2, 0x0

    .line 415
    .local v2, nativePaint:I
    :goto_0
    invoke-static {v1, v2}, Landroid/view/GLES20Canvas;->nSetLayerPaint(II)V

    .line 416
    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v3, v1, p2, p3, v2}, Landroid/view/GLES20Canvas;->nDrawLayer(IIFFI)V

    .line 417
    return-void

    .line 414
    .end local v2           #nativePaint:I
    :cond_0
    iget v2, p4, Landroid/graphics/Paint;->mNativePaint:I

    goto :goto_0
.end method

.method public drawLine(FFFFLandroid/graphics/Paint;)V
    .locals 3
    .parameter "startX"
    .parameter "startY"
    .parameter "stopX"
    .parameter "stopY"
    .parameter "paint"

    .prologue
    const/4 v2, 0x0

    .line 951
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    aput p1, v0, v2

    .line 952
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 953
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 954
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    const/4 v1, 0x3

    aput p4, v0, v1

    .line 955
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mLine:[F

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v2, v1, p5}, Landroid/view/GLES20Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    .line 956
    return-void
.end method

.method public drawLines([FIILandroid/graphics/Paint;)V
    .locals 3
    .parameter "pts"
    .parameter "offset"
    .parameter "count"
    .parameter "paint"

    .prologue
    .line 960
    or-int v1, p2, p3

    if-ltz v1, :cond_0

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_1

    .line 961
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The lines array must contain 4 elements per line."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 963
    :cond_1
    const/4 v1, 0x6

    invoke-direct {p0, p4, v1}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v0

    .line 965
    .local v0, modifiers:I
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p4, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static {v1, p1, p2, p3, v2}, Landroid/view/GLES20Canvas;->nDrawLines(I[FIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 967
    if-eqz v0, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 969
    :cond_2
    return-void

    .line 967
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v1
.end method

.method public drawLines([FLandroid/graphics/Paint;)V
    .locals 2
    .parameter "pts"
    .parameter "paint"

    .prologue
    .line 976
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Landroid/view/GLES20Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    .line 977
    return-void
.end method

.method public drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 7
    .parameter "oval"
    .parameter "paint"

    .prologue
    .line 981
    const/4 v0, 0x6

    invoke-direct {p0, p2, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v6

    .line 983
    .local v6, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nDrawOval(IFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 985
    if-eqz v6, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 987
    :cond_0
    return-void

    .line 985
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v0
.end method

.method public drawPaint(Landroid/graphics/Paint;)V
    .locals 7
    .parameter "paint"

    .prologue
    .line 994
    iget-object v6, p0, Landroid/view/GLES20Canvas;->mClipBounds:Landroid/graphics/Rect;

    .line 995
    .local v6, r:Landroid/graphics/Rect;
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nGetClipBounds(ILandroid/graphics/Rect;)Z

    .line 996
    iget v0, v6, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget v0, v6, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget v0, v6, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/view/GLES20Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 997
    return-void
.end method

.method public drawPatch(Landroid/graphics/Bitmap;[BLandroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 10
    .parameter "bitmap"
    .parameter "chunks"
    .parameter "dst"
    .parameter "paint"

    .prologue
    const/4 v0, 0x0

    .line 741
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot draw recycled bitmaps"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 743
    :cond_0
    if-eqz p4, :cond_2

    invoke-direct {p0, p4}, Landroid/view/GLES20Canvas;->setupColorFilter(Landroid/graphics/Paint;)I

    move-result v9

    .line 745
    .local v9, modifier:I
    :goto_0
    if-nez p4, :cond_3

    move v8, v0

    .line 746
    .local v8, nativePaint:I
    :goto_1
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Bitmap;->mNativeBitmap:I

    iget-object v2, p1, Landroid/graphics/Bitmap;->mBuffer:[B

    iget v4, p3, Landroid/graphics/RectF;->left:F

    iget v5, p3, Landroid/graphics/RectF;->top:F

    iget v6, p3, Landroid/graphics/RectF;->right:F

    iget v7, p3, Landroid/graphics/RectF;->bottom:F

    move-object v3, p2

    invoke-static/range {v0 .. v8}, Landroid/view/GLES20Canvas;->nDrawPatch(II[B[BFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 749
    if-eqz v9, :cond_1

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 751
    :cond_1
    return-void

    .end local v8           #nativePaint:I
    .end local v9           #modifier:I
    :cond_2
    move v9, v0

    .line 743
    goto :goto_0

    .line 745
    .restart local v9       #modifier:I
    :cond_3
    :try_start_1
    iget v8, p4, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 749
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_4

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_4
    throw v0
.end method

.method public drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
    .locals 4
    .parameter "path"
    .parameter "paint"

    .prologue
    .line 1001
    const/4 v1, 0x6

    invoke-direct {p0, p2, v1}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v0

    .line 1003
    .local v0, modifiers:I
    :try_start_0
    iget-boolean v1, p1, Landroid/graphics/Path;->isSimplePath:Z

    if-eqz v1, :cond_2

    .line 1004
    iget-object v1, p1, Landroid/graphics/Path;->rects:Landroid/graphics/Region;

    if-eqz v1, :cond_0

    .line 1005
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v2, p1, Landroid/graphics/Path;->rects:Landroid/graphics/Region;

    iget v2, v2, Landroid/graphics/Region;->mNativeRegion:I

    iget v3, p2, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static {v1, v2, v3}, Landroid/view/GLES20Canvas;->nDrawRects(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1011
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1013
    :cond_1
    return-void

    .line 1008
    :cond_2
    :try_start_1
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p1, Landroid/graphics/Path;->mNativePath:I

    iget v3, p2, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static {v1, v2, v3}, Landroid/view/GLES20Canvas;->nDrawPath(III)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1011
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v1
.end method

.method public drawPicture(Landroid/graphics/Picture;)V
    .locals 1
    .parameter "picture"

    .prologue
    .line 1020
    iget-boolean v0, p1, Landroid/graphics/Picture;->createdFromStream:Z

    if-eqz v0, :cond_0

    .line 1026
    :goto_0
    return-void

    .line 1024
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Picture;->endRecording()V

    goto :goto_0
.end method

.method public drawPicture(Landroid/graphics/Picture;Landroid/graphics/Rect;)V
    .locals 3
    .parameter "picture"
    .parameter "dst"

    .prologue
    .line 1030
    iget-boolean v0, p1, Landroid/graphics/Picture;->createdFromStream:Z

    if-eqz v0, :cond_0

    .line 1041
    :goto_0
    return-void

    .line 1034
    :cond_0
    invoke-virtual {p0}, Landroid/view/GLES20Canvas;->save()I

    .line 1035
    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/view/GLES20Canvas;->translate(FF)V

    .line 1036
    invoke-virtual {p1}, Landroid/graphics/Picture;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Picture;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    .line 1037
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Picture;->getWidth()I

    move-result v1

    div-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Picture;->getHeight()I

    move-result v2

    div-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/view/GLES20Canvas;->scale(FF)V

    .line 1039
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/GLES20Canvas;->drawPicture(Landroid/graphics/Picture;)V

    .line 1040
    invoke-virtual {p0}, Landroid/view/GLES20Canvas;->restore()V

    goto :goto_0
.end method

.method public drawPicture(Landroid/graphics/Picture;Landroid/graphics/RectF;)V
    .locals 3
    .parameter "picture"
    .parameter "dst"

    .prologue
    .line 1045
    iget-boolean v0, p1, Landroid/graphics/Picture;->createdFromStream:Z

    if-eqz v0, :cond_0

    .line 1056
    :goto_0
    return-void

    .line 1049
    :cond_0
    invoke-virtual {p0}, Landroid/view/GLES20Canvas;->save()I

    .line 1050
    iget v0, p2, Landroid/graphics/RectF;->left:F

    iget v1, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, v0, v1}, Landroid/view/GLES20Canvas;->translate(FF)V

    .line 1051
    invoke-virtual {p1}, Landroid/graphics/Picture;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Picture;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    .line 1052
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Picture;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Picture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Landroid/view/GLES20Canvas;->scale(FF)V

    .line 1054
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/GLES20Canvas;->drawPicture(Landroid/graphics/Picture;)V

    .line 1055
    invoke-virtual {p0}, Landroid/view/GLES20Canvas;->restore()V

    goto :goto_0
.end method

.method public drawPoint(FFLandroid/graphics/Paint;)V
    .locals 3
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    const/4 v2, 0x0

    .line 1060
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPoint:[F

    aput p1, v0, v2

    .line 1061
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPoint:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 1062
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPoint:[F

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v2, v1, p3}, Landroid/view/GLES20Canvas;->drawPoints([FIILandroid/graphics/Paint;)V

    .line 1063
    return-void
.end method

.method public drawPoints([FIILandroid/graphics/Paint;)V
    .locals 3
    .parameter "pts"
    .parameter "offset"
    .parameter "count"
    .parameter "paint"

    .prologue
    .line 1072
    const/4 v1, 0x6

    invoke-direct {p0, p4, v1}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v0

    .line 1074
    .local v0, modifiers:I
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, p4, Landroid/graphics/Paint;->mNativePaint:I

    invoke-static {v1, p1, p2, p3, v2}, Landroid/view/GLES20Canvas;->nDrawPoints(I[FIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1076
    if-eqz v0, :cond_0

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1078
    :cond_0
    return-void

    .line 1076
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v0}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v1
.end method

.method public drawPoints([FLandroid/graphics/Paint;)V
    .locals 2
    .parameter "pts"
    .parameter "paint"

    .prologue
    .line 1067
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Landroid/view/GLES20Canvas;->drawPoints([FIILandroid/graphics/Paint;)V

    .line 1068
    return-void
.end method

.method public drawPosText(Ljava/lang/String;[FLandroid/graphics/Paint;)V
    .locals 7
    .parameter "text"
    .parameter "pos"
    .parameter "paint"

    .prologue
    .line 1104
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    array-length v1, p2

    if-le v0, v1, :cond_0

    .line 1105
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 1108
    :cond_0
    invoke-direct {p0, p3}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v6

    .line 1110
    .local v6, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    iget v5, p3, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nDrawPosText(ILjava/lang/String;II[FI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1112
    if-eqz v6, :cond_1

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1114
    :cond_1
    return-void

    .line 1112
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_2
    throw v0
.end method

.method public drawPosText([CII[FLandroid/graphics/Paint;)V
    .locals 7
    .parameter "text"
    .parameter "index"
    .parameter "count"
    .parameter "pos"
    .parameter "paint"

    .prologue
    .line 1086
    if-ltz p2, :cond_0

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_0

    mul-int/lit8 v0, p3, 0x2

    array-length v1, p4

    if-le v0, v1, :cond_1

    .line 1087
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 1090
    :cond_1
    invoke-direct {p0, p5}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v6

    .line 1092
    .local v6, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v5, p5, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nDrawPosText(I[CII[FI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1094
    if-eqz v6, :cond_2

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1096
    :cond_2
    return-void

    .line 1094
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v0
.end method

.method public drawRGB(III)V
    .locals 2
    .parameter "r"
    .parameter "g"
    .parameter "b"

    .prologue
    .line 1145
    const/high16 v0, -0x100

    and-int/lit16 v1, p1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, p3, 0xff

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/view/GLES20Canvas;->drawColor(I)V

    .line 1146
    return-void
.end method

.method public drawRect(FFFFLandroid/graphics/Paint;)V
    .locals 7
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"
    .parameter "paint"

    .prologue
    .line 1121
    cmpl-float v0, p1, p3

    if-eqz v0, :cond_0

    cmpl-float v0, p2, p4

    if-nez v0, :cond_1

    .line 1128
    :cond_0
    :goto_0
    return-void

    .line 1122
    :cond_1
    const/4 v0, 0x6

    invoke-direct {p0, p5, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v6

    .line 1124
    .local v6, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v5, p5, Landroid/graphics/Paint;->mNativePaint:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nDrawRect(IFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1126
    if-eqz v6, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v6}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_2
    throw v0
.end method

.method public drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 6
    .parameter "r"
    .parameter "paint"

    .prologue
    .line 1135
    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget v0, p1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    move-object v0, p0

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/view/GLES20Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1136
    return-void
.end method

.method public drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 6
    .parameter "r"
    .parameter "paint"

    .prologue
    .line 1140
    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    move-object v0, p0

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/view/GLES20Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1141
    return-void
.end method

.method public drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V
    .locals 9
    .parameter "rect"
    .parameter "rx"
    .parameter "ry"
    .parameter "paint"

    .prologue
    .line 1150
    const/4 v0, 0x6

    invoke-direct {p0, p4, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;I)I

    move-result v8

    .line 1152
    .local v8, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v7, p4, Landroid/graphics/Paint;->mNativePaint:I

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v7}, Landroid/view/GLES20Canvas;->nDrawRoundRect(IFFFFFFI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1155
    if-eqz v8, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1157
    :cond_0
    return-void

    .line 1155
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v0
.end method

.method public drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V
    .locals 10
    .parameter "text"
    .parameter "start"
    .parameter "end"
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    .line 1181
    move-object/from16 v0, p6

    invoke-direct {p0, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v9

    .line 1183
    .local v9, modifiers:I
    :try_start_0
    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_0

    instance-of v1, p1, Landroid/text/SpannedString;

    if-nez v1, :cond_0

    instance-of v1, p1, Landroid/text/SpannableString;

    if-eqz v1, :cond_2

    .line 1185
    :cond_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p6

    iget v7, v0, Landroid/graphics/Paint;->mBidiFlags:I

    move-object/from16 v0, p6

    iget v8, v0, Landroid/graphics/Paint;->mNativePaint:I

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v1 .. v8}, Landroid/view/GLES20Canvas;->nDrawText(ILjava/lang/String;IIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1198
    :goto_0
    if-eqz v9, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1200
    :cond_1
    return-void

    .line 1187
    :cond_2
    :try_start_1
    instance-of v1, p1, Landroid/text/GraphicsOperations;

    if-eqz v1, :cond_4

    .line 1188
    move-object v0, p1

    check-cast v0, Landroid/text/GraphicsOperations;

    move-object v1, v0

    move-object v2, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object/from16 v7, p6

    invoke-interface/range {v1 .. v7}, Landroid/text/GraphicsOperations;->drawText(Landroid/graphics/Canvas;IIFFLandroid/graphics/Paint;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1198
    :catchall_0
    move-exception v1

    if-eqz v9, :cond_3

    iget v3, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v3, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v1

    .line 1191
    :cond_4
    sub-int v1, p3, p2

    :try_start_2
    invoke-static {v1}, Landroid/graphics/TemporaryBuffer;->obtain(I)[C

    move-result-object v2

    .line 1192
    .local v2, buf:[C
    const/4 v1, 0x0

    invoke-static {p1, p2, p3, v2, v1}, Landroid/text/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    .line 1193
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    const/4 v3, 0x0

    sub-int v4, p3, p2

    move-object/from16 v0, p6

    iget v7, v0, Landroid/graphics/Paint;->mBidiFlags:I

    move-object/from16 v0, p6

    iget v8, v0, Landroid/graphics/Paint;->mNativePaint:I

    move v5, p4

    move v6, p5

    invoke-static/range {v1 .. v8}, Landroid/view/GLES20Canvas;->nDrawText(I[CIIFFII)V

    .line 1195
    invoke-static {v2}, Landroid/graphics/TemporaryBuffer;->recycle([C)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    .locals 9
    .parameter "text"
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    .line 1221
    invoke-direct {p0, p4}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v8

    .line 1223
    .local v8, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    iget v6, p4, Landroid/graphics/Paint;->mBidiFlags:I

    iget v7, p4, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v7}, Landroid/view/GLES20Canvas;->nDrawText(ILjava/lang/String;IIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1226
    if-eqz v8, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1228
    :cond_0
    return-void

    .line 1226
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_1

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_1
    throw v0
.end method

.method public drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V
    .locals 9
    .parameter "text"
    .parameter "start"
    .parameter "end"
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    .line 1204
    or-int v0, p2, p3

    sub-int v1, p3, p2

    or-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, p3

    or-int/2addr v0, v1

    if-gez v0, :cond_0

    .line 1205
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 1208
    :cond_0
    invoke-direct {p0, p6}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v8

    .line 1210
    .local v8, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v6, p6, Landroid/graphics/Paint;->mBidiFlags:I

    iget v7, p6, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v7}, Landroid/view/GLES20Canvas;->nDrawText(ILjava/lang/String;IIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1212
    if-eqz v8, :cond_1

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1214
    :cond_1
    return-void

    .line 1212
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_2
    throw v0
.end method

.method public drawText([CIIFFLandroid/graphics/Paint;)V
    .locals 9
    .parameter "text"
    .parameter "index"
    .parameter "count"
    .parameter "x"
    .parameter "y"
    .parameter "paint"

    .prologue
    .line 1164
    or-int v0, p2, p3

    add-int v1, p2, p3

    or-int/2addr v0, v1

    array-length v1, p1

    sub-int/2addr v1, p2

    sub-int/2addr v1, p3

    or-int/2addr v0, v1

    if-gez v0, :cond_0

    .line 1165
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 1168
    :cond_0
    invoke-direct {p0, p6}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v8

    .line 1170
    .local v8, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v6, p6, Landroid/graphics/Paint;->mBidiFlags:I

    iget v7, p6, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v7}, Landroid/view/GLES20Canvas;->nDrawText(I[CIIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1172
    if-eqz v8, :cond_1

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1174
    :cond_1
    return-void

    .line 1172
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_2
    throw v0
.end method

.method public drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V
    .locals 10
    .parameter "text"
    .parameter "path"
    .parameter "hOffset"
    .parameter "vOffset"
    .parameter "paint"

    .prologue
    .line 1251
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 1260
    :cond_0
    :goto_0
    return-void

    .line 1253
    :cond_1
    invoke-direct {p0, p5}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v9

    .line 1255
    .local v9, modifiers:I
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p2, Landroid/graphics/Path;->mNativePath:I

    iget v7, p5, Landroid/graphics/Paint;->mBidiFlags:I

    iget v8, p5, Landroid/graphics/Paint;->mNativePaint:I

    move-object v1, p1

    move v5, p3

    move v6, p4

    invoke-static/range {v0 .. v8}, Landroid/view/GLES20Canvas;->nDrawTextOnPath(ILjava/lang/String;IIIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1258
    if-eqz v9, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v9, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v9}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_2
    throw v0
.end method

.method public drawTextOnPath([CIILandroid/graphics/Path;FFLandroid/graphics/Paint;)V
    .locals 11
    .parameter "text"
    .parameter "index"
    .parameter "count"
    .parameter "path"
    .parameter "hOffset"
    .parameter "vOffset"
    .parameter "paint"

    .prologue
    .line 1233
    if-ltz p2, :cond_0

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_1

    .line 1234
    :cond_0
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 1237
    :cond_1
    move-object/from16 v0, p7

    invoke-direct {p0, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v10

    .line 1239
    .local v10, modifiers:I
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v5, p4, Landroid/graphics/Path;->mNativePath:I

    move-object/from16 v0, p7

    iget v8, v0, Landroid/graphics/Paint;->mBidiFlags:I

    move-object/from16 v0, p7

    iget v9, v0, Landroid/graphics/Paint;->mNativePaint:I

    move-object v2, p1

    move v3, p2

    move v4, p3

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-static/range {v1 .. v9}, Landroid/view/GLES20Canvas;->nDrawTextOnPath(I[CIIIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1242
    if-eqz v10, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v10}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1244
    :cond_2
    return-void

    .line 1242
    :catchall_0
    move-exception v1

    if-eqz v10, :cond_3

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v10}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v1
.end method

.method public drawTextRun(Ljava/lang/CharSequence;IIIIFFILandroid/graphics/Paint;)V
    .locals 13
    .parameter "text"
    .parameter "start"
    .parameter "end"
    .parameter "contextStart"
    .parameter "contextEnd"
    .parameter "x"
    .parameter "y"
    .parameter "dir"
    .parameter "paint"

    .prologue
    .line 1290
    or-int v2, p2, p3

    sub-int v4, p3, p2

    or-int/2addr v2, v4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    sub-int v4, v4, p3

    or-int/2addr v2, v4

    if-gez v2, :cond_0

    .line 1291
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2

    .line 1294
    :cond_0
    move-object/from16 v0, p9

    invoke-direct {p0, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v12

    .line 1296
    .local v12, modifiers:I
    if-nez p8, :cond_3

    const/4 v10, 0x0

    .line 1297
    .local v10, flags:I
    :goto_0
    :try_start_0
    instance-of v2, p1, Ljava/lang/String;

    if-nez v2, :cond_1

    instance-of v2, p1, Landroid/text/SpannedString;

    if-nez v2, :cond_1

    instance-of v2, p1, Landroid/text/SpannableString;

    if-eqz v2, :cond_4

    .line 1299
    :cond_1
    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p9

    iget v11, v0, Landroid/graphics/Paint;->mNativePaint:I

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-static/range {v2 .. v11}, Landroid/view/GLES20Canvas;->nDrawTextRun(ILjava/lang/String;IIIIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1314
    :goto_1
    if-eqz v12, :cond_2

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v12}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1316
    :cond_2
    return-void

    .line 1296
    .end local v10           #flags:I
    :cond_3
    const/4 v10, 0x1

    goto :goto_0

    .line 1301
    .restart local v10       #flags:I
    :cond_4
    :try_start_1
    instance-of v2, p1, Landroid/text/GraphicsOperations;

    if-eqz v2, :cond_6

    .line 1302
    move-object v0, p1

    check-cast v0, Landroid/text/GraphicsOperations;

    move-object v2, v0

    move-object v3, p0

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move-object/from16 v11, p9

    invoke-interface/range {v2 .. v11}, Landroid/text/GraphicsOperations;->drawTextRun(Landroid/graphics/Canvas;IIIIFFILandroid/graphics/Paint;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1314
    :catchall_0
    move-exception v2

    if-eqz v12, :cond_5

    iget v4, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v4, v12}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_5
    throw v2

    .line 1305
    :cond_6
    sub-int v7, p5, p4

    .line 1306
    .local v7, contextLen:I
    sub-int v5, p3, p2

    .line 1307
    .local v5, len:I
    :try_start_2
    invoke-static {v7}, Landroid/graphics/TemporaryBuffer;->obtain(I)[C

    move-result-object v3

    .line 1308
    .local v3, buf:[C
    const/4 v2, 0x0

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {p1, v0, v1, v3, v2}, Landroid/text/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    .line 1309
    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    sub-int v4, p2, p4

    const/4 v6, 0x0

    move-object/from16 v0, p9

    iget v11, v0, Landroid/graphics/Paint;->mNativePaint:I

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-static/range {v2 .. v11}, Landroid/view/GLES20Canvas;->nDrawTextRun(I[CIIIIFFII)V

    .line 1311
    invoke-static {v3}, Landroid/graphics/TemporaryBuffer;->recycle([C)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public drawTextRun([CIIIIFFILandroid/graphics/Paint;)V
    .locals 12
    .parameter "text"
    .parameter "index"
    .parameter "count"
    .parameter "contextIndex"
    .parameter "contextCount"
    .parameter "x"
    .parameter "y"
    .parameter "dir"
    .parameter "paint"

    .prologue
    .line 1268
    or-int v1, p2, p3

    array-length v2, p1

    sub-int/2addr v2, p2

    sub-int/2addr v2, p3

    or-int/2addr v1, v2

    if-gez v1, :cond_0

    .line 1269
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 1271
    :cond_0
    if-eqz p8, :cond_1

    const/4 v1, 0x1

    move/from16 v0, p8

    if-eq v0, v1, :cond_1

    .line 1272
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown direction: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p8

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1275
    :cond_1
    move-object/from16 v0, p9

    invoke-direct {p0, v0}, Landroid/view/GLES20Canvas;->setupModifiers(Landroid/graphics/Paint;)I

    move-result v11

    .line 1277
    .local v11, modifiers:I
    :try_start_0
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    move-object/from16 v0, p9

    iget v10, v0, Landroid/graphics/Paint;->mNativePaint:I

    move-object v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-static/range {v1 .. v10}, Landroid/view/GLES20Canvas;->nDrawTextRun(I[CIIIIFFII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1280
    if-eqz v11, :cond_2

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v11}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 1282
    :cond_2
    return-void

    .line 1280
    :catchall_0
    move-exception v1

    if-eqz v11, :cond_3

    iget v2, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v2, v11}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v1
.end method

.method public drawVertices(Landroid/graphics/Canvas$VertexMode;I[FI[FI[II[SIILandroid/graphics/Paint;)V
    .locals 0
    .parameter "mode"
    .parameter "vertexCount"
    .parameter "verts"
    .parameter "vertOffset"
    .parameter "texs"
    .parameter "texOffset"
    .parameter "colors"
    .parameter "colorOffset"
    .parameter "indices"
    .parameter "indexOffset"
    .parameter "indexCount"
    .parameter "paint"

    .prologue
    .line 1326
    return-void
.end method

.method public getClipBounds(Landroid/graphics/Rect;)Z
    .locals 1
    .parameter "bounds"

    .prologue
    .line 513
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nGetClipBounds(ILandroid/graphics/Rect;)Z

    move-result v0

    return v0
.end method

.method getDisplayList(I)I
    .locals 1
    .parameter "displayList"

    .prologue
    .line 368
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nGetDisplayList(II)I

    move-result v0

    return v0
.end method

.method public getDrawFilter()Landroid/graphics/DrawFilter;
    .locals 1

    .prologue
    .line 711
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mFilter:Landroid/graphics/DrawFilter;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Landroid/view/GLES20Canvas;->mHeight:I

    return v0
.end method

.method public getMatrix(Landroid/graphics/Matrix;)V
    .locals 2
    .parameter "matrix"

    .prologue
    .line 580
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Matrix;->native_instance:I

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nGetMatrix(II)V

    .line 581
    return-void
.end method

.method public getMaximumBitmapHeight()I
    .locals 1

    .prologue
    .line 206
    invoke-static {}, Landroid/view/GLES20Canvas;->nGetMaximumTextureHeight()I

    move-result v0

    return v0
.end method

.method public getMaximumBitmapWidth()I
    .locals 1

    .prologue
    .line 201
    invoke-static {}, Landroid/view/GLES20Canvas;->nGetMaximumTextureWidth()I

    move-result v0

    return v0
.end method

.method getRenderer()I
    .locals 1

    .prologue
    .line 216
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    return v0
.end method

.method public getSaveCount()I
    .locals 1

    .prologue
    .line 686
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nGetSaveCount(I)I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Landroid/view/GLES20Canvas;->mWidth:I

    return v0
.end method

.method interrupt()V
    .locals 1

    .prologue
    .line 422
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nInterrupt(I)V

    .line 423
    return-void
.end method

.method public invokeFunctors(Landroid/graphics/Rect;)I
    .locals 1
    .parameter "dirty"

    .prologue
    .line 281
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nInvokeFunctors(ILandroid/graphics/Rect;)I

    move-result v0

    return v0
.end method

.method public isOpaque()Z
    .locals 1

    .prologue
    .line 186
    iget-boolean v0, p0, Landroid/view/GLES20Canvas;->mOpaque:Z

    return v0
.end method

.method public onPostDraw()V
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nFinish(I)V

    .line 250
    return-void
.end method

.method public onPreDraw(Landroid/graphics/Rect;)I
    .locals 6
    .parameter "dirty"

    .prologue
    .line 235
    if-eqz p1, :cond_0

    .line 236
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    iget-boolean v5, p0, Landroid/view/GLES20Canvas;->mOpaque:Z

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nPrepareDirty(IIIIIZ)I

    move-result v0

    .line 239
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-boolean v1, p0, Landroid/view/GLES20Canvas;->mOpaque:Z

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nPrepare(IZ)I

    move-result v0

    goto :goto_0
.end method

.method outputDisplayList(Landroid/view/DisplayList;)V
    .locals 2
    .parameter "displayList"

    .prologue
    .line 402
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    check-cast p1, Landroid/view/GLES20DisplayList;

    .end local p1
    invoke-virtual {p1}, Landroid/view/GLES20DisplayList;->getNativeDisplayList()I

    move-result v1

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nOutputDisplayList(II)V

    .line 403
    return-void
.end method

.method pushLayerUpdate(Landroid/view/HardwareLayer;)V
    .locals 2
    .parameter "layer"

    .prologue
    .line 153
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    check-cast p1, Landroid/view/GLES20RenderLayer;

    .end local p1
    iget v1, p1, Landroid/view/GLES20Layer;->mLayer:I

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nPushLayerUpdate(II)V

    .line 154
    return-void
.end method

.method public quickReject(FFFFLandroid/graphics/Canvas$EdgeType;)Z
    .locals 6
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"
    .parameter "type"

    .prologue
    .line 520
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v5, p5, Landroid/graphics/Canvas$EdgeType;->nativeInt:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nQuickReject(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public quickReject(Landroid/graphics/Path;Landroid/graphics/Canvas$EdgeType;)Z
    .locals 6
    .parameter "path"
    .parameter "type"

    .prologue
    .line 528
    iget-object v0, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 529
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget-object v1, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Landroid/view/GLES20Canvas;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/Canvas$EdgeType;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nQuickReject(IFFFFI)Z

    move-result v0

    return v0
.end method

.method public quickReject(Landroid/graphics/RectF;Landroid/graphics/Canvas$EdgeType;)Z
    .locals 6
    .parameter "rect"
    .parameter "type"

    .prologue
    .line 535
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/Canvas$EdgeType;->nativeInt:I

    invoke-static/range {v0 .. v5}, Landroid/view/GLES20Canvas;->nQuickReject(IFFFFI)Z

    move-result v0

    return v0
.end method

.method protected resetDisplayListRenderer()V
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nResetDisplayListRenderer(I)V

    .line 122
    return-void
.end method

.method public restore()V
    .locals 1

    .prologue
    .line 672
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nRestore(I)V

    .line 673
    return-void
.end method

.method public restoreToCount(I)V
    .locals 1
    .parameter "saveCount"

    .prologue
    .line 679
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nRestoreToCount(II)V

    .line 680
    return-void
.end method

.method resume()V
    .locals 1

    .prologue
    .line 426
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0}, Landroid/view/GLES20Canvas;->nResume(I)V

    .line 427
    return-void
.end method

.method public rotate(F)V
    .locals 1
    .parameter "degrees"

    .prologue
    .line 558
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nRotate(IF)V

    .line 559
    return-void
.end method

.method public save()I
    .locals 2

    .prologue
    .line 598
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/view/GLES20Canvas;->nSave(II)I

    move-result v0

    return v0
.end method

.method public save(I)I
    .locals 1
    .parameter "saveFlags"

    .prologue
    .line 603
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1}, Landroid/view/GLES20Canvas;->nSave(II)I

    move-result v0

    return v0
.end method

.method public saveLayer(FFFFLandroid/graphics/Paint;I)I
    .locals 9
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"
    .parameter "paint"
    .parameter "saveFlags"

    .prologue
    const/4 v0, 0x0

    .line 630
    cmpg-float v1, p1, p3

    if-gez v1, :cond_4

    cmpg-float v1, p2, p4

    if-gez v1, :cond_4

    .line 632
    if-eqz p5, :cond_1

    invoke-direct {p0, p5}, Landroid/view/GLES20Canvas;->setupColorFilter(Landroid/graphics/Paint;)I

    move-result v8

    .line 634
    .local v8, modifier:I
    :goto_0
    if-nez p5, :cond_2

    move v5, v0

    .line 635
    .local v5, nativePaint:I
    :goto_1
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v6, p6

    invoke-static/range {v0 .. v6}, Landroid/view/GLES20Canvas;->nSaveLayer(IFFFFII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 637
    .local v7, count:I
    if-eqz v8, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    .line 641
    .end local v5           #nativePaint:I
    .end local v7           #count:I
    .end local v8           #modifier:I
    :cond_0
    :goto_2
    return v7

    :cond_1
    move v8, v0

    .line 632
    goto :goto_0

    .line 634
    .restart local v8       #modifier:I
    :cond_2
    :try_start_1
    iget v5, p5, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 637
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_3
    throw v0

    .line 641
    .end local v8           #modifier:I
    :cond_4
    invoke-virtual {p0, p6}, Landroid/view/GLES20Canvas;->save(I)I

    move-result v7

    goto :goto_2
.end method

.method public saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I
    .locals 10
    .parameter "bounds"
    .parameter "paint"
    .parameter "saveFlags"

    .prologue
    const/4 v0, 0x0

    .line 610
    if-eqz p1, :cond_1

    .line 611
    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    move-object v0, p0

    move-object v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Landroid/view/GLES20Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    move-result v7

    .line 622
    :cond_0
    :goto_0
    return v7

    .line 615
    :cond_1
    if-eqz p2, :cond_2

    invoke-direct {p0, p2}, Landroid/view/GLES20Canvas;->setupColorFilter(Landroid/graphics/Paint;)I

    move-result v8

    .line 617
    .local v8, modifier:I
    :goto_1
    if-nez p2, :cond_3

    move v9, v0

    .line 618
    .local v9, nativePaint:I
    :goto_2
    :try_start_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v9, p3}, Landroid/view/GLES20Canvas;->nSaveLayer(III)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 620
    .local v7, count:I
    if-eqz v8, :cond_0

    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    goto :goto_0

    .end local v7           #count:I
    .end local v8           #modifier:I
    .end local v9           #nativePaint:I
    :cond_2
    move v8, v0

    .line 615
    goto :goto_1

    .line 617
    .restart local v8       #modifier:I
    :cond_3
    :try_start_1
    iget v9, p2, Landroid/graphics/Paint;->mNativePaint:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 620
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_4

    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1, v8}, Landroid/view/GLES20Canvas;->nResetModifiers(II)V

    :cond_4
    throw v0
.end method

.method public saveLayerAlpha(FFFFII)I
    .locals 7
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"
    .parameter "alpha"
    .parameter "saveFlags"

    .prologue
    .line 661
    cmpg-float v0, p1, p3

    if-gez v0, :cond_0

    cmpg-float v0, p2, p4

    if-gez v0, :cond_0

    .line 662
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-static/range {v0 .. v6}, Landroid/view/GLES20Canvas;->nSaveLayerAlpha(IFFFFII)I

    move-result v0

    .line 664
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p6}, Landroid/view/GLES20Canvas;->save(I)I

    move-result v0

    goto :goto_0
.end method

.method public saveLayerAlpha(Landroid/graphics/RectF;II)I
    .locals 7
    .parameter "bounds"
    .parameter "alpha"
    .parameter "saveFlags"

    .prologue
    .line 649
    if-eqz p1, :cond_0

    .line 650
    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    move-object v0, p0

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Landroid/view/GLES20Canvas;->saveLayerAlpha(FFFFII)I

    move-result v0

    .line 653
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p2, p3}, Landroid/view/GLES20Canvas;->nSaveLayerAlpha(III)I

    move-result v0

    goto :goto_0
.end method

.method public scale(FF)V
    .locals 1
    .parameter "sx"
    .parameter "sy"

    .prologue
    .line 565
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1, p2}, Landroid/view/GLES20Canvas;->nScale(IFF)V

    .line 566
    return-void
.end method

.method public setDrawFilter(Landroid/graphics/DrawFilter;)V
    .locals 4
    .parameter "filter"

    .prologue
    .line 697
    iput-object p1, p0, Landroid/view/GLES20Canvas;->mFilter:Landroid/graphics/DrawFilter;

    .line 698
    if-nez p1, :cond_1

    .line 699
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v1}, Landroid/view/GLES20Canvas;->nResetPaintFilter(I)V

    .line 704
    :cond_0
    :goto_0
    return-void

    .line 700
    :cond_1
    instance-of v1, p1, Landroid/graphics/PaintFlagsDrawFilter;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 701
    check-cast v0, Landroid/graphics/PaintFlagsDrawFilter;

    .line 702
    .local v0, flagsFilter:Landroid/graphics/PaintFlagsDrawFilter;
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    iget v2, v0, Landroid/graphics/PaintFlagsDrawFilter;->clearBits:I

    iget v3, v0, Landroid/graphics/PaintFlagsDrawFilter;->setBits:I

    invoke-static {v1, v2, v3}, Landroid/view/GLES20Canvas;->nSetupPaintFilter(III)V

    goto :goto_0
.end method

.method public setMatrix(Landroid/graphics/Matrix;)V
    .locals 2
    .parameter "matrix"

    .prologue
    .line 572
    iget v1, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Landroid/view/GLES20Canvas;->nSetMatrix(II)V

    .line 573
    return-void

    .line 572
    :cond_0
    iget v0, p1, Landroid/graphics/Matrix;->native_instance:I

    goto :goto_0
.end method

.method public setViewport(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    .line 225
    iput p1, p0, Landroid/view/GLES20Canvas;->mWidth:I

    .line 226
    iput p2, p0, Landroid/view/GLES20Canvas;->mHeight:I

    .line 228
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1, p2}, Landroid/view/GLES20Canvas;->nSetViewport(III)V

    .line 229
    return-void
.end method

.method public skew(FF)V
    .locals 1
    .parameter "sx"
    .parameter "sy"

    .prologue
    .line 551
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1, p2}, Landroid/view/GLES20Canvas;->nSkew(IFF)V

    .line 552
    return-void
.end method

.method public translate(FF)V
    .locals 2
    .parameter "dx"
    .parameter "dy"

    .prologue
    const/4 v1, 0x0

    .line 544
    cmpl-float v0, p1, v1

    if-nez v0, :cond_0

    cmpl-float v0, p2, v1

    if-eqz v0, :cond_1

    :cond_0
    iget v0, p0, Landroid/view/GLES20Canvas;->mRenderer:I

    invoke-static {v0, p1, p2}, Landroid/view/GLES20Canvas;->nTranslate(IFF)V

    .line 545
    :cond_1
    return-void
.end method
