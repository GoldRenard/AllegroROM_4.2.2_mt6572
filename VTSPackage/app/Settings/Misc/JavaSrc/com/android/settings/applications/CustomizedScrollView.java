// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.ScrollView;

public class CustomizedScrollView extends ScrollView
{

    private final int mOverscrollDistance;

    public CustomizedScrollView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mOverscrollDistance = ViewConfiguration.get(mContext).getScaledOverscrollDistance();
    }

    private int clamp(int i, int j, int k)
    {
        if (j < k && i >= 0)
        {
            if (j + i > k)
                return k - j;
        } else
        {
            i = 0;
        }
        return i;
    }

    private int getScrollRange()
    {
        int i = getChildCount();
        int j = 0;
        if (i > 0)
            j = Math.max(0, getChildAt(0).getHeight() - (getHeight() - mPaddingBottom - mPaddingTop));
        return j;
    }

    public void scrollTo(int i, int j)
    {
label0:
        {
            int k;
            int l;
            View view;
            boolean flag;
label1:
            {
                k = i;
                l = j;
                if (getChildCount() <= 0)
                    break label0;
                view = getChildAt(0);
                int i1 = getScrollRange();
                int j1 = getOverScrollMode();
                if (j1 != 0)
                {
                    flag = false;
                    if (j1 != 1)
                        break label1;
                    flag = false;
                    if (i1 <= 0)
                        break label1;
                }
                flag = true;
            }
            if (!flag || mOverscrollDistance <= 0)
            {
                k = clamp(k, getWidth() - mPaddingRight - mPaddingLeft, view.getWidth());
                l = clamp(l, getHeight() - mPaddingBottom - mPaddingTop, view.getHeight());
            }
            if (k != mScrollX || l != mScrollY)
                super.scrollTo(k, l);
        }
    }
}
