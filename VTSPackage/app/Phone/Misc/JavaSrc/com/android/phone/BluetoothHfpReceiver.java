// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.util.Log;

// Referenced classes of package com.android.phone:
//            BluetoothHeadsetService

public class BluetoothHfpReceiver extends BroadcastReceiver
{

    private static final String TAG = "BluetoothHfpReceiver";
    private static final boolean debug = true;


    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Log.d("BluetoothHfpReceiver", (new StringBuilder()).append("onReceive: action=").append(s).toString());
        if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
        {
            if (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 11)
                context.startService(new Intent(context, com/android/phone/BluetoothHeadsetService));
        } else
        if (s.equals("android.intent.action.BOOT_COMPLETED") && BluetoothAdapter.getDefaultAdapter() != null)
        {
            context.startService(new Intent(context, com/android/phone/BluetoothHeadsetService));
            return;
        }
    }
}
