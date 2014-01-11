// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ScrollView;

public class QuickSettingsScrollView extends ScrollView
{

    public QuickSettingsScrollView(Context context)
    {
        super(context);
    }

    public QuickSettingsScrollView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public QuickSettingsScrollView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    private int getScrollRange()
    {
        int i = getChildCount();
        int j = 0;
        if (i > 0)
            j = Math.max(0, getChildAt(0).getHeight() - (getHeight() - mPaddingBottom - mPaddingTop));
        return j;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (getScrollRange() == 0)
            return false;
        else
            return super.onTouchEvent(motionevent);
    }
}
