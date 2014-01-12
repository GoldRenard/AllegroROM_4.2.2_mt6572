// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;


// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDevice

interface BluetoothCallback
{

    public abstract void onBluetoothStateChanged(int i);

    public abstract void onDeviceAdded(CachedBluetoothDevice cachedbluetoothdevice);

    public abstract void onDeviceBondStateChanged(CachedBluetoothDevice cachedbluetoothdevice, int i);

    public abstract void onDeviceDeleted(CachedBluetoothDevice cachedbluetoothdevice);

    public abstract void onScanningStateChanged(boolean flag);
}
