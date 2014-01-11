// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.preference.EditTextPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

public class MultiLineTitleEditTextPreference extends EditTextPreference
{

    public MultiLineTitleEditTextPreference(Context context)
    {
        super(context);
    }

    public MultiLineTitleEditTextPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public MultiLineTitleEditTextPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x1020016);
        if (textview != null)
            textview.setSingleLine(false);
    }
}
