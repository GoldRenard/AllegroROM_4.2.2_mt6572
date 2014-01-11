// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.view.*;

// Referenced classes of package android.support.v4.view:
//            MotionEventCompat, VelocityTrackerCompat

public class GestureDetectorCompat
{
    static interface GestureDetectorCompatImpl
    {

        public abstract boolean isLongpressEnabled();

        public abstract boolean onTouchEvent(MotionEvent motionevent);

        public abstract void setIsLongpressEnabled(boolean flag);

        public abstract void setOnDoubleTapListener(android.view.GestureDetector.OnDoubleTapListener ondoubletaplistener);
    }

    static class GestureDetectorCompatImplBase
        implements GestureDetectorCompatImpl
    {

        private static final int DOUBLE_TAP_TIMEOUT = ViewConfiguration.getDoubleTapTimeout();
        private static final int LONGPRESS_TIMEOUT = ViewConfiguration.getLongPressTimeout();
        private static final int LONG_PRESS = 2;
        private static final int SHOW_PRESS = 1;
        private static final int TAP = 3;
        private static final int TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
        private boolean mAlwaysInBiggerTapRegion;
        private boolean mAlwaysInTapRegion;
        private MotionEvent mCurrentDownEvent;
        private android.view.GestureDetector.OnDoubleTapListener mDoubleTapListener;
        private int mDoubleTapSlopSquare;
        private float mDownFocusX;
        private float mDownFocusY;
        private final Handler mHandler;
        private boolean mInLongPress;
        private boolean mIsDoubleTapping;
        private boolean mIsLongpressEnabled;
        private float mLastFocusX;
        private float mLastFocusY;
        private final android.view.GestureDetector.OnGestureListener mListener;
        private int mMaximumFlingVelocity;
        private int mMinimumFlingVelocity;
        private MotionEvent mPreviousUpEvent;
        private boolean mStillDown;
        private int mTouchSlopSquare;
        private VelocityTracker mVelocityTracker;

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
            if (context == null)
                throw new IllegalArgumentException("Context must not be null");
            if (mListener == null)
            {
                throw new IllegalArgumentException("OnGestureListener must not be null");
            } else
            {
                mIsLongpressEnabled = true;
                ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
                int i = viewconfiguration.getScaledTouchSlop();
                int j = viewconfiguration.getScaledDoubleTapSlop();
                mMinimumFlingVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
                mMaximumFlingVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
                mTouchSlopSquare = i * i;
                mDoubleTapSlopSquare = j * j;
                return;
            }
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
            int k;
            float f2;
            float f3;
            int j1;
            boolean flag1;
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
                j = MotionEventCompat.getActionIndex(motionevent);
            else
                j = -1;
            float f = 0.0F;
            float f1 = 0.0F;
            k = MotionEventCompat.getPointerCount(motionevent);
            for (int l = 0; l < k; l++)
                if (j != l)
                {
                    f += MotionEventCompat.getX(motionevent, l);
                    f1 += MotionEventCompat.getY(motionevent, l);
                }

            int i1;
            if (flag)
                i1 = k - 1;
            else
                i1 = k;
            f2 = f / (float)i1;
            f3 = f1 / (float)i1;
            j1 = i & 0xff;
            flag1 = false;
            j1;
            JVM INSTR tableswitch 0 6: default 1121
        //                       0 703
        //                       1 210
        //                       2 455
        //                       3 204
        //                       4 1121
        //                       5 1124
        //                       6 969;
               goto _L1 _L2 _L3 _L4 _L5 _L1 _L6 _L7
_L1:
            break MISSING_BLOCK_LABEL_1121;
_L5:
            cancel();
            return false;
_L3:
            MotionEvent motionevent1;
            boolean flag6;
label0:
            {
                mStillDown = false;
                motionevent1 = MotionEvent.obtain(motionevent);
                if (mIsDoubleTapping)
                {
                    flag6 = false | mDoubleTapListener.onDoubleTapEvent(motionevent);
                    break label0;
                }
                if (mInLongPress)
                {
                    mHandler.removeMessages(3);
                    mInLongPress = false;
                    flag6 = false;
                    break label0;
                }
                if (mAlwaysInTapRegion)
                {
                    flag6 = mListener.onSingleTapUp(motionevent);
                    break label0;
                }
                VelocityTracker velocitytracker = mVelocityTracker;
                int i4 = MotionEventCompat.getPointerId(motionevent, 0);
                velocitytracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
                float f8 = VelocityTrackerCompat.getYVelocity(velocitytracker, i4);
                float f9 = VelocityTrackerCompat.getXVelocity(velocitytracker, i4);
                if (Math.abs(f8) <= (float)mMinimumFlingVelocity)
                {
                    int j4 = Math.abs(f9) != (float)mMinimumFlingVelocity;
                    flag6 = false;
                    if (j4 <= 0)
                        break label0;
                }
                flag6 = mListener.onFling(mCurrentDownEvent, motionevent, f9, f8);
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
            return flag6;
_L4:
            boolean flag4 = mInLongPress;
            flag1 = false;
            if (flag4)
                break MISSING_BLOCK_LABEL_1121;
            float f6 = mLastFocusX - f2;
            float f7 = mLastFocusY - f3;
            if (mIsDoubleTapping)
                return false | mDoubleTapListener.onDoubleTapEvent(motionevent);
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
                if (k3 > mTouchSlopSquare)
                {
                    mAlwaysInBiggerTapRegion = false;
                    return flag1;
                }
                break MISSING_BLOCK_LABEL_1121;
            }
            if (Math.abs(f6) < 1.0F)
            {
                int l2 = Math.abs(f7) != 1.0F;
                flag1 = false;
                if (l2 < 0)
                    break MISSING_BLOCK_LABEL_1121;
            }
            boolean flag5 = mListener.onScroll(mCurrentDownEvent, motionevent, f6, f7);
            mLastFocusX = f2;
            mLastFocusY = f3;
            return flag5;
_L2:
            android.view.GestureDetector.OnDoubleTapListener ondoubletaplistener = mDoubleTapListener;
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
            return flag2 | mListener.onDown(motionevent);
_L7:
            mLastFocusX = f2;
            mDownFocusX = f2;
            mLastFocusY = f3;
            mDownFocusY = f3;
            mVelocityTracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
            int k1 = MotionEventCompat.getActionIndex(motionevent);
            int l1 = MotionEventCompat.getPointerId(motionevent, k1);
            float f4 = VelocityTrackerCompat.getXVelocity(mVelocityTracker, l1);
            float f5 = VelocityTrackerCompat.getYVelocity(mVelocityTracker, l1);
            int i2 = 0;
            do
            {
                int j2 = i2;
                flag1 = false;
                if (j2 >= k)
                    break;
                if (i2 != k1)
                {
                    int k2 = MotionEventCompat.getPointerId(motionevent, i2);
                    if (f4 * VelocityTrackerCompat.getXVelocity(mVelocityTracker, k2) + f5 * VelocityTrackerCompat.getYVelocity(mVelocityTracker, k2) < 0.0F)
                    {
                        mVelocityTracker.clear();
                        return false;
                    }
                }
                i2++;
            } while (true);
            return flag1;
_L6:
            mLastFocusX = f2;
            mDownFocusX = f2;
            mLastFocusY = f3;
            mDownFocusY = f3;
            cancelTaps();
            return false;
        }

        public void setIsLongpressEnabled(boolean flag)
        {
            mIsLongpressEnabled = flag;
        }

        public void setOnDoubleTapListener(android.view.GestureDetector.OnDoubleTapListener ondoubletaplistener)
        {
            mDoubleTapListener = ondoubletaplistener;
        }







        public GestureDetectorCompatImplBase(Context context, android.view.GestureDetector.OnGestureListener ongesturelistener, Handler handler)
        {
            if (handler != null)
                mHandler = new GestureHandler(handler);
            else
                mHandler = new GestureHandler();
            mListener = ongesturelistener;
            if (ongesturelistener instanceof android.view.GestureDetector.OnDoubleTapListener)
                setOnDoubleTapListener((android.view.GestureDetector.OnDoubleTapListener)ongesturelistener);
            init(context);
        }
    }

    private class GestureDetectorCompatImplBase.GestureHandler extends Handler
    {

        final GestureDetectorCompatImplBase this$0;

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

        GestureDetectorCompatImplBase.GestureHandler()
        {
            this$0 = GestureDetectorCompatImplBase.this;
            super();
        }

        GestureDetectorCompatImplBase.GestureHandler(Handler handler)
        {
            this$0 = GestureDetectorCompatImplBase.this;
            super(handler.getLooper());
        }
    }

    static class GestureDetectorCompatImplJellybeanMr1
        implements GestureDetectorCompatImpl
    {

        private final GestureDetector mDetector;

        public boolean isLongpressEnabled()
        {
            return mDetector.isLongpressEnabled();
        }

        public boolean onTouchEvent(MotionEvent motionevent)
        {
            return mDetector.onTouchEvent(motionevent);
        }

        public void setIsLongpressEnabled(boolean flag)
        {
            mDetector.setIsLongpressEnabled(flag);
        }

        public void setOnDoubleTapListener(android.view.GestureDetector.OnDoubleTapListener ondoubletaplistener)
        {
            mDetector.setOnDoubleTapListener(ondoubletaplistener);
        }

        public GestureDetectorCompatImplJellybeanMr1(Context context, android.view.GestureDetector.OnGestureListener ongesturelistener, Handler handler)
        {
            mDetector = new GestureDetector(context, ongesturelistener, handler);
        }
    }


    private final GestureDetectorCompatImpl mImpl;

    public GestureDetectorCompat(Context context, android.view.GestureDetector.OnGestureListener ongesturelistener)
    {
        this(context, ongesturelistener, null);
    }

    public GestureDetectorCompat(Context context, android.view.GestureDetector.OnGestureListener ongesturelistener, Handler handler)
    {
        if (android.os.Build.VERSION.SDK_INT >= 17)
        {
            mImpl = new GestureDetectorCompatImplJellybeanMr1(context, ongesturelistener, handler);
            return;
        } else
        {
            mImpl = new GestureDetectorCompatImplBase(context, ongesturelistener, handler);
            return;
        }
    }

    public boolean isLongpressEnabled()
    {
        return mImpl.isLongpressEnabled();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mImpl.onTouchEvent(motionevent);
    }

    public void setIsLongpressEnabled(boolean flag)
    {
        mImpl.setIsLongpressEnabled(flag);
    }

    public void setOnDoubleTapListener(android.view.GestureDetector.OnDoubleTapListener ondoubletaplistener)
    {
        mImpl.setOnDoubleTapListener(ondoubletaplistener);
    }
}
