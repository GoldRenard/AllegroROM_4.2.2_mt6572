// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.util.Log;

public class ProcessOutgoingCallTest extends BroadcastReceiver
{

    private static final String AREACODE = "617";
    private static final boolean BLOCK_555 = true;
    private static final boolean LOGV = false;
    private static final boolean POUND_POUND_SEARCH = true;
    private static final boolean REDIRECT_411_TO_GOOG411 = true;
    private static final boolean SEVEN_DIGIT_DIALING = true;
    private static final String TAG = "ProcessOutgoingCallTest";


    public void onReceive(Context context, Intent intent)
    {
        if (intent.getAction().equals("android.intent.action.NEW_OUTGOING_CALL"))
        {
            String s = intent.getStringExtra("android.intent.extra.PHONE_NUMBER");
            if (s.equals("411"))
                setResultData("18004664411");
            if (s.length() == 7)
                setResultData((new StringBuilder()).append("617").append(s).toString());
            if (s.startsWith("##"))
            {
                Intent intent1 = new Intent("android.intent.action.SEARCH");
                intent1.putExtra("query", s.substring(2));
                intent1.addFlags(0x10000000);
                context.startActivity(intent1);
                setResultData(null);
            }
            int i = s.length();
            if (i >= 7)
            {
                String s1 = s.substring(i - 7, i - 4);
                Log.v("ProcessOutgoingCallTest", (new StringBuilder()).append("exchange = ").append(s1).toString());
                if (s1.equals("555"))
                    setResultData(null);
            }
        }
    }
}
