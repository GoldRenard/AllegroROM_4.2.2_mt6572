.class public Lcom/android/ex/carousel/ScriptC_carousel;
.super Landroid/renderscript/ScriptC;
.source "ScriptC_carousel.java"


# static fields
.field private static final __rs_resource_name:Ljava/lang/String; = "carousel"

.field public static final const_debugCamera:Z = false

.field public static final const_debugDetails:Z = false

.field public static final const_debugGeometryLoading:Z = false

.field public static final const_debugRays:Z = false

.field public static final const_debugRendering:Z = false

.field public static final const_debugSelection:Z = false

.field public static final const_debugTextureLoading:Z = false

.field private static final mExportFuncIdx_createCards:I = 0x1

.field private static final mExportFuncIdx_doLongPress:I = 0xd

.field private static final mExportFuncIdx_doMotion:I = 0xe

.field private static final mExportFuncIdx_doStart:I = 0xb

.field private static final mExportFuncIdx_doStop:I = 0xc

.field private static final mExportFuncIdx_invalidateDetailTexture:I = 0x6

.field private static final mExportFuncIdx_invalidateTexture:I = 0x5

.field private static final mExportFuncIdx_lookAt:I = 0x2

.field private static final mExportFuncIdx_setCarouselRotationAngle:I = 0xa

.field private static final mExportFuncIdx_setCarouselRotationAngle2:I = 0xf

.field private static final mExportFuncIdx_setDetailTexture:I = 0x4

.field private static final mExportFuncIdx_setGeometry:I = 0x7

.field private static final mExportFuncIdx_setMatrix:I = 0x8

.field private static final mExportFuncIdx_setProgramStoresCard:I = 0x9

.field private static final mExportFuncIdx_setRadius:I = 0x0

.field private static final mExportFuncIdx_setTexture:I = 0x3

.field private static final mExportVarIdx_backgroundColor:I = 0x1b

.field private static final mExportVarIdx_backgroundTexture:I = 0x2d

.field private static final mExportVarIdx_cardCount:I = 0xa

.field private static final mExportVarIdx_cardCreationFadeDuration:I = 0x18

.field private static final mExportVarIdx_cardRotation:I = 0x12

.field private static final mExportVarIdx_cards:I = 0x7

.field private static final mExportVarIdx_cardsFaceTangent:I = 0x13

.field private static final mExportVarIdx_debugCamera:I = 0x0

.field private static final mExportVarIdx_debugDetails:I = 0x4

.field private static final mExportVarIdx_debugGeometryLoading:I = 0x3

.field private static final mExportVarIdx_debugRays:I = 0x6

.field private static final mExportVarIdx_debugRendering:I = 0x5

.field private static final mExportVarIdx_debugSelection:I = 0x1

.field private static final mExportVarIdx_debugTextureLoading:I = 0x2

.field private static final mExportVarIdx_defaultCardMatrix:I = 0x32

.field private static final mExportVarIdx_defaultGeometry:I = 0x30

.field private static final mExportVarIdx_defaultTexture:I = 0x2b

.field private static final mExportVarIdx_detailFadeRate:I = 0x1a

.field private static final mExportVarIdx_detailLineTexture:I = 0x2e

.field private static final mExportVarIdx_detailLoadingTexture:I = 0x2f

.field private static final mExportVarIdx_detailTextureAlignment:I = 0xf

.field private static final mExportVarIdx_dragFactor:I = 0x16

.field private static final mExportVarIdx_dragModel:I = 0x20

.field private static final mExportVarIdx_drawRuler:I = 0x10

.field private static final mExportVarIdx_fadeInDuration:I = 0x17

.field private static final mExportVarIdx_fillDirection:I = 0x21

.field private static final mExportVarIdx_firstCardTop:I = 0x1e

.field private static final mExportVarIdx_frictionCoeff:I = 0x15

.field private static final mExportVarIdx_linearClamp:I = 0x36

.field private static final mExportVarIdx_loadingGeometry:I = 0x31

.field private static final mExportVarIdx_loadingTexture:I = 0x2c

.field private static final mExportVarIdx_modelviewMatrix:I = 0x34

.field private static final mExportVarIdx_multiTextureBlendingFragmentProgram:I = 0x28

.field private static final mExportVarIdx_multiTextureFragmentProgram:I = 0x27

.field private static final mExportVarIdx_overscrollSlots:I = 0x1f

.field private static final mExportVarIdx_prefetchCardCount:I = 0xe

.field private static final mExportVarIdx_programStoreBackground:I = 0x23

.field private static final mExportVarIdx_programStoreDetail:I = 0x24

.field private static final mExportVarIdx_programStoresCard:I = 0x22

.field private static final mExportVarIdx_programStoresCardCount:I = 0xb

.field private static final mExportVarIdx_projectionMatrix:I = 0x33

.field private static final mExportVarIdx_radius:I = 0x11

.field private static final mExportVarIdx_rasterProgram:I = 0x2a

.field private static final mExportVarIdx_rezInCardCount:I = 0x19

.field private static final mExportVarIdx_rowCount:I = 0x1c

.field private static final mExportVarIdx_rowSpacing:I = 0x1d

.field private static final mExportVarIdx_shaderConstants:I = 0x35

.field private static final mExportVarIdx_singleTextureBlendingFragmentProgram:I = 0x26

.field private static final mExportVarIdx_singleTextureFragmentProgram:I = 0x25

.field private static final mExportVarIdx_slotCount:I = 0x9

.field private static final mExportVarIdx_startAngle:I = 0x8

.field private static final mExportVarIdx_swaySensitivity:I = 0x14

.field private static final mExportVarIdx_vertexProgram:I = 0x29

.field private static final mExportVarIdx_visibleDetailCount:I = 0xd

.field private static final mExportVarIdx_visibleSlotCount:I = 0xc


# instance fields
.field private __ALLOCATION:Landroid/renderscript/Element;

.field private __BOOLEAN:Landroid/renderscript/Element;

.field private __F32:Landroid/renderscript/Element;

.field private __F32_4:Landroid/renderscript/Element;

.field private __I32:Landroid/renderscript/Element;

.field private __MESH:Landroid/renderscript/Element;

.field private __PROGRAM_FRAGMENT:Landroid/renderscript/Element;

.field private __PROGRAM_RASTER:Landroid/renderscript/Element;

.field private __PROGRAM_STORE:Landroid/renderscript/Element;

.field private __PROGRAM_VERTEX:Landroid/renderscript/Element;

.field private __SAMPLER:Landroid/renderscript/Element;

.field private __rs_fp_ALLOCATION:Landroid/renderscript/FieldPacker;

.field private __rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

.field private __rs_fp_F32:Landroid/renderscript/FieldPacker;

.field private __rs_fp_F32_4:Landroid/renderscript/FieldPacker;

.field private __rs_fp_I32:Landroid/renderscript/FieldPacker;

.field private __rs_fp_MESH:Landroid/renderscript/FieldPacker;

.field private __rs_fp_PROGRAM_FRAGMENT:Landroid/renderscript/FieldPacker;

.field private __rs_fp_PROGRAM_RASTER:Landroid/renderscript/FieldPacker;

.field private __rs_fp_PROGRAM_STORE:Landroid/renderscript/FieldPacker;

.field private __rs_fp_PROGRAM_VERTEX:Landroid/renderscript/FieldPacker;

.field private __rs_fp_SAMPLER:Landroid/renderscript/FieldPacker;

.field private mExportVar_backgroundColor:Landroid/renderscript/Float4;

.field private mExportVar_backgroundTexture:Landroid/renderscript/Allocation;

.field private mExportVar_cardCount:I

.field private mExportVar_cardCreationFadeDuration:I

.field private mExportVar_cardRotation:F

.field private mExportVar_cards:Lcom/android/ex/carousel/ScriptField_Card;

.field private mExportVar_cardsFaceTangent:Z

.field private mExportVar_debugCamera:Z

.field private mExportVar_debugDetails:Z

.field private mExportVar_debugGeometryLoading:Z

.field private mExportVar_debugRays:Z

.field private mExportVar_debugRendering:Z

.field private mExportVar_debugSelection:Z

.field private mExportVar_debugTextureLoading:Z

.field private mExportVar_defaultCardMatrix:Landroid/renderscript/Matrix4f;

.field private mExportVar_defaultGeometry:Landroid/renderscript/Mesh;

.field private mExportVar_defaultTexture:Landroid/renderscript/Allocation;

.field private mExportVar_detailFadeRate:F

.field private mExportVar_detailLineTexture:Landroid/renderscript/Allocation;

.field private mExportVar_detailLoadingTexture:Landroid/renderscript/Allocation;

.field private mExportVar_detailTextureAlignment:I

.field private mExportVar_dragFactor:F

.field private mExportVar_dragModel:I

.field private mExportVar_drawRuler:Z

.field private mExportVar_fadeInDuration:I

.field private mExportVar_fillDirection:I

.field private mExportVar_firstCardTop:Z

.field private mExportVar_frictionCoeff:F

.field private mExportVar_linearClamp:Landroid/renderscript/Sampler;

.field private mExportVar_loadingGeometry:Landroid/renderscript/Mesh;

.field private mExportVar_loadingTexture:Landroid/renderscript/Allocation;

.field private mExportVar_modelviewMatrix:Landroid/renderscript/Matrix4f;

.field private mExportVar_multiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mExportVar_multiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mExportVar_overscrollSlots:F

.field private mExportVar_prefetchCardCount:I

.field private mExportVar_programStoreBackground:Landroid/renderscript/ProgramStore;

.field private mExportVar_programStoreDetail:Landroid/renderscript/ProgramStore;

.field private mExportVar_programStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

.field private mExportVar_programStoresCardCount:I

.field private mExportVar_projectionMatrix:Landroid/renderscript/Matrix4f;

.field private mExportVar_radius:F

.field private mExportVar_rasterProgram:Landroid/renderscript/ProgramRaster;

.field private mExportVar_rezInCardCount:F

.field private mExportVar_rowCount:I

.field private mExportVar_rowSpacing:F

.field private mExportVar_shaderConstants:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

.field private mExportVar_singleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mExportVar_singleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

.field private mExportVar_slotCount:I

.field private mExportVar_startAngle:F

.field private mExportVar_swaySensitivity:F

.field private mExportVar_vertexProgram:Landroid/renderscript/ProgramVertex;

.field private mExportVar_visibleDetailCount:I

.field private mExportVar_visibleSlotCount:I


# direct methods
.method public constructor <init>(Landroid/renderscript/RenderScript;)V
    .locals 5
    .parameter "rs"

    .prologue
    .line 17
    invoke-virtual {p1}, Landroid/renderscript/RenderScript;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/renderscript/RenderScript;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "carousel"

    const-string v3, "raw"

    invoke-virtual {p1}, Landroid/renderscript/RenderScript;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;-><init>(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)V
    .locals 2
    .parameter "rs"
    .parameter "resources"
    .parameter "id"

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/renderscript/ScriptC;-><init>(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)V

    .line 26
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugCamera:Z

    .line 27
    invoke-static {p1}, Landroid/renderscript/Element;->BOOLEAN(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__BOOLEAN:Landroid/renderscript/Element;

    .line 28
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugSelection:Z

    .line 29
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugTextureLoading:Z

    .line 30
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugGeometryLoading:Z

    .line 31
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugDetails:Z

    .line 32
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugRendering:Z

    .line 33
    iput-boolean v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugRays:Z

    .line 34
    invoke-static {p1}, Landroid/renderscript/Element;->F32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__F32:Landroid/renderscript/Element;

    .line 35
    invoke-static {p1}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__I32:Landroid/renderscript/Element;

    .line 36
    invoke-static {p1}, Landroid/renderscript/Element;->F32_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__F32_4:Landroid/renderscript/Element;

    .line 37
    iput v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_dragModel:I

    .line 38
    invoke-static {p1}, Landroid/renderscript/Element;->PROGRAM_STORE(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__PROGRAM_STORE:Landroid/renderscript/Element;

    .line 39
    invoke-static {p1}, Landroid/renderscript/Element;->PROGRAM_FRAGMENT(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__PROGRAM_FRAGMENT:Landroid/renderscript/Element;

    .line 40
    invoke-static {p1}, Landroid/renderscript/Element;->PROGRAM_VERTEX(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__PROGRAM_VERTEX:Landroid/renderscript/Element;

    .line 41
    invoke-static {p1}, Landroid/renderscript/Element;->PROGRAM_RASTER(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__PROGRAM_RASTER:Landroid/renderscript/Element;

    .line 42
    invoke-static {p1}, Landroid/renderscript/Element;->ALLOCATION(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__ALLOCATION:Landroid/renderscript/Element;

    .line 43
    invoke-static {p1}, Landroid/renderscript/Element;->MESH(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__MESH:Landroid/renderscript/Element;

    .line 44
    invoke-static {p1}, Landroid/renderscript/Element;->SAMPLER(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__SAMPLER:Landroid/renderscript/Element;

    .line 45
    return-void
.end method


# virtual methods
.method public bind_cards(Lcom/android/ex/carousel/ScriptField_Card;)V
    .locals 2
    .parameter "v"

    .prologue
    const/4 v1, 0x7

    .line 149
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cards:Lcom/android/ex/carousel/ScriptField_Card;

    .line 150
    if-nez p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    .line 152
    :goto_0
    return-void

    .line 151
    :cond_0
    invoke-virtual {p1}, Lcom/android/ex/carousel/ScriptField_Card;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    goto :goto_0
.end method

.method public bind_programStoresCard(Lcom/android/ex/carousel/ScriptField_ProgramStore_s;)V
    .locals 2
    .parameter "v"

    .prologue
    const/16 v1, 0x22

    .line 573
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    .line 574
    if-nez p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    .line 576
    :goto_0
    return-void

    .line 575
    :cond_0
    invoke-virtual {p1}, Lcom/android/ex/carousel/ScriptField_ProgramStore_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    goto :goto_0
.end method

.method public bind_shaderConstants(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;)V
    .locals 2
    .parameter "v"

    .prologue
    const/16 v1, 0x35

    .line 861
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_shaderConstants:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    .line 862
    if-nez p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    .line 864
    :goto_0
    return-void

    .line 863
    :cond_0
    invoke-virtual {p1}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getAllocation()Landroid/renderscript/Allocation;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->bindAllocation(Landroid/renderscript/Allocation;I)V

    goto :goto_0
.end method

.method public getFieldID_backgroundColor()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 471
    const/16 v0, 0x1b

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_backgroundTexture()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 744
    const/16 v0, 0x2d

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_cardCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 200
    const/16 v0, 0xa

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_cardCreationFadeDuration()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 422
    const/16 v0, 0x18

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_cardRotation()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 326
    const/16 v0, 0x12

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_cardsFaceTangent()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 347
    const/16 v0, 0x13

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugCamera()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 77
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugDetails()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 121
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugGeometryLoading()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 110
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugRays()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 143
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugRendering()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 132
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugSelection()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 88
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_debugTextureLoading()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 99
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_defaultCardMatrix()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 821
    const/16 v0, 0x32

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_defaultGeometry()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 789
    const/16 v0, 0x30

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_defaultTexture()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 714
    const/16 v0, 0x2b

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_detailFadeRate()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 452
    const/16 v0, 0x1a

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_detailLineTexture()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 759
    const/16 v0, 0x2e

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_detailLoadingTexture()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 774
    const/16 v0, 0x2f

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_detailTextureAlignment()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 275
    const/16 v0, 0xf

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_dragFactor()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 392
    const/16 v0, 0x16

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_dragModel()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 552
    const/16 v0, 0x20

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_drawRuler()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 296
    const/16 v0, 0x10

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_fadeInDuration()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 407
    const/16 v0, 0x17

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_fillDirection()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 567
    const/16 v0, 0x21

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_firstCardTop()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 522
    const/16 v0, 0x1e

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_frictionCoeff()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 377
    const/16 v0, 0x15

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_linearClamp()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 882
    const/16 v0, 0x36

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_loadingGeometry()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 804
    const/16 v0, 0x31

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_loadingTexture()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 729
    const/16 v0, 0x2c

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_modelviewMatrix()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 855
    const/16 v0, 0x34

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_multiTextureBlendingFragmentProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 669
    const/16 v0, 0x28

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_multiTextureFragmentProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 654
    const/16 v0, 0x27

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_overscrollSlots()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 537
    const/16 v0, 0x1f

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_prefetchCardCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 260
    const/16 v0, 0xe

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_programStoreBackground()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 594
    const/16 v0, 0x23

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_programStoreDetail()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 609
    const/16 v0, 0x24

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_programStoresCardCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 215
    const/16 v0, 0xb

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_projectionMatrix()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 838
    const/16 v0, 0x33

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_radius()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 311
    const/16 v0, 0x11

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_rasterProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 699
    const/16 v0, 0x2a

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_rezInCardCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 437
    const/16 v0, 0x19

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_rowCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 486
    const/16 v0, 0x1c

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_rowSpacing()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 501
    const/16 v0, 0x1d

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_singleTextureBlendingFragmentProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 639
    const/16 v0, 0x26

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_singleTextureFragmentProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 624
    const/16 v0, 0x25

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_slotCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 185
    const/16 v0, 0x9

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_startAngle()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 170
    const/16 v0, 0x8

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_swaySensitivity()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 362
    const/16 v0, 0x14

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_vertexProgram()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 684
    const/16 v0, 0x29

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_visibleDetailCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 245
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getFieldID_visibleSlotCount()Landroid/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 230
    const/16 v0, 0xc

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public get_backgroundColor()Landroid/renderscript/Float4;
    .locals 1

    .prologue
    .line 467
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_backgroundColor:Landroid/renderscript/Float4;

    return-object v0
.end method

.method public get_backgroundTexture()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 740
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_backgroundTexture:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method public get_cardCount()I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardCount:I

    return v0
.end method

.method public get_cardCreationFadeDuration()I
    .locals 1

    .prologue
    .line 418
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardCreationFadeDuration:I

    return v0
.end method

.method public get_cardRotation()F
    .locals 1

    .prologue
    .line 322
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardRotation:F

    return v0
.end method

.method public get_cards()Lcom/android/ex/carousel/ScriptField_Card;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cards:Lcom/android/ex/carousel/ScriptField_Card;

    return-object v0
.end method

.method public get_cardsFaceTangent()Z
    .locals 1

    .prologue
    .line 343
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardsFaceTangent:Z

    return v0
.end method

.method public get_debugCamera()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugCamera:Z

    return v0
.end method

.method public get_debugDetails()Z
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugDetails:Z

    return v0
.end method

.method public get_debugGeometryLoading()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugGeometryLoading:Z

    return v0
.end method

.method public get_debugRays()Z
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugRays:Z

    return v0
.end method

.method public get_debugRendering()Z
    .locals 1

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugRendering:Z

    return v0
.end method

.method public get_debugSelection()Z
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugSelection:Z

    return v0
.end method

.method public get_debugTextureLoading()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_debugTextureLoading:Z

    return v0
.end method

.method public get_defaultCardMatrix()Landroid/renderscript/Matrix4f;
    .locals 1

    .prologue
    .line 817
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultCardMatrix:Landroid/renderscript/Matrix4f;

    return-object v0
.end method

.method public get_defaultGeometry()Landroid/renderscript/Mesh;
    .locals 1

    .prologue
    .line 785
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultGeometry:Landroid/renderscript/Mesh;

    return-object v0
.end method

.method public get_defaultTexture()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 710
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultTexture:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method public get_detailFadeRate()F
    .locals 1

    .prologue
    .line 448
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailFadeRate:F

    return v0
.end method

.method public get_detailLineTexture()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 755
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailLineTexture:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method public get_detailLoadingTexture()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 770
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailLoadingTexture:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method public get_detailTextureAlignment()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailTextureAlignment:I

    return v0
.end method

.method public get_dragFactor()F
    .locals 1

    .prologue
    .line 388
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_dragFactor:F

    return v0
.end method

.method public get_dragModel()I
    .locals 1

    .prologue
    .line 548
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_dragModel:I

    return v0
.end method

.method public get_drawRuler()Z
    .locals 1

    .prologue
    .line 292
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_drawRuler:Z

    return v0
.end method

.method public get_fadeInDuration()I
    .locals 1

    .prologue
    .line 403
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_fadeInDuration:I

    return v0
.end method

.method public get_fillDirection()I
    .locals 1

    .prologue
    .line 563
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_fillDirection:I

    return v0
.end method

.method public get_firstCardTop()Z
    .locals 1

    .prologue
    .line 518
    iget-boolean v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_firstCardTop:Z

    return v0
.end method

.method public get_frictionCoeff()F
    .locals 1

    .prologue
    .line 373
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_frictionCoeff:F

    return v0
.end method

.method public get_linearClamp()Landroid/renderscript/Sampler;
    .locals 1

    .prologue
    .line 878
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_linearClamp:Landroid/renderscript/Sampler;

    return-object v0
.end method

.method public get_loadingGeometry()Landroid/renderscript/Mesh;
    .locals 1

    .prologue
    .line 800
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_loadingGeometry:Landroid/renderscript/Mesh;

    return-object v0
.end method

.method public get_loadingTexture()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 725
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_loadingTexture:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method public get_modelviewMatrix()Landroid/renderscript/Matrix4f;
    .locals 1

    .prologue
    .line 851
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_modelviewMatrix:Landroid/renderscript/Matrix4f;

    return-object v0
.end method

.method public get_multiTextureBlendingFragmentProgram()Landroid/renderscript/ProgramFragment;
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_multiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    return-object v0
.end method

.method public get_multiTextureFragmentProgram()Landroid/renderscript/ProgramFragment;
    .locals 1

    .prologue
    .line 650
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_multiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    return-object v0
.end method

.method public get_overscrollSlots()F
    .locals 1

    .prologue
    .line 533
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_overscrollSlots:F

    return v0
.end method

.method public get_prefetchCardCount()I
    .locals 1

    .prologue
    .line 256
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_prefetchCardCount:I

    return v0
.end method

.method public get_programStoreBackground()Landroid/renderscript/ProgramStore;
    .locals 1

    .prologue
    .line 590
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoreBackground:Landroid/renderscript/ProgramStore;

    return-object v0
.end method

.method public get_programStoreDetail()Landroid/renderscript/ProgramStore;
    .locals 1

    .prologue
    .line 605
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoreDetail:Landroid/renderscript/ProgramStore;

    return-object v0
.end method

.method public get_programStoresCard()Lcom/android/ex/carousel/ScriptField_ProgramStore_s;
    .locals 1

    .prologue
    .line 579
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoresCard:Lcom/android/ex/carousel/ScriptField_ProgramStore_s;

    return-object v0
.end method

.method public get_programStoresCardCount()I
    .locals 1

    .prologue
    .line 211
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoresCardCount:I

    return v0
.end method

.method public get_projectionMatrix()Landroid/renderscript/Matrix4f;
    .locals 1

    .prologue
    .line 834
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_projectionMatrix:Landroid/renderscript/Matrix4f;

    return-object v0
.end method

.method public get_radius()F
    .locals 1

    .prologue
    .line 307
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_radius:F

    return v0
.end method

.method public get_rasterProgram()Landroid/renderscript/ProgramRaster;
    .locals 1

    .prologue
    .line 695
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rasterProgram:Landroid/renderscript/ProgramRaster;

    return-object v0
.end method

.method public get_rezInCardCount()F
    .locals 1

    .prologue
    .line 433
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rezInCardCount:F

    return v0
.end method

.method public get_rowCount()I
    .locals 1

    .prologue
    .line 482
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rowCount:I

    return v0
.end method

.method public get_rowSpacing()F
    .locals 1

    .prologue
    .line 497
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rowSpacing:F

    return v0
.end method

.method public get_shaderConstants()Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .locals 1

    .prologue
    .line 867
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_shaderConstants:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    return-object v0
.end method

.method public get_singleTextureBlendingFragmentProgram()Landroid/renderscript/ProgramFragment;
    .locals 1

    .prologue
    .line 635
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_singleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;

    return-object v0
.end method

.method public get_singleTextureFragmentProgram()Landroid/renderscript/ProgramFragment;
    .locals 1

    .prologue
    .line 620
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_singleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;

    return-object v0
.end method

.method public get_slotCount()I
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_slotCount:I

    return v0
.end method

.method public get_startAngle()F
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_startAngle:F

    return v0
.end method

.method public get_swaySensitivity()F
    .locals 1

    .prologue
    .line 358
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_swaySensitivity:F

    return v0
.end method

.method public get_vertexProgram()Landroid/renderscript/ProgramVertex;
    .locals 1

    .prologue
    .line 680
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_vertexProgram:Landroid/renderscript/ProgramVertex;

    return-object v0
.end method

.method public get_visibleDetailCount()I
    .locals 1

    .prologue
    .line 241
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_visibleDetailCount:I

    return v0
.end method

.method public get_visibleSlotCount()I
    .locals 1

    .prologue
    .line 226
    iget v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_visibleSlotCount:I

    return v0
.end method

.method public invoke_createCards(II)V
    .locals 2
    .parameter "start"
    .parameter "total"

    .prologue
    .line 894
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 895
    .local v0, createCards_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 896
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 897
    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 898
    return-void
.end method

.method public invoke_doLongPress()V
    .locals 1

    .prologue
    .line 1004
    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(I)V

    .line 1005
    return-void
.end method

.method public invoke_doMotion(FFJ)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "eventTime"

    .prologue
    .line 1009
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 1010
    .local v0, doMotion_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 1011
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 1012
    invoke-virtual {v0, p3, p4}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 1013
    const/16 v1, 0xe

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 1014
    return-void
.end method

.method public invoke_doStart(FFJ)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "eventTime"

    .prologue
    .line 986
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 987
    .local v0, doStart_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 988
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 989
    invoke-virtual {v0, p3, p4}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 990
    const/16 v1, 0xb

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 991
    return-void
.end method

.method public invoke_doStop(FFJ)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "eventTime"

    .prologue
    .line 995
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 996
    .local v0, doStop_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 997
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 998
    invoke-virtual {v0, p3, p4}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 999
    const/16 v1, 0xc

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 1000
    return-void
.end method

.method public invoke_invalidateDetailTexture(IZ)V
    .locals 2
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 946
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 947
    .local v0, invalidateDetailTexture_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 948
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addBoolean(Z)V

    .line 949
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/renderscript/FieldPacker;->skip(I)V

    .line 950
    const/4 v1, 0x6

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 951
    return-void
.end method

.method public invoke_invalidateTexture(IZ)V
    .locals 2
    .parameter "n"
    .parameter "eraseCurrent"

    .prologue
    .line 937
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 938
    .local v0, invalidateTexture_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 939
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addBoolean(Z)V

    .line 940
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/renderscript/FieldPacker;->skip(I)V

    .line 941
    const/4 v1, 0x5

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 942
    return-void
.end method

.method public invoke_lookAt(FFFFFFFFF)V
    .locals 2
    .parameter "fromX"
    .parameter "fromY"
    .parameter "fromZ"
    .parameter "atX"
    .parameter "atY"
    .parameter "atZ"
    .parameter "upX"
    .parameter "upY"
    .parameter "upZ"

    .prologue
    .line 902
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x24

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 903
    .local v0, lookAt_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 904
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 905
    invoke-virtual {v0, p3}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 906
    invoke-virtual {v0, p4}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 907
    invoke-virtual {v0, p5}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 908
    invoke-virtual {v0, p6}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 909
    invoke-virtual {v0, p7}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 910
    invoke-virtual {v0, p8}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 911
    invoke-virtual {v0, p9}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 912
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 913
    return-void
.end method

.method public invoke_setCarouselRotationAngle(F)V
    .locals 2
    .parameter "carouselRotationAngle"

    .prologue
    .line 979
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 980
    .local v0, setCarouselRotationAngle_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 981
    const/16 v1, 0xa

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 982
    return-void
.end method

.method public invoke_setCarouselRotationAngle2(FIIF)V
    .locals 2
    .parameter "endAngle"
    .parameter "milliseconds"
    .parameter "interpolationMode"
    .parameter "maxAnimatedArc"

    .prologue
    .line 1018
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 1019
    .local v0, setCarouselRotationAngle2_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 1020
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 1021
    invoke-virtual {v0, p3}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 1022
    invoke-virtual {v0, p4}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 1023
    const/16 v1, 0xf

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 1024
    return-void
.end method

.method public invoke_setDetailTexture(IFFFFLandroid/renderscript/Allocation;)V
    .locals 2
    .parameter "n"
    .parameter "offx"
    .parameter "offy"
    .parameter "loffx"
    .parameter "loffy"
    .parameter "texture"

    .prologue
    .line 925
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 926
    .local v0, setDetailTexture_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 927
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 928
    invoke-virtual {v0, p3}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 929
    invoke-virtual {v0, p4}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 930
    invoke-virtual {v0, p5}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 931
    invoke-virtual {v0, p6}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 932
    const/4 v1, 0x4

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 933
    return-void
.end method

.method public invoke_setGeometry(ILandroid/renderscript/Mesh;)V
    .locals 2
    .parameter "n"
    .parameter "geometry"

    .prologue
    .line 955
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 956
    .local v0, setGeometry_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 957
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 958
    const/4 v1, 0x7

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 959
    return-void
.end method

.method public invoke_setMatrix(ILandroid/renderscript/Matrix4f;)V
    .locals 2
    .parameter "n"
    .parameter "matrix"

    .prologue
    .line 963
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x44

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 964
    .local v0, setMatrix_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 965
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 966
    const/16 v1, 0x8

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 967
    return-void
.end method

.method public invoke_setProgramStoresCard(ILandroid/renderscript/ProgramStore;)V
    .locals 2
    .parameter "n"
    .parameter "programStore"

    .prologue
    .line 971
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 972
    .local v0, setProgramStoresCard_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 973
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 974
    const/16 v1, 0x9

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 975
    return-void
.end method

.method public invoke_setRadius(F)V
    .locals 2
    .parameter "rad"

    .prologue
    .line 887
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 888
    .local v0, setRadius_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 889
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 890
    return-void
.end method

.method public invoke_setTexture(ILandroid/renderscript/Allocation;)V
    .locals 2
    .parameter "n"
    .parameter "texture"

    .prologue
    .line 917
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 918
    .local v0, setTexture_fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 919
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 920
    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 921
    return-void
.end method

.method public declared-synchronized set_backgroundColor(Landroid/renderscript/Float4;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 458
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_backgroundColor:Landroid/renderscript/Float4;

    .line 459
    new-instance v1, Landroid/renderscript/FieldPacker;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 460
    .local v1, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v1, p1}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float4;)V

    .line 461
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 462
    .local v0, __dimArr:[I
    const/4 v2, 0x0

    const/4 v3, 0x4

    aput v3, v0, v2

    .line 463
    const/16 v2, 0x1b

    iget-object v3, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__F32_4:Landroid/renderscript/Element;

    invoke-virtual {p0, v2, v1, v3, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;Landroid/renderscript/Element;[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 464
    monitor-exit p0

    return-void

    .line 458
    .end local v0           #__dimArr:[I
    .end local v1           #fp:Landroid/renderscript/FieldPacker;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized set_backgroundTexture(Landroid/renderscript/Allocation;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 735
    monitor-enter p0

    const/16 v0, 0x2d

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 736
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_backgroundTexture:Landroid/renderscript/Allocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 737
    monitor-exit p0

    return-void

    .line 735
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_cardCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 191
    monitor-enter p0

    const/16 v0, 0xa

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 192
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
    monitor-exit p0

    return-void

    .line 191
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_cardCreationFadeDuration(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 413
    monitor-enter p0

    const/16 v0, 0x18

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 414
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardCreationFadeDuration:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 415
    monitor-exit p0

    return-void

    .line 413
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_cardRotation(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 317
    monitor-enter p0

    const/16 v0, 0x12

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 318
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardRotation:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 319
    monitor-exit p0

    return-void

    .line 317
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_cardsFaceTangent(Z)V
    .locals 2
    .parameter "v"

    .prologue
    .line 332
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    if-eqz v0, :cond_0

    .line 333
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0}, Landroid/renderscript/FieldPacker;->reset()V

    .line 337
    :goto_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addBoolean(Z)V

    .line 338
    const/16 v0, 0x13

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V

    .line 339
    iput-boolean p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_cardsFaceTangent:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    monitor-exit p0

    return-void

    .line 335
    :cond_0
    :try_start_1
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 332
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_defaultCardMatrix(Landroid/renderscript/Matrix4f;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 810
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultCardMatrix:Landroid/renderscript/Matrix4f;

    .line 811
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 812
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 813
    const/16 v1, 0x32

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 814
    monitor-exit p0

    return-void

    .line 810
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_defaultGeometry(Landroid/renderscript/Mesh;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 780
    monitor-enter p0

    const/16 v0, 0x30

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 781
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultGeometry:Landroid/renderscript/Mesh;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 782
    monitor-exit p0

    return-void

    .line 780
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_defaultTexture(Landroid/renderscript/Allocation;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 705
    monitor-enter p0

    const/16 v0, 0x2b

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 706
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_defaultTexture:Landroid/renderscript/Allocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 707
    monitor-exit p0

    return-void

    .line 705
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_detailFadeRate(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 443
    monitor-enter p0

    const/16 v0, 0x1a

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 444
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailFadeRate:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    monitor-exit p0

    return-void

    .line 443
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_detailLineTexture(Landroid/renderscript/Allocation;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 750
    monitor-enter p0

    const/16 v0, 0x2e

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 751
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailLineTexture:Landroid/renderscript/Allocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 752
    monitor-exit p0

    return-void

    .line 750
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_detailLoadingTexture(Landroid/renderscript/Allocation;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 765
    monitor-enter p0

    const/16 v0, 0x2f

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 766
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailLoadingTexture:Landroid/renderscript/Allocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 767
    monitor-exit p0

    return-void

    .line 765
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_detailTextureAlignment(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 266
    monitor-enter p0

    const/16 v0, 0xf

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 267
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_detailTextureAlignment:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    monitor-exit p0

    return-void

    .line 266
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_dragFactor(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 383
    monitor-enter p0

    const/16 v0, 0x16

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 384
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_dragFactor:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    monitor-exit p0

    return-void

    .line 383
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_dragModel(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 543
    monitor-enter p0

    const/16 v0, 0x20

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 544
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_dragModel:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 545
    monitor-exit p0

    return-void

    .line 543
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_drawRuler(Z)V
    .locals 2
    .parameter "v"

    .prologue
    .line 281
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0}, Landroid/renderscript/FieldPacker;->reset()V

    .line 286
    :goto_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addBoolean(Z)V

    .line 287
    const/16 v0, 0x10

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V

    .line 288
    iput-boolean p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_drawRuler:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    monitor-exit p0

    return-void

    .line 284
    :cond_0
    :try_start_1
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 281
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_fadeInDuration(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 398
    monitor-enter p0

    const/16 v0, 0x17

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 399
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_fadeInDuration:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    monitor-exit p0

    return-void

    .line 398
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_fillDirection(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 558
    monitor-enter p0

    const/16 v0, 0x21

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 559
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_fillDirection:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 560
    monitor-exit p0

    return-void

    .line 558
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_firstCardTop(Z)V
    .locals 2
    .parameter "v"

    .prologue
    .line 507
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    if-eqz v0, :cond_0

    .line 508
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0}, Landroid/renderscript/FieldPacker;->reset()V

    .line 512
    :goto_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addBoolean(Z)V

    .line 513
    const/16 v0, 0x1e

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;

    invoke-virtual {p0, v0, v1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V

    .line 514
    iput-boolean p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_firstCardTop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    monitor-exit p0

    return-void

    .line 510
    :cond_0
    :try_start_1
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptC_carousel;->__rs_fp_BOOLEAN:Landroid/renderscript/FieldPacker;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 507
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_frictionCoeff(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 368
    monitor-enter p0

    const/16 v0, 0x15

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 369
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_frictionCoeff:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    monitor-exit p0

    return-void

    .line 368
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_linearClamp(Landroid/renderscript/Sampler;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 873
    monitor-enter p0

    const/16 v0, 0x36

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 874
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_linearClamp:Landroid/renderscript/Sampler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 875
    monitor-exit p0

    return-void

    .line 873
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_loadingGeometry(Landroid/renderscript/Mesh;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 795
    monitor-enter p0

    const/16 v0, 0x31

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 796
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_loadingGeometry:Landroid/renderscript/Mesh;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 797
    monitor-exit p0

    return-void

    .line 795
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_loadingTexture(Landroid/renderscript/Allocation;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 720
    monitor-enter p0

    const/16 v0, 0x2c

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 721
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_loadingTexture:Landroid/renderscript/Allocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 722
    monitor-exit p0

    return-void

    .line 720
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_modelviewMatrix(Landroid/renderscript/Matrix4f;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 844
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_modelviewMatrix:Landroid/renderscript/Matrix4f;

    .line 845
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 846
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 847
    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 848
    monitor-exit p0

    return-void

    .line 844
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_multiTextureBlendingFragmentProgram(Landroid/renderscript/ProgramFragment;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 660
    monitor-enter p0

    const/16 v0, 0x28

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 661
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_multiTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 662
    monitor-exit p0

    return-void

    .line 660
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_multiTextureFragmentProgram(Landroid/renderscript/ProgramFragment;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 645
    monitor-enter p0

    const/16 v0, 0x27

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 646
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_multiTextureFragmentProgram:Landroid/renderscript/ProgramFragment;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 647
    monitor-exit p0

    return-void

    .line 645
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_overscrollSlots(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 528
    monitor-enter p0

    const/16 v0, 0x1f

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 529
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_overscrollSlots:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    monitor-exit p0

    return-void

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_prefetchCardCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 251
    monitor-enter p0

    const/16 v0, 0xe

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 252
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_prefetchCardCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    monitor-exit p0

    return-void

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_programStoreBackground(Landroid/renderscript/ProgramStore;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 585
    monitor-enter p0

    const/16 v0, 0x23

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 586
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoreBackground:Landroid/renderscript/ProgramStore;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 587
    monitor-exit p0

    return-void

    .line 585
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_programStoreDetail(Landroid/renderscript/ProgramStore;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 600
    monitor-enter p0

    const/16 v0, 0x24

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 601
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoreDetail:Landroid/renderscript/ProgramStore;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 602
    monitor-exit p0

    return-void

    .line 600
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_programStoresCardCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 206
    monitor-enter p0

    const/16 v0, 0xb

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 207
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_programStoresCardCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    monitor-exit p0

    return-void

    .line 206
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_projectionMatrix(Landroid/renderscript/Matrix4f;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 827
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_projectionMatrix:Landroid/renderscript/Matrix4f;

    .line 828
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 829
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p1}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 830
    const/16 v1, 0x33

    invoke-virtual {p0, v1, v0}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 831
    monitor-exit p0

    return-void

    .line 827
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_radius(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 302
    monitor-enter p0

    const/16 v0, 0x11

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 303
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_radius:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    monitor-exit p0

    return-void

    .line 302
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_rasterProgram(Landroid/renderscript/ProgramRaster;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 690
    monitor-enter p0

    const/16 v0, 0x2a

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 691
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rasterProgram:Landroid/renderscript/ProgramRaster;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 692
    monitor-exit p0

    return-void

    .line 690
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_rezInCardCount(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 428
    monitor-enter p0

    const/16 v0, 0x19

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 429
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rezInCardCount:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 430
    monitor-exit p0

    return-void

    .line 428
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_rowCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 477
    monitor-enter p0

    const/16 v0, 0x1c

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 478
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rowCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 479
    monitor-exit p0

    return-void

    .line 477
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_rowSpacing(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 492
    monitor-enter p0

    const/16 v0, 0x1d

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 493
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_rowSpacing:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 494
    monitor-exit p0

    return-void

    .line 492
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_singleTextureBlendingFragmentProgram(Landroid/renderscript/ProgramFragment;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 630
    monitor-enter p0

    const/16 v0, 0x26

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 631
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_singleTextureBlendingFragmentProgram:Landroid/renderscript/ProgramFragment;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 632
    monitor-exit p0

    return-void

    .line 630
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_singleTextureFragmentProgram(Landroid/renderscript/ProgramFragment;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 615
    monitor-enter p0

    const/16 v0, 0x25

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 616
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_singleTextureFragmentProgram:Landroid/renderscript/ProgramFragment;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 617
    monitor-exit p0

    return-void

    .line 615
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_slotCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 176
    monitor-enter p0

    const/16 v0, 0x9

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 177
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_slotCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    monitor-exit p0

    return-void

    .line 176
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_startAngle(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 161
    monitor-enter p0

    const/16 v0, 0x8

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 162
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_startAngle:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    monitor-exit p0

    return-void

    .line 161
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_swaySensitivity(F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 353
    monitor-enter p0

    const/16 v0, 0x14

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(IF)V

    .line 354
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_swaySensitivity:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 355
    monitor-exit p0

    return-void

    .line 353
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_vertexProgram(Landroid/renderscript/ProgramVertex;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 675
    monitor-enter p0

    const/16 v0, 0x29

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(ILandroid/renderscript/BaseObj;)V

    .line 676
    iput-object p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_vertexProgram:Landroid/renderscript/ProgramVertex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 677
    monitor-exit p0

    return-void

    .line 675
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_visibleDetailCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 236
    monitor-enter p0

    const/16 v0, 0xd

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 237
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_visibleDetailCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    monitor-exit p0

    return-void

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set_visibleSlotCount(I)V
    .locals 1
    .parameter "v"

    .prologue
    .line 221
    monitor-enter p0

    const/16 v0, 0xc

    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/android/ex/carousel/ScriptC_carousel;->setVar(II)V

    .line 222
    iput p1, p0, Lcom/android/ex/carousel/ScriptC_carousel;->mExportVar_visibleSlotCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    monitor-exit p0

    return-void

    .line 221
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
