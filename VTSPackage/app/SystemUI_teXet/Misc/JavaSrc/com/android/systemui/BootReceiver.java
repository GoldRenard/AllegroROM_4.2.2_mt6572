// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.content.*;
import android.util.Slog;

// Referenced classes of package com.android.systemui:
//            LoadAverageService

public class BootReceiver extends BroadcastReceiver
{

    private static final String TAG = "SystemUIBootReceiver";


    public void onReceive(Context context, Intent intent)
    {
        try
        {
            if (android.provider.Settings.Global.getInt(context.getContentResolver(), "show_processes", 0) != 0)
                context.startService(new Intent(context, com/android/systemui/LoadAverageService));
            return;
        }
        catch (Exception exception)
        {
            Slog.e("SystemUIBootReceiver", "Can't start load average service", exception);
        }
    }
}
