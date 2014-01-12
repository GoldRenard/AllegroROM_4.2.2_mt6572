// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.RelativeLayout;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            StatusBarPanel, TabletStatusBar

public class NotificationPeekPanel extends RelativeLayout
    implements StatusBarPanel
{

    TabletStatusBar mBar;

    public NotificationPeekPanel(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NotificationPeekPanel(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public boolean isInContentArea(int i, int j)
    {
        int k = getPaddingLeft();
        int l = getWidth() - getPaddingRight();
        int i1 = getPaddingTop();
        int j1 = getHeight() - getPaddingBottom();
        return i >= k && i < l && j >= i1 && j < j1;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        mBar.resetNotificationPeekFadeTimer();
        return false;
    }

    public void setBar(TabletStatusBar tabletstatusbar)
    {
        mBar = tabletstatusbar;
    }
}
