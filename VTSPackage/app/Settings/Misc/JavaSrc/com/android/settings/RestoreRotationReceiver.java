// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.util.Log;

public class RestoreRotationReceiver extends BroadcastReceiver
{

    public static boolean sRestoreRetore = false;


    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Log.v("RestoreRotationReceiver_IPO", s);
        if (s.equals("android.intent.action.BOOT_COMPLETED") || s.equals("android.intent.action.ACTION_BOOT_IPO"))
        {
            boolean flag;
            if (android.provider.Settings.System.getInt(context.getContentResolver(), "accelerometer_rotation_restore", 0) != 0)
                flag = true;
            else
                flag = false;
            sRestoreRetore = flag;
            if (sRestoreRetore)
            {
                android.provider.Settings.System.putInt(context.getContentResolver(), "accelerometer_rotation", 1);
                android.provider.Settings.System.putInt(context.getContentResolver(), "accelerometer_rotation_restore", 0);
            }
        }
    }

}
