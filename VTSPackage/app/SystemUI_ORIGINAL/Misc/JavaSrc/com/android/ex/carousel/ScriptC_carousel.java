// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.content.Context;
import android.content.res.Resources;
import android.renderscript.*;

// Referenced classes of package com.android.ex.carousel:
//            ScriptField_Card, ScriptField_ProgramStore_s, ScriptField_FragmentShaderConstants_s

public class ScriptC_carousel extends ScriptC
{

    private static final String __rs_resource_name = "carousel";
    public static final boolean const_debugCamera = false;
    public static final boolean const_debugDetails = false;
    public static final boolean const_debugGeometryLoading = false;
    public static final boolean const_debugRays = false;
    public static final boolean const_debugRendering = false;
    public static final boolean const_debugSelection = false;
    public static final boolean const_debugTextureLoading = false;
    private static final int mExportFuncIdx_createCards = 1;
    private static final int mExportFuncIdx_doLongPress = 13;
    private static final int mExportFuncIdx_doMotion = 14;
    private static final int mExportFuncIdx_doStart = 11;
    private static final int mExportFuncIdx_doStop = 12;
    private static final int mExportFuncIdx_invalidateDetailTexture = 6;
    private static final int mExportFuncIdx_invalidateTexture = 5;
    private static final int mExportFuncIdx_lookAt = 2;
    private static final int mExportFuncIdx_setCarouselRotationAngle = 10;
    private static final int mExportFuncIdx_setCarouselRotationAngle2 = 15;
    private static final int mExportFuncIdx_setDetailTexture = 4;
    private static final int mExportFuncIdx_setGeometry = 7;
    private static final int mExportFuncIdx_setMatrix = 8;
    private static final int mExportFuncIdx_setProgramStoresCard = 9;
    private static final int mExportFuncIdx_setRadius = 0;
    private static final int mExportFuncIdx_setTexture = 3;
    private static final int mExportVarIdx_backgroundColor = 27;
    private static final int mExportVarIdx_backgroundTexture = 45;
    private static final int mExportVarIdx_cardCount = 10;
    private static final int mExportVarIdx_cardCreationFadeDuration = 24;
    private static final int mExportVarIdx_cardRotation = 18;
    private static final int mExportVarIdx_cards = 7;
    private static final int mExportVarIdx_cardsFaceTangent = 19;
    private static final int mExportVarIdx_debugCamera = 0;
    private static final int mExportVarIdx_debugDetails = 4;
    private static final int mExportVarIdx_debugGeometryLoading = 3;
    private static final int mExportVarIdx_debugRays = 6;
    private static final int mExportVarIdx_debugRendering = 5;
    private static final int mExportVarIdx_debugSelection = 1;
    private static final int mExportVarIdx_debugTextureLoading = 2;
    private static final int mExportVarIdx_defaultCardMatrix = 50;
    private static final int mExportVarIdx_defaultGeometry = 48;
    private static final int mExportVarIdx_defaultTexture = 43;
    private static final int mExportVarIdx_detailFadeRate = 26;
    private static final int mExportVarIdx_detailLineTexture = 46;
    private static final int mExportVarIdx_detailLoadingTexture = 47;
    private static final int mExportVarIdx_detailTextureAlignment = 15;
    private static final int mExportVarIdx_dragFactor = 22;
    private static final int mExportVarIdx_dragModel = 32;
    private static final int mExportVarIdx_drawRuler = 16;
    private static final int mExportVarIdx_fadeInDuration = 23;
    private static final int mExportVarIdx_fillDirection = 33;
    private static final int mExportVarIdx_firstCardTop = 30;
    private static final int mExportVarIdx_frictionCoeff = 21;
    private static final int mExportVarIdx_linearClamp = 54;
    private static final int mExportVarIdx_loadingGeometry = 49;
    private static final int mExportVarIdx_loadingTexture = 44;
    private static final int mExportVarIdx_modelviewMatrix = 52;
    private static final int mExportVarIdx_multiTextureBlendingFragmentProgram = 40;
    private static final int mExportVarIdx_multiTextureFragmentProgram = 39;
    private static final int mExportVarIdx_overscrollSlots = 31;
    private static final int mExportVarIdx_prefetchCardCount = 14;
    private static final int mExportVarIdx_programStoreBackground = 35;
    private static final int mExportVarIdx_programStoreDetail = 36;
    private static final int mExportVarIdx_programStoresCard = 34;
    private static final int mExportVarIdx_programStoresCardCount = 11;
    private static final int mExportVarIdx_projectionMatrix = 51;
    private static final int mExportVarIdx_radius = 17;
    private static final int mExportVarIdx_rasterProgram = 42;
    private static final int mExportVarIdx_rezInCardCount = 25;
    private static final int mExportVarIdx_rowCount = 28;
    private static final int mExportVarIdx_rowSpacing = 29;
    private static final int mExportVarIdx_shaderConstants = 53;
    private static final int mExportVarIdx_singleTextureBlendingFragmentProgram = 38;
    private static final int mExportVarIdx_singleTextureFragmentProgram = 37;
    private static final int mExportVarIdx_slotCount = 9;
    private static final int mExportVarIdx_startAngle = 8;
    private static final int mExportVarIdx_swaySensitivity = 20;
    private static final int mExportVarIdx_vertexProgram = 41;
    private static final int mExportVarIdx_visibleDetailCount = 13;
    private static final int mExportVarIdx_visibleSlotCount = 12;
    private Element __ALLOCATION;
    private Element __BOOLEAN;
    private Element __F32;
    private Element __F32_4;
    private Element __I32;
    private Element __MESH;
    private Element __PROGRAM_FRAGMENT;
    private Element __PROGRAM_RASTER;
    private Element __PROGRAM_STORE;
    private Element __PROGRAM_VERTEX;
    private Element __SAMPLER;
    private FieldPacker __rs_fp_ALLOCATION;
    private FieldPacker __rs_fp_BOOLEAN;
    private FieldPacker __rs_fp_F32;
    private FieldPacker __rs_fp_F32_4;
    private FieldPacker __rs_fp_I32;
    private FieldPacker __rs_fp_MESH;
    private FieldPacker __rs_fp_PROGRAM_FRAGMENT;
    private FieldPacker __rs_fp_PROGRAM_RASTER;
    private FieldPacker __rs_fp_PROGRAM_STORE;
    private FieldPacker __rs_fp_PROGRAM_VERTEX;
    private FieldPacker __rs_fp_SAMPLER;
    private Float4 mExportVar_backgroundColor;
    private Allocation mExportVar_backgroundTexture;
    private int mExportVar_cardCount;
    private int mExportVar_cardCreationFadeDuration;
    private float mExportVar_cardRotation;
    private ScriptField_Card mExportVar_cards;
    private boolean mExportVar_cardsFaceTangent;
    private boolean mExportVar_debugCamera;
    private boolean mExportVar_debugDetails;
    private boolean mExportVar_debugGeometryLoading;
    private boolean mExportVar_debugRays;
    private boolean mExportVar_debugRendering;
    private boolean mExportVar_debugSelection;
    private boolean mExportVar_debugTextureLoading;
    private Matrix4f mExportVar_defaultCardMatrix;
    private Mesh mExportVar_defaultGeometry;
    private Allocation mExportVar_defaultTexture;
    private float mExportVar_detailFadeRate;
    private Allocation mExportVar_detailLineTexture;
    private Allocation mExportVar_detailLoadingTexture;
    private int mExportVar_detailTextureAlignment;
    private float mExportVar_dragFactor;
    private int mExportVar_dragModel;
    private boolean mExportVar_drawRuler;
    private int mExportVar_fadeInDuration;
    private int mExportVar_fillDirection;
    private boolean mExportVar_firstCardTop;
    private float mExportVar_frictionCoeff;
    private Sampler mExportVar_linearClamp;
    private Mesh mExportVar_loadingGeometry;
    private Allocation mExportVar_loadingTexture;
    private Matrix4f mExportVar_modelviewMatrix;
    private ProgramFragment mExportVar_multiTextureBlendingFragmentProgram;
    private ProgramFragment mExportVar_multiTextureFragmentProgram;
    private float mExportVar_overscrollSlots;
    private int mExportVar_prefetchCardCount;
    private ProgramStore mExportVar_programStoreBackground;
    private ProgramStore mExportVar_programStoreDetail;
    private ScriptField_ProgramStore_s mExportVar_programStoresCard;
    private int mExportVar_programStoresCardCount;
    private Matrix4f mExportVar_projectionMatrix;
    private float mExportVar_radius;
    private ProgramRaster mExportVar_rasterProgram;
    private float mExportVar_rezInCardCount;
    private int mExportVar_rowCount;
    private float mExportVar_rowSpacing;
    private ScriptField_FragmentShaderConstants_s mExportVar_shaderConstants;
    private ProgramFragment mExportVar_singleTextureBlendingFragmentProgram;
    private ProgramFragment mExportVar_singleTextureFragmentProgram;
    private int mExportVar_slotCount;
    private float mExportVar_startAngle;
    private float mExportVar_swaySensitivity;
    private ProgramVertex mExportVar_vertexProgram;
    private int mExportVar_visibleDetailCount;
    private int mExportVar_visibleSlotCount;

    public ScriptC_carousel(RenderScript renderscript)
    {
        this(renderscript, renderscript.getApplicationContext().getResources(), renderscript.getApplicationContext().getResources().getIdentifier("carousel", "raw", renderscript.getApplicationContext().getPackageName()));
    }

    public ScriptC_carousel(RenderScript renderscript, Resources resources, int i)
    {
        super(renderscript, resources, i);
        mExportVar_debugCamera = false;
        __BOOLEAN = Element.BOOLEAN(renderscript);
        mExportVar_debugSelection = false;
        mExportVar_debugTextureLoading = false;
        mExportVar_debugGeometryLoading = false;
        mExportVar_debugDetails = false;
        mExportVar_debugRendering = false;
        mExportVar_debugRays = false;
        __F32 = Element.F32(renderscript);
        __I32 = Element.I32(renderscript);
        __F32_4 = Element.F32_4(renderscript);
        mExportVar_dragModel = 0;
        __PROGRAM_STORE = Element.PROGRAM_STORE(renderscript);
        __PROGRAM_FRAGMENT = Element.PROGRAM_FRAGMENT(renderscript);
        __PROGRAM_VERTEX = Element.PROGRAM_VERTEX(renderscript);
        __PROGRAM_RASTER = Element.PROGRAM_RASTER(renderscript);
        __ALLOCATION = Element.ALLOCATION(renderscript);
        __MESH = Element.MESH(renderscript);
        __SAMPLER = Element.SAMPLER(renderscript);
    }

    public void bind_cards(ScriptField_Card scriptfield_card)
    {
        mExportVar_cards = scriptfield_card;
        if (scriptfield_card == null)
        {
            bindAllocation(null, 7);
            return;
        } else
        {
            bindAllocation(scriptfield_card.getAllocation(), 7);
            return;
        }
    }

    public void bind_programStoresCard(ScriptField_ProgramStore_s scriptfield_programstore_s)
    {
        mExportVar_programStoresCard = scriptfield_programstore_s;
        if (scriptfield_programstore_s == null)
        {
            bindAllocation(null, 34);
            return;
        } else
        {
            bindAllocation(scriptfield_programstore_s.getAllocation(), 34);
            return;
        }
    }

    public void bind_shaderConstants(ScriptField_FragmentShaderConstants_s scriptfield_fragmentshaderconstants_s)
    {
        mExportVar_shaderConstants = scriptfield_fragmentshaderconstants_s;
        if (scriptfield_fragmentshaderconstants_s == null)
        {
            bindAllocation(null, 53);
            return;
        } else
        {
            bindAllocation(scriptfield_fragmentshaderconstants_s.getAllocation(), 53);
            return;
        }
    }

    public android.renderscript.Script.FieldID getFieldID_backgroundColor()
    {
        return createFieldID(27, null);
    }

    public android.renderscript.Script.FieldID getFieldID_backgroundTexture()
    {
        return createFieldID(45, null);
    }

    public android.renderscript.Script.FieldID getFieldID_cardCount()
    {
        return createFieldID(10, null);
    }

    public android.renderscript.Script.FieldID getFieldID_cardCreationFadeDuration()
    {
        return createFieldID(24, null);
    }

    public android.renderscript.Script.FieldID getFieldID_cardRotation()
    {
        return createFieldID(18, null);
    }

    public android.renderscript.Script.FieldID getFieldID_cardsFaceTangent()
    {
        return createFieldID(19, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugCamera()
    {
        return createFieldID(0, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugDetails()
    {
        return createFieldID(4, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugGeometryLoading()
    {
        return createFieldID(3, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugRays()
    {
        return createFieldID(6, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugRendering()
    {
        return createFieldID(5, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugSelection()
    {
        return createFieldID(1, null);
    }

    public android.renderscript.Script.FieldID getFieldID_debugTextureLoading()
    {
        return createFieldID(2, null);
    }

    public android.renderscript.Script.FieldID getFieldID_defaultCardMatrix()
    {
        return createFieldID(50, null);
    }

    public android.renderscript.Script.FieldID getFieldID_defaultGeometry()
    {
        return createFieldID(48, null);
    }

    public android.renderscript.Script.FieldID getFieldID_defaultTexture()
    {
        return createFieldID(43, null);
    }

    public android.renderscript.Script.FieldID getFieldID_detailFadeRate()
    {
        return createFieldID(26, null);
    }

    public android.renderscript.Script.FieldID getFieldID_detailLineTexture()
    {
        return createFieldID(46, null);
    }

    public android.renderscript.Script.FieldID getFieldID_detailLoadingTexture()
    {
        return createFieldID(47, null);
    }

    public android.renderscript.Script.FieldID getFieldID_detailTextureAlignment()
    {
        return createFieldID(15, null);
    }

    public android.renderscript.Script.FieldID getFieldID_dragFactor()
    {
        return createFieldID(22, null);
    }

    public android.renderscript.Script.FieldID getFieldID_dragModel()
    {
        return createFieldID(32, null);
    }

    public android.renderscript.Script.FieldID getFieldID_drawRuler()
    {
        return createFieldID(16, null);
    }

    public android.renderscript.Script.FieldID getFieldID_fadeInDuration()
    {
        return createFieldID(23, null);
    }

    public android.renderscript.Script.FieldID getFieldID_fillDirection()
    {
        return createFieldID(33, null);
    }

    public android.renderscript.Script.FieldID getFieldID_firstCardTop()
    {
        return createFieldID(30, null);
    }

    public android.renderscript.Script.FieldID getFieldID_frictionCoeff()
    {
        return createFieldID(21, null);
    }

    public android.renderscript.Script.FieldID getFieldID_linearClamp()
    {
        return createFieldID(54, null);
    }

    public android.renderscript.Script.FieldID getFieldID_loadingGeometry()
    {
        return createFieldID(49, null);
    }

    public android.renderscript.Script.FieldID getFieldID_loadingTexture()
    {
        return createFieldID(44, null);
    }

    public android.renderscript.Script.FieldID getFieldID_modelviewMatrix()
    {
        return createFieldID(52, null);
    }

    public android.renderscript.Script.FieldID getFieldID_multiTextureBlendingFragmentProgram()
    {
        return createFieldID(40, null);
    }

    public android.renderscript.Script.FieldID getFieldID_multiTextureFragmentProgram()
    {
        return createFieldID(39, null);
    }

    public android.renderscript.Script.FieldID getFieldID_overscrollSlots()
    {
        return createFieldID(31, null);
    }

    public android.renderscript.Script.FieldID getFieldID_prefetchCardCount()
    {
        return createFieldID(14, null);
    }

    public android.renderscript.Script.FieldID getFieldID_programStoreBackground()
    {
        return createFieldID(35, null);
    }

    public android.renderscript.Script.FieldID getFieldID_programStoreDetail()
    {
        return createFieldID(36, null);
    }

    public android.renderscript.Script.FieldID getFieldID_programStoresCardCount()
    {
        return createFieldID(11, null);
    }

    public android.renderscript.Script.FieldID getFieldID_projectionMatrix()
    {
        return createFieldID(51, null);
    }

    public android.renderscript.Script.FieldID getFieldID_radius()
    {
        return createFieldID(17, null);
    }

    public android.renderscript.Script.FieldID getFieldID_rasterProgram()
    {
        return createFieldID(42, null);
    }

    public android.renderscript.Script.FieldID getFieldID_rezInCardCount()
    {
        return createFieldID(25, null);
    }

    public android.renderscript.Script.FieldID getFieldID_rowCount()
    {
        return createFieldID(28, null);
    }

    public android.renderscript.Script.FieldID getFieldID_rowSpacing()
    {
        return createFieldID(29, null);
    }

    public android.renderscript.Script.FieldID getFieldID_singleTextureBlendingFragmentProgram()
    {
        return createFieldID(38, null);
    }

    public android.renderscript.Script.FieldID getFieldID_singleTextureFragmentProgram()
    {
        return createFieldID(37, null);
    }

    public android.renderscript.Script.FieldID getFieldID_slotCount()
    {
        return createFieldID(9, null);
    }

    public android.renderscript.Script.FieldID getFieldID_startAngle()
    {
        return createFieldID(8, null);
    }

    public android.renderscript.Script.FieldID getFieldID_swaySensitivity()
    {
        return createFieldID(20, null);
    }

    public android.renderscript.Script.FieldID getFieldID_vertexProgram()
    {
        return createFieldID(41, null);
    }

    public android.renderscript.Script.FieldID getFieldID_visibleDetailCount()
    {
        return createFieldID(13, null);
    }

    public android.renderscript.Script.FieldID getFieldID_visibleSlotCount()
    {
        return createFieldID(12, null);
    }

    public Float4 get_backgroundColor()
    {
        return mExportVar_backgroundColor;
    }

    public Allocation get_backgroundTexture()
    {
        return mExportVar_backgroundTexture;
    }

    public int get_cardCount()
    {
        return mExportVar_cardCount;
    }

    public int get_cardCreationFadeDuration()
    {
        return mExportVar_cardCreationFadeDuration;
    }

    public float get_cardRotation()
    {
        return mExportVar_cardRotation;
    }

    public ScriptField_Card get_cards()
    {
        return mExportVar_cards;
    }

    public boolean get_cardsFaceTangent()
    {
        return mExportVar_cardsFaceTangent;
    }

    public boolean get_debugCamera()
    {
        return mExportVar_debugCamera;
    }

    public boolean get_debugDetails()
    {
        return mExportVar_debugDetails;
    }

    public boolean get_debugGeometryLoading()
    {
        return mExportVar_debugGeometryLoading;
    }

    public boolean get_debugRays()
    {
        return mExportVar_debugRays;
    }

    public boolean get_debugRendering()
    {
        return mExportVar_debugRendering;
    }

    public boolean get_debugSelection()
    {
        return mExportVar_debugSelection;
    }

    public boolean get_debugTextureLoading()
    {
        return mExportVar_debugTextureLoading;
    }

    public Matrix4f get_defaultCardMatrix()
    {
        return mExportVar_defaultCardMatrix;
    }

    public Mesh get_defaultGeometry()
    {
        return mExportVar_defaultGeometry;
    }

    public Allocation get_defaultTexture()
    {
        return mExportVar_defaultTexture;
    }

    public float get_detailFadeRate()
    {
        return mExportVar_detailFadeRate;
    }

    public Allocation get_detailLineTexture()
    {
        return mExportVar_detailLineTexture;
    }

    public Allocation get_detailLoadingTexture()
    {
        return mExportVar_detailLoadingTexture;
    }

    public int get_detailTextureAlignment()
    {
        return mExportVar_detailTextureAlignment;
    }

    public float get_dragFactor()
    {
        return mExportVar_dragFactor;
    }

    public int get_dragModel()
    {
        return mExportVar_dragModel;
    }

    public boolean get_drawRuler()
    {
        return mExportVar_drawRuler;
    }

    public int get_fadeInDuration()
    {
        return mExportVar_fadeInDuration;
    }

    public int get_fillDirection()
    {
        return mExportVar_fillDirection;
    }

    public boolean get_firstCardTop()
    {
        return mExportVar_firstCardTop;
    }

    public float get_frictionCoeff()
    {
        return mExportVar_frictionCoeff;
    }

    public Sampler get_linearClamp()
    {
        return mExportVar_linearClamp;
    }

    public Mesh get_loadingGeometry()
    {
        return mExportVar_loadingGeometry;
    }

    public Allocation get_loadingTexture()
    {
        return mExportVar_loadingTexture;
    }

    public Matrix4f get_modelviewMatrix()
    {
        return mExportVar_modelviewMatrix;
    }

    public ProgramFragment get_multiTextureBlendingFragmentProgram()
    {
        return mExportVar_multiTextureBlendingFragmentProgram;
    }

    public ProgramFragment get_multiTextureFragmentProgram()
    {
        return mExportVar_multiTextureFragmentProgram;
    }

    public float get_overscrollSlots()
    {
        return mExportVar_overscrollSlots;
    }

    public int get_prefetchCardCount()
    {
        return mExportVar_prefetchCardCount;
    }

    public ProgramStore get_programStoreBackground()
    {
        return mExportVar_programStoreBackground;
    }

    public ProgramStore get_programStoreDetail()
    {
        return mExportVar_programStoreDetail;
    }

    public ScriptField_ProgramStore_s get_programStoresCard()
    {
        return mExportVar_programStoresCard;
    }

    public int get_programStoresCardCount()
    {
        return mExportVar_programStoresCardCount;
    }

    public Matrix4f get_projectionMatrix()
    {
        return mExportVar_projectionMatrix;
    }

    public float get_radius()
    {
        return mExportVar_radius;
    }

    public ProgramRaster get_rasterProgram()
    {
        return mExportVar_rasterProgram;
    }

    public float get_rezInCardCount()
    {
        return mExportVar_rezInCardCount;
    }

    public int get_rowCount()
    {
        return mExportVar_rowCount;
    }

    public float get_rowSpacing()
    {
        return mExportVar_rowSpacing;
    }

    public ScriptField_FragmentShaderConstants_s get_shaderConstants()
    {
        return mExportVar_shaderConstants;
    }

    public ProgramFragment get_singleTextureBlendingFragmentProgram()
    {
        return mExportVar_singleTextureBlendingFragmentProgram;
    }

    public ProgramFragment get_singleTextureFragmentProgram()
    {
        return mExportVar_singleTextureFragmentProgram;
    }

    public int get_slotCount()
    {
        return mExportVar_slotCount;
    }

    public float get_startAngle()
    {
        return mExportVar_startAngle;
    }

    public float get_swaySensitivity()
    {
        return mExportVar_swaySensitivity;
    }

    public ProgramVertex get_vertexProgram()
    {
        return mExportVar_vertexProgram;
    }

    public int get_visibleDetailCount()
    {
        return mExportVar_visibleDetailCount;
    }

    public int get_visibleSlotCount()
    {
        return mExportVar_visibleSlotCount;
    }

    public void invoke_createCards(int i, int j)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addI32(j);
        invoke(1, fieldpacker);
    }

    public void invoke_doLongPress()
    {
        invoke(13);
    }

    public void invoke_doMotion(float f, float f1, long l)
    {
        FieldPacker fieldpacker = new FieldPacker(16);
        fieldpacker.addF32(f);
        fieldpacker.addF32(f1);
        fieldpacker.addI64(l);
        invoke(14, fieldpacker);
    }

    public void invoke_doStart(float f, float f1, long l)
    {
        FieldPacker fieldpacker = new FieldPacker(16);
        fieldpacker.addF32(f);
        fieldpacker.addF32(f1);
        fieldpacker.addI64(l);
        invoke(11, fieldpacker);
    }

    public void invoke_doStop(float f, float f1, long l)
    {
        FieldPacker fieldpacker = new FieldPacker(16);
        fieldpacker.addF32(f);
        fieldpacker.addF32(f1);
        fieldpacker.addI64(l);
        invoke(12, fieldpacker);
    }

    public void invoke_invalidateDetailTexture(int i, boolean flag)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addBoolean(flag);
        fieldpacker.skip(3);
        invoke(6, fieldpacker);
    }

    public void invoke_invalidateTexture(int i, boolean flag)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addBoolean(flag);
        fieldpacker.skip(3);
        invoke(5, fieldpacker);
    }

    public void invoke_lookAt(float f, float f1, float f2, float f3, float f4, float f5, float f6, 
            float f7, float f8)
    {
        FieldPacker fieldpacker = new FieldPacker(36);
        fieldpacker.addF32(f);
        fieldpacker.addF32(f1);
        fieldpacker.addF32(f2);
        fieldpacker.addF32(f3);
        fieldpacker.addF32(f4);
        fieldpacker.addF32(f5);
        fieldpacker.addF32(f6);
        fieldpacker.addF32(f7);
        fieldpacker.addF32(f8);
        invoke(2, fieldpacker);
    }

    public void invoke_setCarouselRotationAngle(float f)
    {
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addF32(f);
        invoke(10, fieldpacker);
    }

    public void invoke_setCarouselRotationAngle2(float f, int i, int j, float f1)
    {
        FieldPacker fieldpacker = new FieldPacker(16);
        fieldpacker.addF32(f);
        fieldpacker.addI32(i);
        fieldpacker.addI32(j);
        fieldpacker.addF32(f1);
        invoke(15, fieldpacker);
    }

    public void invoke_setDetailTexture(int i, float f, float f1, float f2, float f3, Allocation allocation)
    {
        FieldPacker fieldpacker = new FieldPacker(24);
        fieldpacker.addI32(i);
        fieldpacker.addF32(f);
        fieldpacker.addF32(f1);
        fieldpacker.addF32(f2);
        fieldpacker.addF32(f3);
        fieldpacker.addObj(allocation);
        invoke(4, fieldpacker);
    }

    public void invoke_setGeometry(int i, Mesh mesh)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addObj(mesh);
        invoke(7, fieldpacker);
    }

    public void invoke_setMatrix(int i, Matrix4f matrix4f)
    {
        FieldPacker fieldpacker = new FieldPacker(68);
        fieldpacker.addI32(i);
        fieldpacker.addMatrix(matrix4f);
        invoke(8, fieldpacker);
    }

    public void invoke_setProgramStoresCard(int i, ProgramStore programstore)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addObj(programstore);
        invoke(9, fieldpacker);
    }

    public void invoke_setRadius(float f)
    {
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addF32(f);
        invoke(0, fieldpacker);
    }

    public void invoke_setTexture(int i, Allocation allocation)
    {
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI32(i);
        fieldpacker.addObj(allocation);
        invoke(3, fieldpacker);
    }

    public void set_backgroundColor(Float4 float4)
    {
        this;
        JVM INSTR monitorenter ;
        mExportVar_backgroundColor = float4;
        FieldPacker fieldpacker = new FieldPacker(16);
        fieldpacker.addF32(float4);
        int ai[] = {
            4
        };
        setVar(27, fieldpacker, __F32_4, ai);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_backgroundTexture(Allocation allocation)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(45, allocation);
        mExportVar_backgroundTexture = allocation;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_cardCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(10, i);
        mExportVar_cardCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_cardCreationFadeDuration(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(24, i);
        mExportVar_cardCreationFadeDuration = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_cardRotation(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(18, f);
        mExportVar_cardRotation = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_cardsFaceTangent(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (__rs_fp_BOOLEAN == null)
            break MISSING_BLOCK_LABEL_42;
        __rs_fp_BOOLEAN.reset();
_L1:
        __rs_fp_BOOLEAN.addBoolean(flag);
        setVar(19, __rs_fp_BOOLEAN);
        mExportVar_cardsFaceTangent = flag;
        this;
        JVM INSTR monitorexit ;
        return;
        __rs_fp_BOOLEAN = new FieldPacker(1);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void set_defaultCardMatrix(Matrix4f matrix4f)
    {
        this;
        JVM INSTR monitorenter ;
        mExportVar_defaultCardMatrix = matrix4f;
        FieldPacker fieldpacker = new FieldPacker(64);
        fieldpacker.addMatrix(matrix4f);
        setVar(50, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_defaultGeometry(Mesh mesh)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(48, mesh);
        mExportVar_defaultGeometry = mesh;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_defaultTexture(Allocation allocation)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(43, allocation);
        mExportVar_defaultTexture = allocation;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailFadeRate(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(26, f);
        mExportVar_detailFadeRate = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailLineTexture(Allocation allocation)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(46, allocation);
        mExportVar_detailLineTexture = allocation;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailLoadingTexture(Allocation allocation)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(47, allocation);
        mExportVar_detailLoadingTexture = allocation;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTextureAlignment(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(15, i);
        mExportVar_detailTextureAlignment = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_dragFactor(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(22, f);
        mExportVar_dragFactor = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_dragModel(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(32, i);
        mExportVar_dragModel = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_drawRuler(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (__rs_fp_BOOLEAN == null)
            break MISSING_BLOCK_LABEL_42;
        __rs_fp_BOOLEAN.reset();
_L1:
        __rs_fp_BOOLEAN.addBoolean(flag);
        setVar(16, __rs_fp_BOOLEAN);
        mExportVar_drawRuler = flag;
        this;
        JVM INSTR monitorexit ;
        return;
        __rs_fp_BOOLEAN = new FieldPacker(1);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void set_fadeInDuration(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(23, i);
        mExportVar_fadeInDuration = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_fillDirection(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(33, i);
        mExportVar_fillDirection = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_firstCardTop(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (__rs_fp_BOOLEAN == null)
            break MISSING_BLOCK_LABEL_42;
        __rs_fp_BOOLEAN.reset();
_L1:
        __rs_fp_BOOLEAN.addBoolean(flag);
        setVar(30, __rs_fp_BOOLEAN);
        mExportVar_firstCardTop = flag;
        this;
        JVM INSTR monitorexit ;
        return;
        __rs_fp_BOOLEAN = new FieldPacker(1);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public void set_frictionCoeff(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(21, f);
        mExportVar_frictionCoeff = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_linearClamp(Sampler sampler)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(54, sampler);
        mExportVar_linearClamp = sampler;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_loadingGeometry(Mesh mesh)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(49, mesh);
        mExportVar_loadingGeometry = mesh;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_loadingTexture(Allocation allocation)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(44, allocation);
        mExportVar_loadingTexture = allocation;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_modelviewMatrix(Matrix4f matrix4f)
    {
        this;
        JVM INSTR monitorenter ;
        mExportVar_modelviewMatrix = matrix4f;
        FieldPacker fieldpacker = new FieldPacker(64);
        fieldpacker.addMatrix(matrix4f);
        setVar(52, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_multiTextureBlendingFragmentProgram(ProgramFragment programfragment)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(40, programfragment);
        mExportVar_multiTextureBlendingFragmentProgram = programfragment;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_multiTextureFragmentProgram(ProgramFragment programfragment)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(39, programfragment);
        mExportVar_multiTextureFragmentProgram = programfragment;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_overscrollSlots(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(31, f);
        mExportVar_overscrollSlots = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_prefetchCardCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(14, i);
        mExportVar_prefetchCardCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_programStoreBackground(ProgramStore programstore)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(35, programstore);
        mExportVar_programStoreBackground = programstore;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_programStoreDetail(ProgramStore programstore)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(36, programstore);
        mExportVar_programStoreDetail = programstore;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_programStoresCardCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(11, i);
        mExportVar_programStoresCardCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_projectionMatrix(Matrix4f matrix4f)
    {
        this;
        JVM INSTR monitorenter ;
        mExportVar_projectionMatrix = matrix4f;
        FieldPacker fieldpacker = new FieldPacker(64);
        fieldpacker.addMatrix(matrix4f);
        setVar(51, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_radius(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(17, f);
        mExportVar_radius = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_rasterProgram(ProgramRaster programraster)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(42, programraster);
        mExportVar_rasterProgram = programraster;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_rezInCardCount(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(25, f);
        mExportVar_rezInCardCount = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_rowCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(28, i);
        mExportVar_rowCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_rowSpacing(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(29, f);
        mExportVar_rowSpacing = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_singleTextureBlendingFragmentProgram(ProgramFragment programfragment)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(38, programfragment);
        mExportVar_singleTextureBlendingFragmentProgram = programfragment;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_singleTextureFragmentProgram(ProgramFragment programfragment)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(37, programfragment);
        mExportVar_singleTextureFragmentProgram = programfragment;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_slotCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(9, i);
        mExportVar_slotCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_startAngle(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(8, f);
        mExportVar_startAngle = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_swaySensitivity(float f)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(20, f);
        mExportVar_swaySensitivity = f;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_vertexProgram(ProgramVertex programvertex)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(41, programvertex);
        mExportVar_vertexProgram = programvertex;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_visibleDetailCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(13, i);
        mExportVar_visibleDetailCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_visibleSlotCount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setVar(12, i);
        mExportVar_visibleSlotCount = i;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
