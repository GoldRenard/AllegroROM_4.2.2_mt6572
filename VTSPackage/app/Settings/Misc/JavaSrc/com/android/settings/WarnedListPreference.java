// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.preference.ListPreference;
import android.util.AttributeSet;

public class WarnedListPreference extends ListPreference
{

    public WarnedListPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public void click()
    {
        super.onClick();
    }

    protected void onClick()
    {
    }
}
