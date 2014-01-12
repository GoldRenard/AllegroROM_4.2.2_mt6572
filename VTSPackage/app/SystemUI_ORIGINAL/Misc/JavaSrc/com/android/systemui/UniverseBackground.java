// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Matrix;
import android.os.RemoteException;
import android.view.*;
import android.view.animation.Transformation;
import android.widget.FrameLayout;

public class UniverseBackground extends FrameLayout
{

    static final boolean CHATTY = false;
    static final boolean SPEW = false;
    static final int STATE_CLOSED = 0;
    static final int STATE_OPEN = 2;
    static final int STATE_OPENING = 1;
    static final String TAG = "UniverseBackground";
    private float mAnimAccel;
    private long mAnimLastTimeNanos;
    private float mAnimVel;
    private float mAnimY;
    private boolean mAnimating;
    private boolean mAnimatingReveal;
    final Runnable mAnimationCallback = new Runnable() {

        final UniverseBackground this$0;

        public void run()
        {
            doAnimation(mChoreographer.getFrameTimeNanos());
        }

            
            {
                this$0 = UniverseBackground.this;
                super();
            }
    }
;
    private float mAverageX;
    private float mAverageY;
    final View mBottomAnchor;
    private Choreographer mChoreographer;
    private boolean mClosing;
    private float mCollapseAccelPx;
    private float mCollapseMinDisplayFraction;
    final View mContent;
    private float mDragStartX;
    private float mDragStartY;
    private float mExpandAccelPx;
    private float mExpandMinDisplayFraction;
    private boolean mExpanded;
    private boolean mExpandedVisible;
    private float mFlingCollapseMinVelocityPx;
    private float mFlingExpandMinVelocityPx;
    private float mFlingGestureMaxXVelocityPx;
    private int mPositionTmp[];
    private float mSelfCollapseVelocityPx;
    private float mSelfExpandVelocityPx;
    final IWindowSession mSession;
    private int mState;
    private final float mTmpFloats[] = new float[9];
    private boolean mTracking;
    private Transformation mUniverseTransform;
    private VelocityTracker mVelocityTracker;
    private int mYDelta;

    public UniverseBackground(Context context)
    {
        super(context);
        mState = 0;
        mPositionTmp = new int[2];
        mAnimatingReveal = false;
        mYDelta = 0;
        mUniverseTransform = new Transformation();
        setBackgroundColor(0xff000000);
        mSession = WindowManagerGlobal.getWindowSession(context.getMainLooper());
        mContent = View.inflate(context, 0x7f040050, null);
        addView(mContent);
        mContent.findViewById(0x7f080128).setOnClickListener(new android.view.View.OnClickListener() {

            final UniverseBackground this$0;

            public void onClick(View view)
            {
                animateCollapse();
            }

            
            {
                this$0 = UniverseBackground.this;
                super();
            }
        }
);
        mBottomAnchor = mContent.findViewById(0x7f08012a);
        mChoreographer = Choreographer.getInstance();
        loadDimens();
    }

    private void computeAveragePos(MotionEvent motionevent)
    {
        int i = motionevent.getPointerCount();
        float f = 0.0F;
        float f1 = 0.0F;
        for (int j = 0; j < i; j++)
        {
            f += motionevent.getX(j);
            f1 += motionevent.getY(j);
        }

        mAverageX = f / (float)i;
        mAverageY = f1 / (float)i;
    }

    private int getExpandedViewMaxHeight()
    {
        return mBottomAnchor.getTop();
    }

    private void loadDimens()
    {
        Resources resources = getContext().getResources();
        mSelfExpandVelocityPx = resources.getDimension(0x7f0d0020);
        mSelfCollapseVelocityPx = resources.getDimension(0x7f0d0021);
        mFlingExpandMinVelocityPx = resources.getDimension(0x7f0d0022);
        mFlingCollapseMinVelocityPx = resources.getDimension(0x7f0d0023);
        mCollapseMinDisplayFraction = resources.getFraction(0x7f0d0027, 1, 1);
        mExpandMinDisplayFraction = resources.getFraction(0x7f0d0028, 1, 1);
        mExpandAccelPx = resources.getDimension(0x7f0d0029);
        mCollapseAccelPx = resources.getDimension(0x7f0d002a);
        mFlingGestureMaxXVelocityPx = resources.getDimension(0x7f0d0024);
    }

    private void sendUniverseTransform()
    {
        if (getWindowToken() == null)
            break MISSING_BLOCK_LABEL_77;
        mUniverseTransform.getMatrix().getValues(mTmpFloats);
        mSession.setUniverseTransform(getWindowToken(), mUniverseTransform.getAlpha(), mTmpFloats[2], mTmpFloats[5], mTmpFloats[0], mTmpFloats[3], mTmpFloats[1], mTmpFloats[4]);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private void trackMovement(MotionEvent motionevent)
    {
        mVelocityTracker.addMovement(motionevent);
    }

    private void updateUniverseScale()
    {
        if (mYDelta > 0)
        {
            int i = getWidth();
            int j = getHeight();
            float f = (0.5F + (float)(j - mYDelta)) / (float)j;
            mUniverseTransform.getMatrix().setScale(f, f, i / 2, j);
            sendUniverseTransform();
            if (getVisibility() != 0)
                setVisibility(0);
        } else
        {
            mUniverseTransform.clear();
            sendUniverseTransform();
            if (getVisibility() == 0)
            {
                setVisibility(8);
                return;
            }
        }
    }

    public void animateCollapse()
    {
        animateCollapse(1.0F);
    }

    public void animateCollapse(float f)
    {
        mState = 0;
        if (!mExpandedVisible)
            return;
        int i;
        if (mAnimating)
            i = (int)mAnimY;
        else
            i = -1 + getExpandedViewMaxHeight();
        mExpanded = true;
        prepareTracking(i, false);
        performFling(i, f * -mSelfCollapseVelocityPx, true);
    }

    public boolean consumeEvent(MotionEvent motionevent)
    {
        if (mState == 0)
            if (motionevent.getActionMasked() == 5)
            {
                computeAveragePos(motionevent);
                mDragStartX = mAverageX;
                mDragStartY = mAverageY;
                mYDelta = 0;
                mUniverseTransform.clear();
                sendUniverseTransform();
                setVisibility(0);
                mState = 1;
                prepareTracking((int)mDragStartY, true);
                mVelocityTracker.clear();
                trackMovement(motionevent);
                return true;
            } else
            {
                return false;
            }
        if (mState == 1)
        {
            if (motionevent.getActionMasked() != 1 && motionevent.getActionMasked() != 3)
            {
                computeAveragePos(motionevent);
                mYDelta = (int)(mAverageY - mDragStartY);
                if (mYDelta > getExpandedViewMaxHeight())
                    mYDelta = getExpandedViewMaxHeight();
                updateUniverseScale();
                return true;
            }
            mVelocityTracker.computeCurrentVelocity(1000);
            computeAveragePos(motionevent);
            float f = mVelocityTracker.getYVelocity();
            boolean flag;
            if (f < 0.0F)
                flag = true;
            else
                flag = false;
            float f1 = mVelocityTracker.getXVelocity();
            if (f1 < 0.0F)
                f1 = -f1;
            if (f1 > mFlingGestureMaxXVelocityPx)
                f1 = mFlingGestureMaxXVelocityPx;
            float f2 = (float)Math.hypot(f, f1);
            if (flag)
                f2 = -f2;
            performFling((int)mAverageY, f2, false);
            mState = 2;
            return true;
        } else
        {
            return false;
        }
    }

    void doAnimation(long l)
    {
label0:
        {
            if (mAnimating)
            {
                incrementAnim(l);
                if (mAnimY < (float)(-1 + getExpandedViewMaxHeight()) || mClosing)
                    break label0;
                mAnimating = false;
                mYDelta = getExpandedViewMaxHeight();
                updateUniverseScale();
                mExpanded = true;
                mState = 2;
            }
            return;
        }
        if (mAnimY <= 0.0F && mClosing)
        {
            mAnimating = false;
            mYDelta = 0;
            updateUniverseScale();
            mExpanded = false;
            mState = 0;
            return;
        } else
        {
            mYDelta = (int)mAnimY;
            updateUniverseScale();
            mChoreographer.postCallback(1, mAnimationCallback, null);
            return;
        }
    }

    public volatile android.view.ViewGroup.LayoutParams getLayoutParams()
    {
        return getLayoutParams();
    }

    public android.view.WindowManager.LayoutParams getLayoutParams()
    {
        android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -1, 2025, 0x800120, -1);
        if (ActivityManager.isHighEndGfx())
            layoutparams.flags = 0x1000000 | layoutparams.flags;
        layoutparams.setTitle("UniverseBackground");
        layoutparams.windowAnimations = 0;
        return layoutparams;
    }

    void incrementAnim(long l)
    {
        float f = 1E-009F * (float)Math.max(l - mAnimLastTimeNanos, 0L);
        float f1 = mAnimY;
        float f2 = mAnimVel;
        float f3 = mAnimAccel;
        mAnimY = f1 + f2 * f + f * (f * (0.5F * f3));
        mAnimVel = f2 + f3 * f;
        mAnimLastTimeNanos = l;
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        loadDimens();
    }

    void performFling(int i, float f, boolean flag)
    {
        mAnimatingReveal = false;
        mAnimY = i;
        mAnimVel = f;
        if (mExpanded)
        {
            if (flag || f <= mFlingCollapseMinVelocityPx && ((float)i <= (float)getExpandedViewMaxHeight() * (1.0F - mCollapseMinDisplayFraction) || f <= -mFlingExpandMinVelocityPx))
            {
                mAnimAccel = -mCollapseAccelPx;
                if (f > 0.0F)
                    mAnimVel = 0.0F;
            } else
            {
                mAnimAccel = mExpandAccelPx;
                if (f < 0.0F)
                    mAnimVel = 0.0F;
            }
        } else
        if (!flag && f <= mFlingExpandMinVelocityPx && ((float)i <= (float)getExpandedViewMaxHeight() * (1.0F - mExpandMinDisplayFraction) || f <= -mFlingCollapseMinVelocityPx))
        {
            mAnimAccel = -mCollapseAccelPx;
            if (f > 0.0F)
                mAnimVel = 0.0F;
        } else
        {
            mAnimAccel = mExpandAccelPx;
            if (f < 0.0F)
                mAnimVel = 0.0F;
        }
        resetLastAnimTime();
        mAnimating = true;
        int j = mAnimAccel != 0.0F;
        boolean flag1 = false;
        if (j < 0)
            flag1 = true;
        mClosing = flag1;
        mChoreographer.removeCallbacks(1, mAnimationCallback, null);
        mChoreographer.postCallback(1, mAnimationCallback, null);
        stopTracking();
    }

    void prepareTracking(int i, boolean flag)
    {
        mTracking = true;
        mVelocityTracker = VelocityTracker.obtain();
        if (flag)
        {
            mAnimAccel = mExpandAccelPx;
            mAnimVel = mFlingExpandMinVelocityPx;
            mAnimY = i;
            mAnimating = true;
            mAnimatingReveal = true;
            resetLastAnimTime();
            mExpandedVisible = true;
        }
        if (mAnimating)
        {
            mAnimating = false;
            mChoreographer.removeCallbacks(1, mAnimationCallback, null);
        }
    }

    void resetLastAnimTime()
    {
        mAnimLastTimeNanos = System.nanoTime();
    }

    void stopTracking()
    {
        mTracking = false;
        mVelocityTracker.recycle();
        mVelocityTracker = null;
    }

}
