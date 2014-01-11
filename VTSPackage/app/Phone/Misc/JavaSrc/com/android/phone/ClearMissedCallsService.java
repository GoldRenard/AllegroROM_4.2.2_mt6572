// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.IntentService;
import android.content.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, NotificationMgr

public class ClearMissedCallsService extends IntentService
{

    public static final String ACTION_CLEAR_MISSED_CALLS = "com.android.phone.intent.CLEAR_MISSED_CALLS";
    private PhoneGlobals mApp;

    public ClearMissedCallsService()
    {
        super(com/android/phone/ClearMissedCallsService.getSimpleName());
    }

    public void onCreate()
    {
        super.onCreate();
        mApp = PhoneGlobals.getInstance();
    }

    protected void onHandleIntent(Intent intent)
    {
        if ("com.android.phone.intent.CLEAR_MISSED_CALLS".equals(intent.getAction()))
        {
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("new", Integer.valueOf(0));
            contentvalues.put("is_read", Integer.valueOf(1));
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append("new");
            stringbuilder.append(" = 1 AND ");
            stringbuilder.append("type");
            stringbuilder.append(" = ?");
            ContentResolver contentresolver = getContentResolver();
            android.net.Uri uri = android.provider.CallLog.Calls.CONTENT_URI;
            String s = stringbuilder.toString();
            String as[] = new String[1];
            as[0] = Integer.toString(3);
            contentresolver.update(uri, contentvalues, s, as);
            mApp.notificationMgr.cancelMissedCallNotification();
        }
    }
}
