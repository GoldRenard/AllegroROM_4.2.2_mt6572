// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioButton;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

public class UsbPreference extends Preference
    implements android.view.View.OnClickListener
{

    private static final int BUTTON_ID = 0x7f08012b;
    private static final int SUMMARY_ID = 0x7f08012a;
    private static final String TAG = "UsbPreference";
    private static final int TITLE_ID = 0x7f080129;
    private boolean mChecked;
    private RadioButton mPreferenceButton;
    private TextView mPreferenceSummary;
    private TextView mPreferenceTitle;
    private CharSequence mSummaryValue;
    private CharSequence mTitleValue;

    public UsbPreference(Context context)
    {
        this(context, null);
    }

    public UsbPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public UsbPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mPreferenceTitle = null;
        mPreferenceSummary = null;
        mPreferenceButton = null;
        mTitleValue = "";
        mSummaryValue = "";
        mChecked = false;
        setLayoutResource(0x7f040077);
        if (super.getTitle() != null)
            mTitleValue = super.getTitle().toString();
        if (super.getSummary() != null)
            mSummaryValue = super.getSummary().toString();
    }

    public CharSequence getSummary()
    {
        return mSummaryValue;
    }

    public CharSequence getTitle()
    {
        return mTitleValue;
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        View view1 = super.getView(view, viewgroup);
        Xlog.d("UsbPreference", "getview");
        mPreferenceTitle = (TextView)view1.findViewById(0x7f080129);
        mPreferenceTitle.setText(mTitleValue);
        mPreferenceSummary = (TextView)view1.findViewById(0x7f08012a);
        mPreferenceSummary.setText(mSummaryValue);
        mPreferenceButton = (RadioButton)view1.findViewById(0x7f08012b);
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
            Xlog.d("UsbPreference", "preference.onClick return");
        else
        if (setChecked(flag))
        {
            callChangeListener(Boolean.valueOf(flag));
            Xlog.d("UsbPreference", "preference.onClick");
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
            Xlog.d("UsbPreference", "button.onClick return");
        else
        if (setChecked(flag))
        {
            callChangeListener(Boolean.valueOf(flag));
            Xlog.d("UsbPreference", "button.onClick");
            return;
        }
    }

    public boolean setChecked(boolean flag)
    {
        if (mPreferenceButton == null)
        {
            Xlog.d("UsbPreference", "setChecked return");
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

    public void setSummary(CharSequence charsequence)
    {
        if (mPreferenceSummary == null)
            mSummaryValue = charsequence;
        if (!charsequence.equals(mSummaryValue))
        {
            mSummaryValue = charsequence;
            mPreferenceSummary.setText(mSummaryValue);
        }
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
