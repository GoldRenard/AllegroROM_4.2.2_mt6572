// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

// Referenced classes of package android.view.animation:
//            Interpolator

public class AccelerateInterpolator
    implements Interpolator
{

    private final double mDoubleFactor;
    private final float mFactor;

    public AccelerateInterpolator()
    {
        mFactor = 1.0F;
        mDoubleFactor = 2D;
    }

    public AccelerateInterpolator(float f)
    {
        mFactor = f;
        mDoubleFactor = 2.0F * mFactor;
    }

    public AccelerateInterpolator(Context context, AttributeSet attributeset)
    {
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.AccelerateInterpolator);
        mFactor = typedarray.getFloat(0, 1.0F);
        mDoubleFactor = 2.0F * mFactor;
        typedarray.recycle();
    }

    public float getInterpolation(float f)
    {
        if (mFactor == 1.0F)
            return f * f;
        else
            return (float)Math.pow(f, mDoubleFactor);
    }
}
