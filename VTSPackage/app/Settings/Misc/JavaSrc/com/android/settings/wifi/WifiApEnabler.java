// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.app.Activity;
import android.app.Fragment;
import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.preference.Preference;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.android.settings.TetherSettings;
import com.mediatek.custom.CustomProperties;
import com.mediatek.settings.ext.IWifiExt;
import com.mediatek.wifi.hotspot.HotspotSwitchPreference;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.android.settings.wifi:
//            WifiApDialog

public class WifiApEnabler extends Fragment
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final int INVALID = -1;
    private static final int PROVISION_REQUEST = 0;
    static final String TAG = "WifiApEnabler";
    private static final int WIFI_IPV4 = 15;
    private static final int WIFI_IPV6 = 240;
    private static final String WIFI_SWITCH_SETTINGS = "wifi_tether_settings";
    private static final int WIFI_TETHERING;
    private Preference mBandwidthPre;
    ConnectivityManager mCm;
    private final Context mContext;
    IWifiExt mExt;
    private IntentFilter mIntentFilter;
    private CharSequence mOriginalSummary;
    private String mProvisionApp[];
    private final BroadcastReceiver mReceiver;
    private boolean mStateMachineEvent;
    private Switch mSwitch;
    private HotspotSwitchPreference mSwitchPreference;
    private int mTetherChoice;
    private TetherSettings mTetherSettings;
    private WifiManager mWifiManager;
    private String mWifiRegexs[];
    private Preference mWpsConnectPre;

    public WifiApEnabler(Context context, Switch switch1, Preference preference, Preference preference1)
    {
        mTetherChoice = -1;
        mReceiver = new BroadcastReceiver() {

            final WifiApEnabler this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(s))
                    handleWifiApStateChanged(intent.getIntExtra("wifi_state", 14));
                else
                if ("android.net.conn.TETHER_STATE_CHANGED".equals(s))
                {
                    ArrayList arraylist = intent.getStringArrayListExtra("availableArray");
                    ArrayList arraylist1 = intent.getStringArrayListExtra("activeArray");
                    ArrayList arraylist2 = intent.getStringArrayListExtra("erroredArray");
                    if (arraylist != null && arraylist1 != null && arraylist2 != null)
                    {
                        updateTetherStateForIpv6(arraylist.toArray(), arraylist1.toArray(), arraylist2.toArray());
                        return;
                    }
                } else
                if ("android.intent.action.AIRPLANE_MODE".equals(s))
                {
                    enableWifiCheckBox();
                    return;
                }
            }

            
            {
                this$0 = WifiApEnabler.this;
                super();
            }
        }
;
        mContext = context;
        mSwitch = switch1;
        mWpsConnectPre = preference;
        mBandwidthPre = preference1;
        init(context);
    }

    public WifiApEnabler(Context context, HotspotSwitchPreference hotspotswitchpreference)
    {
        mTetherChoice = -1;
        mReceiver = new _cls1();
        mContext = context;
        mSwitchPreference = hotspotswitchpreference;
        mOriginalSummary = mSwitchPreference.getSummary();
        init(context);
    }

    private void enableWifiCheckBox()
    {
        boolean flag;
        if (android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != 0)
            flag = true;
        else
            flag = false;
        if (!flag)
        {
            setSwitchEnabled(true);
            return;
        }
        if (mSwitch == null)
            mSwitchPreference.setSummary(mOriginalSummary);
        setSwitchEnabled(false);
    }

    private void handleWifiApStateChanged(int i)
    {
        switch (i)
        {
        case 11: // '\013'
            setSwitchChecked(false);
            setSwitchEnabled(true);
            setPreferenceState(false);
            if (mSwitch == null)
                mSwitchPreference.setSummary(mOriginalSummary);
            enableWifiCheckBox();
            return;

        case 10: // '\n'
            setSwitchEnabled(false);
            setPreferenceState(false);
            if (mSwitch == null)
            {
                Xlog.d("WifiApEnabler", "wifi_stopping");
                mSwitchPreference.setSummary(0x7f0b04bd);
                return;
            }
            break;

        case 13: // '\r'
            setSwitchChecked(true);
            setSwitchEnabled(true);
            setPreferenceState(true);
            setStartTime(true);
            return;

        case 12: // '\f'
            setSwitchEnabled(false);
            setPreferenceState(false);
            setStartTime(false);
            if (mSwitch == null)
            {
                mSwitchPreference.setSummary(0x7f0b04bc);
                return;
            }
            break;

        default:
            enableWifiCheckBox();
            break;
        }
    }

    private void setPreferenceState(boolean flag)
    {
        if (mSwitch != null)
        {
            mBandwidthPre.setEnabled(flag);
            WifiConfiguration wificonfiguration = mWifiManager.getWifiApConfiguration();
            if (wificonfiguration != null && WifiApDialog.getSecurityTypeIndex(wificonfiguration) == 1)
            {
                Xlog.d("WifiApEnabler", "security is wpa psk, disable wps connect preference");
                flag = false;
            }
            mWpsConnectPre.setEnabled(flag);
        }
    }

    private void setStartTime(boolean flag)
    {
        long l = android.provider.Settings.System.getLong(mContext.getContentResolver(), "wifi_hotspot_start_time", 0L);
        if (flag)
        {
            if (l == 0L)
            {
                android.provider.Settings.System.putLong(mContext.getContentResolver(), "wifi_hotspot_start_time", System.currentTimeMillis());
                Xlog.d("WifiApEnabler", (new StringBuilder()).append("enable value: ").append(System.currentTimeMillis()).toString());
            }
            return;
        } else
        {
            Xlog.d("WifiApEnabler", (new StringBuilder()).append("disable value: ").append(0L).toString());
            android.provider.Settings.System.putLong(mContext.getContentResolver(), "wifi_hotspot_start_time", 0L);
            return;
        }
    }

    private void setSwitchChecked(boolean flag)
    {
        mStateMachineEvent = true;
        if (mSwitch != null)
            mSwitch.setChecked(flag);
        else
            mSwitchPreference.setChecked(flag);
        mStateMachineEvent = false;
    }

    private void setSwitchEnabled(boolean flag)
    {
        if (mSwitch != null)
        {
            mSwitch.setEnabled(flag);
            return;
        } else
        {
            mSwitchPreference.setEnabled(flag);
            return;
        }
    }

    private void startProvisioningIfNecessary(int i)
    {
        mTetherChoice = i;
        if (isProvisioningNeeded())
        {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClassName(mProvisionApp[0], mProvisionApp[1]);
            getActivity().startActivityForResult(intent, 0);
            Xlog.d("WifiApEnabler", "startProvisioningIfNecessary, startActivityForResult");
            return;
        } else
        {
            startTethering();
            return;
        }
    }

    private void startTethering()
    {
        if (mTetherChoice == 0)
        {
            Xlog.d("WifiApEnabler", "startTethering, setSoftapEnabled");
            setSoftapEnabled(true);
        }
    }

    private void updateTetherState(Object aobj[], Object aobj1[], Object aobj2[])
    {
        boolean flag = false;
        boolean flag1 = false;
        int i = aobj1.length;
        for (int j = 0; j < i; j++)
        {
            String s1 = (String)aobj1[j];
            String as1[] = mWifiRegexs;
            int k1 = as1.length;
            for (int l1 = 0; l1 < k1; l1++)
                if (s1.matches(as1[l1]))
                    flag = true;

        }

        int k = aobj2.length;
        for (int l = 0; l < k; l++)
        {
            String s = (String)aobj2[l];
            String as[] = mWifiRegexs;
            int i1 = as.length;
            for (int j1 = 0; j1 < i1; j1++)
                if (s.matches(as[j1]))
                    flag1 = true;

        }

        if (flag)
            updateConfigSummary(mWifiManager.getWifiApConfiguration());
        else
        if (flag1 && mSwitch == null)
        {
            mSwitchPreference.setSummary(0x7f0b0439);
            return;
        }
    }

    private void updateTetherStateForIpv6(Object aobj[], Object aobj1[], Object aobj2[])
    {
        boolean flag = false;
        boolean flag1 = false;
        int i = 0;
        int j = 16;
        int k = aobj.length;
        for (int l = 0; l < k; l++)
        {
            String s5 = (String)aobj[l];
            String as2[] = mWifiRegexs;
            int i3 = as2.length;
            for (int j3 = 0; j3 < i3; j3++)
            {
                if (!s5.matches(as2[j3]))
                    continue;
                if (i == 0)
                    i = 0xf & mCm.getLastTetherError(s5);
                if (j == 16)
                    j = 0xf0 & mCm.getLastTetherError(s5);
            }

        }

        int i1 = aobj1.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            String s4 = (String)aobj1[j1];
            String as1[] = mWifiRegexs;
            int k2 = as1.length;
            for (int l2 = 0; l2 < k2; l2++)
            {
                if (!s4.matches(as1[l2]))
                    continue;
                flag = true;
                if (j == 16)
                    j = 0xf0 & mCm.getLastTetherError(s4);
            }

        }

        int k1 = aobj2.length;
        for (int l1 = 0; l1 < k1; l1++)
        {
            String s3 = (String)aobj2[l1];
            String as[] = mWifiRegexs;
            int i2 = as.length;
            for (int j2 = 0; j2 < i2; j2++)
                if (s3.matches(as[j2]))
                    flag1 = true;

        }

        if (flag)
        {
            WifiConfiguration wificonfiguration = mWifiManager.getWifiApConfiguration();
            updateConfigSummary(wificonfiguration);
            String s = mContext.getString(0x104040c);
            String s1 = mContext.getString(0x7f0b04be);
            Object aobj3[] = new Object[1];
            if (wificonfiguration != null)
                s = wificonfiguration.SSID;
            aobj3[0] = s;
            String s2 = String.format(s1, aobj3);
            if (mTetherSettings != null && mSwitch == null)
                mSwitchPreference.setSummary((new StringBuilder()).append(s2).append(mTetherSettings.getIPV6String(i, j)).toString());
        } else
        if (flag1 && mSwitch == null)
        {
            mSwitchPreference.setSummary(0x7f0b0439);
            return;
        }
    }

    public void init(Context context)
    {
        mWifiManager = (WifiManager)context.getApplicationContext().getSystemService("wifi");
        mCm = (ConnectivityManager)mContext.getSystemService("connectivity");
        mWifiRegexs = mCm.getTetherableWifiRegexs();
        mIntentFilter = new IntentFilter("android.net.wifi.WIFI_AP_STATE_CHANGED");
        mIntentFilter.addAction("android.net.conn.TETHER_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
        mProvisionApp = mContext.getResources().getStringArray(0x107001e);
    }

    boolean isProvisioningNeeded()
    {
        return mProvisionApp.length == 2;
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i == 0 && j == -1)
            startTethering();
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (mStateMachineEvent)
            return;
        Xlog.d("WifiApEnabler", (new StringBuilder()).append("onCheckedChanged, isChecked:").append(flag).toString());
        if (flag)
        {
            startProvisioningIfNecessary(0);
            return;
        } else
        {
            setSoftapEnabled(false);
            return;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference.getKey().equals("wifi_tether_settings"))
        {
            boolean flag = ((Boolean)obj).booleanValue();
            Xlog.d("WifiApEnabler", (new StringBuilder()).append("onPreferenceChange, isChecked:").append(flag).toString());
            if (flag)
                startProvisioningIfNecessary(0);
            else
                setSoftapEnabled(false);
        }
        return true;
    }

    public void pause()
    {
        mContext.unregisterReceiver(mReceiver);
        if (mSwitch != null)
        {
            mSwitch.setOnCheckedChangeListener(null);
            return;
        } else
        {
            mSwitchPreference.setOnPreferenceChangeListener(null);
            return;
        }
    }

    public void resume()
    {
        mContext.registerReceiver(mReceiver, mIntentFilter);
        if (mSwitch != null)
            mSwitch.setOnCheckedChangeListener(this);
        else
            mSwitchPreference.setOnPreferenceChangeListener(this);
        enableWifiCheckBox();
    }

    public void setSoftapEnabled(boolean flag)
    {
        int j;
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i = mWifiManager.getWifiState();
        if (flag && (i == 2 || i == 3))
        {
            mWifiManager.setWifiEnabled(false);
            android.provider.Settings.Global.putInt(contentresolver, "wifi_saved_state", 1);
        }
        int k;
        if (mWifiManager.setWifiApEnabled(null, flag))
            setSwitchEnabled(false);
        else
        if (mSwitch == null)
            mSwitchPreference.setSummary(0x7f0b0439);
        if (flag) goto _L2; else goto _L1
_L1:
        k = android.provider.Settings.Global.getInt(contentresolver, "wifi_saved_state");
        j = k;
_L4:
        if (j == 1)
        {
            mWifiManager.setWifiEnabled(true);
            android.provider.Settings.Global.putInt(contentresolver, "wifi_saved_state", 0);
        }
_L2:
        return;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        Xlog.d("WifiApEnabler", "SettingNotFoundException");
        j = 0;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void setTetherSettings(TetherSettings tethersettings)
    {
        mTetherSettings = tethersettings;
    }

    public void updateConfigSummary(WifiConfiguration wificonfiguration)
    {
        String s = CustomProperties.getString("wlan", "SSID", mContext.getString(0x104040c));
        if (mSwitch == null)
        {
            HotspotSwitchPreference hotspotswitchpreference = mSwitchPreference;
            String s1 = mContext.getString(0x7f0b04be);
            Object aobj[] = new Object[1];
            if (wificonfiguration != null)
                s = wificonfiguration.SSID;
            aobj[0] = s;
            hotspotswitchpreference.setSummary(String.format(s1, aobj));
        }
    }



}
