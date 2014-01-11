// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

// Referenced classes of package android.view.animation:
//            Interpolator

public class DecelerateInterpolator
    implements Interpolator
{

    private float mFactor;

    public DecelerateInterpolator()
    {
        mFactor = 1.0F;
    }

    public DecelerateInterpolator(float f)
    {
        mFactor = 1.0F;
        mFactor = f;
    }

    public DecelerateInterpolator(Context context, AttributeSet attributeset)
    {
        mFactor = 1.0F;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.DecelerateInterpolator);
        mFactor = typedarray.getFloat(0, 1.0F);
        typedarray.recycle();
    }

    public float getInterpolation(float f)
    {
        if (mFactor == 1.0F)
            return 1.0F - (1.0F - f) * (1.0F - f);
        else
            return (float)(1.0D - Math.pow(1.0F - f, 2.0F * mFactor));
    }
}
