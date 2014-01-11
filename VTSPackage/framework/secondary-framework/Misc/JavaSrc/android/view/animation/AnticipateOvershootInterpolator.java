// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

// Referenced classes of package android.view.animation:
//            Interpolator

public class AnticipateOvershootInterpolator
    implements Interpolator
{

    private final float mTension;

    public AnticipateOvershootInterpolator()
    {
        mTension = 3F;
    }

    public AnticipateOvershootInterpolator(float f)
    {
        mTension = 1.5F * f;
    }

    public AnticipateOvershootInterpolator(float f, float f1)
    {
        mTension = f * f1;
    }

    public AnticipateOvershootInterpolator(Context context, AttributeSet attributeset)
    {
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.AnticipateOvershootInterpolator);
        mTension = typedarray.getFloat(0, 2.0F) * typedarray.getFloat(1, 1.5F);
        typedarray.recycle();
    }

    private static float a(float f, float f1)
    {
        return f * f * (f * (1.0F + f1) - f1);
    }

    private static float o(float f, float f1)
    {
        return f * f * (f1 + f * (1.0F + f1));
    }

    public float getInterpolation(float f)
    {
        if (f < 0.5F)
            return 0.5F * a(f * 2.0F, mTension);
        else
            return 0.5F * (2.0F + o(f * 2.0F - 2.0F, mTension));
    }
}
