// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Activity;
import android.content.*;
import android.os.*;
import android.preference.PreferenceScreen;
import android.widget.ListView;
import com.android.internal.telephony.ITelephony;
import com.android.settings.Settings;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            SimInfoPreference

public class SimCheckboxEntrance extends SettingsPreferenceFragment
{

    private static final String TAG = "SimCheckboxEntrance";
    private boolean mDisableWhenRadioOff;
    private IntentFilter mIntentFilter;
    protected List mSimList;
    private BroadcastReceiver mSimReceiver;
    private ITelephony mTelephony;

    public SimCheckboxEntrance()
    {
        mDisableWhenRadioOff = false;
        mSimReceiver = new BroadcastReceiver() {

            final SimCheckboxEntrance this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    int j = intent.getIntExtra("slotId", -1);
                    int k = intent.getIntExtra("state", -1);
                    Xlog.i("SimCheckboxEntrance", (new StringBuilder()).append("receive notification: state of sim slot ").append(j).append(" is ").append(k).toString());
                    if (j >= 0 && k >= 0)
                        updateSimState(j, k);
                } else
                {
                    if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        Xlog.i("SimCheckboxEntrance", "receiver: TelephonyIntents.ACTION_SIM_INFO_UPDATE");
                        addSimInfoPreference();
                        return;
                    }
                    if (s.equals("android.intent.action.SIM_NAME_UPDATE"))
                    {
                        Xlog.i("SimCheckboxEntrance", "receiver: TelephonyIntents.ACTION_SIM_NAME_UPDATE");
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
            }

            
            {
                this$0 = SimCheckboxEntrance.this;
                super();
            }
        }
;
    }

    private int getSimIndicator(int i)
    {
label0:
        {
            int j = -1;
            Xlog.d("SimCheckboxEntrance", (new StringBuilder()).append("getSimIndicator---slotId=").append(i).toString());
            int k;
            try
            {
                if (mTelephony == null)
                    break label0;
                k = mTelephony.getSimIndicatorStateGemini(i);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimCheckboxEntrance", "RemoteException");
                return j;
            }
            catch (NullPointerException nullpointerexception)
            {
                Xlog.e("SimCheckboxEntrance", "NullPointerException");
                return j;
            }
            j = k;
        }
        return j;
    }

    private void updateSimState(int i, int j)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), i);
        if (siminfo != null)
        {
            SimInfoPreference siminfopreference = (SimInfoPreference)findPreference(String.valueOf(siminfo.mSimId));
            if (siminfopreference != null)
            {
                siminfopreference.setStatus(j);
                if (mDisableWhenRadioOff)
                {
                    boolean flag;
                    if (j == 1)
                        flag = false;
                    else
                        flag = true;
                    siminfopreference.setEnabled(flag);
                    StringBuilder stringbuilder = (new StringBuilder()).append("simInfoPref.setEnabled(); ");
                    boolean flag1 = false;
                    if (j != 1)
                        flag1 = true;
                    Xlog.i("SimCheckboxEntrance", stringbuilder.append(flag1).toString());
                }
                Xlog.i("SimCheckboxEntrance", (new StringBuilder()).append("updateSimState of sim ").append(siminfo.mSimId).append(" is ").append(j).toString());
                return;
            }
        }
    }

    protected void addSimInfoPreference()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
        {
            preferencescreen.removeAll();
            mSimList = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
            Collections.sort(mSimList, new GeminiUtils.SIMInfoComparable());
            if (mSimList.size() == 0)
            {
                Xlog.d("SimCheckboxEntrance", (new StringBuilder()).append("Hot swap_mSimList.size()=").append(mSimList.size()).toString());
                Intent intent = new Intent(getActivity(), com/android/settings/Settings);
                intent.addFlags(0x4000000);
                startActivity(intent);
            }
            if (mSimList != null)
            {
                Iterator iterator = mSimList.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                    int i = getSimIndicator(siminfo.mSlot);
                    SimInfoPreference siminfopreference = new SimInfoPreference(getActivity(), siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, i, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, true, true, true);
                    Xlog.i("SimCheckboxEntrance", (new StringBuilder()).append("state of sim ").append(siminfo.mSimId).append(" is ").append(i).toString());
                    if (siminfopreference != null)
                    {
                        updateCheckState(siminfopreference, siminfo);
                        if (mDisableWhenRadioOff)
                        {
                            boolean flag;
                            if (i == 1)
                                flag = false;
                            else
                                flag = true;
                            siminfopreference.setEnabled(flag);
                            StringBuilder stringbuilder = (new StringBuilder()).append("simInfoPref.setEnabled(); ");
                            boolean flag1;
                            if (i == 1)
                                flag1 = false;
                            else
                                flag1 = true;
                            Xlog.i("SimCheckboxEntrance", stringbuilder.append(flag1).toString());
                        }
                        preferencescreen.addPreference(siminfopreference);
                    }
                } while (true);
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050032);
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        getActivity().registerReceiver(mSimReceiver, mIntentFilter);
        mDisableWhenRadioOff = shouldDisableWhenRadioOff();
        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        addSimInfoPreference();
    }

    public void onDestroy()
    {
        super.onDestroy();
        getActivity().unregisterReceiver(mSimReceiver);
    }

    public void onResume()
    {
        super.onResume();
    }

    public void onStart()
    {
        super.onStart();
        getListView().setItemsCanFocus(false);
    }

    protected boolean shouldDisableWhenRadioOff()
    {
        return false;
    }

    protected void updateCheckState(SimInfoPreference siminfopreference, android.provider.Telephony.SIMInfo siminfo)
    {
    }

}
