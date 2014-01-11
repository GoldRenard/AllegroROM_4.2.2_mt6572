// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.MessageLogger;
import android.util.Printer;

public final class ANRAppManager
{

    private static ANRAppManager a = null;
    private static boolean b;

    private ANRAppManager()
    {
    }

    public static String dumpMessageHistory()
    {
        return MessageLogger.dump();
    }

    public static ANRAppManager getDefault()
    {
        if (a == null)
            a = new ANRAppManager();
        return a;
    }

    public Printer newMessageLogger(boolean flag)
    {
        b = flag;
        return new MessageLogger();
    }

}
