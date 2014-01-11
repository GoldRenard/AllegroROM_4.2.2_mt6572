// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.database.Cursor;
import android.preference.*;
import com.mediatek.lbs.AgpsEpoSettings;
import com.mediatek.lbs.CustomSwitchPreference;
import com.mediatek.xlog.Xlog;
import java.util.Observable;
import java.util.Observer;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class LocationSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_ASSISTED_GPS = "assisted_gps";
    private static final String KEY_LOCATION_GPS = "location_gps";
    private static final String KEY_LOCATION_NETWORK = "location_network";
    private static final String KEY_LOCATION_TOGGLE = "location_toggle";
    private static final String TAG = "LocationSettings";
    private CheckBoxPreference mAssistedGps;
    private ContentQueryMap mContentQueryMap;
    private CustomSwitchPreference mGps;
    private CheckBoxPreference mLocationAccess;
    private CheckBoxPreference mNetwork;
    private Cursor mSettingsCursor;
    private Observer mSettingsObserver;


    private PreferenceScreen createPreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
            preferencescreen.removeAll();
        addPreferencesFromResource(0x7f05001e);
        PreferenceScreen preferencescreen1 = getPreferenceScreen();
        mLocationAccess = (CheckBoxPreference)preferencescreen1.findPreference("location_toggle");
        mNetwork = (CheckBoxPreference)preferencescreen1.findPreference("location_network");
        mGps = (CustomSwitchPreference)preferencescreen1.findPreference("location_gps");
        mAssistedGps = (CheckBoxPreference)preferencescreen1.findPreference("assisted_gps");
        StringBuilder stringbuilder = (new StringBuilder()).append("mAssistedGps is null :");
        boolean flag;
        if (mAssistedGps == null)
            flag = true;
        else
            flag = false;
        Xlog.d("LocationSettings", stringbuilder.append(flag).toString());
        mLocationAccess.setOnPreferenceChangeListener(this);
        return preferencescreen1;
    }

    private void onToggleLocationAccess(boolean flag)
    {
        ContentResolver contentresolver = getContentResolver();
        android.provider.Settings.Secure.setLocationProviderEnabled(contentresolver, "gps", flag);
        android.provider.Settings.Secure.setLocationProviderEnabled(contentresolver, "network", flag);
        updateLocationToggles();
    }

    private void updateLocationToggles()
    {
        boolean flag = true;
        ContentResolver contentresolver = getContentResolver();
        boolean flag1 = android.provider.Settings.Secure.isLocationProviderEnabled(contentresolver, "gps");
        boolean flag2 = android.provider.Settings.Secure.isLocationProviderEnabled(contentresolver, "network");
        mGps.setChecked(flag1);
        mNetwork.setChecked(flag2);
        CheckBoxPreference checkboxpreference = mLocationAccess;
        boolean flag3;
        if (!flag1 && !flag2)
            flag3 = false;
        else
            flag3 = flag;
        checkboxpreference.setChecked(flag3);
        if (mAssistedGps != null)
        {
            CheckBoxPreference checkboxpreference1 = mAssistedGps;
            if (android.provider.Settings.Global.getInt(contentresolver, "assisted_gps_enabled", 2) != flag)
                flag = false;
            checkboxpreference1.setChecked(flag);
            mAssistedGps.setEnabled(flag1);
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        createPreferenceHierarchy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference.getKey().equals("location_toggle"))
            onToggleLocationAccess(((Boolean)obj).booleanValue());
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        ContentResolver contentresolver = getContentResolver();
        if (preference == mNetwork)
        {
            android.provider.Settings.Secure.setLocationProviderEnabled(contentresolver, "network", mNetwork.isChecked());
            return true;
        }
        if (preference == mGps)
        {
            boolean flag = mGps.isChecked();
            android.provider.Settings.Secure.setLocationProviderEnabled(contentresolver, "gps", flag);
            if (mAssistedGps != null)
                mAssistedGps.setEnabled(flag);
            startFragment(this, com/mediatek/lbs/AgpsEpoSettings.getCanonicalName(), 1, null, 0x7f0b05e6);
            return true;
        }
        if (preference == mAssistedGps)
        {
            int i;
            if (mAssistedGps.isChecked())
                i = 1;
            else
                i = 0;
            android.provider.Settings.Global.putInt(contentresolver, "assisted_gps_enabled", i);
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        super.onResume();
        createPreferenceHierarchy();
        updateLocationToggles();
        if (mSettingsObserver == null)
            mSettingsObserver = new Observer() {

                final LocationSettings this$0;

                public void update(Observable observable, Object obj)
                {
                    updateLocationToggles();
                }

            
            {
                this$0 = LocationSettings.this;
                super();
            }
            }
;
        mContentQueryMap.addObserver(mSettingsObserver);
    }

    public void onStart()
    {
        super.onStart();
        mSettingsCursor = getContentResolver().query(android.provider.Settings.Secure.CONTENT_URI, null, "(name=?)", new String[] {
            "location_providers_allowed"
        }, null);
        mContentQueryMap = new ContentQueryMap(mSettingsCursor, "name", true, null);
    }

    public void onStop()
    {
        super.onStop();
        if (mSettingsObserver != null)
            mContentQueryMap.deleteObserver(mSettingsObserver);
        if (mSettingsCursor != null)
            mSettingsCursor.close();
    }

}
