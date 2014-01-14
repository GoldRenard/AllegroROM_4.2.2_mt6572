// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile, LocalBluetoothAdapter, Utils, CachedBluetoothDeviceManager, 
//            LocalBluetoothProfileManager, CachedBluetoothDevice

final class HeadsetProfile
    implements LocalBluetoothProfile
{
    private final class HeadsetServiceListener
        implements android.bluetooth.BluetoothProfile.ServiceListener
    {

        final HeadsetProfile this$0;

        public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
        {
            if (HeadsetProfile.V)
                Log.d("HeadsetProfile", "Bluetooth service connected");
            mService = (BluetoothHeadset)bluetoothprofile;
            List list = mService.getConnectedDevices();
            if (!list.isEmpty())
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)list.get(0);
                CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
                if (cachedbluetoothdevice == null)
                {
                    Log.w("HeadsetProfile", (new StringBuilder()).append("HeadsetProfile found new device: ").append(bluetoothdevice).toString());
                    cachedbluetoothdevice = mDeviceManager.addDevice(mLocalAdapter, mProfileManager, bluetoothdevice);
                }
                cachedbluetoothdevice.onProfileStateChanged(HeadsetProfile.this, 2);
            }
            mProfileManager.callServiceConnectedListeners();
            mIsProfileReady = true;
        }

        public void onServiceDisconnected(int i)
        {
            if (HeadsetProfile.V)
                Log.d("HeadsetProfile", "Bluetooth service disconnected");
            mProfileManager.callServiceDisconnectedListeners();
            mIsProfileReady = false;
        }

        private HeadsetServiceListener()
        {
            this$0 = HeadsetProfile.this;
            super();
        }

    }


    static final String NAME = "HEADSET";
    private static final int ORDINAL = 0;
    private static final String TAG = "HeadsetProfile";
    static final ParcelUuid UUIDS[];
    private static boolean V = true;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private boolean mIsProfileReady;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothHeadset mService;

    HeadsetProfile(Context context, LocalBluetoothAdapter localbluetoothadapter, CachedBluetoothDeviceManager cachedbluetoothdevicemanager, LocalBluetoothProfileManager localbluetoothprofilemanager)
    {
        mLocalAdapter = localbluetoothadapter;
        mDeviceManager = cachedbluetoothdevicemanager;
        mProfileManager = localbluetoothprofilemanager;
        mLocalAdapter.getProfileProxy(context, new HeadsetServiceListener(), 1);
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        List list = mService.getConnectedDevices();
        if (list != null)
        {
            if (list.contains(bluetoothdevice))
            {
                Log.d("HeadsetProfile", "The attempt connecting device is the already in the connected device list, do not need disconnect, connect, just return true");
                return true;
            }
            BluetoothDevice bluetoothdevice1;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); mService.disconnect(bluetoothdevice1))
                bluetoothdevice1 = (BluetoothDevice)iterator.next();

        }
        return mService.connect(bluetoothdevice);
    }

    public boolean disconnect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        List list = mService.getConnectedDevices();
        if (!list.isEmpty() && ((BluetoothDevice)list.get(0)).equals(bluetoothdevice))
        {
            if (mService.getPriority(bluetoothdevice) > 100)
                mService.setPriority(bluetoothdevice, 100);
            return mService.disconnect(bluetoothdevice);
        } else
        {
            return false;
        }
    }

    protected void finalize()
    {
        if (V)
            Log.d("HeadsetProfile", "finalize()");
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        BluetoothAdapter.getDefaultAdapter().closeProfileProxy(1, mService);
        mService = null;
        return;
        Throwable throwable;
        throwable;
        Log.w("HeadsetProfile", "Error cleaning up HID proxy", throwable);
        return;
    }

    public List getConnectedDevices()
    {
        if (mService == null)
            return new ArrayList(0);
        else
            return mService.getDevicesMatchingConnectionStates(new int[] {
                2, 1, 3
            });
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return 0;
        List list = mService.getConnectedDevices();
        int i;
        if (!list.isEmpty() && ((BluetoothDevice)list.get(0)).equals(bluetoothdevice))
            i = mService.getConnectionState(bluetoothdevice);
        else
            i = 0;
        return i;
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0x7f020055;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0x7f0b03f0;
    }

    public int getOrdinal()
    {
        return 0;
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
            return 0x7f0b0401;

        case 0: // '\0'
            return 0x7f0b0408;

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
        return "HEADSET";
    }

    static 
    {
        ParcelUuid aparceluuid[] = new ParcelUuid[2];
        aparceluuid[0] = BluetoothUuid.HSP;
        aparceluuid[1] = BluetoothUuid.Handsfree;
        UUIDS = aparceluuid;
    }




/*
    static BluetoothHeadset access$102(HeadsetProfile headsetprofile, BluetoothHeadset bluetoothheadset)
    {
        headsetprofile.mService = bluetoothheadset;
        return bluetoothheadset;
    }

*/





/*
    static boolean access$502(HeadsetProfile headsetprofile, boolean flag)
    {
        headsetprofile.mIsProfileReady = flag;
        return flag;
    }

*/
}
