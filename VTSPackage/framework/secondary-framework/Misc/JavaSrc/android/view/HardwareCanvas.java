// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;

// Referenced classes of package android.view:
//            DisplayList, HardwareLayer

public abstract class HardwareCanvas extends Canvas
{


    abstract void attachFunctor(int i);

    public int callDrawGLFunction(int i)
    {
        return 0;
    }

    abstract void clearLayerUpdates();

    abstract void detachFunctor(int i);

    public abstract int drawDisplayList(DisplayList displaylist, Rect rect, int i);

    abstract void drawHardwareLayer(HardwareLayer hardwarelayer, float f, float f1, Paint paint);

    public int invokeFunctors(Rect rect)
    {
        return 0;
    }

    public boolean isHardwareAccelerated()
    {
        return true;
    }

    public abstract void onPostDraw();

    public abstract int onPreDraw(Rect rect);

    abstract void outputDisplayList(DisplayList displaylist);

    abstract void pushLayerUpdate(HardwareLayer hardwarelayer);

    public void setBitmap(Bitmap bitmap)
    {
        throw new UnsupportedOperationException();
    }
}
