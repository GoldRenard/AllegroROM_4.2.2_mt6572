// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.content.Context;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.widget.LinearLayout;

public class OOBERootView extends LinearLayout
{

    private static final String TAG = "dwz";
    GestureDetector mGestureDetector;

    public OOBERootView(Context context)
    {
        super(context);
        mGestureDetector = null;
    }

    public OOBERootView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mGestureDetector = null;
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        if (mGestureDetector != null && mGestureDetector.onTouchEvent(motionevent))
            return true;
        else
            return super.dispatchTouchEvent(motionevent);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return true;
    }
}
