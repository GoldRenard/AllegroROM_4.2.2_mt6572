// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.LinearLayout;
import android.widget.TextView;

// Referenced classes of package com.android.systemui.recent:
//            RecentsCallback

public class RecentsScrollViewPerformanceHelper
{

    public static final boolean OPTIMIZE_SW_RENDERED_RECENTS = true;
    public static final boolean USE_DARK_FADE_IN_HW_ACCELERATED_MODE = true;
    private int mFadingEdgeLength;
    private boolean mIsVertical;
    private View mScrollView;
    private boolean mSoftwareRendered;

    public RecentsScrollViewPerformanceHelper(Context context, AttributeSet attributeset, View view, boolean flag)
    {
        mSoftwareRendered = false;
        mScrollView = view;
        mFadingEdgeLength = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.View).getDimensionPixelSize(24, ViewConfiguration.get(context).getScaledFadingEdgeLength());
        mIsVertical = flag;
    }

    public static RecentsScrollViewPerformanceHelper create(Context context, AttributeSet attributeset, View view, boolean flag)
    {
        if (!context.getResources().getBoolean(0x7f0a0000))
            return new RecentsScrollViewPerformanceHelper(context, attributeset, view, flag);
        else
            return null;
    }

    public void addViewCallback(View view)
    {
        if (mSoftwareRendered)
        {
            RecentsPanelView.ViewHolder viewholder = (RecentsPanelView.ViewHolder)view.getTag();
            viewholder.labelView.setDrawingCacheEnabled(true);
            viewholder.labelView.buildDrawingCache();
        }
    }

    public void drawCallback(Canvas canvas, int i, int j, int k, int l, int i1, int j1, 
            float f, float f1, float f2, float f3)
    {
        if (!mSoftwareRendered);
        Paint paint = new Paint();
        Matrix matrix = new Matrix();
        LinearGradient lineargradient = new LinearGradient(0.0F, 0.0F, 0.0F, 1.0F, 0xcc000000, 0, android.graphics.Shader.TileMode.CLAMP);
        paint.setShader(lineargradient);
        float f4 = mFadingEdgeLength;
        int k1 = (int)f4;
        if (mIsVertical && k + k1 > l - k1)
            k1 = (l - k) / 2;
        if (!mIsVertical && i + k1 > j - k1)
            k1 = (j - i) / 2;
        boolean flag = mIsVertical;
        float f5 = 0.0F;
        boolean flag1 = false;
        boolean flag2 = false;
        float f6 = 0.0F;
        if (flag)
        {
            f6 = Math.max(0.0F, Math.min(1.0F, f));
            if (f6 * f4 > 1.0F)
                flag2 = true;
            else
                flag2 = false;
            f5 = Math.max(0.0F, Math.min(1.0F, f1));
            if (f5 * f4 > 1.0F)
                flag1 = true;
            else
                flag1 = false;
        }
        boolean flag3 = mIsVertical;
        boolean flag4 = false;
        boolean flag5 = false;
        float f7 = 0.0F;
        float f8 = 0.0F;
        if (!flag3)
        {
            f7 = Math.max(0.0F, Math.min(1.0F, f2));
            if (f7 * f4 > 1.0F)
                flag4 = true;
            else
                flag4 = false;
            f8 = Math.max(0.0F, Math.min(1.0F, f3));
            if (f8 * f4 > 1.0F)
                flag5 = true;
            else
                flag5 = false;
        }
        if (flag2)
        {
            matrix.setScale(1.0F, f4 * f6);
            matrix.postTranslate(i, k);
            lineargradient.setLocalMatrix(matrix);
            canvas.drawRect(i, k, j, k + k1, paint);
        }
        if (flag1)
        {
            matrix.setScale(1.0F, f4 * f5);
            matrix.postRotate(180F);
            matrix.postTranslate(i, l);
            lineargradient.setLocalMatrix(matrix);
            canvas.drawRect(i, l - k1, j, l, paint);
        }
        if (flag4)
        {
            matrix.setScale(1.0F, f4 * f7);
            matrix.postRotate(-90F);
            matrix.postTranslate(i, k);
            lineargradient.setLocalMatrix(matrix);
            canvas.drawRect(i, k, i + k1, l, paint);
        }
        if (flag5)
        {
            matrix.setScale(1.0F, f4 * f8);
            matrix.postRotate(90F);
            matrix.postTranslate(j, k);
            lineargradient.setLocalMatrix(matrix);
            canvas.drawRect(j - k1, k, j, l, paint);
        }
    }

    public int getHorizontalFadingEdgeLengthCallback()
    {
        return mFadingEdgeLength;
    }

    public int getVerticalFadingEdgeLengthCallback()
    {
        return mFadingEdgeLength;
    }

    public void onAttachedToWindowCallback(RecentsCallback recentscallback, LinearLayout linearlayout, boolean flag)
    {
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        mSoftwareRendered = flag1;
        if (!mSoftwareRendered);
        mScrollView.setVerticalFadingEdgeEnabled(false);
        mScrollView.setHorizontalFadingEdgeEnabled(false);
    }
}
