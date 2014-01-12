// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.app.Activity;
import android.content.Context;
import android.preference.*;
import android.widget.TabWidget;
import android.widget.TextView;

public interface ISettingsMiscExt
{

    public abstract void DataUsageUpdateSimText(int i, TextView textview);

    public abstract android.widget.TabHost.TabSpec DataUsageUpdateTabInfo(Activity activity, String s, android.widget.TabHost.TabSpec tabspec, TabWidget tabwidget, String s1);

    public abstract Preference getApnPref(PreferenceGroup preferencegroup, int i, int ai[]);

    public abstract String getDataUsageBackgroundStrByTag(String s, String s1);

    public abstract String getTetherWifiSSID(Context context);

    public abstract boolean isAllowEditPresetApn(String s, String s1, String s2);

    public abstract boolean isWifiToggleCouldDisabled(Context context);

    public abstract void removeTetherApnSettings(PreferenceScreen preferencescreen, Preference preference);

    public abstract void setTimeoutPrefTitle(Preference preference);
}
