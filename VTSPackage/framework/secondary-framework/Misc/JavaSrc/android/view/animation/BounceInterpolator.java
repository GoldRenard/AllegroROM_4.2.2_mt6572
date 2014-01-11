// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.util.AttributeSet;

// Referenced classes of package android.view.animation:
//            Interpolator

public class BounceInterpolator
    implements Interpolator
{


    public BounceInterpolator(Context context, AttributeSet attributeset)
    {
    }

    private static float bounce(float f)
    {
        return 8F * (f * f);
    }

    public float getInterpolation(float f)
    {
        float f1 = f * 1.1226F;
        if (f1 < 0.3535F)
            return bounce(f1);
        if (f1 < 0.7408F)
            return 0.7F + bounce(f1 - 0.54719F);
        if (f1 < 0.9644F)
            return 0.9F + bounce(f1 - 0.8526F);
        else
            return 0.95F + bounce(f1 - 1.0435F);
    }
}
