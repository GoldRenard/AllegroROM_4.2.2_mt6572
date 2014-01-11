// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.os.*;
import android.util.Log;
import com.mediatek.xlog.Xlog;

public class BluetoothTethering extends android.net.INetworkManagementEventObserver.Stub
{

    public static final String BLUETOOTH_INTERFACE_ADDED = "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_ADDED";
    public static final String BLUETOOTH_INTERFACE_NAME = "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_NAME";
    private static final String TAG = "BluetoothTethering";
    private static BluetoothTethering sBtTethering = null;
    private static boolean sBtTetheringRegistered = false;
    private Context mContext;
    private INetworkManagementService mNetworkManagementService;
    private String mTetherableBTRegexs[];

    private BluetoothTethering()
    {
        Xlog.d("BluetoothTethering", "Tethering starting");
    }

    public static BluetoothTethering getBluetoothTetheringInstance()
    {
        if (sBtTethering == null)
        {
            sBtTethering = new BluetoothTethering();
            return sBtTethering;
        } else
        {
            return sBtTethering;
        }
    }

    private boolean isBT(String s)
    {
        String as[] = mTetherableBTRegexs;
        int i = as.length;
        for (int j = 0; j < i; j++)
            if (s.matches(as[j]))
                return true;

        return false;
    }

    public void interfaceAdded(String s)
    {
        Log.d("BluetoothTethering", (new StringBuilder()).append("interfaceAdded, iface: ").append(s).toString());
        if (!isBT(s))
        {
            return;
        } else
        {
            Xlog.d("BluetoothTethering", (new StringBuilder()).append("interfaceAdded :").append(s).toString());
            Intent intent = new Intent("android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_ADDED");
            intent.addFlags(0x10000000);
            intent.putExtra("android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_NAME", s);
            mContext.sendBroadcast(intent);
            return;
        }
    }

    public void interfaceClassDataActivityChanged(String s, boolean flag)
    {
    }

    public void interfaceLinkStateChanged(String s, boolean flag)
    {
    }

    public void interfaceRemoved(String s)
    {
    }

    public void interfaceStatusChanged(String s, boolean flag)
    {
    }

    public void interfaceStatusChangedIpv6(String s, boolean flag)
    {
    }

    public void limitReached(String s, String s1)
    {
    }

    public void registerBTTether(Context context)
    {
label0:
        {
            if (!sBtTetheringRegistered)
            {
                Xlog.d("BluetoothTethering", "BluetoothTethering setContext");
                mContext = context;
                mNetworkManagementService = android.os.INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
                if (mNetworkManagementService != null)
                    break label0;
                Xlog.e("BluetoothTethering", "Error get INetworkManagementService");
            }
            return;
        }
        try
        {
            mNetworkManagementService.registerObserver(this);
        }
        catch (RemoteException remoteexception)
        {
            Xlog.e("BluetoothTethering", (new StringBuilder()).append("Error registering observer :").append(remoteexception).toString());
        }
        mTetherableBTRegexs = ((ConnectivityManager)mContext.getSystemService("connectivity")).getTetherableBluetoothRegexs();
        Log.d("BluetoothTethering", (new StringBuilder()).append("registerBTTether bt regexs: ").append(mTetherableBTRegexs[0]).toString());
        sBtTetheringRegistered = true;
    }

    public void unregisterBTTether()
    {
        if (sBtTetheringRegistered)
        {
            Xlog.d("BluetoothTethering", "unregister Bluetooth Tether");
            try
            {
                mNetworkManagementService.unregisterObserver(this);
            }
            catch (RemoteException remoteexception)
            {
                Log.e("BluetoothTethering", (new StringBuilder()).append("Error registering observer :").append(remoteexception).toString());
            }
            sBtTetheringRegistered = false;
        }
    }

}
