.class public Lcom/android/ex/carousel/CarouselRS;
.super Ljava/lang/Object;
.source "CarouselRS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ex/carousel/CarouselRS$CarouselCallback;
    }
.end annotation


# static fields
.field public static final CMD_ANIMATION_FINISHED:I = 0x1f4

.field public static final CMD_ANIMATION_STARTED:I = 0x190

.field public static final CMD_CARD_LONGPRESS:I = 0x6e

.field public static final CMD_CARD_SELECTED:I = 0x64

.field public static final CMD_DETAIL_SELECTED:I = 0x69

.field public static final CMD_INVALIDATE_DETAIL_TEXTURE:I = 0x262

.field public static final CMD_INVALIDATE_GEOMETRY:I = 0x136

.field public static final CMD_INVALIDATE_TEXTURE:I = 0xd2

.field public static final CMD_PING:I = 0x3e8

.field public static final CMD_REQUEST_DETAIL_TEXTURE:I = 0x258

.field public static final CMD_REQUEST_GEOMETRY:I = 0x12c

.field public static final CMD_REQUEST_TEXTURE:I = 0xc8

.field private static final DBG:Z = false

.field private static final DEFAULT_CARD_COUNT:I = 0x0

.field private static final DEFAULT_ROW_COUNT:I = 0x1

.field private static final DEFAULT_SLOT_COUNT:I = 0xa

.field private static final DEFAULT_VISIBLE_SLOTS:I = 0x1

.field public static final DRAG_MODEL_CYLINDER_INSIDE:I = 0x2

.field public static final DRAG_MODEL_CYLINDER_OUTSIDE:I = 0x3

.field public static final DRAG_MODEL_PLANE:I = 0x1

.field public static final DRAG_MODEL_SCREEN_DELTA:I = 0x0

.field public static final FILL_DIRECTION_CCW:I = 0x1

.field public static final FILL_DIRECTION_CW:I = -0x1

.field private static final MIPMAP:Landroid/renderscript/Allocation$MipmapControl; = null

.field private static final TAG:Ljava/lang/String; = "CarouselRS"

.field private static final mMultiTextureBlendingShader:Ljava/lang/String;

.field private static final mMultiTextureShader:Ljava/lang/String;

.field private static final mSingleTextureBlendingShader:Ljava/lang/String;

.field private static final mSingleTextureShader:Ljava/lang/String;


# instance fields
.field private mAllocationPool:[Landroid/renderscript/Allocation;

.field private mAtPoint:[F

.field private mCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

.field private mCards:Lcom/android/ex/carousel/ScriptField_Card;

.field private mEyePoint:[F

.field private mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

.field private mForceBlendCardsWithZ:Z

.field private mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mPrefetchCardCount:I

.field private mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

.field private mRS:Landroid/renderscript/RenderScriptGL;

.field private mRasterProgram:Landroid/renderscript/ProgramRaster;

.field private mRes:Landroid/content/res/Resources;

.field private mRowCount:I

.field private mRsMessage:Landroid/renderscript/RenderScript$RSMessageHandler;

.field private mScript:Lcom/android/ex/carousel/ScriptC_carousel;

.field private mSingleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mSingleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mUp:[F

.field private mVertexProgram:Landroid/renderscript/ProgramVertex;

.field private mVisibleSlots:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 63
    sget-object v0, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/renderscript/Allocation$MipmapControl;

    sput-object v0, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    .line 89
    new-instance v0, Ljava/lang/String;

    const-string v1, "varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);gl_FragColor = col; }"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureShader:Ljava/lang/String;

    .line 97
    new-instance v0, Ljava/lang/String;

    const-string v1, "varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);gl_FragColor = col * UNI_overallAlpha; }"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingShader:Ljava/lang/String;

    .line 105
    new-instance v0, Ljava/lang/String;

    const-string v1, "varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);vec4 col2 = texture2D(UNI_Tex1, t0);gl_FragColor = mix(col, col2, UNI_fadeAmount);}"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureShader:Ljava/lang/String;

    .line 113
    new-instance v0, Ljava/lang/String;

    const-string v1, "varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);vec4 col2 = texture2D(UNI_Tex1, t0);gl_FragColor = mix(col, col2, UNI_fadeAmount) * UNI_overallAlpha;}"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingShader:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScriptGL;Landroid/content/res/Resources;I)V
    .registers 9
    .parameter "rs"
    .parameter "res"
    .parameter "resId"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x3

    .line 263
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-array v0, v1, [F

    fill-array-data v0, :array_6e

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mEyePoint:[F

    .line 86
    new-array v0, v1, [F

    fill-array-data v0, :array_78

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mAtPoint:[F

    .line 87
    new-array v0, v1, [F

    fill-array-data v0, :array_82

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mUp:[F

    .line 200
    new-instance v0, Lcom/android/ex/carousel/CarouselRS$1;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/CarouselRS$1;-><init>(Lcom/android/ex/carousel/CarouselRS;)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mRsMessage:Landroid/renderscript/RenderScript$RSMessageHandler;

    .line 264
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    .line 265
    iput-object p2, p0, Lcom/android/ex/carousel/CarouselRS;->mRes:Landroid/content/res/Resources;

    .line 268
    new-instance v0, Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mRes:Landroid/content/res/Resources;

    invoke-direct {v0, v1, v2, p3}, Lcom/android/ex/carousel/ScriptC_carousel;-><init>(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    .line 269
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRsMessage:Landroid/renderscript/RenderScript$RSMessageHandler;

    invoke-virtual {v0, v1}, Landroid/renderscript/RenderScriptGL;->setMessageHandler(Landroid/renderscript/RenderScript$RSMessageHandler;)V

    .line 270
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initProgramStore()V

    .line 271
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initFragmentProgram()V

    .line 272
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initRasterProgram()V

    .line 273
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initVertexProgram()V

    .line 274
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselRS;->setSlotCount(I)V

    .line 275
    invoke-virtual {p0, v4}, Lcom/android/ex/carousel/CarouselRS;->setVisibleSlots(I)V

    .line 276
    invoke-virtual {p0, v4}, Lcom/android/ex/carousel/CarouselRS;->setRowCount(I)V

    .line 277
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselRS;->createCards(I)V

    .line 278
    invoke-virtual {p0, v3}, Lcom/android/ex/carousel/CarouselRS;->setStartAngle(F)V

    .line 279
    invoke-virtual {p0, v3}, Lcom/android/ex/carousel/CarouselRS;->setCarouselRotationAngle(F)V

    .line 280
    const/high16 v0, 0x3f80

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselRS;->setRadius(F)V

    .line 281
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mEyePoint:[F

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mAtPoint:[F

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mUp:[F

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/ex/carousel/CarouselRS;->setLookAt([F[F[F)V

    .line 282
    const/high16 v0, 0x41a0

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/CarouselRS;->setRadius(F)V

    .line 284
    return-void

    .line 85
    nop

    :array_6e
    .array-data 0x4
        0x0t 0x0t 0x0t 0x40t
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 86
    :array_78
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 87
    :array_82
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/ex/carousel/CarouselRS;)Lcom/android/ex/carousel/CarouselRS$CarouselCallback;
    .registers 2
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

    return-object v0
.end method

.method private allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;
    .registers 6
    .parameter "bitmap"
    .parameter "mipmap"

    .prologue
    .line 651
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 654
    :goto_3
    return-object v0

    .line 652
    :cond_4
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    const/4 v2, 0x2

    invoke-static {v1, p1, p2, v2}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 654
    .local v0, allocation:Landroid/renderscript/Allocation;
    goto :goto_3
.end method

.method private allocationFromPool(ILandroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;
    .registers 11
    .parameter "n"
    .parameter "bitmap"
    .parameter "mipmap"

    .prologue
    .line 659
    iget v5, p0, Lcom/android/ex/carousel/CarouselRS;->mVisibleSlots:I

    iget v6, p0, Lcom/android/ex/carousel/CarouselRS;->mPrefetchCardCount:I

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    iget v6, p0, Lcom/android/ex/carousel/CarouselRS;->mRowCount:I

    mul-int v1, v5, v6

    .line 660
    .local v1, count:I
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    if-eqz v5, :cond_14

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    array-length v5, v5

    if-eq v5, v1, :cond_31

    .line 661
    :cond_14
    new-array v4, v1, [Landroid/renderscript/Allocation;

    .line 662
    .local v4, tmp:[Landroid/renderscript/Allocation;
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    if-nez v5, :cond_2b

    const/4 v3, 0x0

    .line 663
    .local v3, oldsize:I
    :goto_1b
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1c
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    if-ge v2, v5, :cond_2f

    .line 664
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    aget-object v5, v5, v2

    aput-object v5, v4, v2

    .line 663
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 662
    .end local v2           #i:I
    .end local v3           #oldsize:I
    :cond_2b
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    array-length v3, v5

    goto :goto_1b

    .line 666
    .restart local v2       #i:I
    .restart local v3       #oldsize:I
    :cond_2f
    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    .line 668
    .end local v2           #i:I
    .end local v3           #oldsize:I
    .end local v4           #tmp:[Landroid/renderscript/Allocation;
    :cond_31
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    rem-int v6, p1, v1

    aget-object v0, v5, v6

    .line 669
    .local v0, allocation:Landroid/renderscript/Allocation;
    if-nez v0, :cond_44

    .line 670
    invoke-direct {p0, p2, p3}, Lcom/android/ex/carousel/CarouselRS;->allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 671
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    rem-int v6, p1, v1

    aput-object v0, v5, v6

    .line 682
    :cond_43
    :goto_43
    return-object v0

    .line 672
    :cond_44
    if-eqz p2, :cond_43

    .line 673
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v6

    invoke-virtual {v6}, Landroid/renderscript/Type;->getX()I

    move-result v6

    if-ne v5, v6, :cond_66

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v6

    invoke-virtual {v6}, Landroid/renderscript/Type;->getY()I

    move-result v6

    if-ne v5, v6, :cond_66

    .line 675
    invoke-virtual {v0, p2}, Landroid/renderscript/Allocation;->copyFrom(Landroid/graphics/Bitmap;)V

    goto :goto_43

    .line 677
    :cond_66
    const-string v5, "CarouselRS"

    const-string v6, "Warning, bitmap has different size. Taking slow path"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    invoke-direct {p0, p2, p3}, Lcom/android/ex/carousel/CarouselRS;->allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 679
    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mAllocationPool:[Landroid/renderscript/Allocation;

    rem-int v6, p1, v1

    aput-object v0, v5, v6

    goto :goto_43
.end method

.method private elementForBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/renderscript/Element;
    .registers 6
    .parameter "bitmap"
    .parameter "defaultConfig"

    .prologue
    .line 918
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    .line 919
    .local v0, config:Landroid/graphics/Bitmap$Config;
    if-nez v0, :cond_7

    .line 920
    move-object v0, p2

    .line 922
    :cond_7
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_12

    .line 923
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v1}, Landroid/renderscript/Element;->A_8(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    .line 929
    :goto_11
    return-object v1

    .line 924
    :cond_12
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_1d

    .line 925
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v1}, Landroid/renderscript/Element;->RGB_565(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    goto :goto_11

    .line 926
    :cond_1d
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_28

    .line 927
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v1}, Landroid/renderscript/Element;->RGBA_4444(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    goto :goto_11

    .line 928
    :cond_28
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_33

    .line 929
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v1}, Landroid/renderscript/Element;->RGBA_8888(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    goto :goto_11

    .line 931
    :cond_33
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknown configuration"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;
    .registers 5
    .parameter "n"

    .prologue
    .line 688
    :try_start_0
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    invoke-virtual {v2, p1}, Lcom/android/ex/carousel/ScriptField_Card;->get(I)Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 694
    .local v1, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :goto_6
    return-object v1

    .line 690
    .end local v1           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catch_7
    move-exception v0

    .line 692
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    const/4 v1, 0x0

    .restart local v1       #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    goto :goto_6
.end method

.method private getOrCreateCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;
    .registers 3
    .parameter "n"

    .prologue
    .line 698
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 699
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-nez v0, :cond_b

    .line 701
    new-instance v0, Lcom/android/ex/carousel/ScriptField_Card$Item;

    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    invoke-direct {v0}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    .line 703
    .restart local v0       #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :cond_b
    return-object v0
.end method

.method private initFragmentProgram()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 375
    new-instance v2, Landroid/renderscript/ProgramFragment$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v2, v4}, Landroid/renderscript/ProgramFragment$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 377
    .local v2, pfbSingle:Landroid/renderscript/ProgramFragment$Builder;
    sget-object v4, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureShader:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/renderscript/ProgramFragment$Builder;->setShader(Ljava/lang/String;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 379
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v2, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 380
    invoke-virtual {v2}, Landroid/renderscript/ProgramFragment$Builder;->create()Landroid/renderscript/ProgramFragment;

    move-result-object v4

    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    .line 382
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 387
    new-instance v4, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v4, v5, v7}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;-><init>(Landroid/renderscript/RenderScript;I)V

    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    .line 388
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->bind_shaderConstants(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;)V

    .line 389
    new-instance v3, Landroid/renderscript/ProgramFragment$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v3, v4}, Landroid/renderscript/ProgramFragment$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 391
    .local v3, pfbSingleBlend:Landroid/renderscript/ProgramFragment$Builder;
    sget-object v4, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingShader:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/renderscript/ProgramFragment$Builder;->setShader(Ljava/lang/String;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 393
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v3, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 395
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v4}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v4}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/renderscript/ProgramFragment$Builder;->addConstant(Landroid/renderscript/Type;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 396
    invoke-virtual {v3}, Landroid/renderscript/ProgramFragment$Builder;->create()Landroid/renderscript/ProgramFragment;

    move-result-object v4

    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    .line 398
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v5}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindConstants(Landroid/renderscript/Allocation;I)V

    .line 399
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 404
    new-instance v0, Landroid/renderscript/ProgramFragment$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v0, v4}, Landroid/renderscript/ProgramFragment$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 406
    .local v0, pfbMulti:Landroid/renderscript/ProgramFragment$Builder;
    sget-object v4, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureShader:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/renderscript/ProgramFragment$Builder;->setShader(Ljava/lang/String;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 408
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v0, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 409
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v0, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 411
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v4}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v4}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/renderscript/ProgramFragment$Builder;->addConstant(Landroid/renderscript/Type;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 412
    invoke-virtual {v0}, Landroid/renderscript/ProgramFragment$Builder;->create()Landroid/renderscript/ProgramFragment;

    move-result-object v4

    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    .line 414
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v5}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindConstants(Landroid/renderscript/Allocation;I)V

    .line 415
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 416
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 421
    new-instance v1, Landroid/renderscript/ProgramFragment$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v1, v4}, Landroid/renderscript/ProgramFragment$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 423
    .local v1, pfbMultiBlend:Landroid/renderscript/ProgramFragment$Builder;
    sget-object v4, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingShader:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/renderscript/ProgramFragment$Builder;->setShader(Ljava/lang/String;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 425
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v1, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 426
    sget-object v4, Landroid/renderscript/Program$TextureType;->TEXTURE_2D:Landroid/renderscript/Program$TextureType;

    invoke-virtual {v1, v4}, Landroid/renderscript/ProgramFragment$Builder;->addTexture(Landroid/renderscript/Program$TextureType;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 428
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v4}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v4}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/renderscript/ProgramFragment$Builder;->addConstant(Landroid/renderscript/Type;)Landroid/renderscript/Program$BaseProgramBuilder;

    .line 429
    invoke-virtual {v1}, Landroid/renderscript/ProgramFragment$Builder;->create()Landroid/renderscript/ProgramFragment;

    move-result-object v4

    iput-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    .line 431
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mFSConst:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-virtual {v5}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindConstants(Landroid/renderscript/Allocation;I)V

    .line 432
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 433
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Landroid/renderscript/ProgramFragment;->bindSampler(Landroid/renderscript/Sampler;I)V

    .line 435
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-static {v5}, Landroid/renderscript/Sampler;->CLAMP_LINEAR(Landroid/renderscript/RenderScript;)Landroid/renderscript/Sampler;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->set_linearClamp(Landroid/renderscript/Sampler;)V

    .line 436
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->set_singleTextureFragmentProgram(Landroid/renderscript/ProgramFragment;)V

    .line 437
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mSingleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->set_singleTextureBlendingFragmentProgram(Landroid/renderscript/ProgramFragment;)V

    .line 438
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->set_multiTextureFragmentProgram(Landroid/renderscript/ProgramFragment;)V

    .line 439
    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v5, p0, Lcom/android/ex/carousel/CarouselRS;->mMultiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    invoke-virtual {v4, v5}, Lcom/android/ex/carousel/ScriptC_carousel;->set_multiTextureBlendingFragmentProgram(Landroid/renderscript/ProgramFragment;)V

    .line 440
    return-void
.end method

.method private initProgramStore()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 443
    invoke-direct {p0, v6}, Lcom/android/ex/carousel/CarouselRS;->resizeProgramStoresCard(I)V

    .line 445
    const/4 v1, 0x1

    .line 446
    .local v1, dither:Z
    iget-boolean v2, p0, Lcom/android/ex/carousel/CarouselRS;->mForceBlendCardsWithZ:Z

    if-eqz v2, :cond_7d

    sget-object v0, Landroid/renderscript/ProgramStore$DepthFunc;->LESS:Landroid/renderscript/ProgramStore$DepthFunc;

    .line 450
    .local v0, depthFunc:Landroid/renderscript/ProgramStore$DepthFunc;
    :goto_c
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    new-instance v3, Landroid/renderscript/ProgramStore$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v3, v4}, Landroid/renderscript/ProgramStore$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    sget-object v4, Landroid/renderscript/ProgramStore$BlendSrcFunc;->ONE:Landroid/renderscript/ProgramStore$BlendSrcFunc;

    sget-object v5, Landroid/renderscript/ProgramStore$BlendDstFunc;->ZERO:Landroid/renderscript/ProgramStore$BlendDstFunc;

    invoke-virtual {v3, v4, v5}, Landroid/renderscript/ProgramStore$Builder;->setBlendFunc(Landroid/renderscript/ProgramStore$BlendSrcFunc;Landroid/renderscript/ProgramStore$BlendDstFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/renderscript/ProgramStore$Builder;->setDitherEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/renderscript/ProgramStore$Builder;->setDepthFunc(Landroid/renderscript/ProgramStore$DepthFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/ex/carousel/CarouselRS;->mForceBlendCardsWithZ:Z

    invoke-virtual {v3, v4}, Landroid/renderscript/ProgramStore$Builder;->setDepthMaskEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/renderscript/ProgramStore$Builder;->create()Landroid/renderscript/ProgramStore;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/ex/carousel/ScriptC_carousel;->set_programStoreBackground(Landroid/renderscript/ProgramStore;)V

    .line 458
    new-instance v2, Landroid/renderscript/ProgramStore$Builder;

    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v2, v3}, Landroid/renderscript/ProgramStore$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    sget-object v3, Landroid/renderscript/ProgramStore$BlendSrcFunc;->ONE:Landroid/renderscript/ProgramStore$BlendSrcFunc;

    sget-object v4, Landroid/renderscript/ProgramStore$BlendDstFunc;->ONE_MINUS_SRC_ALPHA:Landroid/renderscript/ProgramStore$BlendDstFunc;

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ProgramStore$Builder;->setBlendFunc(Landroid/renderscript/ProgramStore$BlendSrcFunc;Landroid/renderscript/ProgramStore$BlendDstFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/renderscript/ProgramStore$Builder;->setDitherEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/renderscript/ProgramStore$Builder;->setDepthFunc(Landroid/renderscript/ProgramStore$DepthFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/ex/carousel/CarouselRS;->mForceBlendCardsWithZ:Z

    invoke-virtual {v2, v3}, Landroid/renderscript/ProgramStore$Builder;->setDepthMaskEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/ProgramStore$Builder;->create()Landroid/renderscript/ProgramStore;

    move-result-object v2

    invoke-direct {p0, v7, v2}, Lcom/android/ex/carousel/CarouselRS;->setProgramStoreCard(ILandroid/renderscript/ProgramStore;)V

    .line 467
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    new-instance v3, Landroid/renderscript/ProgramStore$Builder;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v3, v4}, Landroid/renderscript/ProgramStore$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    sget-object v4, Landroid/renderscript/ProgramStore$BlendSrcFunc;->ONE:Landroid/renderscript/ProgramStore$BlendSrcFunc;

    sget-object v5, Landroid/renderscript/ProgramStore$BlendDstFunc;->ONE_MINUS_SRC_ALPHA:Landroid/renderscript/ProgramStore$BlendDstFunc;

    invoke-virtual {v3, v4, v5}, Landroid/renderscript/ProgramStore$Builder;->setBlendFunc(Landroid/renderscript/ProgramStore$BlendSrcFunc;Landroid/renderscript/ProgramStore$BlendDstFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/renderscript/ProgramStore$Builder;->setDitherEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    sget-object v4, Landroid/renderscript/ProgramStore$DepthFunc;->ALWAYS:Landroid/renderscript/ProgramStore$DepthFunc;

    invoke-virtual {v3, v4}, Landroid/renderscript/ProgramStore$Builder;->setDepthFunc(Landroid/renderscript/ProgramStore$DepthFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/renderscript/ProgramStore$Builder;->setDepthMaskEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/renderscript/ProgramStore$Builder;->create()Landroid/renderscript/ProgramStore;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/ex/carousel/ScriptC_carousel;->set_programStoreDetail(Landroid/renderscript/ProgramStore;)V

    .line 474
    return-void

    .line 446
    .end local v0           #depthFunc:Landroid/renderscript/ProgramStore$DepthFunc;
    :cond_7d
    sget-object v0, Landroid/renderscript/ProgramStore$DepthFunc;->ALWAYS:Landroid/renderscript/ProgramStore$DepthFunc;

    goto :goto_c
.end method

.method private initRasterProgram()V
    .registers 4

    .prologue
    .line 365
    new-instance v0, Landroid/renderscript/ProgramRaster$Builder;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v0, v1}, Landroid/renderscript/ProgramRaster$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 366
    .local v0, programRasterBuilder:Landroid/renderscript/ProgramRaster$Builder;
    invoke-virtual {v0}, Landroid/renderscript/ProgramRaster$Builder;->create()Landroid/renderscript/ProgramRaster;

    move-result-object v1

    iput-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRasterProgram:Landroid/renderscript/ProgramRaster;

    .line 368
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mRasterProgram:Landroid/renderscript/ProgramRaster;

    invoke-virtual {v1, v2}, Lcom/android/ex/carousel/ScriptC_carousel;->set_rasterProgram(Landroid/renderscript/ProgramRaster;)V

    .line 369
    return-void
.end method

.method private initVertexProgram()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 354
    new-instance v2, Landroid/renderscript/ProgramVertexFixedFunction$Builder;

    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v2, v3}, Landroid/renderscript/ProgramVertexFixedFunction$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 355
    .local v2, pvb:Landroid/renderscript/ProgramVertexFixedFunction$Builder;
    invoke-virtual {v2}, Landroid/renderscript/ProgramVertexFixedFunction$Builder;->create()Landroid/renderscript/ProgramVertexFixedFunction;

    move-result-object v3

    iput-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mVertexProgram:Landroid/renderscript/ProgramVertex;

    .line 356
    new-instance v1, Landroid/renderscript/ProgramVertexFixedFunction$Constants;

    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v1, v3}, Landroid/renderscript/ProgramVertexFixedFunction$Constants;-><init>(Landroid/renderscript/RenderScript;)V

    .line 357
    .local v1, pva:Landroid/renderscript/ProgramVertexFixedFunction$Constants;
    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mVertexProgram:Landroid/renderscript/ProgramVertex;

    check-cast v3, Landroid/renderscript/ProgramVertexFixedFunction;

    invoke-virtual {v3, v1}, Landroid/renderscript/ProgramVertexFixedFunction;->bindConstants(Landroid/renderscript/ProgramVertexFixedFunction$Constants;)V

    .line 358
    new-instance v0, Landroid/renderscript/Matrix4f;

    invoke-direct {v0}, Landroid/renderscript/Matrix4f;-><init>()V

    .line 359
    .local v0, proj:Landroid/renderscript/Matrix4f;
    invoke-virtual {v0, v4, v4}, Landroid/renderscript/Matrix4f;->loadProjectionNormalized(II)V

    .line 360
    invoke-virtual {v1, v0}, Landroid/renderscript/ProgramVertexFixedFunction$Constants;->setProjection(Landroid/renderscript/Matrix4f;)V

    .line 361
    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mVertexProgram:Landroid/renderscript/ProgramVertex;

    invoke-virtual {v3, v4}, Lcom/android/ex/carousel/ScriptC_carousel;->set_vertexProgram(Landroid/renderscript/ProgramVertex;)V

    .line 362
    return-void
.end method

.method private matrixFromFloat([F)Landroid/renderscript/Matrix4f;
    .registers 8
    .parameter "matrix"

    .prologue
    .line 329
    if-eqz p1, :cond_5

    array-length v4, p1

    if-nez v4, :cond_1c

    .line 330
    :cond_5
    const/4 v0, 0x0

    .line 339
    .local v0, dimensions:I
    :goto_6
    new-instance v3, Landroid/renderscript/Matrix4f;

    invoke-direct {v3}, Landroid/renderscript/Matrix4f;-><init>()V

    .line 340
    .local v3, rsMatrix:Landroid/renderscript/Matrix4f;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_c
    if-ge v1, v0, :cond_35

    .line 341
    const/4 v2, 0x0

    .local v2, j:I
    :goto_f
    if-ge v2, v0, :cond_32

    .line 342
    mul-int v4, v1, v0

    add-int/2addr v4, v2

    aget v4, p1, v4

    invoke-virtual {v3, v1, v2, v4}, Landroid/renderscript/Matrix4f;->set(IIF)V

    .line 341
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 331
    .end local v0           #dimensions:I
    .end local v1           #i:I
    .end local v2           #j:I
    .end local v3           #rsMatrix:Landroid/renderscript/Matrix4f;
    :cond_1c
    array-length v4, p1

    const/16 v5, 0x10

    if-ne v4, v5, :cond_23

    .line 332
    const/4 v0, 0x4

    .restart local v0       #dimensions:I
    goto :goto_6

    .line 333
    .end local v0           #dimensions:I
    :cond_23
    array-length v4, p1

    const/16 v5, 0x9

    if-ne v4, v5, :cond_2a

    .line 334
    const/4 v0, 0x3

    .restart local v0       #dimensions:I
    goto :goto_6

    .line 336
    .end local v0           #dimensions:I
    :cond_2a
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "matrix length not 0,9 or 16"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 340
    .restart local v0       #dimensions:I
    .restart local v1       #i:I
    .restart local v2       #j:I
    .restart local v3       #rsMatrix:Landroid/renderscript/Matrix4f;
    :cond_32
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 346
    .end local v2           #j:I
    :cond_35
    return-object v3
.end method

.method private resizeProgramStoresCard(I)V
    .registers 5
    .parameter "count"

    .prologue
    .line 533
    const/4 v0, 0x0

    .line 535
    .local v0, enableResize:Z
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    if-eqz v1, :cond_5

    .line 539
    :cond_5
    new-instance v1, Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    if-lez p1, :cond_18

    .end local p1
    :goto_b
    invoke-direct {v1, v2, p1}, Lcom/android/ex/carousel/ScriptField_ProgramStore_s;-><init>(Landroid/renderscript/RenderScript;I)V

    iput-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    .line 540
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    invoke-virtual {v1, v2}, Lcom/android/ex/carousel/ScriptC_carousel;->bind_programStoresCard(Lcom/android/ex/carousel/ScriptField_ProgramStore_s;)V

    .line 542
    return-void

    .line 539
    .restart local p1
    :cond_18
    const/4 p1, 0x1

    goto :goto_b
.end method

.method private setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V
    .registers 7
    .parameter "n"
    .parameter "item"

    .prologue
    .line 708
    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, p1, v2}, Lcom/android/ex/carousel/ScriptField_Card;->set(Lcom/android/ex/carousel/ScriptField_Card$Item;IZ)V
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_6} :catch_7

    .line 716
    :goto_6
    return-void

    .line 710
    :catch_7
    move-exception v0

    .line 714
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string v1, "CarouselRS"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCard("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "): Texture "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " doesn\'t exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6
.end method

.method private setProgramStoreCard(ILandroid/renderscript/ProgramStore;)V
    .registers 6
    .parameter "n"
    .parameter "programStore"

    .prologue
    .line 545
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    invoke-virtual {v1, p1}, Lcom/android/ex/carousel/ScriptField_ProgramStore_s;->get(I)Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;

    move-result-object v0

    .line 546
    .local v0, item:Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;
    if-nez v0, :cond_d

    .line 547
    new-instance v0, Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;

    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;
    invoke-direct {v0}, Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;-><init>()V

    .line 549
    .restart local v0       #item:Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;
    :cond_d
    iput-object p2, v0, Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;->programStore:Landroid/renderscript/ProgramStore;

    .line 550
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mProgramStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p1, v2}, Lcom/android/ex/carousel/ScriptField_ProgramStore_s;->set(Lcom/android/ex/carousel/ScriptField_ProgramStore_s$Item;IZ)V

    .line 551
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, p1, p2}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setProgramStoresCard(ILandroid/renderscript/ProgramStore;)V

    .line 552
    return-void
.end method


# virtual methods
.method public createCards(I)V
    .registers 6
    .parameter "count"

    .prologue
    .line 481
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    if-eqz v1, :cond_1f

    if-lez p1, :cond_1f

    .line 483
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    invoke-virtual {v1}, Lcom/android/ex/carousel/ScriptField_Card;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v0

    .line 484
    .local v0, oldSize:I
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    invoke-virtual {v1, p1}, Lcom/android/ex/carousel/ScriptField_Card;->resize(I)V

    .line 485
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_createCards(II)V

    .line 492
    .end local v0           #oldSize:I
    :goto_1e
    return-void

    .line 488
    :cond_1f
    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card;

    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    if-lez p1, :cond_39

    move v1, p1

    :goto_26
    invoke-direct {v2, v3, v1}, Lcom/android/ex/carousel/ScriptField_Card;-><init>(Landroid/renderscript/RenderScript;I)V

    iput-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    .line 489
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mCards:Lcom/android/ex/carousel/ScriptField_Card;

    invoke-virtual {v1, v2}, Lcom/android/ex/carousel/ScriptC_carousel;->bind_cards(Lcom/android/ex/carousel/ScriptField_Card;)V

    .line 490
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_createCards(II)V

    goto :goto_1e

    .line 488
    :cond_39
    const/4 v1, 0x1

    goto :goto_26
.end method

.method public doLongPress()V
    .registers 2

    .prologue
    .line 886
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_doLongPress()V

    .line 887
    return-void
.end method

.method public doMotion(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 890
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_doMotion(FFJ)V

    .line 891
    return-void
.end method

.method public doStart(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 894
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_doStart(FFJ)V

    .line 895
    return-void
.end method

.method public doStop(FFJ)V
    .registers 6
    .parameter "x"
    .parameter "y"
    .parameter "t"

    .prologue
    .line 898
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_doStop(FFJ)V

    .line 899
    return-void
.end method

.method invalidateDetailTexture(IZ)V
    .registers 6
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 787
    if-gez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Index cannot be negative"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 789
    :cond_a
    monitor-enter p0

    .line 790
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 791
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-nez v0, :cond_13

    .line 793
    monitor-exit p0

    .line 805
    :goto_12
    return-void

    .line 795
    :cond_13
    if-eqz p2, :cond_21

    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    if-eqz v1, :cond_21

    .line 799
    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    invoke-virtual {v1}, Landroid/renderscript/Allocation;->destroy()V

    .line 800
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    .line 802
    :cond_21
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 803
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, p1, p2}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_invalidateDetailTexture(IZ)V

    .line 804
    monitor-exit p0

    goto :goto_12

    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catchall_2b
    move-exception v1

    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_b .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method invalidateTexture(IZ)V
    .registers 6
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 765
    if-gez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Index cannot be negative"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 767
    :cond_a
    monitor-enter p0

    .line 768
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 769
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-nez v0, :cond_13

    .line 771
    monitor-exit p0

    .line 783
    :goto_12
    return-void

    .line 773
    :cond_13
    if-eqz p2, :cond_21

    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    if-eqz v1, :cond_21

    .line 777
    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    invoke-virtual {v1}, Landroid/renderscript/Allocation;->destroy()V

    .line 778
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    .line 780
    :cond_21
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 781
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, p1, p2}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_invalidateTexture(IZ)V

    .line 782
    monitor-exit p0

    goto :goto_12

    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catchall_2b
    move-exception v1

    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_b .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method public loadGeometry(I)Landroid/renderscript/Mesh;
    .registers 7
    .parameter "resId"

    .prologue
    const/4 v2, 0x0

    .line 936
    if-nez p1, :cond_4

    .line 947
    :cond_3
    :goto_3
    return-object v2

    .line 939
    :cond_4
    iget-object v3, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    iget-object v4, p0, Lcom/android/ex/carousel/CarouselRS;->mRes:Landroid/content/res/Resources;

    invoke-static {v3, v4, p1}, Landroid/renderscript/FileA3D;->createFromResource(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)Landroid/renderscript/FileA3D;

    move-result-object v1

    .line 940
    .local v1, model:Landroid/renderscript/FileA3D;
    if-eqz v1, :cond_3

    .line 943
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/renderscript/FileA3D;->getIndexEntry(I)Landroid/renderscript/FileA3D$IndexEntry;

    move-result-object v0

    .line 944
    .local v0, entry:Landroid/renderscript/FileA3D$IndexEntry;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/renderscript/FileA3D$IndexEntry;->getEntryType()Landroid/renderscript/FileA3D$EntryType;

    move-result-object v3

    sget-object v4, Landroid/renderscript/FileA3D$EntryType;->MESH:Landroid/renderscript/FileA3D$EntryType;

    if-ne v3, v4, :cond_3

    .line 947
    invoke-virtual {v0}, Landroid/renderscript/FileA3D$IndexEntry;->getObject()Landroid/renderscript/BaseObj;

    move-result-object v2

    check-cast v2, Landroid/renderscript/Mesh;

    goto :goto_3
.end method

.method public pauseRendering()V
    .registers 3

    .prologue
    .line 878
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/renderscript/RenderScriptGL;->bindRootScript(Landroid/renderscript/Script;)V

    .line 879
    return-void
.end method

.method public resumeRendering()V
    .registers 3

    .prologue
    .line 882
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, v1}, Landroid/renderscript/RenderScriptGL;->bindRootScript(Landroid/renderscript/Script;)V

    .line 883
    return-void
.end method

.method public setBackgroundColor(Landroid/renderscript/Float4;)V
    .registers 3
    .parameter "color"

    .prologue
    .line 846
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_backgroundColor(Landroid/renderscript/Float4;)V

    .line 847
    return-void
.end method

.method public setBackgroundTexture(Landroid/graphics/Bitmap;)V
    .registers 6
    .parameter "bitmap"

    .prologue
    .line 850
    const/4 v0, 0x0

    .line 851
    .local v0, texture:Landroid/renderscript/Allocation;
    if-eqz p1, :cond_c

    .line 852
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    sget-object v2, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 855
    :cond_c
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->set_backgroundTexture(Landroid/renderscript/Allocation;)V

    .line 856
    return-void
.end method

.method public setCallback(Lcom/android/ex/carousel/CarouselRS$CarouselCallback;)V
    .registers 2
    .parameter "callback"

    .prologue
    .line 646
    iput-object p1, p0, Lcom/android/ex/carousel/CarouselRS;->mCallback:Lcom/android/ex/carousel/CarouselRS$CarouselCallback;

    .line 647
    return-void
.end method

.method public setCardCreationFadeDuration(J)V
    .registers 5
    .parameter "t"

    .prologue
    .line 914
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_cardCreationFadeDuration(I)V

    .line 915
    return-void
.end method

.method public setCardRotation(F)V
    .registers 3
    .parameter "cardRotation"

    .prologue
    .line 300
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_cardRotation(F)V

    .line 301
    return-void
.end method

.method public setCardsFaceTangent(Z)V
    .registers 3
    .parameter "faceTangent"

    .prologue
    .line 304
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_cardsFaceTangent(Z)V

    .line 305
    return-void
.end method

.method public setCarouselRotationAngle(F)V
    .registers 3
    .parameter "theta"

    .prologue
    .line 635
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setCarouselRotationAngle(F)V

    .line 636
    return-void
.end method

.method public setCarouselRotationAngle(FIIF)V
    .registers 6
    .parameter "endAngle"
    .parameter "milliseconds"
    .parameter "interpolationMode"
    .parameter "maxAnimatedArc"

    .prologue
    .line 640
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setCarouselRotationAngle2(FIIF)V

    .line 642
    return-void
.end method

.method public setDefaultBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .parameter "bitmap"

    .prologue
    .line 611
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    sget-object v1, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    invoke-direct {p0, p1, v1}, Lcom/android/ex/carousel/CarouselRS;->allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_defaultTexture(Landroid/renderscript/Allocation;)V

    .line 612
    return-void
.end method

.method public setDefaultCardMatrix([F)V
    .registers 4
    .parameter "matrix"

    .prologue
    .line 350
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->matrixFromFloat([F)Landroid/renderscript/Matrix4f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_defaultCardMatrix(Landroid/renderscript/Matrix4f;)V

    .line 351
    return-void
.end method

.method public setDefaultGeometry(Landroid/renderscript/Mesh;)V
    .registers 3
    .parameter "mesh"

    .prologue
    .line 621
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_defaultGeometry(Landroid/renderscript/Mesh;)V

    .line 622
    return-void
.end method

.method public setDetailLineTexture(Landroid/graphics/Bitmap;)V
    .registers 6
    .parameter "bitmap"

    .prologue
    .line 859
    const/4 v0, 0x0

    .line 860
    .local v0, texture:Landroid/renderscript/Allocation;
    if-eqz p1, :cond_c

    .line 861
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    sget-object v2, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 864
    :cond_c
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->set_detailLineTexture(Landroid/renderscript/Allocation;)V

    .line 865
    return-void
.end method

.method public setDetailLoadingTexture(Landroid/graphics/Bitmap;)V
    .registers 6
    .parameter "bitmap"

    .prologue
    .line 868
    const/4 v0, 0x0

    .line 869
    .local v0, texture:Landroid/renderscript/Allocation;
    if-eqz p1, :cond_c

    .line 870
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    sget-object v2, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 873
    :cond_c
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->set_detailLoadingTexture(Landroid/renderscript/Allocation;)V

    .line 874
    return-void
.end method

.method setDetailTexture(IFFFFLandroid/graphics/Bitmap;)V
    .registers 18
    .parameter "n"
    .parameter "offx"
    .parameter "offy"
    .parameter "loffx"
    .parameter "loffy"
    .parameter "bitmap"

    .prologue
    .line 739
    if-gez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Index cannot be negative"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 741
    :cond_a
    monitor-enter p0

    .line 742
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getOrCreateCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v9

    .line 743
    .local v9, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    const/4 v10, 0x0

    .line 744
    .local v10, width:F
    const/4 v8, 0x0

    .line 745
    .local v8, height:F
    if-eqz p6, :cond_39

    .line 746
    sget-object v1, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    move-object/from16 v0, p6

    invoke-direct {p0, v0, v1}, Lcom/android/ex/carousel/CarouselRS;->allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v1

    iput-object v1, v9, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    .line 747
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v10, v1

    .line 748
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v8, v1

    .line 758
    :cond_27
    :goto_27
    invoke-direct {p0, p1, v9}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 759
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v7, v9, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    invoke-virtual/range {v1 .. v7}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setDetailTexture(IFFFFLandroid/renderscript/Allocation;)V

    .line 760
    monitor-exit p0

    .line 761
    return-void

    .line 750
    :cond_39
    iget-object v1, v9, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    if-eqz v1, :cond_27

    .line 754
    iget-object v1, v9, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    invoke-virtual {v1}, Landroid/renderscript/Allocation;->destroy()V

    .line 755
    const/4 v1, 0x0

    iput-object v1, v9, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    goto :goto_27

    .line 760
    .end local v8           #height:F
    .end local v9           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    .end local v10           #width:F
    :catchall_46
    move-exception v1

    monitor-exit p0
    :try_end_48
    .catchall {:try_start_b .. :try_end_48} :catchall_46

    throw v1
.end method

.method public setDetailTextureAlignment(I)V
    .registers 3
    .parameter "alignment"

    .prologue
    .line 527
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_detailTextureAlignment(I)V

    .line 528
    return-void
.end method

.method public setDragFactor(F)V
    .registers 3
    .parameter "dragFactor"

    .prologue
    .line 316
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_dragFactor(F)V

    .line 317
    return-void
.end method

.method public setDragModel(I)V
    .registers 3
    .parameter "model"

    .prologue
    .line 320
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_dragModel(I)V

    .line 321
    return-void
.end method

.method public setDrawRuler(Z)V
    .registers 3
    .parameter "drawRuler"

    .prologue
    .line 606
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_drawRuler(Z)V

    .line 607
    return-void
.end method

.method public setFadeInDuration(J)V
    .registers 5
    .parameter "t"

    .prologue
    .line 910
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_fadeInDuration(I)V

    .line 911
    return-void
.end method

.method public setFillDirection(I)V
    .registers 3
    .parameter "direction"

    .prologue
    .line 324
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_fillDirection(I)V

    .line 325
    return-void
.end method

.method public setFirstCardTop(Z)V
    .registers 3
    .parameter "first"

    .prologue
    .line 518
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_firstCardTop(Z)V

    .line 519
    return-void
.end method

.method public setForceBlendCardsWithZ(Z)V
    .registers 2
    .parameter "enabled"

    .prologue
    .line 601
    iput-boolean p1, p0, Lcom/android/ex/carousel/CarouselRS;->mForceBlendCardsWithZ:Z

    .line 602
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initProgramStore()V

    .line 603
    return-void
.end method

.method public setFrictionCoefficient(F)V
    .registers 3
    .parameter "frictionCoeff"

    .prologue
    .line 312
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_frictionCoeff(F)V

    .line 313
    return-void
.end method

.method public setGeometry(ILandroid/renderscript/Mesh;)V
    .registers 7
    .parameter "n"
    .parameter "geometry"

    .prologue
    .line 809
    if-gez p1, :cond_a

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Index cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 811
    :cond_a
    monitor-enter p0

    .line 812
    const/4 v1, 0x0

    .line 813
    .local v1, mipmap:Z
    :try_start_c
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getOrCreateCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 814
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-eqz p2, :cond_20

    .line 815
    iput-object p2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    .line 823
    :cond_14
    :goto_14
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 824
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v3, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    invoke-virtual {v2, p1, v3}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setGeometry(ILandroid/renderscript/Mesh;)V

    .line 825
    monitor-exit p0

    .line 826
    return-void

    .line 818
    :cond_20
    iget-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    if-eqz v2, :cond_14

    .line 820
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    goto :goto_14

    .line 825
    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catchall_28
    move-exception v2

    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_c .. :try_end_2a} :catchall_28

    throw v2
.end method

.method public setLoadingBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .parameter "bitmap"

    .prologue
    .line 616
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    sget-object v1, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    invoke-direct {p0, p1, v1}, Lcom/android/ex/carousel/CarouselRS;->allocationFromBitmap(Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_loadingTexture(Landroid/renderscript/Allocation;)V

    .line 617
    return-void
.end method

.method public setLoadingGeometry(Landroid/renderscript/Mesh;)V
    .registers 3
    .parameter "mesh"

    .prologue
    .line 626
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_loadingGeometry(Landroid/renderscript/Mesh;)V

    .line 627
    return-void
.end method

.method public setLookAt([F[F[F)V
    .registers 15
    .parameter "eye"
    .parameter "at"
    .parameter "up"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 287
    const/4 v10, 0x0

    .local v10, i:I
    :goto_4
    const/4 v0, 0x3

    if-ge v10, v0, :cond_1c

    .line 288
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mEyePoint:[F

    aget v1, p1, v10

    aput v1, v0, v10

    .line 289
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mAtPoint:[F

    aget v1, p2, v10

    aput v1, v0, v10

    .line 290
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mUp:[F

    aget v1, p3, v10

    aput v1, v0, v10

    .line 287
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 292
    :cond_1c
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    aget v1, p1, v7

    aget v2, p1, v8

    aget v3, p1, v9

    aget v4, p2, v7

    aget v5, p2, v8

    aget v6, p2, v9

    aget v7, p3, v7

    aget v8, p3, v8

    aget v9, p3, v9

    invoke-virtual/range {v0 .. v9}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_lookAt(FFFFFFFFF)V

    .line 293
    return-void
.end method

.method public setMatrix(I[F)V
    .registers 7
    .parameter "n"
    .parameter "matrix"

    .prologue
    .line 829
    if-gez p1, :cond_a

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Index cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 831
    :cond_a
    monitor-enter p0

    .line 832
    const/4 v1, 0x0

    .line 833
    .local v1, mipmap:Z
    :try_start_c
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getOrCreateCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 834
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-eqz p2, :cond_24

    .line 835
    invoke-direct {p0, p2}, Lcom/android/ex/carousel/CarouselRS;->matrixFromFloat([F)Landroid/renderscript/Matrix4f;

    move-result-object v2

    iput-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;

    .line 840
    :goto_18
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 841
    iget-object v2, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v3, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;

    invoke-virtual {v2, p1, v3}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setMatrix(ILandroid/renderscript/Matrix4f;)V

    .line 842
    monitor-exit p0

    .line 843
    return-void

    .line 838
    :cond_24
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;

    goto :goto_18

    .line 842
    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catchall_28
    move-exception v2

    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_c .. :try_end_2a} :catchall_28

    throw v2
.end method

.method public setOverscrollSlots(F)V
    .registers 3
    .parameter "slots"

    .prologue
    .line 514
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_overscrollSlots(F)V

    .line 515
    return-void
.end method

.method public setPrefetchCardCount(I)V
    .registers 3
    .parameter "count"

    .prologue
    .line 522
    iput p1, p0, Lcom/android/ex/carousel/CarouselRS;->mPrefetchCardCount:I

    .line 523
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_prefetchCardCount(I)V

    .line 524
    return-void
.end method

.method public setRadius(F)V
    .registers 3
    .parameter "radius"

    .prologue
    .line 296
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setRadius(F)V

    .line 297
    return-void
.end method

.method public setRezInCardCount(F)V
    .registers 3
    .parameter "alpha"

    .prologue
    .line 906
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_rezInCardCount(F)V

    .line 907
    return-void
.end method

.method public setRowCount(I)V
    .registers 3
    .parameter "count"

    .prologue
    .line 505
    iput p1, p0, Lcom/android/ex/carousel/CarouselRS;->mRowCount:I

    .line 506
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_rowCount(I)V

    .line 507
    return-void
.end method

.method public setRowSpacing(F)V
    .registers 3
    .parameter "spacing"

    .prologue
    .line 510
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_rowSpacing(F)V

    .line 511
    return-void
.end method

.method public setSlotCount(I)V
    .registers 3
    .parameter "n"

    .prologue
    .line 902
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_slotCount(I)V

    .line 903
    return-void
.end method

.method public setStartAngle(F)V
    .registers 3
    .parameter "theta"

    .prologue
    .line 631
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_startAngle(F)V

    .line 632
    return-void
.end method

.method public setStoreConfigs([I)V
    .registers 16
    .parameter "configs"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 555
    if-nez p1, :cond_8

    .line 556
    invoke-direct {p0}, Lcom/android/ex/carousel/CarouselRS;->initProgramStore()V

    .line 588
    :cond_7
    return-void

    .line 560
    :cond_8
    array-length v2, p1

    .line 562
    .local v2, count:I
    invoke-direct {p0, v2}, Lcom/android/ex/carousel/CarouselRS;->resizeProgramStoresCard(I)V

    .line 563
    const/4 v8, 0x0

    .local v8, i:I
    :goto_d
    if-ge v8, v2, :cond_7

    .line 564
    aget v1, p1, v8

    .line 566
    .local v1, config:I
    and-int/lit8 v12, v1, 0x1

    if-eqz v12, :cond_4c

    move v0, v10

    .line 567
    .local v0, alpha:Z
    :goto_16
    and-int/lit8 v12, v1, 0x2

    if-eqz v12, :cond_4e

    move v4, v10

    .line 568
    .local v4, depthReads:Z
    :goto_1b
    and-int/lit8 v12, v1, 0x4

    if-eqz v12, :cond_50

    move v5, v10

    .line 571
    .local v5, depthWrites:Z
    :goto_20
    const/4 v6, 0x1

    .line 572
    .local v6, dither:Z
    if-eqz v0, :cond_52

    sget-object v7, Landroid/renderscript/ProgramStore$BlendDstFunc;->ONE_MINUS_SRC_ALPHA:Landroid/renderscript/ProgramStore$BlendDstFunc;

    .line 575
    .local v7, dstFunc:Landroid/renderscript/ProgramStore$BlendDstFunc;
    :goto_25
    if-eqz v4, :cond_55

    sget-object v3, Landroid/renderscript/ProgramStore$DepthFunc;->LESS:Landroid/renderscript/ProgramStore$DepthFunc;

    .line 579
    .local v3, depthFunc:Landroid/renderscript/ProgramStore$DepthFunc;
    :goto_29
    new-instance v12, Landroid/renderscript/ProgramStore$Builder;

    iget-object v13, p0, Lcom/android/ex/carousel/CarouselRS;->mRS:Landroid/renderscript/RenderScriptGL;

    invoke-direct {v12, v13}, Landroid/renderscript/ProgramStore$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    sget-object v13, Landroid/renderscript/ProgramStore$BlendSrcFunc;->ONE:Landroid/renderscript/ProgramStore$BlendSrcFunc;

    invoke-virtual {v12, v13, v7}, Landroid/renderscript/ProgramStore$Builder;->setBlendFunc(Landroid/renderscript/ProgramStore$BlendSrcFunc;Landroid/renderscript/ProgramStore$BlendDstFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v12

    invoke-virtual {v12, v10}, Landroid/renderscript/ProgramStore$Builder;->setDitherEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v12

    invoke-virtual {v12, v3}, Landroid/renderscript/ProgramStore$Builder;->setDepthFunc(Landroid/renderscript/ProgramStore$DepthFunc;)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v12

    invoke-virtual {v12, v5}, Landroid/renderscript/ProgramStore$Builder;->setDepthMaskEnabled(Z)Landroid/renderscript/ProgramStore$Builder;

    move-result-object v12

    invoke-virtual {v12}, Landroid/renderscript/ProgramStore$Builder;->create()Landroid/renderscript/ProgramStore;

    move-result-object v9

    .line 586
    .local v9, ps:Landroid/renderscript/ProgramStore;
    invoke-direct {p0, v8, v9}, Lcom/android/ex/carousel/CarouselRS;->setProgramStoreCard(ILandroid/renderscript/ProgramStore;)V

    .line 563
    add-int/lit8 v8, v8, 0x1

    goto :goto_d

    .end local v0           #alpha:Z
    .end local v3           #depthFunc:Landroid/renderscript/ProgramStore$DepthFunc;
    .end local v4           #depthReads:Z
    .end local v5           #depthWrites:Z
    .end local v6           #dither:Z
    .end local v7           #dstFunc:Landroid/renderscript/ProgramStore$BlendDstFunc;
    .end local v9           #ps:Landroid/renderscript/ProgramStore;
    :cond_4c
    move v0, v11

    .line 566
    goto :goto_16

    .restart local v0       #alpha:Z
    :cond_4e
    move v4, v11

    .line 567
    goto :goto_1b

    .restart local v4       #depthReads:Z
    :cond_50
    move v5, v11

    .line 568
    goto :goto_20

    .line 572
    .restart local v5       #depthWrites:Z
    .restart local v6       #dither:Z
    :cond_52
    sget-object v7, Landroid/renderscript/ProgramStore$BlendDstFunc;->ZERO:Landroid/renderscript/ProgramStore$BlendDstFunc;

    goto :goto_25

    .line 575
    .restart local v7       #dstFunc:Landroid/renderscript/ProgramStore$BlendDstFunc;
    :cond_55
    sget-object v3, Landroid/renderscript/ProgramStore$DepthFunc;->ALWAYS:Landroid/renderscript/ProgramStore$DepthFunc;

    goto :goto_29
.end method

.method public setSwaySensitivity(F)V
    .registers 3
    .parameter "swaySensitivity"

    .prologue
    .line 308
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_swaySensitivity(F)V

    .line 309
    return-void
.end method

.method public setTexture(ILandroid/graphics/Bitmap;)V
    .registers 6
    .parameter "n"
    .parameter "bitmap"

    .prologue
    .line 720
    if-gez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Index cannot be negative"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 722
    :cond_a
    monitor-enter p0

    .line 723
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/ex/carousel/CarouselRS;->getOrCreateCard(I)Lcom/android/ex/carousel/ScriptField_Card$Item;

    move-result-object v0

    .line 724
    .local v0, item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    if-eqz p2, :cond_25

    .line 725
    sget-object v1, Lcom/android/ex/carousel/CarouselRS;->MIPMAP:Landroid/renderscript/Allocation$MipmapControl;

    invoke-direct {p0, p1, p2, v1}, Lcom/android/ex/carousel/CarouselRS;->allocationFromPool(ILandroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation;

    move-result-object v1

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    .line 732
    :cond_19
    :goto_19
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/CarouselRS;->setCard(ILcom/android/ex/carousel/ScriptField_Card$Item;)V

    .line 733
    iget-object v1, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    iget-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p1, v2}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke_setTexture(ILandroid/renderscript/Allocation;)V

    .line 734
    monitor-exit p0

    .line 735
    return-void

    .line 727
    :cond_25
    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    if-eqz v1, :cond_19

    .line 729
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    goto :goto_19

    .line 734
    .end local v0           #item:Lcom/android/ex/carousel/ScriptField_Card$Item;
    :catchall_2d
    move-exception v1

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_b .. :try_end_2f} :catchall_2d

    throw v1
.end method

.method public setVisibleDetails(I)V
    .registers 3
    .parameter "count"

    .prologue
    .line 501
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_visibleDetailCount(I)V

    .line 502
    return-void
.end method

.method public setVisibleSlots(I)V
    .registers 3
    .parameter "count"

    .prologue
    .line 496
    iput p1, p0, Lcom/android/ex/carousel/CarouselRS;->mVisibleSlots:I

    .line 497
    iget-object v0, p0, Lcom/android/ex/carousel/CarouselRS;->mScript:Lcom/android/ex/carousel/ScriptC_carousel;

    invoke-virtual {v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->set_visibleSlotCount(I)V

    .line 498
    return-void
.end method
