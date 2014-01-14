// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;

public class CustomSwitchPreference extends Preference
{
    private class Listener
        implements android.widget.CompoundButton.OnCheckedChangeListener
    {

        final CustomSwitchPreference this$0;

        public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
        {
            android.provider.Settings.Secure.setLocationProviderEnabled(compoundbutton.getContext().getContentResolver(), "gps", flag);
            setChecked(flag);
        }

        private Listener()
        {
            this$0 = CustomSwitchPreference.this;
            super();
        }

    }


    private boolean mChecked;
    private android.widget.CompoundButton.OnCheckedChangeListener mSwitchChangeListener;

    public CustomSwitchPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mChecked = true;
        mSwitchChangeListener = new Listener();
        setLayoutResource(0x7f040024);
    }

    public CustomSwitchPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mChecked = true;
        mSwitchChangeListener = new Listener();
        setLayoutResource(0x7f040024);
    }

    public boolean isChecked()
    {
        return mChecked;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        Switch switch1 = (Switch)view.findViewById(0x7f080047);
        if (mSwitchChangeListener != null && switch1 != null)
        {
            switch1.setClickable(true);
            switch1.setChecked(mChecked);
            switch1.setOnCheckedChangeListener(mSwitchChangeListener);
        }
    }

    public void setChecked(boolean flag)
    {
        mChecked = flag;
        notifyChanged();
    }
}
