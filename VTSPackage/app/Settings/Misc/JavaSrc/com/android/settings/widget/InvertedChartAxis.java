// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.res.Resources;
import android.text.SpannableStringBuilder;

// Referenced classes of package com.android.settings.widget:
//            ChartAxis

public class InvertedChartAxis
    implements ChartAxis
{

    private float mSize;
    private final ChartAxis mWrapped;

    public InvertedChartAxis(ChartAxis chartaxis)
    {
        mWrapped = chartaxis;
    }

    public long buildLabel(Resources resources, SpannableStringBuilder spannablestringbuilder, long l)
    {
        return mWrapped.buildLabel(resources, spannablestringbuilder, l);
    }

    public float convertToPoint(long l)
    {
        return mSize - mWrapped.convertToPoint(l);
    }

    public long convertToValue(float f)
    {
        return mWrapped.convertToValue(mSize - f);
    }

    public float[] getTickPoints()
    {
        float af[] = mWrapped.getTickPoints();
        for (int i = 0; i < af.length; i++)
            af[i] = mSize - af[i];

        return af;
    }

    public boolean setBounds(long l, long l1)
    {
        return mWrapped.setBounds(l, l1);
    }

    public boolean setSize(float f)
    {
        mSize = f;
        return mWrapped.setSize(f);
    }

    public int shouldAdjustAxis(long l)
    {
        return mWrapped.shouldAdjustAxis(l);
    }
}
