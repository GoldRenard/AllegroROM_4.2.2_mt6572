// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.view.View;
import android.view.animation.DecelerateInterpolator;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LockScreenNewEventView

public class UnReadHintAnimation
{
    class DoubleEvaluator
        implements TypeEvaluator
    {

        final UnReadHintAnimation this$0;

        public Double evaluate(float f, Double double1, Double double2)
        {
            return Double.valueOf(double1.doubleValue() + (double)f * (double2.doubleValue() - double1.doubleValue()));
        }

        public volatile Object evaluate(float f, Object obj, Object obj1)
        {
            return evaluate(f, (Double)obj, (Double)obj1);
        }

        DoubleEvaluator()
        {
            this$0 = UnReadHintAnimation.this;
            super();
        }
    }


    private static final int DURATION = 220;
    Animator a;
    View child;

    public UnReadHintAnimation(LockScreenNewEventView lockscreenneweventview)
    {
        lockscreenneweventview.setPivotY(0.5F * (float)lockscreenneweventview.getMeasuredHeight());
        lockscreenneweventview.setPivotX(0.5F * (float)lockscreenneweventview.getMeasuredWidth());
        child = lockscreenneweventview;
    }

    private void cancel()
    {
        if (a != null)
            a.cancel();
    }

    public void animate()
    {
        DoubleEvaluator doubleevaluator = new DoubleEvaluator();
        Object aobj[] = new Object[2];
        aobj[0] = Double.valueOf(0.0D);
        aobj[1] = Double.valueOf(2D * Double.valueOf(3.1415926535897931D).doubleValue());
        ValueAnimator valueanimator = ValueAnimator.ofObject(doubleevaluator, aobj);
        a = valueanimator;
        valueanimator.setRepeatCount(2);
        valueanimator.setDuration(220L);
        valueanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

            final UnReadHintAnimation this$0;

            public void onAnimationUpdate(ValueAnimator valueanimator1)
            {
                float f = (float)(10D * Math.sin(((Double)valueanimator1.getAnimatedValue()).floatValue()));
                child.setRotation(f);
            }

            
            {
                this$0 = UnReadHintAnimation.this;
                super();
            }
        }
);
        valueanimator.addListener(new AnimatorListenerAdapter() {

            final UnReadHintAnimation this$0;

            public void onAnimationEnd(Animator animator)
            {
                completeAnimationImmediately();
            }

            
            {
                this$0 = UnReadHintAnimation.this;
                super();
            }
        }
);
        valueanimator.start();
    }

    public void completeAnimationImmediately()
    {
        if (a != null)
            a.cancel();
        a = ObjectAnimator.ofFloat(child, "rotation", new float[] {
            0.0F
        });
        a.setDuration(220L);
        a.setInterpolator(new DecelerateInterpolator(1.5F));
        a.start();
    }
}
