// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.preference.*;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class ApplicationSettings extends SettingsPreferenceFragment
{

    private static final int APP_INSTALL_AUTO = 0;
    private static final String APP_INSTALL_AUTO_ID = "auto";
    private static final int APP_INSTALL_DEVICE = 1;
    private static final String APP_INSTALL_DEVICE_ID = "device";
    private static final int APP_INSTALL_SDCARD = 2;
    private static final String APP_INSTALL_SDCARD_ID = "sdcard";
    private static final String KEY_APP_INSTALL_LOCATION = "app_install_location";
    private static final String KEY_TOGGLE_ADVANCED_SETTINGS = "toggle_advanced_settings";
    private ListPreference mInstallLocation;
    private CheckBoxPreference mToggleAdvancedSettings;


    private String getAppInstallLocation()
    {
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "default_install_location", 0);
        if (i == 1)
            return "device";
        if (i == 2)
            return "sdcard";
        if (i == 0)
            return "auto";
        else
            return "auto";
    }

    private boolean isAdvancedSettingsEnabled()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "advanced_settings", 0);
        boolean flag = false;
        if (i > 0)
            flag = true;
        return flag;
    }

    private void setAdvancedSettingsEnabled(boolean flag)
    {
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(getContentResolver(), "advanced_settings", i);
        Intent intent = new Intent("android.intent.action.ADVANCED_SETTINGS");
        intent.putExtra("state", i);
        getActivity().sendBroadcast(intent);
    }

    protected void handleUpdateAppInstallLocation(String s)
    {
        if ("device".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 1);
        else
        if ("sdcard".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 2);
        else
        if ("auto".equals(s))
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 0);
        else
            android.provider.Settings.Global.putInt(getContentResolver(), "default_install_location", 0);
        mInstallLocation.setValue(s);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050007);
        mToggleAdvancedSettings = (CheckBoxPreference)findPreference("toggle_advanced_settings");
        mToggleAdvancedSettings.setChecked(isAdvancedSettingsEnabled());
        getPreferenceScreen().removePreference(mToggleAdvancedSettings);
        mInstallLocation = (ListPreference)findPreference("app_install_location");
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "set_install_location", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        if (!flag)
        {
            getPreferenceScreen().removePreference(mInstallLocation);
            return;
        } else
        {
            mInstallLocation.setValue(getAppInstallLocation());
            mInstallLocation.setOnPreferenceChangeListener(new android.preference.Preference.OnPreferenceChangeListener() {

                final ApplicationSettings this$0;

                public boolean onPreferenceChange(Preference preference, Object obj)
                {
                    String s = (String)obj;
                    handleUpdateAppInstallLocation(s);
                    return false;
                }

            
            {
                this$0 = ApplicationSettings.this;
                super();
            }
            }
);
            return;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mToggleAdvancedSettings)
            setAdvancedSettingsEnabled(mToggleAdvancedSettings.isChecked());
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }
}
