// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.util.Log;

public class OthersSettingsExtension
{

    private static final String LOG_TAG = "NetworkSettings";


    public void customizeCallRejectFeature(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference != null)
            preferencescreen.removePreference(preference);
    }

    public void log(String s)
    {
        Log.d("NetworkSettings", s);
    }
}
