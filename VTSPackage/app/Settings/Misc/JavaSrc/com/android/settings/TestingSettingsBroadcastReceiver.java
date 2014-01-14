// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;

// Referenced classes of package com.android.settings:
//            TestingSettings

public class TestingSettingsBroadcastReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        if (intent.getAction().equals("android.provider.Telephony.SECRET_CODE"))
        {
            Intent intent1 = new Intent("android.intent.action.MAIN");
            intent1.setClass(context, com/android/settings/TestingSettings);
            intent1.setFlags(0x10000000);
            context.startActivity(intent1);
        }
    }
}
