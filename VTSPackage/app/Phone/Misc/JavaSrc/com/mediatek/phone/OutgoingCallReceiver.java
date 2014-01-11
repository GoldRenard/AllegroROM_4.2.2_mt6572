// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.*;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import com.android.phone.*;
import com.mediatek.calloption.CallOptionUtils;

public class OutgoingCallReceiver extends BroadcastReceiver
{

    private static final String TAG = "OutgoingCallReceiver";


    private Intent newSipCallOptionHandlerIntent(Context context, Intent intent)
    {
        Intent intent1 = new Intent("com.android.phone.SIP_SELECT_PHONE", intent.getData());
        intent1.setClass(context, com/android/phone/SipCallOptionHandler);
        intent1.putExtra("android.phone.extra.NEW_CALL_INTENT", intent);
        intent1.addFlags(0x10000000);
        return intent1;
    }

    public void onReceive(Context context, Intent intent)
    {
        if ("com.mediatek.phone.OutgoingCallReceiver".equals(intent.getAction()))
        {
            new Intent("android.intent.action.NEW_OUTGOING_CALL");
            OutgoingCallBroadcaster.sendNewCallBroadcast(context, intent, CallOptionUtils.getInitialNumber(context, intent), false, this);
        } else
        if ("android.intent.action.NEW_OUTGOING_CALL".equals(intent.getAction()))
        {
            String s = getResultData();
            Uri uri = Uri.parse(intent.getStringExtra("android.phone.extra.ORIGINAL_URI"));
            Intent intent1 = new Intent("android.intent.action.CALL", uri);
            intent1.putExtra("com.android.phone.extra.video", intent.getBooleanExtra("com.android.phone.extra.video", false));
            if ((!PhoneNumberUtils.isUriNumber(s) || intent.getIntExtra("com.android.phone.extra.slot", -1) != -1) && !"sip".equals(uri.getScheme()))
            {
                intent1.putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", PhoneUtils.specialNumberTransfer(s));
                intent1.putExtra("com.android.phone.extra.slot", intent.getIntExtra("com.android.phone.extra.slot", 0));
                PhoneGlobals.getInstance().callController.placeCall(intent1);
                return;
            }
            if ("sip".equals(uri.getScheme()) && !PhoneNumberUtils.isUriNumber(s))
                intent1.putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", PhoneNumberUtils.stripSeparators(s));
            startSipCallOptionHandler(context, intent1);
            return;
        }
    }

    protected void startSipCallOptionHandler(Context context, Intent intent)
    {
        intent.setData(Uri.fromParts("sip", PhoneNumberUtils.getNumberFromIntent(intent, context), null));
        context.startActivity(newSipCallOptionHandlerIntent(context, intent));
    }
}
