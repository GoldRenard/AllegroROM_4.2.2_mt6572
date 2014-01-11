// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.net;

import android.app.Activity;
import android.content.Context;
import android.net.*;
import android.net.wifi.*;
import android.os.Bundle;
import android.preference.*;
import android.telephony.TelephonyManager;
import com.android.settings.DataUsageSummary;
import com.android.settings.SettingsPreferenceFragment;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.settings.net:
//            NetworkPolicyEditor

public class DataUsageMeteredSettings extends SettingsPreferenceFragment
{
    private class MeteredPreference extends CheckBoxPreference
    {

        private boolean mBinding;
        private final NetworkTemplate mTemplate;
        final DataUsageMeteredSettings this$0;

        protected void notifyChanged()
        {
            super.notifyChanged();
            if (!mBinding)
                mPolicyEditor.setPolicyMetered(mTemplate, isChecked());
        }

        public MeteredPreference(Context context, NetworkTemplate networktemplate)
        {
            this$0 = DataUsageMeteredSettings.this;
            super(context);
            mTemplate = networktemplate;
            setPersistent(false);
            mBinding = true;
            NetworkPolicy networkpolicy = mPolicyEditor.getPolicy(networktemplate);
            if (networkpolicy != null)
            {
                if (networkpolicy.limitBytes != -1L)
                {
                    setChecked(true);
                    setEnabled(false);
                } else
                {
                    setChecked(networkpolicy.metered);
                }
            } else
            {
                setChecked(false);
            }
            mBinding = false;
        }
    }


    private static final boolean SHOW_MOBILE_CATEGORY;
    private PreferenceCategory mMobileCategory;
    private NetworkPolicyEditor mPolicyEditor;
    private NetworkPolicyManager mPolicyManager;
    private PreferenceCategory mWifiCategory;
    private Preference mWifiDisabled;
    private WifiManager mWifiManager;


    private Preference buildMobilePref(Context context)
    {
        TelephonyManager telephonymanager = TelephonyManager.from(context);
        MeteredPreference meteredpreference = new MeteredPreference(context, NetworkTemplate.buildTemplateMobileAll(telephonymanager.getSubscriberId()));
        meteredpreference.setTitle(telephonymanager.getNetworkOperatorName());
        return meteredpreference;
    }

    private Preference buildWifiPref(Context context, WifiConfiguration wificonfiguration)
    {
        String s = WifiInfo.removeDoubleQuotes(wificonfiguration.SSID);
        MeteredPreference meteredpreference = new MeteredPreference(context, NetworkTemplate.buildTemplateWifi(s));
        meteredpreference.setTitle(s);
        return meteredpreference;
    }

    private void updateNetworks(Context context)
    {
        getPreferenceScreen().removePreference(mMobileCategory);
        mWifiCategory.removeAll();
        if (DataUsageSummary.hasWifiRadio(context) && mWifiManager.isWifiEnabled())
        {
            Iterator iterator = mWifiManager.getConfiguredNetworks().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                WifiConfiguration wificonfiguration = (WifiConfiguration)iterator.next();
                if (wificonfiguration.SSID != null)
                    mWifiCategory.addPreference(buildWifiPref(context, wificonfiguration));
            } while (true);
        } else
        {
            mWifiCategory.addPreference(mWifiDisabled);
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Activity activity = getActivity();
        mPolicyManager = NetworkPolicyManager.from(activity);
        mWifiManager = (WifiManager)activity.getApplicationContext().getSystemService("wifi");
        mPolicyEditor = new NetworkPolicyEditor(mPolicyManager);
        mPolicyEditor.read();
        addPreferencesFromResource(0x7f05000c);
        mMobileCategory = (PreferenceCategory)findPreference("mobile");
        mWifiCategory = (PreferenceCategory)findPreference("wifi");
        mWifiDisabled = findPreference("wifi_disabled");
        updateNetworks(activity);
    }

}
