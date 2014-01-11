// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;

// Referenced classes of package android.widget:
//            LinearLayout

public class AlphaLinearLayout extends LinearLayout
{

    private static final Animation ANIMATION = new AlphaAnimation(0.2F, 1.0F);

    public AlphaLinearLayout(Context context)
    {
        super(context);
        init();
    }

    public AlphaLinearLayout(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        init();
    }

    private void init()
    {
        ANIMATION.setDuration(800L);
    }

    public void startAlpha(int i)
    {
        startAnimation(ANIMATION);
    }

}
