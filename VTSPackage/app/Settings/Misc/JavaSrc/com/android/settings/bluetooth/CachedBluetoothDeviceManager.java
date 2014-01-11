// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDevice, LocalBluetoothAdapter, LocalBluetoothProfileManager

final class CachedBluetoothDeviceManager
{

    private static final boolean DEBUG = true;
    private static final String TAG = "CachedBluetoothDeviceManager";
    private final List mCachedDevices = new ArrayList();
    private Context mContext;

    CachedBluetoothDeviceManager(Context context)
    {
        mContext = context;
    }

    private void log(String s)
    {
        Log.d("CachedBluetoothDeviceManager", s);
    }

    public static boolean onDeviceDisappeared(CachedBluetoothDevice cachedbluetoothdevice)
    {
        cachedbluetoothdevice.setVisible(false);
        int i = cachedbluetoothdevice.getBondState();
        boolean flag = false;
        if (i == 10)
            flag = true;
        return flag;
    }

    CachedBluetoothDevice addDevice(LocalBluetoothAdapter localbluetoothadapter, LocalBluetoothProfileManager localbluetoothprofilemanager, BluetoothDevice bluetoothdevice)
    {
        CachedBluetoothDevice cachedbluetoothdevice = new CachedBluetoothDevice(mContext, localbluetoothadapter, localbluetoothprofilemanager, bluetoothdevice);
        mCachedDevices.add(cachedbluetoothdevice);
        return cachedbluetoothdevice;
    }

    CachedBluetoothDevice findDevice(BluetoothDevice bluetoothdevice)
    {
        for (Iterator iterator = mCachedDevices.iterator(); iterator.hasNext();)
        {
            CachedBluetoothDevice cachedbluetoothdevice = (CachedBluetoothDevice)iterator.next();
            if (cachedbluetoothdevice.getDevice().equals(bluetoothdevice))
                return cachedbluetoothdevice;
        }

        return null;
    }

    public Collection getCachedDevicesCopy()
    {
        this;
        JVM INSTR monitorenter ;
        ArrayList arraylist = new ArrayList(mCachedDevices);
        this;
        JVM INSTR monitorexit ;
        return arraylist;
        Exception exception;
        exception;
        throw exception;
    }

    public String getName(BluetoothDevice bluetoothdevice)
    {
        CachedBluetoothDevice cachedbluetoothdevice = findDevice(bluetoothdevice);
        String s;
        if (cachedbluetoothdevice != null)
        {
            s = cachedbluetoothdevice.getName();
        } else
        {
            s = bluetoothdevice.getAliasName();
            if (s == null)
                return bluetoothdevice.getAddress();
        }
        return s;
    }

    public void onBluetoothStateChanged(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (i != 13) goto _L2; else goto _L1
_L1:
        int j = -1 + mCachedDevices.size();
_L8:
        if (j < 0) goto _L2; else goto _L3
_L3:
        CachedBluetoothDevice cachedbluetoothdevice = (CachedBluetoothDevice)mCachedDevices.get(j);
        if (cachedbluetoothdevice.getBondState() == 12) goto _L5; else goto _L4
_L4:
        cachedbluetoothdevice.setVisible(false);
        mCachedDevices.remove(j);
          goto _L6
_L5:
        cachedbluetoothdevice.clearProfileConnectionState();
          goto _L6
        Exception exception;
        exception;
        throw exception;
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L6:
        j--;
        if (true) goto _L8; else goto _L7
_L7:
    }

    public void onBtClassChanged(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        CachedBluetoothDevice cachedbluetoothdevice = findDevice(bluetoothdevice);
        if (cachedbluetoothdevice == null)
            break MISSING_BLOCK_LABEL_16;
        cachedbluetoothdevice.refreshBtClass();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onDeviceNameUpdated(BluetoothDevice bluetoothdevice)
    {
        CachedBluetoothDevice cachedbluetoothdevice = findDevice(bluetoothdevice);
        if (cachedbluetoothdevice != null)
            cachedbluetoothdevice.refreshName();
    }

    public void onScanningStateChanged(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        int i = -1 + mCachedDevices.size();
_L4:
        if (i < 0)
            break; /* Loop/switch isn't completed */
        ((CachedBluetoothDevice)mCachedDevices.get(i)).setVisible(false);
        i--;
        if (true) goto _L4; else goto _L3
_L3:
        if (true) goto _L1; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    public void onUuidChanged(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        CachedBluetoothDevice cachedbluetoothdevice = findDevice(bluetoothdevice);
        if (cachedbluetoothdevice == null)
            break MISSING_BLOCK_LABEL_16;
        cachedbluetoothdevice.onUuidChanged();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
