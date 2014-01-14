// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.animation.*;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Handler;
import android.view.*;
import android.view.animation.LinearInterpolator;

// Referenced classes of package com.android.systemui:
//            Gefingerpoken

public class SwipeHelper
    implements Gefingerpoken
{
    public static interface Callback
    {

        public abstract boolean canChildBeDismissed(View view);

        public abstract View getChildAtPosition(MotionEvent motionevent);

        public abstract View getChildContentView(View view);

        public abstract void onBeginDrag(View view);

        public abstract void onChildDismissed(View view);

        public abstract void onDragCancelled(View view);
    }


    static final float ALPHA_FADE_END = 0.5F;
    public static float ALPHA_FADE_START = 0F;
    private static final boolean CONSTRAIN_SWIPE = true;
    private static final boolean DEBUG = false;
    private static final boolean DEBUG_INVALIDATE = false;
    private static final boolean DISMISS_IF_SWIPED_FAR_ENOUGH = true;
    private static final boolean FADE_OUT_DURING_SWIPE = true;
    private static final boolean SLOW_ANIMATIONS = false;
    private static final int SNAP_ANIM_LEN = 150;
    static final String TAG = "com.android.systemui.SwipeHelper";
    public static final int X = 0;
    public static final int Y = 1;
    private static LinearInterpolator sLinearInterpolator = new LinearInterpolator();
    private int DEFAULT_ESCAPE_ANIMATION_DURATION;
    private int MAX_DISMISS_VELOCITY;
    private int MAX_ESCAPE_ANIMATION_DURATION;
    private float SWIPE_ESCAPE_VELOCITY;
    private Callback mCallback;
    private boolean mCanCurrViewBeDimissed;
    private View mCurrAnimView;
    private View mCurrView;
    private float mDensityScale;
    private boolean mDragging;
    private Handler mHandler;
    private float mInitialTouchPos;
    private android.view.View.OnLongClickListener mLongPressListener;
    private boolean mLongPressSent;
    private long mLongPressTimeout;
    private float mMinAlpha;
    private float mPagingTouchSlop;
    private int mSwipeDirection;
    private VelocityTracker mVelocityTracker;
    private Runnable mWatchLongPress;

    public SwipeHelper(int i, Callback callback, float f, float f1)
    {
        SWIPE_ESCAPE_VELOCITY = 100F;
        DEFAULT_ESCAPE_ANIMATION_DURATION = 200;
        MAX_ESCAPE_ANIMATION_DURATION = 400;
        MAX_DISMISS_VELOCITY = 2000;
        mMinAlpha = 0.0F;
        mCallback = callback;
        mHandler = new Handler();
        mSwipeDirection = i;
        mVelocityTracker = VelocityTracker.obtain();
        mDensityScale = f;
        mPagingTouchSlop = f1;
        mLongPressTimeout = (long)(1.5F * (float)ViewConfiguration.getLongPressTimeout());
    }

    private ObjectAnimator createTranslationAnimation(View view, float f)
    {
        String s;
        if (mSwipeDirection == 0)
            s = "translationX";
        else
            s = "translationY";
        return ObjectAnimator.ofFloat(view, s, new float[] {
            f
        });
    }

    private float getAlphaForOffset(View view)
    {
        float f = getSize(view);
        float f1 = 0.5F * f;
        float f2 = 1.0F;
        float f3 = getTranslation(view);
        if (f3 >= f * ALPHA_FADE_START)
            f2 = 1.0F - (f3 - f * ALPHA_FADE_START) / f1;
        else
        if (f3 < f * (1.0F - ALPHA_FADE_START))
            f2 = 1.0F + (f3 + f * ALPHA_FADE_START) / f1;
        return Math.max(mMinAlpha, f2);
    }

    private float getPerpendicularVelocity(VelocityTracker velocitytracker)
    {
        if (mSwipeDirection == 0)
            return velocitytracker.getYVelocity();
        else
            return velocitytracker.getXVelocity();
    }

    private float getPos(MotionEvent motionevent)
    {
        if (mSwipeDirection == 0)
            return motionevent.getX();
        else
            return motionevent.getY();
    }

    private float getSize(View view)
    {
        if (mSwipeDirection == 0)
            return (float)view.getMeasuredWidth();
        else
            return (float)view.getMeasuredHeight();
    }

    private float getTranslation(View view)
    {
        if (mSwipeDirection == 0)
            return view.getTranslationX();
        else
            return view.getTranslationY();
    }

    private float getVelocity(VelocityTracker velocitytracker)
    {
        if (mSwipeDirection == 0)
            return velocitytracker.getXVelocity();
        else
            return velocitytracker.getYVelocity();
    }

    public static void invalidateGlobalRegion(View view)
    {
        invalidateGlobalRegion(view, new RectF(view.getLeft(), view.getTop(), view.getRight(), view.getBottom()));
    }

    public static void invalidateGlobalRegion(View view, RectF rectf)
    {
        for (; view.getParent() != null && (view.getParent() instanceof View); view.invalidate((int)Math.floor(rectf.left), (int)Math.floor(rectf.top), (int)Math.ceil(rectf.right), (int)Math.ceil(rectf.bottom)))
        {
            view = (View)view.getParent();
            view.getMatrix().mapRect(rectf);
        }

    }

    private void setTranslation(View view, float f)
    {
        if (mSwipeDirection == 0)
        {
            view.setTranslationX(f);
            return;
        } else
        {
            view.setTranslationY(f);
            return;
        }
    }

    public void dismissChild(final View view, float f)
    {
        final View animView = mCallback.getChildContentView(view);
        final boolean canAnimViewBeDismissed = mCallback.canChildBeDismissed(view);
        float f1;
        if (f >= 0.0F && (f != 0.0F || getTranslation(animView) >= 0.0F) && (f != 0.0F || getTranslation(animView) != 0.0F || mSwipeDirection != 1))
            f1 = getSize(animView);
        else
            f1 = -getSize(animView);
        int i = MAX_ESCAPE_ANIMATION_DURATION;
        int j;
        if (f != 0.0F)
            j = Math.min(i, (int)((1000F * Math.abs(f1 - getTranslation(animView))) / Math.abs(f)));
        else
            j = DEFAULT_ESCAPE_ANIMATION_DURATION;
        animView.setLayerType(2, null);
        ObjectAnimator objectanimator = createTranslationAnimation(animView, f1);
        objectanimator.setInterpolator(sLinearInterpolator);
        objectanimator.setDuration(j);
        objectanimator.addListener(new AnimatorListenerAdapter() {

            final SwipeHelper this$0;
            final View val$animView;
            final View val$view;

            public void onAnimationEnd(Animator animator)
            {
                mCallback.onChildDismissed(view);
                animView.setLayerType(0, null);
            }

            
            {
                this$0 = SwipeHelper.this;
                view = view1;
                animView = view2;
                super();
            }
        }
);
        objectanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

            final SwipeHelper this$0;
            final View val$animView;
            final boolean val$canAnimViewBeDismissed;

            public void onAnimationUpdate(ValueAnimator valueanimator)
            {
                if (canAnimViewBeDismissed)
                    animView.setAlpha(getAlphaForOffset(animView));
                SwipeHelper.invalidateGlobalRegion(animView);
            }

            
            {
                this$0 = SwipeHelper.this;
                canAnimViewBeDismissed = flag;
                animView = view;
                super();
            }
        }
);
        objectanimator.start();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        switch (motionevent.getAction())
        {
        default:
            break;

        case 1: // '\001'
        case 3: // '\003'
            mDragging = false;
            mCurrView = null;
            mCurrAnimView = null;
            mLongPressSent = false;
            removeLongPressCallback();
            break;

        case 2: // '\002'
            if (mCurrView == null || mLongPressSent)
                break;
            mVelocityTracker.addMovement(motionevent);
            if (Math.abs(getPos(motionevent) - mInitialTouchPos) > mPagingTouchSlop)
            {
                mCallback.onBeginDrag(mCurrView);
                mDragging = true;
                mInitialTouchPos = getPos(motionevent) - getTranslation(mCurrAnimView);
                removeLongPressCallback();
            }
            break;

        case 0: // '\0'
            mDragging = false;
            mLongPressSent = false;
            mCurrView = mCallback.getChildAtPosition(motionevent);
            mVelocityTracker.clear();
            if (mCurrView == null)
                break;
            mCurrAnimView = mCallback.getChildContentView(mCurrView);
            mCanCurrViewBeDimissed = mCallback.canChildBeDismissed(mCurrView);
            mVelocityTracker.addMovement(motionevent);
            mInitialTouchPos = getPos(motionevent);
            if (mLongPressListener == null)
                break;
            if (mWatchLongPress == null)
                mWatchLongPress = new Runnable() {

                    final SwipeHelper this$0;

                    public void run()
                    {
                        if (mCurrView != null && !mLongPressSent)
                        {
                            mLongPressSent = true;
                            mCurrView.sendAccessibilityEvent(2);
                            mLongPressListener.onLongClick(mCurrView);
                        }
                    }

            
            {
                this$0 = SwipeHelper.this;
                super();
            }
                }
;
            mHandler.postDelayed(mWatchLongPress, mLongPressTimeout);
            break;
        }
        return mDragging;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mLongPressSent)
            return true;
        if (!mDragging)
        {
            removeLongPressCallback();
            return false;
        }
        mVelocityTracker.addMovement(motionevent);
        motionevent.getAction();
        JVM INSTR tableswitch 1 4: default 466
    //                   1 64
    //                   2 334
    //                   3 64
    //                   4 334;
           goto _L1 _L2 _L3 _L2 _L3
_L1:
        break; /* Loop/switch isn't completed */
_L2:
        float f4;
        float f5;
        float f6;
        boolean flag;
        if (mCurrView == null)
            break; /* Loop/switch isn't completed */
        float f3 = (float)MAX_DISMISS_VELOCITY * mDensityScale;
        mVelocityTracker.computeCurrentVelocity(1000, f3);
        f4 = SWIPE_ESCAPE_VELOCITY * mDensityScale;
        f5 = getVelocity(mVelocityTracker);
        f6 = getPerpendicularVelocity(mVelocityTracker);
        if ((double)Math.abs(getTranslation(mCurrAnimView)) > 0.40000000000000002D * (double)getSize(mCurrAnimView))
            flag = true;
        else
            flag = false;
        if (Math.abs(f5) <= f4 || Math.abs(f5) <= Math.abs(f6)) goto _L5; else goto _L4
_L4:
        boolean flag3;
        boolean flag4;
        if (f5 > 0.0F)
            flag3 = true;
        else
            flag3 = false;
        if (getTranslation(mCurrAnimView) > 0.0F)
            flag4 = true;
        else
            flag4 = false;
        if (flag3 != flag4) goto _L5; else goto _L6
_L6:
        boolean flag1 = true;
          goto _L7
_L5:
        flag1 = false;
_L7:
        boolean flag2;
        if (!mCallback.canChildBeDismissed(mCurrView) || !flag1 && !flag)
            flag2 = false;
        else
            flag2 = true;
        if (flag2)
        {
            View view = mCurrView;
            if (!flag1)
                f5 = 0.0F;
            dismissChild(view, f5);
        } else
        {
            mCallback.onDragCancelled(mCurrView);
            snapChild(mCurrView, f5);
        }
        break; /* Loop/switch isn't completed */
_L3:
        if (mCurrView != null)
        {
            float f = getPos(motionevent) - mInitialTouchPos;
            if (!mCallback.canChildBeDismissed(mCurrView))
            {
                float f1 = getSize(mCurrAnimView);
                float f2 = 0.15F * f1;
                if (Math.abs(f) >= f1)
                {
                    if (f > 0.0F)
                        f = f2;
                    else
                        f = -f2;
                } else
                {
                    f = f2 * (float)Math.sin(1.5707963267948966D * (double)(f / f1));
                }
            }
            setTranslation(mCurrAnimView, f);
            if (mCanCurrViewBeDimissed)
                mCurrAnimView.setAlpha(getAlphaForOffset(mCurrAnimView));
            invalidateGlobalRegion(mCurrView);
        }
        return true;
    }

    public void removeLongPressCallback()
    {
        if (mWatchLongPress != null)
        {
            mHandler.removeCallbacks(mWatchLongPress);
            mWatchLongPress = null;
        }
    }

    public void setDensityScale(float f)
    {
        mDensityScale = f;
    }

    public void setLongPressListener(android.view.View.OnLongClickListener onlongclicklistener)
    {
        mLongPressListener = onlongclicklistener;
    }

    public void setMinAlpha(float f)
    {
        mMinAlpha = f;
    }

    public void setPagingTouchSlop(float f)
    {
        mPagingTouchSlop = f;
    }

    public void snapChild(View view, float f)
    {
        final View animView = mCallback.getChildContentView(view);
        final boolean canAnimViewBeDismissed = mCallback.canChildBeDismissed(animView);
        ObjectAnimator objectanimator = createTranslationAnimation(animView, 0.0F);
        objectanimator.setDuration(150);
        objectanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

            final SwipeHelper this$0;
            final View val$animView;
            final boolean val$canAnimViewBeDismissed;

            public void onAnimationUpdate(ValueAnimator valueanimator)
            {
                if (canAnimViewBeDismissed)
                    animView.setAlpha(getAlphaForOffset(animView));
                SwipeHelper.invalidateGlobalRegion(animView);
            }

            
            {
                this$0 = SwipeHelper.this;
                canAnimViewBeDismissed = flag;
                animView = view;
                super();
            }
        }
);
        objectanimator.start();
    }

    static 
    {
        ALPHA_FADE_START = 0.0F;
    }




/*
    static boolean access$102(SwipeHelper swipehelper, boolean flag)
    {
        swipehelper.mLongPressSent = flag;
        return flag;
    }

*/



}
