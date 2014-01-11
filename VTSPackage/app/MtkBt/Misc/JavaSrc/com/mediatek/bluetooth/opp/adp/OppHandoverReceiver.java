// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.net.Uri;
import com.mediatek.bluetooth.BluetoothShareGatewayActivity;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppManager

public class OppHandoverReceiver extends BroadcastReceiver
{

    public static final String TAG = "OppHandoverReceiver";


    public void onReceive(Context context, Intent intent)
    {
        String s;
label0:
        {
            s = intent.getAction();
            if (s.equals("android.btopp.intent.action.WHITELIST_DEVICE"))
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (bluetoothdevice != null)
                {
                    Xlog.d("OppHandoverReceiver", (new StringBuilder()).append("add new device into white list:").append(bluetoothdevice.getAddress()).toString());
                    OppManager.getInstance(context).addToWhitelist(bluetoothdevice.getAddress());
                }
            } else
            {
                if (!s.equals("android.btopp.intent.action.STOP_HANDOVER_TRANSFER"))
                    break label0;
                int i = intent.getIntExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_ID", -1);
                if (i == -1)
                {
                    Uri uri = Uri.parse((new StringBuilder()).append(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI).append("/").append(i).toString());
                    OppManager.getInstance(context).oppAbortTask(uri);
                    return;
                }
            }
            return;
        }
        if (!"android.btopp.intent.action.HANDOVER_SEND".equals(s) && !"android.btopp.intent.action.HANDOVER_SEND_MULTIPLE".equals(s))
        {
            Xlog.d("OppHandoverReceiver", (new StringBuilder()).append("Unknown action: ").append(s).toString());
            return;
        } else
        {
            intent.setClassName("com.mediatek.bluetooth", com/mediatek/bluetooth/BluetoothShareGatewayActivity.getName());
            intent.addFlags(0x10000000);
            context.startActivity(intent);
            return;
        }
    }
}
