// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.animation.ObjectAnimator;
import android.animation.TimeAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import java.util.ArrayDeque;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelBar

public class PanelView extends FrameLayout
{
    private static class FlingTracker
    {

        static final boolean DEBUG;
        static FlingTracker sTracker;
        final float DECAY = 0.75F;
        final int MAX_EVENTS = 8;
        ArrayDeque mEventBuf;
        float mVX;
        float mVY;

        static FlingTracker obtain()
        {
            if (sTracker == null)
                sTracker = new FlingTracker();
            return sTracker;
        }

        public void addMovement(MotionEvent motionevent)
        {
            if (mEventBuf.size() == 8)
                mEventBuf.remove();
            mEventBuf.add(new MotionEventCopy(motionevent.getX(), motionevent.getY(), motionevent.getEventTime()));
        }

        public void computeCurrentVelocity(long l)
        {
            mVY = 0.0F;
            mVX = 0.0F;
            MotionEventCopy motioneventcopy = null;
            int i = 0;
            int j = 0;
            float f = 0.0F;
            float f1 = 10F;
            Iterator iterator = mEventBuf.descendingIterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                MotionEventCopy motioneventcopy1 = (MotionEventCopy)iterator.next();
                if (motioneventcopy != null)
                {
                    float f2 = (float)(motioneventcopy1.t - motioneventcopy.t) / (float)l;
                    if (f2 == 0.0F)
                    {
                        motioneventcopy = motioneventcopy1;
                        continue;
                    }
                    float f3 = motioneventcopy1.x - motioneventcopy.x;
                    float f4 = motioneventcopy1.y - motioneventcopy.y;
                    mVX = mVX + (f1 * f3) / f2;
                    mVY = mVY + (f1 * f4) / f2;
                    f += f1;
                    f1 *= 0.75F;
                    j++;
                }
                motioneventcopy = motioneventcopy1;
                i++;
            } while (true);
            if (j != 0)
            {
                mVX = mVX / f;
                mVY = mVY / f;
            }
        }

        public float getXVelocity()
        {
            return mVX;
        }

        public float getYVelocity()
        {
            return mVY;
        }

        public void recycle()
        {
            mEventBuf.clear();
        }

        public FlingTracker()
        {
            mEventBuf = new ArrayDeque(8);
            mVY = 0.0F;
        }
    }

    private static class FlingTracker.MotionEventCopy
    {

        public long t;
        public float x;
        public float y;

        public FlingTracker.MotionEventCopy(float f, float f1, long l)
        {
            x = f;
            y = f1;
            t = l;
        }
    }


    public static final boolean BRAKES;
    public static final boolean DEBUG;
    public static final String TAG = com/android/systemui/statusbar/phone/PanelView.getSimpleName();
    private int mAbsPos[];
    private float mAccel;
    private final android.animation.TimeAnimator.TimeListener mAnimationCallback = new android.animation.TimeAnimator.TimeListener() {

        final PanelView this$0;

        public void onTimeUpdate(TimeAnimator timeanimator, long l, long l1)
        {
            animationTick(l1);
        }

            
            {
                this$0 = PanelView.this;
                super();
            }
    }
;
    PanelBar mBar;
    private float mBrakingSpeedPx;
    private boolean mClosing;
    private float mCollapseAccelPx;
    private float mCollapseBrakingDistancePx;
    private float mCollapseMinDisplayFraction;
    private float mExpandAccelPx;
    private float mExpandBrakingDistancePx;
    private float mExpandMinDisplayFraction;
    private float mExpandedFraction;
    private float mExpandedHeight;
    protected float mFinalTouchY;
    private float mFlingCollapseMinVelocityPx;
    private float mFlingExpandMinVelocityPx;
    private float mFlingGestureMaxOutputVelocityPx;
    private float mFlingGestureMaxXVelocityPx;
    private float mFlingGestureMinDistPx;
    private int mFullHeight;
    private View mHandleView;
    protected float mInitialTouchY;
    private boolean mIsFirstAnimTick;
    private boolean mJustPeeked;
    private ObjectAnimator mPeekAnimator;
    private float mPeekHeight;
    private boolean mRubberbanding;
    private boolean mRubberbandingEnabled;
    private float mSelfCollapseVelocityPx;
    private float mSelfExpandVelocityPx;
    private final Runnable mStopAnimator = new Runnable() {

        final PanelView this$0;

        public void run()
        {
            if (mTimeAnimator != null && mTimeAnimator.isStarted())
            {
                mTimeAnimator.end();
                mRubberbanding = false;
                mClosing = false;
            }
        }

            
            {
                this$0 = PanelView.this;
                super();
            }
    }
;
    private TimeAnimator mTimeAnimator;
    private float mTouchOffset;
    private boolean mTracking;
    private float mVel;
    private FlingTracker mVelocityTracker;
    private String mViewName;

    public PanelView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mRubberbandingEnabled = true;
        mCollapseBrakingDistancePx = 200F;
        mExpandBrakingDistancePx = 150F;
        mBrakingSpeedPx = 150F;
        mExpandedFraction = 0.0F;
        mExpandedHeight = 0.0F;
        mAbsPos = new int[2];
        mIsFirstAnimTick = true;
        mFullHeight = 0;
        mTimeAnimator = new TimeAnimator();
        mTimeAnimator.setTimeListener(mAnimationCallback);
    }

    private void animationTick(long l)
    {
        boolean flag = true;
        if (!mTimeAnimator.isStarted())
        {
            mTimeAnimator = new TimeAnimator();
            mTimeAnimator.setTimeListener(mAnimationCallback);
            if (mPeekAnimator != null)
                mPeekAnimator.cancel();
            mTimeAnimator.start();
            boolean flag1;
            if (mRubberbandingEnabled && mExpandedHeight > getFullHeight() && mVel >= -mFlingGestureMinDistPx)
                flag1 = flag;
            else
                flag1 = false;
            mRubberbanding = flag1;
            if (mRubberbanding)
            {
                mClosing = flag;
            } else
            {
                if (mVel == 0.0F)
                {
                    if (mFinalTouchY / getFullHeight() >= 0.5F)
                        flag = false;
                    mClosing = flag;
                    return;
                }
                if (mExpandedHeight <= 0.0F || mVel >= 0.0F)
                    flag = false;
                mClosing = flag;
                return;
            }
        } else
        if (l > 0L)
        {
            float f = 0.001F * (float)l;
            float f1 = getFullHeight();
            float f2;
            if (mClosing)
                f2 = -mCollapseAccelPx;
            else
                f2 = mExpandAccelPx;
            mAccel = f2;
            mVel = mVel + f * mAccel;
            if (false)
            {
                if (mClosing && mVel > -mBrakingSpeedPx)
                    mVel = -mBrakingSpeedPx;
                else
                if (!mClosing && mVel < mBrakingSpeedPx)
                    mVel = mBrakingSpeedPx;
            } else
            if (mClosing && mVel > -mFlingCollapseMinVelocityPx)
                mVel = -mFlingCollapseMinVelocityPx;
            else
            if (!mClosing && mVel > mFlingGestureMaxOutputVelocityPx)
                mVel = mFlingGestureMaxOutputVelocityPx;
            float f3 = mExpandedHeight + f * mVel;
            if (mRubberbanding && f3 < f1)
                f3 = f1;
            setExpandedHeightInternal(f3);
            mBar.panelExpansionChanged(this, mExpandedFraction);
            if (mVel == 0.0F || mClosing && mExpandedHeight == 0.0F || (mRubberbanding || !mClosing) && mExpandedHeight == f1)
            {
                post(mStopAnimator);
                return;
            }
        }
    }

    private float getFullHeight()
    {
        if (mFullHeight <= 0 || mIsFirstAnimTick)
        {
            measure(android.view.View.MeasureSpec.makeMeasureSpec(-2, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(-2, 0x40000000));
            mIsFirstAnimTick = false;
        }
        return (float)mFullHeight;
    }

    private void loadDimens()
    {
        Resources resources = getContext().getResources();
        mSelfExpandVelocityPx = resources.getDimension(0x7f0d0020);
        mSelfCollapseVelocityPx = resources.getDimension(0x7f0d0021);
        mFlingExpandMinVelocityPx = resources.getDimension(0x7f0d0022);
        mFlingCollapseMinVelocityPx = resources.getDimension(0x7f0d0023);
        mFlingGestureMinDistPx = resources.getDimension(0x7f0d0026);
        mCollapseMinDisplayFraction = resources.getFraction(0x7f0d0027, 1, 1);
        mExpandMinDisplayFraction = resources.getFraction(0x7f0d0028, 1, 1);
        mExpandAccelPx = resources.getDimension(0x7f0d0029);
        mCollapseAccelPx = resources.getDimension(0x7f0d002a);
        mFlingGestureMaxXVelocityPx = resources.getDimension(0x7f0d0024);
        mFlingGestureMaxOutputVelocityPx = resources.getDimension(0x7f0d0025);
        float f = resources.getDimension(0x7f0d0043) + (float)getPaddingBottom();
        int i;
        if (mHandleView == null)
            i = 0;
        else
            i = mHandleView.getPaddingTop();
        mPeekHeight = f - (float)i;
    }

    private void runPeekAnimation()
    {
        if (mTimeAnimator.isStarted())
            return;
        if (mPeekAnimator == null)
        {
            float af[] = new float[1];
            af[0] = mPeekHeight;
            mPeekAnimator = ObjectAnimator.ofFloat(this, "expandedHeight", af).setDuration(250L);
        }
        mPeekAnimator.start();
    }

    private void stopTracking()
    {
        if (!mTracking)
        {
            return;
        } else
        {
            mTracking = false;
            mHandleView.setPressed(false);
            postInvalidate();
            mBar.onTrackingStopped(this);
            mVelocityTracker.recycle();
            mVelocityTracker = null;
            return;
        }
    }

    private void trackMovement(MotionEvent motionevent)
    {
        float f = motionevent.getRawX() - motionevent.getX();
        float f1 = motionevent.getRawY() - motionevent.getY();
        motionevent.offsetLocation(f, f1);
        if (mVelocityTracker != null)
            mVelocityTracker.addMovement(motionevent);
        motionevent.offsetLocation(-f, -f1);
    }

    public final transient void LOG(String s, Object aobj[])
    {
    }

    protected void cancelTimeAnimator()
    {
        if (mTimeAnimator != null)
            mTimeAnimator.cancel();
    }

    public void collapse()
    {
        if (!isFullyCollapsed())
        {
            mTimeAnimator.cancel();
            mClosing = true;
            mRubberbanding = false;
            fling(-mSelfCollapseVelocityPx, true);
            stopTracking();
        }
    }

    public void expand()
    {
        if (isFullyCollapsed())
        {
            mBar.startOpeningPanel(this);
            fling(mSelfExpandVelocityPx, true);
        }
    }

    public void expandSlow()
    {
        LOG((new StringBuilder()).append("expandSlow: ").append(this).toString(), new Object[0]);
        if (isFullyCollapsed())
        {
            mBar.startOpeningPanel(this);
            fling(mFlingExpandMinVelocityPx, true);
            return;
        } else
        {
            LOG("skipping expansion: is expanded", new Object[0]);
            return;
        }
    }

    public void fling(float f, boolean flag)
    {
        mVel = f;
        if (flag || mVel != 0.0F)
            animationTick(0L);
    }

    public float getExpandedFraction()
    {
        return mExpandedFraction;
    }

    public float getExpandedHeight()
    {
        return mExpandedHeight;
    }

    public View getHandle()
    {
        return mHandleView;
    }

    public String getName()
    {
        return mViewName;
    }

    public boolean isCollapsing()
    {
        return mClosing;
    }

    public boolean isFullyCollapsed()
    {
        return mExpandedHeight <= 0.0F;
    }

    public boolean isFullyExpanded()
    {
        return mExpandedHeight >= getFullHeight();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mViewName = getResources().getResourceName(getId());
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mHandleView = findViewById(0x7f080037);
        loadDimens();
        if (mHandleView != null)
            mHandleView.setOnTouchListener(new android.view.View.OnTouchListener() {

                final PanelView this$0;

                public boolean onTouch(View view, MotionEvent motionevent)
                {
                    if (!isCollapsing() && (motionevent.getAction() == 0 || mTracking))
                    {
                        float f = motionevent.getY();
                        float f1 = motionevent.getRawY();
                        getLocationOnScreen(mAbsPos);
                        switch (motionevent.getAction())
                        {
                        default:
                            break;

                        case 1: // '\001'
                        case 3: // '\003'
                            mFinalTouchY = f;
                            mTracking = false;
                            mHandleView.setPressed(false);
                            postInvalidate();
                            mBar.onTrackingStopped(PanelView.this);
                            trackMovement(motionevent);
                            FlingTracker flingtracker = mVelocityTracker;
                            boolean flag = false;
                            float f3 = 0.0F;
                            if (flingtracker != null)
                            {
                                mVelocityTracker.computeCurrentVelocity(1000L);
                                float f4 = mVelocityTracker.getYVelocity();
                                if (f4 < 0.0F)
                                    flag = true;
                                else
                                    flag = false;
                                float f5 = mVelocityTracker.getXVelocity();
                                if (f5 < 0.0F)
                                    f5 = -f5;
                                if (f5 > mFlingGestureMaxXVelocityPx)
                                    f5 = mFlingGestureMaxXVelocityPx;
                                f3 = (float)Math.hypot(f4, f5);
                                if (f3 > mFlingGestureMaxOutputVelocityPx)
                                    f3 = mFlingGestureMaxOutputVelocityPx;
                                mVelocityTracker.recycle();
                                mVelocityTracker = null;
                            }
                            if (Math.abs(mFinalTouchY - mInitialTouchY) < mFlingGestureMinDistPx || f3 < mFlingExpandMinVelocityPx)
                                f3 = 0.0F;
                            if (flag)
                                f3 = -f3;
                            fling(f3, true);
                            break;

                        case 2: // '\002'
                            float f2 = f1 - (float)mAbsPos[1] - mTouchOffset;
                            if (f2 > mPeekHeight)
                            {
                                if (mPeekAnimator != null && mPeekAnimator.isRunning())
                                    mPeekAnimator.cancel();
                                mJustPeeked = false;
                            }
                            if (!mJustPeeked)
                            {
                                setExpandedHeightInternal(f2);
                                mBar.panelExpansionChanged(PanelView.this, mExpandedFraction);
                            }
                            trackMovement(motionevent);
                            break;

                        case 0: // '\0'
                            mTracking = true;
                            mHandleView.setPressed(true);
                            postInvalidate();
                            mInitialTouchY = f;
                            mVelocityTracker = FlingTracker.obtain();
                            trackMovement(motionevent);
                            mTimeAnimator.cancel();
                            mBar.onTrackingStarted(PanelView.this);
                            mTouchOffset = f1 - (float)mAbsPos[1] - getExpandedHeight();
                            if (mExpandedHeight == 0.0F)
                            {
                                mJustPeeked = true;
                                runPeekAnimation();
                            }
                            break;
                        }
                        return true;
                    } else
                    {
                        return true;
                    }
                }

            
            {
                this$0 = PanelView.this;
                super();
            }
            }
);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        int k = getMeasuredHeight();
        if (k != mFullHeight)
        {
            mFullHeight = k;
            if (!mTracking && !mRubberbanding && !mTimeAnimator.isStarted() && mExpandedHeight > 0.0F && mExpandedHeight != (float)mFullHeight)
                mExpandedHeight = mFullHeight;
        }
        setMeasuredDimension(i, android.view.View.MeasureSpec.makeMeasureSpec((int)mExpandedHeight, 0x80000000));
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mHandleView.dispatchTouchEvent(motionevent);
    }

    protected void onViewAdded(View view)
    {
    }

    public void setBar(PanelBar panelbar)
    {
        mBar = panelbar;
    }

    public void setExpandedFraction(float f)
    {
        setExpandedHeight(f * getFullHeight());
    }

    public void setExpandedHeight(float f)
    {
        mRubberbanding = false;
        if (mTimeAnimator.isRunning())
            post(mStopAnimator);
        setExpandedHeightInternal(f);
        mBar.panelExpansionChanged(this, mExpandedFraction);
    }

    public void setExpandedHeightInternal(float f)
    {
        float f1 = getFullHeight();
        if (f1 != 0.0F);
        if (f < 0.0F)
            f = 0.0F;
        if ((!mRubberbandingEnabled || !mTracking && !mRubberbanding) && f > f1)
            f = f1;
        mExpandedHeight = f;
        requestLayout();
        int i = f1 != 0.0F;
        float f2 = 0.0F;
        if (i != 0)
            f2 = f / f1;
        mExpandedFraction = Math.min(1.0F, f2);
    }

    public void setRubberbandingEnabled(boolean flag)
    {
        mRubberbandingEnabled = flag;
    }







/*
    static boolean access$1102(PanelView panelview, boolean flag)
    {
        panelview.mJustPeeked = flag;
        return flag;
    }

*/










/*
    static boolean access$202(PanelView panelview, boolean flag)
    {
        panelview.mRubberbanding = flag;
        return flag;
    }

*/


/*
    static boolean access$302(PanelView panelview, boolean flag)
    {
        panelview.mClosing = flag;
        return flag;
    }

*/



/*
    static boolean access$402(PanelView panelview, boolean flag)
    {
        panelview.mTracking = flag;
        return flag;
    }

*/





/*
    static FlingTracker access$702(PanelView panelview, FlingTracker flingtracker)
    {
        panelview.mVelocityTracker = flingtracker;
        return flingtracker;
    }

*/




/*
    static float access$902(PanelView panelview, float f)
    {
        panelview.mTouchOffset = f;
        return f;
    }

*/
}
