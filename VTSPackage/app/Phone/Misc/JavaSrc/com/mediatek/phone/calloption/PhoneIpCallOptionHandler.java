// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.util.Log;
import android.widget.Toast;
import com.mediatek.calloption.IpCallOptionHandler;
import com.mediatek.calloption.Request;

public class PhoneIpCallOptionHandler extends IpCallOptionHandler
{

    private static final String TAG = "PhoneIpCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneIpCallOptionHandler", s);
    }

    protected void showToast(Request request)
    {
        Toast.makeText(request.getApplicationContext(), 0x7f0d0096, 0).show();
    }
}
