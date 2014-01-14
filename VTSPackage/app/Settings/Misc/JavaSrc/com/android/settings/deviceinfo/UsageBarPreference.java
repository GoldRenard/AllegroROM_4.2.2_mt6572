// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.List;

// Referenced classes of package com.android.settings.deviceinfo:
//            PercentageBarChart

public class UsageBarPreference extends Preference
{

    private PercentageBarChart mChart;
    private final List mEntries;

    public UsageBarPreference(Context context)
    {
        super(context);
        mChart = null;
        mEntries = Lists.newArrayList();
        setLayoutResource(0x7f04006a);
    }

    public UsageBarPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mChart = null;
        mEntries = Lists.newArrayList();
        setLayoutResource(0x7f04006a);
    }

    public UsageBarPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mChart = null;
        mEntries = Lists.newArrayList();
        setLayoutResource(0x7f04006a);
    }

    public void addEntry(int i, float f, int j)
    {
        mEntries.add(PercentageBarChart.createEntry(i, f, j));
        Collections.sort(mEntries);
    }

    public void clear()
    {
        mEntries.clear();
    }

    public void commit()
    {
        if (mChart != null)
            mChart.invalidate();
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mChart = (PercentageBarChart)view.findViewById(0x7f080105);
        mChart.setEntries(mEntries);
    }
}
