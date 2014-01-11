// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import com.android.settings.SettingsPreferenceFragment;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            BluetoothCallback, BluetoothDeviceFilter, BluetoothProgressCategory, LocalBluetoothManager, 
//            CachedBluetoothDeviceManager, CachedBluetoothDevice, BluetoothDevicePreference, LocalBluetoothAdapter, 
//            BluetoothEventManager

public abstract class DeviceListPreferenceFragment extends SettingsPreferenceFragment
    implements BluetoothCallback
{

    private static final String KEY_BT_DEVICE_LIST = "bt_device_list";
    private static final String KEY_BT_SCAN = "bt_scan";
    private static final String PERFORMANCE_TAG = "BtPerformanceTest";
    private static final String TAG = "DeviceListPreferenceFragment";
    private PreferenceGroup mDeviceListGroup;
    final WeakHashMap mDevicePreferenceMap = new WeakHashMap();
    private BluetoothDeviceFilter.Filter mFilter;
    LocalBluetoothAdapter mLocalAdapter;
    LocalBluetoothManager mLocalManager;
    BluetoothDevice mSelectedDevice;

    DeviceListPreferenceFragment()
    {
        mFilter = BluetoothDeviceFilter.ALL_FILTER;
    }

    private void updateProgressUi(boolean flag)
    {
        Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("updateProgressUi ").append(flag).toString());
        if (mDeviceListGroup instanceof BluetoothProgressCategory)
        {
            ((BluetoothProgressCategory)mDeviceListGroup).setProgress(flag);
            Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("setProgress ").append(flag).toString());
        }
    }

    void addCachedDevices()
    {
        for (Iterator iterator = mLocalManager.getCachedDeviceManager().getCachedDevicesCopy().iterator(); iterator.hasNext(); onDeviceAdded((CachedBluetoothDevice)iterator.next()));
    }

    abstract void addPreferencesForActivity();

    void createDevicePreference(CachedBluetoothDevice cachedbluetoothdevice)
    {
        BluetoothDevicePreference bluetoothdevicepreference = new BluetoothDevicePreference(getActivity(), cachedbluetoothdevice);
        initDevicePreference(bluetoothdevicepreference);
        mDeviceListGroup.addPreference(bluetoothdevicepreference);
        mDevicePreferenceMap.put(cachedbluetoothdevice, bluetoothdevicepreference);
    }

    void initDevicePreference(BluetoothDevicePreference bluetoothdevicepreference)
    {
    }

    public void onBluetoothStateChanged(int i)
    {
        if (i == 13)
        {
            Log.d("DeviceListPreferenceFragment", "Turn off bt");
            updateProgressUi(false);
        } else
        {
            if (i == 10)
            {
                long l1 = System.currentTimeMillis();
                Log.d("BtPerformanceTest", (new StringBuilder()).append("[Performance test][Settings][Bt] Bluetooth disable end [").append(l1).append("]").toString());
                return;
            }
            if (i == 12)
            {
                long l = System.currentTimeMillis();
                Log.d("BtPerformanceTest", (new StringBuilder()).append("[Performance test][Settings][Bt] Bluetooth enable end [").append(l).append("]").toString());
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mLocalManager = LocalBluetoothManager.getInstance(getActivity());
        if (mLocalManager == null)
        {
            Log.e("DeviceListPreferenceFragment", "Bluetooth is not supported on this device");
            return;
        } else
        {
            mLocalAdapter = mLocalManager.getBluetoothAdapter();
            addPreferencesForActivity();
            mDeviceListGroup = (PreferenceCategory)findPreference("bt_device_list");
            return;
        }
    }

    public void onDeviceAdded(CachedBluetoothDevice cachedbluetoothdevice)
    {
        Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("onDeviceAdded, Device name is ").append(cachedbluetoothdevice.getName()).toString());
        if (mDevicePreferenceMap.get(cachedbluetoothdevice) != null)
            Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("Device name ").append(cachedbluetoothdevice.getName()).append("already have preference").toString());
        else
        if (mLocalAdapter.getBluetoothState() == 12 && mFilter.matches(cachedbluetoothdevice.getDevice()))
        {
            Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("Device name ").append(cachedbluetoothdevice.getName()).append("create new preference").toString());
            createDevicePreference(cachedbluetoothdevice);
            return;
        }
    }

    public void onDeviceDeleted(CachedBluetoothDevice cachedbluetoothdevice)
    {
        BluetoothDevicePreference bluetoothdevicepreference = (BluetoothDevicePreference)mDevicePreferenceMap.remove(cachedbluetoothdevice);
        if (bluetoothdevicepreference != null)
            mDeviceListGroup.removePreference(bluetoothdevicepreference);
    }

    void onDevicePreferenceClick(BluetoothDevicePreference bluetoothdevicepreference)
    {
        bluetoothdevicepreference.onClicked();
    }

    public void onPause()
    {
        super.onPause();
        if (mLocalManager == null)
        {
            return;
        } else
        {
            mLocalAdapter.stopScanning();
            mLocalManager.setForegroundActivity(null);
            mLocalManager.getEventManager().unregisterCallback(this);
            return;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if ("bt_scan".equals(preference.getKey()))
        {
            int i = mLocalAdapter.getScanType(mFilter);
            mLocalAdapter.startScanning(true, i);
            return true;
        }
        if (preference instanceof BluetoothDevicePreference)
        {
            BluetoothDevicePreference bluetoothdevicepreference = (BluetoothDevicePreference)preference;
            mSelectedDevice = bluetoothdevicepreference.getCachedDevice().getDevice();
            onDevicePreferenceClick(bluetoothdevicepreference);
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        super.onResume();
        if (mLocalManager == null)
        {
            return;
        } else
        {
            mLocalManager.setForegroundActivity(this);
            mLocalManager.getEventManager().registerCallback(this);
            updateProgressUi(mLocalAdapter.isDiscovering());
            return;
        }
    }

    public void onScanningStateChanged(boolean flag)
    {
        Log.d("DeviceListPreferenceFragment", (new StringBuilder()).append("onScanningStateChanged ").append(flag).toString());
        updateProgressUi(flag);
    }

    void removeAllDevices()
    {
        mDevicePreferenceMap.clear();
        mDeviceListGroup.removeAll();
    }

    void setDeviceListGroup(PreferenceGroup preferencegroup)
    {
        mDeviceListGroup = preferencegroup;
    }

    final void setFilter(int i)
    {
        mFilter = BluetoothDeviceFilter.getFilter(i);
    }

    final void setFilter(BluetoothDeviceFilter.Filter filter)
    {
        mFilter = filter;
    }
}
