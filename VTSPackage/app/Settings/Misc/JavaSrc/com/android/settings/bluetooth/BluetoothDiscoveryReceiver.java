// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.content.*;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothPreferences

public final class BluetoothDiscoveryReceiver extends BroadcastReceiver
{

    private static final String TAG = "BluetoothDiscoveryReceiver";


    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Log.v("BluetoothDiscoveryReceiver", (new StringBuilder()).append("Received: ").append(s).toString());
        if (s.equals("android.bluetooth.adapter.action.DISCOVERY_STARTED") || s.equals("android.bluetooth.adapter.action.DISCOVERY_FINISHED"))
            LocalBluetoothPreferences.persistDiscoveringTimestamp(context);
    }
}
