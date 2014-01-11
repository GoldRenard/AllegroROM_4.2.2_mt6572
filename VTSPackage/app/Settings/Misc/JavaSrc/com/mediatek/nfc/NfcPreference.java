// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.nfc;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import com.mediatek.xlog.Xlog;

public class NfcPreference extends Preference
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "NfcPreference";
    private boolean mChecked;
    private Context mContext;
    private LayoutInflater mInflater;
    private Switch mPreferenceSwitch;
    private TextView mPreferenceTitle;
    private CharSequence mTitleValue;

    public NfcPreference(Context context)
    {
        this(context, null);
    }

    public NfcPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NfcPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mPreferenceTitle = null;
        mPreferenceSwitch = null;
        mTitleValue = "";
        mChecked = false;
        mContext = context;
        if (super.getTitle() != null)
            mTitleValue = super.getTitle().toString();
    }

    public Switch getSwitch()
    {
        return mPreferenceSwitch;
    }

    public boolean isChecked()
    {
        return mChecked;
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Xlog.d("NfcPreference", (new StringBuilder()).append("oncheckChanged to ").append(flag).toString());
        if (setChecked(flag))
            callChangeListener(Boolean.valueOf(flag));
    }

    public View onCreateView(ViewGroup viewgroup)
    {
        Xlog.d("NfcPreference", "onCreateView");
        mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        View view = mInflater.inflate(0x7f04006b, null);
        mPreferenceTitle = (TextView)view.findViewById(0x7f080106);
        mPreferenceTitle.setText(mTitleValue);
        mPreferenceSwitch = (Switch)view.findViewById(0x7f080107);
        mPreferenceSwitch.setOnCheckedChangeListener(this);
        mPreferenceSwitch.setChecked(mChecked);
        return view;
    }

    public boolean setChecked(boolean flag)
    {
        if (mPreferenceSwitch == null)
        {
            Xlog.d("NfcPreference", "setChecked return");
            mChecked = flag;
        } else
        if (mChecked != flag)
        {
            mPreferenceSwitch.setChecked(flag);
            mChecked = flag;
            return true;
        }
        return false;
    }
}
