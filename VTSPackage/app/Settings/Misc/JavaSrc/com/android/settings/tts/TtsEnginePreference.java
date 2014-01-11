// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.tts;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings.tts:
//            TtsEngineSettingsFragment

public class TtsEnginePreference extends Preference
{
    public static interface RadioButtonGroupState
    {

        public abstract Checkable getCurrentChecked();

        public abstract String getCurrentKey();

        public abstract void setCurrentChecked(Checkable checkable);

        public abstract void setCurrentKey(String s);
    }


    static final String FRAGMENT_ARGS_LABEL = "label";
    static final String FRAGMENT_ARGS_NAME = "name";
    static final String FRAGMENT_ARGS_VOICES = "voices";
    private static final String TAG = "TtsEnginePreference";
    private final android.speech.tts.TextToSpeech.EngineInfo mEngineInfo;
    private final PreferenceActivity mPreferenceActivity;
    private volatile boolean mPreventRadioButtonCallbacks;
    private RadioButton mRadioButton;
    private final android.widget.CompoundButton.OnCheckedChangeListener mRadioChangeListener = new android.widget.CompoundButton.OnCheckedChangeListener() {

        final TtsEnginePreference this$0;

        public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
        {
            onRadioButtonClicked(compoundbutton, flag);
        }

            
            {
                this$0 = TtsEnginePreference.this;
                super();
            }
    }
;
    private View mSettingsIcon;
    private final RadioButtonGroupState mSharedState;
    private Intent mVoiceCheckData;

    public TtsEnginePreference(Context context, android.speech.tts.TextToSpeech.EngineInfo engineinfo, RadioButtonGroupState radiobuttongroupstate, PreferenceActivity preferenceactivity)
    {
        super(context);
        setLayoutResource(0x7f040076);
        mSharedState = radiobuttongroupstate;
        mPreferenceActivity = preferenceactivity;
        mEngineInfo = engineinfo;
        mPreventRadioButtonCallbacks = false;
        setKey(mEngineInfo.name);
        setTitle(mEngineInfo.label);
    }

    private void onRadioButtonClicked(CompoundButton compoundbutton, boolean flag)
    {
        if (!mPreventRadioButtonCallbacks && mSharedState.getCurrentChecked() != compoundbutton)
        {
            Xlog.d("TtsEnginePreference", (new StringBuilder()).append("onRadioButtonClicked--->>").append(flag).toString());
            if (flag)
            {
                if (mSharedState.getCurrentChecked() != null)
                    mSharedState.getCurrentChecked().setChecked(false);
                mSharedState.setCurrentChecked(compoundbutton);
                mSharedState.setCurrentKey(getKey());
                callChangeListener(mSharedState.getCurrentKey());
            }
            mSettingsIcon.setEnabled(flag);
            return;
        } else
        {
            return;
        }
    }

    public View getView(View view, ViewGroup viewgroup)
    {
        boolean flag = true;
        if (mSharedState == null)
            throw new IllegalStateException("Call to getView() before a call tosetSharedState()");
        View view1 = super.getView(view, viewgroup);
        final RadioButton rb = (RadioButton)view1.findViewById(0x7f080126);
        rb.setOnCheckedChangeListener(mRadioChangeListener);
        boolean flag1 = getKey().equals(mSharedState.getCurrentKey());
        if (flag1)
            mSharedState.setCurrentChecked(rb);
        mPreventRadioButtonCallbacks = flag;
        rb.setChecked(flag1);
        mPreventRadioButtonCallbacks = false;
        mRadioButton = rb;
        view1.findViewById(0x7f080127).setOnClickListener(new android.view.View.OnClickListener() {

            final TtsEnginePreference this$0;
            final RadioButton val$rb;

            public void onClick(View view3)
            {
                TtsEnginePreference ttsenginepreference = TtsEnginePreference.this;
                RadioButton radiobutton = rb;
                boolean flag2;
                if (!rb.isChecked())
                    flag2 = true;
                else
                    flag2 = false;
                ttsenginepreference.onRadioButtonClicked(radiobutton, flag2);
            }

            
            {
                this$0 = TtsEnginePreference.this;
                rb = radiobutton;
                super();
            }
        }
);
        mSettingsIcon = view1.findViewById(0x7f080128);
        View view2 = mSettingsIcon;
        if (!flag1 || mVoiceCheckData == null)
            flag = false;
        view2.setEnabled(flag);
        mSettingsIcon.setOnClickListener(new android.view.View.OnClickListener() {

            final TtsEnginePreference this$0;

            public void onClick(View view3)
            {
                Bundle bundle = new Bundle();
                bundle.putString("name", mEngineInfo.name);
                bundle.putString("label", mEngineInfo.label);
                if (mVoiceCheckData != null)
                    bundle.putParcelable("voices", mVoiceCheckData);
                mPreferenceActivity.startPreferencePanel(com/android/settings/tts/TtsEngineSettingsFragment.getName(), bundle, 0, mEngineInfo.label, null, 0);
            }

            
            {
                this$0 = TtsEnginePreference.this;
                super();
            }
        }
);
        if (mVoiceCheckData != null)
            mSettingsIcon.setEnabled(mRadioButton.isChecked());
        return view1;
    }

    public void setVoiceDataDetails(Intent intent)
    {
        mVoiceCheckData = intent;
        if (mSettingsIcon != null && mRadioButton != null)
            mSettingsIcon.setEnabled(mRadioButton.isChecked());
    }




}
