// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.content.*;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.widget.Toast;
import com.mediatek.oobe.ext.IWifiExt;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.xlog.Xlog;
import java.util.concurrent.atomic.AtomicBoolean;

public class WifiEnabler
{

    private static final String TAG = "OOBE";
    private static final String WIFI_SWITCH_ENABLER = "wifi_switch";
    private AtomicBoolean mConnected;
    private final Context mContext;
    IWifiExt mExt;
    private final IntentFilter mIntentFilter = new IntentFilter("android.net.wifi.WIFI_STATE_CHANGED");
    android.preference.Preference.OnPreferenceChangeListener mPreferenceChangeListener;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final WifiEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if ("android.net.wifi.WIFI_STATE_CHANGED".equals(s))
                handleWifiStateChanged(intent.getIntExtra("wifi_state", 4));
            else
            if ("android.net.wifi.supplicant.STATE_CHANGE".equals(s))
            {
                if (!mConnected.get())
                {
                    handleStateChanged(WifiInfo.getDetailedStateOf((SupplicantState)intent.getParcelableExtra("newState")));
                    return;
                }
            } else
            if ("android.net.wifi.STATE_CHANGE".equals(s))
            {
                NetworkInfo networkinfo = (NetworkInfo)intent.getParcelableExtra("networkInfo");
                mConnected.set(networkinfo.isConnected());
                handleStateChanged(networkinfo.getDetailedState());
                return;
            }
        }

            
            {
                this$0 = WifiEnabler.this;
                super();
            }
    }
;
    private boolean mStateMachineEvent;
    private SwitchPreference mSwitchPre;
    private final WifiManager mWifiManager;

    public WifiEnabler(Context context, Preference preference)
    {
        mConnected = new AtomicBoolean(false);
        mPreferenceChangeListener = new android.preference.Preference.OnPreferenceChangeListener() {

            final WifiEnabler this$0;

            public boolean onPreferenceChange(Preference preference1, Object obj)
            {
                if (preference1.getKey().equals("wifi_switch"))
                {
                    Xlog.d("OOBE", (new StringBuilder()).append("wifi enabler switch change:").append(obj.toString()).toString());
                    boolean flag = ((Boolean)obj).booleanValue();
                    if (mStateMachineEvent)
                    {
                        Xlog.d("OOBE", "OOBE wifi mStateMachineEvent: is true ,return");
                        mStateMachineEvent = false;
                        return true;
                    }
                    if (flag && !WifiEnabler.isRadioAllowed(mContext, "wifi"))
                    {
                        Toast.makeText(mContext, 0x7f0900a5, 0).show();
                        Xlog.d("OOBE", "OOBE wifi isRadioAllowed:");
                        return true;
                    }
                    int i = mWifiManager.getWifiApState();
                    if (flag && (i == 12 || i == 13))
                    {
                        Xlog.d("OOBE", "OOBE wifi getWifiApState:");
                        mWifiManager.setWifiApEnabled(null, false);
                    }
                    if (mWifiManager.setWifiEnabled(flag))
                    {
                        Xlog.d("OOBE", (new StringBuilder()).append("OOBE wifi setWifiEnabled:").append(flag).toString());
                        mSwitchPre.setEnabled(false);
                        return true;
                    } else
                    {
                        Toast.makeText(mContext, 0x7f0900a2, 0).show();
                        return true;
                    }
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = WifiEnabler.this;
                super();
            }
        }
;
        mContext = context;
        mSwitchPre = (SwitchPreference)preference;
        mWifiManager = (WifiManager)context.getApplicationContext().getSystemService("wifi");
        mIntentFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        mIntentFilter.addAction("android.net.wifi.STATE_CHANGE");
        mExt = Utils.getWifiPlugin(mContext);
    }

    private void handleStateChanged(android.net.NetworkInfo.DetailedState detailedstate)
    {
    }

    private void handleWifiStateChanged(int i)
    {
        switch (i)
        {
        case 1: // '\001'
            setSwitchChecked(false);
            mSwitchPre.setEnabled(mExt.getSwitchState());
            return;

        case 0: // '\0'
            mSwitchPre.setEnabled(false);
            return;

        case 3: // '\003'
            setSwitchChecked(true);
            mSwitchPre.setEnabled(mExt.getSwitchState());
            return;

        case 2: // '\002'
            mSwitchPre.setEnabled(false);
            return;
        }
        setSwitchChecked(false);
        mSwitchPre.setEnabled(mExt.getSwitchState());
    }

    public static boolean isAirplaneModeOn(Context context)
    {
        int i = android.provider.Settings.System.getInt(context.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    public static boolean isRadioAllowed(Context context, String s)
    {
        if (isAirplaneModeOn(context))
        {
            String s1 = android.provider.Settings.System.getString(context.getContentResolver(), "airplane_mode_toggleable_radios");
            if (s1 == null || !s1.contains(s))
                return false;
        }
        return true;
    }

    private void setSwitchChecked(boolean flag)
    {
        if (flag != mSwitchPre.isChecked())
        {
            mStateMachineEvent = true;
            mSwitchPre.setChecked(flag);
        }
    }

    public void pause()
    {
        mContext.unregisterReceiver(mReceiver);
        mSwitchPre.setOnPreferenceChangeListener(null);
        mExt.unRegisterAirplaneObserver();
    }

    public void resume()
    {
        int i = mWifiManager.getWifiState();
        if (i == 3)
            mSwitchPre.setChecked(true);
        else
        if (i == 1)
            mSwitchPre.setChecked(false);
        mContext.registerReceiver(mReceiver, mIntentFilter);
        mSwitchPre.setOnPreferenceChangeListener(mPreferenceChangeListener);
        mExt.registerAirplaneModeObserver(mSwitchPre);
        mExt.initSwitchState(mSwitchPre);
    }






/*
    static boolean access$302(WifiEnabler wifienabler, boolean flag)
    {
        wifienabler.mStateMachineEvent = flag;
        return flag;
    }

*/



}
