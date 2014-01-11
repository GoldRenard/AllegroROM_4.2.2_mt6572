// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.os.Vibrator;
import android.view.*;

// Referenced classes of package com.android.systemui:
//            Gefingerpoken

public class ExpandHelper
    implements Gefingerpoken, android.view.View.OnClickListener
{
    public static interface Callback
    {

        public abstract boolean canChildBeExpanded(View view);

        public abstract View getChildAtPosition(float f, float f1);

        public abstract View getChildAtRawPosition(float f, float f1);

        public abstract boolean setUserExpandedChild(View view, boolean flag);

        public abstract boolean setUserLockedChild(View view, boolean flag);
    }

    private class ViewScaler
    {

        View mView;
        final ExpandHelper this$0;

        public float getHeight()
        {
            int i = mView.getLayoutParams().height;
            if (i < 0)
                i = mView.getMeasuredHeight();
            return (float)i;
        }

        public int getNaturalHeight(int i)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mView.getLayoutParams();
            int j = layoutparams.height;
            layoutparams.height = -2;
            mView.setLayoutParams(layoutparams);
            mView.measure(android.view.View.MeasureSpec.makeMeasureSpec(mView.getMeasuredWidth(), 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(i, 0x80000000));
            layoutparams.height = j;
            mView.setLayoutParams(layoutparams);
            return mView.getMeasuredHeight();
        }

        public void setHeight(float f)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mView.getLayoutParams();
            layoutparams.height = (int)f;
            mView.setLayoutParams(layoutparams);
            mView.requestLayout();
        }

        public void setView(View view)
        {
            mView = view;
        }

        public ViewScaler()
        {
            this$0 = ExpandHelper.this;
            super();
        }
    }


    private static final int BLINDS = 1;
    protected static final boolean DEBUG = false;
    protected static final boolean DEBUG_GLOW = false;
    protected static final boolean DEBUG_SCALE = false;
    private static final long EXPAND_DURATION = 250L;
    private static final float GLOW_BASE = 0.5F;
    private static final long GLOW_DURATION = 150L;
    private static final int NONE = 0;
    private static final int PULL = 2;
    private static final int STRETCH = 4;
    private static final float STRETCH_INTERVAL = 2F;
    private static final String TAG = "ExpandHelper";
    private static final boolean USE_DRAG = true;
    private static final boolean USE_SPAN = true;
    private Callback mCallback;
    private Context mContext;
    private View mCurrView;
    private View mCurrViewBottomGlow;
    private View mCurrViewTopGlow;
    private View mEventSource;
    private boolean mExpanding;
    private int mExpansionStyle;
    private AnimatorSet mGlowAnimationSet;
    private ObjectAnimator mGlowBottomAnimation;
    private ObjectAnimator mGlowTopAnimation;
    private int mGravity;
    private boolean mHasPopped;
    private float mInitialTouchFocusY;
    private float mInitialTouchSpan;
    private float mInitialTouchY;
    private int mLargeSize;
    private float mLastFocusY;
    private int mLastMotionY;
    private float mLastSpanY;
    private float mMaximumStretch;
    private float mNaturalHeight;
    private float mOldHeight;
    private int mPopDuration;
    private float mPopLimit;
    private float mPullGestureMinXSpan;
    private ScaleGestureDetector mSGD;
    private ObjectAnimator mScaleAnimation;
    private android.view.ScaleGestureDetector.OnScaleGestureListener mScaleGestureListener;
    private ViewScaler mScaler;
    private View mScrollView;
    private int mSmallSize;
    private int mTouchSlop;
    private Vibrator mVibrator;
    private boolean mWatchingForPull;

    public ExpandHelper(Context context, Callback callback, int i, int j)
    {
        mExpansionStyle = 0;
        mScaleGestureListener = new android.view.ScaleGestureDetector.SimpleOnScaleGestureListener() {

            final ExpandHelper this$0;

            public boolean onScale(ScaleGestureDetector scalegesturedetector)
            {
                return true;
            }

            public boolean onScaleBegin(ScaleGestureDetector scalegesturedetector)
            {
                float f = scalegesturedetector.getFocusX();
                float f1 = scalegesturedetector.getFocusY();
                View view = findView(f, f1);
                if (view != null)
                    startExpanding(view, 4);
                return mExpanding;
            }

            public void onScaleEnd(ScaleGestureDetector scalegesturedetector)
            {
            }

            
            {
                this$0 = ExpandHelper.this;
                super();
            }
        }
;
        mSmallSize = i;
        mMaximumStretch = 2.0F * (float)mSmallSize;
        mLargeSize = j;
        mContext = context;
        mCallback = callback;
        mScaler = new ViewScaler();
        mGravity = 48;
        mScaleAnimation = ObjectAnimator.ofFloat(mScaler, "height", new float[] {
            0.0F
        });
        mScaleAnimation.setDuration(250L);
        mPopLimit = mContext.getResources().getDimension(0x7f0d0041);
        mPopDuration = mContext.getResources().getInteger(0x7f0c000d);
        mPullGestureMinXSpan = mContext.getResources().getDimension(0x7f0d0042);
        AnimatorListenerAdapter animatorlisteneradapter = new AnimatorListenerAdapter() {

            final ExpandHelper this$0;

            public void onAnimationEnd(Animator animator)
            {
                View view = (View)((ObjectAnimator)animator).getTarget();
                if (view.getAlpha() <= 0.0F)
                    view.setVisibility(4);
            }

            public void onAnimationStart(Animator animator)
            {
                View view = (View)((ObjectAnimator)animator).getTarget();
                if (view.getAlpha() <= 0.0F)
                    view.setVisibility(0);
            }

            
            {
                this$0 = ExpandHelper.this;
                super();
            }
        }
;
        mGlowTopAnimation = ObjectAnimator.ofFloat(null, "alpha", new float[] {
            0.0F
        });
        mGlowTopAnimation.addListener(animatorlisteneradapter);
        mGlowBottomAnimation = ObjectAnimator.ofFloat(null, "alpha", new float[] {
            0.0F
        });
        mGlowBottomAnimation.addListener(animatorlisteneradapter);
        mGlowAnimationSet = new AnimatorSet();
        mGlowAnimationSet.play(mGlowTopAnimation).with(mGlowBottomAnimation);
        mGlowAnimationSet.setDuration(150L);
        mTouchSlop = ViewConfiguration.get(mContext).getScaledTouchSlop();
        mSGD = new ScaleGestureDetector(context, mScaleGestureListener);
    }

    private float calculateGlow(float f, float f1)
    {
        return 0.5F + 0.5F * (1.0F / (1.0F + (float)Math.pow(2.7182818284590451D, -1F * (8F * Math.abs((f - f1) / mMaximumStretch) - 5F))));
    }

    private float clamp(float f)
    {
        float f1 = f;
        if (f1 < (float)mSmallSize)
            f1 = mSmallSize;
        else
        if (f1 > (float)mLargeSize)
            f1 = mLargeSize;
        if (f1 > mNaturalHeight)
            f1 = mNaturalHeight;
        return f1;
    }

    private void clearView()
    {
        mCurrView = null;
        mCurrViewTopGlow = null;
        mCurrViewBottomGlow = null;
    }

    private View findView(float f, float f1)
    {
        if (mEventSource != null)
        {
            int ai[] = new int[2];
            mEventSource.getLocationOnScreen(ai);
            float f2 = f + (float)ai[0];
            float f3 = f1 + (float)ai[1];
            return mCallback.getChildAtRawPosition(f2, f3);
        } else
        {
            return mCallback.getChildAtPosition(f, f1);
        }
    }

    private void finishExpanding(boolean flag)
    {
        if (!mExpanding)
            return;
        float f = mScaler.getHeight();
        float _tmp = (float)mSmallSize;
        float f1 = mScaler.getHeight();
        boolean flag1;
        if (mOldHeight == (float)mSmallSize)
            flag1 = true;
        else
            flag1 = false;
        float f2;
        if (flag1)
        {
            if (!flag && f <= (float)mSmallSize)
                f2 = mSmallSize;
            else
                f2 = mNaturalHeight;
        } else
        if (!flag && f >= mNaturalHeight)
            f2 = mNaturalHeight;
        else
            f2 = mSmallSize;
        if (mScaleAnimation.isRunning())
            mScaleAnimation.cancel();
        setGlow(0.0F);
        Callback callback = mCallback;
        View view = mCurrView;
        boolean flag2;
        if (f1 == mNaturalHeight)
            flag2 = true;
        else
            flag2 = false;
        callback.setUserExpandedChild(view, flag2);
        if (f2 != f)
        {
            mScaleAnimation.setFloatValues(new float[] {
                f2
            });
            mScaleAnimation.setupStartValues();
            mScaleAnimation.start();
        }
        mCallback.setUserLockedChild(mCurrView, false);
        mExpanding = false;
        mExpansionStyle = 0;
    }

    private void handleGlowVisibility()
    {
        byte byte0 = 4;
        View view = mCurrViewTopGlow;
        byte byte1;
        if (mCurrViewTopGlow.getAlpha() <= 0.0F)
            byte1 = byte0;
        else
            byte1 = 0;
        view.setVisibility(byte1);
        View view1 = mCurrViewBottomGlow;
        if (mCurrViewBottomGlow.getAlpha() > 0.0F)
            byte0 = 0;
        view1.setVisibility(byte0);
    }

    private boolean isInside(View view, float f, float f1)
    {
        boolean flag;
label0:
        {
            if (view == null)
                return false;
            if (mEventSource != null)
            {
                int ai1[] = new int[2];
                mEventSource.getLocationOnScreen(ai1);
                f += ai1[0];
                f1 += ai1[1];
            }
            int ai[] = new int[2];
            view.getLocationOnScreen(ai);
            float f2 = f - (float)ai[0];
            float f3 = f1 - (float)ai[1];
            if (f2 > 0.0F && f3 > 0.0F)
            {
                boolean flag1;
                if (f2 < (float)view.getWidth())
                    flag1 = true;
                else
                    flag1 = false;
                boolean flag2;
                if (f3 < (float)view.getHeight())
                    flag2 = true;
                else
                    flag2 = false;
                if (flag1 & flag2)
                {
                    flag = true;
                    break label0;
                }
            }
            flag = false;
        }
        return flag;
    }

    private void setView(View view)
    {
        mCurrView = view;
        if (view instanceof ViewGroup)
        {
            ViewGroup viewgroup = (ViewGroup)view;
            mCurrViewTopGlow = viewgroup.findViewById(0x7f0800b2);
            mCurrViewBottomGlow = viewgroup.findViewById(0x7f0800b6);
        }
    }

    private void startExpanding(View view, int i)
    {
        mExpansionStyle = i;
        if (mExpanding && view == mCurrView)
            return;
        mExpanding = true;
        mCallback.setUserLockedChild(view, true);
        setView(view);
        setGlow(0.5F);
        mScaler.setView(view);
        mOldHeight = mScaler.getHeight();
        if (mCallback.canChildBeExpanded(view))
            mNaturalHeight = mScaler.getNaturalHeight(mLargeSize);
        else
            mNaturalHeight = mOldHeight;
        view.getParent().requestDisallowInterceptTouchEvent(true);
    }

    private void updateExpansion()
    {
        float f = 1.0F * (mSGD.getCurrentSpan() - mInitialTouchSpan);
        float f1 = 1.0F * (mSGD.getFocusY() - mInitialTouchFocusY);
        float f2;
        if (mGravity == 80)
            f2 = -1F;
        else
            f2 = 1.0F;
        float f3 = f1 * f2;
        float f4 = 1.0F + (Math.abs(f3) + Math.abs(f));
        float f5 = (f3 * Math.abs(f3)) / f4 + (f * Math.abs(f)) / f4 + mOldHeight;
        float f6 = clamp(f5);
        mScaler.setHeight(f6);
        setGlow(calculateGlow(f5, f6));
        mLastFocusY = mSGD.getFocusY();
        mLastSpanY = mSGD.getCurrentSpan();
    }

    private void vibrate(long l)
    {
        this;
        JVM INSTR monitorenter ;
        if (mVibrator == null)
            mVibrator = (Vibrator)mContext.getSystemService("vibrator");
        mVibrator.vibrate(l);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void cancel()
    {
        finishExpanding(true);
        clearView();
        mSGD = new ScaleGestureDetector(mContext, mScaleGestureListener);
    }

    public void onClick(View view)
    {
        startExpanding(view, 4);
        finishExpanding(true);
        clearView();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i;
        int j;
        int k;
label0:
        {
            i = motionevent.getAction();
            mSGD.onTouchEvent(motionevent);
            j = (int)mSGD.getFocusX();
            k = (int)mSGD.getFocusY();
            mInitialTouchFocusY = k;
            mInitialTouchSpan = mSGD.getCurrentSpan();
            mLastFocusY = mInitialTouchFocusY;
            mLastSpanY = mInitialTouchSpan;
            if (!mExpanding && (i != 2 || (1 & mExpansionStyle) == 0))
            {
                float f = mSGD.getCurrentSpanX();
                if (i != 2 || f <= mPullGestureMinXSpan || f <= mSGD.getCurrentSpanY())
                    break label0;
                View view1 = findView(j, k);
                if (view1 != null)
                {
                    startExpanding(view1, 2);
                    return true;
                }
            }
            return true;
        }
        if (mScrollView != null && mScrollView.getScrollY() > 0)
            return false;
        switch (i & 0xff)
        {
        default:
            break;

        case 1: // '\001'
        case 3: // '\003'
            finishExpanding(false);
            clearView();
            break;

        case 0: // '\0'
            mWatchingForPull = isInside(mScrollView, j, k);
            mLastMotionY = k;
            break;

        case 2: // '\002'
            if (!mWatchingForPull || k - mLastMotionY <= mTouchSlop)
                break;
            mLastMotionY = k;
            View view = findView(j, k);
            if (view != null)
            {
                startExpanding(view, 1);
                mInitialTouchY = mLastMotionY;
                mHasPopped = false;
            }
            break;
        }
        return mExpanding;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getActionMasked();
        mSGD.onTouchEvent(motionevent);
        switch (i)
        {
        case 4: // '\004'
        default:
            break;

        case 1: // '\001'
        case 3: // '\003'
            finishExpanding(false);
            clearView();
            return true;

        case 5: // '\005'
        case 6: // '\006'
            mInitialTouchY = mInitialTouchY + (mSGD.getFocusY() - mLastFocusY);
            mInitialTouchSpan = mInitialTouchSpan + (mSGD.getCurrentSpan() - mLastSpanY);
            return true;

        case 2: // '\002'
            if ((1 & mExpansionStyle) != 0)
            {
                float f = (motionevent.getY() - mInitialTouchY) + mOldHeight;
                float f1 = clamp(f);
                if (mOldHeight == (float)mSmallSize);
                int j = f != mNaturalHeight;
                boolean flag = false;
                if (j > 0)
                    flag = true;
                if (f < (float)mSmallSize)
                    flag = true;
                float f2 = Math.abs(motionevent.getY() - mInitialTouchY);
                if ((mHasPopped || f2 > mPopLimit) && !mHasPopped)
                {
                    vibrate(mPopDuration);
                    mHasPopped = true;
                }
                if (mHasPopped)
                {
                    mScaler.setHeight(f1);
                    setGlow(0.5F);
                } else
                {
                    setGlow(calculateGlow(4F * f2, 0.0F));
                }
                int k = (int)mSGD.getFocusX();
                int l = (int)mSGD.getFocusY();
                View view = findView(k, l);
                if (flag && view != null && view != mCurrView)
                {
                    finishExpanding(false);
                    startExpanding(view, 1);
                    mInitialTouchY = l;
                    mHasPopped = false;
                    return true;
                }
                break;
            }
            if (mExpanding)
            {
                updateExpansion();
                return true;
            }
            break;
        }
        return true;
    }

    public void setEventSource(View view)
    {
        mEventSource = view;
    }

    public void setGlow(float f)
    {
        if (!mGlowAnimationSet.isRunning() || f == 0.0F)
        {
            if (mGlowAnimationSet.isRunning())
                mGlowAnimationSet.end();
            if (mCurrViewTopGlow != null && mCurrViewBottomGlow != null)
            {
                if (f != 0.0F && mCurrViewTopGlow.getAlpha() != 0.0F)
                {
                    mCurrViewTopGlow.setAlpha(f);
                    mCurrViewBottomGlow.setAlpha(f);
                    handleGlowVisibility();
                    return;
                }
                mGlowTopAnimation.setTarget(mCurrViewTopGlow);
                mGlowBottomAnimation.setTarget(mCurrViewBottomGlow);
                mGlowTopAnimation.setFloatValues(new float[] {
                    f
                });
                mGlowBottomAnimation.setFloatValues(new float[] {
                    f
                });
                mGlowAnimationSet.setupStartValues();
                mGlowAnimationSet.start();
            }
        }
    }

    public void setGravity(int i)
    {
        mGravity = i;
    }

    public void setScrollView(View view)
    {
        mScrollView = view;
    }



}
