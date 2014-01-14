// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.view.VelocityTracker;

// Referenced classes of package android.support.v4.view:
//            VelocityTrackerCompatHoneycomb

public class VelocityTrackerCompat
{
    static class BaseVelocityTrackerVersionImpl
        implements VelocityTrackerVersionImpl
    {

        public float getXVelocity(VelocityTracker velocitytracker, int i)
        {
            return velocitytracker.getXVelocity();
        }

        public float getYVelocity(VelocityTracker velocitytracker, int i)
        {
            return velocitytracker.getYVelocity();
        }

    }

    static class HoneycombVelocityTrackerVersionImpl
        implements VelocityTrackerVersionImpl
    {

        public float getXVelocity(VelocityTracker velocitytracker, int i)
        {
            return VelocityTrackerCompatHoneycomb.getXVelocity(velocitytracker, i);
        }

        public float getYVelocity(VelocityTracker velocitytracker, int i)
        {
            return VelocityTrackerCompatHoneycomb.getYVelocity(velocitytracker, i);
        }

    }

    static interface VelocityTrackerVersionImpl
    {

        public abstract float getXVelocity(VelocityTracker velocitytracker, int i);

        public abstract float getYVelocity(VelocityTracker velocitytracker, int i);
    }


    static final VelocityTrackerVersionImpl IMPL;


    public static float getXVelocity(VelocityTracker velocitytracker, int i)
    {
        return IMPL.getXVelocity(velocitytracker, i);
    }

    public static float getYVelocity(VelocityTracker velocitytracker, int i)
    {
        return IMPL.getYVelocity(velocitytracker, i);
    }

    static 
    {
        if (android.os.Build.VERSION.SDK_INT >= 11)
            IMPL = new HoneycombVelocityTrackerVersionImpl();
        else
            IMPL = new BaseVelocityTrackerVersionImpl();
    }
}
