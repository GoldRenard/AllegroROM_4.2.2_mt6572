// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi.hotspot;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.wifi.*;
import android.os.Bundle;
import android.preference.*;
import android.view.*;
import android.widget.*;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.wifi.WifiApDialog;
import com.android.settings.wifi.WifiApEnabler;
import com.mediatek.custom.CustomProperties;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.mediatek.wifi.hotspot:
//            ButtonPreference, WifiApWpsDialog

public class TetherWifiSettings extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener, android.preference.Preference.OnPreferenceChangeListener, ButtonPreference.OnButtonClickCallback
{

    private static final String BANDWIDTH = "bandwidth_usage";
    private static final String BLOCKED_CATEGORY = "blocked_category";
    private static final int CONFIG_SUBTEXT = 0x7f0b04c1;
    private static final String CONNECTED_CATEGORY = "connected_category";
    private static final int DIALOG_AP_CLIENT_DETAIL = 3;
    private static final int DIALOG_AP_SETTINGS = 2;
    private static final int DIALOG_WPS_CONNECT = 1;
    private static final String TAG = "TetherWifiSettings";
    private static final int WIFI_AP_AUTO_CHANNEL_TEXT = 0x7f0b013a;
    private static final int WIFI_AP_AUTO_CHANNEL_WIDTH_TEXT = 0x7f0b013b;
    private static final int WIFI_AP_FIX_CHANNEL_WIDTH_TEXT = 0x7f0b0139;
    private static final String WIFI_AP_SSID_AND_SECURITY = "wifi_ap_ssid_and_security";
    private static final String WIFI_AUTO_DISABLE = "wifi_auto_disable";
    private static final String WPS_CONNECT = "wps_connect";
    private Preference mBandwidth;
    private PreferenceCategory mBlockedCategory;
    private List mClientList;
    private PreferenceCategory mConnectedCategory;
    private Preference mCreateNetwork;
    private View mDetailView;
    private WifiApDialog mDialog;
    private IntentFilter mIntentFilter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final TetherWifiSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("TetherWifiSettings", (new StringBuilder()).append("receive action: ").append(s).toString());
            if ("android.net.wifi.WIFI_HOTSPOT_CLIENTS_CHANGED".equals(s))
            {
                handleWifiApClientsChanged();
            } else
            {
                if ("android.net.wifi.WIFI_WPS_CHECK_PIN_FAIL".equals(s))
                {
                    Toast.makeText(context, 0x7f0b015d, 1).show();
                    return;
                }
                if ("android.net.wifi.WIFI_HOTSPOT_OVERLAP".equals(s))
                {
                    Toast.makeText(context, 0x7f0b0461, 1).show();
                    return;
                }
            }
        }

            
            {
                this$0 = TetherWifiSettings.this;
                super();
            }
    }
;
    private String mSecurityType[];
    private WifiApEnabler mWifiApEnabler;
    private ListPreference mWifiAutoDisable;
    private WifiConfiguration mWifiConfig;
    private WifiManager mWifiManager;
    private String mWifiRegexs[];
    private Preference mWpsConnect;

    public TetherWifiSettings()
    {
        mWifiConfig = null;
    }

    private static String findIface(String as[], String as1[])
    {
        int i = as.length;
        for (int j = 0; j < i; j++)
        {
            String s = as[j];
            int k = as1.length;
            for (int l = 0; l < k; l++)
                if (s.matches(as1[l]))
                    return s;

        }

        return null;
    }

    private void handleWifiApClientsChanged()
    {
        mConnectedCategory.removeAll();
        mBlockedCategory.removeAll();
        mClientList = mWifiManager.getHotspotClients();
        if (mClientList != null)
        {
            Xlog.d("TetherWifiSettings", (new StringBuilder()).append("client number is ").append(mClientList.size()).toString());
            for (Iterator iterator = mClientList.iterator(); iterator.hasNext();)
            {
                HotspotClient hotspotclient = (HotspotClient)iterator.next();
                ButtonPreference buttonpreference = new ButtonPreference(getActivity(), hotspotclient, this);
                buttonpreference.setMacAddress(hotspotclient.deviceAddress);
                if (hotspotclient.isBlocked)
                {
                    buttonpreference.setButtonText(getResources().getString(0x7f0b0168));
                    mBlockedCategory.addPreference(buttonpreference);
                    Xlog.d("TetherWifiSettings", (new StringBuilder()).append("blocked client MAC is ").append(hotspotclient.deviceAddress).toString());
                } else
                {
                    buttonpreference.setButtonText(getResources().getString(0x7f0b0167));
                    mConnectedCategory.addPreference(buttonpreference);
                    Xlog.d("TetherWifiSettings", (new StringBuilder()).append("connected client MAC is ").append(hotspotclient.deviceAddress).toString());
                }
            }

            if (mConnectedCategory.getPreferenceCount() == 0)
            {
                Preference preference1 = new Preference(getActivity());
                preference1.setTitle(0x7f0b01c9);
                mConnectedCategory.addPreference(preference1);
            }
            if (mBlockedCategory.getPreferenceCount() == 0)
            {
                Preference preference = new Preference(getActivity());
                preference.setTitle(0x7f0b01ca);
                mBlockedCategory.addPreference(preference);
            }
        }
    }

    private void initWifiTethering()
    {
        Activity activity = getActivity();
        mWifiManager = (WifiManager)activity.getApplicationContext().getSystemService("wifi");
        mWifiConfig = mWifiManager.getWifiApConfiguration();
        mSecurityType = getResources().getStringArray(0x7f070014);
        mCreateNetwork = findPreference("wifi_ap_ssid_and_security");
        if (mWifiConfig == null)
        {
            String s1 = CustomProperties.getString("wlan", "SSID", activity.getString(0x104040c));
            Preference preference1 = mCreateNetwork;
            String s2 = activity.getString(0x7f0b04c1);
            Object aobj1[] = new Object[2];
            aobj1[0] = s1;
            aobj1[1] = mSecurityType[0];
            preference1.setSummary(String.format(s2, aobj1));
            return;
        } else
        {
            int i = WifiApDialog.getSecurityTypeIndex(mWifiConfig);
            Xlog.d("TetherWifiSettings", (new StringBuilder()).append("index = ").append(i).toString());
            Preference preference = mCreateNetwork;
            String s = activity.getString(0x7f0b04c1);
            Object aobj[] = new Object[2];
            aobj[0] = mWifiConfig.SSID;
            aobj[1] = mSecurityType[i];
            preference.setSummary(String.format(s, aobj));
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            mWifiConfig = mDialog.getConfig();
            if (mWifiConfig != null)
            {
                if (mWifiManager.getWifiApState() == 13)
                {
                    mWifiManager.setWifiApEnabled(null, false);
                    mWifiManager.setWifiApEnabled(mWifiConfig, true);
                } else
                {
                    mWifiManager.setWifiApConfiguration(mWifiConfig);
                }
                int j = WifiApDialog.getSecurityTypeIndex(mWifiConfig);
                if (j == 0)
                    Toast.makeText(getActivity(), 0x7f0b01c2, 1).show();
                Preference preference = mCreateNetwork;
                String s = getActivity().getString(0x7f0b04c1);
                Object aobj[] = new Object[2];
                aobj[0] = mWifiConfig.SSID;
                aobj[1] = mSecurityType[j];
                preference.setSummary(String.format(s, aobj));
            }
        }
    }

    public void onClick(View view, HotspotClient hotspotclient)
    {
        if (view.getId() == 0x7f0800ef && hotspotclient != null)
        {
            if (hotspotclient.isBlocked)
            {
                Xlog.d("TetherWifiSettings", "onClick,client is blocked, unblock now");
                mWifiManager.unblockClient(hotspotclient);
            } else
            {
                Xlog.d("TetherWifiSettings", "onClick,client isn't blocked, block now");
                mWifiManager.blockClient(hotspotclient);
            }
            handleWifiApClientsChanged();
        }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        if (mDialog != null)
            mDialog.closeSpinnerDialog();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05003e);
        Activity activity = getActivity();
        mWifiAutoDisable = (ListPreference)findPreference("wifi_auto_disable");
        findPreference("wifi_ap_ssid_and_security");
        mWpsConnect = findPreference("wps_connect");
        mWpsConnect.setEnabled(false);
        mBandwidth = findPreference("bandwidth_usage");
        mBandwidth.setEnabled(false);
        ConnectivityManager _tmp = (ConnectivityManager)getSystemService("connectivity");
        Switch switch1 = new Switch(activity);
        if (activity instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
            if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane())
            {
                switch1.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f0d0002), 0);
                activity.getActionBar().setDisplayOptions(16, 16);
                activity.getActionBar().setCustomView(switch1, new android.app.ActionBar.LayoutParams(-2, -2, 21));
            }
        }
        mWifiApEnabler = new WifiApEnabler(activity, switch1, mWpsConnect, mBandwidth);
        initWifiTethering();
        mIntentFilter = new IntentFilter("android.net.wifi.WIFI_HOTSPOT_CLIENTS_CHANGED");
        mIntentFilter.addAction("android.net.wifi.WIFI_WPS_CHECK_PIN_FAIL");
        mIntentFilter.addAction("android.net.wifi.WIFI_HOTSPOT_OVERLAP");
        mConnectedCategory = (PreferenceCategory)findPreference("connected_category");
        mBlockedCategory = (PreferenceCategory)findPreference("blocked_category");
        mDetailView = getActivity().getLayoutInflater().inflate(0x7f0400a4, null);
    }

    public Dialog onCreateDialog(int i)
    {
        if (i == 2)
        {
            mDialog = new WifiApDialog(getActivity(), this, mWifiConfig);
            mDialog.getWindow().setSoftInputMode(20);
            return mDialog;
        }
        if (i == 1)
        {
            WifiApWpsDialog wifiapwpsdialog = new WifiApWpsDialog(getActivity());
            Xlog.d("mydialog", "onCreateDialog, return dialog");
            return wifiapwpsdialog;
        }
        if (i == 3)
        {
            android.view.ViewParent viewparent = mDetailView.getParent();
            if (viewparent != null && (viewparent instanceof ViewGroup))
                ((ViewGroup)viewparent).removeView(mDetailView);
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0169).setView(mDetailView).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

                final TetherWifiSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = TetherWifiSettings.this;
                super();
            }
            }
).create();
        } else
        {
            return null;
        }
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
        if (mWifiApEnabler != null)
            mWifiApEnabler.pause();
        if (mWifiAutoDisable != null)
            mWifiAutoDisable.setOnPreferenceChangeListener(null);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        Xlog.d("TetherWifiSettings", (new StringBuilder()).append("onPreferenceChange key=").append(s).toString());
        if ("wifi_auto_disable".equals(s))
        {
            android.provider.Settings.System.putInt(getContentResolver(), "wifi_hotspot_auto_disable", Integer.parseInt((String)obj));
            Xlog.d("TetherWifiSettings", (new StringBuilder()).append("onPreferenceChange auto disable value=").append(Integer.parseInt((String)obj)).toString());
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        ConnectivityManager _tmp = (ConnectivityManager)getSystemService("connectivity");
        if (preference == mCreateNetwork)
            showDialog(2);
        else
        if (preference == mWpsConnect)
            showDialog(1);
        if (preference instanceof ButtonPreference)
        {
            removeDialog(3);
            ButtonPreference buttonpreference = (ButtonPreference)preference;
            ((TextView)mDetailView.findViewById(0x7f0801d3)).setText(buttonpreference.getMacAddress());
            if (buttonpreference.isBlocked())
            {
                mDetailView.findViewById(0x7f0801d4).setVisibility(8);
            } else
            {
                mDetailView.findViewById(0x7f0801d4).setVisibility(0);
                String s = mWifiManager.getClientIp(buttonpreference.getMacAddress());
                Xlog.d("TetherWifiSettings", (new StringBuilder()).append("connected client ip address is:").append(s).toString());
                ((TextView)mDetailView.findViewById(0x7f0801d5)).setText(s);
            }
            showDialog(3);
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        if (mWifiApEnabler != null)
            mWifiApEnabler.resume();
        if (mWifiAutoDisable != null)
        {
            mWifiAutoDisable.setOnPreferenceChangeListener(this);
            int i = android.provider.Settings.System.getInt(getContentResolver(), "wifi_hotspot_auto_disable", 1);
            mWifiAutoDisable.setValue(String.valueOf(i));
        }
        getActivity().registerReceiver(mReceiver, mIntentFilter);
        handleWifiApClientsChanged();
    }

}
