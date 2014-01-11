// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.TimeInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;

class Ease
{
    static class Cubic
    {

        public static final TimeInterpolator easeIn = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F;
                return 0.0F + f1 * (f1 * (1.0F * f1));
            }

        }
;
        public static final TimeInterpolator easeInOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 0.5F;
                if (f1 < 1.0F)
                {
                    return 0.0F + f1 * (f1 * (0.5F * f1));
                } else
                {
                    float f2 = f1 - 2.0F;
                    return 0.0F + 0.5F * (2.0F + f2 * (f2 * f2));
                }
            }

        }
;
        public static final TimeInterpolator easeOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F - 1.0F;
                return 0.0F + 1.0F * (1.0F + f1 * (f1 * f1));
            }

        }
;


    }

    static class Fling
    {

        public static final TimeInterpolator easeIn = new AccelerateInterpolator(1.5F);
        public static final TimeInterpolator easeOut = new DecelerateInterpolator(1.5F);


    }

    static class Quad
    {

        public static final TimeInterpolator easeIn = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F;
                return 0.0F + f1 * (1.0F * f1);
            }

        }
;
        public static final TimeInterpolator easeInOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 0.5F;
                if (f1 < 1.0F)
                {
                    return 0.0F + f1 * (0.5F * f1);
                } else
                {
                    float f2 = f1 - 1.0F;
                    return 0.0F + -0.5F * (f2 * (f2 - 2.0F) - 1.0F);
                }
            }

        }
;
        public static final TimeInterpolator easeOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F;
                return 0.0F + -1F * f1 * (f1 - 2.0F);
            }

        }
;


    }

    static class Quart
    {

        public static final TimeInterpolator easeIn = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F;
                return 0.0F + f1 * (f1 * (f1 * (1.0F * f1)));
            }

        }
;
        public static final TimeInterpolator easeInOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 0.5F;
                if (f1 < 1.0F)
                {
                    return 0.0F + f1 * (f1 * (f1 * (0.5F * f1)));
                } else
                {
                    float f2 = f1 - 2.0F;
                    return 0.0F + -0.5F * (f2 * (f2 * (f2 * f2)) - 2.0F);
                }
            }

        }
;
        public static final TimeInterpolator easeOut = new TimeInterpolator() {

            public float getInterpolation(float f)
            {
                float f1 = f / 1.0F - 1.0F;
                return 0.0F + -1F * (f1 * (f1 * (f1 * f1)) - 1.0F);
            }

        }
;


    }


    private static final float DOMAIN = 1F;
    private static final float DURATION = 1F;
    private static final float START;

}
