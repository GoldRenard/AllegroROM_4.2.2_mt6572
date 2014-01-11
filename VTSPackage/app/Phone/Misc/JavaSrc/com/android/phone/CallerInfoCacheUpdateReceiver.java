// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.os.SystemProperties;
import android.util.Log;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, CallerInfoCache

public class CallerInfoCacheUpdateReceiver extends BroadcastReceiver
{

    public static final String ACTION_UPDATE_CALLER_INFO_CACHE = "com.android.phone.UPDATE_CALLER_INFO_CACHE";
    private static final boolean DBG;
    private static final String LOG_TAG = com/android/phone/CallerInfoCacheUpdateReceiver.getSimpleName();


    private static void log(String s)
    {
        Log.d(LOG_TAG, s);
    }

    public void onReceive(Context context, Intent intent)
    {
        if (DBG)
            log((new StringBuilder()).append("CallerInfoCacheUpdateReceiver#onReceive(). Intent: ").append(intent).toString());
        PhoneGlobals.getInstance().callerInfoCache.startAsyncCache();
    }

    static 
    {
        boolean flag = true;
        if (SystemProperties.getInt("ro.debuggable", 0) != flag)
            flag = false;
        DBG = flag;
    }
}
