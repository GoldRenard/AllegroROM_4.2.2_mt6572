// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.util.EventLog;

public class EventLogTags
{

    public static final int PHONE_UI_BUTTON_CLICK = 0x1129f;
    public static final int PHONE_UI_ENTER = 0x1129d;
    public static final int PHONE_UI_EXIT = 0x1129e;
    public static final int PHONE_UI_MULTIPLE_QUERY = 0x112a1;
    public static final int PHONE_UI_RINGER_QUERY_ELAPSED = 0x112a0;

    private EventLogTags()
    {
    }

    public static void writePhoneUiButtonClick(String s)
    {
        EventLog.writeEvent(0x1129f, s);
    }

    public static void writePhoneUiEnter()
    {
        EventLog.writeEvent(0x1129d, new Object[0]);
    }

    public static void writePhoneUiExit()
    {
        EventLog.writeEvent(0x1129e, new Object[0]);
    }

    public static void writePhoneUiMultipleQuery()
    {
        EventLog.writeEvent(0x112a1, new Object[0]);
    }

    public static void writePhoneUiRingerQueryElapsed()
    {
        EventLog.writeEvent(0x112a0, new Object[0]);
    }
}
