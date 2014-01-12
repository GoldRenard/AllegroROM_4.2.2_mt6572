// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.os.ParcelUuid;
import java.util.Set;

// Referenced classes of package com.android.settings.bluetooth:
//            BluetoothDeviceFilter, LocalBluetoothProfileManager, A2dpProfile

public final class LocalBluetoothAdapter
{

    private static final int SCAN_EXPIRATION_MS = 0x493e0;
    private static final String TAG = "LocalBluetoothAdapter";
    private static LocalBluetoothAdapter sInstance;
    private final BluetoothAdapter mAdapter;
    private long mLastScan;
    private LocalBluetoothProfileManager mProfileManager;
    private int mState;

    private LocalBluetoothAdapter(BluetoothAdapter bluetoothadapter)
    {
        mState = 0x80000000;
        mAdapter = bluetoothadapter;
    }

    static LocalBluetoothAdapter getInstance()
    {
        com/android/settings/bluetooth/LocalBluetoothAdapter;
        JVM INSTR monitorenter ;
        BluetoothAdapter bluetoothadapter;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_28;
        bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter == null)
            break MISSING_BLOCK_LABEL_28;
        sInstance = new LocalBluetoothAdapter(bluetoothadapter);
        LocalBluetoothAdapter localbluetoothadapter = sInstance;
        com/android/settings/bluetooth/LocalBluetoothAdapter;
        JVM INSTR monitorexit ;
        return localbluetoothadapter;
        Exception exception;
        exception;
        throw exception;
    }

    void cancelDiscovery()
    {
        mAdapter.cancelDiscovery();
    }

    boolean disable()
    {
        return mAdapter.disable();
    }

    boolean enable()
    {
        return mAdapter.enable();
    }

    public int getBluetoothState()
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        syncBluetoothState();
        i = mState;
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        throw exception;
    }

    Set getBondedDevices()
    {
        return mAdapter.getBondedDevices();
    }

    String getName()
    {
        return mAdapter.getName();
    }

    void getProfileProxy(Context context, android.bluetooth.BluetoothProfile.ServiceListener servicelistener, int i)
    {
        mAdapter.getProfileProxy(context, servicelistener, i);
    }

    int getScanMode()
    {
        return mAdapter.getScanMode();
    }

    int getScanType(int i)
    {
        return 8 != i ? 0 : 2;
    }

    int getScanType(BluetoothDeviceFilter.Filter filter)
    {
        BluetoothDeviceFilter.Filter filter1 = BluetoothDeviceFilter.getFilter(8);
        return filter1 == null || !filter1.equals(filter) ? 0 : 2;
    }

    int getState()
    {
        return mAdapter.getState();
    }

    ParcelUuid[] getUuids()
    {
        return mAdapter.getUuids();
    }

    boolean isDiscovering()
    {
        return mAdapter.isDiscovering();
    }

    boolean isEnabled()
    {
        return mAdapter.isEnabled();
    }

    public void setBluetoothEnabled(boolean flag)
    {
        boolean flag1;
        if (flag)
            flag1 = mAdapter.enable();
        else
            flag1 = mAdapter.disable();
        if (flag1)
        {
            byte byte0;
            if (flag)
                byte0 = 11;
            else
                byte0 = 13;
            setBluetoothStateInt(byte0);
            return;
        } else
        {
            syncBluetoothState();
            return;
        }
    }

    void setBluetoothStateInt(int i)
    {
        this;
        JVM INSTR monitorenter ;
        mState = i;
        if (i != 12)
            break MISSING_BLOCK_LABEL_27;
        if (mProfileManager != null)
            mProfileManager.setBluetoothStateOn();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void setDiscoverableTimeout(int i)
    {
        mAdapter.setDiscoverableTimeout(i);
    }

    void setName(String s)
    {
        mAdapter.setName(s);
    }

    void setProfileManager(LocalBluetoothProfileManager localbluetoothprofilemanager)
    {
        mProfileManager = localbluetoothprofilemanager;
    }

    void setScanMode(int i)
    {
        mAdapter.setScanMode(i);
    }

    boolean setScanMode(int i, int j)
    {
        return mAdapter.setScanMode(i, j);
    }

    void startScanning(boolean flag)
    {
        startScanning(flag, 0);
    }

    void startScanning(boolean flag, int i)
    {
label0:
        {
            if (mAdapter.isDiscovering())
                break label0;
            if (!flag)
            {
                if (0x493e0L + mLastScan > System.currentTimeMillis())
                    break label0;
                A2dpProfile a2dpprofile = mProfileManager.getA2dpProfile();
                if (a2dpprofile != null && a2dpprofile.isA2dpPlaying())
                    break label0;
            }
            if (mAdapter.startDiscovery(i))
            {
                mLastScan = System.currentTimeMillis();
                return;
            }
        }
    }

    void stopScanning()
    {
        if (mAdapter.isDiscovering())
            mAdapter.cancelDiscovery();
    }

    boolean syncBluetoothState()
    {
        if (mAdapter.getState() != mState)
        {
            setBluetoothStateInt(mAdapter.getState());
            return true;
        } else
        {
            return false;
        }
    }
}
