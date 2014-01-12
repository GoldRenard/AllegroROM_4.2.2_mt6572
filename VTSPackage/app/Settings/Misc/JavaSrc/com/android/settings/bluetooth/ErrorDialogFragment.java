// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;

public final class ErrorDialogFragment extends DialogFragment
    implements android.content.DialogInterface.OnClickListener
{

    private static final String KEY_ERROR = "errorMessage";


    public void onClick(DialogInterface dialoginterface, int i)
    {
    }

    public Dialog onCreateDialog(Bundle bundle)
    {
        String s = getArguments().getString("errorMessage");
        return (new android.app.AlertDialog.Builder(getActivity())).setIcon(0x1080027).setTitle(0x7f0b03d9).setMessage(s).setPositiveButton(0x104000a, null).show();
    }
}
