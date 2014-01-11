// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

public class NotificationLinearLayout extends LinearLayout
{

    private static final String TAG = "NotificationLinearLayout";
    int mInsetLeft;
    Drawable mItemGlow;
    Rect mTmp;

    public NotificationLinearLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NotificationLinearLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTmp = new Rect();
        mItemGlow = context.getResources().getDrawable(0x7f02011d);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.systemui.R.styleable.NotificationLinearLayout, i, 0);
        mInsetLeft = typedarray.getDimensionPixelSize(0, 0);
        typedarray.recycle();
    }

    public void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        Rect rect = mTmp;
        Drawable drawable = mItemGlow;
        drawable.getPadding(rect);
        int i = drawable.getIntrinsicHeight();
        int j = mInsetLeft;
        int k = getChildCount();
        for (int l = 0; l < k; l++)
        {
            View view = getChildAt(l);
            int i1 = view.getBottom();
            drawable.setBounds(j + (view.getLeft() - rect.left), i1, view.getRight() - rect.right, i1 + i);
            drawable.draw(canvas);
        }

    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        setWillNotDraw(false);
    }
}
