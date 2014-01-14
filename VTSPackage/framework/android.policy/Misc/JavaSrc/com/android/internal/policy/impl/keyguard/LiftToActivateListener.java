// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityManager;

class LiftToActivateListener
    implements android.view.View.OnHoverListener
{

    private final AccessibilityManager mAccessibilityManager;
    private boolean mCachedClickableState;

    public LiftToActivateListener(Context context)
    {
        mAccessibilityManager = (AccessibilityManager)context.getSystemService("accessibility");
    }

    public boolean onHover(View view, MotionEvent motionevent)
    {
        if (mAccessibilityManager.isEnabled() && mAccessibilityManager.isTouchExplorationEnabled())
            switch (motionevent.getActionMasked())
            {
            default:
                break;

            case 10: // '\n'
                int i = (int)motionevent.getX();
                int j = (int)motionevent.getY();
                if (i > view.getPaddingLeft() && j > view.getPaddingTop() && i < view.getWidth() - view.getPaddingRight() && j < view.getHeight() - view.getPaddingBottom())
                    view.performClick();
                view.setClickable(mCachedClickableState);
                break;

            case 9: // '\t'
                mCachedClickableState = view.isClickable();
                view.setClickable(false);
                break;
            }
        view.onHoverEvent(motionevent);
        return true;
    }
}
