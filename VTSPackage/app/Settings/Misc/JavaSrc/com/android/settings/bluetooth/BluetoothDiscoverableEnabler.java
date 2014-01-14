// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.content.*;
import android.content.res.Resources;
import android.os.Handler;
import android.os.SystemProperties;
import android.preference.Preference;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothPreferences, LocalBluetoothAdapter, BluetoothDiscoverableTimeoutReceiver

final class BluetoothDiscoverableEnabler
    implements android.preference.Preference.OnPreferenceClickListener
{

    static final int DEFAULT_DISCOVERABLE_TIMEOUT = 120;
    private static final int DISCOVERABLE_TIMEOUT_FIVE_MINUTES = 300;
    static final int DISCOVERABLE_TIMEOUT_NEVER = 0;
    private static final int DISCOVERABLE_TIMEOUT_ONE_HOUR = 3600;
    private static final int DISCOVERABLE_TIMEOUT_TWO_MINUTES = 120;
    private static final String KEY_DISCOVERABLE_TIMEOUT = "bt_discoverable_timeout";
    private static final String SYSTEM_PROPERTY_DISCOVERABLE_TIMEOUT = "debug.bt.discoverable_time";
    private static final String TAG = "BluetoothDiscoverableEnabler";
    private static final String VALUE_DISCOVERABLE_TIMEOUT_FIVE_MINUTES = "fivemin";
    private static final String VALUE_DISCOVERABLE_TIMEOUT_NEVER = "never";
    private static final String VALUE_DISCOVERABLE_TIMEOUT_ONE_HOUR = "onehour";
    private static final String VALUE_DISCOVERABLE_TIMEOUT_TWO_MINUTES = "twomin";
    private final Context mContext;
    private boolean mDiscoverable;
    private final Preference mDiscoveryPreference;
    private final LocalBluetoothAdapter mLocalAdapter;
    private int mNumberOfPairedDevices;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BluetoothDiscoverableEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("android.bluetooth.adapter.action.SCAN_MODE_CHANGED".equals(intent.getAction()))
            {
                int i = intent.getIntExtra("android.bluetooth.adapter.extra.SCAN_MODE", 0x80000000);
                if (i != 0x80000000)
                    handleModeChanged(i);
            }
        }

            
            {
                this$0 = BluetoothDiscoverableEnabler.this;
                super();
            }
    }
;
    private final SharedPreferences mSharedPreferences;
    private int mTimeoutSecs;
    private final Handler mUiHandler = new Handler();
    private final Runnable mUpdateCountdownSummaryRunnable = new Runnable() {

        final BluetoothDiscoverableEnabler this$0;

        public void run()
        {
            updateCountdownSummary();
        }

            
            {
                this$0 = BluetoothDiscoverableEnabler.this;
                super();
            }
    }
;

    BluetoothDiscoverableEnabler(Context context, LocalBluetoothAdapter localbluetoothadapter, Preference preference)
    {
        mTimeoutSecs = -1;
        mContext = context;
        mLocalAdapter = localbluetoothadapter;
        mDiscoveryPreference = preference;
        mSharedPreferences = preference.getSharedPreferences();
        preference.setPersistent(false);
    }

    private static String formatTimeRemaining(int i)
    {
        StringBuilder stringbuilder = new StringBuilder(6);
        int j = i / 60;
        stringbuilder.append(j).append(':');
        int k = i - j * 60;
        if (k < 10)
            stringbuilder.append('0');
        stringbuilder.append(k);
        return stringbuilder.toString();
    }

    private int getDiscoverableTimeout()
    {
        if (mTimeoutSecs != -1)
            return mTimeoutSecs;
        int i = SystemProperties.getInt("debug.bt.discoverable_time", -1);
        if (i < 0)
        {
            String s = mSharedPreferences.getString("bt_discoverable_timeout", mContext.getResources().getString(0x7f0b0002));
            if (s.equals("never"))
                i = 0;
            else
            if (s.equals("onehour"))
                i = 3600;
            else
            if (s.equals("fivemin"))
                i = 300;
            else
                i = 120;
        }
        mTimeoutSecs = i;
        return i;
    }

    private void setEnabled(boolean flag)
    {
        if (flag)
        {
            int i = getDiscoverableTimeout();
            long l = System.currentTimeMillis() + 1000L * (long)i;
            LocalBluetoothPreferences.persistDiscoverableEndTimestamp(mContext, l);
            mLocalAdapter.setScanMode(23, i);
            updateCountdownSummary();
            Log.d("BluetoothDiscoverableEnabler", (new StringBuilder()).append("setEnabled(): enabled = ").append(flag).append("timeout = ").append(i).toString());
            if (i > 0)
                BluetoothDiscoverableTimeoutReceiver.setDiscoverableAlarm(mContext, l);
            else
            if (i == 0)
            {
                BluetoothDiscoverableTimeoutReceiver.cancelDiscoverableAlarm(mContext);
                return;
            }
            return;
        } else
        {
            mLocalAdapter.setScanMode(21);
            BluetoothDiscoverableTimeoutReceiver.cancelDiscoverableAlarm(mContext);
            return;
        }
    }

    private void setSummaryNotDiscoverable()
    {
        if (mNumberOfPairedDevices != 0)
        {
            mDiscoveryPreference.setSummary(0x7f0b02c2);
            return;
        } else
        {
            mDiscoveryPreference.setSummary(0x7f0b02c1);
            return;
        }
    }

    private void updateCountdownSummary()
    {
        if (mLocalAdapter.getScanMode() != 23)
            return;
        long l = System.currentTimeMillis();
        long l1 = LocalBluetoothPreferences.getDiscoverableEndTimestamp(mContext);
        if (l > l1)
        {
            updateTimerDisplay(0);
            return;
        }
        updateTimerDisplay((int)((l1 - l) / 1000L));
        this;
        JVM INSTR monitorenter ;
        mUiHandler.removeCallbacks(mUpdateCountdownSummaryRunnable);
        mUiHandler.postDelayed(mUpdateCountdownSummaryRunnable, 1000L);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void updateTimerDisplay(int i)
    {
        if (getDiscoverableTimeout() == 0)
        {
            mDiscoveryPreference.setSummary(0x7f0b02c0);
            return;
        } else
        {
            String s = formatTimeRemaining(i);
            mDiscoveryPreference.setSummary(mContext.getString(0x7f0b02bf, new Object[] {
                s
            }));
            return;
        }
    }

    int getDiscoverableTimeoutIndex()
    {
        switch (getDiscoverableTimeout())
        {
        case 0: // '\0'
            return 3;

        case 3600: 
            return 2;

        case 300: 
            return 1;
        }
        return 0;
    }

    void handleModeChanged(int i)
    {
        Log.d("BluetoothDiscoverableEnabler", (new StringBuilder()).append("handleModeChanged(): mode = ").append(i).toString());
        if (i == 23)
        {
            mDiscoverable = true;
            updateCountdownSummary();
            return;
        } else
        {
            mDiscoverable = false;
            setSummaryNotDiscoverable();
            return;
        }
    }

    public boolean onPreferenceClick(Preference preference)
    {
        boolean flag;
        if (!mDiscoverable)
            flag = true;
        else
            flag = false;
        mDiscoverable = flag;
        setEnabled(mDiscoverable);
        return true;
    }

    public void pause()
    {
        if (mLocalAdapter == null)
        {
            return;
        } else
        {
            mUiHandler.removeCallbacks(mUpdateCountdownSummaryRunnable);
            mContext.unregisterReceiver(mReceiver);
            mDiscoveryPreference.setOnPreferenceClickListener(null);
            return;
        }
    }

    public void resetDiscoverableTimeout()
    {
        mTimeoutSecs = -1;
    }

    public void resume()
    {
        if (mLocalAdapter == null)
        {
            return;
        } else
        {
            IntentFilter intentfilter = new IntentFilter("android.bluetooth.adapter.action.SCAN_MODE_CHANGED");
            mContext.registerReceiver(mReceiver, intentfilter);
            mDiscoveryPreference.setOnPreferenceClickListener(this);
            handleModeChanged(mLocalAdapter.getScanMode());
            return;
        }
    }

    void setDiscoverableTimeout(int i)
    {
        String s;
        switch (i)
        {
        case 3: // '\003'
            mTimeoutSecs = 0;
            s = "never";
            break;

        case 2: // '\002'
            mTimeoutSecs = 3600;
            s = "onehour";
            break;

        case 1: // '\001'
            mTimeoutSecs = 300;
            s = "fivemin";
            break;

        default:
            mTimeoutSecs = 120;
            s = "twomin";
            break;
        }
        mSharedPreferences.edit().putString("bt_discoverable_timeout", s).apply();
        setEnabled(true);
    }

    void setNumberOfPairedDevices(int i)
    {
        mNumberOfPairedDevices = i;
        handleModeChanged(mLocalAdapter.getScanMode());
    }

}
