// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.QueuedWork;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import java.util.concurrent.ExecutorService;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, LocalBluetoothAdapter

final class LocalBluetoothPreferences
{

    private static final int GRACE_PERIOD_TO_SHOW_DIALOGS_IN_FOREGROUND = 60000;
    private static final String KEY_DISCOVERABLE_END_TIMESTAMP = "discoverable_end_timestamp";
    private static final String KEY_DISCOVERING_TIMESTAMP = "last_discovering_time";
    private static final String KEY_DOCK_AUTO_CONNECT = "auto_connect_to_dock";
    private static final String KEY_LAST_SELECTED_DEVICE = "last_selected_device";
    private static final String KEY_LAST_SELECTED_DEVICE_TIME = "last_selected_device_time";
    private static final String SHARED_PREFERENCES_NAME = "bluetooth_settings";

    private LocalBluetoothPreferences()
    {
    }

    static long getDiscoverableEndTimestamp(Context context)
    {
        return getSharedPreferences(context).getLong("discoverable_end_timestamp", 0L);
    }

    static boolean getDockAutoConnectSetting(Context context, String s)
    {
        return getSharedPreferences(context).getBoolean((new StringBuilder()).append("auto_connect_to_dock").append(s).toString(), false);
    }

    private static SharedPreferences getSharedPreferences(Context context)
    {
        return context.getSharedPreferences("bluetooth_settings", 0);
    }

    static boolean hasDockAutoConnectSetting(Context context, String s)
    {
        return getSharedPreferences(context).contains((new StringBuilder()).append("auto_connect_to_dock").append(s).toString());
    }

    static void persistDiscoverableEndTimestamp(Context context, long l)
    {
        android.content.SharedPreferences.Editor editor = getSharedPreferences(context).edit();
        editor.putLong("discoverable_end_timestamp", l);
        editor.apply();
    }

    static void persistDiscoveringTimestamp(Context context)
    {
        QueuedWork.singleThreadExecutor().submit(new Runnable(context) {

            final Context val$context;

            public void run()
            {
                android.content.SharedPreferences.Editor editor = LocalBluetoothPreferences.getSharedPreferences(context).edit();
                editor.putLong("last_discovering_time", System.currentTimeMillis());
                editor.apply();
            }

            
            {
                context = context1;
                super();
            }
        }
);
    }

    static void persistSelectedDeviceInPicker(Context context, String s)
    {
        android.content.SharedPreferences.Editor editor = getSharedPreferences(context).edit();
        editor.putString("last_selected_device", s);
        editor.putLong("last_selected_device_time", System.currentTimeMillis());
        editor.apply();
    }

    static void removeDockAutoConnectSetting(Context context, String s)
    {
        android.content.SharedPreferences.Editor editor = getSharedPreferences(context).edit();
        editor.remove((new StringBuilder()).append("auto_connect_to_dock").append(s).toString());
        editor.apply();
    }

    static void saveDockAutoConnectSetting(Context context, String s, boolean flag)
    {
        android.content.SharedPreferences.Editor editor = getSharedPreferences(context).edit();
        editor.putBoolean((new StringBuilder()).append("auto_connect_to_dock").append(s).toString(), flag);
        editor.apply();
    }

    static boolean shouldShowDialogInForeground(Context context, String s)
    {
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(context);
        if (localbluetoothmanager == null)
            return false;
        if (localbluetoothmanager.isForegroundActivity())
            return true;
        if ((5 & context.getResources().getConfiguration().uiMode) == 5)
            return false;
        long l = System.currentTimeMillis();
        SharedPreferences sharedpreferences = getSharedPreferences(context);
        if (60000L + sharedpreferences.getLong("discoverable_end_timestamp", 0L) > l)
            return true;
        LocalBluetoothAdapter localbluetoothadapter = localbluetoothmanager.getBluetoothAdapter();
        if (localbluetoothadapter != null && localbluetoothadapter.isDiscovering())
            return true;
        if (60000L + sharedpreferences.getLong("last_discovering_time", 0L) > l)
            return true;
        return s != null && s.equals(sharedpreferences.getString("last_selected_device", null)) && 60000L + sharedpreferences.getLong("last_selected_device_time", 0L) > l;
    }

}
