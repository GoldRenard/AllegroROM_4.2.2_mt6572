// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Intent;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import com.android.settings.Utils;

public class SoftwareUpdates extends PreferenceActivity
{

    private static final String KEY_DMSW_UPDATE = "software_update";
    private static final String KEY_SCOMO = "scomo";
    private static final String KEY_SYSTEM_UPDATE_SETTINGS = "system_update_settings";
    private static final String TAG = "SoftwareUpdates";


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050013);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        Utils.updatePreferenceToSpecificActivityOrRemove(this, preferencescreen, "system_update_settings", 1);
        Log.i("SoftwareUpdates", "FeatureOption.MTK_FOTA_ENTRY=false removed!");
        preferencescreen.removePreference(findPreference("software_update"));
        Log.i("SoftwareUpdates", "FeatureOption.MTK_SCOMO_ENTRY=false removed!");
        preferencescreen.removePreference(findPreference("scomo"));
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.getKey().equals("software_update"))
        {
            Intent intent = new Intent();
            intent.setAction("com.mediatek.DMSWUPDATE");
            sendBroadcast(intent);
            Log.i("SoftwareUpdates", (new StringBuilder()).append("software_update pressed with intent ").append(intent.getAction()).toString());
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }
}
