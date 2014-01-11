// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.os.Bundle;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.telephony.TelephonyManager;
import com.mediatek.oobe.utils.OOBEConstants;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SimManagement

public class SubDefaultSimSettings extends SimManagement
{

    private static final String TAG = "SubDefaultSimSettings";


    private void logd(String s)
    {
        OOBEConstants.logd((new StringBuilder()).append("SubDefaultSimSettings - ").append(s).toString());
    }

    private void loge(String s)
    {
        OOBEConstants.loge((new StringBuilder()).append("SubDefaultSimSettings - ").append(s).toString());
    }

    public void onActivityCreated(Bundle bundle)
    {
        logd("-->onActivityCreated");
        super.onActivityCreated(bundle);
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        boolean flag;
        if (telephonymanager != null && telephonymanager.isVoiceCapable())
            flag = true;
        else
            flag = false;
        logd((new StringBuilder()).append("VoiceCapable :").append(flag).toString());
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.removePreference(findPreference("sim_info"));
        preferencescreen.removePreference(findPreference("general_settings"));
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("default_sim");
        android.preference.Preference preference = findPreference("sms_sim_setting");
        android.preference.Preference preference1 = findPreference("gprs_sim_setting");
        android.preference.Preference preference2 = findPreference("voice_call_sim_setting");
        android.preference.Preference preference3 = findPreference("video_call_sim_setting");
        if (flag)
        {
            if (preference2 != null)
                preferencescreen.addPreference(preference2);
            else
                loge("voiceCallPref is null");
            if (preference3 != null)
                preferencescreen.addPreference(preference3);
            else
                loge("videoCallPref is null");
        } else
        {
            preferencescreen.removePreference(findPreference("voice_call_sim_setting"));
            preferencescreen.removePreference(findPreference("video_call_sim_setting"));
            logd("3GDataSMS doesn't need voice and video");
        }
        if (preference != null)
            preferencescreen.addPreference(preference);
        else
            loge("smsCallPref is null");
        if (preference1 != null)
            preferencescreen.addPreference(preference1);
        else
            loge("gprsCallPref is null");
        if (preferencegroup != null)
            preferencescreen.removePreference(preferencegroup);
        else
            loge("defaultGroup is null");
        logd("<--onActivityCreated");
    }

    public void onCreate(Bundle bundle)
    {
        logd("-->onCreate()");
        super.onCreate(bundle);
        logd("<--onCreate()");
    }

    protected void updateSimInfo(long l, int i)
    {
        logd("updateSimInfo(), prevent default action for oobe");
    }

    protected void updateSimState(int i, int j)
    {
        logd("updateSimState(), prevent default action for oobe");
    }
}
