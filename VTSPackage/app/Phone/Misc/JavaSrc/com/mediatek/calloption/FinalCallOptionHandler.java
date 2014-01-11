// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.util.Log;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request

public class FinalCallOptionHandler extends CallOptionBaseHandler
{

    private static final String TAG = "FinalCallOptionHandler";


    private static void log(String s)
    {
        Log.d("FinalCallOptionHandler", s);
    }

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        request.getResultHandler().onContinueCallProcess(request.getIntent());
    }
}
