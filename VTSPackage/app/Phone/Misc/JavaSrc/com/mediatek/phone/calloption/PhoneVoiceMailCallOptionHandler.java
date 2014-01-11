// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.Dialog;
import android.util.Log;
import com.mediatek.calloption.*;

public class PhoneVoiceMailCallOptionHandler extends VoiceMailCallOptionHandler
{

    private static final String TAG = "PhoneVoiceMailCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneVoiceMailCallOptionHandler", s);
    }

    protected void showMissedingVoiceMailDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(request.getActivityContext());
        builder.setTitle(0x7f0d01a2).setMessage(0x7f0d01a3).setNegativeButton(0x1040009, onclicklistener).setPositiveButton(0x7f0d01a4, onclicklistener);
        super.mDialog = builder.create();
        super.mDialog.setOnDismissListener(ondismisslistener);
        super.mDialog.setOnCancelListener(oncancellistener);
        super.mDialog.show();
    }
}
