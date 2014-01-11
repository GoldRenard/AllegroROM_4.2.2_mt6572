// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.graphics.*;
import android.graphics.drawable.Drawable;

public class FixedSizeDrawable extends Drawable
{

    int mBottom;
    Drawable mDrawable;
    int mLeft;
    int mRight;
    int mTop;

    public FixedSizeDrawable(Drawable drawable)
    {
        mDrawable = drawable;
    }

    public void draw(Canvas canvas)
    {
        mDrawable.draw(canvas);
    }

    public int getOpacity()
    {
        return mDrawable.getOpacity();
    }

    public void setAlpha(int i)
    {
        mDrawable.setAlpha(i);
    }

    public void setBounds(int i, int j, int k, int l)
    {
        mDrawable.setBounds(mLeft, mTop, mRight, mBottom);
    }

    public void setBounds(Rect rect)
    {
        mDrawable.setBounds(mLeft, mTop, mRight, mBottom);
    }

    public void setColorFilter(ColorFilter colorfilter)
    {
        mDrawable.setColorFilter(colorfilter);
    }

    public void setFixedBounds(int i, int j, int k, int l)
    {
        mLeft = i;
        mTop = j;
        mRight = k;
        mBottom = l;
    }
}
