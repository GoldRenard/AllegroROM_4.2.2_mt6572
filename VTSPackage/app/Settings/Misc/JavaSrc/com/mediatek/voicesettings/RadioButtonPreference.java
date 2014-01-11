// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.voicesettings;

import android.content.Context;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RadioButton;
import com.mediatek.xlog.Xlog;

public class RadioButtonPreference extends Preference
{

    private static final String TAG = "RadioButtonPreference";
    private boolean mIsChecked;
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
        setLayoutResource(0x7f04009b);
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
        setLayoutResource(0x7f04009b);
        if (!TextUtils.isEmpty(mTitle))
            setTitle(mTitle);
        if (mSummary != null)
            setSummary(mSummary);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        mRadioButton = (RadioButton)view.findViewById(0x7f080008);
        if (mRadioButton != null)
        {
            mRadioButton.setChecked(mIsChecked);
            return;
        } else
        {
            Xlog.d("RadioButtonPreference", "radio button can't be find");
            return;
        }
    }

    public void setChecked(boolean flag)
    {
        mIsChecked = flag;
        notifyChanged();
    }
}
