// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            BluetoothCallback, LocalBluetoothAdapter, CachedBluetoothDeviceManager, LocalBluetoothProfileManager, 
//            CachedBluetoothDevice, Utils, LocalBluetoothPreferences

final class BluetoothEventManager
{
    private class AdapterStateChangedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            int i;
            i = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
            mLocalAdapter.setBluetoothStateInt(i);
            Collection collection = mCallbacks;
            collection;
            JVM INSTR monitorenter ;
            for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((BluetoothCallback)iterator.next()).onBluetoothStateChanged(i));
            break MISSING_BLOCK_LABEL_86;
            Exception exception;
            exception;
            collection;
            JVM INSTR monitorexit ;
            throw exception;
            collection;
            JVM INSTR monitorexit ;
            mDeviceManager.onBluetoothStateChanged(i);
            return;
        }

        private AdapterStateChangedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class BondStateChangedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        private void showUnbondMessage(Context context, String s, int i)
        {
label0:
            {
                int j;
                switch (i)
                {
                case 3: // '\003'
                default:
                    break label0;

                case 5: // '\005'
                case 6: // '\006'
                case 7: // '\007'
                case 8: // '\b'
                    j = 0x7f0b03da;
                    break;

                case 4: // '\004'
                    j = 0x7f0b03dc;
                    break;

                case 2: // '\002'
                    j = 0x7f0b03dd;
                    break;

                case 1: // '\001'
                    j = 0x7f0b03db;
                    break;
                }
                Utils.showError(context, s, j);
                return;
            }
            Log.w("BluetoothEventManager", (new StringBuilder()).append("showUnbondMessage: Not displaying any message for reason: ").append(i).toString());
        }

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            if (bluetoothdevice != null) goto _L2; else goto _L1
_L1:
            Log.e("BluetoothEventManager", "ACTION_BOND_STATE_CHANGED with no EXTRA_DEVICE");
_L4:
            return;
_L2:
            int i;
            CachedBluetoothDevice cachedbluetoothdevice;
            i = intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", 0x80000000);
            cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
            if (cachedbluetoothdevice == null)
            {
                Log.w("BluetoothEventManager", (new StringBuilder()).append("CachedBluetoothDevice for device ").append(bluetoothdevice).append(" not found, calling readPairedDevices().").toString());
                if (!readPairedDevices())
                {
                    Log.e("BluetoothEventManager", (new StringBuilder()).append("Got bonding state changed for ").append(bluetoothdevice).append(", but we have no record of that device.").toString());
                    return;
                }
                cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
                if (cachedbluetoothdevice == null)
                {
                    Log.e("BluetoothEventManager", (new StringBuilder()).append("Got bonding state changed for ").append(bluetoothdevice).append(", but device not added in cache.").toString());
                    return;
                }
            }
            Collection collection = mCallbacks;
            collection;
            JVM INSTR monitorenter ;
            for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((BluetoothCallback)iterator.next()).onDeviceBondStateChanged(cachedbluetoothdevice, i));
            break MISSING_BLOCK_LABEL_227;
            Exception exception;
            exception;
            collection;
            JVM INSTR monitorexit ;
            throw exception;
            collection;
            JVM INSTR monitorexit ;
            cachedbluetoothdevice.onBondingStateChanged(i);
            if (i == 10)
            {
                if (bluetoothdevice.isBluetoothDock())
                {
                    LocalBluetoothPreferences.removeDockAutoConnectSetting(context, bluetoothdevice.getAddress());
                    if (!bluetoothdevice.getAddress().equals(BluetoothEventManager.getDockedDeviceAddress(context)))
                        cachedbluetoothdevice.setVisible(false);
                }
                int j = intent.getIntExtra("android.bluetooth.device.extra.REASON", 0x80000000);
                showUnbondMessage(context, cachedbluetoothdevice.getName(), j);
                return;
            }
            if (true) goto _L4; else goto _L3
_L3:
        }

        private BondStateChangedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class ClassChangedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            mDeviceManager.onBtClassChanged(bluetoothdevice);
        }

        private ClassChangedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class DeviceDisappearedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
            if (cachedbluetoothdevice != null) goto _L2; else goto _L1
_L1:
            Log.w("BluetoothEventManager", (new StringBuilder()).append("received ACTION_DISAPPEARED for an unknown device: ").append(bluetoothdevice).toString());
_L4:
            return;
_L2:
            if (!CachedBluetoothDeviceManager.onDeviceDisappeared(cachedbluetoothdevice)) goto _L4; else goto _L3
_L3:
            Collection collection = mCallbacks;
            collection;
            JVM INSTR monitorenter ;
            for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((BluetoothCallback)iterator.next()).onDeviceDeleted(cachedbluetoothdevice));
            break MISSING_BLOCK_LABEL_116;
            Exception exception;
            exception;
            collection;
            JVM INSTR monitorexit ;
            throw exception;
            collection;
            JVM INSTR monitorexit ;
        }

        private DeviceDisappearedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class DeviceFoundHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            short word0 = intent.getShortExtra("android.bluetooth.device.extra.RSSI", (short)-32768);
            BluetoothClass bluetoothclass = (BluetoothClass)intent.getParcelableExtra("android.bluetooth.device.extra.CLASS");
            String s = intent.getStringExtra("android.bluetooth.device.extra.NAME");
            Log.d("BluetoothEventManager", (new StringBuilder()).append("Device Name").append(s).toString());
            if (bluetoothclass != null)
            {
                int i = bluetoothclass.getMajorDeviceClass();
                Log.d("BluetoothEventManager", (new StringBuilder()).append("Device Class ").append(i).toString());
            } else
            {
                Log.d("BluetoothEventManager", "mBtClass is null");
            }
            CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
            if (cachedbluetoothdevice == null)
            {
                cachedbluetoothdevice = mDeviceManager.addDevice(mLocalAdapter, mProfileManager, bluetoothdevice);
                Log.d("BluetoothEventManager", (new StringBuilder()).append("DeviceFoundHandler created new CachedBluetoothDevice: ").append(cachedbluetoothdevice).toString());
            }
            dispatchDeviceAdded(cachedbluetoothdevice);
            cachedbluetoothdevice.setRssi(word0);
            cachedbluetoothdevice.setBtClass(bluetoothclass);
            cachedbluetoothdevice.refreshName();
            cachedbluetoothdevice.setVisible(true);
        }

        private DeviceFoundHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class DockEventHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            if (intent.getIntExtra("android.intent.extra.DOCK_STATE", 1) == 0 && bluetoothdevice != null && bluetoothdevice.getBondState() == 10)
            {
                CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
                if (cachedbluetoothdevice != null)
                    cachedbluetoothdevice.setVisible(false);
            }
        }

        private DockEventHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    static interface Handler
    {

        public abstract void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice);
    }

    private class NameChangedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            mDeviceManager.onDeviceNameUpdated(bluetoothdevice);
        }

        private NameChangedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class PairingCancelHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            if (bluetoothdevice == null)
            {
                Log.e("BluetoothEventManager", "ACTION_PAIRING_CANCEL with no EXTRA_DEVICE");
                return;
            } else
            {
                Utils.showError(context, mDeviceManager.findDevice(bluetoothdevice).getName(), 0x7f0b03da);
                return;
            }
        }

        private PairingCancelHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }

    private class ScanningStateChangedHandler
        implements Handler
    {

        private final boolean mStarted;
        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            Collection collection = mCallbacks;
            collection;
            JVM INSTR monitorenter ;
            for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((BluetoothCallback)iterator.next()).onScanningStateChanged(mStarted));
            break MISSING_BLOCK_LABEL_66;
            Exception exception;
            exception;
            collection;
            JVM INSTR monitorexit ;
            throw exception;
            collection;
            JVM INSTR monitorexit ;
            mDeviceManager.onScanningStateChanged(mStarted);
            LocalBluetoothPreferences.persistDiscoveringTimestamp(context);
            return;
        }

        ScanningStateChangedHandler(boolean flag)
        {
            this$0 = BluetoothEventManager.this;
            super();
            mStarted = flag;
        }
    }

    private class UuidChangedHandler
        implements Handler
    {

        final BluetoothEventManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            mDeviceManager.onUuidChanged(bluetoothdevice);
        }

        private UuidChangedHandler()
        {
            this$0 = BluetoothEventManager.this;
            super();
        }

    }


    private static final String TAG = "BluetoothEventManager";
    private final IntentFilter mAdapterIntentFilter = new IntentFilter();
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final BluetoothEventManager this$0;

        public void onReceive(Context context1, Intent intent)
        {
            Log.v("BluetoothEventManager", (new StringBuilder()).append("Received ").append(intent.getAction()).toString());
            String s = intent.getAction();
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            Handler handler = (Handler)mHandlerMap.get(s);
            if (handler != null)
                handler.onReceive(context1, intent, bluetoothdevice);
        }

            
            {
                this$0 = BluetoothEventManager.this;
                super();
            }
    }
;
    private final Collection mCallbacks = new ArrayList();
    private Context mContext;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private final Map mHandlerMap = new HashMap();
    private final LocalBluetoothAdapter mLocalAdapter;
    private final IntentFilter mProfileIntentFilter = new IntentFilter();
    private LocalBluetoothProfileManager mProfileManager;

    BluetoothEventManager(LocalBluetoothAdapter localbluetoothadapter, CachedBluetoothDeviceManager cachedbluetoothdevicemanager, Context context)
    {
        mLocalAdapter = localbluetoothadapter;
        mDeviceManager = cachedbluetoothdevicemanager;
        mContext = context;
        addHandler("android.bluetooth.adapter.action.STATE_CHANGED", new AdapterStateChangedHandler());
        addHandler("android.bluetooth.adapter.action.DISCOVERY_STARTED", new ScanningStateChangedHandler(true));
        addHandler("android.bluetooth.adapter.action.DISCOVERY_FINISHED", new ScanningStateChangedHandler(false));
        addHandler("android.bluetooth.device.action.FOUND", new DeviceFoundHandler());
        addHandler("android.bluetooth.device.action.DISAPPEARED", new DeviceDisappearedHandler());
        addHandler("android.bluetooth.device.action.NAME_CHANGED", new NameChangedHandler());
        addHandler("android.bluetooth.device.action.BOND_STATE_CHANGED", new BondStateChangedHandler());
        addHandler("android.bluetooth.device.action.PAIRING_CANCEL", new PairingCancelHandler());
        addHandler("android.bluetooth.device.action.CLASS_CHANGED", new ClassChangedHandler());
        addHandler("android.bluetooth.device.action.UUID", new UuidChangedHandler());
        addHandler("android.intent.action.DOCK_EVENT", new DockEventHandler());
        mContext.registerReceiver(mBroadcastReceiver, mAdapterIntentFilter);
    }

    private void dispatchDeviceAdded(CachedBluetoothDevice cachedbluetoothdevice)
    {
        Collection collection = mCallbacks;
        collection;
        JVM INSTR monitorenter ;
        for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((BluetoothCallback)iterator.next()).onDeviceAdded(cachedbluetoothdevice));
        break MISSING_BLOCK_LABEL_52;
        Exception exception;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
        collection;
        JVM INSTR monitorexit ;
    }

    private static String getDockedDeviceAddress(Context context)
    {
        Intent intent = context.registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
        String s = null;
        if (intent != null)
        {
            int i = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
            s = null;
            if (i != 0)
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                s = null;
                if (bluetoothdevice != null)
                    s = bluetoothdevice.getAddress();
            }
        }
        return s;
    }

    void addHandler(String s, Handler handler)
    {
        mHandlerMap.put(s, handler);
        mAdapterIntentFilter.addAction(s);
    }

    void addProfileHandler(String s, Handler handler)
    {
        mHandlerMap.put(s, handler);
        mProfileIntentFilter.addAction(s);
    }

    boolean readPairedDevices()
    {
        Set set = mLocalAdapter.getBondedDevices();
        boolean flag;
        if (set == null)
        {
            flag = false;
        } else
        {
            flag = false;
            Iterator iterator = set.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                BluetoothDevice bluetoothdevice = (BluetoothDevice)iterator.next();
                if (mDeviceManager.findDevice(bluetoothdevice) == null)
                {
                    dispatchDeviceAdded(mDeviceManager.addDevice(mLocalAdapter, mProfileManager, bluetoothdevice));
                    flag = true;
                }
            } while (true);
        }
        return flag;
    }

    void registerCallback(BluetoothCallback bluetoothcallback)
    {
        synchronized (mCallbacks)
        {
            mCallbacks.add(bluetoothcallback);
        }
        return;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void registerProfileIntentReceiver()
    {
        mContext.registerReceiver(mBroadcastReceiver, mProfileIntentFilter);
    }

    void setProfileManager(LocalBluetoothProfileManager localbluetoothprofilemanager)
    {
        mProfileManager = localbluetoothprofilemanager;
    }

    void unregisterCallback(BluetoothCallback bluetoothcallback)
    {
        synchronized (mCallbacks)
        {
            mCallbacks.remove(bluetoothcallback);
        }
        return;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
    }







}
