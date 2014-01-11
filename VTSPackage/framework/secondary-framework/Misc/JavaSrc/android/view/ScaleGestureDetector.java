// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemClock;
import android.util.FloatMath;

// Referenced classes of package android.view:
//            InputEventConsistencyVerifier, ViewConfiguration, MotionEvent

public class ScaleGestureDetector
{
    public static interface OnScaleGestureListener
    {

        public abstract boolean onScale(ScaleGestureDetector scalegesturedetector);

        public abstract boolean onScaleBegin(ScaleGestureDetector scalegesturedetector);

        public abstract void onScaleEnd(ScaleGestureDetector scalegesturedetector);
    }

    public static class SimpleOnScaleGestureListener
        implements OnScaleGestureListener
    {

        public boolean onScale(ScaleGestureDetector scalegesturedetector)
        {
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scalegesturedetector)
        {
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scalegesturedetector)
        {
        }

    }


    private static final String TAG = "ScaleGestureDetector";
    private static final int TOUCH_MIN_MAJOR = 48;
    private static final long TOUCH_STABILIZE_TIME = 128L;
    private final Context mContext;
    private float mCurrSpan;
    private float mCurrSpanX;
    private float mCurrSpanY;
    private long mCurrTime;
    private float mFocusX;
    private float mFocusY;
    private boolean mInProgress;
    private float mInitialSpan;
    private final InputEventConsistencyVerifier mInputEventConsistencyVerifier;
    private final OnScaleGestureListener mListener;
    private int mMinSpan;
    private float mPrevSpan;
    private float mPrevSpanX;
    private float mPrevSpanY;
    private long mPrevTime;
    private int mSpanSlop;
    private int mTouchHistoryDirection;
    private float mTouchHistoryLastAccepted;
    private long mTouchHistoryLastAcceptedTime;
    private float mTouchLower;
    private int mTouchMinMajor;
    private float mTouchUpper;

    public ScaleGestureDetector(Context context, OnScaleGestureListener onscalegesturelistener)
    {
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 0);
        else
            inputeventconsistencyverifier = null;
        mInputEventConsistencyVerifier = inputeventconsistencyverifier;
        mContext = context;
        mListener = onscalegesturelistener;
        mSpanSlop = 2 * ViewConfiguration.get(context).getScaledTouchSlop();
        Resources resources = context.getResources();
        mTouchMinMajor = resources.getDimensionPixelSize(0x105000a);
        mMinSpan = resources.getDimensionPixelSize(0x1050009);
    }

    private void addTouchHistory(MotionEvent motionevent)
    {
        long l = SystemClock.uptimeMillis();
        int i = motionevent.getPointerCount();
        boolean flag;
        if (l - mTouchHistoryLastAcceptedTime >= 128L)
            flag = true;
        else
            flag = false;
        float f = 0.0F;
        int j = 0;
        for (int k = 0; k < i; k++)
        {
            boolean flag1;
            if (!Float.isNaN(mTouchHistoryLastAccepted))
                flag1 = true;
            else
                flag1 = false;
            int i1 = motionevent.getHistorySize();
            int j1 = i1 + 1;
            for (int k1 = 0; k1 < j1; k1++)
            {
                float f3;
                if (k1 < i1)
                    f3 = motionevent.getHistoricalTouchMajor(k, k1);
                else
                    f3 = motionevent.getTouchMajor(k);
                if (f3 < (float)mTouchMinMajor)
                    f3 = mTouchMinMajor;
                f += f3;
                if (Float.isNaN(mTouchUpper) || f3 > mTouchUpper)
                    mTouchUpper = f3;
                if (Float.isNaN(mTouchLower) || f3 < mTouchLower)
                    mTouchLower = f3;
                if (!flag1)
                    continue;
                int l1 = (int)Math.signum(f3 - mTouchHistoryLastAccepted);
                if (l1 == mTouchHistoryDirection && (l1 != 0 || mTouchHistoryDirection != 0))
                    continue;
                mTouchHistoryDirection = l1;
                long l2;
                if (k1 < i1)
                    l2 = motionevent.getHistoricalEventTime(k1);
                else
                    l2 = motionevent.getEventTime();
                mTouchHistoryLastAcceptedTime = l2;
                flag = false;
            }

            j += j1;
        }

        float f1 = f / (float)j;
        if (flag)
        {
            float f2 = (f1 + (mTouchUpper + mTouchLower)) / 3F;
            mTouchUpper = (f2 + mTouchUpper) / 2.0F;
            mTouchLower = (f2 + mTouchLower) / 2.0F;
            mTouchHistoryLastAccepted = f2;
            mTouchHistoryDirection = 0;
            mTouchHistoryLastAcceptedTime = motionevent.getEventTime();
        }
    }

    private void clearTouchHistory()
    {
        mTouchUpper = (0.0F / 0.0F);
        mTouchLower = (0.0F / 0.0F);
        mTouchHistoryLastAccepted = (0.0F / 0.0F);
        mTouchHistoryDirection = 0;
        mTouchHistoryLastAcceptedTime = 0L;
    }

    public float getCurrentSpan()
    {
        return mCurrSpan;
    }

    public float getCurrentSpanX()
    {
        return mCurrSpanX;
    }

    public float getCurrentSpanY()
    {
        return mCurrSpanY;
    }

    public long getEventTime()
    {
        return mCurrTime;
    }

    public float getFocusX()
    {
        return mFocusX;
    }

    public float getFocusY()
    {
        return mFocusY;
    }

    public float getPreviousSpan()
    {
        return mPrevSpan;
    }

    public float getPreviousSpanX()
    {
        return mPrevSpanX;
    }

    public float getPreviousSpanY()
    {
        return mPrevSpanY;
    }

    public float getScaleFactor()
    {
        if (mPrevSpan > 0.0F)
            return mCurrSpan / mPrevSpan;
        else
            return 1.0F;
    }

    public long getTimeDelta()
    {
        return mCurrTime - mPrevTime;
    }

    public boolean isInProgress()
    {
        return mInProgress;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onTouchEvent(motionevent, 0);
        mCurrTime = motionevent.getEventTime();
        int i = motionevent.getActionMasked();
        boolean flag;
        if (i != 1 && i != 3)
            flag = false;
        else
            flag = true;
        if (i == 0 || flag)
        {
            if (mInProgress)
            {
                mListener.onScaleEnd(this);
                mInProgress = false;
                mInitialSpan = 0.0F;
            }
            if (flag)
            {
                clearTouchHistory();
                return true;
            }
        }
        boolean flag1;
        if (i != 0 && i != 6 && i != 5)
            flag1 = false;
        else
            flag1 = true;
        boolean flag2;
        if (i == 6)
            flag2 = true;
        else
            flag2 = false;
        int j;
        if (flag2)
            j = motionevent.getActionIndex();
        else
            j = -1;
        float f = 0.0F;
        float f1 = 0.0F;
        int k = motionevent.getPointerCount();
        for (int l = 0; l < k; l++)
            if (j != l)
            {
                f += motionevent.getX(l);
                f1 += motionevent.getY(l);
            }

        int i1;
        if (flag2)
            i1 = k - 1;
        else
            i1 = k;
        float f2 = f / (float)i1;
        float f3 = f1 / (float)i1;
        addTouchHistory(motionevent);
        float f4 = 0.0F;
        float f5 = 0.0F;
        for (int j1 = 0; j1 < k; j1++)
            if (j != j1)
            {
                float f11 = mTouchHistoryLastAccepted / 2.0F;
                f4 += f11 + Math.abs(motionevent.getX(j1) - f2);
                f5 += f11 + Math.abs(motionevent.getY(j1) - f3);
            }

        float f6 = f4 / (float)i1;
        float f7 = f5 / (float)i1;
        float f8 = f6 * 2.0F;
        float f9 = f7 * 2.0F;
        float f10 = FloatMath.sqrt(f8 * f8 + f9 * f9);
        boolean flag3 = mInProgress;
        mFocusX = f2;
        mFocusY = f3;
        if (mInProgress && (f10 < (float)mMinSpan || flag1))
        {
            mListener.onScaleEnd(this);
            mInProgress = false;
            mInitialSpan = f10;
        }
        if (flag1)
        {
            mCurrSpanX = f8;
            mPrevSpanX = f8;
            mCurrSpanY = f9;
            mPrevSpanY = f9;
            mCurrSpan = f10;
            mPrevSpan = f10;
            mInitialSpan = f10;
        }
        if (!mInProgress && f10 >= (float)mMinSpan && (flag3 || Math.abs(f10 - mInitialSpan) > (float)mSpanSlop))
        {
            mCurrSpanX = f8;
            mPrevSpanX = f8;
            mCurrSpanY = f9;
            mPrevSpanY = f9;
            mCurrSpan = f10;
            mPrevSpan = f10;
            mPrevTime = mCurrTime;
            mInProgress = mListener.onScaleBegin(this);
        }
        if (i == 2)
        {
            mCurrSpanX = f8;
            mCurrSpanY = f9;
            mCurrSpan = f10;
            boolean flag4 = true;
            if (mInProgress)
                flag4 = mListener.onScale(this);
            if (flag4)
            {
                mPrevSpanX = mCurrSpanX;
                mPrevSpanY = mCurrSpanY;
                mPrevSpan = mCurrSpan;
                mPrevTime = mCurrTime;
            }
        }
        return true;
    }
}
