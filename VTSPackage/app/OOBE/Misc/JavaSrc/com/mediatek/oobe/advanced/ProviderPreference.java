// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.view.View;
import android.widget.ImageView;

public class ProviderPreference extends Preference
{

    private String mAccountType;
    private Drawable mProviderIcon;
    private ImageView mProviderIconView;
    private CharSequence mProviderName;
    private String mTapAdd;

    public ProviderPreference(Context context, String s, Drawable drawable, CharSequence charsequence)
    {
        super(context);
        mAccountType = s;
        mProviderIcon = drawable;
        mProviderName = charsequence;
        setLayoutResource(0x7f030015);
        setPersistent(false);
        setTitle(mProviderName);
        Object aobj[] = new Object[1];
        aobj[0] = mProviderName;
        mTapAdd = context.getString(0x7f090081, aobj);
        setSummary(mTapAdd);
    }

    public String getAccountType()
    {
        return mAccountType;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mProviderIconView = (ImageView)view.findViewById(0x7f0b0000);
        mProviderIconView.setImageDrawable(mProviderIcon);
    }
}
