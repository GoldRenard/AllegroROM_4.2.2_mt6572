// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.Bundle;
import com.mediatek.bluetooth.share.BluetoothShareMgmtActivity;
import com.mediatek.xlog.Xlog;

public class BluetoothShareGatewayReceiver extends BroadcastReceiver
{

    private static final String ACTION_OPEN_RECEIVED_FILES = "android.btopp.intent.action.OPEN_RECEIVED_FILES";
    private static final String ACTION_SEND_BIP_FILES = "com.mediatek.bluetooth.sharegateway.action.ACTION_SEND_BIP_FILES";
    private static final String TAG = "BluetoothShareGatewayReceiver";
    private static boolean sBip;
    private static Intent sIntent;
    private static String sType;


    private void profileDispatcher(Context context, BluetoothDevice bluetoothdevice)
    {
        sIntent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        bluetoothdevice.getUuids();
        Xlog.v("BluetoothShareGatewayReceiver", "OPP is supported");
        sIntent.setClassName("com.mediatek.bluetooth", "com.mediatek.bluetooth.opp.mmi.OppClientActivity");
        sIntent.setFlags(0x10000000);
        context.startActivity(sIntent);
    }

    public void onReceive(Context context, Intent intent)
    {
        Xlog.v("BluetoothShareGatewayReceiver", "BSG broadcast receiver receives intent");
        String s = intent.getAction();
        if (s.equals("android.bluetooth.devicepicker.action.DEVICE_SELECTED"))
        {
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            Xlog.v("BluetoothShareGatewayReceiver", (new StringBuilder()).append("Received BT device selected intent, bt device: ").append(bluetoothdevice).toString());
            if (bluetoothdevice != null)
                profileDispatcher(context, bluetoothdevice);
        } else
        {
            if (s.equals("android.btopp.intent.action.OPEN_RECEIVED_FILES"))
            {
                Intent intent1 = new Intent(context, com/mediatek/bluetooth/share/BluetoothShareMgmtActivity);
                intent1.setFlags(0x14000000);
                context.startActivity(intent1);
                return;
            }
            if (s.equals("com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS"))
            {
                Bundle bundle = intent.getExtras();
                if (bundle != null)
                {
                    sType = bundle.getString("Type");
                    sBip = bundle.getBoolean("BipFlag", false);
                    sIntent = (Intent)bundle.getParcelable("Intent");
                    if (sIntent == null)
                        Xlog.v("BluetoothShareGatewayReceiver", "sIntent == null");
                }
                Xlog.v("BluetoothShareGatewayReceiver", (new StringBuilder()).append("sType = ").append(sType).append("; sBip = ").append(sBip).toString());
                return;
            }
        }
    }
}
