// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.content.Context;

public class Utils
{

    private static final int SECONDS_PER_DAY = 0x15180;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;


    public static String formatElapsedTime(Context context, double d)
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = (int)Math.floor(d / 1000D);
        int j = 0;
        if (i > 0x15180)
        {
            j = i / 0x15180;
            i -= j * 0x15180;
        }
        int k = 0;
        if (i > 3600)
        {
            k = i / 3600;
            i -= k * 3600;
        }
        int l = 0;
        if (i > 60)
        {
            l = i / 60;
            i -= l * 60;
        }
        if (j > 0)
        {
            Object aobj3[] = new Object[4];
            aobj3[0] = Integer.valueOf(j);
            aobj3[1] = Integer.valueOf(k);
            aobj3[2] = Integer.valueOf(l);
            aobj3[3] = Integer.valueOf(i);
            stringbuilder.append(context.getString(0x7f0b0720, aobj3));
        } else
        if (k > 0)
        {
            Object aobj2[] = new Object[3];
            aobj2[0] = Integer.valueOf(k);
            aobj2[1] = Integer.valueOf(l);
            aobj2[2] = Integer.valueOf(i);
            stringbuilder.append(context.getString(0x7f0b0721, aobj2));
        } else
        if (l > 0)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = Integer.valueOf(l);
            aobj1[1] = Integer.valueOf(i);
            stringbuilder.append(context.getString(0x7f0b0722, aobj1));
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            stringbuilder.append(context.getString(0x7f0b0723, aobj));
        }
        return stringbuilder.toString();
    }
}
