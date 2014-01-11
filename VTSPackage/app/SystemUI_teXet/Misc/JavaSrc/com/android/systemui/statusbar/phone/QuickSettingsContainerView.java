// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.widget.FrameLayout;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            QuickSettingsTileView

class QuickSettingsContainerView extends FrameLayout
{

    private float mCellGap;
    private int mNumColumns;

    public QuickSettingsContainerView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        updateResources();
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        getLayoutTransition();
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = getChildCount();
        int j1 = getPaddingLeft();
        int k1 = getPaddingTop();
        int l1 = 0;
        for (int i2 = 0; i2 < i1; i2++)
        {
            QuickSettingsTileView quicksettingstileview = (QuickSettingsTileView)getChildAt(i2);
            android.view.ViewGroup.LayoutParams layoutparams = quicksettingstileview.getLayoutParams();
            if (quicksettingstileview.getVisibility() == 8)
                continue;
            int j2 = l1 % mNumColumns;
            int k2 = quicksettingstileview.getColumnSpan();
            int l2 = l1 / mNumColumns;
            if (j2 + k2 > mNumColumns)
            {
                j1 = getPaddingLeft();
                k1 = (int)((float)k1 + ((float)layoutparams.height + mCellGap));
                l2++;
            }
            quicksettingstileview.layout(j1, k1, j1 + layoutparams.width, k1 + layoutparams.height);
            l1 += quicksettingstileview.getColumnSpan();
            if (l1 < (l2 + 1) * mNumColumns)
            {
                j1 = (int)((float)j1 + ((float)layoutparams.width + mCellGap));
            } else
            {
                j1 = getPaddingLeft();
                k1 = (int)((float)k1 + ((float)layoutparams.height + mCellGap));
            }
        }

    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getSize(i);
        android.view.View.MeasureSpec.getSize(j);
        float f = (float)Math.ceil((float)(int)((float)(k - getPaddingLeft() - getPaddingRight()) - (float)(-1 + mNumColumns) * mCellGap) / (float)mNumColumns);
        int l = getChildCount();
        int i1 = 0;
        int j1 = 0;
        for (int k1 = 0; k1 < l; k1++)
        {
            QuickSettingsTileView quicksettingstileview = (QuickSettingsTileView)getChildAt(k1);
            if (quicksettingstileview.getVisibility() == 8)
                continue;
            android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)quicksettingstileview.getLayoutParams();
            int i2 = quicksettingstileview.getColumnSpan();
            marginlayoutparams.width = (int)(f * (float)i2 + (float)(i2 - 1) * mCellGap);
            quicksettingstileview.measure(android.view.View.MeasureSpec.makeMeasureSpec(((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).width, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).height, 0x40000000));
            if (i1 <= 0)
                i1 = quicksettingstileview.getMeasuredHeight();
            j1 += i2;
        }

        int l1 = (int)Math.ceil((float)j1 / (float)mNumColumns);
        setMeasuredDimension(k, (int)((float)(l1 * i1) + (float)(l1 - 1) * mCellGap) + getPaddingTop() + getPaddingBottom());
    }

    void updateResources()
    {
        Resources resources = getContext().getResources();
        mCellGap = resources.getDimension(0x7f0d003f);
        mNumColumns = resources.getInteger(0x7f0c0009);
        requestLayout();
    }
}
