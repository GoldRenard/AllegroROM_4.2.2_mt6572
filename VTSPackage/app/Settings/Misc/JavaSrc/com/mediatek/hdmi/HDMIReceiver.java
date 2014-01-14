// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.hdmi;

import android.content.*;

// Referenced classes of package com.mediatek.hdmi:
//            HDMILocalService

public class HDMIReceiver extends BroadcastReceiver
{

    private static final String ACTION_IPO_BOOT = "android.intent.action.ACTION_BOOT_IPO";
    private static final String ACTION_IPO_SHUTDOWN = "android.intent.action.ACTION_SHUTDOWN_IPO";
    private static final String TAG = "hdmi";


    public void onReceive(Context context, Intent intent)
    {
        intent.getAction();
        new Intent(context, com/mediatek/hdmi/HDMILocalService);
    }
}
