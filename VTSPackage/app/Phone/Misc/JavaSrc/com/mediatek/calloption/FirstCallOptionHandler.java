// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import com.mediatek.phone.SIMInfoWrapper;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request

public class FirstCallOptionHandler extends CallOptionBaseHandler
{

    private static final String TAG = "FirstCallOptionHandler";


    private static void log(String s)
    {
        Log.d("FirstCallOptionHandler", s);
    }

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        Intent intent = request.getIntent();
        Context context = request.getApplicationContext();
        if ("voicemail:".equals(intent.getData().toString()))
        {
            long l = android.provider.Settings.System.getLong(context.getContentResolver(), "voice_call_sim_setting", -5L);
            SIMInfoWrapper siminfowrapper = SIMInfoWrapper.getDefault();
            if (l > 0L && siminfowrapper.getSlotIdBySimId((int)l) >= 0)
                intent.putExtra("simId", siminfowrapper.getSlotIdBySimId((int)l));
        }
        if (super.mSuccessor != null)
            super.mSuccessor.handleRequest(request);
    }
}
