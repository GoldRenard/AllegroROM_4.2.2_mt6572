// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.content.Context;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile, Utils

final class PanProfile
    implements LocalBluetoothProfile
{
    private final class PanServiceListener
        implements android.bluetooth.BluetoothProfile.ServiceListener
    {

        final PanProfile this$0;

        public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
        {
            if (PanProfile.V)
                Log.d("PanProfile", "Bluetooth service connected");
            mService = (BluetoothPan)bluetoothprofile;
            mIsProfileReady = true;
        }

        public void onServiceDisconnected(int i)
        {
            if (PanProfile.V)
                Log.d("PanProfile", "Bluetooth service disconnected");
            mIsProfileReady = false;
        }

        private PanServiceListener()
        {
            this$0 = PanProfile.this;
            super();
        }

    }


    static final String NAME = "PAN";
    private static final int ORDINAL = 4;
    private static final String TAG = "PanProfile";
    private static boolean V = true;
    private final HashMap mDeviceRoleMap = new HashMap();
    private boolean mIsProfileReady;
    private BluetoothPan mService;

    PanProfile(Context context)
    {
        BluetoothAdapter.getDefaultAdapter().getProfileProxy(context, new PanServiceListener(), 5);
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        List list = mService.getConnectedDevices();
        if (list != null)
        {
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
        else
            return mService.disconnect(bluetoothdevice);
    }

    protected void finalize()
    {
        if (V)
            Log.d("PanProfile", "finalize()");
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        BluetoothAdapter.getDefaultAdapter().closeProfileProxy(5, mService);
        mService = null;
        return;
        Throwable throwable;
        throwable;
        Log.w("PanProfile", "Error cleaning up PAN proxy", throwable);
        return;
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return 0;
        else
            return mService.getConnectionState(bluetoothdevice);
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0x7f02005a;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return !isLocalRoleNap(bluetoothdevice) ? 0x7f0b03f3 : 0x7f0b03f4;
    }

    public int getOrdinal()
    {
        return 4;
    }

    public int getPreferred(BluetoothDevice bluetoothdevice)
    {
        return -1;
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothdevice)
    {
        int i = getConnectionStatus(bluetoothdevice);
        switch (i)
        {
        case 2: // '\002'
            return !isLocalRoleNap(bluetoothdevice) ? 0x7f0b0405 : 0x7f0b0406;

        case 0: // '\0'
            return 0x7f0b040b;

        case 1: // '\001'
        default:
            return Utils.getConnectionStateSummary(i);
        }
    }

    public boolean isAutoConnectable()
    {
        return false;
    }

    public boolean isConnectable()
    {
        return true;
    }

    boolean isLocalRoleNap(BluetoothDevice bluetoothdevice)
    {
        if (mDeviceRoleMap.containsKey(bluetoothdevice))
            return ((Integer)mDeviceRoleMap.get(bluetoothdevice)).intValue() == 0;
        else
            return false;
    }

    public boolean isPreferred(BluetoothDevice bluetoothdevice)
    {
        return getConnectionStatus(bluetoothdevice) == 2;
    }

    public boolean isProfileReady()
    {
        return mIsProfileReady;
    }

    void setLocalRole(BluetoothDevice bluetoothdevice, int i)
    {
        mDeviceRoleMap.put(bluetoothdevice, Integer.valueOf(i));
    }

    public void setPreferred(BluetoothDevice bluetoothdevice, boolean flag)
    {
    }

    public String toString()
    {
        return "PAN";
    }




/*
    static BluetoothPan access$102(PanProfile panprofile, BluetoothPan bluetoothpan)
    {
        panprofile.mService = bluetoothpan;
        return bluetoothpan;
    }

*/


/*
    static boolean access$202(PanProfile panprofile, boolean flag)
    {
        panprofile.mIsProfileReady = flag;
        return flag;
    }

*/
}
