// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.view.MotionEvent;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.oobe.utils:
//            OOBEGesturerCallback

public class OOBEGesturer
    implements android.view.GestureDetector.OnGestureListener
{

    private static final float MIN_FLING_DISTANCE = 100F;
    private static final String TAG = "OOBE";
    private OOBEGesturerCallback mCallBacker;
    private int mStepIndex;
    private int mTotalStep;

    public OOBEGesturer(OOBEGesturerCallback oobegesturercallback, int i, int j)
    {
        mCallBacker = oobegesturercallback;
        mTotalStep = i;
        mStepIndex = j;
    }

    public boolean onDown(MotionEvent motionevent)
    {
        return false;
    }

    public boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        Xlog.d("OOBE", "OOBEGesturer.[onFling]");
        float f2 = motionevent.getX();
        float f3 = motionevent.getY();
        float f4 = motionevent1.getX();
        float f5 = motionevent1.getY();
        Xlog.d("OOBE", (new StringBuilder()).append("OOBEGesturer: (x0,y0)==(").append(f2).append(",").append(f3).append(")      (x1,y1)==(").append(f4).append(",").append(f5).append(")").toString());
        if (f2 - f4 > 100F && Math.abs(f2 - f4) > Math.abs(f3 - f5))
        {
            Xlog.i("OOBE", "Fling to left.");
            return onLeftFling();
        }
        if (f4 - f2 > 100F && Math.abs(f2 - f4) > Math.abs(f3 - f5))
        {
            Xlog.i("OOBE", "Fling to right.");
            return onRightFling();
        } else
        {
            return false;
        }
    }

    public boolean onLeftFling()
    {
        if (mTotalStep > mStepIndex)
        {
            mCallBacker.onNextStep(true);
            return true;
        } else
        {
            return false;
        }
    }

    public void onLongPress(MotionEvent motionevent)
    {
    }

    public boolean onRightFling()
    {
        if (mStepIndex > 1)
        {
            mCallBacker.onNextStep(false);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        return false;
    }

    public void onShowPress(MotionEvent motionevent)
    {
    }

    public boolean onSingleTapUp(MotionEvent motionevent)
    {
        return false;
    }
}
