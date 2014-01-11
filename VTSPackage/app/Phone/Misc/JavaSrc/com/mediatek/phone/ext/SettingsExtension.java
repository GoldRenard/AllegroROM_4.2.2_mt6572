// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.content.Context;
import android.preference.*;
import android.util.Log;
import com.android.internal.telephony.Phone;
import java.util.List;

public class SettingsExtension
{

    private static final String LOG_TAG = "NetworkSettings";


    public void customizeFeatureForOperator(PreferenceScreen preferencescreen, Preference preference, Preference preference1, Preference preference2, Preference preference3)
    {
        preferencescreen.removePreference(preference3);
    }

    public void customizePLMNFeature(PreferenceScreen preferencescreen, Preference preference)
    {
    }

    public boolean dataEnableReminder(boolean flag, PreferenceActivity preferenceactivity)
    {
        return false;
    }

    public void disableDataRoaming(CheckBoxPreference checkboxpreference, boolean flag)
    {
    }

    public String getRoamingSummary(Context context, int i)
    {
        String s = context.getString(i);
        Log.d("NetworkSettings", (new StringBuilder()).append("Default setRoamingSummary with summary=").append(s).toString());
        return s;
    }

    public void log(String s)
    {
        Log.d("NetworkSettings", s);
    }

    public void removeNMMode(PreferenceScreen preferencescreen, Preference preference, Preference preference1, Preference preference2)
    {
    }

    public void removeNMOp(PreferenceScreen preferencescreen, Preference preference, boolean flag)
    {
    }

    public void removeNMOpFor3GSwitch(PreferenceScreen preferencescreen, Preference preference)
    {
    }

    public void removeNMOpForMultiSim(Phone phone, List list, String s)
    {
    }

    public void showWarningDlg(Context context, int i)
    {
        log("default to do nothing");
    }
}
