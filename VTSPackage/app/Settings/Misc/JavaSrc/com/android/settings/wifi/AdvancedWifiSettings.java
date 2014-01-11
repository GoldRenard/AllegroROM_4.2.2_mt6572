// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.*;
import android.text.TextUtils;
import android.widget.Toast;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IWifiExt;
import com.mediatek.xlog.Xlog;

public class AdvancedWifiSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_FREQUENCY_BAND = "frequency_band";
    private static final String KEY_NOTIFY_OPEN_NETWORKS = "notify_open_networks";
    private static final String KEY_POOR_NETWORK_DETECTION = "wifi_poor_network_detection";
    private static final String KEY_SLEEP_POLICY = "sleep_policy";
    private static final String KEY_SUSPEND_OPTIMIZATIONS = "suspend_optimizations";
    private static final int NOT_FOUND_STRING = -1;
    private static final int ONLY_ONE_IP_ADDRESS = 1;
    private static final String TAG = "AdvancedWifiSettings";
    IWifiExt mExt;
    private IntentFilter mIntentFilter;
    private Preference mIpAddressPref;
    private Preference mIpv6AddressPref;
    private Preference mMacAddressPref;
    private CheckBoxPreference mNotifyOpenNetworks;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final AdvancedWifiSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            if ("android.net.wifi.WIFI_STATE_CHANGED".equals(intent.getAction()))
            {
                int i = intent.getIntExtra("wifi_state", 4);
                if (i == 3)
                    mNotifyOpenNetworks.setEnabled(true);
                else
                if (i == 1)
                {
                    mNotifyOpenNetworks.setEnabled(false);
                    return;
                }
            }
        }

            
            {
                this$0 = AdvancedWifiSettings.this;
                super();
            }
    }
;
    private WifiManager mWifiManager;


    private void addWifiInfoPreference()
    {
        mMacAddressPref = new Preference(getActivity());
        mMacAddressPref.setTitle(0x7f0b049a);
        getPreferenceScreen().addPreference(mMacAddressPref);
        mIpAddressPref = new Preference(getActivity());
        mIpAddressPref.setTitle(0x7f0b017e);
        mIpv6AddressPref = new Preference(getActivity());
        mIpv6AddressPref.setTitle(0x7f0b017f);
        getPreferenceScreen().addPreference(mIpv6AddressPref);
        getPreferenceScreen().addPreference(mIpAddressPref);
    }

    private void initPreferences()
    {
        boolean flag = true;
        mNotifyOpenNetworks = (CheckBoxPreference)findPreference("notify_open_networks");
        CheckBoxPreference checkboxpreference = mNotifyOpenNetworks;
        boolean flag1;
        if (android.provider.Settings.Global.getInt(getContentResolver(), "wifi_networks_available_notification_on", 0) == flag)
            flag1 = flag;
        else
            flag1 = false;
        checkboxpreference.setChecked(flag1);
        mNotifyOpenNetworks.setEnabled(mWifiManager.isWifiEnabled());
        CheckBoxPreference checkboxpreference1 = (CheckBoxPreference)findPreference("wifi_poor_network_detection");
        if (checkboxpreference1 != null)
        {
            getPreferenceScreen().removePreference(checkboxpreference1);
            android.provider.Settings.Global.putInt(getContentResolver(), "wifi_watchdog_poor_network_test_enabled", 0);
        }
        CheckBoxPreference checkboxpreference2 = (CheckBoxPreference)findPreference("suspend_optimizations");
        if (android.provider.Settings.Global.getInt(getContentResolver(), "wifi_suspend_optimizations_enabled", flag) != flag)
            flag = false;
        checkboxpreference2.setChecked(flag);
        ListPreference listpreference = (ListPreference)findPreference("frequency_band");
        if (mWifiManager.isDualBandSupported())
        {
            listpreference.setOnPreferenceChangeListener(this);
            int i = mWifiManager.getFrequencyBand();
            if (i != -1)
                listpreference.setValue(String.valueOf(i));
            else
                Xlog.e("AdvancedWifiSettings", "Failed to fetch frequency band");
        } else
        if (listpreference != null)
            getPreferenceScreen().removePreference(listpreference);
        ListPreference listpreference1 = (ListPreference)findPreference("sleep_policy");
        if (listpreference1 != null)
        {
            if (Utils.isWifiOnly(getActivity()))
                listpreference1.setEntries(0x7f07001b);
            listpreference1.setOnPreferenceChangeListener(this);
            String s = String.valueOf(mExt.getSleepPolicy(getContentResolver()));
            listpreference1.setValue(s);
            updateSleepPolicySummary(listpreference1, s);
        }
    }

    private void refreshWifiInfo()
    {
        WifiInfo wifiinfo = mWifiManager.getConnectionInfo();
        String s;
        if (wifiinfo == null)
            s = null;
        else
            s = wifiinfo.getMacAddress();
        Preference preference = mMacAddressPref;
        if (TextUtils.isEmpty(s))
            s = getActivity().getString(0x7f0b055e);
        preference.setSummary(s);
        String s1 = Utils.getWifiIpAddresses(getActivity());
        Xlog.d("AdvancedWifiSettings", (new StringBuilder()).append("refreshWifiInfo, the ipAddress is : ").append(s1).toString());
        if (s1 != null)
        {
            String as[] = s1.split(", ");
            int i = as.length;
            for (int j = 0; j < i; j++)
                if (as[j].indexOf(":") == -1)
                {
                    Preference preference3 = mIpAddressPref;
                    String s3;
                    if (as[j] == null)
                        s3 = getActivity().getString(0x7f0b055e);
                    else
                        s3 = as[j];
                    preference3.setSummary(s3);
                    if (i == 1)
                        getPreferenceScreen().removePreference(mIpv6AddressPref);
                } else
                {
                    Preference preference2 = mIpv6AddressPref;
                    String s2;
                    if (as[j] == null)
                        s2 = getActivity().getString(0x7f0b055e);
                    else
                        s2 = as[j];
                    preference2.setSummary(s2);
                    if (i == 1)
                        getPreferenceScreen().removePreference(mIpAddressPref);
                }

        } else
        {
            Preference preference1 = mIpAddressPref;
            if (s1 == null)
                s1 = getActivity().getString(0x7f0b055e);
            preference1.setSummary(s1);
            getPreferenceScreen().removePreference(mIpv6AddressPref);
        }
        mExt.refreshNetworkInfoView();
    }

    private void updateSleepPolicySummary(Preference preference, String s)
    {
        if (s != null)
        {
            String as[] = getResources().getStringArray(0x7f07001c);
            int i;
            if (Utils.isWifiOnly(getActivity()))
                i = 0x7f07001b;
            else
                i = 0x7f07001a;
            String as1[] = getResources().getStringArray(i);
            for (int j = 0; j < as.length; j++)
                if (s.equals(as[j]) && j < as1.length)
                {
                    preference.setSummary(as1[j]);
                    return;
                }

        }
        preference.setSummary("");
        Xlog.d("AdvancedWifiSettings", (new StringBuilder()).append("Invalid sleep policy value: ").append(s).toString());
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        mWifiManager = (WifiManager)getActivity().getApplicationContext().getSystemService("wifi");
        mExt.initConnectView(getActivity(), getPreferenceScreen());
        mExt.initPreference(getContentResolver());
        addWifiInfoPreference();
        mExt.initNetworkInfoView(getPreferenceScreen());
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05004c);
        mExt = Utils.getWifiPlugin(getActivity());
        mIntentFilter = new IntentFilter("android.net.wifi.WIFI_STATE_CHANGED");
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if ("frequency_band".equals(s))
            try
            {
                mWifiManager.setFrequencyBand(Integer.parseInt((String)obj), true);
            }
            catch (NumberFormatException numberformatexception1)
            {
                Toast.makeText(getActivity(), 0x7f0b0499, 0).show();
                return false;
            }
        if ("sleep_policy".equals(s))
            try
            {
                String s1 = (String)obj;
                android.provider.Settings.Global.putInt(getContentResolver(), "wifi_sleep_policy", Integer.parseInt(s1));
                updateSleepPolicySummary(preference, s1);
            }
            catch (NumberFormatException numberformatexception)
            {
                Toast.makeText(getActivity(), 0x7f0b0441, 0).show();
                return false;
            }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        String s = preference.getKey();
        if ("notify_open_networks".equals(s))
        {
            android.content.ContentResolver contentresolver2 = getContentResolver();
            boolean flag2 = ((CheckBoxPreference)preference).isChecked();
            int k = 0;
            if (flag2)
                k = 1;
            android.provider.Settings.Global.putInt(contentresolver2, "wifi_networks_available_notification_on", k);
            return true;
        }
        if ("wifi_poor_network_detection".equals(s))
        {
            android.content.ContentResolver contentresolver1 = getContentResolver();
            boolean flag1 = ((CheckBoxPreference)preference).isChecked();
            int j = 0;
            if (flag1)
                j = 1;
            android.provider.Settings.Global.putInt(contentresolver1, "wifi_watchdog_poor_network_test_enabled", j);
            return true;
        }
        if ("suspend_optimizations".equals(s))
        {
            android.content.ContentResolver contentresolver = getContentResolver();
            boolean flag = ((CheckBoxPreference)preference).isChecked();
            int i = 0;
            if (flag)
                i = 1;
            android.provider.Settings.Global.putInt(contentresolver, "wifi_suspend_optimizations_enabled", i);
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        super.onResume();
        initPreferences();
        refreshWifiInfo();
        getActivity().registerReceiver(mReceiver, mIntentFilter);
    }

}
