// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.os.SystemVibrator;
import android.os.Vibrator;
import android.util.Log;

public class HapticFeedback
{

    private static final long DURATION = 4L;
    private static final int NO_REPEAT = -1;
    private static final String TAG = "HapticFeedback";
    private static final int VIBRATION_PATTERN_ID = 0x1070024;
    private ContentResolver mContentResolver;
    private Context mContext;
    private boolean mEnabled;
    private long mHapticPattern[];
    private boolean mSettingEnabled;
    private android.provider.Settings.System mSystemSettings;
    private Vibrator mVibrator;


    private boolean loadHapticSystemPattern(Resources resources)
    {
        mHapticPattern = null;
        int ai[];
        try
        {
            ai = resources.getIntArray(0x1070024);
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Log.e("HapticFeedback", "Vibrate pattern missing.", notfoundexception);
            return false;
        }
        if (ai == null || ai.length == 0)
        {
            Log.e("HapticFeedback", "Haptic pattern is null or empty.");
            return false;
        }
        mHapticPattern = new long[ai.length];
        for (int i = 0; i < ai.length; i++)
            mHapticPattern[i] = ai[i];

        return true;
    }

    public void checkSystemSetting()
    {
        if (!mEnabled)
            return;
        mSystemSettings;
        boolean flag;
        if (android.provider.Settings.System.getInt(mContentResolver, "haptic_feedback_enabled", 0) != 0)
            flag = true;
        else
            flag = false;
        try
        {
            mSettingEnabled = flag;
            return;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Log.e("HapticFeedback", "Could not retrieve system setting.", notfoundexception);
        }
        mSettingEnabled = false;
        return;
    }

    public void init(Context context, boolean flag)
    {
        mEnabled = flag;
        if (flag)
        {
            mVibrator = new SystemVibrator();
            mHapticPattern = (new long[] {
                0L, 4L, 8L, 12L
            });
            mSystemSettings = new android.provider.Settings.System();
            mContentResolver = context.getContentResolver();
        }
    }

    public void vibrate()
    {
        if (mEnabled && mSettingEnabled)
        {
            if (mHapticPattern != null && mHapticPattern.length == 1)
            {
                mVibrator.vibrate(mHapticPattern[0]);
                return;
            } else
            {
                mVibrator.vibrate(mHapticPattern, -1);
                return;
            }
        } else
        {
            return;
        }
    }
}
