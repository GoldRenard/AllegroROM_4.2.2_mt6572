// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.android.systemui.statusbar.GestureRecorder;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelView, PhoneStatusBarView, PhoneStatusBar

public class NotificationPanelView extends PanelView
{

    int mFingers;
    Drawable mHandleBar;
    int mHandleBarHeight;
    View mHandleView;
    boolean mOkToFlip;
    PhoneStatusBar mStatusBar;

    public NotificationPanelView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        int i = getHeight() - mHandleBarHeight - getPaddingBottom();
        canvas.translate(0.0F, i);
        mHandleBar.setState(mHandleView.getDrawableState());
        mHandleBar.draw(canvas);
        canvas.translate(0.0F, -i);
    }

    public void fling(float f, boolean flag)
    {
        GestureRecorder gesturerecorder = ((PhoneStatusBarView)super.mBar).mBar.getGestureRecorder();
        if (gesturerecorder != null)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("fling ");
            String s;
            if (f > 0.0F)
                s = "open";
            else
                s = "closed";
            gesturerecorder.tag(stringbuilder.append(s).toString(), (new StringBuilder()).append("notifications,v=").append(f).toString());
        }
        super.fling(f, flag);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        Resources resources = getContext().getResources();
        mHandleBar = resources.getDrawable(0x7f02022d);
        mHandleBarHeight = resources.getDimensionPixelSize(0x7f0d0033);
        mHandleView = findViewById(0x7f080059);
        setContentDescription(resources.getString(0x7f0b00c5));
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        if (flag)
        {
            int i1 = getPaddingLeft();
            int j1 = getPaddingRight();
            mHandleBar.setBounds(i1, 0, getWidth() - j1, mHandleBarHeight);
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mStatusBar.mHasFlipSettings)
            switch (motionevent.getActionMasked())
            {
            default:
                break;

            case 5: // '\005'
                if (mOkToFlip)
                {
                    float f = motionevent.getY(0);
                    float f1 = f;
                    for (int j = 1; j < motionevent.getPointerCount(); j++)
                    {
                        float f2 = motionevent.getY(j);
                        if (f2 < f)
                            f = f2;
                        if (f2 > f1)
                            f1 = f2;
                    }

                    if (f1 - f < (float)mHandleBarHeight)
                    {
                        if (getMeasuredHeight() < mHandleBarHeight)
                            mStatusBar.switchToSettings();
                        else
                            mStatusBar.flipToSettings();
                        mOkToFlip = false;
                    }
                }
                break;

            case 0: // '\0'
                int i = getExpandedHeight() != 0.0F;
                boolean flag = false;
                if (i == 0)
                    flag = true;
                mOkToFlip = flag;
                break;
            }
        return mHandleView.dispatchTouchEvent(motionevent);
    }

    public void setStatusBar(PhoneStatusBar phonestatusbar)
    {
        mStatusBar = phonestatusbar;
    }
}
