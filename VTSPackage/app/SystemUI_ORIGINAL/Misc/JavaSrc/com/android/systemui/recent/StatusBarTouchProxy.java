// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

public class StatusBarTouchProxy extends FrameLayout
{

    private View mStatusBar;

    public StatusBarTouchProxy(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return mStatusBar.dispatchTouchEvent(motionevent);
    }

    public void setStatusBar(View view)
    {
        mStatusBar = view;
    }
}
