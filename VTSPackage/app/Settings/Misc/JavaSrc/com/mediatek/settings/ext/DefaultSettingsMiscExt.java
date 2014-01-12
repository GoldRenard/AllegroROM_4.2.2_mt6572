// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.app.Activity;
import android.content.Context;
import android.preference.*;
import android.widget.TabWidget;
import android.widget.TextView;

// Referenced classes of package com.mediatek.settings.ext:
//            ISettingsMiscExt

public class DefaultSettingsMiscExt
    implements ISettingsMiscExt
{

    private static final int SIM_CARD_1 = 0;
    private static final int SIM_CARD_2 = 1;
    private static final int SIM_CARD_SINGLE = 2;
    private static final String TAG = "DefaultSettingsMiscExt";


    public void DataUsageUpdateSimText(int i, TextView textview)
    {
    }

    public android.widget.TabHost.TabSpec DataUsageUpdateTabInfo(Activity activity, String s, android.widget.TabHost.TabSpec tabspec, TabWidget tabwidget, String s1)
    {
        return tabspec;
    }

    public Preference getApnPref(PreferenceGroup preferencegroup, int i, int ai[])
    {
        return preferencegroup.getPreference(0);
    }

    public String getDataUsageBackgroundStrByTag(String s, String s1)
    {
        return s;
    }

    public String getTetherWifiSSID(Context context)
    {
        return context.getString(0x104040c);
    }

    public boolean isAllowEditPresetApn(String s, String s1, String s2)
    {
        return true;
    }

    public boolean isWifiToggleCouldDisabled(Context context)
    {
        return true;
    }

    public void removeTetherApnSettings(PreferenceScreen preferencescreen, Preference preference)
    {
        preferencescreen.removePreference(preference);
    }

    public void setTimeoutPrefTitle(Preference preference)
    {
    }
}
