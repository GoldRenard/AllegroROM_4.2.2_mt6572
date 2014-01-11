// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

public class NotificationIconArea extends RelativeLayout
{
    static class IconLayout extends LinearLayout
    {

        public boolean onInterceptTouchEvent(MotionEvent motionevent)
        {
            return true;
        }

        public IconLayout(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }


    private static final String TAG = "NotificationIconArea";
    IconLayout mIconLayout;

    public NotificationIconArea(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIconLayout = (IconLayout)findViewById(0x7f0800ec);
    }
}
