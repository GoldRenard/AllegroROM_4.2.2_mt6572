// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.widget.Toast;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, ErrorDialogFragment

final class Utils
{

    static final boolean D = true;
    private static final String KEY_ERROR = "errorMessage";
    static final boolean V;

    private Utils()
    {
    }

    public static int getConnectionStateSummary(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return 0x7f0b02d7;

        case 0: // '\0'
            return 0x7f0b02d6;

        case 1: // '\001'
            return 0x7f0b02d8;

        case 2: // '\002'
            return 0x7f0b02d2;
        }
        return 0;
    }

    static void showConnectingError(Context context, String s)
    {
        showError(context, s, 0x7f0b03de);
    }

    static AlertDialog showDisconnectDialog(Context context, AlertDialog alertdialog, android.content.DialogInterface.OnClickListener onclicklistener, CharSequence charsequence, CharSequence charsequence1)
    {
        if (alertdialog == null)
        {
            alertdialog = (new android.app.AlertDialog.Builder(context)).setPositiveButton(0x104000a, onclicklistener).setNegativeButton(0x1040000, null).create();
        } else
        {
            if (alertdialog.isShowing())
                alertdialog.dismiss();
            alertdialog.setButton(-1, context.getText(0x104000a), onclicklistener);
        }
        alertdialog.setTitle(charsequence);
        alertdialog.setMessage(charsequence1);
        alertdialog.show();
        return alertdialog;
    }

    static void showError(Context context, String s, int i)
    {
        String s1 = context.getString(i, new Object[] {
            s
        });
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(context);
        if (localbluetoothmanager == null)
            return;
        PreferenceFragment preferencefragment = localbluetoothmanager.getForegroundActivity();
        if (localbluetoothmanager.isForegroundActivity())
        {
            ErrorDialogFragment errordialogfragment = new ErrorDialogFragment();
            Bundle bundle = new Bundle();
            bundle.putString("errorMessage", s1);
            errordialogfragment.setArguments(bundle);
            errordialogfragment.show(preferencefragment.getFragmentManager(), "Error");
            return;
        } else
        {
            Toast.makeText(context, s1, 0).show();
            return;
        }
    }
}
