// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.net.ThrottleManager;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class DataUsageListener
{

    private final Context mContext;
    private int mCurrentThrottleRate;
    private Preference mCurrentUsagePref;
    private long mDataUsed;
    private Calendar mEnd;
    private IntentFilter mFilter;
    private long mPolicyThreshold;
    private int mPolicyThrottleValue;
    private PreferenceScreen mPrefScreen;
    private BroadcastReceiver mReceiver;
    private Calendar mStart;
    private Preference mSummaryPref;
    private boolean mSummaryPrefEnabled;
    private ThrottleManager mThrottleManager;
    private Preference mThrottleRatePref;
    private Preference mTimeFramePref;

    public DataUsageListener(Context context, Preference preference, Preference preference1, Preference preference2)
    {
        mCurrentUsagePref = null;
        mTimeFramePref = null;
        mThrottleRatePref = null;
        mSummaryPref = null;
        mPrefScreen = null;
        mSummaryPrefEnabled = false;
        mContext = context;
        mCurrentUsagePref = preference;
        mTimeFramePref = preference1;
        mThrottleRatePref = preference2;
        initialize();
    }

    public DataUsageListener(Context context, Preference preference, PreferenceScreen preferencescreen)
    {
        mCurrentUsagePref = null;
        mTimeFramePref = null;
        mThrottleRatePref = null;
        mSummaryPref = null;
        mPrefScreen = null;
        mSummaryPrefEnabled = false;
        mContext = context;
        mSummaryPref = preference;
        mPrefScreen = preferencescreen;
        mSummaryPrefEnabled = true;
        initialize();
    }

    private void initialize()
    {
        mThrottleManager = (ThrottleManager)mContext.getSystemService("throttle");
        mStart = GregorianCalendar.getInstance();
        mEnd = GregorianCalendar.getInstance();
        mFilter = new IntentFilter();
        mFilter.addAction("android.net.thrott.POLL_ACTION");
        mFilter.addAction("android.net.thrott.THROTTLE_ACTION");
        mFilter.addAction("android.net.thrott.POLICY_CHANGED_ACTION");
        mReceiver = new BroadcastReceiver() {

            final DataUsageListener this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if ("android.net.thrott.POLL_ACTION".equals(s))
                {
                    updateUsageStats(intent.getLongExtra("cycleRead", 0L), intent.getLongExtra("cycleWrite", 0L), intent.getLongExtra("cycleStart", 0L), intent.getLongExtra("cycleEnd", 0L));
                } else
                {
                    if ("android.net.thrott.POLICY_CHANGED_ACTION".equals(s))
                    {
                        updatePolicy();
                        return;
                    }
                    if ("android.net.thrott.THROTTLE_ACTION".equals(s))
                    {
                        updateThrottleRate(intent.getIntExtra("level", -1));
                        return;
                    }
                }
            }

            
            {
                this$0 = DataUsageListener.this;
                super();
            }
        }
;
    }

    private String toReadable(long l)
    {
        long l1 = 1024L * 1024L;
        long l2 = 1024L * l1;
        long l3 = 1024L * l2;
        if (l < 1024L)
            return (new StringBuilder()).append(l).append(" bytes").toString();
        if (l < l1)
            return (new StringBuilder()).append(l / 1024L).append(" KB").toString();
        if (l < l2)
            return (new StringBuilder()).append(l / l1).append(" MB").toString();
        if (l < l3)
            return (new StringBuilder()).append(l / l2).append(" GB").toString();
        else
            return (new StringBuilder()).append(l / l3).append(" TB").toString();
    }

    private void updatePolicy()
    {
        mPolicyThrottleValue = mThrottleManager.getCliffLevel(null, 1);
        mPolicyThreshold = mThrottleManager.getCliffThreshold(null, 1);
        if (mSummaryPref != null)
            if (mPolicyThreshold == 0L)
            {
                if (mSummaryPrefEnabled)
                {
                    mPrefScreen.removePreference(mSummaryPref);
                    mSummaryPrefEnabled = false;
                }
            } else
            if (!mSummaryPrefEnabled)
            {
                mSummaryPrefEnabled = true;
                mPrefScreen.addPreference(mSummaryPref);
            }
        updateUI();
    }

    private void updateThrottleRate(int i)
    {
        mCurrentThrottleRate = i;
        updateUI();
    }

    private void updateUI()
    {
        if (mPolicyThreshold != 0L)
        {
            int i = (int)((100L * mDataUsed) / mPolicyThreshold);
            long l = mEnd.getTimeInMillis() - mStart.getTimeInMillis();
            long l1 = GregorianCalendar.getInstance().getTimeInMillis() - mStart.getTimeInMillis();
            int j;
            if (l == 0L)
                j = 0;
            else
                j = (int)((100L * l1) / l);
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(l - l1);
            int k = calendar.get(6);
            if (k >= 365)
                k = 0;
            if (mCurrentUsagePref != null)
                if (mCurrentThrottleRate > 0)
                {
                    Preference preference5 = mCurrentUsagePref;
                    Context context5 = mContext;
                    Object aobj5[] = new Object[2];
                    aobj5[0] = toReadable(mPolicyThreshold);
                    aobj5[1] = Integer.valueOf(mCurrentThrottleRate);
                    preference5.setSummary(context5.getString(0x7f0d021b, aobj5));
                } else
                {
                    Preference preference4 = mCurrentUsagePref;
                    Context context4 = mContext;
                    Object aobj4[] = new Object[3];
                    aobj4[0] = toReadable(mDataUsed);
                    aobj4[1] = Integer.valueOf(i);
                    aobj4[2] = toReadable(mPolicyThreshold);
                    preference4.setSummary(context4.getString(0x7f0d0151, aobj4));
                }
            if (mTimeFramePref != null)
            {
                Preference preference3 = mTimeFramePref;
                Context context3 = mContext;
                Object aobj3[] = new Object[3];
                aobj3[0] = Integer.valueOf(j);
                aobj3[1] = Integer.valueOf(k);
                aobj3[2] = DateFormat.getDateInstance(3).format(mEnd.getTime());
                preference3.setSummary(context3.getString(0x7f0d0169, aobj3));
            }
            if (mThrottleRatePref != null)
            {
                Preference preference2 = mThrottleRatePref;
                Context context2 = mContext;
                Object aobj2[] = new Object[1];
                aobj2[0] = Integer.valueOf(mPolicyThrottleValue);
                preference2.setSummary(context2.getString(0x7f0d021c, aobj2));
            }
            if (mSummaryPref != null && mSummaryPrefEnabled)
                if (mCurrentThrottleRate > 0)
                {
                    Preference preference1 = mSummaryPref;
                    Context context1 = mContext;
                    Object aobj1[] = new Object[2];
                    aobj1[0] = toReadable(mPolicyThreshold);
                    aobj1[1] = Integer.valueOf(mCurrentThrottleRate);
                    preference1.setSummary(context1.getString(0x7f0d021b, aobj1));
                    return;
                } else
                {
                    Preference preference = mSummaryPref;
                    Context context = mContext;
                    Object aobj[] = new Object[5];
                    aobj[0] = toReadable(mDataUsed);
                    aobj[1] = Integer.valueOf(i);
                    aobj[2] = toReadable(mPolicyThreshold);
                    aobj[3] = Integer.valueOf(k);
                    aobj[4] = DateFormat.getDateInstance(3).format(mEnd.getTime());
                    preference.setSummary(context.getString(0x7f0d0150, aobj));
                    return;
                }
        }
    }

    private void updateUsageStats(long l, long l1, long l2, long l3)
    {
        mDataUsed = l + l1;
        mStart.setTimeInMillis(l2);
        mEnd.setTimeInMillis(l3);
        updateUI();
    }

    void pause()
    {
        mContext.unregisterReceiver(mReceiver);
    }

    void resume()
    {
        mContext.registerReceiver(mReceiver, mFilter);
        updatePolicy();
    }



}
