// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.view.*;

public class CheckLongPressHelper
{
    class CheckForLongPress
        implements Runnable
    {

        final CheckLongPressHelper this$0;

        public void run()
        {
            if (mView.getParent() != null && mView.hasWindowFocus() && !mHasPerformedLongPress && mView.performLongClick())
            {
                mView.setPressed(false);
                mHasPerformedLongPress = true;
            }
        }

        CheckForLongPress()
        {
            this$0 = CheckLongPressHelper.this;
            super();
        }
    }


    private float mDownX;
    private float mDownY;
    private boolean mHasPerformedLongPress;
    private int mLongPressTimeout;
    private CheckForLongPress mPendingCheckForLongPress;
    private int mScaledTouchSlop;
    private View mView;

    public CheckLongPressHelper(View view)
    {
        mScaledTouchSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        mLongPressTimeout = ViewConfiguration.getLongPressTimeout();
        mView = view;
    }

    public void cancelLongPress()
    {
        mHasPerformedLongPress = false;
        if (mPendingCheckForLongPress != null)
        {
            mView.removeCallbacks(mPendingCheckForLongPress);
            mPendingCheckForLongPress = null;
        }
    }

    public boolean hasPerformedLongPress()
    {
        return mHasPerformedLongPress;
    }

    public void onMove(MotionEvent motionevent)
    {
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        boolean flag;
        if (Math.abs(mDownX - f) > (float)mScaledTouchSlop)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (Math.abs(mDownY - f1) > (float)mScaledTouchSlop)
            flag1 = true;
        else
            flag1 = false;
        if (flag || flag1)
            cancelLongPress();
    }

    public void postCheckForLongPress(MotionEvent motionevent)
    {
        mDownX = motionevent.getX();
        mDownY = motionevent.getY();
        mHasPerformedLongPress = false;
        if (mPendingCheckForLongPress == null)
            mPendingCheckForLongPress = new CheckForLongPress();
        mView.postDelayed(mPendingCheckForLongPress, mLongPressTimeout);
    }




/*
    static boolean access$102(CheckLongPressHelper checklongpresshelper, boolean flag)
    {
        checklongpresshelper.mHasPerformedLongPress = flag;
        return flag;
    }

*/
}
