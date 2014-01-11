// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.graphics.Bitmap;
import android.renderscript.*;

// Referenced classes of package com.android.ex.carousel:
//            CarouselRS

public class CarouselController
{

    private static final boolean DBG = false;
    public static final int STORE_CONFIG_ALPHA = 1;
    public static final int STORE_CONFIG_DEPTH_READS = 2;
    public static final int STORE_CONFIG_DEPTH_WRITES = 4;
    private static final String TAG = "CarouselController";
    private final int DEFAULT_DETAIL_ALIGNMENT = 514;
    private final float DEFAULT_DRAG_FACTOR = 0.25F;
    private final float DEFAULT_FRICTION_COEFFICIENT = 10F;
    private final float DEFAULT_OVERSCROLL_SLOTS = 1.0F;
    private final int DEFAULT_PREFETCH_CARD_COUNT = 2;
    private final float DEFAULT_RADIUS = 20F;
    private final int DEFAULT_ROW_COUNT = 1;
    private final float DEFAULT_ROW_SPACING = 0.0F;
    private final int DEFAULT_SLOT_COUNT = 10;
    private final float DEFAULT_SWAY_SENSITIVITY = 0.0F;
    private final int DEFAULT_VISIBLE_DETAIL_COUNT = 3;
    private float mAt[] = {
        14.7255F, -3.40001F, -1.30184F
    };
    private Bitmap mBackgroundBitmap;
    private Float4 mBackgroundColor;
    private int mCardCount;
    private long mCardCreationFadeDuration;
    private float mCardRotation;
    private boolean mCardsFaceTangent;
    private CarouselRS.CarouselCallback mCarouselCallback;
    private float mCarouselRotationAngle;
    private Bitmap mDefaultBitmap;
    private float mDefaultCardMatrix[];
    private int mDefaultGeometry;
    private Bitmap mDefaultLineBitmap;
    private Bitmap mDetailLoadingBitmap;
    private int mDetailTextureAlignment;
    private float mDragFactor;
    private int mDragModel;
    private boolean mDrawRuler;
    private float mEye[] = {
        20.6829F, 2.77081F, 16.7314F
    };
    private long mFadeInDuration;
    private int mFillDirection;
    private boolean mFirstCardTop;
    private boolean mForceBlendCardsWithZ;
    private float mFrictionCoefficient;
    private Bitmap mLoadingBitmap;
    private int mLoadingGeometry;
    private float mOverscrollSlots;
    private int mPrefetchCardCount;
    private RenderScriptGL mRS;
    private float mRadius;
    private CarouselRS mRenderScript;
    private float mRezInCardCount;
    private int mRowCount;
    private float mRowSpacing;
    private int mSlotCount;
    private float mStartAngle;
    private int mStoreConfigs[];
    private float mSwaySensitivity;
    private float mUp[] = {
        0.0F, 1.0F, 0.0F
    };
    private int mVisibleDetails;
    private int mVisibleSlots;

    public CarouselController()
    {
        mDefaultLineBitmap = Bitmap.createBitmap(new int[] {
            0, -1, 0
        }, 0, 3, 3, 1, android.graphics.Bitmap.Config.ARGB_4444);
        mCardCount = 0;
        mVisibleSlots = 0;
        mVisibleDetails = 3;
        mPrefetchCardCount = 2;
        mDetailTextureAlignment = 514;
        mForceBlendCardsWithZ = false;
        mDrawRuler = true;
        mRadius = 20F;
        mCardRotation = 0.0F;
        mCardsFaceTangent = false;
        mOverscrollSlots = 1.0F;
        mSwaySensitivity = 0.0F;
        mFrictionCoefficient = 10F;
        mDragFactor = 0.25F;
        mSlotCount = 10;
        mRowCount = 1;
        mRowSpacing = 0.0F;
        mBackgroundColor = new Float4(0.0F, 0.0F, 0.0F, 1.0F);
        mRezInCardCount = 0.0F;
        mFadeInDuration = 250L;
        mCardCreationFadeDuration = 0L;
        mDetailLoadingBitmap = Bitmap.createBitmap(new int[] {
            0
        }, 0, 1, 1, 1, android.graphics.Bitmap.Config.ARGB_4444);
        mDragModel = 0;
        mFillDirection = 1;
        mFirstCardTop = false;
    }

    public void createCards(int i)
    {
        mCardCount = i;
        if (mRenderScript != null)
            mRenderScript.createCards(i);
    }

    public CarouselRS.CarouselCallback getCallback()
    {
        return mCarouselCallback;
    }

    public int getCardCount()
    {
        return mCardCount;
    }

    public void invalidateDetailTexture(int i, boolean flag)
    {
        if (mRenderScript != null && mRS != null)
            mRenderScript.invalidateDetailTexture(i, flag);
    }

    public void invalidateTexture(int i, boolean flag)
    {
        if (mRenderScript != null && mRS != null)
            mRenderScript.invalidateTexture(i, flag);
    }

    public Mesh loadGeometry(int i)
    {
        if (mRenderScript != null)
            return mRenderScript.loadGeometry(i);
        else
            return null;
    }

    public void onLongPress()
    {
        mRenderScript.doLongPress();
    }

    public void onSurfaceChanged()
    {
        setSlotCount(mSlotCount);
        setDefaultCardMatrix(mDefaultCardMatrix);
        createCards(mCardCount);
        setVisibleSlots(mVisibleSlots);
        setVisibleDetails(mVisibleDetails);
        setPrefetchCardCount(mPrefetchCardCount);
        setOverscrollSlots(mOverscrollSlots);
        setRowCount(mRowCount);
        setRowSpacing(mRowSpacing);
        setFirstCardTop(mFirstCardTop);
        setDetailTextureAlignment(mDetailTextureAlignment);
        setForceBlendCardsWithZ(mForceBlendCardsWithZ);
        setDrawRuler(mDrawRuler);
        setCallback(mCarouselCallback);
        setDefaultBitmap(mDefaultBitmap);
        setLoadingBitmap(mLoadingBitmap);
        setDefaultGeometry(mDefaultGeometry);
        setLoadingGeometry(mLoadingGeometry);
        setBackgroundColor(mBackgroundColor.x, mBackgroundColor.y, mBackgroundColor.z, mBackgroundColor.w);
        setBackgroundBitmap(mBackgroundBitmap);
        setDetailLineBitmap(mDefaultLineBitmap);
        setStartAngle(mStartAngle);
        setCarouselRotationAngle(mCarouselRotationAngle);
        setRadius(mRadius);
        setCardRotation(mCardRotation);
        setCardsFaceTangent(mCardsFaceTangent);
        setSwaySensitivity(mSwaySensitivity);
        setFrictionCoefficient(mFrictionCoefficient);
        setDragFactor(mDragFactor);
        setDragModel(mDragModel);
        setFillDirection(mFillDirection);
        setLookAt(mEye, mAt, mUp);
        setRezInCardCount(mRezInCardCount);
        setFadeInDuration(mFadeInDuration);
        setCardCreationFadeDuration(mCardCreationFadeDuration);
        setDetailLoadingBitmap(mDetailLoadingBitmap);
        setStoreConfigs(mStoreConfigs);
    }

    public void onTouchMoved(float f, float f1, long l)
    {
        mRenderScript.doMotion(f, f1, l);
    }

    public void onTouchStarted(float f, float f1, long l)
    {
        mRenderScript.doStart(f, f1, l);
    }

    public void onTouchStopped(float f, float f1, long l)
    {
        mRenderScript.doStop(f, f1, l);
    }

    public void setBackgroundBitmap(Bitmap bitmap)
    {
        mBackgroundBitmap = bitmap;
        if (mRenderScript != null)
            mRenderScript.setBackgroundTexture(bitmap);
    }

    public void setBackgroundColor(float f, float f1, float f2, float f3)
    {
        mBackgroundColor = new Float4(f, f1, f2, f3);
        if (mRenderScript != null)
            mRenderScript.setBackgroundColor(mBackgroundColor);
    }

    public void setCallback(CarouselRS.CarouselCallback carouselcallback)
    {
        mCarouselCallback = carouselcallback;
        if (mRenderScript != null)
            mRenderScript.setCallback(carouselcallback);
    }

    public void setCardCreationFadeDuration(long l)
    {
        mCardCreationFadeDuration = l;
        if (mRenderScript != null)
            mRenderScript.setCardCreationFadeDuration(l);
    }

    public void setCardRotation(float f)
    {
        mCardRotation = f;
        if (mRenderScript != null)
            mRenderScript.setCardRotation(f);
    }

    public void setCardsFaceTangent(boolean flag)
    {
        mCardsFaceTangent = flag;
        if (mRenderScript != null)
            mRenderScript.setCardsFaceTangent(flag);
    }

    public void setCarouselRotationAngle(float f)
    {
        mCarouselRotationAngle = f;
        if (mRenderScript != null)
            mRenderScript.setCarouselRotationAngle(f);
    }

    public void setCarouselRotationAngle(float f, int i, int j, float f1)
    {
        if (mRenderScript != null)
            mRenderScript.setCarouselRotationAngle(f, i, j, f1);
    }

    public void setDefaultBitmap(Bitmap bitmap)
    {
        mDefaultBitmap = bitmap;
        if (mRenderScript != null)
            mRenderScript.setDefaultBitmap(bitmap);
    }

    public void setDefaultCardMatrix(float af[])
    {
        mDefaultCardMatrix = af;
        if (mRenderScript != null)
            mRenderScript.setDefaultCardMatrix(af);
    }

    public void setDefaultGeometry(int i)
    {
        mDefaultGeometry = i;
        if (mRenderScript != null)
        {
            Mesh mesh = mRenderScript.loadGeometry(i);
            mRenderScript.setDefaultGeometry(mesh);
        }
    }

    public void setDetailLineBitmap(Bitmap bitmap)
    {
        mDefaultLineBitmap = bitmap;
        if (mRenderScript != null)
            mRenderScript.setDetailLineTexture(bitmap);
    }

    public void setDetailLoadingBitmap(Bitmap bitmap)
    {
        mDetailLoadingBitmap = bitmap;
        if (mRenderScript != null)
            mRenderScript.setDetailLoadingTexture(bitmap);
    }

    public void setDetailTextureAlignment(int i)
    {
        int j = i & 0xff00;
        if (j != 0 && (j & j - 1) == 0)
        {
            int k = i & 0xff;
            if (k != 0 && (k & k - 1) == 0)
            {
                mDetailTextureAlignment = i;
                if (mRenderScript != null)
                    mRenderScript.setDetailTextureAlignment(i);
                return;
            } else
            {
                throw new IllegalArgumentException("Must specify exactly one vertical alignment flag");
            }
        } else
        {
            throw new IllegalArgumentException("Must specify exactly one horizontal alignment flag");
        }
    }

    public void setDetailTextureForItem(int i, float f, float f1, float f2, float f3, Bitmap bitmap)
    {
        if (mRenderScript != null && mRS != null)
            mRenderScript.setDetailTexture(i, f, f1, f2, f3, bitmap);
    }

    public void setDragFactor(float f)
    {
        mDragFactor = f;
        if (mRenderScript != null)
            mRenderScript.setDragFactor(f);
    }

    public void setDragModel(int i)
    {
        mDragModel = i;
        if (mRenderScript != null)
            mRenderScript.setDragModel(i);
    }

    public void setDrawRuler(boolean flag)
    {
        mDrawRuler = flag;
        if (mRenderScript != null)
            mRenderScript.setDrawRuler(flag);
    }

    public void setFadeInDuration(long l)
    {
        mFadeInDuration = l;
        if (mRenderScript != null)
            mRenderScript.setFadeInDuration(l);
    }

    public void setFillDirection(int i)
    {
        mFillDirection = i;
        if (mRenderScript != null)
            mRenderScript.setFillDirection(i);
    }

    public void setFirstCardTop(boolean flag)
    {
        mFirstCardTop = flag;
        if (mRenderScript != null)
            mRenderScript.setFirstCardTop(flag);
    }

    public void setForceBlendCardsWithZ(boolean flag)
    {
        mForceBlendCardsWithZ = flag;
        if (mRenderScript != null)
            mRenderScript.setForceBlendCardsWithZ(flag);
    }

    public void setFrictionCoefficient(float f)
    {
        mFrictionCoefficient = f;
        if (mRenderScript != null)
            mRenderScript.setFrictionCoefficient(f);
    }

    public void setGeometryForItem(int i, int j)
    {
        if (mRenderScript != null)
        {
            Mesh mesh = mRenderScript.loadGeometry(j);
            mRenderScript.setGeometry(i, mesh);
        }
    }

    public void setGeometryForItem(int i, Mesh mesh)
    {
        if (mRenderScript != null)
            mRenderScript.setGeometry(i, mesh);
    }

    public void setLoadingBitmap(Bitmap bitmap)
    {
        mLoadingBitmap = bitmap;
        if (mRenderScript != null)
            mRenderScript.setLoadingBitmap(bitmap);
    }

    public void setLoadingGeometry(int i)
    {
        mLoadingGeometry = i;
        if (mRenderScript != null)
        {
            Mesh mesh = mRenderScript.loadGeometry(i);
            mRenderScript.setLoadingGeometry(mesh);
        }
    }

    public void setLookAt(float af[], float af1[], float af2[])
    {
        mEye = af;
        mAt = af1;
        mUp = af2;
        if (mRenderScript != null)
            mRenderScript.setLookAt(af, af1, af2);
    }

    public void setMatrixForItem(int i, float af[])
    {
        if (mRenderScript != null)
            mRenderScript.setMatrix(i, af);
    }

    public void setOverscrollSlots(float f)
    {
        mOverscrollSlots = f;
        if (mRenderScript != null)
            mRenderScript.setOverscrollSlots(f);
    }

    public void setPrefetchCardCount(int i)
    {
        mPrefetchCardCount = i;
        if (mRenderScript != null)
            mRenderScript.setPrefetchCardCount(i);
    }

    public void setRS(RenderScriptGL renderscriptgl, CarouselRS carouselrs)
    {
        mRS = renderscriptgl;
        mRenderScript = carouselrs;
    }

    public void setRadius(float f)
    {
        mRadius = f;
        if (mRenderScript != null)
            mRenderScript.setRadius(f);
    }

    public void setRezInCardCount(float f)
    {
        mRezInCardCount = f;
        if (mRenderScript != null)
            mRenderScript.setRezInCardCount(f);
    }

    public void setRowCount(int i)
    {
        mRowCount = i;
        if (mRenderScript != null)
            mRenderScript.setRowCount(i);
    }

    public void setRowSpacing(float f)
    {
        mRowSpacing = f;
        if (mRenderScript != null)
            mRenderScript.setRowSpacing(f);
    }

    public void setSlotCount(int i)
    {
        mSlotCount = i;
        if (mRenderScript != null)
            mRenderScript.setSlotCount(i);
    }

    public void setStartAngle(float f)
    {
        mStartAngle = f;
        if (mRenderScript != null)
            mRenderScript.setStartAngle(f);
    }

    public void setStoreConfigs(int ai[])
    {
        mStoreConfigs = ai;
        if (mRenderScript != null)
            mRenderScript.setStoreConfigs(ai);
    }

    public void setSwaySensitivity(float f)
    {
        mSwaySensitivity = f;
        if (mRenderScript != null)
            mRenderScript.setSwaySensitivity(f);
    }

    public void setTextureForItem(int i, Bitmap bitmap)
    {
        if (mRenderScript != null && mRS != null)
            mRenderScript.setTexture(i, bitmap);
    }

    public void setVisibleDetails(int i)
    {
        mVisibleDetails = i;
        if (mRenderScript != null)
            mRenderScript.setVisibleDetails(i);
    }

    public void setVisibleSlots(int i)
    {
        mVisibleSlots = i;
        if (mRenderScript != null)
            mRenderScript.setVisibleSlots(i);
    }
}
