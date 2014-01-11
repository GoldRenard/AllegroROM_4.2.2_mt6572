// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.provider.Telephony;
import java.util.Comparator;

public class GeminiUtils
{
    public static class SIMInfoComparable
        implements Comparator
    {

        public int compare(android.provider.Telephony.SIMInfo siminfo, android.provider.Telephony.SIMInfo siminfo1)
        {
            return siminfo.mSlot - siminfo1.mSlot;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((android.provider.Telephony.SIMInfo)obj, (android.provider.Telephony.SIMInfo)obj1);
        }

    }


    private static final int COLORNUM = 7;
    static final String EXTRA_SIMID = "simid";
    static final int IMAGE_GRAY = 75;
    static final int INTERNET_CALL_COLOR = 8;
    static final int NO_COLOR = -1;
    static final int ORIGINAL_IMAGE = 255;
    static final int TYPE_GPRS = 4;
    static final int TYPE_SMS = 3;
    static final int TYPE_VIDEOCALL = 2;
    static final int TYPE_VOICECALL = 1;
    static int sG3SlotID = 0;


    static int getSimColorResource(int i)
    {
        if (i >= 0 && i <= 7)
            return Telephony.SIMBackgroundDarkRes[i];
        else
            return -1;
    }

    static int getStatusResource(int i)
    {
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
