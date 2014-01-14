// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.apn;

import android.content.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.apn:
//            OmacpApnReceiverService

public class OmacpApnReceiver extends BroadcastReceiver
{

    private static final String ACTION_OMACP = "com.mediatek.omacp.settings";
    private static final String TAG = "OmacpApnReceiver";


    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        Xlog.d("OmacpApnReceiver", (new StringBuilder()).append("get action = ").append(s).toString());
        if (context.getContentResolver() == null)
            Xlog.e("OmacpApnReceiver", "FAILURE unable to get content resolver..");
        else
        if ("com.mediatek.omacp.settings".equals(s))
        {
            OmacpApnReceiverService.processBroadcastIntent(context, intent);
            return;
        }
    }
}
