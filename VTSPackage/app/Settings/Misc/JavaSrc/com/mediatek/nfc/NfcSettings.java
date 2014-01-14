// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.nfc;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.preference.*;
import android.widget.Switch;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.nfc:
//            MtkNfcEnabler

public class NfcSettings extends SettingsPreferenceFragment
{

    private static final String KEY_ANDROID_BEAM = "nfc_android_beam";
    private static final String KEY_NFC_P2P_MODE = "nfc_p2p_mode";
    private static final String KEY_NFC_TAG_RW = "nfc_rw_tag";
    private static final String TAG = "NfcSettings";
    private Preference mAndroidBeam;
    private IntentFilter mIntentFilter;
    private NfcAdapter mNfcAdapter;
    private MtkNfcEnabler mNfcEnabler;
    private CheckBoxPreference mNfcP2pModePref;
    private CheckBoxPreference mNfcRwTagPref;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NfcSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            if ("android.nfc.action.ADAPTER_STATE_CHANGED".equals(intent.getAction()))
                updatePreferenceEnabledStatus();
        }

            
            {
                this$0 = NfcSettings.this;
                super();
            }
    }
;


    private void initPreferences()
    {
        mNfcP2pModePref = (CheckBoxPreference)findPreference("nfc_p2p_mode");
        mAndroidBeam = findPreference("nfc_android_beam");
        mNfcRwTagPref = (CheckBoxPreference)findPreference("nfc_rw_tag");
    }

    private void updatePreferenceEnabledStatus()
    {
        if (mNfcAdapter.getAdapterState() == 3)
        {
            mNfcP2pModePref.setEnabled(true);
            mNfcRwTagPref.setEnabled(true);
            return;
        } else
        {
            mNfcP2pModePref.setEnabled(false);
            mNfcRwTagPref.setEnabled(false);
            return;
        }
    }

    private void updatePreferences()
    {
        boolean flag = true;
        if (mNfcAdapter.isNdefPushEnabled())
            mAndroidBeam.setSummary(0x7f0b0429);
        else
            mAndroidBeam.setSummary(0x7f0b042a);
        updatePreferenceEnabledStatus();
        CheckBoxPreference checkboxpreference = mNfcP2pModePref;
        boolean flag1;
        if (mNfcAdapter.getModeFlag(2) == flag)
            flag1 = flag;
        else
            flag1 = false;
        checkboxpreference.setChecked(flag1);
        CheckBoxPreference checkboxpreference1 = mNfcRwTagPref;
        if (mNfcAdapter.getModeFlag(flag) != flag)
            flag = false;
        checkboxpreference1.setChecked(flag);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050021);
        Activity activity = getActivity();
        Switch switch1 = new Switch(activity);
        if (activity instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)activity;
            if (preferenceactivity.onIsHidingHeaders() || !preferenceactivity.onIsMultiPane())
            {
                switch1.setPadding(0, 0, activity.getResources().getDimensionPixelSize(0x7f0d0002), 0);
                activity.getActionBar().setDisplayOptions(16, 16);
                activity.getActionBar().setCustomView(switch1, new android.app.ActionBar.LayoutParams(-2, -2, 21));
                activity.getActionBar().setTitle(0x7f0b0426);
            }
        }
        mNfcAdapter = NfcAdapter.getDefaultAdapter(activity);
        mNfcEnabler = new MtkNfcEnabler(activity, null, switch1, mNfcAdapter);
        mIntentFilter = new IntentFilter("android.nfc.action.ADAPTER_STATE_CHANGED");
        initPreferences();
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
        if (mNfcEnabler != null)
            mNfcEnabler.pause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.equals(mAndroidBeam))
            startFragment(this, "com.android.settings.nfc.AndroidBeam", 0, null);
        else
        if (preference.equals(mNfcP2pModePref))
        {
            Xlog.d("NfcSettings", "p2p mode");
            boolean flag1 = mNfcP2pModePref.isChecked();
            int j = 0;
            if (flag1)
                j = 1;
            mNfcAdapter.setModeFlag(2, j);
        } else
        if (preference.equals(mNfcRwTagPref))
        {
            Xlog.d("NfcSettings", "tag rw mode");
            boolean flag = mNfcRwTagPref.isChecked();
            int i = 0;
            if (flag)
                i = 1;
            mNfcAdapter.setModeFlag(1, i);
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        if (mNfcEnabler != null)
            mNfcEnabler.resume();
        getActivity().registerReceiver(mReceiver, mIntentFilter);
        updatePreferences();
    }

}
