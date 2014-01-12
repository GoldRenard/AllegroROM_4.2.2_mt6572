// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.content.Context;
import android.util.Log;
import java.util.List;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile, LocalBluetoothAdapter, Utils, CachedBluetoothDeviceManager, 
//            LocalBluetoothProfileManager, CachedBluetoothDevice

final class HidProfile
    implements LocalBluetoothProfile
{
    private final class InputDeviceServiceListener
        implements android.bluetooth.BluetoothProfile.ServiceListener
    {

        final HidProfile this$0;

        public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
        {
            if (HidProfile.V)
                Log.d("HidProfile", "Bluetooth service connected");
            mService = (BluetoothInputDevice)bluetoothprofile;
            List list = mService.getConnectedDevices();
            if (!list.isEmpty())
            {
                int j = list.size();
                for (int k = 0; k < j; k++)
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)list.get(k);
                    CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
                    if (cachedbluetoothdevice == null)
                    {
                        Log.w("HidProfile", (new StringBuilder()).append("HidProfile found new device: ").append(bluetoothdevice).toString());
                        cachedbluetoothdevice = mDeviceManager.addDevice(mLocalAdapter, mProfileManager, bluetoothdevice);
                    }
                    Log.d("HidProfile", (new StringBuilder()).append("HID, onServiceConnected, set device ").append(cachedbluetoothdevice.getName()).append(" state to connected").toString());
                    cachedbluetoothdevice.onProfileStateChanged(HidProfile.this, 2);
                }

            } else
            {
                Log.d("HidProfile", "device list is empty");
            }
            mIsProfileReady = true;
        }

        public void onServiceDisconnected(int i)
        {
            if (HidProfile.V)
                Log.d("HidProfile", "Bluetooth service disconnected");
            mIsProfileReady = false;
        }

        private InputDeviceServiceListener()
        {
            this$0 = HidProfile.this;
            super();
        }

    }


    static final String NAME = "HID";
    private static final int ORDINAL = 3;
    private static final String TAG = "HidProfile";
    private static boolean V = true;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private boolean mIsProfileReady;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothInputDevice mService;

    HidProfile(Context context, LocalBluetoothAdapter localbluetoothadapter, CachedBluetoothDeviceManager cachedbluetoothdevicemanager, LocalBluetoothProfileManager localbluetoothprofilemanager)
    {
        mLocalAdapter = localbluetoothadapter;
        mDeviceManager = cachedbluetoothdevicemanager;
        mProfileManager = localbluetoothprofilemanager;
        localbluetoothadapter.getProfileProxy(context, new InputDeviceServiceListener(), 4);
    }

    static int getHidClassDrawable(BluetoothClass bluetoothclass)
    {
        switch (bluetoothclass.getDeviceClass())
        {
        case 1408: 
            return 0x7f02005b;

        case 1344: 
        case 1472: 
            return 0x7f020057;
        }
        return 0x7f020059;
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        else
            return mService.connect(bluetoothdevice);
    }

    public boolean disconnect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        else
            return mService.disconnect(bluetoothdevice);
    }

    protected void finalize()
    {
        if (V)
            Log.d("HidProfile", "finalize()");
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        BluetoothAdapter.getDefaultAdapter().closeProfileProxy(4, mService);
        mService = null;
        return;
        Throwable throwable;
        throwable;
        Log.w("HidProfile", "Error cleaning up HID proxy", throwable);
        return;
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
        {
            Log.d("HidProfile", "Service is null, return disconnected");
            return 0;
        } else
        {
            return mService.getConnectionState(bluetoothdevice);
        }
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        if (bluetoothclass == null)
            return 0x7f020057;
        else
            return getHidClassDrawable(bluetoothclass);
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0x7f0b03f2;
    }

    public int getOrdinal()
    {
        return 3;
    }

    public int getPreferred(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return 0;
        else
            return mService.getPriority(bluetoothdevice);
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothdevice)
    {
        int i = getConnectionStatus(bluetoothdevice);
        switch (i)
        {
        case 2: // '\002'
            return 0x7f0b0404;

        case 0: // '\0'
            return 0x7f0b040a;

        case 1: // '\001'
        default:
            return Utils.getConnectionStateSummary(i);
        }
    }

    public boolean isAutoConnectable()
    {
        return true;
    }

    public boolean isConnectable()
    {
        return true;
    }

    public boolean isPreferred(BluetoothDevice bluetoothdevice)
    {
        return mService != null && mService.getPriority(bluetoothdevice) > 0;
    }

    public boolean isProfileReady()
    {
        return mIsProfileReady;
    }

    public void setPreferred(BluetoothDevice bluetoothdevice, boolean flag)
    {
label0:
        {
            if (mService != null)
            {
                if (!flag)
                    break label0;
                if (mService.getPriority(bluetoothdevice) < 100)
                {
                    mService.setPriority(bluetoothdevice, 100);
                    return;
                }
            }
            return;
        }
        mService.setPriority(bluetoothdevice, 0);
    }

    public String toString()
    {
        return "HID";
    }





/*
    static BluetoothInputDevice access$102(HidProfile hidprofile, BluetoothInputDevice bluetoothinputdevice)
    {
        hidprofile.mService = bluetoothinputdevice;
        return bluetoothinputdevice;
    }

*/





/*
    static boolean access$502(HidProfile hidprofile, boolean flag)
    {
        hidprofile.mIsProfileReady = flag;
        return flag;
    }

*/
}
