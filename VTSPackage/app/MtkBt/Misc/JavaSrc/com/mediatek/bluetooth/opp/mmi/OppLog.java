// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.util.Log;

public class OppLog
{

    private static final boolean DEVELOPMENT = false;
    private static final String TAG = "Bluetooth.OPP";


    public static void d(String s)
    {
        Log.println(3, "Bluetooth.OPP", s);
    }

    public static void e(String s)
    {
        Log.println(6, "Bluetooth.OPP", s);
    }

    public static void i(String s)
    {
        Log.println(4, "Bluetooth.OPP", s);
    }

    public static void w(String s)
    {
        Log.println(5, "Bluetooth.OPP", s);
    }
}
