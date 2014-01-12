// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.renderscript.*;
import android.util.Log;

// Referenced classes of package com.android.ex.carousel:
//            ScriptC_carousel, ScriptField_Card, ScriptField_FragmentShaderConstants_s, ScriptField_ProgramStore_s

public class CarouselRS
{
    public static interface CarouselCallback
    {

        public abstract void onAnimationFinished(float f);

        public abstract void onAnimationStarted();

        public abstract void onCardLongPress(int i, int ai[], Rect rect);

        public abstract void onCardSelected(int i);

        public abstract void onDetailSelected(int i, int j, int k);

        public abstract void onInvalidateDetailTexture(int i);

        public abstract void onInvalidateGeometry(int i);

        public abstract void onInvalidateTexture(int i);

        public abstract void onRequestDetailTexture(int i);

        public abstract void onRequestGeometry(int i);

        public abstract void onRequestTexture(int i);
    }


    public static final int CMD_ANIMATION_FINISHED = 500;
    public static final int CMD_ANIMATION_STARTED = 400;
    public static final int CMD_CARD_LONGPRESS = 110;
    public static final int CMD_CARD_SELECTED = 100;
    public static final int CMD_DETAIL_SELECTED = 105;
    public static final int CMD_INVALIDATE_DETAIL_TEXTURE = 610;
    public static final int CMD_INVALIDATE_GEOMETRY = 310;
    public static final int CMD_INVALIDATE_TEXTURE = 210;
    public static final int CMD_PING = 1000;
    public static final int CMD_REQUEST_DETAIL_TEXTURE = 600;
    public static final int CMD_REQUEST_GEOMETRY = 300;
    public static final int CMD_REQUEST_TEXTURE = 200;
    private static final boolean DBG = false;
    private static final int DEFAULT_CARD_COUNT = 0;
    private static final int DEFAULT_ROW_COUNT = 1;
    private static final int DEFAULT_SLOT_COUNT = 10;
    private static final int DEFAULT_VISIBLE_SLOTS = 1;
    public static final int DRAG_MODEL_CYLINDER_INSIDE = 2;
    public static final int DRAG_MODEL_CYLINDER_OUTSIDE = 3;
    public static final int DRAG_MODEL_PLANE = 1;
    public static final int DRAG_MODEL_SCREEN_DELTA = 0;
    public static final int FILL_DIRECTION_CCW = 1;
    public static final int FILL_DIRECTION_CW = -1;
    private static final android.renderscript.Allocation.MipmapControl MIPMAP;
    private static final String TAG = "CarouselRS";
    private static final String mMultiTextureBlendingShader = new String("varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);vec4 col2 = texture2D(UNI_Tex1, t0);gl_FragColor = mix(col, col2, UNI_fadeAmount) * UNI_overallAlpha;}");
    private static final String mMultiTextureShader = new String("varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);vec4 col2 = texture2D(UNI_Tex1, t0);gl_FragColor = mix(col, col2, UNI_fadeAmount);}");
    private static final String mSingleTextureBlendingShader = new String("varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);gl_FragColor = col * UNI_overallAlpha; }");
    private static final String mSingleTextureShader = new String("varying vec2 varTex0;void main() {vec2 t0 = varTex0.xy;vec4 col = texture2D(UNI_Tex0, t0);gl_FragColor = col; }");
    private Allocation mAllocationPool[];
    private float mAtPoint[] = {
        0.0F, 0.0F, 0.0F
    };
    private CarouselCallback mCallback;
    private ScriptField_Card mCards;
    private float mEyePoint[] = {
        2.0F, 0.0F, 0.0F
    };
    private ScriptField_FragmentShaderConstants_s mFSConst;
    private boolean mForceBlendCardsWithZ;
    private ProgramFragment mMultiTextureBlendingFragmentProgram;
    private ProgramFragment mMultiTextureFragmentProgram;
    private int mPrefetchCardCount;
    private ScriptField_ProgramStore_s mProgramStoresCard;
    private RenderScriptGL mRS;
    private ProgramRaster mRasterProgram;
    private Resources mRes;
    private int mRowCount;
    private android.renderscript.RenderScript.RSMessageHandler mRsMessage;
    private ScriptC_carousel mScript;
    private ProgramFragment mSingleTextureBlendingFragmentProgram;
    private ProgramFragment mSingleTextureFragmentProgram;
    private float mUp[] = {
        0.0F, 1.0F, 0.0F
    };
    private ProgramVertex mVertexProgram;
    private int mVisibleSlots;

    public CarouselRS(RenderScriptGL renderscriptgl, Resources resources, int i)
    {
        mRsMessage = new android.renderscript.RenderScript.RSMessageHandler() {

            final CarouselRS this$0;

            public void run()
            {
                if (mCallback != null)
                    switch (mID)
                    {
                    case 500: 
                        mCallback.onAnimationFinished(Float.intBitsToFloat(mData[0]));
                        return;

                    case 400: 
                        mCallback.onAnimationStarted();
                        return;

                    case 310: 
                        setGeometry(mData[0], null);
                        mCallback.onInvalidateGeometry(mData[0]);
                        return;

                    case 300: 
                        mCallback.onRequestGeometry(mData[0]);
                        return;

                    case 610: 
                        setDetailTexture(mData[0], 0.0F, 0.0F, 0.0F, 0.0F, null);
                        mCallback.onInvalidateDetailTexture(mData[0]);
                        return;

                    case 600: 
                        mCallback.onRequestDetailTexture(mData[0]);
                        return;

                    case 210: 
                        setTexture(mData[0], null);
                        mCallback.onInvalidateTexture(mData[0]);
                        return;

                    case 200: 
                        mCallback.onRequestTexture(mData[0]);
                        return;

                    case 110: // 'n'
                        int ai[] = new int[2];
                        ai[0] = mData[1];
                        ai[1] = mData[2];
                        Rect rect = new Rect(mData[3], mData[4], mData[5], mData[6]);
                        mCallback.onCardLongPress(mData[0], ai, rect);
                        return;

                    case 105: // 'i'
                        mCallback.onDetailSelected(mData[0], mData[1], mData[2]);
                        return;

                    case 100: // 'd'
                        mCallback.onCardSelected(mData[0]);
                        return;

                    default:
                        Log.e("CarouselRS", (new StringBuilder()).append("Unknown RSMessage: ").append(mID).toString());
                        return;

                    case 1000: 
                        break;
                    }
            }

            
            {
                this$0 = CarouselRS.this;
                super();
            }
        }
;
        mRS = renderscriptgl;
        mRes = resources;
        mScript = new ScriptC_carousel(mRS, mRes, i);
        mRS.setMessageHandler(mRsMessage);
        initProgramStore();
        initFragmentProgram();
        initRasterProgram();
        initVertexProgram();
        setSlotCount(10);
        setVisibleSlots(1);
        setRowCount(1);
        createCards(0);
        setStartAngle(0.0F);
        setCarouselRotationAngle(0.0F);
        setRadius(1.0F);
        setLookAt(mEyePoint, mAtPoint, mUp);
        setRadius(20F);
    }

    private Allocation allocationFromBitmap(Bitmap bitmap, android.renderscript.Allocation.MipmapControl mipmapcontrol)
    {
        if (bitmap == null)
            return null;
        else
            return Allocation.createFromBitmap(mRS, bitmap, mipmapcontrol, 2);
    }

    private Allocation allocationFromPool(int i, Bitmap bitmap, android.renderscript.Allocation.MipmapControl mipmapcontrol)
    {
        int j = (mVisibleSlots + 2 * mPrefetchCardCount) * mRowCount;
        if (mAllocationPool == null || mAllocationPool.length != j)
        {
            Allocation aallocation[] = new Allocation[j];
            int k;
            if (mAllocationPool == null)
                k = 0;
            else
                k = mAllocationPool.length;
            for (int l = 0; l < Math.min(j, k); l++)
                aallocation[l] = mAllocationPool[l];

            mAllocationPool = aallocation;
        }
        Allocation allocation = mAllocationPool[i % j];
        if (allocation == null)
        {
            allocation = allocationFromBitmap(bitmap, mipmapcontrol);
            mAllocationPool[i % j] = allocation;
        } else
        if (bitmap != null)
            if (bitmap.getWidth() == allocation.getType().getX() && bitmap.getHeight() == allocation.getType().getY())
            {
                allocation.copyFrom(bitmap);
                return allocation;
            } else
            {
                Log.v("CarouselRS", "Warning, bitmap has different size. Taking slow path");
                Allocation allocation1 = allocationFromBitmap(bitmap, mipmapcontrol);
                mAllocationPool[i % j] = allocation1;
                return allocation1;
            }
        return allocation;
    }

    private Element elementForBitmap(Bitmap bitmap, android.graphics.Bitmap.Config config)
    {
        android.graphics.Bitmap.Config config1 = bitmap.getConfig();
        if (config1 == null)
            config1 = config;
        if (config1 == android.graphics.Bitmap.Config.ALPHA_8)
            return Element.A_8(mRS);
        if (config1 == android.graphics.Bitmap.Config.RGB_565)
            return Element.RGB_565(mRS);
        if (config1 == android.graphics.Bitmap.Config.ARGB_4444)
            return Element.RGBA_4444(mRS);
        if (config1 == android.graphics.Bitmap.Config.ARGB_8888)
            return Element.RGBA_8888(mRS);
        else
            throw new IllegalArgumentException("Unknown configuration");
    }

    private ScriptField_Card.Item getCard(int i)
    {
        ScriptField_Card.Item item;
        try
        {
            item = mCards.get(i);
        }
        catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
        {
            return null;
        }
        return item;
    }

    private ScriptField_Card.Item getOrCreateCard(int i)
    {
        ScriptField_Card.Item item = getCard(i);
        if (item == null)
            item = new ScriptField_Card.Item();
        return item;
    }

    private void initFragmentProgram()
    {
        android.renderscript.ProgramFragment.Builder builder = new android.renderscript.ProgramFragment.Builder(mRS);
        builder.setShader(mSingleTextureShader);
        builder.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        mSingleTextureFragmentProgram = builder.create();
        mSingleTextureFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 0);
        mFSConst = new ScriptField_FragmentShaderConstants_s(mRS, 1);
        mScript.bind_shaderConstants(mFSConst);
        android.renderscript.ProgramFragment.Builder builder1 = new android.renderscript.ProgramFragment.Builder(mRS);
        builder1.setShader(mSingleTextureBlendingShader);
        builder1.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        builder1.addConstant(mFSConst.getAllocation().getType());
        mSingleTextureBlendingFragmentProgram = builder1.create();
        mSingleTextureBlendingFragmentProgram.bindConstants(mFSConst.getAllocation(), 0);
        mSingleTextureBlendingFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 0);
        android.renderscript.ProgramFragment.Builder builder2 = new android.renderscript.ProgramFragment.Builder(mRS);
        builder2.setShader(mMultiTextureShader);
        builder2.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        builder2.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        builder2.addConstant(mFSConst.getAllocation().getType());
        mMultiTextureFragmentProgram = builder2.create();
        mMultiTextureFragmentProgram.bindConstants(mFSConst.getAllocation(), 0);
        mMultiTextureFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 0);
        mMultiTextureFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 1);
        android.renderscript.ProgramFragment.Builder builder3 = new android.renderscript.ProgramFragment.Builder(mRS);
        builder3.setShader(mMultiTextureBlendingShader);
        builder3.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        builder3.addTexture(android.renderscript.Program.TextureType.TEXTURE_2D);
        builder3.addConstant(mFSConst.getAllocation().getType());
        mMultiTextureBlendingFragmentProgram = builder3.create();
        mMultiTextureBlendingFragmentProgram.bindConstants(mFSConst.getAllocation(), 0);
        mMultiTextureBlendingFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 0);
        mMultiTextureBlendingFragmentProgram.bindSampler(Sampler.CLAMP_LINEAR(mRS), 1);
        mScript.set_linearClamp(Sampler.CLAMP_LINEAR(mRS));
        mScript.set_singleTextureFragmentProgram(mSingleTextureFragmentProgram);
        mScript.set_singleTextureBlendingFragmentProgram(mSingleTextureBlendingFragmentProgram);
        mScript.set_multiTextureFragmentProgram(mMultiTextureFragmentProgram);
        mScript.set_multiTextureBlendingFragmentProgram(mMultiTextureBlendingFragmentProgram);
    }

    private void initProgramStore()
    {
        resizeProgramStoresCard(1);
        android.renderscript.ProgramStore.DepthFunc depthfunc;
        if (mForceBlendCardsWithZ)
            depthfunc = android.renderscript.ProgramStore.DepthFunc.LESS;
        else
            depthfunc = android.renderscript.ProgramStore.DepthFunc.ALWAYS;
        mScript.set_programStoreBackground((new android.renderscript.ProgramStore.Builder(mRS)).setBlendFunc(android.renderscript.ProgramStore.BlendSrcFunc.ONE, android.renderscript.ProgramStore.BlendDstFunc.ZERO).setDitherEnabled(true).setDepthFunc(depthfunc).setDepthMaskEnabled(mForceBlendCardsWithZ).create());
        setProgramStoreCard(0, (new android.renderscript.ProgramStore.Builder(mRS)).setBlendFunc(android.renderscript.ProgramStore.BlendSrcFunc.ONE, android.renderscript.ProgramStore.BlendDstFunc.ONE_MINUS_SRC_ALPHA).setDitherEnabled(true).setDepthFunc(depthfunc).setDepthMaskEnabled(mForceBlendCardsWithZ).create());
        mScript.set_programStoreDetail((new android.renderscript.ProgramStore.Builder(mRS)).setBlendFunc(android.renderscript.ProgramStore.BlendSrcFunc.ONE, android.renderscript.ProgramStore.BlendDstFunc.ONE_MINUS_SRC_ALPHA).setDitherEnabled(true).setDepthFunc(android.renderscript.ProgramStore.DepthFunc.ALWAYS).setDepthMaskEnabled(false).create());
    }

    private void initRasterProgram()
    {
        mRasterProgram = (new android.renderscript.ProgramRaster.Builder(mRS)).create();
        mScript.set_rasterProgram(mRasterProgram);
    }

    private void initVertexProgram()
    {
        mVertexProgram = (new android.renderscript.ProgramVertexFixedFunction.Builder(mRS)).create();
        android.renderscript.ProgramVertexFixedFunction.Constants constants = new android.renderscript.ProgramVertexFixedFunction.Constants(mRS);
        ((ProgramVertexFixedFunction)mVertexProgram).bindConstants(constants);
        Matrix4f matrix4f = new Matrix4f();
        matrix4f.loadProjectionNormalized(1, 1);
        constants.setProjection(matrix4f);
        mScript.set_vertexProgram(mVertexProgram);
    }

    private Matrix4f matrixFromFloat(float af[])
    {
        byte byte0;
        if (af != null && af.length != 0)
        {
            if (af.length == 16)
                byte0 = 4;
            else
            if (af.length == 9)
                byte0 = 3;
            else
                throw new IllegalArgumentException("matrix length not 0,9 or 16");
        } else
        {
            byte0 = 0;
        }
        Matrix4f matrix4f = new Matrix4f();
        for (int i = 0; i < byte0; i++)
        {
            for (int j = 0; j < byte0; j++)
                matrix4f.set(i, j, af[j + i * byte0]);

        }

        return matrix4f;
    }

    private void resizeProgramStoresCard(int i)
    {
        if (mProgramStoresCard == null);
        RenderScriptGL renderscriptgl = mRS;
        if (i <= 0)
            i = 1;
        mProgramStoresCard = new ScriptField_ProgramStore_s(renderscriptgl, i);
        mScript.bind_programStoresCard(mProgramStoresCard);
    }

    private void setCard(int i, ScriptField_Card.Item item)
    {
        try
        {
            mCards.set(item, i, false);
            return;
        }
        catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
        {
            Log.w("CarouselRS", (new StringBuilder()).append("setCard(").append(i).append("): Texture ").append(i).append(" doesn't exist").toString());
        }
    }

    private void setProgramStoreCard(int i, ProgramStore programstore)
    {
        ScriptField_ProgramStore_s.Item item = mProgramStoresCard.get(i);
        if (item == null)
            item = new ScriptField_ProgramStore_s.Item();
        item.programStore = programstore;
        mProgramStoresCard.set(item, i, false);
        mScript.invoke_setProgramStoresCard(i, programstore);
    }

    public void createCards(int i)
    {
        if (mCards != null && i > 0)
        {
            int k = mCards.getAllocation().getType().getX();
            mCards.resize(i);
            mScript.invoke_createCards(k, i);
            return;
        }
        RenderScriptGL renderscriptgl = mRS;
        int j;
        if (i > 0)
            j = i;
        else
            j = 1;
        mCards = new ScriptField_Card(renderscriptgl, j);
        mScript.bind_cards(mCards);
        mScript.invoke_createCards(0, i);
    }

    public void doLongPress()
    {
        mScript.invoke_doLongPress();
    }

    public void doMotion(float f, float f1, long l)
    {
        mScript.invoke_doMotion(f, f1, l);
    }

    public void doStart(float f, float f1, long l)
    {
        mScript.invoke_doStart(f, f1, l);
    }

    public void doStop(float f, float f1, long l)
    {
        mScript.invoke_doStop(f, f1, l);
    }

    void invalidateDetailTexture(int i, boolean flag)
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getCard(i);
        if (item != null)
            break MISSING_BLOCK_LABEL_32;
        this;
        JVM INSTR monitorexit ;
        return;
        if (!flag)
            break MISSING_BLOCK_LABEL_58;
        if (item.detailTexture != null)
        {
            item.detailTexture.destroy();
            item.detailTexture = null;
        }
        setCard(i, item);
        mScript.invoke_invalidateDetailTexture(i, flag);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void invalidateTexture(int i, boolean flag)
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getCard(i);
        if (item != null)
            break MISSING_BLOCK_LABEL_32;
        this;
        JVM INSTR monitorexit ;
        return;
        if (!flag)
            break MISSING_BLOCK_LABEL_58;
        if (item.texture != null)
        {
            item.texture.destroy();
            item.texture = null;
        }
        setCard(i, item);
        mScript.invoke_invalidateTexture(i, flag);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Mesh loadGeometry(int i)
    {
        if (i != 0)
        {
            FileA3D filea3d = FileA3D.createFromResource(mRS, mRes, i);
            if (filea3d != null)
            {
                android.renderscript.FileA3D.IndexEntry indexentry = filea3d.getIndexEntry(0);
                if (indexentry != null && indexentry.getEntryType() == android.renderscript.FileA3D.EntryType.MESH)
                    return (Mesh)indexentry.getObject();
            }
        }
        return null;
    }

    public void pauseRendering()
    {
        mRS.bindRootScript(null);
    }

    public void resumeRendering()
    {
        mRS.bindRootScript(mScript);
    }

    public void setBackgroundColor(Float4 float4)
    {
        mScript.set_backgroundColor(float4);
    }

    public void setBackgroundTexture(Bitmap bitmap)
    {
        Allocation allocation = null;
        if (bitmap != null)
            allocation = Allocation.createFromBitmap(mRS, bitmap, MIPMAP, 2);
        mScript.set_backgroundTexture(allocation);
    }

    public void setCallback(CarouselCallback carouselcallback)
    {
        mCallback = carouselcallback;
    }

    public void setCardCreationFadeDuration(long l)
    {
        mScript.set_cardCreationFadeDuration((int)l);
    }

    public void setCardRotation(float f)
    {
        mScript.set_cardRotation(f);
    }

    public void setCardsFaceTangent(boolean flag)
    {
        mScript.set_cardsFaceTangent(flag);
    }

    public void setCarouselRotationAngle(float f)
    {
        mScript.invoke_setCarouselRotationAngle(f);
    }

    public void setCarouselRotationAngle(float f, int i, int j, float f1)
    {
        mScript.invoke_setCarouselRotationAngle2(f, i, j, f1);
    }

    public void setDefaultBitmap(Bitmap bitmap)
    {
        mScript.set_defaultTexture(allocationFromBitmap(bitmap, MIPMAP));
    }

    public void setDefaultCardMatrix(float af[])
    {
        mScript.set_defaultCardMatrix(matrixFromFloat(af));
    }

    public void setDefaultGeometry(Mesh mesh)
    {
        mScript.set_defaultGeometry(mesh);
    }

    public void setDetailLineTexture(Bitmap bitmap)
    {
        Allocation allocation = null;
        if (bitmap != null)
            allocation = Allocation.createFromBitmap(mRS, bitmap, MIPMAP, 2);
        mScript.set_detailLineTexture(allocation);
    }

    public void setDetailLoadingTexture(Bitmap bitmap)
    {
        Allocation allocation = null;
        if (bitmap != null)
            allocation = Allocation.createFromBitmap(mRS, bitmap, MIPMAP, 2);
        mScript.set_detailLoadingTexture(allocation);
    }

    void setDetailTexture(int i, float f, float f1, float f2, float f3, Bitmap bitmap)
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getOrCreateCard(i);
        if (bitmap == null) goto _L2; else goto _L1
_L1:
        item.detailTexture = allocationFromBitmap(bitmap, MIPMAP);
        (float)bitmap.getWidth();
        (float)bitmap.getHeight();
_L4:
        setCard(i, item);
        mScript.invoke_setDetailTexture(i, f, f1, f2, f3, item.detailTexture);
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (item.detailTexture != null)
        {
            item.detailTexture.destroy();
            item.detailTexture = null;
        }
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setDetailTextureAlignment(int i)
    {
        mScript.set_detailTextureAlignment(i);
    }

    public void setDragFactor(float f)
    {
        mScript.set_dragFactor(f);
    }

    public void setDragModel(int i)
    {
        mScript.set_dragModel(i);
    }

    public void setDrawRuler(boolean flag)
    {
        mScript.set_drawRuler(flag);
    }

    public void setFadeInDuration(long l)
    {
        mScript.set_fadeInDuration((int)l);
    }

    public void setFillDirection(int i)
    {
        mScript.set_fillDirection(i);
    }

    public void setFirstCardTop(boolean flag)
    {
        mScript.set_firstCardTop(flag);
    }

    public void setForceBlendCardsWithZ(boolean flag)
    {
        mForceBlendCardsWithZ = flag;
        initProgramStore();
    }

    public void setFrictionCoefficient(float f)
    {
        mScript.set_frictionCoeff(f);
    }

    public void setGeometry(int i, Mesh mesh)
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getOrCreateCard(i);
        if (mesh == null) goto _L2; else goto _L1
_L1:
        item.geometry = mesh;
_L4:
        setCard(i, item);
        mScript.invoke_setGeometry(i, item.geometry);
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (item.geometry != null)
            item.geometry = null;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setLoadingBitmap(Bitmap bitmap)
    {
        mScript.set_loadingTexture(allocationFromBitmap(bitmap, MIPMAP));
    }

    public void setLoadingGeometry(Mesh mesh)
    {
        mScript.set_loadingGeometry(mesh);
    }

    public void setLookAt(float af[], float af1[], float af2[])
    {
        for (int i = 0; i < 3; i++)
        {
            mEyePoint[i] = af[i];
            mAtPoint[i] = af1[i];
            mUp[i] = af2[i];
        }

        mScript.invoke_lookAt(af[0], af[1], af[2], af1[0], af1[1], af1[2], af2[0], af2[1], af2[2]);
    }

    public void setMatrix(int i, float af[])
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getOrCreateCard(i);
        if (af == null)
            break MISSING_BLOCK_LABEL_61;
        item.matrix = matrixFromFloat(af);
_L2:
        setCard(i, item);
        mScript.invoke_setMatrix(i, item.matrix);
        this;
        JVM INSTR monitorexit ;
        return;
        item.matrix = null;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setOverscrollSlots(float f)
    {
        mScript.set_overscrollSlots(f);
    }

    public void setPrefetchCardCount(int i)
    {
        mPrefetchCardCount = i;
        mScript.set_prefetchCardCount(i);
    }

    public void setRadius(float f)
    {
        mScript.invoke_setRadius(f);
    }

    public void setRezInCardCount(float f)
    {
        mScript.set_rezInCardCount(f);
    }

    public void setRowCount(int i)
    {
        mRowCount = i;
        mScript.set_rowCount(i);
    }

    public void setRowSpacing(float f)
    {
        mScript.set_rowSpacing(f);
    }

    public void setSlotCount(int i)
    {
        mScript.set_slotCount(i);
    }

    public void setStartAngle(float f)
    {
        mScript.set_startAngle(f);
    }

    public void setStoreConfigs(int ai[])
    {
        if (ai == null)
        {
            initProgramStore();
        } else
        {
            int i = ai.length;
            resizeProgramStoresCard(i);
            for (int j = 0; j < i; j++)
            {
                int k = ai[j];
                boolean flag;
                if ((k & 1) != 0)
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if ((k & 2) != 0)
                    flag1 = true;
                else
                    flag1 = false;
                boolean flag2;
                if ((k & 4) != 0)
                    flag2 = true;
                else
                    flag2 = false;
                android.renderscript.ProgramStore.BlendDstFunc blenddstfunc;
                if (flag)
                    blenddstfunc = android.renderscript.ProgramStore.BlendDstFunc.ONE_MINUS_SRC_ALPHA;
                else
                    blenddstfunc = android.renderscript.ProgramStore.BlendDstFunc.ZERO;
                android.renderscript.ProgramStore.DepthFunc depthfunc;
                if (flag1)
                    depthfunc = android.renderscript.ProgramStore.DepthFunc.LESS;
                else
                    depthfunc = android.renderscript.ProgramStore.DepthFunc.ALWAYS;
                setProgramStoreCard(j, (new android.renderscript.ProgramStore.Builder(mRS)).setBlendFunc(android.renderscript.ProgramStore.BlendSrcFunc.ONE, blenddstfunc).setDitherEnabled(true).setDepthFunc(depthfunc).setDepthMaskEnabled(flag2).create());
            }

        }
    }

    public void setSwaySensitivity(float f)
    {
        mScript.set_swaySensitivity(f);
    }

    public void setTexture(int i, Bitmap bitmap)
    {
        if (i < 0)
            throw new IllegalArgumentException("Index cannot be negative");
        this;
        JVM INSTR monitorenter ;
        ScriptField_Card.Item item = getOrCreateCard(i);
        if (bitmap == null) goto _L2; else goto _L1
_L1:
        item.texture = allocationFromPool(i, bitmap, MIPMAP);
_L4:
        setCard(i, item);
        mScript.invoke_setTexture(i, item.texture);
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (item.texture != null)
            item.texture = null;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setVisibleDetails(int i)
    {
        mScript.set_visibleDetailCount(i);
    }

    public void setVisibleSlots(int i)
    {
        mVisibleSlots = i;
        mScript.set_visibleSlotCount(i);
    }

    static 
    {
        MIPMAP = android.renderscript.Allocation.MipmapControl.MIPMAP_NONE;
    }

}
