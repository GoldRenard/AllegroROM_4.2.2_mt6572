// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.res.Resources;
import android.preference.*;
import android.util.Log;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;

public class GsmUmtsOptions
{

    private static final String BUTTON_APN_EXPAND_KEY = "button_apn_key";
    private static final String BUTTON_OPERATOR_SELECTION_EXPAND_KEY = "button_carrier_sel_key";
    private static final String BUTTON_PREFER_2G_KEY = "button_prefer_2g_key";
    private static final String LOG_TAG = "GsmUmtsOptions";
    private PreferenceScreen mButtonAPNExpand;
    private PreferenceScreen mButtonOperatorSelectionExpand;
    private CheckBoxPreference mButtonPrefer2g;
    private PreferenceActivity mPrefActivity;
    private PreferenceScreen mPrefScreen;

    public GsmUmtsOptions(PreferenceActivity preferenceactivity, PreferenceScreen preferencescreen)
    {
        mPrefActivity = preferenceactivity;
        mPrefScreen = preferencescreen;
        create();
    }

    protected void create()
    {
        mPrefActivity.addPreferencesFromResource(0x7f060012);
        mButtonAPNExpand = (PreferenceScreen)mPrefScreen.findPreference("button_apn_key");
        mButtonOperatorSelectionExpand = (PreferenceScreen)mPrefScreen.findPreference("button_carrier_sel_key");
        mButtonPrefer2g = (CheckBoxPreference)mPrefScreen.findPreference("button_prefer_2g_key");
        if (PhoneFactory.getDefaultPhone().getPhoneType() != 1)
        {
            log("Not a GSM phone");
            mButtonAPNExpand.setEnabled(false);
            mButtonOperatorSelectionExpand.setEnabled(false);
            mButtonPrefer2g.setEnabled(false);
        } else
        if (mPrefActivity.getResources().getBoolean(0x7f0a000d))
            if (PhoneFactory.getDefaultPhone().isCspPlmnEnabled())
            {
                log("[CSP] Enabling Operator Selection menu.");
                mButtonOperatorSelectionExpand.setEnabled(true);
                return;
            } else
            {
                log("[CSP] Disabling Operator Selection menu.");
                mPrefScreen.removePreference(mPrefScreen.findPreference("button_carrier_sel_key"));
                return;
            }
    }

    protected void log(String s)
    {
        Log.d("GsmUmtsOptions", s);
    }

    public boolean preferenceTreeClick(Preference preference)
    {
        if (preference.getKey().equals("button_prefer_2g_key"))
        {
            log("preferenceTreeClick: return true");
            return true;
        } else
        {
            log("preferenceTreeClick: return false");
            return false;
        }
    }
}
