// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.app.StatusBarManager;
import android.content.Context;
import android.content.SharedPreferences;
import com.android.systemui.statusbar.policy.Prefs;

public class DoNotDisturb
    implements android.content.SharedPreferences.OnSharedPreferenceChangeListener
{

    private Context mContext;
    private boolean mDoNotDisturb;
    SharedPreferences mPrefs;
    private StatusBarManager mStatusBar;

    public DoNotDisturb(Context context)
    {
        mContext = context;
        mStatusBar = (StatusBarManager)context.getSystemService("statusbar");
        mPrefs = Prefs.read(context);
        mPrefs.registerOnSharedPreferenceChangeListener(this);
        mDoNotDisturb = mPrefs.getBoolean("do_not_disturb", false);
        updateDisableRecord();
    }

    private void updateDisableRecord()
    {
        StatusBarManager statusbarmanager = mStatusBar;
        int i;
        if (mDoNotDisturb)
            i = 0xe0000;
        else
            i = 0;
        statusbarmanager.disable(i);
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedpreferences, String s)
    {
        boolean flag = sharedpreferences.getBoolean("do_not_disturb", false);
        if (flag != mDoNotDisturb)
        {
            mDoNotDisturb = flag;
            updateDisableRecord();
        }
    }
}
