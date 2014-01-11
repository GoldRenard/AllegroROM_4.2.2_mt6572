// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.*;
import android.net.Uri;
import android.util.Log;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request

public abstract class InternetCallOptionHandler extends CallOptionBaseHandler
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnCancelListener
{

    private static final String TAG = "InternetCallOptionHandler";
    private Request mRequest;


    private static void log(String s)
    {
        Log.d("InternetCallOptionHandler", s);
    }

    protected abstract void doSipCallOptionHandle(Request request);

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        if (request.getIntent().getData().getScheme().equals("sip") && !request.getIntent().getBooleanExtra("follow_sim_management", false))
        {
            log("data schema is sip and follow sim management extra is false");
            mRequest = request;
            if (1 == android.provider.Settings.System.getInt(request.getApplicationContext().getContentResolver(), "enable_internet_call_value", 0))
            {
                log("internet call setting is enabled");
                if (request.getIntent().getBooleanExtra("com.android.phone.extra.ip", false))
                {
                    log("extra ip dial is true, show toast");
                    showIPDialToast(request);
                } else
                {
                    log("doSipCallOptionHandle()");
                    doSipCallOptionHandle(request);
                }
                request.getResultHandler().onHandlingFinish();
                return;
            } else
            {
                log("internet call setting not enabled, show sip disable dialog");
                showSipDisableDialog(request, this, this, this);
                return;
            }
        }
        if (super.mSuccessor != null)
            super.mSuccessor.handleRequest(request);
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        log("onCancel()");
        mRequest.getResultHandler().onHandlingFinish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        log((new StringBuilder()).append("onClick(), which = ").append(i).toString());
        if (-1 == i)
        {
            Intent intent = new Intent();
            intent.setClassName("com.android.phone", "com.mediatek.settings.SipCallSetting");
            intent.addFlags(0x4000000);
            mRequest.getActivityContext().startActivity(intent);
        } else
        if (-2 == i)
        {
            dialoginterface.cancel();
            return;
        }
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        log("onDismiss()");
    }

    protected abstract void showIPDialToast(Request request);

    protected void showSipDisableDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
    }
}
