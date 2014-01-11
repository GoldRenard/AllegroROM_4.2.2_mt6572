// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.content.Context;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile

final class PbapServerProfile
    implements LocalBluetoothProfile
{
    private final class PbapServiceListener
        implements android.bluetooth.BluetoothPbap.ServiceListener
    {

        final PbapServerProfile this$0;

        public void onServiceConnected(BluetoothPbap bluetoothpbap)
        {
            if (PbapServerProfile.V)
                Log.d("PbapServerProfile", "Bluetooth service connected");
            mService = bluetoothpbap;
            mIsProfileReady = true;
        }

        public void onServiceDisconnected()
        {
            if (PbapServerProfile.V)
                Log.d("PbapServerProfile", "Bluetooth service disconnected");
            mIsProfileReady = false;
        }

        private PbapServiceListener()
        {
            this$0 = PbapServerProfile.this;
            super();
        }

    }


    static final String NAME = "PBAP Server";
    private static final int ORDINAL = 6;
    private static final String TAG = "PbapServerProfile";
    private static boolean V = true;
    private boolean mIsProfileReady;
    private BluetoothPbap mService;

    PbapServerProfile(Context context)
    {
        new BluetoothPbap(context, new PbapServiceListener());
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        return false;
    }

    public boolean disconnect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        else
            return mService.disconnect();
    }

    protected void finalize()
    {
        if (V)
            Log.d("PbapServerProfile", "finalize()");
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        mService.close();
        mService = null;
        return;
        Throwable throwable;
        throwable;
        Log.w("PbapServerProfile", "Error cleaning up PBAP proxy", throwable);
        return;
    }

    public int getConnectionStatus(BluetoothDevice bluetoothdevice)
    {
        return mService == null || !mService.isConnected(bluetoothdevice) ? 0 : 2;
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0;
    }

    public int getOrdinal()
    {
        return 6;
    }

    public int getPreferred(BluetoothDevice bluetoothdevice)
    {
        return -1;
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
        return true;
    }

    public boolean isPreferred(BluetoothDevice bluetoothdevice)
    {
        return false;
    }

    public boolean isProfileReady()
    {
        return mIsProfileReady;
    }

    public void setPreferred(BluetoothDevice bluetoothdevice, boolean flag)
    {
    }

    public String toString()
    {
        return "PBAP Server";
    }




/*
    static BluetoothPbap access$102(PbapServerProfile pbapserverprofile, BluetoothPbap bluetoothpbap)
    {
        pbapserverprofile.mService = bluetoothpbap;
        return bluetoothpbap;
    }

*/


/*
    static boolean access$202(PbapServerProfile pbapserverprofile, boolean flag)
    {
        pbapserverprofile.mIsProfileReady = flag;
        return flag;
    }

*/
}
