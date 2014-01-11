// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.hid;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.*;
import android.preference.*;
import android.view.*;
import android.widget.ListAdapter;
import android.widget.Toast;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.Set;

// Referenced classes of package com.mediatek.bluetooth.hid:
//            IBluetoothHidServerNotify, BluetoothHidService, BluetoothHidAlert, BluetoothHidReceiver

public class BluetoothHidActivity extends PreferenceActivity
{

    public static final String ACTION_DEVICE_ADDED = "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED";
    public static final String ACTION_SUMMARY_CHANGED = "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED";
    private static final String ADD_NEW_DEVICE = "add_new_device";
    public static final String BT_HID_NOT_FOUNT = "BT_HID_NOT_FOUNT";
    public static final String BT_HID_SETTING_INFO = "BT_HID_SETTING_INFO";
    private static final int CONTEXT_ITEM_CONNECT = 2;
    private static final int CONTEXT_ITEM_DISCONNECT = 3;
    private static final int CONTEXT_ITEM_GET_IDLE = 10;
    private static final int CONTEXT_ITEM_GET_PROTOCOL = 6;
    private static final int CONTEXT_ITEM_GET_REPORT = 8;
    private static final int CONTEXT_ITEM_SEND_REPORT_LONG = 12;
    private static final int CONTEXT_ITEM_SEND_REPORT_SHORT = 11;
    private static final int CONTEXT_ITEM_SET_IDLE = 9;
    private static final int CONTEXT_ITEM_SET_PROTOCOL = 5;
    private static final int CONTEXT_ITEM_SET_REPORT = 7;
    private static final int CONTEXT_ITEM_UNPLUG = 4;
    private static final boolean DEBUG = true;
    public static final String EXTRA_DEVICE = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_DEVICE";
    public static final String EXTRA_ENABLE = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_ENABLE";
    public static final String EXTRA_FILTER_TYPE = "android.bluetooth.devicepicker.extra.FILTER_TYPE";
    public static final String EXTRA_LAUNCH_CLASS = "android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS";
    public static final String EXTRA_LAUNCH_PACKAGE = "android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE";
    public static final String EXTRA_NEED_AUTH = "android.bluetooth.devicepicker.extra.NEED_AUTH";
    public static final String EXTRA_SUMMARY = "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_SUMMARY";
    private static final String HID_DEVICE_LIST = "hid_device_list";
    public static final String INTENT = "android.bluetooth.devicepicker.action.LAUNCH";
    private static final int REQUEST_ENABLE_BT = 2;
    private static final String TAG = "[BT][HID][BluetoothHidActivity]";
    public static final String THIS_PACKAGE_NAME = "com.mediatek.bluetooth";
    private static boolean sBluetoothHidPts = false;
    static PreferenceCategory sDeviceList;
    private static boolean sEnableBT = false;
    private static boolean sServiceBinded = false;
    private BluetoothAdapter mBluetoothAdapter;
    Context mCt;
    private ServiceConnection mHidServerNotifyConn;
    Intent mIntentToDevicePicker;
    private BroadcastReceiver mReceiver;
    private IBluetoothHidServerNotify mServerNotify;

    public BluetoothHidActivity()
    {
        mServerNotify = null;
        mBluetoothAdapter = null;
        mCt = this;
        mIntentToDevicePicker = new Intent("android.bluetooth.devicepicker.action.LAUNCH");
        mHidServerNotifyConn = new ServiceConnection() {

            final BluetoothHidActivity this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                debugLog("onServiceConnected");
                mServerNotify = IBluetoothHidServerNotify.Stub.asInterface(ibinder);
                if (mServerNotify == null)
                {
                    Xlog.e("[BT][HID][BluetoothHidActivity]", "ERROR:mServerNotify null");
                    return;
                } else
                {
                    getPreferenceList();
                    BluetoothHidActivity.sServiceBinded = true;
                    return;
                }
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mServerNotify = null;
            }

            
            {
                this$0 = BluetoothHidActivity.this;
                super();
            }
        }
;
        mReceiver = new BroadcastReceiver() {

            final BluetoothHidActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                debugLog((new StringBuilder()).append("hid activity receiver receives intent: ").append(intent).toString());
                if (!"android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction())) goto _L2; else goto _L1
_L1:
                intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
                JVM INSTR tableswitch 13 13: default 64
            //                           13 65;
                   goto _L3 _L4
_L3:
                return;
_L4:
                debugLog("hid activity receiver receives BT OFF intent");
                restorePreferenceList();
                try
                {
                    if (BluetoothHidActivity.sServiceBinded)
                    {
                        BluetoothHidActivity.sServiceBinded = false;
                        debugLog("mReceiver,unbindservice");
                        mCt.unbindService(mHidServerNotifyConn);
                    }
                }
                catch (IllegalArgumentException illegalargumentexception)
                {
                    Xlog.e("[BT][HID][BluetoothHidActivity]", "mReceiver,unbindservice error");
                    finish();
                }
                if (BluetoothHidActivity.sEnableBT) goto _L3; else goto _L5
_L5:
                finish();
                return;
_L2:
                String s;
                int i;
                boolean flag;
                if (!"com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED".equals(intent.getAction()))
                    continue; /* Loop/switch isn't completed */
                debugLog("Update summary");
                s = intent.getStringExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_DEVICE");
                i = intent.getIntExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_SUMMARY", -1);
                debugLog((new StringBuilder()).append("new summary is: ").append(getString(i)).toString());
                flag = intent.getBooleanExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_ENABLE", true);
                if (BluetoothHidActivity.sDeviceList == null) goto _L3; else goto _L6
_L6:
                Preference preference = BluetoothHidActivity.sDeviceList.findPreference(s);
                if (preference == null) goto _L3; else goto _L7
_L7:
                preference.setSummary(i);
                preference.setEnabled(flag);
                return;
                if (!"com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED".equals(intent.getAction())) goto _L3; else goto _L8
_L8:
                debugLog("New device added");
                getPreferenceList();
                return;
            }

            
            {
                this$0 = BluetoothHidActivity.this;
                super();
            }
        }
;
    }

    private void debugLog(String s)
    {
        Xlog.i("[BT][HID][BluetoothHidActivity]", s);
    }

    private Preference getDeviceFromMenuInfo(android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        Preference preference;
        if (contextmenuinfo != null && (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo))
        {
            android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
            preference = (Preference)getPreferenceScreen().getRootAdapter().getItem(adaptercontextmenuinfo.position);
            if (preference == null)
                return null;
        } else
        {
            preference = null;
        }
        return preference;
    }

    public static PreferenceCategory getDeviceList()
    {
        return sDeviceList;
    }

    private void getPreferenceList()
    {
        Set set = BluetoothAdapter.getDefaultAdapter().getBondedDevices();
        if (set != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        SharedPreferences sharedpreferences;
        int i;
        String s;
        int j;
        sharedpreferences = getSharedPreferences("BT_HID_SETTING_INFO", 0);
        i = sharedpreferences.getInt("preferenceCount", 0);
        s = new String();
        j = 0;
_L8:
        Preference preference;
        String s1;
        String s2;
        String s3;
        if (j >= i)
            break MISSING_BLOCK_LABEL_617;
        preference = new Preference(mCt);
        s1 = sharedpreferences.getString((new StringBuilder()).append("deviceAddr").append(Integer.toString(j)).toString(), "BT_HID_NOT_FOUNT");
        s2 = sharedpreferences.getString((new StringBuilder()).append("newAdd").append(Integer.toString(j)).toString(), "BT_HID_NOT_FOUNT");
        s3 = new String();
        preference.setKey(s1);
        BluetoothDevice bluetoothdevice = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(s1);
        if (bluetoothdevice != null)
            s3 = bluetoothdevice.getName();
        preference.setTitle(s3);
        debugLog((new StringBuilder()).append("in getPreferenceList ").append(s3).append(":").append(s2).toString());
        if (mServerNotify == null) goto _L4; else goto _L3
_L3:
        s = mServerNotify.getStateByAddr(s1);
_L9:
        debugLog((new StringBuilder()).append("in getPreferenceList ").append(s3).append(":").append(s).toString());
        if (s == null) goto _L6; else goto _L5
_L5:
        if (!s.equals("disconnect") && !s.equals("unplug_disconnect")) goto _L7; else goto _L6
_L6:
        preference.setSummary(0x7f05000d);
_L10:
        if (sDeviceList.findPreference(s1) == null && s != null && (s.equals("connected") || s.equals("connecting")))
            sDeviceList.addPreference(preference);
        RemoteException remoteexception;
        if (sDeviceList.findPreference(s1) == null && (s == null || !s.equals("unplug_disconnect") || !s2.equals("FALSE")) && set.size() > 0)
        {
            debugLog((new StringBuilder()).append("in getPreferenceList pairedDevices.size=").append(set.size()).toString());
            Iterator iterator = set.iterator();
            while (iterator.hasNext()) 
                if (((BluetoothDevice)iterator.next()).getAddress().equals(s1))
                    sDeviceList.addPreference(preference);
        }
        j++;
          goto _L8
_L4:
        debugLog("in getPreferenceList mServerNotify == null");
        s = null;
          goto _L9
_L7:
        try
        {
            if (!s.equals("connected"))
                break MISSING_BLOCK_LABEL_450;
            preference.setSummary(0x7f05000b);
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            debugLog("hid retrieve preferences error");
            preference.setSummary(0x7f05000d);
            remoteexception.printStackTrace();
        }
          goto _L10
        if (!s.equals("disconnecting") && !s.equals("unplug")) goto _L12; else goto _L11
_L11:
        preference.setSummary(0x7f05001f);
        preference.setEnabled(false);
          goto _L10
_L12:
        if (!s.equals("connecting") && !s.equals("authorize")) goto _L10; else goto _L13
_L13:
        preference.setSummary(0x7f05000c);
        preference.setEnabled(false);
          goto _L10
        Iterator iterator1 = set.iterator();
_L15:
        BluetoothDevice bluetoothdevice1;
        if (!iterator1.hasNext())
            continue; /* Loop/switch isn't completed */
        bluetoothdevice1 = (BluetoothDevice)iterator1.next();
        if (mServerNotify != null)
            s = mServerNotify.getStateByAddr(bluetoothdevice1.getAddress());
        if (s == null)
            break; /* Loop/switch isn't completed */
        try
        {
            if (s.equals("connected"))
            {
                Preference preference1 = new Preference(mCt);
                preference1.setKey(bluetoothdevice1.getAddress());
                preference1.setTitle(bluetoothdevice1.getName());
                preference1.setSummary(0x7f05000b);
                if (sDeviceList.findPreference(bluetoothdevice1.getAddress()) == null)
                    sDeviceList.addPreference(preference1);
            }
        }
        catch (RemoteException remoteexception1)
        {
            debugLog("hid retrieve preferences error");
            remoteexception1.printStackTrace();
        }
        if (true) goto _L15; else goto _L14
_L14:
        if (true) goto _L1; else goto _L16
_L16:
    }

    private void restorePreferenceList()
    {
        if (mServerNotify != null)
        {
            SharedPreferences sharedpreferences = getSharedPreferences("BT_HID_SETTING_INFO", 0);
            int i = sDeviceList.getPreferenceCount();
            new Preference(this);
            debugLog((new StringBuilder()).append("In restorePreferenceList,preferenceCount=").append(i).toString());
            sharedpreferences.edit().putInt("preferenceCount", i).commit();
            for (int j = 0; j < i; j++)
            {
                Preference preference = sDeviceList.getPreference(j);
                sharedpreferences.edit().putString((new StringBuilder()).append("deviceAddr").append(Integer.toString(j)).toString(), preference.getKey().toString()).putString((new StringBuilder()).append("newAdd").append(Integer.toString(j)).toString(), "FALSE").commit();
            }

        }
    }

    public IBluetoothHidServerNotify getmServerNotify()
    {
        return mServerNotify;
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        debugLog((new StringBuilder()).append("onActivityResult, resultCode = ").append(j).toString());
        switch (i)
        {
        case 2: // '\002'
            if (j == -1)
            {
                Toast.makeText(this, 0x7f050006, 1).show();
                startService(new Intent(this, com/mediatek/bluetooth/hid/BluetoothHidService));
                if (mBluetoothAdapter.getState() != 13)
                {
                    if (!bindService(new Intent(this, com/mediatek/bluetooth/hid/BluetoothHidService), mHidServerNotifyConn, 1))
                    {
                        sServiceBinded = false;
                        finish();
                    }
                } else
                {
                    finish();
                }
                debugLog("hid success bind service in onActivityResult");
                sEnableBT = false;
                return;
            }
            if (j == 0)
            {
                sEnableBT = false;
                return;
            } else
            {
                sEnableBT = false;
                Toast.makeText(this, 0x7f050007, 1).show();
                return;
            }
        }
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        Preference preference = getDeviceFromMenuInfo(menuitem.getMenuInfo());
        if (preference == null)
            return false;
        switch (menuitem.getItemId())
        {
        default:
            return false;

        case 2: // '\002'
            try
            {
                debugLog((new StringBuilder()).append("hid connect ").append(preference.getTitle().toString()).toString());
                getmServerNotify().connectReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception8)
            {
                debugLog("hid connect error");
                remoteexception8.printStackTrace();
                return false;
            }
            return true;

        case 3: // '\003'
            debugLog((new StringBuilder()).append("hid disconnect ").append(preference.getTitle().toString()).toString());
            Intent intent1 = new Intent();
            intent1.setClassName(getPackageName(), com/mediatek/bluetooth/hid/BluetoothHidAlert.getName()).putExtra("device_addr", preference.getKey().toString()).putExtra("action", "disconnect");
            startActivity(intent1);
            return true;

        case 4: // '\004'
            debugLog((new StringBuilder()).append("hid unplug ").append(preference.getTitle().toString()).toString());
            Intent intent = new Intent();
            intent.setClassName(getPackageName(), com/mediatek/bluetooth/hid/BluetoothHidAlert.getName()).putExtra("device_addr", preference.getKey().toString()).putExtra("action", "unplug");
            startActivity(intent);
            return true;

        case 9: // '\t'
            try
            {
                debugLog((new StringBuilder()).append("hid SET_IDLE ").append(preference.getTitle().toString()).toString());
                getmServerNotify().setIdleReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception7)
            {
                debugLog("hid SET_IDLE error");
                remoteexception7.printStackTrace();
                return false;
            }
            return true;

        case 10: // '\n'
            try
            {
                debugLog((new StringBuilder()).append("hid GET_IDLE ").append(preference.getTitle().toString()).toString());
                getmServerNotify().getIdleReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception6)
            {
                debugLog("hid GET_IDLE error");
                remoteexception6.printStackTrace();
                return false;
            }
            return true;

        case 7: // '\007'
            try
            {
                debugLog((new StringBuilder()).append("hid SET_REPORT ").append(preference.getTitle().toString()).toString());
                getmServerNotify().setReportReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception5)
            {
                debugLog("hid SET_REPORT error");
                remoteexception5.printStackTrace();
                return false;
            }
            return true;

        case 8: // '\b'
            try
            {
                debugLog((new StringBuilder()).append("hid GET_REPORT ").append(preference.getTitle().toString()).toString());
                getmServerNotify().getReportReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception4)
            {
                debugLog("hid GET_REPORT error");
                remoteexception4.printStackTrace();
                return false;
            }
            return true;

        case 5: // '\005'
            try
            {
                debugLog((new StringBuilder()).append("hid SET_PROTOCOL ").append(preference.getTitle().toString()).toString());
                getmServerNotify().setProtocolReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception3)
            {
                debugLog("hid SET_PROTOCOL error");
                remoteexception3.printStackTrace();
                return false;
            }
            return true;

        case 6: // '\006'
            try
            {
                debugLog((new StringBuilder()).append("hid GET_PROTOCOL ").append(preference.getTitle().toString()).toString());
                getmServerNotify().getProtocolReq(preference.getKey().toString());
            }
            catch (RemoteException remoteexception2)
            {
                debugLog("hid GET_PROTOCOL error");
                remoteexception2.printStackTrace();
                return false;
            }
            return true;

        case 11: // '\013'
            try
            {
                debugLog((new StringBuilder()).append("hid SEND_REPORT_SHORT ").append(preference.getTitle().toString()).toString());
                getmServerNotify().sendReportReq(preference.getKey().toString(), false);
            }
            catch (RemoteException remoteexception1)
            {
                debugLog("hid SEND_REPORT error");
                remoteexception1.printStackTrace();
                return false;
            }
            return true;

        case 12: // '\f'
            break;
        }
        try
        {
            debugLog((new StringBuilder()).append("hid SEND_REPORT_LONG ").append(preference.getTitle().toString()).toString());
            getmServerNotify().sendReportReq(preference.getKey().toString(), true);
        }
        catch (RemoteException remoteexception)
        {
            debugLog("hid SEND_REPORT error");
            remoteexception.printStackTrace();
            return false;
        }
        return true;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        debugLog("onCreate");
        addPreferencesFromResource(0x7f040001);
        setTitle(0x7f050000);
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter == null)
        {
            Toast.makeText(this, "Bluetooth is not available", 1).show();
            finish();
        } else
        {
            sDeviceList = (PreferenceCategory)findPreference("hid_device_list");
            if (sDeviceList != null)
                sDeviceList.setOrderingAsAdded(true);
            registerForContextMenu(getListView());
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
            intentfilter.addAction("com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED");
            intentfilter.addAction("com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED");
            registerReceiver(mReceiver, intentfilter);
            if (!mBluetoothAdapter.isEnabled() && !sEnableBT)
            {
                Xlog.w("[BT][HID][BluetoothHidActivity]", "bluetooth is not available! ");
                Xlog.v("[BT][HID][BluetoothHidActivity]", "turning on bluetooth......");
                sEnableBT = true;
                Intent intent = new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE");
                intent.setFlags(0x20000000);
                startActivityForResult(intent, 2);
                return;
            }
        }
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        String s;
        super.onCreateContextMenu(contextmenu, view, contextmenuinfo);
        Preference preference;
        try
        {
            preference = getDeviceFromMenuInfo(contextmenuinfo);
        }
        catch (RemoteException remoteexception)
        {
            debugLog("hid getStateByAddr error");
            remoteexception.printStackTrace();
            return;
        }
        if (preference == null)
            return;
        if (preference.getKey().equals("add_new_device"))
            break MISSING_BLOCK_LABEL_310;
        s = getmServerNotify().getStateByAddr(preference.getKey());
        debugLog((new StringBuilder()).append("device state=").append(s).toString());
        contextmenu.setHeaderTitle(preference.getTitle());
        if (s != null)
            break MISSING_BLOCK_LABEL_120;
        contextmenu.add(0, 2, 0, 0x7f050001);
        return;
        if (s.equals("disconnect") || s.equals("unplug_disconnect"))
        {
            contextmenu.add(0, 2, 0, 0x7f050001);
            return;
        }
        if (s.equals("connected"))
        {
            contextmenu.add(0, 3, 0, 0x7f050002);
            contextmenu.add(0, 4, 0, 0x7f050003);
            if (sBluetoothHidPts)
            {
                contextmenu.add(0, 10, 0, "Get_idle");
                contextmenu.add(0, 9, 0, "Set_idle");
                contextmenu.add(0, 8, 0, "Get_report");
                contextmenu.add(0, 7, 0, "Set_report");
                contextmenu.add(0, 6, 0, "Get_protocol");
                contextmenu.add(0, 5, 0, "Set_protocol");
                contextmenu.add(0, 11, 0, "Send_report(short)");
                contextmenu.add(0, 12, 0, "Send_report(long)");
            }
        }
    }

    protected void onDestroy()
    {
        debugLog("onDestroy");
        sBluetoothHidPts = false;
        debugLog("onDestroy: unregister broadcastReceiver");
        unregisterReceiver(mReceiver);
        super.onDestroy();
    }

    protected void onPause()
    {
        super.onPause();
        debugLog("onPause");
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.getKey().equals("add_new_device"))
        {
            debugLog("Add New Devices");
            mIntentToDevicePicker.putExtra("android.bluetooth.devicepicker.extra.NEED_AUTH", true);
            mIntentToDevicePicker.putExtra("android.bluetooth.devicepicker.extra.FILTER_TYPE", 7);
            mIntentToDevicePicker.putExtra("android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE", "com.mediatek.bluetooth");
            mIntentToDevicePicker.putExtra("android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS", com/mediatek/bluetooth/hid/BluetoothHidReceiver.getName());
            startActivity(mIntentToDevicePicker);
            return true;
        }
        if (!(preference instanceof Preference)) goto _L2; else goto _L1
_L1:
        String s;
        s = getmServerNotify().getStateByAddr(preference.getKey());
        debugLog((new StringBuilder()).append("device state=").append(s).toString());
        if (s == null) goto _L4; else goto _L3
_L3:
        if (!s.equals("disconnect") && !s.equals("unplug_disconnect") && !s.equals("authorize")) goto _L5; else goto _L4
_L4:
        debugLog((new StringBuilder()).append("hid connect ").append(preference.getTitle().toString()).toString());
        getmServerNotify().connectReq(preference.getKey().toString());
        return true;
        RemoteException remoteexception;
        remoteexception;
        debugLog("hid connect error");
        remoteexception.printStackTrace();
_L2:
        return super.onPreferenceTreeClick(preferencescreen, preference);
_L5:
        if (!s.equals("connected")) goto _L2; else goto _L6
_L6:
        debugLog((new StringBuilder()).append("hid disconnect ").append(preference.getTitle().toString()).toString());
        Intent intent = new Intent();
        intent.setClassName(getPackageName(), com/mediatek/bluetooth/hid/BluetoothHidAlert.getName()).putExtra("device_addr", preference.getKey().toString()).putExtra("action", "disconnect");
        startActivity(intent);
        return true;
    }

    protected void onRestart()
    {
        super.onRestart();
        debugLog("onRestart");
        if (!mBluetoothAdapter.isEnabled() && !sEnableBT)
        {
            Xlog.w("[BT][HID][BluetoothHidActivity]", "bluetooth is not available! ");
            Xlog.v("[BT][HID][BluetoothHidActivity]", "turning on bluetooth......");
            sEnableBT = true;
        }
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        super.onRestoreInstanceState(bundle);
    }

    protected void onResume()
    {
        super.onResume();
        debugLog("onResume");
        if (!mBluetoothAdapter.isEnabled() && !sEnableBT)
        {
            Xlog.w("[BT][HID][BluetoothHidActivity]", "bluetooth is not available! ");
            finish();
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
    }

    protected void onStart()
    {
        super.onStart();
        debugLog((new StringBuilder()).append("onStart, enableBT=").append(sEnableBT).toString());
        Bundle bundle = getIntent().getExtras();
        if (bundle != null)
        {
            debugLog("check BLUETOOTH_HID_PTS in onStart");
            String s = bundle.getString("BLUETOOTH_HID_PTS");
            if (s != null)
            {
                boolean flag;
                if (s.equals("TRUE"))
                    flag = true;
                else
                    flag = false;
                sBluetoothHidPts = flag;
            }
        }
        if (!sEnableBT)
        {
            startService(new Intent(this, com/mediatek/bluetooth/hid/BluetoothHidService));
            if (mBluetoothAdapter.getState() != 13)
            {
                if (!bindService(new Intent(this, com/mediatek/bluetooth/hid/BluetoothHidService), mHidServerNotifyConn, 1))
                {
                    sServiceBinded = false;
                    finish();
                }
            } else
            {
                finish();
            }
            debugLog("hid success bind service in onStart");
        }
    }

    protected void onStop()
    {
        super.onStop();
        if (mBluetoothAdapter.isEnabled())
        {
            restorePreferenceList();
            try
            {
                if (sServiceBinded)
                {
                    sServiceBinded = false;
                    debugLog("onStop,unbindservice");
                    unbindService(mHidServerNotifyConn);
                }
            }
            catch (IllegalArgumentException illegalargumentexception)
            {
                Xlog.e("[BT][HID][BluetoothHidActivity]", "onStop,unbindservice error");
                finish();
            }
            sDeviceList.removeAll();
        }
        debugLog((new StringBuilder()).append("onStop:, enable=").append(sEnableBT).toString());
        sEnableBT = false;
    }





/*
    static IBluetoothHidServerNotify access$102(BluetoothHidActivity bluetoothhidactivity, IBluetoothHidServerNotify ibluetoothhidservernotify)
    {
        bluetoothhidactivity.mServerNotify = ibluetoothhidservernotify;
        return ibluetoothhidservernotify;
    }

*/




/*
    static boolean access$302(boolean flag)
    {
        sServiceBinded = flag;
        return flag;
    }

*/



}
