// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class ToolBarIndicator extends LinearLayout
    implements ToolBarView.ScrollToScreenCallback
{

    private static final int VIEW_PADDING_HORIZONTAL = 4;
    private int mCount;
    private float mDensity;
    private Drawable mFocusedDrawable;
    private Drawable mNormalDrawable;

    public ToolBarIndicator(Context context)
    {
        this(context, null);
    }

    public ToolBarIndicator(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        init();
    }

    private void init()
    {
        mDensity = getResources().getDisplayMetrics().density;
        mNormalDrawable = getResources().getDrawable(0x7f020241);
        mFocusedDrawable = getResources().getDrawable(0x7f020242);
    }

    public void generateIndicators()
    {
        removeAllViews();
        for (int i = 0; i < mCount; i++)
        {
            ImageView imageview = new ImageView(mContext);
            int j = (int)(4F * mDensity);
            imageview.setPadding(j, 0, j, 0);
            addView(imageview);
        }

    }

    public void onScrollFinish(int i)
    {
        updateIndicator(i);
    }

    public void setCount(int i)
    {
        mCount = i;
        generateIndicators();
        updateIndicator(0);
    }

    public void updateIndicator(int i)
    {
        for (int j = 0; j < mCount; j++)
        {
            ImageView imageview = (ImageView)getChildAt(j);
            if (i == j)
                imageview.setImageDrawable(mFocusedDrawable);
            else
                imageview.setImageDrawable(mNormalDrawable);
        }

    }
}
