// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import com.google.common.base.Preconditions;

// Referenced classes of package com.android.settings.widget:
//            ChartAxis, ChartSweepView, ChartNetworkSeriesView, ChartGridView

public class ChartView extends FrameLayout
{

    private static final int SWEEP_GRAVITY = 51;
    private Rect mContent;
    ChartAxis mHoriz;
    private int mOptimalWidth;
    private float mOptimalWidthWeight;
    ChartAxis mVert;

    public ChartView(Context context)
    {
        this(context, null, 0);
    }

    public ChartView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mOptimalWidth = -1;
        mOptimalWidthWeight = 0.0F;
        mContent = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartView, i, 0);
        setOptimalWidth(typedarray.getDimensionPixelSize(0, -1), typedarray.getFloat(1, 0.0F));
        typedarray.recycle();
        setClipToPadding(false);
        setClipChildren(false);
    }

    void init(ChartAxis chartaxis, ChartAxis chartaxis1)
    {
        mHoriz = (ChartAxis)Preconditions.checkNotNull(chartaxis, "missing horiz");
        mVert = (ChartAxis)Preconditions.checkNotNull(chartaxis1, "missing vert");
    }

    protected void layoutSweep(ChartSweepView chartsweepview)
    {
        Rect rect = new Rect(mContent);
        Rect rect1 = new Rect();
        layoutSweep(chartsweepview, rect, rect1);
        chartsweepview.layout(rect1.left, rect1.top, rect1.right, rect1.bottom);
    }

    protected void layoutSweep(ChartSweepView chartsweepview, Rect rect, Rect rect1)
    {
        Rect rect2 = chartsweepview.getMargins();
        if (chartsweepview.getFollowAxis() == 1)
        {
            rect.top = rect.top + (rect2.top + (int)chartsweepview.getPoint());
            rect.bottom = rect.top;
            rect.left = rect.left + rect2.left;
            rect.right = rect.right + rect2.right;
            Gravity.apply(51, rect.width(), chartsweepview.getMeasuredHeight(), rect, rect1);
            return;
        } else
        {
            rect.left = rect.left + (rect2.left + (int)chartsweepview.getPoint());
            rect.right = rect.left;
            rect.top = rect.top + rect2.top;
            rect.bottom = rect.bottom + rect2.bottom;
            Gravity.apply(51, chartsweepview.getMeasuredWidth(), rect.height(), rect, rect1);
            return;
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        mContent.set(getPaddingLeft(), getPaddingTop(), k - i - getPaddingRight(), l - j - getPaddingBottom());
        int i1 = mContent.width();
        int j1 = mContent.height();
        mHoriz.setSize(i1);
        mVert.setSize(j1);
        Rect rect = new Rect();
        Rect rect1 = new Rect();
        for (int k1 = 0; k1 < getChildCount(); k1++)
        {
            View view = getChildAt(k1);
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)view.getLayoutParams();
            rect.set(mContent);
            if (!(view instanceof ChartNetworkSeriesView) && !(view instanceof ChartGridView))
            {
                if (view instanceof ChartSweepView)
                {
                    layoutSweep((ChartSweepView)view, rect, rect1);
                    view.layout(rect1.left, rect1.top, rect1.right, rect1.bottom);
                }
            } else
            {
                Gravity.apply(layoutparams.gravity, i1, j1, rect, rect1);
                view.layout(rect1.left, rect1.top, rect1.right, rect1.bottom);
            }
        }

    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        int k = getMeasuredWidth() - mOptimalWidth;
        if (mOptimalWidth > 0 && k > 0)
            super.onMeasure(android.view.View.MeasureSpec.makeMeasureSpec((int)((float)mOptimalWidth + (float)k * mOptimalWidthWeight), 0x40000000), j);
    }

    public void setOptimalWidth(int i, float f)
    {
        mOptimalWidth = i;
        mOptimalWidthWeight = f;
        requestLayout();
    }
}
