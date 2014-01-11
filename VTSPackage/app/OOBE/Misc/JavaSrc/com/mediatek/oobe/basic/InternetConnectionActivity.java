// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.net.ConnectivityManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.oobe.utils.RadioButtonPreference;
import com.mediatek.xlog.Xlog;

public class InternetConnectionActivity extends OOBEStepPreferenceActivity
    implements android.view.View.OnClickListener
{

    private static final String TAG = "OOBE";
    private boolean mDataConnectionOpen;
    private RadioButtonPreference mWifiNGprsPref;
    private RadioButtonPreference mWifiOnlyPref;

    public InternetConnectionActivity()
    {
        mDataConnectionOpen = true;
    }

    private boolean isDataConnection()
    {
        return ((ConnectivityManager)getSystemService("connectivity")).getMobileDataEnabled();
    }

    private void setDataConnection(boolean flag)
    {
        ((ConnectivityManager)getSystemService("connectivity")).setMobileDataEnabled(flag);
        if (isDataConnection())
        {
            Xlog.i("OOBE", "mobile data enabled");
            return;
        } else
        {
            Xlog.i("OOBE", "mobile data disabled");
            return;
        }
    }

    protected void initSpecialLayout()
    {
        super.initSpecialLayout(0x7f090053, 0x7f090054);
        mWifiNGprsPref = (RadioButtonPreference)findPreference("wifi_and_gprs");
        mWifiOnlyPref = (RadioButtonPreference)findPreference("wifi_only");
        mDataConnectionOpen = isDataConnection();
        if (mDataConnectionOpen)
        {
            mWifiNGprsPref.setChecked(true);
            mWifiOnlyPref.setChecked(false);
            return;
        } else
        {
            mWifiNGprsPref.setChecked(false);
            mWifiOnlyPref.setChecked(true);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Xlog.d("OOBE", "OnCreate InternetConnectionActivity");
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050003);
        initSpecialLayout();
    }

    protected void onDestroy()
    {
        super.onDestroy();
    }

    protected void onPause()
    {
        super.onPause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag;
label0:
        {
            if (preference == mWifiNGprsPref)
            {
                mWifiNGprsPref.setChecked(true);
                mWifiOnlyPref.setChecked(false);
                Xlog.i("OOBE", "Enable mobile data");
                setDataConnection(true);
                mDataConnectionOpen = true;
            } else
            {
                RadioButtonPreference radiobuttonpreference = mWifiOnlyPref;
                flag = false;
                if (preference != radiobuttonpreference)
                    break label0;
                mWifiNGprsPref.setChecked(false);
                mWifiOnlyPref.setChecked(true);
                Xlog.i("OOBE", "Disable mobile data");
                setDataConnection(false);
                mDataConnectionOpen = false;
            }
            flag = true;
        }
        return flag;
    }

    protected void onResume()
    {
        super.onResume();
    }
}
