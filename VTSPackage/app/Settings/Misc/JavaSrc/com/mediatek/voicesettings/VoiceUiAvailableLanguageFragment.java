// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.voicesettings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.preference.*;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.voicesettings:
//            RadioButtonPreference

public class VoiceUiAvailableLanguageFragment extends SettingsPreferenceFragment
{

    private static final int SUCCESS_RESULT = 1;
    private static final String TAG = "VoiceUiAvailableLanguageFragment";
    private static final String VOICE_CONTROL_DEFAULT_LANGUAGE = "voice_control_default_language";
    private static final String VOICE_UI_SUPPORT_LANGUAGES = "voice_ui_support_languages";
    private String mAvailableLangs[];
    private int mDefaultLanguage;
    private ArrayList mLanguagePreList;
    private RadioButtonPreference mLastSelectedPref;

    public VoiceUiAvailableLanguageFragment()
    {
        mLanguagePreList = new ArrayList();
        mDefaultLanguage = 0;
    }

    private String getLanguage()
    {
        Xlog.v("VoiceUiAvailableLanguageFragment", "Get Language");
        return null;
    }

    private void selectLanguage(RadioButtonPreference radiobuttonpreference)
    {
        if (mLastSelectedPref != null)
        {
            if (mLastSelectedPref == radiobuttonpreference)
                return;
            mLastSelectedPref.setChecked(false);
        }
        radiobuttonpreference.setChecked(true);
        mDefaultLanguage = Integer.parseInt(radiobuttonpreference.getKey().toString());
        mLastSelectedPref = radiobuttonpreference;
    }

    private void setLanguage(String s)
    {
        Xlog.v("VoiceUiAvailableLanguageFragment", (new StringBuilder()).append("Set Language: ").append(s).toString());
    }

    public void onCreate(Bundle bundle)
    {
        Xlog.d("VoiceUiAvailableLanguageFragment", "OnCreate VoiceUiAvailableLanguageFragment");
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050045);
        PreferenceActivity preferenceactivity = (PreferenceActivity)getActivity();
        boolean flag;
        if (!preferenceactivity.onIsHidingHeaders() && preferenceactivity.onIsMultiPane())
            flag = false;
        else
            flag = true;
        Bundle bundle1;
        if (flag)
            bundle1 = getActivity().getIntent().getBundleExtra(":android:show_fragment_args");
        else
            bundle1 = getArguments();
        if (bundle1 != null)
        {
            mAvailableLangs = bundle1.getStringArray("voice_ui_support_languages");
            mDefaultLanguage = bundle1.getInt("voice_control_default_language");
        }
        Xlog.d("VoiceUiAvailableLanguageFragment", (new StringBuilder()).append("voice ui deafult language: ").append(mAvailableLangs[mDefaultLanguage]).toString());
        Xlog.d("VoiceUiAvailableLanguageFragment", mAvailableLangs.toString());
        for (int i = 0; i < mAvailableLangs.length; i++)
        {
            RadioButtonPreference radiobuttonpreference = new RadioButtonPreference(getActivity(), mAvailableLangs[i], "");
            radiobuttonpreference.setKey(Integer.toString(i));
            Xlog.v("VoiceUiAvailableLanguageFragment", (new StringBuilder()).append("available[").append(i).append("]").append(mAvailableLangs[i]).toString());
            if (mDefaultLanguage == i)
            {
                radiobuttonpreference.setChecked(true);
                mLastSelectedPref = radiobuttonpreference;
            }
            mLanguagePreList.add(radiobuttonpreference);
            getPreferenceScreen().addPreference(radiobuttonpreference);
        }

    }

    public void onDestroy()
    {
        super.onDestroy();
    }

    public void onPause()
    {
        super.onPause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof RadioButtonPreference)
        {
            selectLanguage((RadioButtonPreference)preference);
            Xlog.d("VoiceUiAvailableLanguageFragment", (new StringBuilder()).append("default language changed to ").append(mAvailableLangs[mDefaultLanguage]).toString());
            Intent intent = new Intent();
            intent.putExtra("voice_control_default_language", mDefaultLanguage);
            getActivity().setResult(1, intent);
            finishFragment();
        }
        return true;
    }

    public void onResume()
    {
        super.onResume();
    }
}
