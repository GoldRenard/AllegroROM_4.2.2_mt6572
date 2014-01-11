// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioButton;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

public class RadioButtonPreference extends Preference
    implements android.view.View.OnClickListener
{

    private static final int BUTTON_ID = 0x7f08010e;
    private static final String TAG = "RadioButtonPreference";
    private static final int TITLE_ID = 0x7f08010d;
    private boolean mChecked;
    private String mMountPath;
    private RadioButton mPreferenceButton;
    private TextView mPreferenceTitle;
    private CharSequence mTitleValue;

    public RadioButtonPreference(Context context)
    {
        super(context);
        mPreferenceTitle = null;
        mPreferenceButton = null;
        mTitleValue = "";
        mChecked = false;
        setLayoutResource(0x7f04006f);
    }

    public String getPath()
    {
        return mMountPath;
    }

    public CharSequence getTitle()
    {
        return mTitleValue;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        Xlog.d("RadioButtonPreference", "getview");
        mPreferenceTitle = (TextView)view1.findViewById(0x7f08010d);
        mPreferenceTitle.setText(mTitleValue);
        mPreferenceButton = (RadioButton)view1.findViewById(0x7f08010e);
        mPreferenceButton.setOnClickListener(this);
        mPreferenceButton.setChecked(mChecked);
        return view1;
    }

    public boolean isChecked()
    {
        return mChecked;
    }

    protected void onClick()
    {
        super.onClick();
        boolean flag;
        if (!isChecked())
            flag = true;
        else
            flag = false;
        if (!flag)
            Xlog.d("RadioButtonPreference", "preference.onClick return");
        else
        if (setChecked(flag))
        {
            callChangeListener(Boolean.valueOf(flag));
            Xlog.d("RadioButtonPreference", "preference.onClick");
            return;
        }
    }

    public void onClick(View view)
    {
        boolean flag;
        if (!isChecked())
            flag = true;
        else
            flag = false;
        if (!flag)
            Xlog.d("RadioButtonPreference", "button.onClick return");
        else
        if (setChecked(flag))
        {
            callChangeListener(Boolean.valueOf(flag));
            Xlog.d("RadioButtonPreference", "button.onClick");
            return;
        }
    }

    public boolean setChecked(boolean flag)
    {
        if (mPreferenceButton == null)
        {
            Xlog.d("RadioButtonPreference", "setChecked return");
            mChecked = flag;
        } else
        if (mChecked != flag)
        {
            mPreferenceButton.setChecked(flag);
            mChecked = flag;
            return true;
        }
        return false;
    }

    public void setPath(String s)
    {
        mMountPath = s;
    }

    public void setTitle(CharSequence charsequence)
    {
        if (mPreferenceTitle == null)
            mTitleValue = charsequence;
        if (!charsequence.equals(mTitleValue))
        {
            mTitleValue = charsequence;
            mPreferenceTitle.setText(mTitleValue);
        }
    }
}
