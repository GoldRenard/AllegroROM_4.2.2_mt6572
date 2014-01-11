// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.content.Context;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RadioButton;

public class RadioButtonPreference extends Preference
{

    private static final String TAG = "OOBE";
    private boolean mIsChecked;
    private String mNote;
    private RadioButton mRadioButton;
    private String mSummary;
    private String mTitle;

    public RadioButtonPreference(Context context)
    {
        this(context, "title", "summary");
    }

    public RadioButtonPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        setLayoutResource(0x7f03000f);
    }

    public RadioButtonPreference(Context context, String s, String s1)
    {
        this(context, s, s1, false);
    }

    public RadioButtonPreference(Context context, String s, String s1, boolean flag)
    {
        super(context);
        mTitle = s;
        mSummary = s1;
        mIsChecked = flag;
        setLayoutResource(0x7f03000f);
        if (!TextUtils.isEmpty(mTitle))
            setTitle(mTitle);
        if (mSummary != null)
            setSummary(mSummary);
    }

    public String getNote()
    {
        return mNote;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mRadioButton = (RadioButton)view.findViewById(0x1010000);
        mRadioButton.setChecked(mIsChecked);
    }

    public void setChecked(boolean flag)
    {
        mIsChecked = flag;
        notifyChanged();
    }

    public void setNote(String s)
    {
        mNote = s;
    }
}
