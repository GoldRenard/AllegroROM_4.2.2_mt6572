// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;

public class BugreportPreference extends DialogPreference
{

    public BugreportPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
            SystemProperties.set("ctl.start", "bugreport");
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        super.onPrepareDialogBuilder(builder);
        builder.setPositiveButton(0x10403dc, this);
        builder.setMessage(0x10400e9);
    }

    protected void showDialog(Bundle bundle)
    {
        super.showDialog(bundle);
    }
}
