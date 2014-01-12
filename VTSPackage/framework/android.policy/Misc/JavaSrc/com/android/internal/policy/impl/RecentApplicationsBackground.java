// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

public class RecentApplicationsBackground extends LinearLayout
{

    private static final String TAG = "RecentApplicationsBackground";
    private Drawable mBackground;
    private boolean mBackgroundSizeChanged;
    private Rect mTmp0;
    private Rect mTmp1;

    public RecentApplicationsBackground(Context context)
    {
        this(context, null);
        init();
    }

    public RecentApplicationsBackground(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTmp0 = new Rect();
        mTmp1 = new Rect();
        init();
    }

    private void getChildBounds(Rect rect)
    {
        rect.top = 0x7fffffff;
        rect.left = 0x7fffffff;
        rect.right = 0x80000000;
        rect.bottom = 0x80000000;
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            if (view.getVisibility() == 0)
            {
                rect.left = Math.min(rect.left, view.getLeft());
                rect.top = Math.min(rect.top, view.getTop());
                rect.right = Math.max(rect.right, view.getRight());
                rect.bottom = Math.max(rect.bottom, view.getBottom());
            }
        }

    }

    private void init()
    {
        mBackground = getBackground();
        setBackgroundDrawable(null);
        setPadding(0, 0, 0, 0);
        setGravity(17);
    }

    public void draw(Canvas canvas)
    {
        Drawable drawable = mBackground;
        if (drawable != null && mBackgroundSizeChanged)
        {
            mBackgroundSizeChanged = false;
            Rect rect = mTmp0;
            Rect rect1 = mTmp1;
            mBackground.getPadding(rect1);
            getChildBounds(rect);
            int i = rect.top - rect1.top;
            int j = rect.bottom + rect1.bottom;
            drawable.setBounds(0, i, getRight(), j);
        }
        mBackground.draw(canvas);
        canvas.drawARGB(191, 0, 0, 0);
        super.draw(canvas);
    }

    protected void drawableStateChanged()
    {
        Drawable drawable = mBackground;
        if (drawable != null && drawable.isStateful())
            drawable.setState(getDrawableState());
        super.drawableStateChanged();
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mBackground != null)
            mBackground.jumpToCurrentState();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mBackground.setCallback(this);
        setWillNotDraw(false);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mBackground.setCallback(null);
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        setWillNotDraw(false);
        if (mLeft != i || mRight != k || mTop != j || mBottom != l)
            mBackgroundSizeChanged = true;
        return super.setFrame(i, j, k, l);
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return drawable == mBackground || super.verifyDrawable(drawable);
    }
}
