// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;
import com.mediatek.bluetooth.BluetoothUuidEx;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile

final class FtpProfile
    implements LocalBluetoothProfile
{

    static final String NAME = "FTP";
    private static final int ORDINAL = 5;
    private static final String TAG = "FtpProfile";
    static final ParcelUuid UUIDS[];
    private static android.bluetooth.BluetoothFtp.Client mFtpClient;
    private static BluetoothProfileManager mService;
    private static android.bluetooth.BluetoothProfileManager.Profile profile;

    FtpProfile(Context context)
    {
        Log.d("FtpProfile", "[BT][FTP] Constructor of FtpProfile in Settings.");
        if (mFtpClient == null)
            mFtpClient = new android.bluetooth.BluetoothFtp.Client(context);
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        return mFtpClient.connect(bluetoothdevice);
    }

    public boolean disconnect(BluetoothDevice bluetoothdevice)
    {
        return mFtpClient.disconnect(bluetoothdevice);
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        int i = mFtpClient.getState(bluetoothdevice);
        if (i < 0 || i > 5)
            i = 5;
        switch (i)
        {
        case 2: // '\002'
            return 0;

        case 3: // '\003'
            return 1;

        case 4: // '\004'
            return 3;

        case 0: // '\0'
        case 1: // '\001'
            return 2;
        }
        return i;
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0x7f02005c;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0x7f0b0008;
    }

    public int getOrdinal()
    {
        return 5;
    }

    public int getPreferred(BluetoothDevice bluetoothdevice)
    {
        return -1;
    }

    public int getSummaryResourceForDevice(BluetoothDevice bluetoothdevice)
    {
        return getConnectionStatus(bluetoothdevice) != 2 ? 0x7f0b0009 : 0x7f0b000a;
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
        int i = getConnectionStatus(bluetoothdevice);
        return i == 1 || i == 2;
    }

    public boolean isProfileReady()
    {
        return mService != null;
    }

    public void setPreferred(BluetoothDevice bluetoothdevice, boolean flag)
    {
    }

    public String toString()
    {
        return "FTP";
    }

    static 
    {
        ParcelUuid aparceluuid[] = new ParcelUuid[1];
        aparceluuid[0] = BluetoothUuidEx.ObexFileTransfer;
        UUIDS = aparceluuid;
        profile = android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_FTP_Client;
    }
}
