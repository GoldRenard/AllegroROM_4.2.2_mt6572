// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.content.*;
import android.util.Log;
import android.widget.*;
import com.android.settings.WirelessSettings;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, BluetoothDiscoverableEnabler, LocalBluetoothAdapter

public final class BluetoothEnabler
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "BluetoothEnabler";
    private final Context mContext;
    private final IntentFilter mIntentFilter = new IntentFilter("android.bluetooth.adapter.action.STATE_CHANGED");
    private final LocalBluetoothAdapter mLocalAdapter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BluetoothEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            int i = mLocalAdapter.getBluetoothState();
            Log.d("BluetoothEnabler", (new StringBuilder()).append("BluetoothAdapter state changed to").append(i).toString());
            handleStateChanged(i);
        }

            
            {
                this$0 = BluetoothEnabler.this;
                super();
            }
    }
;
    private Switch mSwitch;
    private boolean mUpdateStatusOnly;
    private boolean mValidListener;
    private final LocalBluetoothManager manager_temp;

    public BluetoothEnabler(Context context, Switch switch1)
    {
        mUpdateStatusOnly = false;
        mContext = context;
        mSwitch = switch1;
        mValidListener = false;
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(context);
        manager_temp = localbluetoothmanager;
        if (localbluetoothmanager == null)
        {
            mLocalAdapter = null;
            mSwitch.setEnabled(false);
        } else
        {
            mLocalAdapter = localbluetoothmanager.getBluetoothAdapter();
        }
    }

    private void setChecked(boolean flag)
    {
        if (flag != mSwitch.isChecked())
        {
            if (mValidListener)
                mSwitch.setOnCheckedChangeListener(null);
            mSwitch.setChecked(flag);
            if (mValidListener)
                mSwitch.setOnCheckedChangeListener(this);
        }
    }

    void handleStateChanged(int i)
    {
        switch (i)
        {
        case 10: // '\n'
            mUpdateStatusOnly = true;
            Log.d("BluetoothEnabler", "Begin update status: set mUpdateStatusOnly to true");
            setChecked(false);
            mSwitch.setEnabled(true);
            mUpdateStatusOnly = false;
            Log.d("BluetoothEnabler", "End update status: set mUpdateStatusOnly to false");
            return;

        case 13: // '\r'
            mSwitch.setEnabled(false);
            return;

        case 12: // '\f'
            BluetoothDiscoverableEnabler bluetoothdiscoverableenabler = manager_temp.getDiscoverableEnabler();
            if (bluetoothdiscoverableenabler != null)
                bluetoothdiscoverableenabler.setDiscoverableTimeout(bluetoothdiscoverableenabler.getDiscoverableTimeoutIndex());
            mUpdateStatusOnly = true;
            Log.d("BluetoothEnabler", "Begin update status: set mUpdateStatusOnly to true");
            setChecked(true);
            mSwitch.setEnabled(true);
            mUpdateStatusOnly = false;
            Log.d("BluetoothEnabler", "End update status: set mUpdateStatusOnly to false");
            return;

        case 11: // '\013'
            mSwitch.setEnabled(false);
            return;
        }
        setChecked(false);
        mSwitch.setEnabled(true);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Log.d("BluetoothEnabler", "onCheckChanged");
        if (flag && !WirelessSettings.isRadioAllowed(mContext, "bluetooth"))
        {
            Toast.makeText(mContext, 0x7f0b043a, 0).show();
            compoundbutton.setChecked(false);
        }
        Log.d("BluetoothEnabler", (new StringBuilder()).append("mUpdateStatusOnly is").append(mUpdateStatusOnly).toString());
        if (mLocalAdapter != null && !mUpdateStatusOnly)
            mLocalAdapter.setBluetoothEnabled(flag);
        mSwitch.setEnabled(false);
    }

    public void pause()
    {
        if (mLocalAdapter == null)
        {
            return;
        } else
        {
            mContext.unregisterReceiver(mReceiver);
            mSwitch.setOnCheckedChangeListener(null);
            mValidListener = false;
            return;
        }
    }

    public void resume()
    {
        if (mLocalAdapter == null)
        {
            mSwitch.setEnabled(false);
            return;
        } else
        {
            handleStateChanged(mLocalAdapter.getBluetoothState());
            mContext.registerReceiver(mReceiver, mIntentFilter);
            mSwitch.setOnCheckedChangeListener(this);
            mValidListener = true;
            return;
        }
    }

    public void setSwitch(Switch switch1)
    {
        Switch switch3;
        boolean flag3;
label0:
        {
            if (mSwitch == switch1)
                return;
            mSwitch.setOnCheckedChangeListener(null);
            mSwitch = switch1;
            Switch switch2 = mSwitch;
            boolean flag = mValidListener;
            BluetoothEnabler bluetoothenabler = null;
            if (flag)
                bluetoothenabler = this;
            switch2.setOnCheckedChangeListener(bluetoothenabler);
            int i = 10;
            if (mLocalAdapter != null)
                i = mLocalAdapter.getBluetoothState();
            boolean flag1;
            if (i == 12)
                flag1 = true;
            else
                flag1 = false;
            boolean flag2;
            if (i == 10)
                flag2 = true;
            else
                flag2 = false;
            setChecked(flag1);
            switch3 = mSwitch;
            if (!flag1)
            {
                flag3 = false;
                if (!flag2)
                    break label0;
            }
            flag3 = true;
        }
        switch3.setEnabled(flag3);
    }

}
