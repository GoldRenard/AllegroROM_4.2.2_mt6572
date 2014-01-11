// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CdmaCallOptions extends PreferenceActivity
{

    private static final String BUTTON_VP_KEY = "button_voice_privacy_key";
    private static final String LOG_TAG = "CdmaCallOptions";
    private final boolean DBG = false;
    private CheckBoxPreference mButtonVoicePrivacy;


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060006);
        mButtonVoicePrivacy = (CheckBoxPreference)findPreference("button_voice_privacy_key");
        if (PhoneGlobals.getPhone().getPhoneType() != 2 || getResources().getBoolean(0x7f0a000e))
            getPreferenceScreen().setEnabled(false);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        return preference.getKey().equals("button_voice_privacy_key");
    }
}
