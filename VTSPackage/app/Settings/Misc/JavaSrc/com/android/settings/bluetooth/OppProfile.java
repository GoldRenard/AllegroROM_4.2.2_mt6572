// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile

final class OppProfile
    implements LocalBluetoothProfile
{

    static final String NAME = "OPP";
    private static final int ORDINAL = 2;


    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        return false;
    }

    public boolean disconnect(BluetoothDevice bluetoothdevice)
    {
        return false;
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        return 0;
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0x7f0b03f1;
    }

    public int getOrdinal()
    {
        return 2;
    }

    public int getPreferred(BluetoothDevice bluetoothdevice)
    {
        return 0;
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothdevice)
    {
        return 0;
    }

    public boolean isAutoConnectable()
    {
        return false;
    }

    public boolean isConnectable()
    {
        return false;
    }

    public boolean isPreferred(BluetoothDevice bluetoothdevice)
    {
        return false;
    }

    public boolean isProfileReady()
    {
        return true;
    }

    public void setPreferred(BluetoothDevice bluetoothdevice, boolean flag)
    {
    }

    public String toString()
    {
        return "OPP";
    }
}
