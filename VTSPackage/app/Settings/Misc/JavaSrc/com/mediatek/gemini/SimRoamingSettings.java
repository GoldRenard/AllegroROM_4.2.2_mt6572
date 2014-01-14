// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.ListPreference;
import android.preference.Preference;
import com.android.internal.telephony.ITelephony;
import com.android.settings.*;
import com.mediatek.settings.ext.ISimRoamingExt;
import com.mediatek.xlog.Xlog;
import java.util.List;

public class SimRoamingSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_ROAING_REMINDER_SETTING = "roaming_reminder_settings";
    private static final String KEY_ROAMING_ENTRANCE = "data_roaming_settings";
    private static final String TAG = "SimRoamingSettings";
    private ISimRoamingExt mExt;
    private ListPreference mRoamReminder;
    private CharSequence mRoamingReminderSummary[];
    private BroadcastReceiver mSimReceiver;
    private ITelephony mTelephony;

    public SimRoamingSettings()
    {
        mSimReceiver = new BroadcastReceiver() {

            final SimRoamingSettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("SimRoamingSettings", "receive ACTION_SIM_INFO_UPDATE");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
                    if (list != null && list.size() == 0)
                    {
                        Xlog.d("SimRoamingSettings", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                        goBackSettings();
                    }
                }
            }

            
            {
                this$0 = SimRoamingSettings.this;
                super();
            }
        }
;
    }

    private void goBackSettings()
    {
        if (isResumed())
        {
            Intent intent = new Intent(getActivity(), com/android/settings/Settings);
            intent.addFlags(0x4000000);
            startActivity(intent);
            finish();
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050037);
        mRoamReminder = (ListPreference)findPreference("roaming_reminder_settings");
        mRoamReminder.setOnPreferenceChangeListener(this);
        mRoamingReminderSummary = getResources().getTextArray(0x7f070049);
        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mExt = Utils.getSimRoamingExtPlugin(getActivity());
        getActivity().registerReceiver(mSimReceiver, new IntentFilter("android.intent.action.SIM_INFO_UPDATE"));
    }

    public void onDestroy()
    {
        super.onDestroy();
        getActivity().unregisterReceiver(mSimReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if ("roaming_reminder_settings".equals(preference.getKey()))
        {
            Xlog.i("SimRoamingSettings", "KEY_ROAING_REMINDER_SETTING.equals(key)");
            int i = Integer.parseInt((String)obj);
            mRoamReminder.setValueIndex(i);
            mRoamReminder.setSummary(mRoamReminder.getEntry());
            android.provider.Settings.System.putInt(getContentResolver(), "roaming_reminder_mode_setting", i);
            Intent intent = new Intent("android.intent.action.ROAMING_REMINDER_SETTING");
            intent.putExtra("mode", i);
            getActivity().sendBroadcast(intent);
            if (i == 0 && mTelephony != null)
                try
                {
                    mTelephony.setRoamingIndicatorNeddedProperty(true, true);
                }
                catch (RemoteException remoteexception)
                {
                    Xlog.e("SimRoamingSettings", "mTelephony exception");
                }
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
        int i = android.provider.Settings.System.getInt(getContentResolver(), "roaming_reminder_mode_setting", 0);
        Xlog.i("SimRoamingSettings", (new StringBuilder()).append("prevalue is ").append(i).toString());
        mRoamReminder.setValueIndex(i);
        mRoamReminder.setSummary(mRoamingReminderSummary[i]);
        Preference preference = findPreference("data_roaming_settings");
        if (preference != null)
            mExt.setSummary(preference);
    }

}
