// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Activity;
import android.content.*;
import android.os.Bundle;
import android.os.ServiceManager;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import com.android.internal.telephony.ITelephony;
import com.android.settings.Settings;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            SimInfoPreference

public class SimListEntrance extends SettingsPreferenceFragment
{

    public static final int APN_SETTING_INDEX = 2;
    public static final int PIN_SETTING_INDEX = 0;
    public static final int SIM_CONTACTS_SETTING_INDEX = 3;
    public static final int SIM_STATUS_INDEX = 1;
    private static final String TAG = "SimListEntrance";
    private static final String TARGETCLASSLIST[] = {
        "com.android.settings.IccLockSettings", "com.android.settings.deviceinfo.SimStatusGemini", "com.android.settings.ApnSettings", "com.mediatek.gemini.GeminiSIMTetherInfo"
    };
    private static final int TWO_SIMCARD = 2;
    private Context mContext;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mSimReceiver;
    private int mTargetClassIndex;
    private ITelephony mTelephony;

    public SimListEntrance()
    {
        mTargetClassIndex = -1;
        mSimReceiver = new BroadcastReceiver() {

            final SimListEntrance this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.i("SimListEntrance", "receiver: TelephonyIntents.ACTION_SIM_INFO_UPDATE");
                    addSimInfoPreference();
                } else
                if (s.equals("android.intent.action.SIM_NAME_UPDATE"))
                {
                    Xlog.i("SimListEntrance", "receiver: TelephonyIntents.ACTION_SIM_NAME_UPDATE");
                    int i = intent.getIntExtra("simId", -1);
                    if (i >= 0)
                    {
                        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(context, i);
                        if (siminfo != null)
                        {
                            SimInfoPreference siminfopreference = (SimInfoPreference)findPreference(String.valueOf(siminfo.mSimId));
                            if (siminfopreference != null)
                            {
                                siminfopreference.setName(siminfo.mDisplayName);
                                return;
                            }
                        }
                    }
                }
            }

            
            {
                this$0 = SimListEntrance.this;
                super();
            }
        }
;
    }

    private void addSimInfoPreference()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
        {
            preferencescreen.removeAll();
            List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
            int i = list.size();
            Xlog.d("SimListEntrance", (new StringBuilder()).append("there are simNum ").append(i).append(" sim card inserted").toString());
            if (i == 0)
            {
                Xlog.d("SimListEntrance", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                Intent intent = new Intent(getActivity(), com/android/settings/Settings);
                intent.addFlags(0x4000000);
                startActivity(intent);
            } else
            if (i == 1)
            {
                if (3 == mTargetClassIndex)
                    preferencescreen.setEnabled(false);
            } else
            {
                preferencescreen.setEnabled(true);
            }
            Collections.sort(list, new GeminiUtils.SIMInfoComparable());
            android.provider.Telephony.SIMInfo siminfo;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); preferencescreen.addPreference(new SimInfoPreference(getActivity(), siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, 6, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, false, false)))
                siminfo = (android.provider.Telephony.SIMInfo)iterator.next();

        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050033);
        Bundle bundle1 = getArguments();
        if (bundle1 != null)
        {
            mTargetClassIndex = bundle1.getInt("type", -1);
            String s = bundle1.getString("title");
            if (s != null)
                getActivity().setTitle(s);
        }
        if (mTargetClassIndex < 0)
        {
            Xlog.e("SimListEntrance", "target class index is wrong");
        } else
        {
            mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
            mIntentFilter.addAction("android.intent.action.SIM_NAME_UPDATE");
            getActivity().registerReceiver(mSimReceiver, mIntentFilter);
            addSimInfoPreference();
        }
        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mTargetClassIndex >= 0)
            getActivity().unregisterReceiver(mSimReceiver);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
label0:
        {
            String s = preference.getKey();
            Intent intent = new Intent();
            intent.setClassName("com.android.settings", TARGETCLASSLIST[mTargetClassIndex]);
            if (mTargetClassIndex == 3)
            {
                intent.putExtra("simid", Long.valueOf(s));
            } else
            {
                int i = android.provider.Telephony.SIMInfo.getSlotById(getActivity(), Long.valueOf(s).longValue());
                if (i < 0)
                    break label0;
                intent.putExtra("slotid", i);
            }
            startActivity(intent);
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
    }


}
