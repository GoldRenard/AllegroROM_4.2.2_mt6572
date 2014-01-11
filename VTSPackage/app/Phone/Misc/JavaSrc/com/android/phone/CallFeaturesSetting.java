// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.content.*;
import android.os.Bundle;
import android.os.Vibrator;
import android.preference.*;
import android.view.MenuItem;
import com.mediatek.settings.*;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneUtils, GsmUmtsCallForwardOptions, GsmUmtsAdditionalCallOptions

public class CallFeaturesSetting extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{

    public static final String ACTION_ADD_VOICEMAIL = "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL";
    public static final String ACTION_CONFIGURE_VOICEMAIL = "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL";
    private static final String BUTTON_CALL_ADDITIONAL_KEY = "button_more_expand_key";
    private static final String BUTTON_CALL_BAR_KEY = "button_cb_expand_key";
    private static final String BUTTON_CALL_FWD_KEY = "button_cf_expand_key";
    private static final String BUTTON_CALL_VOICEMAIL_KEY = "button_voicemail_key";
    private static final String BUTTON_IP_PREFIX_KEY = "button_ip_prefix_key";
    private static final boolean DBG = true;
    static final int DTMF_TONE_TYPE_LONG = 1;
    static final int DTMF_TONE_TYPE_NORMAL = 0;
    public static final String FWD_NUMBER_EXTRA = "com.android.phone.ForwardingNumber";
    public static final String FWD_NUMBER_TIME_EXTRA = "com.android.phone.ForwardingNumberTime";
    public static final String HAC_KEY = "HACSetting";
    public static final String HAC_VAL_OFF = "OFF";
    public static final String HAC_VAL_ON = "ON";
    private static final String LOG_TAG = "Settings/CallFeaturesSetting";
    public static final String SIGNOUT_EXTRA = "com.android.phone.Signout";
    public static final String VM_NUMBER_EXTRA = "com.android.phone.VoicemailNumber";
    private Preference mButtonCallAdditional;
    private Preference mButtonCallBar;
    private Preference mButtonCallFwd;
    private Preference mButtonIpPrefix;
    private Preference mButtonVoiceMail;
    private PreCheckForRunning mPreCfr;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final CallFeaturesSetting this$0;

        public void onReceive(Context context, Intent intent)
        {
            Xlog.d("Settings/CallFeaturesSetting", (new StringBuilder()).append("[action = ").append(intent.getAction()).append("]").toString());
            setScreenEnabled();
        }

            
            {
                this$0 = CallFeaturesSetting.this;
                super();
            }
    }
;
    private int mSimId;

    public CallFeaturesSetting()
    {
        mSimId = 0;
        mPreCfr = null;
    }

    public static boolean getVibrateWhenRinging(Context context)
    {
        Vibrator vibrator = (Vibrator)context.getSystemService("vibrator");
        return vibrator != null && vibrator.hasVibrator() && android.provider.Settings.System.getInt(context.getContentResolver(), "vibrate_when_ringing", 0) != 0;
    }

    private void setScreenEnabled()
    {
        boolean flag;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == 1)
            flag = true;
        else
            flag = false;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0)
        {
            finish();
            return;
        }
        if (list.size() == 1)
        {
            mSimId = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            boolean flag1;
            if (CallSettings.isRadioOn(mSimId) && !flag)
                flag1 = true;
            else
                flag1 = false;
            mButtonCallAdditional.setEnabled(flag1);
            mButtonCallFwd.setEnabled(flag1);
            mButtonCallBar.setEnabled(flag1);
            mButtonVoiceMail.setEnabled(flag1);
            mButtonIpPrefix.setEnabled(flag1);
            mPreCfr.mByPass = false;
            return;
        } else
        {
            mPreCfr.mByPass = true;
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060021);
        addPreferencesFromResource(0x7f060011);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonCallAdditional = preferencescreen.findPreference("button_more_expand_key");
        mButtonCallFwd = preferencescreen.findPreference("button_cf_expand_key");
        mButtonCallBar = preferencescreen.findPreference("button_cb_expand_key");
        mButtonVoiceMail = preferencescreen.findPreference("button_voicemail_key");
        mButtonIpPrefix = preferencescreen.findPreference("button_ip_prefix_key");
        if (!PhoneUtils.isSupportFeature("IP_DIAL"))
        {
            preferencescreen.removePreference(mButtonIpPrefix);
            mButtonIpPrefix = null;
        }
        mPreCfr = new PreCheckForRunning(this);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mPreCfr != null)
            mPreCfr.deRegister();
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

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        return false;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (!CallSettings.isMultipleSim())
        {
            if (preference == mButtonVoiceMail)
            {
                Intent intent8 = new Intent(this, com/mediatek/settings/VoiceMailSetting);
                intent8.setAction("android.intent.action.MAIN");
                mPreCfr.checkToRun(intent8, mSimId, 302);
                return true;
            }
            if (preference == mButtonCallFwd)
            {
                Intent intent7 = new Intent(this, com/android/phone/GsmUmtsCallForwardOptions);
                intent7.setAction("android.intent.action.MAIN");
                mPreCfr.checkToRun(intent7, mSimId, 302);
                return true;
            }
            if (preference == mButtonCallBar)
            {
                Intent intent6 = new Intent(this, com/mediatek/settings/CallBarring);
                intent6.setAction("android.intent.action.MAIN");
                mPreCfr.checkToRun(intent6, mSimId, 302);
                return true;
            }
            if (preference == mButtonCallAdditional)
            {
                Intent intent5 = new Intent(this, com/android/phone/GsmUmtsAdditionalCallOptions);
                intent5.setAction("android.intent.action.MAIN");
                mPreCfr.checkToRun(intent5, mSimId, 302);
                return true;
            } else
            {
                return false;
            }
        }
        if (preference == mButtonVoiceMail)
        {
            Intent intent4 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent4.putExtra("INIT_TITLE_NAME", 0x7f0d00f0);
            intent4.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent4.putExtra("TARGET_CLASS", "com.mediatek.settings.VoiceMailSetting");
            mPreCfr.checkToRun(intent4, mSimId, 302);
            return true;
        }
        if (preference == mButtonCallFwd)
        {
            Intent intent3 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent3.putExtra("INIT_TITLE_NAME", 0x7f0d01c6);
            intent3.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent3.putExtra("TARGET_CLASS", "com.android.phone.GsmUmtsCallForwardOptions");
            mPreCfr.checkToRun(intent3, mSimId, 302);
            return true;
        }
        if (preference == mButtonCallBar)
        {
            Xlog.d("Settings/CallFeaturesSetting", (new StringBuilder()).append("onPreferenceTreeClick , call barring key , simId= ").append(mSimId).toString());
            Intent intent2 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent2.putExtra("INIT_TITLE_NAME", 0x7f0d00b9);
            intent2.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent2.putExtra("TARGET_CLASS", "com.mediatek.settings.CallBarring");
            mPreCfr.checkToRun(intent2, mSimId, 302);
            return true;
        }
        if (preference == mButtonCallAdditional)
        {
            Xlog.d("Settings/CallFeaturesSetting", (new StringBuilder()).append("onPreferenceTreeClick , call cost key , simId= ").append(mSimId).toString());
            Intent intent1 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent1.putExtra("INIT_TITLE_NAME", 0x7f0d01b8);
            intent1.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent1.putExtra("TARGET_CLASS", "com.android.phone.GsmUmtsAdditionalCallOptions");
            mPreCfr.checkToRun(intent1, mSimId, 302);
            return true;
        }
        if (mButtonIpPrefix == preference)
        {
            Intent intent = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent.putExtra("INIT_TITLE_NAME", 0x7f0d0093);
            intent.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent.putExtra("TARGET_CLASS", "com.mediatek.settings.IpPrefixPreference");
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
