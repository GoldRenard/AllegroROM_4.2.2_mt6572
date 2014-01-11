// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.admin.DeviceAdminReceiver;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.os.IBinder;

public class AdminReceiver extends DeviceAdminReceiver
{


    public DevicePolicyManager getManager(Context context)
    {
        return super.getManager(context);
    }

    public ComponentName getWho(Context context)
    {
        return super.getWho(context);
    }

    public CharSequence onDisableRequested(Context context, Intent intent)
    {
        return super.onDisableRequested(context, intent);
    }

    public void onDisabled(Context context, Intent intent)
    {
        super.onDisabled(context, intent);
    }

    public void onEnabled(Context context, Intent intent)
    {
        super.onEnabled(context, intent);
    }

    public void onReceive(Context context, Intent intent)
    {
        super.onReceive(context, intent);
    }

    public IBinder peekService(Context context, Intent intent)
    {
        return super.peekService(context, intent);
    }
}
