// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.Dialog;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import android.view.MenuItem;

// Referenced classes of package com.mediatek.settings:
//            CallRejectListSetting

public class CallRejectSetting extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String CALL_REJECT_TARGET_CLASS = "com.mediatek.settings.CallRejectListSetting";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "CallRejectSetting";
    private static final int VIDEO_CALL_ALL_NUMBERS = 200;
    private static final String VIDEO_CALL_REJECT_LIST_KEY = "video_call_reject_list_key";
    private static final String VIDEO_CALL_REJECT_MODE_KEY = "video_call_reject_mode_key";
    private static final int VOICE_CALL_ALL_NUMBERS = 100;
    private static final String VOICE_CALL_REJECT_LIST_KEY = "voice_call_reject_list_key";
    private static final String VOICE_CALL_REJECT_MODE_KEY = "voice_call_reject_mode_key";
    private String mCallRejectModeArray[];
    private Preference mVideoRejectList;
    private ListPreference mVideoRejectSetting;
    private Preference mVoiceRejectList;
    private ListPreference mVoiceRejectSetting;


    private static void log(String s)
    {
        Log.d("CallRejectSetting", s);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060002);
        mCallRejectModeArray = getResources().getStringArray(0x7f070025);
        mVoiceRejectSetting = (ListPreference)findPreference("voice_call_reject_mode_key");
        mVoiceRejectSetting.setOnPreferenceChangeListener(this);
        mVoiceRejectList = findPreference("voice_call_reject_list_key");
        mVoiceRejectList.setOnPreferenceChangeListener(this);
        mVideoRejectSetting = (ListPreference)findPreference("video_call_reject_mode_key");
        mVideoRejectSetting.setOnPreferenceChangeListener(this);
        mVideoRejectList = findPreference("video_call_reject_list_key");
        mVideoRejectList.setOnPreferenceChangeListener(this);
        getPreferenceScreen().removePreference(mVideoRejectSetting);
        getPreferenceScreen().removePreference(mVideoRejectList);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setTitle(0x1040014);
        builder.setIcon(0x1080027);
        switch (i)
        {
        case 200: 
            builder.setMessage(getResources().getString(0x7f0d00a9));
            break;

        case 100: // 'd'
            builder.setMessage(getResources().getString(0x7f0d00a7));
            break;
        }
        builder.setPositiveButton(0x1040013, null);
        return builder.create();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        log("Enter onPreferenceChange function.");
        String s = preference.getKey();
        int i = Integer.parseInt(String.valueOf(obj));
        if ("voice_call_reject_mode_key".equals(s))
        {
            android.provider.Settings.System.putInt(getContentResolver(), "voice_call_reject_mode", i);
            mVoiceRejectSetting.setSummary(mCallRejectModeArray[i]);
            Preference preference2 = mVoiceRejectList;
            boolean flag1 = false;
            if (i == 2)
                flag1 = true;
            preference2.setEnabled(flag1);
            if (i == 1)
                showDialog(100);
        } else
        if ("video_call_reject_mode_key".equals(s))
        {
            android.provider.Settings.System.putInt(getContentResolver(), "vt_call_reject_mode", i);
            mVideoRejectSetting.setSummary(mCallRejectModeArray[i]);
            Preference preference1 = mVideoRejectList;
            boolean flag = false;
            if (i == 2)
                flag = true;
            preference1.setEnabled(flag);
            if (i == 1)
            {
                showDialog(200);
                return true;
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        log("Enter onPreferenceTreeClick function.");
        if (preference == mVoiceRejectList)
        {
            Intent intent1 = new Intent(this, com/mediatek/settings/CallRejectListSetting);
            intent1.putExtra("type", "voice");
            startActivity(intent1);
        } else
        if (preference == mVideoRejectList)
        {
            Intent intent = new Intent(this, com/mediatek/settings/CallRejectListSetting);
            intent.putExtra("type", "video");
            startActivity(intent);
        }
        return true;
    }

    protected void onResume()
    {
        boolean flag = true;
        super.onResume();
        int i = android.provider.Settings.System.getInt(getContentResolver(), "voice_call_reject_mode", 0);
        mVoiceRejectSetting.setValueIndex(i);
        mVoiceRejectSetting.setSummary(mCallRejectModeArray[i]);
        Preference preference = mVoiceRejectList;
        boolean flag1;
        if (i == 2)
            flag1 = flag;
        else
            flag1 = false;
        preference.setEnabled(flag1);
        int j = android.provider.Settings.System.getInt(getContentResolver(), "vt_call_reject_mode", 0);
        mVideoRejectSetting.setValueIndex(j);
        mVideoRejectSetting.setSummary(mCallRejectModeArray[j]);
        Preference preference1 = mVideoRejectList;
        if (j != 2)
            flag = false;
        preference1.setEnabled(flag);
    }
}
