// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;

interface LocalBluetoothProfile
{

    public abstract boolean connect(BluetoothDevice bluetoothdevice);

    public abstract boolean disconnect(BluetoothDevice bluetoothdevice);

    public abstract int getConnectionStatus(BluetoothDevice bluetoothdevice);

    public abstract int getDrawableResource(BluetoothClass bluetoothclass);

    public abstract int getNameResource(BluetoothDevice bluetoothdevice);

    public abstract int getOrdinal();

    public abstract int getPreferred(BluetoothDevice bluetoothdevice);

    public abstract int getSummaryResourceForDevice(BluetoothDevice bluetoothdevice);

    public abstract boolean isAutoConnectable();

    public abstract boolean isConnectable();

    public abstract boolean isPreferred(BluetoothDevice bluetoothdevice);

    public abstract boolean isProfileReady();

    public abstract void setPreferred(BluetoothDevice bluetoothdevice, boolean flag);
}
