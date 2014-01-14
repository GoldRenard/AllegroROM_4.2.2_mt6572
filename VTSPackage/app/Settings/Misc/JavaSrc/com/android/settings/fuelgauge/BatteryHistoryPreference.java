// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.content.Context;
import android.os.BatteryStats;
import android.preference.Preference;
import android.view.View;

// Referenced classes of package com.android.settings.fuelgauge:
//            BatteryHistoryChart

public class BatteryHistoryPreference extends Preference
{

    private BatteryStats mStats;

    public BatteryHistoryPreference(Context context, BatteryStats batterystats)
    {
        super(context);
        setLayoutResource(0x7f04005c);
        mStats = batterystats;
    }

    BatteryStats getStats()
    {
        return mStats;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        ((BatteryHistoryChart)view.findViewById(0x1010002)).setStats(mStats);
    }
}
