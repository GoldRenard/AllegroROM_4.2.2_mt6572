// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.util.Log;

public final class PhoneLog
{

    private static final String TAG = "Phone";

    private PhoneLog()
    {
    }

    public static void d(String s, String s1)
    {
        Log.d("Phone", (new StringBuilder()).append(s).append("/").append(s1).toString());
    }

    public static void e(String s, String s1)
    {
        Log.e("Phone", (new StringBuilder()).append(s).append("/").append(s1).toString());
    }

    public static void i(String s, String s1)
    {
        Log.i("Phone", (new StringBuilder()).append(s).append("/").append(s1).toString());
    }

    public static void w(String s, String s1)
    {
        Log.w("Phone", (new StringBuilder()).append(s).append("/").append(s1).toString());
    }
}
