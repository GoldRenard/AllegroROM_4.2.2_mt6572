// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.content.Context;
import android.graphics.Bitmap;
import android.renderscript.*;
import android.util.AttributeSet;
import android.view.*;

// Referenced classes of package com.android.ex.carousel:
//            CarouselController, CarouselRS

public abstract class CarouselView extends RSSurfaceView
{
    public static class DetailAlignment
    {

        public static final int ABOVE = 8;
        public static final int BELOW = 16;
        public static final int CENTER_HORIZONTAL = 256;
        public static final int CENTER_VERTICAL = 1;
        public static final int HORIZONTAL_ALIGNMENT_MASK = 65280;
        public static final int LEFT = 512;
        public static final int RIGHT = 1024;
        public static final int VERTICAL_ALIGNMENT_MASK = 255;
        public static final int VIEW_BOTTOM = 4;
        public static final int VIEW_TOP = 2;

    }

    public static class Info
    {

        public int resId;

        public Info(int i)
        {
            resId = i;
        }
    }

    public static class InterpolationMode
    {

        public static final int ACCELERATE_DECELERATE_CUBIC = 2;
        public static final int DECELERATE_QUADRATIC = 1;
        public static final int LINEAR;

    }


    public static final int DRAG_MODEL_CYLINDER_INSIDE = 2;
    public static final int DRAG_MODEL_CYLINDER_OUTSIDE = 3;
    public static final int DRAG_MODEL_PLANE = 1;
    public static final int DRAG_MODEL_SCREEN_DELTA = 0;
    public static final int FILL_DIRECTION_CCW = 1;
    public static final int FILL_DIRECTION_CW = -1;
    private static final String TAG = "CarouselView";
    private static final boolean USE_DEPTH_BUFFER = true;
    private Context mContext;
    CarouselController mController;
    private RenderScriptGL mRS;
    private CarouselRS mRenderScript;
    private boolean mTracking;

    public CarouselView(Context context)
    {
        this(context, new CarouselController());
    }

    public CarouselView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, new CarouselController());
    }

    public CarouselView(Context context, AttributeSet attributeset, CarouselController carouselcontroller)
    {
        super(context, attributeset);
        mContext = context;
        mController = carouselcontroller;
        ensureRenderScript();
        setOnLongClickListener(new android.view.View.OnLongClickListener() {

            final CarouselView this$0;

            public boolean onLongClick(View view)
            {
                if (interpretLongPressEvents())
                {
                    mController.onLongPress();
                    return true;
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = CarouselView.this;
                super();
            }
        }
);
    }

    public CarouselView(Context context, CarouselController carouselcontroller)
    {
        this(context, null, carouselcontroller);
    }

    private void ensureRenderScript()
    {
        if (mRS == null)
        {
            android.renderscript.RenderScriptGL.SurfaceConfig surfaceconfig = new android.renderscript.RenderScriptGL.SurfaceConfig();
            surfaceconfig.setDepth(16, 24);
            mRS = createRenderScriptGL(surfaceconfig);
        }
        if (mRenderScript == null)
        {
            mRenderScript = new CarouselRS(mRS, mContext.getResources(), getRenderScriptInfo().resId);
            mRenderScript.resumeRendering();
        }
        mController.setRS(mRS, mRenderScript);
    }

    public void createCards(int i)
    {
        mController.createCards(i);
    }

    public int getCardCount()
    {
        return mController.getCardCount();
    }

    public CarouselController getController()
    {
        return mController;
    }

    public abstract Info getRenderScriptInfo();

    public boolean interpretLongPressEvents()
    {
        return false;
    }

    public Mesh loadGeometry(int i)
    {
        return mController.loadGeometry(i);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        ensureRenderScript();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mRenderScript = null;
        if (mRS != null)
        {
            mRS = null;
            destroyRenderScriptGL();
        }
        mController.setRS(mRS, mRenderScript);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
label0:
        {
label1:
            {
                super.onTouchEvent(motionevent);
                int i = motionevent.getAction();
                if (mRenderScript != null)
                    switch (i)
                    {
                    default:
                        break label0;

                    case 0: // '\0'
                        break label1;

                    case 1: // '\001'
                        mController.onTouchStopped(motionevent.getX(), motionevent.getY(), motionevent.getEventTime());
                        mTracking = false;
                        return true;

                    case 2: // '\002'
                        if (mTracking)
                        {
                            for (int j = 0; j < motionevent.getHistorySize(); j++)
                                mController.onTouchMoved(motionevent.getHistoricalX(j), motionevent.getHistoricalY(j), motionevent.getHistoricalEventTime(j));

                            mController.onTouchMoved(motionevent.getX(), motionevent.getY(), motionevent.getEventTime());
                            return true;
                        }
                        break;
                    }
                return true;
            }
            mTracking = true;
            mController.onTouchStarted(motionevent.getX(), motionevent.getY(), motionevent.getEventTime());
            return true;
        }
        return true;
    }

    public void setBackgroundBitmap(Bitmap bitmap)
    {
        mController.setBackgroundBitmap(bitmap);
    }

    public void setBackgroundColor(float f, float f1, float f2, float f3)
    {
        mController.setBackgroundColor(f, f1, f2, f3);
    }

    public void setCallback(CarouselRS.CarouselCallback carouselcallback)
    {
        mController.setCallback(carouselcallback);
    }

    public void setCardRotation(float f)
    {
        mController.setCardRotation(f);
    }

    public void setCardsFaceTangent(boolean flag)
    {
        mController.setCardsFaceTangent(flag);
    }

    public void setController(CarouselController carouselcontroller)
    {
        mController = carouselcontroller;
        mController.setRS(mRS, mRenderScript);
    }

    public void setDefaultBitmap(Bitmap bitmap)
    {
        mController.setDefaultBitmap(bitmap);
    }

    public void setDefaultCardMatrix(float af[])
    {
        mController.setDefaultCardMatrix(af);
    }

    public void setDefaultGeometry(int i)
    {
        mController.setDefaultGeometry(i);
    }

    public void setDetailLineBitmap(Bitmap bitmap)
    {
        mController.setDetailLineBitmap(bitmap);
    }

    public void setDetailLoadingBitmap(Bitmap bitmap)
    {
        mController.setDetailLoadingBitmap(bitmap);
    }

    public void setDetailTextureAlignment(int i)
    {
        mController.setDetailTextureAlignment(i);
    }

    public void setDetailTextureForItem(int i, float f, float f1, float f2, float f3, Bitmap bitmap)
    {
        mController.setDetailTextureForItem(i, f, f1, f2, f3, bitmap);
    }

    public void setDragFactor(float f)
    {
        mController.setDragFactor(f);
    }

    public void setDragModel(int i)
    {
        mController.setDragModel(i);
    }

    public void setDrawRuler(boolean flag)
    {
        mController.setDrawRuler(flag);
    }

    public void setFadeInDuration(long l)
    {
        mController.setFadeInDuration(l);
    }

    public void setFirstCardTop(boolean flag)
    {
        mController.setFirstCardTop(flag);
    }

    public void setForceBlendCardsWithZ(boolean flag)
    {
        mController.setForceBlendCardsWithZ(flag);
    }

    public void setFrictionCoefficient(float f)
    {
        mController.setFrictionCoefficient(f);
    }

    public void setGeometryForItem(int i, Mesh mesh)
    {
        mController.setGeometryForItem(i, mesh);
    }

    public void setLoadingBitmap(Bitmap bitmap)
    {
        mController.setLoadingBitmap(bitmap);
    }

    public void setLoadingGeometry(int i)
    {
        mController.setLoadingGeometry(i);
    }

    public void setLookAt(float af[], float af1[], float af2[])
    {
        mController.setLookAt(af, af1, af2);
    }

    public void setMatrixForItem(int i, float af[])
    {
        mController.setMatrixForItem(i, af);
    }

    public void setOverscrollSlots(float f)
    {
        mController.setOverscrollSlots(f);
    }

    public void setPrefetchCardCount(int i)
    {
        mController.setPrefetchCardCount(i);
    }

    public void setRadius(float f)
    {
        mController.setRadius(f);
    }

    public void setRezInCardCount(float f)
    {
        mController.setRezInCardCount(f);
    }

    public void setRowCount(int i)
    {
        mController.setRowCount(i);
    }

    public void setRowSpacing(float f)
    {
        mController.setRowSpacing(f);
    }

    public void setSlotCount(int i)
    {
        mController.setSlotCount(i);
    }

    public void setStartAngle(float f)
    {
        mController.setStartAngle(f);
    }

    public void setSwaySensitivity(float f)
    {
        mController.setSwaySensitivity(f);
    }

    public void setTextureForItem(int i, Bitmap bitmap)
    {
        mController.setTextureForItem(i, bitmap);
    }

    public void setVisibleDetails(int i)
    {
        mController.setVisibleDetails(i);
    }

    public void setVisibleSlots(int i)
    {
        mController.setVisibleSlots(i);
    }

    public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
    {
        super.surfaceChanged(surfaceholder, i, j, k);
        mController.onSurfaceChanged();
    }
}
