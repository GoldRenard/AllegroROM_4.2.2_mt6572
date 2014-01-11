// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.provider.Telephony;
import android.util.Log;

public class Utils
{

    static final int TYPE_GPRS = 4;
    static final int TYPE_SMS = 3;
    static final int TYPE_VIDEOCALL = 2;
    static final int TYPE_VOICECALL = 1;
    static boolean sSupport3G = false;


    public static int getSimColorResource(int i)
    {
        if (i >= 0 && i <= 7)
            return Telephony.SIMBackgroundDarkRes[i];
        else
            return -1;
    }

    public static int getStatusResource(int i)
    {
        Log.i("Utils gemini", (new StringBuilder()).append("!!!!!!!!!!!!!state is ").append(i).toString());
        switch (i)
        {
        case 8: // '\b'
            return 0x2020118;

        case 7: // '\007'
            return 0x20200ef;

        case 6: // '\006'
            return 0x2020117;

        case 4: // '\004'
            return 0x2020119;

        case 3: // '\003'
            return 0x20200f8;

        case 2: // '\002'
            return 0x20200ff;

        case 1: // '\001'
            return 0x2020112;

        case 5: // '\005'
        default:
            return -1;
        }
    }

}
