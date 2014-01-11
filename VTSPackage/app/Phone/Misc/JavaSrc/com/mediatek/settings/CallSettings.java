// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.view.MenuItem;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.*;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            OthersSettings, VTAdvancedSetting, VTAdvancedSettingEx

public class CallSettings extends PreferenceActivity
{
    public static class SIMInfoComparable
        implements Comparator
    {

        public int compare(android.provider.Telephony.SIMInfo siminfo, android.provider.Telephony.SIMInfo siminfo1)
        {
            return siminfo.mSlot - siminfo1.mSlot;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((android.provider.Telephony.SIMInfo)obj, (android.provider.Telephony.SIMInfo)obj1);
        }

    }


    private static final String LOG_TAG = "Settings/CallSettings";
    private static final String MD_CAPABILITY_SLOT_1 = "gsm.baseband.capability";
    private static final String MD_CAPABILITY_SLOT_2 = "gsm.baseband.capability2";
    private static final String MD_CAPABILITY_SLOT_3 = "gsm.baseband.capability3";
    private static final String MD_CAPABILITY_SLOT_4 = "gsm.baseband.capability4";
    public static final int MODEM_3G = 3;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final CallSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("Settings/CallSettings", (new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                setScreenEnabled();
        }

            
            {
                this$0 = CallSettings.this;
                super();
            }
    }
;
    Preference mSipCallSetting;
    Preference mVTSetting;
    Preference mVoiceSetting;

    public CallSettings()
    {
        mVTSetting = null;
        mVoiceSetting = null;
        mSipCallSetting = null;
    }

    public static int[] get3GSimCardSlots(Activity activity)
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(activity).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (getBaseband(siminfo.mSlot) > 3)
                arraylist.add(Integer.valueOf(siminfo.mSlot));
        } while (true);
        int ai[] = new int[arraylist.size()];
        for (int i = 0; i < arraylist.size(); i++)
            ai[i] = ((Integer)arraylist.get(i)).intValue();

        return ai;
    }

    public static long[] get3GSimCards(Activity activity)
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(activity).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (getBaseband(siminfo.mSlot) > 3)
                arraylist.add(Long.valueOf(siminfo.mSimId));
        } while (true);
        long al[] = new long[arraylist.size()];
        for (int i = 0; i < arraylist.size(); i++)
            al[i] = ((Long)arraylist.get(i)).longValue();

        return al;
    }

    public static int getBaseband(int i)
    {
        String s = null;
        i;
        JVM INSTR tableswitch 0 3: default 32
    //                   0 151
    //                   1 157
    //                   2 163
    //                   3 169;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        String s1 = SystemProperties.get(s);
        int j;
        j = 0;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_57;
        int k = Integer.parseInt(s1);
        j = k;
_L6:
        Xlog.i("Settings/CallSettings", (new StringBuilder()).append("[slot = ").append(i).append("]").toString());
        Xlog.i("Settings/CallSettings", (new StringBuilder()).append("[propertyKey = ").append(s).append("]").toString());
        Xlog.i("Settings/CallSettings", (new StringBuilder()).append("[baseband = ").append(j).append("]").toString());
        return j;
_L2:
        s = "gsm.baseband.capability";
          goto _L1
_L3:
        s = "gsm.baseband.capability2";
          goto _L1
_L4:
        s = "gsm.baseband.capability3";
          goto _L1
_L5:
        s = "gsm.baseband.capability4";
          goto _L1
        NumberFormatException numberformatexception;
        numberformatexception;
        Xlog.i("Settings/CallSettings", "get base band error");
        j = 0;
          goto _L6
    }

    public static void goToMobileNetworkSettings(Activity activity)
    {
        Intent intent = new Intent(activity, com/android/phone/MobileNetworkSettings);
        intent.setAction("android.intent.action.MAIN");
        intent.addFlags(0x4000000);
        activity.startActivity(intent);
        activity.finish();
    }

    public static void goToOthersSettings(Activity activity)
    {
        Intent intent = new Intent(activity, com/mediatek/settings/OthersSettings);
        intent.setAction("android.intent.action.MAIN");
        intent.addFlags(0x4000000);
        activity.startActivity(intent);
        activity.finish();
    }

    public static void goUpToTopLevelSetting(Activity activity)
    {
        Intent intent = new Intent(activity, com/mediatek/settings/CallSettings);
        intent.setAction("android.intent.action.MAIN");
        intent.addFlags(0x4000000);
        activity.startActivity(intent);
        activity.finish();
    }

    public static boolean isMultipleSim()
    {
        return true;
    }

    private boolean isOnlyVt()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        return list.size() == 1 && getBaseband(((android.provider.Telephony.SIMInfo)list.get(0)).mSlot) > 3;
    }

    public static boolean isRadioOn(int i)
    {
        Phone phone = PhoneGlobals.getPhone();
        if (isMultipleSim() && (phone instanceof GeminiPhone))
            return ((GeminiPhone)phone).isRadioOnGemini(i);
        return phone.getServiceState().getState() != 3;
    }

    private void setScreenEnabled()
    {
        boolean flag = true;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (isMultipleSim())
        {
            int ai[] = get3GSimCardSlots(this);
            if (mVTSetting != null)
            {
                Preference preference1 = mVTSetting;
                boolean flag2;
                if (list.size() > 0 && ai.length > 0)
                    flag2 = flag;
                else
                    flag2 = false;
                preference1.setEnabled(flag2);
            }
            Preference preference = mVoiceSetting;
            if (list.size() <= 0)
                flag = false;
            preference.setEnabled(flag);
            return;
        }
        boolean flag1 = TelephonyManager.getDefault().hasIccCard();
        if (mVTSetting != null)
            mVTSetting.setEnabled(flag1);
        mVoiceSetting.setEnabled(flag1);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060001);
        mVTSetting = findPreference("button_vedio_call_key");
        mVoiceSetting = findPreference("button_voice_call_key");
        if (!PhoneUtils.isVoipSupported())
            getPreferenceScreen().removePreference(findPreference("button_internet_call_key"));
        getPreferenceScreen().removePreference(mVTSetting);
        mVTSetting = null;
        IntentFilter intentfilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mVTSetting)
        {
            Intent intent = new Intent();
            if (isOnlyVt())
                intent.setClass(this, com/mediatek/settings/VTAdvancedSetting);
            else
                intent.setClass(this, com/mediatek/settings/VTAdvancedSettingEx);
            startActivity(intent);
            return true;
        } else
        {
            return false;
        }
    }

    public void onResume()
    {
        super.onResume();
        setScreenEnabled();
    }

}
