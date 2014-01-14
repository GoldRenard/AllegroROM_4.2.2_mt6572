// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi.hotspot;

import android.content.Context;
import android.preference.SwitchPreference;
import android.util.AttributeSet;
import com.mediatek.xlog.Xlog;

public class HotspotSwitchPreference extends SwitchPreference
{

    private static final String TAG = "HotspotSwitchPreference";

    public HotspotSwitchPreference(Context context)
    {
        super(context);
    }

    public HotspotSwitchPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public HotspotSwitchPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    protected void onClick()
    {
        Xlog.d("HotspotSwitchPreference", "onClick()");
    }
}
