// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;

public class ProviderPreference extends Preference
{

    private String mAccountType;

    public ProviderPreference(Context context, String s, Drawable drawable, CharSequence charsequence)
    {
        super(context);
        mAccountType = s;
        setIcon(drawable);
        setPersistent(false);
        setTitle(charsequence);
    }

    public String getAccountType()
    {
        return mAccountType;
    }
}
