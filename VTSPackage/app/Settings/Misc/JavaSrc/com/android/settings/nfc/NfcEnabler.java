// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.nfc;

import android.content.*;
import android.nfc.NfcAdapter;
import android.preference.*;

public class NfcEnabler
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private final PreferenceScreen mAndroidBeam;
    private final CheckBoxPreference mCheckbox;
    private final Context mContext;
    private final IntentFilter mIntentFilter;
    private final NfcAdapter mNfcAdapter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NfcEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("android.nfc.action.ADAPTER_STATE_CHANGED".equals(intent.getAction()))
                handleNfcStateChanged(intent.getIntExtra("android.nfc.extra.ADAPTER_STATE", 1));
        }

            
            {
                this$0 = NfcEnabler.this;
                super();
            }
    }
;

    public NfcEnabler(Context context, CheckBoxPreference checkboxpreference, PreferenceScreen preferencescreen)
    {
        mContext = context;
        mCheckbox = checkboxpreference;
        mAndroidBeam = preferencescreen;
        mNfcAdapter = NfcAdapter.getDefaultAdapter(context);
        if (mNfcAdapter == null)
        {
            mCheckbox.setEnabled(false);
            mAndroidBeam.setEnabled(false);
            mIntentFilter = null;
            return;
        } else
        {
            mIntentFilter = new IntentFilter("android.nfc.action.ADAPTER_STATE_CHANGED");
            return;
        }
    }

    private void handleNfcStateChanged(int i)
    {
        switch (i)
        {
        case 4: // '\004'
            mCheckbox.setChecked(false);
            mCheckbox.setEnabled(false);
            mAndroidBeam.setEnabled(false);
            return;

        case 2: // '\002'
            mCheckbox.setChecked(true);
            mCheckbox.setEnabled(false);
            mAndroidBeam.setEnabled(false);
            return;

        case 3: // '\003'
            mCheckbox.setChecked(true);
            mCheckbox.setEnabled(true);
            mAndroidBeam.setEnabled(true);
            if (mNfcAdapter.isNdefPushEnabled())
            {
                mAndroidBeam.setSummary(0x7f0b0429);
                return;
            } else
            {
                mAndroidBeam.setSummary(0x7f0b042a);
                return;
            }

        case 1: // '\001'
            mCheckbox.setChecked(false);
            mCheckbox.setEnabled(true);
            mAndroidBeam.setEnabled(false);
            mAndroidBeam.setSummary(0x7f0b042b);
            return;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        boolean flag = ((Boolean)obj).booleanValue();
        mCheckbox.setEnabled(false);
        if (flag)
        {
            mNfcAdapter.enable();
            return false;
        } else
        {
            mNfcAdapter.disable();
            return false;
        }
    }

    public void pause()
    {
        if (mNfcAdapter == null)
        {
            return;
        } else
        {
            mContext.unregisterReceiver(mReceiver);
            mCheckbox.setOnPreferenceChangeListener(null);
            return;
        }
    }

    public void resume()
    {
        if (mNfcAdapter == null)
        {
            return;
        } else
        {
            handleNfcStateChanged(mNfcAdapter.getAdapterState());
            mContext.registerReceiver(mReceiver, mIntentFilter);
            mCheckbox.setOnPreferenceChangeListener(this);
            return;
        }
    }

}
