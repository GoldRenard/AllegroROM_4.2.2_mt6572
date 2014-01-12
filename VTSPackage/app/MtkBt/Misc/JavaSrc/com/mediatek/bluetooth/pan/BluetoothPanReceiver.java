// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.pan;

import android.content.*;

// Referenced classes of package com.mediatek.bluetooth.pan:
//            BluetoothPanService

public class BluetoothPanReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        if (intent.getAction().equals("android.bluetooth.adapter.action.STATE_CHANGED") && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 12)
            context.startService(new Intent(context, com/mediatek/bluetooth/pan/BluetoothPanService));
    }
}
