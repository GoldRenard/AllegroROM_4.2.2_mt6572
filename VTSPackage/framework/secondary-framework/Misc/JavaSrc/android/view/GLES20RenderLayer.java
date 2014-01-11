// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;

// Referenced classes of package android.view:
//            GLES20Layer, GLES20Canvas, GLES20DisplayList, HardwareLayer, 
//            HardwareCanvas, DisplayList

class GLES20RenderLayer extends GLES20Layer
{

    private final GLES20Canvas mCanvas;
    private int mLayerHeight;
    private int mLayerWidth;

    GLES20RenderLayer(int i, int j, boolean flag)
    {
        boolean flag1 = true;
        super(i, j, flag);
        int ai[] = new int[2];
        super.mLayer = GLES20Canvas.nCreateLayer(i, j, flag, ai);
        if (super.mLayer != 0)
        {
            mLayerWidth = ai[0];
            mLayerHeight = ai[flag1];
            int k = super.mLayer;
            if (flag)
                flag1 = false;
            mCanvas = new GLES20Canvas(k, flag1);
            super.mFinalizer = new GLES20Layer.Finalizer(super.mLayer);
            return;
        } else
        {
            mCanvas = null;
            super.mFinalizer = null;
            return;
        }
    }

    void end(Canvas canvas)
    {
        if (canvas instanceof GLES20Canvas)
            ((GLES20Canvas)canvas).resume();
    }

    HardwareCanvas getCanvas()
    {
        return mCanvas;
    }

    boolean isValid()
    {
        return super.mLayer != 0 && mLayerWidth > 0 && mLayerHeight > 0;
    }

    void redrawLater(DisplayList displaylist, Rect rect)
    {
        GLES20Canvas.nUpdateRenderLayer(super.mLayer, mCanvas.getRenderer(), ((GLES20DisplayList)displaylist).getNativeDisplayList(), rect.left, rect.top, rect.right, rect.bottom);
    }

    boolean resize(int i, int j)
    {
        if (isValid() && i > 0 && j > 0)
        {
            super.mWidth = i;
            super.mHeight = j;
            if (i != mLayerWidth || j != mLayerHeight)
            {
                int ai[] = new int[2];
                if (GLES20Canvas.nResizeLayer(super.mLayer, i, j, ai))
                {
                    mLayerWidth = ai[0];
                    mLayerHeight = ai[1];
                } else
                {
                    super.mLayer = 0;
                    mLayerWidth = 0;
                    mLayerHeight = 0;
                }
            }
            return isValid();
        } else
        {
            return false;
        }
    }

    void setOpaque(boolean flag)
    {
        super.mOpaque = flag;
        GLES20Canvas.nSetOpaqueLayer(super.mLayer, flag);
    }

    void setTransform(Matrix matrix)
    {
    }

    HardwareCanvas start(Canvas canvas)
    {
        if (canvas instanceof GLES20Canvas)
            ((GLES20Canvas)canvas).interrupt();
        return getCanvas();
    }
}
