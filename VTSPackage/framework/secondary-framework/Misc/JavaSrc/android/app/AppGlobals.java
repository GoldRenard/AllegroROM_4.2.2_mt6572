// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.pm.IPackageManager;

// Referenced classes of package android.app:
//            ActivityThread, Application

public class AppGlobals
{


    public static Application getInitialApplication()
    {
        return ActivityThread.currentApplication();
    }

    public static String getInitialPackage()
    {
        return ActivityThread.currentPackageName();
    }

    public static int getIntCoreSetting(String s, int i)
    {
        ActivityThread activitythread = ActivityThread.currentActivityThread();
        if (activitythread != null)
            i = activitythread.getIntCoreSetting(s, i);
        return i;
    }

    public static IPackageManager getPackageManager()
    {
        return ActivityThread.getPackageManager();
    }
}
