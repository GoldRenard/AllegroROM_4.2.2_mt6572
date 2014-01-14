// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.Service;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.PowerManager;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            DockService

public final class DockEventReceiver extends BroadcastReceiver
{

    public static final String ACTION_DOCK_SHOW_UI = "com.android.settings.bluetooth.action.DOCK_SHOW_UI";
    private static final boolean DEBUG = false;
    private static final int EXTRA_INVALID = -1234;
    private static final String TAG = "DockEventReceiver";
    private static android.os.PowerManager.WakeLock sStartingService;
    private static final Object sStartingServiceSync = new Object();


    private static void beginStartingService(Context context, Intent intent)
    {
        synchronized (sStartingServiceSync)
        {
            if (sStartingService == null)
                sStartingService = ((PowerManager)context.getSystemService("power")).newWakeLock(1, "StartingDockService");
            sStartingService.acquire();
            if (context.startService(intent) == null)
                Log.e("DockEventReceiver", "Can't start DockService");
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static void finishStartingService(Service service, int i)
    {
        synchronized (sStartingServiceSync)
        {
            if (sStartingService != null && service.stopSelfResult(i))
            {
                Log.d("DockEventReceiver", "finishStartingService: stopping service");
                sStartingService.release();
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onReceive(Context context, Intent intent)
    {
        if (intent != null)
        {
            int i = intent.getIntExtra("android.intent.extra.DOCK_STATE", intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1234));
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (!"android.intent.action.DOCK_EVENT".equals(intent.getAction()) && !"com.android.settings.bluetooth.action.DOCK_SHOW_UI".endsWith(intent.getAction()))
            {
                if (!"android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction()) && !"android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction()))
                {
                    if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) != 11)
                    {
                        Intent intent3 = new Intent(intent);
                        intent3.setClass(context, com/android/settings/bluetooth/DockService);
                        beginStartingService(context, intent3);
                        return;
                    }
                } else
                {
                    int j = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 2);
                    int k = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
                    if (bluetoothdevice != null && j == 0 && k != 3)
                    {
                        Intent intent2 = new Intent(intent);
                        intent2.setClass(context, com/android/settings/bluetooth/DockService);
                        beginStartingService(context, intent2);
                        return;
                    }
                }
            } else
            if (bluetoothdevice != null || !"com.android.settings.bluetooth.action.DOCK_SHOW_UI".endsWith(intent.getAction()) && (i == 0 || i == 3))
            {
                switch (i)
                {
                case 0: // '\0'
                case 1: // '\001'
                case 2: // '\002'
                case 3: // '\003'
                case 4: // '\004'
                    Intent intent1 = new Intent(intent);
                    intent1.setClass(context, com/android/settings/bluetooth/DockService);
                    beginStartingService(context, intent1);
                    return;
                }
                Log.e("DockEventReceiver", (new StringBuilder()).append("Unknown state: ").append(i).toString());
                return;
            }
        }
    }

}
