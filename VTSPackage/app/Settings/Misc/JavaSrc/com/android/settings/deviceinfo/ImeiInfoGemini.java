// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.TextUtils;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.xlog.Xlog;

public class ImeiInfoGemini extends PreferenceActivity
{

    private static final String CDMA = "CDMA";
    private static final String KEY_IMEI_SLOT1 = "imei_slot1";
    private static final String KEY_IMEI_SLOT2 = "imei_slot2";
    private static final String KEY_IMEI_SLOT3 = "imei_slot3";
    private static final String KEY_IMEI_SV_SLOT1 = "imei_sv_slot1";
    private static final String KEY_IMEI_SV_SLOT2 = "imei_sv_slot2";
    private static final String KEY_IMEI_SV_SLOT3 = "imei_sv_slot3";
    private static final String KEY_MEID_NUMBER_SLOT1 = "meid_number_slot1";
    private static final String KEY_MEID_NUMBER_SLOT2 = "meid_number_slot2";
    private static final String KEY_MEID_NUMBER_SLOT3 = "meid_number_slot3";
    private static final String KEY_MIN_NUMBER_SLOT1 = "min_number_slot1";
    private static final String KEY_MIN_NUMBER_SLOT2 = "min_number_slot2";
    private static final String KEY_MIN_NUMBER_SLOT3 = "min_number_slot3";
    private static final String KEY_PRL_VERSION_SLOT1 = "prl_version_slot1";
    private static final String KEY_PRL_VERSION_SLOT2 = "prl_version_slot2";
    private static final String KEY_PRL_VERSION_SLOT3 = "prl_version_slot3";
    private static final String TAG = "ImeiInfoGemini";
    private GeminiPhone mGeminiPhone;
    private PreferenceScreen mParent;
    private Preference mRemovablePref;

    public ImeiInfoGemini()
    {
        mGeminiPhone = null;
    }

    private void removePreference(String s, String s1, String s2, String s3, String s4)
    {
        mRemovablePref = mParent.findPreference(s);
        mParent.removePreference(mRemovablePref);
        mRemovablePref = mParent.findPreference(s1);
        mParent.removePreference(mRemovablePref);
        mRemovablePref = mParent.findPreference(s4);
        mParent.removePreference(mRemovablePref);
        mRemovablePref = mParent.findPreference(s2);
        mParent.removePreference(mRemovablePref);
        mRemovablePref = mParent.findPreference(s3);
        mParent.removePreference(mRemovablePref);
    }

    private void setSlotStatus()
    {
        mParent = getPreferenceScreen();
        showPreference(0, "imei_slot1", "imei_sv_slot1", "meid_number_slot1", "min_number_slot1", "prl_version_slot1");
        showPreference(1, "imei_slot2", "imei_sv_slot2", "meid_number_slot2", "min_number_slot2", "prl_version_slot2");
        removePreference("imei_slot3", "imei_sv_slot3", "meid_number_slot3", "min_number_slot3", "prl_version_slot3");
        Xlog.d("ImeiInfoGemini", "MTK_GEMINI_3SIM_SUPPORT is false");
    }

    private void setSummaryText(String s, String s1)
    {
        Preference preference = mParent.findPreference(s);
        if (TextUtils.isEmpty(s1))
        {
            preference.setSummary(getResources().getString(0x7f0b026c));
            return;
        } else
        {
            preference.setSummary(s1);
            return;
        }
    }

    private void showPreference(int i, String s, String s1, String s2, String s3, String s4)
    {
        if (mGeminiPhone.getPhoneNameGemini(i).equals("CDMA"))
        {
            setSummaryText(s2, mGeminiPhone.getMeidGemini(i));
            setSummaryText(s3, mGeminiPhone.getCdmaMinGemini(i));
            setSummaryText(s4, mGeminiPhone.getCdmaPrlVersionGemini(i));
            mRemovablePref = mParent.findPreference(s);
            mParent.removePreference(mRemovablePref);
            mRemovablePref = mParent.findPreference(s1);
            mParent.removePreference(mRemovablePref);
            return;
        } else
        {
            setSummaryText(s, mGeminiPhone.getDeviceIdGemini(i));
            setSummaryText(s1, mGeminiPhone.getDeviceSvnGemini(i));
            mRemovablePref = mParent.findPreference(s4);
            mParent.removePreference(mRemovablePref);
            mRemovablePref = mParent.findPreference(s2);
            mParent.removePreference(mRemovablePref);
            mRemovablePref = mParent.findPreference(s3);
            mParent.removePreference(mRemovablePref);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05000f);
        mGeminiPhone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        setSlotStatus();
    }

    protected void onDestroy()
    {
        super.onDestroy();
    }
}
