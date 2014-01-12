// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;

// Referenced classes of package com.android.systemui.statusbar:
//            BaseStatusBar

public class DelegateViewHelper
{

    private BaseStatusBar mBar;
    private View mDelegateView;
    private float mDownPoint[];
    RectF mInitialTouch;
    private boolean mPanelShowing;
    private View mSourceView;
    private boolean mStarted;
    private boolean mSwapXY;
    private int mTempPoint[];
    private float mTriggerThreshhold;

    public DelegateViewHelper(View view)
    {
        mTempPoint = new int[2];
        mDownPoint = new float[2];
        mInitialTouch = new RectF();
        mSwapXY = false;
        setSourceView(view);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (mSourceView == null || mDelegateView == null || mBar.shouldDisableNavbarGestures()) goto _L2; else goto _L1
_L1:
        float f;
        float f1;
        mSourceView.getLocationOnScreen(mTempPoint);
        f = mTempPoint[0];
        f1 = mTempPoint[1];
        switch (motionevent.getAction())
        {
        case 0: // '\0'
            boolean flag;
            if (mDelegateView.getVisibility() == 0)
                flag = true;
            else
                flag = false;
            mPanelShowing = flag;
            mDownPoint[0] = motionevent.getX();
            mDownPoint[1] = motionevent.getY();
            mStarted = mInitialTouch.contains(f + mDownPoint[0], f1 + mDownPoint[1]);
            break;
        }
        if (!mStarted)
            return false;
        if (mPanelShowing || motionevent.getAction() != 2) goto _L4; else goto _L3
_L3:
        int i;
        int j;
        i = motionevent.getHistorySize();
        j = 0;
_L8:
        if (j >= i + 1) goto _L4; else goto _L5
_L5:
        float f8;
        float f6;
        if (j < i)
            f6 = motionevent.getHistoricalX(j);
        else
            f6 = motionevent.getX();
        float f7;
        if (j < i)
            f7 = motionevent.getHistoricalY(j);
        else
            f7 = motionevent.getY();
        if (mSwapXY)
            f8 = mDownPoint[0] - f6;
        else
            f8 = mDownPoint[1] - f7;
        if (f8 <= mTriggerThreshhold) goto _L7; else goto _L6
_L6:
        mBar.showSearchPanel();
        mPanelShowing = true;
_L4:
        mDelegateView.getLocationOnScreen(mTempPoint);
        float f2 = mTempPoint[0];
        float f3 = mTempPoint[1];
        float f4 = f - f2;
        float f5 = f1 - f3;
        motionevent.offsetLocation(f4, f5);
        mDelegateView.dispatchTouchEvent(motionevent);
        motionevent.offsetLocation(-f4, -f5);
        return mPanelShowing;
_L7:
        j++;
        if (true) goto _L8; else goto _L2
_L2:
        return false;
    }

    public void setBar(BaseStatusBar basestatusbar)
    {
        mBar = basestatusbar;
    }

    public void setDelegateView(View view)
    {
        mDelegateView = view;
    }

    public transient void setInitialTouchRegion(View aview[])
    {
        RectF rectf = new RectF();
        int ai[] = new int[2];
        for (int i = 0; i < aview.length; i++)
        {
            View view = aview[i];
            if (view == null)
                continue;
            view.getLocationOnScreen(ai);
            if (i == 0)
                rectf.set(ai[0], ai[1], ai[0] + view.getWidth(), ai[1] + view.getHeight());
            else
                rectf.union(ai[0], ai[1], ai[0] + view.getWidth(), ai[1] + view.getHeight());
        }

        mInitialTouch.set(rectf);
    }

    public void setSourceView(View view)
    {
        mSourceView = view;
        if (mSourceView != null)
            mTriggerThreshhold = mSourceView.getContext().getResources().getDimension(0x7f0d0031);
    }

    public void setSwapXY(boolean flag)
    {
        mSwapXY = flag;
    }
}
