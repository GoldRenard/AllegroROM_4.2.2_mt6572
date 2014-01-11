// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

class WrappingCheckBoxPreference extends CheckBoxPreference
{

    public WrappingCheckBoxPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public WrappingCheckBoxPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x1020016);
        if (textview != null)
        {
            textview.setSingleLine(false);
            textview.setMaxLines(3);
        }
    }
}
