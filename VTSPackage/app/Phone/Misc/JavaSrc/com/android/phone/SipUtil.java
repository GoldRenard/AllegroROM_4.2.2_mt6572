// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.PendingIntent;
import android.content.Intent;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, SipBroadcastReceiver

public class SipUtil
{

    private SipUtil()
    {
    }

    public static PendingIntent createIncomingCallPendingIntent()
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        Intent intent = new Intent(phoneglobals, com/android/phone/SipBroadcastReceiver);
        intent.setAction("com.android.phone.SIP_INCOMING_CALL");
        return PendingIntent.getBroadcast(phoneglobals, 0, intent, 0x8000000);
    }
}
