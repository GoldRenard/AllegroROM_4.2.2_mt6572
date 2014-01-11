// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.util.Log;
import android.view.Window;

public class Profiler
{

    private static final String LOG_TAG = "PhoneGlobals";
    private static final boolean PROFILE;
    static long sTimeCallScreenCreated;
    static long sTimeCallScreenOnCreate;
    static long sTimeCallScreenRequested;
    static long sTimeIncomingCallPanelCreated;
    static long sTimeIncomingCallPanelOnCreate;
    static long sTimeIncomingCallPanelRequested;

    private Profiler()
    {
    }

    static void callScreenCreated()
    {
    }

    static void callScreenOnCreate()
    {
    }

    static void callScreenRequested()
    {
    }

    private static void dumpCallScreenStat()
    {
    }

    private static void dumpIncomingCallPanelStat()
    {
    }

    static void incomingCallPanelCreated()
    {
    }

    static void incomingCallPanelOnCreate()
    {
    }

    static void incomingCallPanelRequested()
    {
    }

    private static void log(String s)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("[Profiler] ").append(s).toString());
    }

    static void profileViewCreate(Window window, String s)
    {
    }
}
