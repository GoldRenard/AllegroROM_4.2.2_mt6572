// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.content.*;

// Referenced classes of package com.android.systemui.recent:
//            RecentTasksLoader

public class RecentsPreloadReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        if ("com.android.systemui.recent.action.PRELOAD".equals(intent.getAction()))
            RecentTasksLoader.getInstance(context).preloadRecentTasksList();
        else
        if ("com.android.systemui.recent.CANCEL_PRELOAD".equals(intent.getAction()))
        {
            RecentTasksLoader.getInstance(context).cancelPreloadingRecentTasksList();
            return;
        }
    }
}
