// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.nfc;

import android.content.*;
import android.nfc.NfcAdapter;
import android.preference.Preference;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.nfc:
//            NfcPreference

public class MtkNfcEnabler
    implements android.preference.Preference.OnPreferenceChangeListener, android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "MtkNfcEnabler";
    private final Context mContext;
    private final IntentFilter mIntentFilter = new IntentFilter("android.nfc.action.ADAPTER_STATE_CHANGED");
    private final NfcAdapter mNfcAdapter;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final MtkNfcEnabler this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("android.nfc.action.ADAPTER_STATE_CHANGED".equals(intent.getAction()))
                handleNfcStateChanged(intent.getIntExtra("android.nfc.extra.ADAPTER_STATE", 1));
        }

            
            {
                this$0 = MtkNfcEnabler.this;
                super();
            }
    }
;
    private final Switch mSwitchButton;
    private final NfcPreference mSwitchPreference;
    private boolean mUpdateSwitchButtonOnly;
    private boolean mUpdateSwitchPrefOnly;

    public MtkNfcEnabler(Context context, NfcPreference nfcpreference, Switch switch1, NfcAdapter nfcadapter)
    {
        mContext = context;
        mSwitchPreference = nfcpreference;
        mSwitchButton = switch1;
        mNfcAdapter = nfcadapter;
    }

    private void handleNfcStateChanged(int i)
    {
        updateSwitch(i);
        updateSwitchPref(i);
    }

    private void setSwitchButtonChecked(boolean flag)
    {
        if (flag != mSwitchButton.isChecked())
        {
            mUpdateSwitchButtonOnly = true;
            mSwitchButton.setChecked(flag);
            mUpdateSwitchButtonOnly = false;
        }
    }

    private void setSwitchPrefChecked(boolean flag)
    {
        if (flag != mSwitchPreference.isChecked())
        {
            mUpdateSwitchPrefOnly = true;
            mSwitchPreference.setChecked(flag);
            mUpdateSwitchPrefOnly = false;
        }
    }

    private void updateSwitch(int i)
    {
        if (mSwitchButton == null)
            return;
        switch (i)
        {
        case 4: // '\004'
            setSwitchButtonChecked(false);
            mSwitchButton.setEnabled(false);
            return;

        case 2: // '\002'
            setSwitchButtonChecked(true);
            mSwitchButton.setEnabled(false);
            return;

        case 3: // '\003'
            setSwitchButtonChecked(true);
            mSwitchButton.setEnabled(true);
            return;

        case 1: // '\001'
            setSwitchButtonChecked(false);
            mSwitchButton.setEnabled(true);
            return;
        }
        setSwitchButtonChecked(false);
    }

    private void updateSwitchPref(int i)
    {
        if (mSwitchPreference == null)
            return;
        switch (i)
        {
        case 4: // '\004'
            setSwitchPrefChecked(false);
            mSwitchPreference.setEnabled(false);
            return;

        case 2: // '\002'
            setSwitchPrefChecked(true);
            mSwitchPreference.setEnabled(false);
            return;

        case 3: // '\003'
            setSwitchPrefChecked(true);
            mSwitchPreference.setEnabled(true);
            return;

        case 1: // '\001'
            setSwitchPrefChecked(false);
            mSwitchPreference.setEnabled(true);
            return;
        }
        setSwitchPrefChecked(false);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
label0:
        {
            Xlog.d("MtkNfcEnabler", (new StringBuilder()).append("onCheckedChanged ").append(flag).toString());
            if (mSwitchButton != null && !mUpdateSwitchButtonOnly)
            {
                mSwitchButton.setEnabled(false);
                if (!flag)
                    break label0;
                mNfcAdapter.setModeFlag(4, 1);
                mNfcAdapter.enable();
            }
            return;
        }
        mNfcAdapter.setModeFlag(4, 0);
        mNfcAdapter.disable();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        boolean flag = ((Boolean)obj).booleanValue();
        Xlog.d("MtkNfcEnabler", (new StringBuilder()).append("onPreferenceChange ").append(flag).toString());
        if (mSwitchPreference == null)
            return false;
        if (mUpdateSwitchPrefOnly)
            return true;
        mSwitchPreference.setEnabled(false);
        if (flag)
        {
            mNfcAdapter.setModeFlag(4, 1);
            mNfcAdapter.enable();
        } else
        {
            mNfcAdapter.setModeFlag(4, 0);
            mNfcAdapter.disable();
        }
        return true;
    }

    public void pause()
    {
        Xlog.d("MtkNfcEnabler", "Pause");
        if (mNfcAdapter != null)
        {
            mContext.unregisterReceiver(mReceiver);
            if (mSwitchPreference != null)
                mSwitchPreference.setOnPreferenceChangeListener(null);
            if (mSwitchButton != null)
            {
                mSwitchButton.setOnCheckedChangeListener(null);
                return;
            }
        }
    }

    public void resume()
    {
        Xlog.d("MtkNfcEnabler", "Resume");
        if (mNfcAdapter != null)
        {
            handleNfcStateChanged(mNfcAdapter.getAdapterState());
            mContext.registerReceiver(mReceiver, mIntentFilter);
            if (mSwitchPreference != null)
                mSwitchPreference.setOnPreferenceChangeListener(this);
            if (mSwitchButton != null)
            {
                mSwitchButton.setOnCheckedChangeListener(this);
                return;
            }
        }
    }

}
