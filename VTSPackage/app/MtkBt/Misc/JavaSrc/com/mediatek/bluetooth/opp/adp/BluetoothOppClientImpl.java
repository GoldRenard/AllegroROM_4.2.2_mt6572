// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.RemoteException;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppManager

class BluetoothOppClientImpl extends android.bluetooth.IBluetoothOpp.Stub
{

    private Context mContext;
    private OppManager mManager;

    public BluetoothOppClientImpl(Context context)
    {
        mContext = context;
        mManager = OppManager.getInstance(mContext);
    }

    public void disconnect(BluetoothDevice bluetoothdevice)
        throws RemoteException
    {
        mManager.oppAbortDeviceTasks(bluetoothdevice.getAddress());
    }

    public BluetoothDevice getConnectedDevice()
        throws RemoteException
    {
        android.net.Uri uri = mManager.oppcGetCurrentTask();
        return mManager.oppQueryTaskDevice(uri);
    }

    public int getState()
        throws RemoteException
    {
        return mManager.oppcGetCurrentTask() == null ? 2 : 1;
    }
}
