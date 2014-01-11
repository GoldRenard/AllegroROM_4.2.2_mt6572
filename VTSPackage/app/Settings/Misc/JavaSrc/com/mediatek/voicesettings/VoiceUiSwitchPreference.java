// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.voicesettings;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.mediatek.xlog.Xlog;

public class VoiceUiSwitchPreference extends Preference
{
    public static interface OnCheckedChangeListener
    {

        public abstract boolean onBeforeCheckedChanged(boolean flag);

        public abstract void onCheckedChanged(boolean flag);
    }


    private static final String TAG = "VoiceUiSwitchPreference";
    private static final String VOICE_CONTROL_ENABLED = "voice_control_enabled";
    private boolean mChecked;
    private android.widget.CompoundButton.OnCheckedChangeListener mSwitchButtonListener = new android.widget.CompoundButton.OnCheckedChangeListener() {

        final VoiceUiSwitchPreference this$0;

        public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
        {
            Xlog.d("VoiceUiSwitchPreference", (new StringBuilder()).append("onCheckedChanged isChecked=").append(flag).append(" mChecked=").append(mChecked).toString());
            if (flag != mChecked)
                setChecked(flag);
        }

            
            {
                this$0 = VoiceUiSwitchPreference.this;
                super();
            }
    }
;
    private OnCheckedChangeListener mSwitchChangeListener;

    public VoiceUiSwitchPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mChecked = false;
        setLayoutResource(0x7f040024);
    }

    public VoiceUiSwitchPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mChecked = false;
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
        if (mSwitchButtonListener != null && switch1 != null)
        {
            switch1.setClickable(true);
            switch1.setOnCheckedChangeListener(mSwitchButtonListener);
            switch1.setChecked(mChecked);
        }
    }

    public void setChecked(boolean flag)
    {
        if (mSwitchChangeListener != null && mSwitchChangeListener.onBeforeCheckedChanged(flag))
        {
            mChecked = flag;
            mSwitchChangeListener.onCheckedChanged(mChecked);
        }
        notifyChanged();
    }

    public void setChecked(boolean flag, boolean flag1)
    {
        if (!flag1)
            mChecked = flag;
        notifyChanged();
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener oncheckedchangelistener)
    {
        Xlog.d("VoiceUiSwitchPreference", "setOnCheckedChangeListener");
        if (oncheckedchangelistener != null)
            mSwitchChangeListener = oncheckedchangelistener;
    }

}
