// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ViewFlipper;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, KeyguardSecurityCallback

public class KeyguardSecurityViewFlipper extends ViewFlipper
    implements KeyguardSecurityView
{
    public static class LayoutParams extends android.widget.FrameLayout.LayoutParams
    {

        public int maxHeight;
        public int maxWidth;

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.KeyguardSecurityViewFlipper_Layout, 0, 0);
            maxWidth = typedarray.getDimensionPixelSize(1, 0);
            maxHeight = typedarray.getDimensionPixelSize(0, 0);
            typedarray.recycle();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            super(layoutparams);
            maxWidth = layoutparams.maxWidth;
            maxHeight = layoutparams.maxHeight;
        }
    }


    private static final boolean DEBUG = false;
    private static final String TAG = "KeyguardSecurityViewFlipper";
    private Rect mTempRect;

    public KeyguardSecurityViewFlipper(Context context)
    {
        this(context, null);
    }

    public KeyguardSecurityViewFlipper(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTempRect = new Rect();
    }

    private int makeChildMeasureSpec(int i, int j)
    {
        int k;
        int l;
        switch (j)
        {
        case -1: 
            k = 0x40000000;
            l = i;
            break;

        case -2: 
            k = 0x80000000;
            l = i;
            break;

        default:
            k = 0x40000000;
            l = Math.min(i, j);
            break;
        }
        return android.view.View.MeasureSpec.makeMeasureSpec(l, k);
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams instanceof LayoutParams)
            return new LayoutParams((LayoutParams)layoutparams);
        else
            return new LayoutParams(layoutparams);
    }

    public volatile android.widget.FrameLayout.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    public KeyguardSecurityCallback getCallback()
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            return keyguardsecurityview.getCallback();
        else
            return null;
    }

    KeyguardSecurityView getSecurityView()
    {
        View view = getChildAt(getDisplayedChild());
        if (view instanceof KeyguardSecurityView)
            return (KeyguardSecurityView)view;
        else
            return null;
    }

    public void hideBouncer(int i)
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        for (int j = 0; j < getChildCount(); j++)
        {
            View view = getChildAt(j);
            if (!(view instanceof KeyguardSecurityView))
                continue;
            KeyguardSecurityView keyguardsecurityview1 = (KeyguardSecurityView)view;
            int k;
            if (keyguardsecurityview1 == keyguardsecurityview)
                k = i;
            else
                k = 0;
            keyguardsecurityview1.hideBouncer(k);
        }

    }

    public boolean needsInput()
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            return keyguardsecurityview.needsInput();
        else
            return false;
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getMode(j);
        int i1 = android.view.View.MeasureSpec.getSize(i);
        int j1 = android.view.View.MeasureSpec.getSize(j);
        int k1 = i1;
        int l1 = getChildCount();
        for (int i2 = 0; i2 < l1; i2++)
        {
            LayoutParams layoutparams1 = (LayoutParams)getChildAt(i2).getLayoutParams();
            if (layoutparams1.maxWidth > 0 && layoutparams1.maxWidth < k1)
                k1 = layoutparams1.maxWidth;
        }

        int j2 = getPaddingLeft() + getPaddingRight();
        int k2 = getPaddingTop() + getPaddingBottom();
        int l2 = k1 - j2;
        int i3 = j1 - k2;
        int j3;
        if (k == 0x40000000)
            j3 = i1;
        else
            j3 = 0;
        int k3;
        if (l == 0x40000000)
            k3 = j1;
        else
            k3 = 0;
        for (int l3 = 0; l3 < l1; l3++)
        {
            View view = getChildAt(l3);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            view.measure(makeChildMeasureSpec(l2, layoutparams.width), makeChildMeasureSpec(i3, layoutparams.height));
            int i4 = Math.min(view.getMeasuredWidth(), i1 - j2);
            j3 = Math.max(j3, i4);
            k3 = Math.max(k3, Math.min(view.getMeasuredHeight(), j1 - k2));
        }

        setMeasuredDimension(j3 + j2, k3 + k2);
    }

    public void onPause()
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.onPause();
    }

    public void onResume(int i)
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.onResume(i);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = super.onTouchEvent(motionevent);
        mTempRect.set(0, 0, 0, 0);
        for (int i = 0; i < getChildCount(); i++)
        {
            View view = getChildAt(i);
            if (view.getVisibility() != 0)
                continue;
            offsetRectIntoDescendantCoords(view, mTempRect);
            motionevent.offsetLocation(mTempRect.left, mTempRect.top);
            if (!view.dispatchTouchEvent(motionevent) && !flag)
                flag = false;
            else
                flag = true;
            motionevent.offsetLocation(-mTempRect.left, -mTempRect.top);
        }

        return flag;
    }

    public void reset()
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.reset();
    }

    public void setClipChildrenForNewEventView(boolean flag)
    {
        setClipChildren(flag);
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.setKeyguardCallback(keyguardsecuritycallback);
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.setLockPatternUtils(lockpatternutils);
    }

    public void showBouncer(int i)
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        for (int j = 0; j < getChildCount(); j++)
        {
            View view = getChildAt(j);
            if (!(view instanceof KeyguardSecurityView))
                continue;
            KeyguardSecurityView keyguardsecurityview1 = (KeyguardSecurityView)view;
            int k;
            if (keyguardsecurityview1 == keyguardsecurityview)
                k = i;
            else
                k = 0;
            keyguardsecurityview1.showBouncer(k);
        }

    }

    public void showUsabilityHint()
    {
        KeyguardSecurityView keyguardsecurityview = getSecurityView();
        if (keyguardsecurityview != null)
            keyguardsecurityview.showUsabilityHint();
    }
}
