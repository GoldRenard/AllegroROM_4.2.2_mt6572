// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;

import android.app.Application;
import android.content.IntentFilter;
import com.mediatek.bluetooth.util.BtLog;

// Referenced classes of package com.mediatek.bluetooth:
//            BluetoothReceiver

public class BluetoothApplication extends Application
{

    private static final String TAG = "BluetoothApplication";
    private BluetoothReceiver mReceiver;


    public void onCreate()
    {
        super.onCreate();
        BtLog.d("BluetoothApplication.onCreate");
        mReceiver = new BluetoothReceiver();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.MEDIA_EJECT");
        intentfilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentfilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentfilter.addDataScheme("file");
        registerReceiver(mReceiver, intentfilter);
    }

    public void onTerminate()
    {
        super.onTerminate();
        BtLog.d("BluetoothApplication.onTerminate");
        unregisterReceiver(mReceiver);
    }
}
