// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import com.android.systemui.statusbar.BaseStatusBar;
import com.android.systemui.statusbar.DelegateViewHelper;

public class TabletStatusBarView extends FrameLayout
{

    private final int MAX_PANELS;
    private DelegateViewHelper mDelegateHelper;
    private Handler mHandler;
    private final View mIgnoreChildren[];
    private final View mPanels[];
    private final int mPos[];

    public TabletStatusBarView(Context context)
    {
        this(context, null);
    }

    public TabletStatusBarView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        MAX_PANELS = 5;
        mIgnoreChildren = new View[5];
        mPanels = new View[5];
        mPos = new int[2];
        mDelegateHelper = new DelegateViewHelper(this);
    }

    private boolean eventInside(View view, MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        int ai[] = mPos;
        view.getLocationInWindow(ai);
        int k = ai[0];
        int l = ai[1];
        int i1 = ai[0] + view.getWidth();
        int j1 = ai[1] + view.getHeight();
        return i >= k && i < i1 && j >= l && j < j1;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
label0:
        {
            if (motionevent.getAction() == 0)
            {
                mHandler.removeMessages(1001);
                mHandler.sendEmptyMessage(1001);
                mHandler.removeMessages(1041);
                mHandler.sendEmptyMessage(1041);
                mHandler.removeMessages(2000);
                mHandler.sendEmptyMessage(2000);
                for (int i = 0; i < mPanels.length; i++)
                    if (mPanels[i] != null && mPanels[i].getVisibility() == 0 && eventInside(mIgnoreChildren[i], motionevent))
                        break label0;

            }
            if (mDelegateHelper == null || !mDelegateHelper.onInterceptTouchEvent(motionevent))
                return super.onInterceptTouchEvent(motionevent);
        }
        return true;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        View view = findViewById(0x7f0800cc);
        if (view == null)
            view = findViewById(0x7f080065);
        mDelegateHelper.setSourceView(view);
        mDelegateHelper.setInitialTouchRegion(new View[] {
            view
        });
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mDelegateHelper != null)
            mDelegateHelper.onInterceptTouchEvent(motionevent);
        return true;
    }

    public void setBar(BaseStatusBar basestatusbar)
    {
        mDelegateHelper.setBar(basestatusbar);
    }

    public void setDelegateView(View view)
    {
        mDelegateHelper.setDelegateView(view);
    }

    public void setHandler(Handler handler)
    {
        mHandler = handler;
    }

    public void setIgnoreChildren(int i, View view, View view1)
    {
        mIgnoreChildren[i] = view;
        mPanels[i] = view1;
    }
}
