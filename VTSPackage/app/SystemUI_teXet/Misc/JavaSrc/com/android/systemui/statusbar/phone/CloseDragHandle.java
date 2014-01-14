// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PhoneStatusBar

public class CloseDragHandle extends LinearLayout
{

    PhoneStatusBar mService;

    public CloseDragHandle(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (mService.interceptTouchEvent(motionevent))
            return true;
        else
            return super.onInterceptTouchEvent(motionevent);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (motionevent.getAction() == 0)
        {
            setPressed(true);
            return true;
        } else
        {
            mService.interceptTouchEvent(motionevent);
            return true;
        }
    }
}
