// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.*;
import android.util.Log;
import android.widget.Toast;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            BluetoothAvrcpService

public class BluetoothAvrcpReceiver extends BroadcastReceiver
{

    public static final String TAG = "AVRCP";
    public static BluetoothAvrcpService sAvrcpServer = null;
    private int mNativeData;


    public void destroyMyself(BluetoothAvrcpService bluetoothavrcpservice)
    {
        if (bluetoothavrcpservice == sAvrcpServer)
            Log.v("AVRCP", "destroyMyself");
    }

    public void initalConnect(String s)
    {
        if (sAvrcpServer != null)
        {
            Log.v("AVRCP", "AVRCP initConnect connectReqNative used!");
            sAvrcpServer.connectReqNative(s);
            return;
        } else
        {
            Log.v("AVRCP", "AVRCP initConnect fail !!! no mAvrcpServer");
            return;
        }
    }

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Log.v("AVRCP", "[BT][AVRCP] onReceive ".concat(s));
        if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
        {
            int i = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
            if (12 == i || 10 == i)
            {
                Intent intent1 = new Intent();
                intent1.putExtras(intent);
                intent1.setClass(context, com/mediatek/bluetooth/avrcp/BluetoothAvrcpService);
                intent1.putExtra("action", s);
                context.startService(intent1);
            }
        }
        if (s.equals("android.provider.Telephony.SECRET_CODE"))
        {
            String s1 = intent.getDataString();
            Log.v("AVRCP", (new StringBuilder()).append("[BT][AVRCP] Get the securty code (").append(s.toString()).append(")").toString());
            if (s1 != null)
                Log.v("AVRCP", (new StringBuilder()).append("[BT][AVRCP] Get the securty code data: (").append(s1).append(")").toString());
            String s2 = "AVRCP PTS enable mode (Source:Telephone)";
            if (s1 != null && s1.indexOf("2872710") != -1)
            {
                initalConnect("00:00:00:00:00:00");
                s2 = "AVRCP PTS connect mode (Source:Telephone)";
            } else
            {
                BluetoothAvrcpService.sPTSDebugMode = 3;
            }
            Toast.makeText(context, s2, 0).show();
        }
        if (s.equals("android.mediatek.bluetooth.avrcp.pts"))
        {
            Log.v("AVRCP", "Get the avrcp.pts code");
            BluetoothAvrcpService.sPTSDebugMode = 3;
            Toast.makeText(context, "AVRCP PTS enable mode (Source:pts action)", 0).show();
        }
        if (s.equals("android.mediatek.bluetooth.avrcp.connect"))
        {
            Log.v("AVRCP", "Get the avrcp.connect code");
            Toast.makeText(context, "AVRCP PTS connect (Source: action)", 0).show();
            initalConnect("00:00:00:00:00:00");
        }
        if (s.equals("android.mediatek.bluetooth.avrcp.disconnect"))
        {
            Log.v("AVRCP", "Get the avrcp.disconnect code");
            if (sAvrcpServer != null)
            {
                Toast.makeText(context, "AVRCP PTS disconnect (Source: action)", 0).show();
                sAvrcpServer.disconnectNative();
            }
        }
    }

}
