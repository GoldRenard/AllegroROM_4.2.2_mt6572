// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.view.MenuItem;
import com.android.phone.PhoneUtils;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.OthersSettingsExtension;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            PreCheckForRunning, CallSettings, FdnSetting2, MultipleSimActivity

public class OthersSettings extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String BUTTON_INTER_KEY = "international_dialing_key";
    private static final String BUTTON_OTHERS_DUAL_MIC_KEY = "dual_mic_key";
    private static final String BUTTON_OTHERS_FDN_KEY = "button_fdn_key";
    private static final String BUTTON_OTHERS_MINUTE_REMINDER_KEY = "minute_reminder_key";
    private static final String BUTTON_TTY_KEY = "button_tty_mode_key";
    private static final int DEFAULT_INTER_DIALING_VALUE = 0;
    private static final int INTER_DIALING_OFF = 0;
    private static final int INTER_DIALING_ON = 1;
    private static final String LOG_TAG = "Settings/OthersSettings";
    private CheckBoxPreference mButtonDualMic;
    private Preference mButtonFdn;
    private CheckBoxPreference mButtonInter;
    private CheckBoxPreference mButtonMr;
    private ListPreference mButtonTTY;
    private OthersSettingsExtension mExtension;
    PreCheckForRunning mPreCfr;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final OthersSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("Settings/OthersSettings", (new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.AIRPLANE_MODE".equals(s))
            {
                setScreenEnabled();
            } else
            {
                if ("android.intent.action.SIM_INDICATOR_STATE_CHANGED".equals(s))
                {
                    setScreenEnabled();
                    return;
                }
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                {
                    setScreenEnabled();
                    return;
                }
            }
        }

            
            {
                this$0 = OthersSettings.this;
                super();
            }
    }
;
    private int mSimId;

    public OthersSettings()
    {
        mSimId = 0;
        mPreCfr = null;
    }

    public static void goUpToTopLevelSetting(Activity activity)
    {
        Intent intent = new Intent(activity, com/mediatek/settings/OthersSettings);
        intent.setAction("android.intent.action.MAIN");
        intent.addFlags(0x4000000);
        activity.startActivity(intent);
        activity.finish();
    }

    private void handleTTYChange(Preference preference, Object obj)
    {
        int i = Integer.valueOf((String)obj).intValue();
        int j = android.provider.Settings.Secure.getInt(getContentResolver(), "preferred_tty_mode", 0);
        Xlog.d("Settings/OthersSettings", (new StringBuilder()).append("handleTTYChange: requesting set TTY mode enable (TTY) to").append(Integer.toString(i)).toString());
        if (i != j)
        {
            switch (i)
            {
            case 0: // '\0'
            case 1: // '\001'
            case 2: // '\002'
            case 3: // '\003'
                android.provider.Settings.Secure.putInt(getContentResolver(), "preferred_tty_mode", i);
                break;

            default:
                i = 0;
                break;
            }
            mButtonTTY.setValue(Integer.toString(i));
            updatePreferredTtyModeSummary(i);
            Intent intent = new Intent("com.android.internal.telephony.cdma.intent.action.TTY_PREFERRED_MODE_CHANGE");
            intent.putExtra("ttyPreferredMode", i);
            sendBroadcast(intent);
        }
    }

    private void setScreenEnabled()
    {
        boolean flag = true;
        int i;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == flag)
            i = ((flag) ? 1 : 0);
        else
            i = 0;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0)
        {
            mButtonFdn.setEnabled(false);
            return;
        }
        if (list.size() == flag)
        {
            mPreCfr.mByPass = false;
            mSimId = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            boolean flag1 = CallSettings.isRadioOn(mSimId);
            Preference preference = mButtonFdn;
            if (!flag1 || i != 0)
                flag = false;
            preference.setEnabled(flag);
            return;
        } else
        {
            mPreCfr.mByPass = flag;
            return;
        }
    }

    private void updatePreferredTtyModeSummary(int i)
    {
        String as[] = getResources().getStringArray(0x7f070036);
        switch (i)
        {
        case 0: // '\0'
        case 1: // '\001'
        case 2: // '\002'
        case 3: // '\003'
            mButtonTTY.setSummary(as[i]);
            return;
        }
        mButtonTTY.setEnabled(false);
        mButtonTTY.setSummary(as[0]);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060017);
        mExtension = ExtensionManager.getInstance().getOthersSettingsExtension();
        mButtonFdn = findPreference("button_fdn_key");
        mButtonMr = (CheckBoxPreference)findPreference("minute_reminder_key");
        mButtonDualMic = (CheckBoxPreference)findPreference("dual_mic_key");
        mButtonInter = (CheckBoxPreference)findPreference("international_dialing_key");
        if (!PhoneUtils.isSupportFeature("DUAL_MIC"))
            getPreferenceScreen().removePreference(mButtonDualMic);
        mExtension.customizeCallRejectFeature(getPreferenceScreen(), findPreference("call_reject"));
        if (mButtonMr != null)
            mButtonMr.setOnPreferenceChangeListener(this);
        if (mButtonDualMic != null)
            mButtonDualMic.setOnPreferenceChangeListener(this);
        mButtonTTY = (ListPreference)findPreference("button_tty_mode_key");
        if (mButtonTTY != null)
            if (PhoneUtils.isSupportFeature("TTY"))
            {
                mButtonTTY.setOnPreferenceChangeListener(this);
            } else
            {
                getPreferenceScreen().removePreference(mButtonTTY);
                mButtonTTY = null;
            }
        if (mButtonInter != null)
        {
            mButtonInter.setOnPreferenceChangeListener(this);
            int i = android.provider.Settings.System.getInt(getContentResolver(), "international_dialing_key", 0);
            CheckBoxPreference checkboxpreference = mButtonInter;
            boolean flag;
            if (i != 0)
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
            StringBuilder stringbuilder = (new StringBuilder()).append("onResume isChecked in DB:");
            boolean flag1 = false;
            if (i != 0)
                flag1 = true;
            Xlog.d("Settings/OthersSettings", stringbuilder.append(flag1).toString());
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
        if (preference == mButtonMr)
        {
            if (mButtonMr.isChecked())
            {
                Xlog.d("OthersSettings", "onPreferenceChange mButtonReminder turn on");
                mButtonMr.setSummary(getString(0x7f0d008f));
            } else
            {
                Xlog.d("OthersSettings", "onPreferenceChange mButtonReminder turn off");
                mButtonMr.setSummary(getString(0x7f0d0090));
                return true;
            }
        } else
        {
            if (preference == mButtonDualMic)
                if (mButtonDualMic.isChecked())
                {
                    Xlog.d("Settings/OthersSettings", "onPreferenceChange mButtonDualmic turn on");
                    PhoneUtils.setDualMicMode("0");
                    return true;
                } else
                {
                    Xlog.d("Settings/OthersSettings", "onPreferenceChange mButtonDualmic turn off");
                    PhoneUtils.setDualMicMode("1");
                    return true;
                }
            if (preference == mButtonTTY)
            {
                handleTTYChange(preference, obj);
                return true;
            }
            if (preference == mButtonInter)
            {
                if (((Boolean)obj).booleanValue())
                    android.provider.Settings.System.putInt(getContentResolver(), "international_dialing_key", 1);
                else
                    android.provider.Settings.System.putInt(getContentResolver(), "international_dialing_key", 0);
                Xlog.d("Settings/OthersSettings", (new StringBuilder()).append("onPreferenceChange mButtonInter turn :").append(android.provider.Settings.System.getInt(getContentResolver(), "international_dialing_key", -1)).toString());
                return true;
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (!CallSettings.isMultipleSim())
        {
            if (preference == mButtonFdn)
            {
                Intent intent1 = new Intent(this, com/mediatek/settings/FdnSetting2);
                mPreCfr.checkToRun(intent1, mSimId, 302);
            } else
            if (preference != mButtonTTY)
                return false;
            return true;
        }
        if (preference == mButtonFdn)
        {
            Intent intent = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent.putExtra("INIT_TITLE_NAME", 0x7f0d026d);
            intent.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent.putExtra("TARGET_CLASS", "com.mediatek.settings.FdnSetting2");
            mPreCfr.checkToRun(intent, mSimId, 302);
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
        if (mButtonTTY != null)
        {
            int i = android.provider.Settings.Secure.getInt(getContentResolver(), "preferred_tty_mode", 0);
            mButtonTTY.setValue(Integer.toString(i));
            updatePreferredTtyModeSummary(i);
        }
    }

}
