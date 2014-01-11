// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

public class SmallerHitTargetTouchListener
    implements android.view.View.OnTouchListener
{

    private static final int HIT_TARGET_EDGE_IGNORE_DP_X = 30;
    private static final int HIT_TARGET_EDGE_IGNORE_DP_Y = 10;
    private static final int HIT_TARGET_MIN_SIZE_DP_X = 90;
    private static final int HIT_TARGET_MIN_SIZE_DP_Y = 30;
    private static final String TAG = "SmallerHitTargetTouchListener";
    boolean mDownEventHit;


    public boolean onTouch(View view, MotionEvent motionevent)
    {
        if (motionevent.getAction() == 0)
        {
            int i = (int)motionevent.getX();
            int j = (int)motionevent.getY();
            int k = view.getWidth();
            int l = view.getHeight();
            float f = view.getResources().getDisplayMetrics().density;
            int i1 = (int)(90F * f);
            int j1 = (int)(30F * f);
            int k1 = (int)(30F * f);
            int l1 = (int)(10F * f);
            if (k < i1 || l < j1)
            {
                Log.w("SmallerHitTargetTouchListener", "onTouch: view is too small for SmallerHitTargetTouchListener");
                k1 = 0;
                l1 = 0;
            }
            int i2 = k1;
            int j2 = k - k1;
            int k2 = l1;
            int l2 = l - l1;
            if (i >= i2 && i <= j2 && j >= k2 && j <= l2)
            {
                mDownEventHit = true;
                return false;
            } else
            {
                mDownEventHit = false;
                return true;
            }
        }
        return !mDownEventHit;
    }
}
