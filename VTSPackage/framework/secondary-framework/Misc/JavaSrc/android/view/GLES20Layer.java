// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;

// Referenced classes of package android.view:
//            HardwareLayer, GLES20Canvas

abstract class GLES20Layer extends HardwareLayer
{
    static class Finalizer
    {

        private int mLayerId;

        void destroy()
        {
            GLES20Canvas.nDestroyLayer(mLayerId);
            mLayerId = 0;
        }

        protected void finalize()
            throws Throwable
        {
            if (mLayerId != 0)
                GLES20Canvas.nDestroyLayerDeferred(mLayerId);
            super.finalize();
            return;
            Exception exception;
            exception;
            super.finalize();
            throw exception;
        }

        public Finalizer(int i)
        {
            mLayerId = i;
        }
    }


    Finalizer mFinalizer;
    int mLayer;


    GLES20Layer(int i, int j, boolean flag)
    {
        super(i, j, flag);
    }

    void clearStorage()
    {
        if (mLayer != 0)
            GLES20Canvas.nClearLayerTexture(mLayer);
    }

    boolean copyInto(Bitmap bitmap)
    {
        return GLES20Canvas.nCopyLayer(mLayer, bitmap.mNativeBitmap);
    }

    void destroy()
    {
        if (mFinalizer != null)
        {
            mFinalizer.destroy();
            mFinalizer = null;
        }
        mLayer = 0;
    }

    public int getLayer()
    {
        return mLayer;
    }

    void setLayerPaint(Paint paint)
    {
        if (paint != null)
        {
            GLES20Canvas.nSetLayerPaint(mLayer, paint.mNativePaint);
            int i = mLayer;
            int j;
            if (paint.getColorFilter() != null)
                j = paint.getColorFilter().nativeColorFilter;
            else
                j = 0;
            GLES20Canvas.nSetLayerColorFilter(i, j);
        }
    }
}
