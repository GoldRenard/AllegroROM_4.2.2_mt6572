// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.res.Resources;
import android.os.SystemProperties;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            CdmaSystemSelectListPreference, CdmaSubscriptionListPreference

public class CdmaOptions
{

    private static final String BUTTON_CDMA_ACTIVATE_DEVICE_KEY = "cdma_activate_device_key";
    private static final String BUTTON_CDMA_SUBSCRIPTION_KEY = "cdma_subscription_key";
    private static final String BUTTON_CDMA_SYSTEM_SELECT_KEY = "cdma_system_select_key";
    private static final String LOG_TAG = "CdmaOptions";
    private CdmaSubscriptionListPreference mButtonCdmaSubscription;
    private CdmaSystemSelectListPreference mButtonCdmaSystemSelect;
    private Phone mPhone;
    private PreferenceActivity mPrefActivity;
    private PreferenceScreen mPrefScreen;

    public CdmaOptions(PreferenceActivity preferenceactivity, PreferenceScreen preferencescreen, Phone phone)
    {
        mPrefActivity = preferenceactivity;
        mPrefScreen = preferencescreen;
        mPhone = phone;
        create();
    }

    private boolean deviceSupportsNvAndRuim()
    {
        String s = SystemProperties.get("ril.subscription.types");
        log((new StringBuilder()).append("deviceSupportsnvAnRum: prop=").append(s).toString());
        boolean flag = TextUtils.isEmpty(s);
        boolean flag1 = false;
        boolean flag2 = false;
        if (!flag)
        {
            String as[] = s.split(",");
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s1 = as[j].trim();
                if (s1.equalsIgnoreCase("NV"))
                    flag1 = true;
                if (s1.equalsIgnoreCase("RUIM"))
                    flag2 = true;
            }

        }
        log((new StringBuilder()).append("deviceSupportsnvAnRum: nvSupported=").append(flag1).append(" ruimSupported=").append(flag2).toString());
        return flag1 && flag2;
    }

    protected void create()
    {
        boolean flag = true;
        mPrefActivity.addPreferencesFromResource(0x7f060009);
        mButtonCdmaSystemSelect = (CdmaSystemSelectListPreference)mPrefScreen.findPreference("cdma_system_select_key");
        mButtonCdmaSubscription = (CdmaSubscriptionListPreference)mPrefScreen.findPreference("cdma_subscription_key");
        mButtonCdmaSystemSelect.setEnabled(flag);
        if (deviceSupportsNvAndRuim())
        {
            log("Both NV and Ruim supported, ENABLE subscription type selection");
            mButtonCdmaSubscription.setEnabled(flag);
        } else
        {
            log("Both NV and Ruim NOT supported, REMOVE subscription type selection");
            mPrefScreen.removePreference(mPrefScreen.findPreference("cdma_subscription_key"));
        }
        boolean flag1 = mPrefActivity.getResources().getBoolean(0x1110030);
        if (mPhone.getLteOnCdmaMode() != flag)
            flag = false;
        if (flag1 || flag)
            mPrefScreen.removePreference(mPrefScreen.findPreference("cdma_activate_device_key"));
    }

    protected void log(String s)
    {
        Log.d("CdmaOptions", s);
    }

    public boolean preferenceTreeClick(Preference preference)
    {
        if (preference.getKey().equals("cdma_system_select_key"))
        {
            log("preferenceTreeClick: return BUTTON_CDMA_ROAMING_KEY true");
            return true;
        }
        if (preference.getKey().equals("cdma_subscription_key"))
        {
            log("preferenceTreeClick: return CDMA_SUBSCRIPTION_KEY true");
            return true;
        } else
        {
            return false;
        }
    }

    public void showDialog(Preference preference)
    {
        if (preference.getKey().equals("cdma_system_select_key"))
            mButtonCdmaSystemSelect.showDialog(null);
        else
        if (preference.getKey().equals("cdma_subscription_key"))
        {
            mButtonCdmaSubscription.showDialog(null);
            return;
        }
    }
}
