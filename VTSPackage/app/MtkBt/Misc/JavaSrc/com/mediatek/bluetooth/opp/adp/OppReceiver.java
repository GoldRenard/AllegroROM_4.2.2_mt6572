// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import com.mediatek.bluetooth.opp.mmi.OppLog;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppService

public class OppReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        OppLog.i((new StringBuilder()).append("OppReceiver onReceive: ").append(intent.getAction()).toString());
        String s = intent.getAction();
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
            switch (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000))
            {
            case 12: // '\f'
                if (bluetoothadapter != null && bluetoothadapter.isEnabled())
                {
                    OppLog.i("Receive BluetoothAdapter.STATE_ON, startService");
                    context.startService(new Intent(context, com/mediatek/bluetooth/opp/adp/OppService));
                    return;
                }
                break;
            }
    }
}
