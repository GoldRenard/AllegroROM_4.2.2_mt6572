// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import android.view.Window;
import com.mediatek.calloption.*;

public class PhoneSimStatusCallOptionHandler extends SimStatusCallOptionHandler
{

    private static final String TAG = "PhoneSimStatusCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneSimStatusCallOptionHandler", s);
    }

    protected void dismissProgressIndication()
    {
        if (super.mDialog != null)
        {
            super.mDialog.dismiss();
            super.mDialog = null;
        }
    }

    protected void showProgressIndication(Request request)
    {
        log("showProgressIndication(searching network message )");
        dismissProgressIndication();
        super.mDialog = new ProgressDialog(request.getActivityContext());
        ((ProgressDialog)super.mDialog).setMessage(request.getActivityContext().getResources().getString(0x7f0d01fc));
        ((ProgressDialog)super.mDialog).setIndeterminate(true);
        super.mDialog.setCancelable(false);
        super.mDialog.getWindow().addFlags(4);
        super.mDialog.show();
    }
}
