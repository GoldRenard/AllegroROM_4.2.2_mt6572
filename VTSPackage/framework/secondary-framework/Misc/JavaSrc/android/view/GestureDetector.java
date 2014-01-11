// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.os.Handler;
import android.os.Message;

// Referenced classes of package android.view:
//            ViewConfiguration, InputEventConsistencyVerifier, VelocityTracker, MotionEvent

public class GestureDetector
{
    private class GestureHandler extends Handler
    {

        final GestureDetector this$0;

        public void handleMessage(Message message)
        {
label0:
            {
                switch (message.what)
                {
                default:
                    break label0;

                case 3: // '\003'
                    if (mDoubleTapListener != null && !mStillDown)
                    {
                        mDoubleTapListener.onSingleTapConfirmed(mCurrentDownEvent);
                        return;
                    }
                    break;

                case 2: // '\002'
                    dispatchLongPress();
                    return;

                case 1: // '\001'
                    mListener.onShowPress(mCurrentDownEvent);
                    break;
                }
                return;
            }
            throw new RuntimeException((new StringBuilder()).append("Unknown message ").append(message).toString());
        }

        GestureHandler()
        {
            this$0 = GestureDetector.this;
            super();
        }

        GestureHandler(Handler handler)
        {
            this$0 = GestureDetector.this;
            super(handler.getLooper());
        }
    }

    public static interface OnDoubleTapListener
    {

        public abstract boolean onDoubleTap(MotionEvent motionevent);

        public abstract boolean onDoubleTapEvent(MotionEvent motionevent);

        public abstract boolean onSingleTapConfirmed(MotionEvent motionevent);
    }

    public static interface OnGestureListener
    {

        public abstract boolean onDown(MotionEvent motionevent);

        public abstract boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1);

        public abstract void onLongPress(MotionEvent motionevent);

        public abstract boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1);

        public abstract void onShowPress(MotionEvent motionevent);

        public abstract boolean onSingleTapUp(MotionEvent motionevent);
    }

    public static class SimpleOnGestureListener
        implements OnGestureListener, OnDoubleTapListener
    {

        public boolean onDoubleTap(MotionEvent motionevent)
        {
            return false;
        }

        public boolean onDoubleTapEvent(MotionEvent motionevent)
        {
            return false;
        }

        public boolean onDown(MotionEvent motionevent)
        {
            return false;
        }

        public boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
        {
            return false;
        }

        public void onLongPress(MotionEvent motionevent)
        {
        }

        public boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
        {
            return false;
        }

        public void onShowPress(MotionEvent motionevent)
        {
        }

        public boolean onSingleTapConfirmed(MotionEvent motionevent)
        {
            return false;
        }

        public boolean onSingleTapUp(MotionEvent motionevent)
        {
            return false;
        }

    }


    private static final int DOUBLE_TAP_TIMEOUT = ViewConfiguration.getDoubleTapTimeout();
    private static final int LONGPRESS_TIMEOUT = ViewConfiguration.getLongPressTimeout();
    private static final int LONG_PRESS = 2;
    private static final int SHOW_PRESS = 1;
    private static final int TAP = 3;
    private static final int TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
    private boolean mAlwaysInBiggerTapRegion;
    private boolean mAlwaysInTapRegion;
    private MotionEvent mCurrentDownEvent;
    private OnDoubleTapListener mDoubleTapListener;
    private int mDoubleTapSlopSquare;
    private int mDoubleTapTouchSlopSquare;
    private float mDownFocusX;
    private float mDownFocusY;
    private final Handler mHandler;
    private boolean mInLongPress;
    private final InputEventConsistencyVerifier mInputEventConsistencyVerifier;
    private boolean mIsDoubleTapping;
    private boolean mIsLongpressEnabled;
    private float mLastFocusX;
    private float mLastFocusY;
    private final OnGestureListener mListener;
    private int mMaximumFlingVelocity;
    private int mMinimumFlingVelocity;
    private MotionEvent mPreviousUpEvent;
    private boolean mStillDown;
    private int mTouchSlopSquare;
    private VelocityTracker mVelocityTracker;

    public GestureDetector(Context context, OnGestureListener ongesturelistener)
    {
        this(context, ongesturelistener, null);
    }

    public GestureDetector(Context context, OnGestureListener ongesturelistener, Handler handler)
    {
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 0);
        else
            inputeventconsistencyverifier = null;
        mInputEventConsistencyVerifier = inputeventconsistencyverifier;
        if (handler != null)
            mHandler = new GestureHandler(handler);
        else
            mHandler = new GestureHandler();
        mListener = ongesturelistener;
        if (ongesturelistener instanceof OnDoubleTapListener)
            setOnDoubleTapListener((OnDoubleTapListener)ongesturelistener);
        init(context);
    }

    public GestureDetector(Context context, OnGestureListener ongesturelistener, Handler handler, boolean flag)
    {
        this(context, ongesturelistener, handler);
    }

    public GestureDetector(OnGestureListener ongesturelistener)
    {
        this(null, ongesturelistener, null);
    }

    public GestureDetector(OnGestureListener ongesturelistener, Handler handler)
    {
        this(null, ongesturelistener, handler);
    }

    private void cancel()
    {
        mHandler.removeMessages(1);
        mHandler.removeMessages(2);
        mHandler.removeMessages(3);
        mVelocityTracker.recycle();
        mVelocityTracker = null;
        mIsDoubleTapping = false;
        mStillDown = false;
        mAlwaysInTapRegion = false;
        mAlwaysInBiggerTapRegion = false;
        if (mInLongPress)
            mInLongPress = false;
    }

    private void cancelTaps()
    {
        mHandler.removeMessages(1);
        mHandler.removeMessages(2);
        mHandler.removeMessages(3);
        mIsDoubleTapping = false;
        mAlwaysInTapRegion = false;
        mAlwaysInBiggerTapRegion = false;
        if (mInLongPress)
            mInLongPress = false;
    }

    private void dispatchLongPress()
    {
        mHandler.removeMessages(3);
        mInLongPress = true;
        mListener.onLongPress(mCurrentDownEvent);
    }

    private void init(Context context)
    {
        if (mListener == null)
            throw new NullPointerException("OnGestureListener must not be null");
        mIsLongpressEnabled = true;
        int i;
        int j;
        int k;
        if (context == null)
        {
            i = ViewConfiguration.getTouchSlop();
            j = i;
            k = ViewConfiguration.getDoubleTapSlop();
            mMinimumFlingVelocity = ViewConfiguration.getMinimumFlingVelocity();
            mMaximumFlingVelocity = ViewConfiguration.getMaximumFlingVelocity();
        } else
        {
            ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
            i = viewconfiguration.getScaledTouchSlop();
            j = viewconfiguration.getScaledDoubleTapTouchSlop();
            k = viewconfiguration.getScaledDoubleTapSlop();
            mMinimumFlingVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
            mMaximumFlingVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        }
        mTouchSlopSquare = i * i;
        mDoubleTapTouchSlopSquare = j * j;
        mDoubleTapSlopSquare = k * k;
    }

    private boolean isConsideredDoubleTap(MotionEvent motionevent, MotionEvent motionevent1, MotionEvent motionevent2)
    {
        if (mAlwaysInBiggerTapRegion && motionevent2.getEventTime() - motionevent1.getEventTime() <= (long)DOUBLE_TAP_TIMEOUT)
        {
            int i = (int)motionevent.getX() - (int)motionevent2.getX();
            int j = (int)motionevent.getY() - (int)motionevent2.getY();
            if (i * i + j * j < mDoubleTapSlopSquare)
                return true;
        }
        return false;
    }

    public boolean isLongpressEnabled()
    {
        return mIsLongpressEnabled;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onTouchEvent(motionevent, 0);
        int i = motionevent.getAction();
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
        boolean flag;
        if ((i & 0xff) == 6)
            flag = true;
        else
            flag = false;
        int j;
        if (flag)
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
        if (flag)
            i1 = k - 1;
        else
            i1 = k;
        float f2 = f / (float)i1;
        float f3 = f1 / (float)i1;
        int j1 = i & 0xff;
        boolean flag1 = false;
        switch (j1)
        {
        case 4: // '\004'
        default:
            break;

        case 3: // '\003'
            cancel();
            flag1 = false;
            break;

        case 1: // '\001'
            MotionEvent motionevent1;
label0:
            {
                mStillDown = false;
                motionevent1 = MotionEvent.obtain(motionevent);
                if (mIsDoubleTapping)
                {
                    flag1 = false | mDoubleTapListener.onDoubleTapEvent(motionevent);
                    break label0;
                }
                if (mInLongPress)
                {
                    mHandler.removeMessages(3);
                    mInLongPress = false;
                    flag1 = false;
                    break label0;
                }
                if (mAlwaysInTapRegion)
                {
                    flag1 = mListener.onSingleTapUp(motionevent);
                    break label0;
                }
                VelocityTracker velocitytracker = mVelocityTracker;
                int i4 = motionevent.getPointerId(0);
                velocitytracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
                float f8 = velocitytracker.getYVelocity(i4);
                float f9 = velocitytracker.getXVelocity(i4);
                if (Math.abs(f8) <= (float)mMinimumFlingVelocity)
                {
                    int j4 = Math.abs(f9) != (float)mMinimumFlingVelocity;
                    flag1 = false;
                    if (j4 <= 0)
                        break label0;
                }
                flag1 = mListener.onFling(mCurrentDownEvent, motionevent, f9, f8);
            }
            if (mPreviousUpEvent != null)
                mPreviousUpEvent.recycle();
            mPreviousUpEvent = motionevent1;
            if (mVelocityTracker != null)
            {
                mVelocityTracker.recycle();
                mVelocityTracker = null;
            }
            mIsDoubleTapping = false;
            mHandler.removeMessages(1);
            mHandler.removeMessages(2);
            break;

        case 2: // '\002'
            boolean flag4 = mInLongPress;
            flag1 = false;
            if (flag4)
                break;
            float f6 = mLastFocusX - f2;
            float f7 = mLastFocusY - f3;
            if (mIsDoubleTapping)
            {
                flag1 = false | mDoubleTapListener.onDoubleTapEvent(motionevent);
                break;
            }
            if (mAlwaysInTapRegion)
            {
                int i3 = (int)(f2 - mDownFocusX);
                int j3 = (int)(f3 - mDownFocusY);
                int k3 = i3 * i3 + j3 * j3;
                int l3 = mTouchSlopSquare;
                flag1 = false;
                if (k3 > l3)
                {
                    flag1 = mListener.onScroll(mCurrentDownEvent, motionevent, f6, f7);
                    mLastFocusX = f2;
                    mLastFocusY = f3;
                    mAlwaysInTapRegion = false;
                    mHandler.removeMessages(3);
                    mHandler.removeMessages(1);
                    mHandler.removeMessages(2);
                }
                if (k3 > mDoubleTapTouchSlopSquare)
                    mAlwaysInBiggerTapRegion = false;
                break;
            }
            if (Math.abs(f6) < 1.0F)
            {
                int l2 = Math.abs(f7) != 1.0F;
                flag1 = false;
                if (l2 < 0)
                    break;
            }
            flag1 = mListener.onScroll(mCurrentDownEvent, motionevent, f6, f7);
            mLastFocusX = f2;
            mLastFocusY = f3;
            break;

        case 0: // '\0'
            OnDoubleTapListener ondoubletaplistener = mDoubleTapListener;
            boolean flag2 = false;
            if (ondoubletaplistener != null)
            {
                boolean flag3 = mHandler.hasMessages(3);
                if (flag3)
                    mHandler.removeMessages(3);
                if (mCurrentDownEvent != null && mPreviousUpEvent != null && flag3 && isConsideredDoubleTap(mCurrentDownEvent, mPreviousUpEvent, motionevent))
                {
                    mIsDoubleTapping = true;
                    flag2 = false | mDoubleTapListener.onDoubleTap(mCurrentDownEvent) | mDoubleTapListener.onDoubleTapEvent(motionevent);
                } else
                {
                    mHandler.sendEmptyMessageDelayed(3, DOUBLE_TAP_TIMEOUT);
                    flag2 = false;
                }
            }
            mLastFocusX = f2;
            mDownFocusX = f2;
            mLastFocusY = f3;
            mDownFocusY = f3;
            if (mCurrentDownEvent != null)
                mCurrentDownEvent.recycle();
            mCurrentDownEvent = MotionEvent.obtain(motionevent);
            mAlwaysInTapRegion = true;
            mAlwaysInBiggerTapRegion = true;
            mStillDown = true;
            mInLongPress = false;
            if (mIsLongpressEnabled)
            {
                mHandler.removeMessages(2);
                mHandler.sendEmptyMessageAtTime(2, mCurrentDownEvent.getDownTime() + (long)TAP_TIMEOUT + (long)LONGPRESS_TIMEOUT);
            }
            mHandler.sendEmptyMessageAtTime(1, mCurrentDownEvent.getDownTime() + (long)TAP_TIMEOUT);
            flag1 = flag2 | mListener.onDown(motionevent);
            break;

        case 6: // '\006'
            mLastFocusX = f2;
            mDownFocusX = f2;
            mLastFocusY = f3;
            mDownFocusY = f3;
            mVelocityTracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
            int k1 = motionevent.getActionIndex();
            int l1 = motionevent.getPointerId(k1);
            float f4 = mVelocityTracker.getXVelocity(l1);
            float f5 = mVelocityTracker.getYVelocity(l1);
            int i2 = 0;
            do
            {
                int j2 = i2;
                flag1 = false;
                if (j2 >= k)
                    break;
                if (i2 != k1)
                {
                    int k2 = motionevent.getPointerId(i2);
                    if (f4 * mVelocityTracker.getXVelocity(k2) + f5 * mVelocityTracker.getYVelocity(k2) < 0.0F)
                    {
                        mVelocityTracker.clear();
                        flag1 = false;
                        break;
                    }
                }
                i2++;
            } while (true);
            break;

        case 5: // '\005'
            mLastFocusX = f2;
            mDownFocusX = f2;
            mLastFocusY = f3;
            mDownFocusY = f3;
            cancelTaps();
            flag1 = false;
            break;
        }
        if (!flag1 && mInputEventConsistencyVerifier != null)
            mInputEventConsistencyVerifier.onUnhandledEvent(motionevent, 0);
        return flag1;
    }

    public void setIsLongpressEnabled(boolean flag)
    {
        mIsLongpressEnabled = flag;
    }

    public void setOnDoubleTapListener(OnDoubleTapListener ondoubletaplistener)
    {
        mDoubleTapListener = ondoubletaplistener;
    }






}
