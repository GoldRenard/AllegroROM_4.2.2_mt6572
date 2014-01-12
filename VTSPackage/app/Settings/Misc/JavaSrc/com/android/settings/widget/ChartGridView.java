// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.*;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.text.*;
import android.util.*;
import android.view.View;
import com.android.settings.DataUsageSummary;
import com.google.common.base.Preconditions;

// Referenced classes of package com.android.settings.widget:
//            ChartAxis

public class ChartGridView extends View
{

    private Drawable mBorder;
    private ChartAxis mHoriz;
    private int mLabelColor;
    private Layout mLayoutEnd;
    private Layout mLayoutStart;
    private Drawable mPrimary;
    private Drawable mSecondary;
    private ChartAxis mVert;

    public ChartGridView(Context context)
    {
        this(context, null, 0);
    }

    public ChartGridView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartGridView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        setWillNotDraw(false);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartGridView, i, 0);
        mPrimary = typedarray.getDrawable(1);
        mSecondary = typedarray.getDrawable(2);
        mBorder = typedarray.getDrawable(3);
        mLabelColor = typedarray.getColor(0, 0xffff0000);
        int j = getContext().getResources().getThemeMainColor();
        if (j != 0)
            mLabelColor = j;
        typedarray.recycle();
    }

    private Layout makeLayout(CharSequence charsequence)
    {
        Resources resources = getResources();
        TextPaint textpaint = new TextPaint(1);
        textpaint.density = resources.getDisplayMetrics().density;
        textpaint.setCompatibilityScaling(resources.getCompatibilityInfo().applicationScale);
        textpaint.setColor(mLabelColor);
        textpaint.setTextSize(TypedValue.applyDimension(2, 10F, resources.getDisplayMetrics()));
        return new StaticLayout(charsequence, textpaint, (int)Math.ceil(Layout.getDesiredWidth(charsequence, textpaint)), android.text.Layout.Alignment.ALIGN_NORMAL, 1.0F, 0.0F, true);
    }

    void init(ChartAxis chartaxis, ChartAxis chartaxis1)
    {
        mHoriz = (ChartAxis)Preconditions.checkNotNull(chartaxis, "missing horiz");
        mVert = (ChartAxis)Preconditions.checkNotNull(chartaxis1, "missing vert");
    }

    protected void onDraw(Canvas canvas)
    {
        int i = getWidth();
        int j = getHeight();
        Drawable drawable = mSecondary;
        int k = mSecondary.getIntrinsicHeight();
        float af[] = mVert.getTickPoints();
        int l = af.length;
        for (int i1 = 0; i1 < l; i1++)
        {
            float f1 = af[i1];
            int k2 = (int)Math.min(f1 + (float)k, j);
            drawable.setBounds(0, (int)f1, i, k2);
            drawable.draw(canvas);
        }

        Drawable drawable1 = mPrimary;
        int j1 = mPrimary.getIntrinsicWidth();
        mPrimary.getIntrinsicHeight();
        float af1[] = mHoriz.getTickPoints();
        int k1 = af1.length;
        for (int l1 = 0; l1 < k1; l1++)
        {
            float f = af1[l1];
            int j2 = (int)Math.min(f + (float)j1, i);
            drawable1.setBounds((int)f, 0, j2, j);
            drawable1.draw(canvas);
        }

        mBorder.setBounds(0, 0, i, j);
        mBorder.draw(canvas);
        int i2;
        if (mLayoutStart != null)
            i2 = mLayoutStart.getHeight() / 8;
        else
            i2 = 0;
        Layout layout = mLayoutStart;
        if (layout != null)
        {
            canvas.save();
            canvas.translate(0.0F, j + i2);
            layout.draw(canvas);
            canvas.restore();
        }
        Layout layout1 = mLayoutEnd;
        if (layout1 != null)
        {
            canvas.save();
            canvas.translate(i - layout1.getWidth(), j + i2);
            layout1.draw(canvas);
            canvas.restore();
        }
    }

    void setBounds(long l, long l1)
    {
        Context context = getContext();
        mLayoutStart = makeLayout(DataUsageSummary.formatDateRange(context, l, l));
        mLayoutEnd = makeLayout(DataUsageSummary.formatDateRange(context, l1, l1));
        invalidate();
    }
}
