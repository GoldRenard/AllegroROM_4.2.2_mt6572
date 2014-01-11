// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

public class IconMerger extends LinearLayout
{

    private static final boolean DEBUG = false;
    private static final String TAG = "IconMerger";
    private int mIconSize;
    private View mMoreView;

    public IconMerger(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIconSize = context.getResources().getDimensionPixelSize(0x7f0d0017);
    }

    private void checkOverflow(int i)
    {
        final boolean moreRequired = true;
        if (mMoreView != null)
        {
            int j = getChildCount();
            int k = 0;
            for (int l = 0; l < j; l++)
                if (getChildAt(l).getVisibility() != 8)
                    k++;

            boolean flag;
            if (mMoreView.getVisibility() == 0)
                flag = moreRequired;
            else
                flag = false;
            if (flag)
                k--;
            if (k * mIconSize <= i)
                moreRequired = false;
            if (moreRequired != flag)
            {
                post(new Runnable() {

                    final IconMerger this$0;
                    final boolean val$moreRequired;

                    public void run()
                    {
                        View view = mMoreView;
                        byte byte0;
                        if (moreRequired)
                            byte0 = 0;
                        else
                            byte0 = 8;
                        view.setVisibility(byte0);
                    }

            
            {
                this$0 = IconMerger.this;
                moreRequired = flag;
                super();
            }
                }
);
                return;
            }
        }
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        checkOverflow(k - i);
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        int k = getMeasuredWidth();
        setMeasuredDimension(k - k % mIconSize, getMeasuredHeight());
    }

    public void setOverflowIndicator(View view)
    {
        mMoreView = view;
    }

}
