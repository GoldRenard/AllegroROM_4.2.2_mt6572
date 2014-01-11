// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.telephony.TelephonyManagerEx;

// Referenced classes of package com.mediatek.phone:
//            SimInfoPreference

public class StkListEntrance extends PreferenceActivity
{

    private static final int REQUEST_TYPE = 302;
    private static final String TAG = "StkListEntrance";
    private static final String baseband = SystemProperties.get("gsm.baseband.capability");
    private static String mDefaultTitle;
    public static int mSlot = -1;
    private static String strTargetClass = null;
    private static String strTargetLoc = null;
    private CellConnMgr mCellMgr;
    private Context mContext;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mSimReceiver;
    private int mTargetClassIndex;
    private TelephonyManagerEx mTelephonyManager;
    private Runnable serviceComplete;

    public StkListEntrance()
    {
        mTargetClassIndex = -1;
        mSimReceiver = new BroadcastReceiver() {

            final StkListEntrance this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    int i = intent.getIntExtra("slotId", -1);
                    int j = intent.getIntExtra("state", -1);
                    Log.i("StkListEntrance", (new StringBuilder()).append("receive notification of  sim slot = ").append(i).append(" status = ").append(j).toString());
                    if (i >= 0 && j >= 0)
                        updateSimState(i, j);
                } else
                if (s.equals("android.intent.action.RADIO_OFF"))
                {
                    android.provider.Settings.System.putLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting", 0L);
                    Log.i("StkListEntrance", "MODEM RESET");
                    finish();
                    return;
                }
            }

            
            {
                this$0 = StkListEntrance.this;
                super();
            }
        }
;
        serviceComplete = new Runnable() {

            final StkListEntrance this$0;

            public void run()
            {
                Log.d("StkListEntrance", "serviceComplete run");
                int i = mCellMgr.getResult();
                Log.d("StkListEntrance", (new StringBuilder()).append("serviceComplete result = ").append(CellConnMgr.resultToString(i)).toString());
                CellConnMgr _tmp = mCellMgr;
                if (2 != i);
            }

            
            {
                this$0 = StkListEntrance.this;
                super();
            }
        }
;
        mCellMgr = new CellConnMgr(serviceComplete);
    }

    private void addSimInfoPreference()
    {
        Log.i("StkListEntrance", "[addSimInfoPreference]+");
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
        {
            int i = android.provider.Telephony.SIMInfo.getInsertedSIMCount(this);
            int j = 0;
            int l;
            for (int k = 0; j < i; k = l)
            {
                l = k + 1;
                android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, k);
                if (siminfo != null)
                {
                    j++;
                    int i1 = mTelephonyManager.getSimIndicatorStateGemini(siminfo.mSlot);
                    Log.i("StkListEntrance", (new StringBuilder()).append("sim status of slot ").append(siminfo.mSlot).append("is ").append(i1).toString());
                    SimInfoPreference siminfopreference = new SimInfoPreference(this, siminfo.mDisplayName, siminfo.mNumber, siminfo.mSlot, i1, siminfo.mColor, siminfo.mDispalyNumberFormat, siminfo.mSimId, false);
                    Log.i("StkListEntrance", (new StringBuilder()).append("[addSimInfoPreference][addPreference] ").append(siminfo.mSlot).toString());
                    preferencescreen.addPreference(siminfopreference);
                }
            }

        }
    }

    private boolean isOnFlightMode()
    {
        int j = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on");
        int i = j;
_L1:
        Log.i("StkListEntrance", (new StringBuilder()).append("airlane mode is ").append(i).toString());
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        return i != 0;
        settingnotfoundexception;
        Log.i("StkListEntrance", "fail to get airlane mode");
        i = 0;
          goto _L1
    }

    private boolean launchStk(int i)
    {
        PackageManager packagemanager;
        String s;
        packagemanager = getApplicationContext().getPackageManager();
        s = null;
        i;
        JVM INSTR tableswitch 0 3: default 40
    //                   0 97
    //                   1 103
    //                   2 109
    //                   3 115;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        ComponentName componentname;
        com.android.internal.telephony.IccCardConstants.State state;
        if (s != null)
        {
            componentname = new ComponentName("com.android.stk", s);
            state = ((GeminiPhone)PhoneFactory.getDefaultPhone()).getIccCardGemini(i).getState();
            if (state != com.android.internal.telephony.IccCardConstants.State.ABSENT)
                break; /* Loop/switch isn't completed */
            showTextToast(getString(0x7f0d0011));
            finish();
        }
        return false;
_L2:
        s = "com.android.stk.StkLauncherActivity";
        continue; /* Loop/switch isn't completed */
_L3:
        s = "com.android.stk.StkLauncherActivityII";
        continue; /* Loop/switch isn't completed */
_L4:
        s = "com.android.stk.StkLauncherActivityIII";
        continue; /* Loop/switch isn't completed */
_L5:
        s = "com.android.stk.StkLauncherActivityIV";
        if (true) goto _L1; else goto _L6
_L6:
        if (isOnFlightMode())
        {
            showTextToast(getString(0x7f0d0012));
            finish();
            return false;
        }
        if (state != com.android.internal.telephony.IccCardConstants.State.READY)
        {
            showTextToast(getString(0x7f0d0013));
            finish();
            return false;
        }
        if (packagemanager.getComponentEnabledSetting(componentname) == 2)
        {
            showTextToast(getString(0x7f0d0010));
            finish();
            return false;
        }
        Intent intent = new Intent();
        Log.i("StkListEntrance", (new StringBuilder()).append("[aaa][onPreferenceTreeClick][mSlot][aName] : ").append(s).toString());
        intent.setClassName("com.android.stk", s);
        try
        {
            startActivity(intent);
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.i("StkListEntrance", "[onPreferenceTreeClick] ActivityNotFoundException happened");
            showTextToast(getString(0x7f0d0010));
            finish();
            return false;
        }
        return false;
    }

    private void setDefaultSIMIndicate(int i)
    {
        Log.i("StkListEntrance", (new StringBuilder()).append("[getSIMState][slotID] : ").append(i).toString());
        int j = mTelephonyManager.getSimIndicatorStateGemini(i);
        Log.i("StkListEntrance", (new StringBuilder()).append("[getSIMState][state] : ").append(j).toString());
        updateSimState(i, j);
    }

    private void showTextToast(String s)
    {
        Toast toast = Toast.makeText(getApplicationContext(), s, 1);
        toast.setGravity(80, 0, 0);
        toast.show();
    }

    private void updateSimState(int i, int j)
    {
        Log.i("StkListEntrance", "[updateSimState]+");
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, i);
        if (siminfo != null)
        {
            Log.i("StkListEntrance", (new StringBuilder()).append("[updateSimState][siminfo.mSimId] : ").append(siminfo.mSimId).toString());
            SimInfoPreference siminfopreference = (SimInfoPreference)findPreference(String.valueOf(siminfo.mSimId));
            Log.i("StkListEntrance", "[updateSimState][setStatus] ");
            if (siminfopreference != null)
            {
                siminfopreference.setStatus(j);
                Log.i("StkListEntrance", (new StringBuilder()).append("[updateSimState][Color] ").append(siminfo.mColor).toString());
                siminfopreference.setColor(siminfo.mColor);
            }
            Log.i("StkListEntrance", (new StringBuilder()).append("updateSimState sim = ").append(siminfo.mSimId).append(" status = ").append(j).toString());
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Log.i("StkListEntrance", "[onCreate] +");
        mCellMgr.register(this);
        mContext = this;
        addPreferencesFromResource(0x7f060020);
        mTelephonyManager = TelephonyManagerEx.getDefault();
        Log.i("StkListEntrance", (new StringBuilder()).append("baseband is ").append(baseband).toString());
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.RADIO_OFF");
        registerReceiver(mSimReceiver, mIntentFilter);
        setTitle(getResources().getString(0x7f0d000f));
        Log.i("StkListEntrance", "[onCreate][addSimInfoPreference] ");
        addSimInfoPreference();
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mSimReceiver);
        mCellMgr.unregister();
    }

    protected void onPause()
    {
        super.onPause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        Log.i("StkListEntrance", "Enter onPreferenceClick function.");
        strTargetLoc = null;
        strTargetClass = null;
        Log.i("StkListEntrance", "[onPreferenceTreeClick] +");
        GeminiPhone geminiphone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        Log.i("StkListEntrance", (new StringBuilder()).append("[onPreferenceTreeClick][Click SIM1][SimState] : ").append(geminiphone.getIccCardGemini(0).getState()).toString());
        Log.i("StkListEntrance", (new StringBuilder()).append("[onPreferenceTreeClick][Click SIM2][SimState] : ").append(geminiphone.getIccCardGemini(1).getState()).toString());
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, Integer.valueOf(preference.getKey()).intValue());
        if (siminfo != null)
            mSlot = siminfo.mSlot;
        Log.i("StkListEntrance", (new StringBuilder()).append("[aaa][onPreferenceTreeClick][mSlot] : ").append(mSlot).toString());
        if (mSlot == 0)
            launchStk(0);
        else
        if (mSlot == 1)
            launchStk(1);
        else
        if (mSlot == 2)
            launchStk(2);
        else
        if (mSlot == 3)
            launchStk(3);
        Log.i("StkListEntrance", "[onPreferenceTreeClick] -");
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        strTargetLoc = null;
        strTargetClass = null;
        Log.i("StkListEntrance", "[onResume]");
        setDefaultSIMIndicate(0);
        setDefaultSIMIndicate(1);
    }



}
