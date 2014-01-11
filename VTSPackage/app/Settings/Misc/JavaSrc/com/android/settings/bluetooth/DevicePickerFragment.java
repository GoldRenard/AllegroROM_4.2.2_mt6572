// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.Activity;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.Bundle;
import android.util.Log;
import com.android.settings.ProgressCategory;

// Referenced classes of package com.android.settings.bluetooth:
//            DeviceListPreferenceFragment, LocalBluetoothAdapter, CachedBluetoothDevice, LocalBluetoothPreferences, 
//            BluetoothDevicePreference

public final class DevicePickerFragment extends DeviceListPreferenceFragment
{

    private static final String KEY_BT_DEVICE_LIST = "bt_device_list";
    private static final String TAG = "DevicePickerFragment";
    private IntentFilter mIntentFilter;
    private String mLaunchClass;
    private String mLaunchPackage;
    private boolean mNeedAuth;
    private ProgressCategory mProgressCategory;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final DevicePickerFragment this$0;

        public void onReceive(Context context, Intent intent)
        {
            int i = mLocalAdapter.getBluetoothState();
            Log.d("DevicePickerFragment", (new StringBuilder()).append("BluetoothAdapter state changed to").append(i).toString());
            handleStateChanged(i);
        }

            
            {
                this$0 = DevicePickerFragment.this;
                super();
            }
    }
;
    private int mScanType;
    private boolean mStartScanOnResume;


    private void sendDevicePickedIntent(BluetoothDevice bluetoothdevice)
    {
        Intent intent = new Intent("android.bluetooth.devicepicker.action.DEVICE_SELECTED");
        intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        if (mLaunchPackage != null && mLaunchClass != null)
            intent.setClassName(mLaunchPackage, mLaunchClass);
        getActivity().sendBroadcast(intent);
    }

    void addPreferencesForActivity()
    {
        addPreferencesFromResource(0x7f050016);
        Intent intent = getActivity().getIntent();
        mNeedAuth = intent.getBooleanExtra("android.bluetooth.devicepicker.extra.NEED_AUTH", false);
        int i = intent.getIntExtra("android.bluetooth.devicepicker.extra.FILTER_TYPE", 0);
        setFilter(i);
        mLaunchPackage = intent.getStringExtra("android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE");
        mLaunchClass = intent.getStringExtra("android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS");
        mScanType = LocalBluetoothAdapter.getInstance().getScanType(i);
    }

    void handleStateChanged(int i)
    {
        if (i == 13)
        {
            Log.d("DevicePickerFragment", "Turning off Bt");
            getActivity().finish();
        }
    }

    public void onBluetoothStateChanged(int i)
    {
        super.onBluetoothStateChanged(i);
        if (i == 12)
            super.mLocalAdapter.startScanning(false, mScanType);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        getActivity().setTitle(getString(0x7f0b02e2));
        boolean flag;
        if (bundle == null)
            flag = true;
        else
            flag = false;
        mStartScanOnResume = flag;
        mProgressCategory = (ProgressCategory)findPreference("bt_device_list");
        mIntentFilter = new IntentFilter("android.bluetooth.adapter.action.STATE_CHANGED");
        getActivity().registerReceiver(mReceiver, mIntentFilter);
    }

    public void onDestroy()
    {
        super.onDestroy();
        getActivity().unregisterReceiver(mReceiver);
    }

    public void onDeviceBondStateChanged(CachedBluetoothDevice cachedbluetoothdevice, int i)
    {
        if (i == 12)
        {
            BluetoothDevice bluetoothdevice = cachedbluetoothdevice.getDevice();
            if (bluetoothdevice.equals(super.mSelectedDevice))
            {
                sendDevicePickedIntent(bluetoothdevice);
                finish();
            }
        }
    }

    void onDevicePreferenceClick(BluetoothDevicePreference bluetoothdevicepreference)
    {
        super.mLocalAdapter.stopScanning();
        LocalBluetoothPreferences.persistSelectedDeviceInPicker(getActivity(), super.mSelectedDevice.getAddress());
        if (bluetoothdevicepreference.getCachedDevice().getBondState() != 12 && mNeedAuth)
        {
            super.onDevicePreferenceClick(bluetoothdevicepreference);
            return;
        } else
        {
            sendDevicePickedIntent(super.mSelectedDevice);
            finish();
            return;
        }
    }

    public void onResume()
    {
        super.onResume();
        mProgressCategory.setNoDeviceFoundAdded(false);
        removeAllDevices();
        addCachedDevices();
        if (mStartScanOnResume)
        {
            super.mLocalAdapter.startScanning(true, mScanType);
            mStartScanOnResume = false;
        }
    }
}
