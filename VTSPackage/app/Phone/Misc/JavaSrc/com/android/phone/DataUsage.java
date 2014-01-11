// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Intent;
import android.net.ThrottleManager;
import android.net.Uri;
import android.os.Bundle;
import android.preference.*;

// Referenced classes of package com.android.phone:
//            DataUsageListener

public class DataUsage extends PreferenceActivity
{

    private Preference mCurrentUsagePref;
    private DataUsageListener mDataUsageListener;
    private Preference mHelpPref;
    private String mHelpUri;
    private ThrottleManager mThrottleManager;
    private Preference mThrottleRatePref;
    private Preference mTimeFramePref;


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mThrottleManager = (ThrottleManager)getSystemService("throttle");
        addPreferencesFromResource(0x7f06000d);
        mCurrentUsagePref = findPreference("throttle_current_usage");
        mTimeFramePref = findPreference("throttle_time_frame");
        mThrottleRatePref = findPreference("throttle_rate");
        mHelpPref = findPreference("throttle_help");
        mHelpUri = mThrottleManager.getHelpUri();
        if (mHelpUri == null)
            getPreferenceScreen().removePreference(mHelpPref);
        else
            mHelpPref.setSummary(getString(0x7f0d021d));
        mDataUsageListener = new DataUsageListener(this, mCurrentUsagePref, mTimeFramePref, mThrottleRatePref);
    }

    protected void onPause()
    {
        super.onPause();
        mDataUsageListener.pause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mHelpPref)
            try
            {
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(mHelpUri)));
            }
            catch (Exception exception) { }
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        mDataUsageListener.resume();
    }
}
