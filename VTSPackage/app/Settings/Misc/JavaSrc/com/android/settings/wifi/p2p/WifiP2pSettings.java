// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi.p2p;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.net.NetworkInfo;
import android.net.wifi.WpsInfo;
import android.net.wifi.p2p.*;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.text.InputFilter;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.EditText;
import android.widget.Toast;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.wifi.Utf8ByteLengthFilter;
import java.util.Collection;
import java.util.Iterator;

// Referenced classes of package com.android.settings.wifi.p2p:
//            WifiP2pPeer, WifiP2pPersistentGroup

public class WifiP2pSettings extends SettingsPreferenceFragment
    implements android.net.wifi.p2p.WifiP2pManager.PeerListListener, android.net.wifi.p2p.WifiP2pManager.PersistentGroupInfoListener, android.net.wifi.p2p.WifiP2pManager.GroupInfoListener
{

    private static final boolean DBG = true;
    private static final int DEVICE_NAME_MAX_LENGTH_BYTES = 32;
    private static final int DIALOG_CANCEL_CONNECT = 2;
    private static final int DIALOG_DELETE_GROUP = 4;
    private static final int DIALOG_DISCONNECT = 1;
    private static final int DIALOG_RENAME = 3;
    private static final int MENU_ID_RENAME = 2;
    private static final int MENU_ID_SEARCH = 1;
    private static final String SAVE_DEVICE_NAME = "DEV_NAME";
    private static final String SAVE_DIALOG_PEER = "PEER_STATE";
    private static final String TAG = "WifiP2pSettings";
    private android.content.DialogInterface.OnClickListener mCancelConnectListener;
    private android.net.wifi.p2p.WifiP2pManager.Channel mChannel;
    private int mConnectedDevices;
    private WifiP2pGroup mConnectedGroup;
    private android.content.DialogInterface.OnClickListener mDeleteGroupListener;
    private EditText mDeviceNameText;
    private android.content.DialogInterface.OnClickListener mDisconnectListener;
    private final IntentFilter mIntentFilter = new IntentFilter();
    private WifiP2pDeviceList mPeers;
    private PreferenceGroup mPeersGroup;
    private PreferenceGroup mPersistentGroup;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final WifiP2pSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            boolean flag = true;
            String s = intent.getAction();
            Log.d("WifiP2pSettings", (new StringBuilder()).append("receive action: ").append(s).toString());
            if ("android.net.wifi.p2p.STATE_CHANGED".equals(s))
            {
                WifiP2pSettings wifip2psettings = WifiP2pSettings.this;
                if (intent.getIntExtra("wifi_p2p_state", flag) != 2)
                    flag = false;
                wifip2psettings.mWifiP2pEnabled = flag;
                handleP2pStateChanged();
            } else
            if ("android.net.wifi.p2p.PEERS_CHANGED".equals(s))
            {
                if (mWifiP2pManager != null)
                {
                    mWifiP2pManager.requestPeers(mChannel, WifiP2pSettings.this);
                    return;
                }
            } else
            if ("android.net.wifi.p2p.CONNECTION_STATE_CHANGE".equals(s))
            {
                if (mWifiP2pManager != null)
                {
                    NetworkInfo networkinfo = (NetworkInfo)intent.getParcelableExtra("networkInfo");
                    if (mWifiP2pManager != null)
                        mWifiP2pManager.requestGroupInfo(mChannel, WifiP2pSettings.this);
                    if (networkinfo.isConnected())
                    {
                        Log.d("WifiP2pSettings", "Connected");
                        return;
                    } else
                    {
                        startSearch();
                        return;
                    }
                }
            } else
            {
                if ("android.net.wifi.p2p.THIS_DEVICE_CHANGED".equals(s))
                {
                    mThisDevice = (WifiP2pDevice)intent.getParcelableExtra("wifiP2pDevice");
                    Log.d("WifiP2pSettings", (new StringBuilder()).append("Update device info: ").append(mThisDevice).toString());
                    updateDevicePref();
                    return;
                }
                if ("android.net.wifi.p2p.DISCOVERY_STATE_CHANGE".equals(s))
                {
                    int i = intent.getIntExtra("discoveryState", flag);
                    Log.d("WifiP2pSettings", (new StringBuilder()).append("Discovery state changed: ").append(i).toString());
                    if (i == 2)
                    {
                        updateSearchMenu(flag);
                        return;
                    } else
                    {
                        updateSearchMenu(false);
                        return;
                    }
                }
                if ("android.net.wifi.p2p.PERSISTENT_GROUPS_CHANGED".equals(s) && mWifiP2pManager != null)
                {
                    mWifiP2pManager.requestPersistentGroupInfo(mChannel, WifiP2pSettings.this);
                    return;
                }
            }
        }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
    }
;
    private android.content.DialogInterface.OnClickListener mRenameListener;
    private String mSavedDeviceName;
    private WifiP2pPersistentGroup mSelectedGroup;
    private WifiP2pPeer mSelectedWifiPeer;
    private WifiP2pDevice mThisDevice;
    private Preference mThisDevicePref;
    private boolean mWifiP2pEnabled;
    private WifiP2pManager mWifiP2pManager;
    private boolean mWifiP2pSearching;

    public WifiP2pSettings()
    {
        mPeers = new WifiP2pDeviceList();
    }

    private void handleP2pStateChanged()
    {
        updateSearchMenu(false);
        if (mWifiP2pEnabled)
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            preferencescreen.removeAll();
            preferencescreen.setOrderingAsAdded(true);
            preferencescreen.addPreference(mThisDevicePref);
            mPeersGroup.setEnabled(true);
            preferencescreen.addPreference(mPeersGroup);
            mPersistentGroup.setEnabled(true);
            preferencescreen.addPreference(mPersistentGroup);
            mWifiP2pManager.requestPeers(mChannel, this);
        }
    }

    private void startSearch()
    {
        if (mWifiP2pManager != null && !mWifiP2pSearching)
            mWifiP2pManager.discoverPeers(mChannel, new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                final WifiP2pSettings this$0;

                public void onFailure(int i)
                {
                    Log.d("WifiP2pSettings", (new StringBuilder()).append(" discover fail ").append(i).toString());
                }

                public void onSuccess()
                {
                }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
            }
);
    }

    private void updateDevicePref()
    {
        if (mThisDevice != null)
        {
            if (TextUtils.isEmpty(mThisDevice.deviceName))
                mThisDevicePref.setTitle(mThisDevice.deviceAddress);
            else
                mThisDevicePref.setTitle(mThisDevice.deviceName);
            mThisDevicePref.setPersistent(false);
            mThisDevicePref.setEnabled(true);
            mThisDevicePref.setSelectable(false);
        }
    }

    private void updateSearchMenu(boolean flag)
    {
        mWifiP2pSearching = flag;
        Activity activity = getActivity();
        if (activity != null)
            activity.invalidateOptionsMenu();
    }

    public void onActivityCreated(Bundle bundle)
    {
        addPreferencesFromResource(0x7f05004e);
        mIntentFilter.addAction("android.net.wifi.p2p.STATE_CHANGED");
        mIntentFilter.addAction("android.net.wifi.p2p.PEERS_CHANGED");
        mIntentFilter.addAction("android.net.wifi.p2p.CONNECTION_STATE_CHANGE");
        mIntentFilter.addAction("android.net.wifi.p2p.THIS_DEVICE_CHANGED");
        mIntentFilter.addAction("android.net.wifi.p2p.DISCOVERY_STATE_CHANGE");
        mIntentFilter.addAction("android.net.wifi.p2p.PERSISTENT_GROUPS_CHANGED");
        Activity activity = getActivity();
        mWifiP2pManager = (WifiP2pManager)getSystemService("wifip2p");
        if (mWifiP2pManager != null)
        {
            mChannel = mWifiP2pManager.initialize(activity, getActivity().getMainLooper(), null);
            if (mChannel == null)
            {
                Log.e("WifiP2pSettings", "Failed to set up connection with wifi p2p service");
                mWifiP2pManager = null;
            }
        } else
        {
            Log.e("WifiP2pSettings", "mWifiP2pManager is null !");
        }
        if (bundle != null && bundle.containsKey("PEER_STATE"))
        {
            WifiP2pDevice wifip2pdevice = (WifiP2pDevice)bundle.getParcelable("PEER_STATE");
            mSelectedWifiPeer = new WifiP2pPeer(getActivity(), wifip2pdevice);
        }
        if (bundle != null && bundle.containsKey("DEV_NAME"))
            mSavedDeviceName = bundle.getString("DEV_NAME");
        mRenameListener = new android.content.DialogInterface.OnClickListener() {

            final WifiP2pSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1 && mWifiP2pManager != null)
                    mWifiP2pManager.setDeviceName(mChannel, mDeviceNameText.getText().toString(), new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                        final _cls2 this$1;

                        public void onFailure(int i)
                        {
                            Toast.makeText(getActivity(), 0x7f0b04b4, 1).show();
                        }

                        public void onSuccess()
                        {
                            Log.d("WifiP2pSettings", " device rename success");
                        }

            
            {
                this$1 = _cls2.this;
                super();
            }
                    }
);
            }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
        }
;
        mDisconnectListener = new android.content.DialogInterface.OnClickListener() {

            final WifiP2pSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1 && mWifiP2pManager != null)
                    mWifiP2pManager.removeGroup(mChannel, new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                        final _cls3 this$1;

                        public void onFailure(int i)
                        {
                            Log.d("WifiP2pSettings", (new StringBuilder()).append(" remove group fail ").append(i).toString());
                        }

                        public void onSuccess()
                        {
                            Log.d("WifiP2pSettings", " remove group success");
                        }

            
            {
                this$1 = _cls3.this;
                super();
            }
                    }
);
            }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
        }
;
        mCancelConnectListener = new android.content.DialogInterface.OnClickListener() {

            final WifiP2pSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1 && mWifiP2pManager != null)
                    mWifiP2pManager.cancelConnect(mChannel, new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                        final _cls4 this$1;

                        public void onFailure(int i)
                        {
                            Log.d("WifiP2pSettings", (new StringBuilder()).append(" cancel connect fail ").append(i).toString());
                        }

                        public void onSuccess()
                        {
                            Log.d("WifiP2pSettings", " cancel connect success");
                        }

            
            {
                this$1 = _cls4.this;
                super();
            }
                    }
);
            }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
        }
;
        mDeleteGroupListener = new android.content.DialogInterface.OnClickListener() {

            final WifiP2pSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (i == -1 && mWifiP2pManager != null)
                    mWifiP2pManager.deletePersistentGroup(mChannel, mSelectedGroup.getNetworkId(), new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                        final _cls5 this$1;

                        public void onFailure(int i)
                        {
                            Log.d("WifiP2pSettings", (new StringBuilder()).append(" delete group fail ").append(i).toString());
                        }

                        public void onSuccess()
                        {
                            Log.d("WifiP2pSettings", " delete group success");
                        }

            
            {
                this$1 = _cls5.this;
                super();
            }
                    }
);
            }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
        }
;
        setHasOptionsMenu(true);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.removeAll();
        preferencescreen.setOrderingAsAdded(true);
        mThisDevicePref = new Preference(getActivity());
        preferencescreen.addPreference(mThisDevicePref);
        mPeersGroup = new PreferenceCategory(getActivity());
        mPeersGroup.setTitle(0x7f0b04b1);
        mPersistentGroup = new PreferenceCategory(getActivity());
        mPersistentGroup.setTitle(0x7f0b04b2);
        super.onActivityCreated(bundle);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog alertdialog;
        if (i == 1)
        {
            String s1;
            if (TextUtils.isEmpty(mSelectedWifiPeer.device.deviceName))
                s1 = mSelectedWifiPeer.device.deviceAddress;
            else
                s1 = mSelectedWifiPeer.device.deviceName;
            String s2;
            if (mConnectedDevices > 1)
            {
                Activity activity = getActivity();
                Object aobj[] = new Object[2];
                aobj[0] = s1;
                aobj[1] = Integer.valueOf(-1 + mConnectedDevices);
                s2 = activity.getString(0x7f0b04b7, aobj);
            } else
            {
                s2 = getActivity().getString(0x7f0b04b6, new Object[] {
                    s1
                });
            }
            alertdialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b04b5).setMessage(s2).setPositiveButton(getActivity().getString(0x7f0b066b), mDisconnectListener).setNegativeButton(getActivity().getString(0x7f0b066c), null).create();
        } else
        {
            if (i == 2)
            {
                String s;
                if (TextUtils.isEmpty(mSelectedWifiPeer.device.deviceName))
                    s = mSelectedWifiPeer.device.deviceAddress;
                else
                    s = mSelectedWifiPeer.device.deviceName;
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b04b8).setMessage(getActivity().getString(0x7f0b04b9, new Object[] {
                    s
                })).setPositiveButton(getActivity().getString(0x7f0b066b), mCancelConnectListener).setNegativeButton(getActivity().getString(0x7f0b066c), null).create();
            }
            if (i == 3)
            {
                mDeviceNameText = new EditText(getActivity());
                EditText edittext = mDeviceNameText;
                InputFilter ainputfilter[] = new InputFilter[1];
                ainputfilter[0] = new Utf8ByteLengthFilter(32);
                edittext.setFilters(ainputfilter);
                if (mSavedDeviceName != null)
                {
                    mDeviceNameText.setText(mSavedDeviceName);
                    mDeviceNameText.setSelection(mSavedDeviceName.length());
                } else
                if (mThisDevice != null && !TextUtils.isEmpty(mThisDevice.deviceName))
                {
                    mDeviceNameText.setText(mThisDevice.deviceName);
                    mDeviceNameText.setSelection(0, mThisDevice.deviceName.length());
                }
                mSavedDeviceName = null;
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b04b0).setView(mDeviceNameText).setPositiveButton(getActivity().getString(0x7f0b066b), mRenameListener).setNegativeButton(getActivity().getString(0x7f0b066c), null).create();
            }
            alertdialog = null;
            if (i == 4)
                return (new android.app.AlertDialog.Builder(getActivity())).setMessage(getActivity().getString(0x7f0b04ba)).setPositiveButton(getActivity().getString(0x7f0b066b), mDeleteGroupListener).setNegativeButton(getActivity().getString(0x7f0b066c), null).create();
        }
        return alertdialog;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        int i;
        if (mWifiP2pSearching)
            i = 0x7f0b04af;
        else
            i = 0x7f0b04ae;
        menu.add(0, 1, 0, i).setEnabled(mWifiP2pEnabled).setShowAsAction(1);
        menu.add(0, 2, 0, 0x7f0b04b0).setEnabled(mWifiP2pEnabled).setShowAsAction(1);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public void onGroupInfoAvailable(WifiP2pGroup wifip2pgroup)
    {
        Log.d("WifiP2pSettings", (new StringBuilder()).append(" group ").append(wifip2pgroup).toString());
        mConnectedGroup = wifip2pgroup;
        updateDevicePref();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2: // '\002'
            showDialog(3);
            return true;

        case 1: // '\001'
            startSearch();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        Log.d("WifiP2pSettings", "onPause");
        super.onPause();
        mWifiP2pManager.stopPeerDiscovery(mChannel, null);
        getActivity().unregisterReceiver(mReceiver);
    }

    public void onPeersAvailable(WifiP2pDeviceList wifip2pdevicelist)
    {
        mPeersGroup.removeAll();
        mPeers = wifip2pdevicelist;
        mConnectedDevices = 0;
        Iterator iterator = wifip2pdevicelist.getDeviceList().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            WifiP2pDevice wifip2pdevice = (WifiP2pDevice)iterator.next();
            Log.d("WifiP2pSettings", (new StringBuilder()).append(" peer ").append(wifip2pdevice).toString());
            mPeersGroup.addPreference(new WifiP2pPeer(getActivity(), wifip2pdevice));
            if (wifip2pdevice.status == 0)
                mConnectedDevices = 1 + mConnectedDevices;
        } while (true);
        Log.d("WifiP2pSettings", (new StringBuilder()).append(" mConnectedDevices ").append(mConnectedDevices).toString());
    }

    public void onPersistentGroupInfoAvailable(WifiP2pGroupList wifip2pgrouplist)
    {
        mPersistentGroup.removeAll();
        WifiP2pGroup wifip2pgroup;
        for (Iterator iterator = wifip2pgrouplist.getGroupList().iterator(); iterator.hasNext(); mPersistentGroup.addPreference(new WifiP2pPersistentGroup(getActivity(), wifip2pgroup)))
        {
            wifip2pgroup = (WifiP2pGroup)iterator.next();
            Log.d("WifiP2pSettings", (new StringBuilder()).append(" group ").append(wifip2pgroup).toString());
        }

    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof WifiP2pPeer)
        {
            mSelectedWifiPeer = (WifiP2pPeer)preference;
            if (mSelectedWifiPeer.device.status == 0)
                showDialog(1);
            else
            if (mSelectedWifiPeer.device.status == 1)
            {
                showDialog(2);
            } else
            {
                WifiP2pConfig wifip2pconfig = new WifiP2pConfig();
                wifip2pconfig.deviceAddress = mSelectedWifiPeer.device.deviceAddress;
                int i = SystemProperties.getInt("wifidirect.wps", -1);
                if (i != -1)
                    wifip2pconfig.wps.setup = i;
                else
                if (mSelectedWifiPeer.device.wpsPbcSupported())
                    wifip2pconfig.wps.setup = 0;
                else
                if (mSelectedWifiPeer.device.wpsKeypadSupported())
                    wifip2pconfig.wps.setup = 2;
                else
                    wifip2pconfig.wps.setup = 1;
                mWifiP2pManager.connect(mChannel, wifip2pconfig, new android.net.wifi.p2p.WifiP2pManager.ActionListener() {

                    final WifiP2pSettings this$0;

                    public void onFailure(int j)
                    {
                        Log.e("WifiP2pSettings", (new StringBuilder()).append(" connect fail ").append(j).toString());
                        Toast.makeText(getActivity(), 0x7f0b04b3, 0).show();
                    }

                    public void onSuccess()
                    {
                        Log.d("WifiP2pSettings", " connect success");
                    }

            
            {
                this$0 = WifiP2pSettings.this;
                super();
            }
                }
);
            }
        } else
        if (preference instanceof WifiP2pPersistentGroup)
        {
            mSelectedGroup = (WifiP2pPersistentGroup)preference;
            showDialog(4);
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        boolean flag = true;
        MenuItem menuitem = menu.findItem(flag);
        MenuItem menuitem1 = menu.findItem(2);
        if (!mWifiP2pEnabled || mWifiP2pSearching)
            flag = false;
        menuitem.setEnabled(flag);
        menuitem1.setEnabled(mWifiP2pEnabled);
        if (mWifiP2pSearching)
        {
            menuitem.setTitle(0x7f0b04af);
            return;
        } else
        {
            menuitem.setTitle(0x7f0b04ae);
            return;
        }
    }

    public void onResume()
    {
        Log.d("WifiP2pSettings", "onResume");
        super.onResume();
        getActivity().registerReceiver(mReceiver, mIntentFilter);
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        if (mSelectedWifiPeer != null)
            bundle.putParcelable("PEER_STATE", mSelectedWifiPeer.device);
        if (mDeviceNameText != null)
            bundle.putString("DEV_NAME", mDeviceNameText.getText().toString());
    }


/*
    static boolean access$002(WifiP2pSettings wifip2psettings, boolean flag)
    {
        wifip2psettings.mWifiP2pEnabled = flag;
        return flag;
    }

*/







/*
    static WifiP2pDevice access$502(WifiP2pSettings wifip2psettings, WifiP2pDevice wifip2pdevice)
    {
        wifip2psettings.mThisDevice = wifip2pdevice;
        return wifip2pdevice;
    }

*/




}
