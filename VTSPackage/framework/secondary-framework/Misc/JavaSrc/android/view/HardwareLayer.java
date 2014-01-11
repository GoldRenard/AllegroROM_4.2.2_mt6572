// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;

// Referenced classes of package android.view:
//            DisplayList, HardwareCanvas

abstract class HardwareLayer
{

    static final int DIMENSION_UNDEFINED = -1;
    DisplayList mDisplayList;
    int mHeight;
    boolean mOpaque;
    int mWidth;

    HardwareLayer()
    {
        this(-1, -1, false);
    }

    HardwareLayer(int i, int j, boolean flag)
    {
        mWidth = i;
        mHeight = j;
        mOpaque = flag;
    }

    abstract void clearStorage();

    abstract boolean copyInto(Bitmap bitmap);

    abstract void destroy();

    abstract void end(Canvas canvas);

    abstract HardwareCanvas getCanvas();

    DisplayList getDisplayList()
    {
        return mDisplayList;
    }

    int getHeight()
    {
        return mHeight;
    }

    int getWidth()
    {
        return mWidth;
    }

    boolean isOpaque()
    {
        return mOpaque;
    }

    abstract boolean isValid();

    abstract void redrawLater(DisplayList displaylist, Rect rect);

    abstract boolean resize(int i, int j);

    void setDisplayList(DisplayList displaylist)
    {
        mDisplayList = displaylist;
    }

    void setLayerPaint(Paint paint)
    {
    }

    abstract void setOpaque(boolean flag);

    abstract void setTransform(Matrix matrix);

    abstract HardwareCanvas start(Canvas canvas);

    void update(int i, int j, boolean flag)
    {
        mWidth = i;
        mHeight = j;
        mOpaque = flag;
    }
}
