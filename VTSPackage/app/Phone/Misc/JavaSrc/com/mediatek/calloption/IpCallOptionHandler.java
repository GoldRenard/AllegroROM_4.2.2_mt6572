// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import com.mediatek.phone.SIMInfoWrapper;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request, CallOptionUtils

public abstract class IpCallOptionHandler extends CallOptionBaseHandler
{

    private static final String TAG = "IpCallOptionHandler";


    private static void log(String s)
    {
        Log.d("IpCallOptionHandler", s);
    }

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        int i = request.getIntent().getIntExtra("com.android.phone.extra.slot", -1);
        if (-1 == i)
        {
            log("handleRequest(), slot is -1");
            if (super.mSuccessor != null)
                super.mSuccessor.handleRequest(request);
        } else
        {
            if (request.getIntent().getBooleanExtra("com.android.phone.extra.ip", false) && SIMInfoWrapper.getDefault().getInsertedSimCount() > 0)
            {
                String s = CallOptionUtils.queryIPPrefix(request.getApplicationContext(), i, request.isMultipleSim());
                if (TextUtils.isEmpty(s))
                {
                    showToast(request);
                    Intent intent = new Intent("android.intent.action.MAIN");
                    intent.setClassName("com.android.phone", "com.mediatek.settings.IpPrefixPreference");
                    intent.addFlags(0x4000000);
                    android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
                    if (request.isMultipleSim())
                        intent.putExtra("simId", i);
                    intent.putExtra("sub_title_name", android.provider.Telephony.SIMInfo.getSIMInfoBySlot(request.getActivityContext(), siminfo.mSlot).mDisplayName);
                    request.getActivityContext().startActivity(intent);
                    request.getResultHandler().onHandlingFinish();
                    return;
                }
                String s1 = CallOptionUtils.getInitialNumber(request.getApplicationContext(), request.getIntent());
                if (s1.indexOf(s) != 0)
                    request.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", (new StringBuilder()).append(s).append(s1).toString());
            }
            if (super.mSuccessor != null)
            {
                super.mSuccessor.handleRequest(request);
                return;
            }
        }
    }

    protected abstract void showToast(Request request);
}
