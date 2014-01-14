// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.graphics.Region;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewTreeObserver;

public class EventHole extends View
    implements android.view.ViewTreeObserver.OnComputeInternalInsetsListener
{

    private static final String TAG = "StatusBar.EventHole";
    private int mLoc[];
    private boolean mWindowVis;

    public EventHole(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public EventHole(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        mLoc = new int[2];
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnComputeInternalInsetsListener(this);
    }

    public void onComputeInternalInsets(android.view.ViewTreeObserver.InternalInsetsInfo internalinsetsinfo)
    {
        boolean flag;
        if (isShown() && mWindowVis && getWidth() > 0 && getHeight() > 0)
            flag = true;
        else
            flag = false;
        int ai[] = mLoc;
        getLocationInWindow(ai);
        int i = ai[0];
        int j = i + getWidth();
        int k = ai[1];
        int l = k + getHeight();
        Object obj;
        for (obj = this; ((View) (obj)).getParent() instanceof View; obj = (View)((View) (obj)).getParent());
        if (flag)
        {
            internalinsetsinfo.setTouchableInsets(3);
            internalinsetsinfo.touchableRegion.set(0, 0, ((View) (obj)).getWidth(), ((View) (obj)).getHeight());
            internalinsetsinfo.touchableRegion.op(i, k, j, l, android.graphics.Region.Op.DIFFERENCE);
            return;
        } else
        {
            internalinsetsinfo.setTouchableInsets(0);
            return;
        }
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        getViewTreeObserver().removeOnComputeInternalInsetsListener(this);
    }

    protected void onWindowVisibilityChanged(int i)
    {
        super.onWindowVisibilityChanged(i);
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        mWindowVis = flag;
    }
}
