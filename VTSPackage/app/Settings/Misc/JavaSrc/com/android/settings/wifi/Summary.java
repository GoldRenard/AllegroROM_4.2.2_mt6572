// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.content.res.Resources;

class Summary
{


    static String get(Context context, android.net.NetworkInfo.DetailedState detailedstate)
    {
        return get(context, null, detailedstate);
    }

    static String get(Context context, String s, android.net.NetworkInfo.DetailedState detailedstate)
    {
        Resources resources = context.getResources();
        int i;
        if (s == null)
            i = 0x7f070010;
        else
            i = 0x7f070011;
        String as[] = resources.getStringArray(i);
        int j = detailedstate.ordinal();
        if (j < as.length && as[j].length() != 0)
            return String.format(as[j], new Object[] {
                s
            });
        else
            return null;
    }
}
