// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.app.Fragment;
import android.os.Bundle;
import android.os.Parcel;
import android.view.*;
import com.android.internal.os.BatteryStatsImpl;

// Referenced classes of package com.android.settings.fuelgauge:
//            BatteryHistoryChart

public class BatteryHistoryDetail extends Fragment
{

    public static final String EXTRA_STATS = "stats";
    private BatteryStatsImpl mStats;


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        byte abyte0[] = getArguments().getByteArray("stats");
        Parcel parcel = Parcel.obtain();
        parcel.unmarshall(abyte0, 0, abyte0.length);
        parcel.setDataPosition(0);
        mStats = (BatteryStatsImpl)BatteryStatsImpl.CREATOR.createFromParcel(parcel);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f04005c, null);
        ((BatteryHistoryChart)view.findViewById(0x1010002)).setStats(mStats);
        return view;
    }
}
