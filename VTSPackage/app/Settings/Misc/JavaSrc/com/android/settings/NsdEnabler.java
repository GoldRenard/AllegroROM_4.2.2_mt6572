// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.net.nsd.NsdManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;

public class NsdEnabler
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private final CheckBoxPreference mCheckbox;
    private final Context mContext;
    private final IntentFilter mIntentFilter = new IntentFilter("android.net.nsd.STATE_CHANGED");
    private NsdManager mNsdManager;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NsdEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("android.net.nsd.STATE_CHANGED".equals(intent.getAction()))
                handleNsdStateChanged(intent.getIntExtra("nsd_state", 1));
        }

            
            {
                this$0 = NsdEnabler.this;
                super();
            }
    }
;

    public NsdEnabler(Context context, CheckBoxPreference checkboxpreference)
    {
        mContext = context;
        mCheckbox = checkboxpreference;
        mNsdManager = (NsdManager)mContext.getSystemService("servicediscovery");
    }

    private void handleNsdStateChanged(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            mCheckbox.setChecked(true);
            mCheckbox.setEnabled(true);
            return;

        case 1: // '\001'
            mCheckbox.setChecked(false);
            mCheckbox.setEnabled(true);
            return;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        boolean flag = ((Boolean)obj).booleanValue();
        mCheckbox.setEnabled(false);
        mNsdManager.setEnabled(flag);
        return false;
    }

    public void pause()
    {
        mContext.unregisterReceiver(mReceiver);
        mCheckbox.setOnPreferenceChangeListener(null);
    }

    public void resume()
    {
        mContext.registerReceiver(mReceiver, mIntentFilter);
        mCheckbox.setOnPreferenceChangeListener(this);
    }

}
