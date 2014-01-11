// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.animation;

import android.content.Context;
import android.util.AttributeSet;

// Referenced classes of package android.view.animation:
//            Interpolator

public class LinearInterpolator
    implements Interpolator
{


    public LinearInterpolator(Context context, AttributeSet attributeset)
    {
    }

    public float getInterpolation(float f)
    {
        return f;
    }
}
