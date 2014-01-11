// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.*;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.telephony.TelephonyManagerEx;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request

public abstract class VoiceMailCallOptionHandler extends CallOptionBaseHandler
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnCancelListener
{

    private static final String TAG = "VoiceMailCallOptionHandler";
    private Request mRequest;


    private static void log(String s)
    {
        Log.d("VoiceMailCallOptionHandler", s);
    }

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        mRequest = request;
        if (!"voicemail:".equals(request.getIntent().getData().toString()))
        {
            if (super.mSuccessor != null)
                super.mSuccessor.handleRequest(request);
        } else
        {
            mRequest = request;
            long l = android.provider.Settings.System.getLong(request.getApplicationContext().getContentResolver(), "voice_call_sim_setting", -5L);
            if (l > 0L)
            {
                android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoById((int)l);
                if (siminfo != null)
                    request.getIntent().putExtra("simId", siminfo.mSlot);
            }
            int i = request.getIntent().getIntExtra("com.android.phone.extra.slot", -1);
            if (-1 == i)
            {
                if (super.mSuccessor != null)
                {
                    super.mSuccessor.handleRequest(request);
                    return;
                }
            } else
            {
                if (TextUtils.isEmpty(TelephonyManagerEx.getDefault().getVoiceMailNumber(i)))
                {
                    showMissedingVoiceMailDialog(request, this, this, this);
                    return;
                }
                String s = TelephonyManagerEx.getDefault().getVoiceMailNumber(i);
                request.getIntent().setData(Uri.fromParts("tel", s, null));
                request.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s);
                if (super.mSuccessor != null)
                {
                    super.mSuccessor.handleRequest(request);
                    return;
                }
            }
        }
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
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClassName("com.android.phone", "com.mediatek.settings.VoiceMailSetting");
            intent.addFlags(0x14000000);
            intent.putExtra("simId", mRequest.getIntent().getIntExtra("com.android.phone.extra.slot", -1));
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

    protected abstract void showMissedingVoiceMailDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);
}
