// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.*;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothAdapter

public class BluetoothDiscoverableTimeoutReceiver extends BroadcastReceiver
{

    private static final String INTENT_DISCOVERABLE_TIMEOUT = "android.bluetooth.intent.DISCOVERABLE_TIMEOUT";
    private static final String TAG = "BluetoothDiscoverableTimeoutReceiver";


    static void cancelDiscoverableAlarm(Context context)
    {
        Log.d("BluetoothDiscoverableTimeoutReceiver", "cancelDiscoverableAlarm(): Enter");
        Intent intent = new Intent("android.bluetooth.intent.DISCOVERABLE_TIMEOUT");
        intent.setClass(context, com/android/settings/bluetooth/BluetoothDiscoverableTimeoutReceiver);
        PendingIntent pendingintent = PendingIntent.getBroadcast(context, 0, intent, 0x20000000);
        if (pendingintent != null)
            ((AlarmManager)context.getSystemService("alarm")).cancel(pendingintent);
    }

    static void setDiscoverableAlarm(Context context, long l)
    {
        Log.d("BluetoothDiscoverableTimeoutReceiver", (new StringBuilder()).append("setDiscoverableAlarm(): alarmTime = ").append(l).toString());
        Intent intent = new Intent("android.bluetooth.intent.DISCOVERABLE_TIMEOUT");
        intent.setClass(context, com/android/settings/bluetooth/BluetoothDiscoverableTimeoutReceiver);
        PendingIntent pendingintent = PendingIntent.getBroadcast(context, 0, intent, 0);
        AlarmManager alarmmanager = (AlarmManager)context.getSystemService("alarm");
        if (pendingintent != null)
        {
            alarmmanager.cancel(pendingintent);
            Log.d("BluetoothDiscoverableTimeoutReceiver", "setDiscoverableAlarm(): cancel prev alarm");
        }
        alarmmanager.set(0, l, PendingIntent.getBroadcast(context, 0, intent, 0));
    }

    public void onReceive(Context context, Intent intent)
    {
        LocalBluetoothAdapter localbluetoothadapter = LocalBluetoothAdapter.getInstance();
        if (localbluetoothadapter != null && localbluetoothadapter.getState() == 12)
        {
            Log.d("BluetoothDiscoverableTimeoutReceiver", "Disable discoverable...");
            localbluetoothadapter.setScanMode(21);
            return;
        } else
        {
            Log.e("BluetoothDiscoverableTimeoutReceiver", "localBluetoothAdapter is NULL!!");
            return;
        }
    }
}
