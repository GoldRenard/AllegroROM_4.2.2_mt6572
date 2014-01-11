// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.util.Log;
import android.view.Window;
import com.mediatek.calloption.*;

// Referenced classes of package com.mediatek.phone.calloption:
//            PhoneInternationalDialogHandler

public class PhoneInternationalCallOptionHandler extends InternationalCallOptionHandler
{

    private static final String TAG = "PhoneInternationalCallOptionHandler";


    private static void log(String s)
    {
        Log.d("PhoneInternationalCallOptionHandler", s);
    }

    protected void showDialog(Context context, int i, int j, com.mediatek.calloption.InternationalDialogHandler.PrefixInfo prefixinfo, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        if (super.mDialog != null)
            super.mDialog.cancel();
        super.mDialogHandler = new PhoneInternationalDialogHandler(context, i, j, prefixinfo);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(context);
        builder.setTitle(context.getString(0x7f0d0124)).setPositiveButton(context.getString(0x7f0d0132), this).setView(super.mDialogHandler.createDialogView());
        super.mDialog = builder.create();
        super.mDialogHandler.setAlertDialog((AlertDialog)super.mDialog);
        super.mDialog.setOnDismissListener(this);
        super.mDialog.setOnCancelListener(this);
        super.mDialog.setOnShowListener(super.mDialogHandler);
        super.mDialog.getWindow().addFlags(2);
        super.mDialog.show();
    }

    protected void showInvalidNumberDialog(Context context, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        if (super.mDialog != null)
            super.mDialog.cancel();
        super.mDialogHandler = null;
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(context);
        builder.setTitle(0x1040014).setIconAttribute(0x1010355).setMessage(context.getString(0x7f0d0134)).setPositiveButton(context.getString(0x104000a), onclicklistener).setNegativeButton(context.getString(0x1040000), onclicklistener);
        super.mDialog = builder.create();
        super.mDialog.setOnDismissListener(this);
        super.mDialog.setOnCancelListener(this);
        super.mDialog.show();
    }
}
