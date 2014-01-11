// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.drawable;

import android.graphics.drawable.Drawable;

// Referenced classes of package com.android.settings.drawable:
//            DrawableWrapper

public class InsetBoundsDrawable extends DrawableWrapper
{

    private final int mInsetBoundsSides;

    public InsetBoundsDrawable(Drawable drawable, int i)
    {
        super(drawable);
        mInsetBoundsSides = i;
    }

    public void setBounds(int i, int j, int k, int l)
    {
        super.setBounds(i + mInsetBoundsSides, j, k - mInsetBoundsSides, l);
    }
}
