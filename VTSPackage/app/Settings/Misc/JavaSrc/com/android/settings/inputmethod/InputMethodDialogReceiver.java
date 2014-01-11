// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.content.*;
import android.view.inputmethod.InputMethodManager;

public class InputMethodDialogReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        if ("android.settings.SHOW_INPUT_METHOD_PICKER".equals(intent.getAction()))
            ((InputMethodManager)context.getSystemService("input_method")).showInputMethodPicker();
    }
}
