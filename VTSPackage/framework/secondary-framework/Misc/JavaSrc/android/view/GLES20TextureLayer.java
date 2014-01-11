// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;

// Referenced classes of package android.view:
//            GLES20Layer, GLES20Canvas, HardwareCanvas, DisplayList

class GLES20TextureLayer extends GLES20Layer
{

    private SurfaceTexture mSurface;
    private int mTexture;

    GLES20TextureLayer(boolean flag)
    {
        int ai[] = new int[2];
        super.mLayer = GLES20Canvas.nCreateTextureLayer(flag, ai);
        if (super.mLayer != 0)
        {
            mTexture = ai[0];
            super.mFinalizer = new GLES20Layer.Finalizer(super.mLayer);
            return;
        } else
        {
            super.mFinalizer = null;
            return;
        }
    }

    void end(Canvas canvas)
    {
    }

    HardwareCanvas getCanvas()
    {
        return null;
    }

    SurfaceTexture getSurfaceTexture()
    {
        if (mSurface == null)
            mSurface = new SurfaceTexture(mTexture, false);
        return mSurface;
    }

    boolean isValid()
    {
        return super.mLayer != 0 && mTexture != 0;
    }

    void redrawLater(DisplayList displaylist, Rect rect)
    {
    }

    boolean resize(int i, int j)
    {
        return isValid();
    }

    void setOpaque(boolean flag)
    {
        throw new UnsupportedOperationException("Use update(int, int, boolean) instead");
    }

    void setSurfaceTexture(SurfaceTexture surfacetexture)
    {
        if (mSurface != null)
            mSurface.release();
        mSurface = surfacetexture;
        mSurface.attachToGLContext(mTexture);
    }

    void setTransform(Matrix matrix)
    {
        GLES20Canvas.nSetTextureLayerTransform(super.mLayer, matrix.native_instance);
    }

    HardwareCanvas start(Canvas canvas)
    {
        return null;
    }

    void update(int i, int j, boolean flag)
    {
        super.update(i, j, flag);
        GLES20Canvas.nUpdateTextureLayer(super.mLayer, i, j, flag, mSurface);
    }
}
