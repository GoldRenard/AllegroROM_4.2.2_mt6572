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
//            LocalBluetoothProfile, Utils, LocalBluetoothProfileManager

final class A2dpProfile
    implements LocalBluetoothProfile
{
    private final class A2dpServiceListener
        implements android.bluetooth.BluetoothProfile.ServiceListener
    {

        final A2dpProfile this$0;

        public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
        {
            if (A2dpProfile.V)
                Log.d("A2dpProfile", "Bluetooth service connected");
            mService = (BluetoothA2dp)bluetoothprofile;
            mIsProfileReady = true;
        }

        public void onServiceDisconnected(int i)
        {
            if (A2dpProfile.V)
                Log.d("A2dpProfile", "Bluetooth service disconnected");
            mIsProfileReady = false;
        }

        private A2dpServiceListener()
        {
            this$0 = A2dpProfile.this;
            super();
        }

    }


    static final String NAME = "A2DP";
    private static final int ORDINAL = 1;
    static final ParcelUuid SINK_UUIDS[];
    private static final String TAG = "A2dpProfile";
    private static boolean V = true;
    private boolean mIsProfileReady;
    private final LocalBluetoothProfileManager mProfileManager;
    private BluetoothA2dp mService;

    A2dpProfile(Context context, LocalBluetoothProfileManager localbluetoothprofilemanager)
    {
        mProfileManager = localbluetoothprofilemanager;
        BluetoothAdapter.getDefaultAdapter().getProfileProxy(context, new A2dpServiceListener(), 2);
    }

    public boolean connect(BluetoothDevice bluetoothdevice)
    {
        if (mService == null)
            return false;
        List list = getConnectedDevices();
        if (list != null)
        {
            if (list.contains(bluetoothdevice))
            {
                Log.d("A2dpProfile", "Device is already in the connected list, just return true");
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
        if (mService.getPriority(bluetoothdevice) > 100)
            mService.setPriority(bluetoothdevice, 100);
        return mService.disconnect(bluetoothdevice);
    }

    protected void finalize()
    {
        if (V)
            Log.d("A2dpProfile", "finalize()");
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        BluetoothAdapter.getDefaultAdapter().closeProfileProxy(2, mService);
        mService = null;
        return;
        Throwable throwable;
        throwable;
        Log.w("A2dpProfile", "Error cleaning up A2DP proxy", throwable);
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
        else
            return mService.getConnectionState(bluetoothdevice);
    }

    public int getDrawableResource(BluetoothClass bluetoothclass)
    {
        return 0x7f020054;
    }

    public int getNameResource(BluetoothDevice bluetoothdevice)
    {
        return 0x7f0b03ef;
    }

    public int getOrdinal()
    {
        return 1;
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
            return 0x7f0b0400;

        case 0: // '\0'
            return 0x7f0b0407;

        case 1: // '\001'
        default:
            return Utils.getConnectionStateSummary(i);
        }
    }

    boolean isA2dpPlaying()
    {
        if (mService == null)
            return false;
        List list = mService.getConnectedDevices();
        return !list.isEmpty() && mService.isA2dpPlaying((BluetoothDevice)list.get(0));
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
        return "A2DP";
    }

    static 
    {
        ParcelUuid aparceluuid[] = new ParcelUuid[2];
        aparceluuid[0] = BluetoothUuid.AudioSink;
        aparceluuid[1] = BluetoothUuid.AdvAudioDist;
        SINK_UUIDS = aparceluuid;
    }



/*
    static BluetoothA2dp access$102(A2dpProfile a2dpprofile, BluetoothA2dp bluetootha2dp)
    {
        a2dpprofile.mService = bluetootha2dp;
        return bluetootha2dp;
    }

*/


/*
    static boolean access$202(A2dpProfile a2dpprofile, boolean flag)
    {
        a2dpprofile.mIsProfileReady = flag;
        return flag;
    }

*/
}
