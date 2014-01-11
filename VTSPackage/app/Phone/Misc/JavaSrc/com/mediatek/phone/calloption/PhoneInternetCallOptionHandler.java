// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;
import com.android.phone.SipCallOptionHandler;
import com.mediatek.calloption.*;

public class PhoneInternetCallOptionHandler extends InternetCallOptionHandler
{

    private static final String TAG = "PhoneInternetCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneInternetCallOptionHandler", s);
    }

    private Intent newSipCallOptionHandlerIntent(Context context, Intent intent)
    {
        Intent intent1 = new Intent("com.android.phone.SIP_SELECT_PHONE", intent.getData());
        intent1.setClass(context, com/android/phone/SipCallOptionHandler);
        intent1.putExtra("android.phone.extra.NEW_CALL_INTENT", intent);
        intent1.addFlags(0x10000000);
        return intent1;
    }

    protected void doSipCallOptionHandle(Request request)
    {
        Intent intent = newSipCallOptionHandlerIntent(request.getApplicationContext(), request.getIntent());
        log((new StringBuilder()).append("startSipCallOptionHandler(): calling startActivity: ").append(intent).toString());
        request.getActivityContext().startActivity(intent);
    }

    protected void showIPDialToast(Request request)
    {
        Toast.makeText(request.getApplicationContext(), 0x7f0d0097, 0).show();
    }

    protected void showSipDisableDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(request.getActivityContext());
        builder.setTitle(0x7f0d0075).setMessage(0x7f0d0092).setNegativeButton(0x1040009, onclicklistener).setPositiveButton(0x1040013, onclicklistener);
        super.mDialog = builder.create();
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }
}
