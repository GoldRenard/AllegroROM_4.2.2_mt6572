// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.FrameLayout;

public class LatestItemView extends FrameLayout
{

    public LatestItemView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (super.onRequestSendAccessibilityEvent(view, accessibilityevent))
        {
            AccessibilityEvent accessibilityevent1 = AccessibilityEvent.obtain();
            onInitializeAccessibilityEvent(accessibilityevent1);
            dispatchPopulateAccessibilityEvent(accessibilityevent1);
            accessibilityevent.appendRecord(accessibilityevent1);
            return true;
        } else
        {
            return false;
        }
    }

    public void setOnClickListener(android.view.View.OnClickListener onclicklistener)
    {
        super.setOnClickListener(onclicklistener);
    }
}
