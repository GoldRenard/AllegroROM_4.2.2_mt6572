// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.*;
import android.database.ContentObserver;
import android.net.NetworkInfo;
import android.net.wifi.*;
import android.os.Handler;
import android.widget.*;
import com.android.settings.*;
import com.mediatek.settings.ext.IWifiExt;
import com.mediatek.xlog.Xlog;
import java.util.concurrent.atomic.AtomicBoolean;

public class WifiEnabler
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "WifiEnabler";
    private ContentObserver mAirplaneModeObserver;
    private AtomicBoolean mConnected;
    private final Context mContext;
    IWifiExt mExt;
    private final IntentFilter mIntentFilter = new IntentFilter("android.net.wifi.WIFI_STATE_CHANGED");
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
    private Switch mSwitch;
    private final WifiManager mWifiManager;

    public WifiEnabler(Context context, Switch switch1)
    {
        mConnected = new AtomicBoolean(false);
        mAirplaneModeObserver = new ContentObserver(new Handler()) {

            final WifiEnabler this$0;

            public void onChange(boolean flag)
            {
                onAirplaneModeChanged();
            }

            
            {
                this$0 = WifiEnabler.this;
                super(handler);
            }
        }
;
        mContext = context;
        mSwitch = switch1;
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
            mSwitch.setEnabled(mExt.getSwitchState());
            long l1 = System.currentTimeMillis();
            Xlog.i("WifiEnabler", (new StringBuilder()).append("[Performance test][Settings][wifi] wifi disable end [").append(l1).append("]").toString());
            return;

        case 0: // '\0'
            mSwitch.setEnabled(false);
            return;

        case 3: // '\003'
            setSwitchChecked(true);
            mSwitch.setEnabled(mExt.getSwitchState());
            long l = System.currentTimeMillis();
            Xlog.i("WifiEnabler", (new StringBuilder()).append("[Performance test][Settings][wifi] wifi enable end [").append(l).append("]").toString());
            return;

        case 2: // '\002'
            mSwitch.setEnabled(false);
            return;
        }
        setSwitchChecked(false);
        mSwitch.setEnabled(mExt.getSwitchState());
    }

    private void onAirplaneModeChanged()
    {
        Switch switch1 = mSwitch;
        boolean flag;
        if (!AirplaneModeEnabler.isAirplaneModeOn(mContext))
            flag = true;
        else
            flag = false;
        switch1.setEnabled(flag);
    }

    private void setSwitchChecked(boolean flag)
    {
        if (flag != mSwitch.isChecked())
        {
            mStateMachineEvent = true;
            mSwitch.setChecked(flag);
            mStateMachineEvent = false;
        }
    }

    private boolean shouldDisableWIFI()
    {
        String s = android.provider.Settings.System.getString(mContext.getContentResolver(), "airplane_mode_toggleable_radios");
        if (s != null && s.contains("wifi"))
            return false;
        else
            return AirplaneModeEnabler.isAirplaneModeOn(mContext);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (mStateMachineEvent)
            return;
        if (flag && !WirelessSettings.isRadioAllowed(mContext, "wifi"))
        {
            Toast.makeText(mContext, 0x7f0b043a, 0).show();
            compoundbutton.setChecked(false);
        }
        int i = mWifiManager.getWifiApState();
        if (flag && (i == 12 || i == 13))
            mWifiManager.setWifiApEnabled(null, false);
        if (mWifiManager.setWifiEnabled(flag))
        {
            mSwitch.setEnabled(false);
            return;
        } else
        {
            Toast.makeText(mContext, 0x7f0b0439, 0).show();
            return;
        }
    }

    public void pause()
    {
        mContext.unregisterReceiver(mReceiver);
        mSwitch.setOnCheckedChangeListener(null);
        mExt.unRegisterAirplaneObserver();
    }

    public void resume()
    {
        mContext.registerReceiver(mReceiver, mIntentFilter);
        mSwitch.setOnCheckedChangeListener(this);
        mExt.registerAirplaneModeObserver(mSwitch);
        mExt.initSwitchState(mSwitch);
    }

    public void setSwitch(Switch switch1)
    {
        Switch switch2;
        boolean flag2;
label0:
        {
            if (mSwitch == switch1)
                return;
            mSwitch.setOnCheckedChangeListener(null);
            mSwitch = switch1;
            mSwitch.setOnCheckedChangeListener(this);
            int i = mWifiManager.getWifiState();
            boolean flag;
            if (i == 3)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (i == 1)
                flag1 = true;
            else
                flag1 = false;
            mSwitch.setChecked(flag);
            switch2 = mSwitch;
            if (!flag)
            {
                flag2 = false;
                if (!flag1)
                    break label0;
            }
            flag2 = true;
        }
        switch2.setEnabled(flag2);
        mExt.initSwitchState(mSwitch);
    }




}
