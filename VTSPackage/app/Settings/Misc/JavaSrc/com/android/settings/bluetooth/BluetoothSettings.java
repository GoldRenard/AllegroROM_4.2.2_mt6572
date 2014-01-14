// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.WeakHashMap;

// Referenced classes of package com.android.settings.bluetooth:
//            DeviceListPreferenceFragment, LocalBluetoothAdapter, BluetoothDiscoverableEnabler, LocalBluetoothManager, 
//            BluetoothDeviceFilter, BluetoothProgressCategory, BluetoothEnabler, BluetoothDevicePreference, 
//            CachedBluetoothDevice, BluetoothNameDialogFragment, BluetoothVisibilityTimeoutFragment, DeviceProfilesSettings

public final class BluetoothSettings extends DeviceListPreferenceFragment
{

    private static final String BTOPP_ACTION_OPEN_RECEIVED_FILES = "android.btopp.intent.action.OPEN_RECEIVED_FILES";
    private static final int MENU_ID_ADVANCED_SETTING = 5;
    private static final int MENU_ID_RENAME_DEVICE = 2;
    private static final int MENU_ID_SCAN = 1;
    private static final int MENU_ID_SHOW_RECEIVED = 4;
    private static final int MENU_ID_VISIBILITY_TIMEOUT = 3;
    private static final String TAG = "BluetoothSettings";
    private boolean mActivityStarted;
    private PreferenceGroup mAvailableDevicesCategory;
    private boolean mAvailableDevicesCategoryIsPresent;
    private BluetoothEnabler mBluetoothEnabler;
    private final android.view.View.OnClickListener mDeviceProfilesListener = new android.view.View.OnClickListener() {

        final BluetoothSettings this$0;

        public void onClick(View view)
        {
            if (view.getTag() instanceof CachedBluetoothDevice)
            {
                CachedBluetoothDevice cachedbluetoothdevice = (CachedBluetoothDevice)view.getTag();
                Bundle bundle = new Bundle(1);
                bundle.putParcelable("device", cachedbluetoothdevice.getDevice());
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/bluetooth/DeviceProfilesSettings.getName(), bundle, 0x7f0b03fa, null, null, 0);
                return;
            } else
            {
                Log.w("BluetoothSettings", (new StringBuilder()).append("onClick() called for other View: ").append(view).toString());
                return;
            }
        }

            
            {
                this$0 = BluetoothSettings.this;
                super();
            }
    }
;
    private BluetoothDiscoverableEnabler mDiscoverableEnabler;
    private TextView mEmptyView;
    private final IntentFilter mIntentFilter = new IntentFilter("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED");
    Preference mMyDevicePreference;
    private PreferenceGroup mPairedDevicesCategory;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BluetoothSettings this$0;

        private void updateDeviceName()
        {
            if (mLocalAdapter.isEnabled() && mMyDevicePreference != null)
                mMyDevicePreference.setTitle(mLocalAdapter.getName());
        }

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED"))
                updateDeviceName();
        }

            
            {
                this$0 = BluetoothSettings.this;
                super();
            }
    }
;


    private void addDeviceCategory(PreferenceGroup preferencegroup, int i, BluetoothDeviceFilter.Filter filter)
    {
        preferencegroup.setTitle(i);
        getPreferenceScreen().addPreference(preferencegroup);
        setFilter(filter);
        setDeviceListGroup(preferencegroup);
        addCachedDevices();
        preferencegroup.setEnabled(true);
    }

    private boolean doesAdvancedFeatureExist()
    {
        return false;
    }

    private void startScanning()
    {
        if (!mAvailableDevicesCategoryIsPresent)
            getPreferenceScreen().addPreference(mAvailableDevicesCategory);
        super.mLocalAdapter.startScanning(true);
    }

    private void updateContent(int i, boolean flag)
    {
        PreferenceScreen preferencescreen;
label0:
        {
            preferencescreen = getPreferenceScreen();
            int j = 0;
            switch (i)
            {
            default:
                break;

            case 11: // '\013'
                j = 0x7f0b02e9;
                break;

            case 12: // '\f'
                break label0;

            case 10: // '\n'
                j = 0x7f0b03ed;
                break;

            case 13: // '\r'
                j = 0x7f0b02ea;
                break;
            }
            setDeviceListGroup(preferencescreen);
            removeAllDevices();
            mEmptyView.setText(j);
            getActivity().invalidateOptionsMenu();
            return;
        }
        preferencescreen.removeAll();
        preferencescreen.setOrderingAsAdded(true);
        super.mDevicePreferenceMap.clear();
        if (mMyDevicePreference == null)
            mMyDevicePreference = new Preference(getActivity());
        mMyDevicePreference.setTitle(super.mLocalAdapter.getName());
        if (getResources().getBoolean(0x1110030))
            mMyDevicePreference.setIcon(0x7f020052);
        else
            mMyDevicePreference.setIcon(0x7f020058);
        mMyDevicePreference.setPersistent(false);
        mMyDevicePreference.setEnabled(true);
        preferencescreen.addPreference(mMyDevicePreference);
        if (mDiscoverableEnabler == null)
        {
            mDiscoverableEnabler = new BluetoothDiscoverableEnabler(getActivity(), super.mLocalAdapter, mMyDevicePreference);
            mDiscoverableEnabler.resume();
        }
        LocalBluetoothManager.getInstance(getActivity()).setDiscoverableEnabler(mDiscoverableEnabler);
        mDiscoverableEnabler.resetDiscoverableTimeout();
        if (mPairedDevicesCategory == null)
            mPairedDevicesCategory = new PreferenceCategory(getActivity());
        else
            mPairedDevicesCategory.removeAll();
        addDeviceCategory(mPairedDevicesCategory, 0x7f0b03e3, BluetoothDeviceFilter.BONDED_DEVICE_FILTER);
        int k = mPairedDevicesCategory.getPreferenceCount();
        mDiscoverableEnabler.setNumberOfPairedDevices(k);
        if (mAvailableDevicesCategory == null)
            mAvailableDevicesCategory = new BluetoothProgressCategory(getActivity(), null);
        else
            mAvailableDevicesCategory.removeAll();
        addDeviceCategory(mAvailableDevicesCategory, 0x7f0b03e4, BluetoothDeviceFilter.UNBONDED_DEVICE_FILTER);
        int l = mAvailableDevicesCategory.getPreferenceCount();
        mAvailableDevicesCategoryIsPresent = true;
        if (l == 0)
        {
            preferencescreen.removePreference(mAvailableDevicesCategory);
            mAvailableDevicesCategoryIsPresent = false;
        }
        if (k == 0)
        {
            preferencescreen.removePreference(mPairedDevicesCategory);
            if (flag)
            {
                mActivityStarted = false;
                startScanning();
            } else
            if (!mAvailableDevicesCategoryIsPresent)
                getPreferenceScreen().addPreference(mAvailableDevicesCategory);
        }
        getActivity().invalidateOptionsMenu();
    }

    void addPreferencesForActivity()
    {
        addPreferencesFromResource(0x7f05000b);
        Activity activity = getActivity();
        Switch switch1 = new Switch(activity);
        if (activity instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
            if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane())
            {
                switch1.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f0d0002), 0);
                activity.getActionBar().setDisplayOptions(16, 16);
                activity.getActionBar().setCustomView(switch1, new android.app.ActionBar.LayoutParams(-2, -2, 0x800015));
            }
        }
        mBluetoothEnabler = new BluetoothEnabler(activity, switch1);
        setHasOptionsMenu(true);
    }

    void initDevicePreference(BluetoothDevicePreference bluetoothdevicepreference)
    {
        if (bluetoothdevicepreference.getCachedDevice().getBondState() == 12)
            bluetoothdevicepreference.setOnSettingsClickListener(mDeviceProfilesListener);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        boolean flag;
        if (bundle == null)
            flag = true;
        else
            flag = false;
        mActivityStarted = flag;
        mEmptyView = (TextView)getView().findViewById(0x1020004);
        getListView().setEmptyView(mEmptyView);
    }

    public void onBluetoothStateChanged(int i)
    {
        super.onBluetoothStateChanged(i);
        updateContent(i, true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        Log.d("BluetoothSettings", "onCreateOptionsMenu");
        if (super.mLocalAdapter == null)
            return;
        boolean flag;
        if (super.mLocalAdapter.getBluetoothState() == 12)
            flag = true;
        else
            flag = false;
        boolean flag1 = super.mLocalAdapter.isDiscovering();
        Log.d("BluetoothSettings", (new StringBuilder()).append("isDiscovering ").append(flag1).toString());
        int i;
        if (flag1)
            i = 0x7f0b03e1;
        else
            i = 0x7f0b03e0;
        MenuItem menuitem = menu.add(0, 1, 0, i);
        boolean flag2;
        if (flag && !flag1)
            flag2 = true;
        else
            flag2 = false;
        menuitem.setEnabled(flag2).setShowAsAction(1);
        menu.add(0, 2, 0, 0x7f0b02cc).setEnabled(flag).setShowAsAction(0);
        menu.add(0, 3, 0, 0x7f0b02c3).setEnabled(flag).setShowAsAction(0);
        menu.add(0, 4, 0, 0x7f0b02e1).setShowAsAction(0);
        if (doesAdvancedFeatureExist())
            menu.add(0, 5, 0, 0x7f0b0007).setEnabled(flag).setShowAsAction(0);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mPairedDevicesCategory != null)
            mPairedDevicesCategory.removeAll();
        if (mAvailableDevicesCategory != null)
            mAvailableDevicesCategory.removeAll();
    }

    public void onDeviceBondStateChanged(CachedBluetoothDevice cachedbluetoothdevice, int i)
    {
        setDeviceListGroup(getPreferenceScreen());
        removeAllDevices();
        updateContent(super.mLocalAdapter.getBluetoothState(), false);
    }

    void onDevicePreferenceClick(BluetoothDevicePreference bluetoothdevicepreference)
    {
        super.mLocalAdapter.stopScanning();
        super.onDevicePreferenceClick(bluetoothdevicepreference);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        boolean flag = true;
        menuitem.getItemId();
        JVM INSTR tableswitch 1 5: default 44
    //                   1 52
    //                   2 70
    //                   3 89
    //                   4 108
    //                   5 130;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        flag = super.onOptionsItemSelected(menuitem);
_L8:
        return flag;
_L2:
        if (super.mLocalAdapter.getBluetoothState() != 12) goto _L8; else goto _L7
_L7:
        startScanning();
        return flag;
_L3:
        (new BluetoothNameDialogFragment()).show(getFragmentManager(), "rename device");
        return flag;
_L4:
        (new BluetoothVisibilityTimeoutFragment()).show(getFragmentManager(), "visibility timeout");
        return flag;
_L5:
        Intent intent1 = new Intent("android.btopp.intent.action.OPEN_RECEIVED_FILES");
        getActivity().sendBroadcast(intent1);
        return flag;
_L6:
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClassName("com.mediatek.bluetooth", "com.mediatek.bluetooth.settings.BluetoothAdvancedSettingsActivity");
        try
        {
            startActivity(intent);
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("BluetoothSettings", (new StringBuilder()).append("Unable to start activity ").append(intent.toString()).toString());
            return false;
        }
        return flag;
    }

    public void onPause()
    {
        super.onPause();
        if (mBluetoothEnabler != null)
            mBluetoothEnabler.pause();
        getActivity().unregisterReceiver(mReceiver);
        if (mDiscoverableEnabler != null)
            mDiscoverableEnabler.pause();
    }

    public void onResume()
    {
        if (mBluetoothEnabler != null)
            mBluetoothEnabler.resume();
        super.onResume();
        if (mDiscoverableEnabler != null)
            mDiscoverableEnabler.resume();
        getActivity().registerReceiver(mReceiver, mIntentFilter);
        if (super.mLocalAdapter != null)
            updateContent(super.mLocalAdapter.getBluetoothState(), mActivityStarted);
    }

    public void onScanningStateChanged(boolean flag)
    {
        Log.d("BluetoothSettings", (new StringBuilder()).append("started").append(flag).toString());
        super.onScanningStateChanged(flag);
        getActivity().invalidateOptionsMenu();
    }
}
