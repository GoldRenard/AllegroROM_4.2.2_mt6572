// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import com.mediatek.bluetooth.opp.mmi.OppLog;
import com.mediatek.bluetooth.share.BluetoothShareTask;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            BluetoothOppClientImpl, BluetoothOppServerImpl

public class BluetoothOppService extends Service
{

    public static final int STATE_ABNORMAL = 14;
    public static final int STATE_DISABLED = 13;
    public static final int STATE_ENABLED = 11;
    public static final int STATE_ENABLING = 10;
    private BluetoothOppClientImpl mOppClient;
    private BluetoothOppServerImpl mOppServer;

    public BluetoothOppService()
    {
        mOppClient = null;
        mOppServer = null;
    }

    private void initOppClient()
    {
        this;
        JVM INSTR monitorenter ;
        if (mOppClient == null)
            mOppClient = new BluetoothOppClientImpl(this);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void initOppServer()
    {
        this;
        JVM INSTR monitorenter ;
        if (mOppServer == null)
            mOppServer = new BluetoothOppServerImpl(this);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public static void sendActivationBroadcast(Context context, boolean flag, int i)
    {
        android.bluetooth.BluetoothProfileManager.Profile profile;
        if (flag)
            profile = android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_OPP_Client;
        else
            profile = android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_OPP_Server;
        Intent intent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", profile);
        intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", i);
        context.sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    public static void sendStateChangedBroadcast(Context context, BluetoothShareTask bluetoothsharetask, boolean flag)
    {
        Intent intent = new Intent("android.bluetooth.profilemanager.action.STATE_CHANGED");
        if (bluetoothsharetask.isOppcTask())
            intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_OPP_Client);
        else
            intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_OPP_Server);
        if (flag)
        {
            intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 1);
            intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_PREVIOUS_STATE", 2);
        } else
        {
            intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 2);
            intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_PREVIOUS_STATE", 1);
        }
        intent.putExtra("android.bluetooth.device.extra.DEVICE", BluetoothAdapter.getDefaultAdapter().getRemoteDevice(bluetoothsharetask.getPeerAddr()));
        context.sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    public IBinder onBind(Intent intent)
    {
        String s = intent.getAction();
        OppLog.i((new StringBuilder()).append("BluetoothOppService.onBind()[+]: ").append(s).toString());
        if (android/bluetooth/BluetoothOpp$Client.getName().replaceAll("\\$", ".").equals(s))
        {
            if (mOppClient == null)
                initOppClient();
            return mOppClient;
        }
        if (android/bluetooth/BluetoothOpp$Server.getName().replaceAll("\\$", ".").equals(s))
        {
            if (mOppServer == null)
                initOppServer();
            return mOppServer;
        } else
        {
            return null;
        }
    }
}
