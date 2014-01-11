// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.net.sip.*;
import android.os.Bundle;
import android.preference.*;
import android.view.MenuItem;
import com.android.internal.telephony.CallManager;
import com.android.phone.*;
import com.android.phone.sip.SipProfileDb;
import com.android.phone.sip.SipSharedPreferences;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class SipCallSetting extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceClickListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final String BUTTON_SIP_CALL_OPTIONS = "sip_call_options_key";
    private static final String BUTTON_SIP_CALL_OPTIONS_WIFI_ONLY = "sip_call_options_wifi_only_key";
    private static final String SIP_SETTINGS_CATEGORY_KEY = "sip_settings_category_key";
    private static final String TAG = "Settings/SipCallSetting";
    private Preference mAccountPreference;
    private CheckBoxPreference mButtonSipCallOptions;
    private CallManager mCallManager;
    private ListPreference mListSipCallOptions;
    private SipProfileDb mProfileDb;
    private SipManager mSipManager;
    private SipSharedPreferences mSipSharedPreferences;


    private void checkAndSetDefaultSim()
    {
        long l = android.provider.Settings.System.getLong(getContentResolver(), "voice_call_sim_setting", -5L);
        if (l != -2L)
        {
            if (l == -1L)
            {
                List list1 = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
                if (list1 != null && list1.size() == 1)
                    android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((android.provider.Telephony.SIMInfo)list1.get(0)).mSimId);
            }
            return;
        }
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list != null && list.size() != 0)
        {
            if (list.size() == 1)
            {
                android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId);
                return;
            }
            if (((android.provider.Telephony.SIMInfo)list.get(0)).mSlot == 0)
            {
                android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId);
                return;
            } else
            {
                android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", ((android.provider.Telephony.SIMInfo)list.get(1)).mSimId);
                return;
            }
        } else
        {
            android.provider.Settings.System.putLong(getContentResolver(), "voice_call_sim_setting", -5L);
            return;
        }
    }

    private ListPreference getSipCallOptionPreference()
    {
        ListPreference listpreference = (ListPreference)findPreference("sip_call_options_key");
        ListPreference listpreference1 = (ListPreference)findPreference("sip_call_options_wifi_only_key");
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (SipManager.isSipWifiOnly(this))
        {
            preferencescreen.removePreference(listpreference);
            return listpreference1;
        } else
        {
            preferencescreen.removePreference(listpreference1);
            return listpreference;
        }
    }

    private void handleSipCallOptionsChange(Object obj)
    {
        String s = obj.toString();
        mSipSharedPreferences.setSipCallOption(s);
        mListSipCallOptions.setValueIndex(mListSipCallOptions.findIndexOfValue(s));
        mListSipCallOptions.setSummary(mListSipCallOptions.getEntry());
    }

    private void handleSipReceiveCallsOption(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag1 = mSipSharedPreferences.getReceivingCallsEnabled();
        if ((!flag || flag1) && (flag || flag1)) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        Iterator iterator = mProfileDb.retrieveSipProfileList().iterator();
_L3:
        String s;
        SipProfile sipprofile1;
        if (!iterator.hasNext())
            continue; /* Loop/switch isn't completed */
        SipProfile sipprofile = (SipProfile)iterator.next();
        s = sipprofile.getUriString();
        sipprofile1 = updateAutoRegistrationFlag(sipprofile, flag);
        if (!flag)
            break MISSING_BLOCK_LABEL_121;
        mSipManager.open(sipprofile1, SipUtil.createIncomingCallPendingIntent(), null);
          goto _L3
        SipException sipexception;
        sipexception;
        Xlog.e("Settings/SipCallSetting", "register failed", sipexception);
          goto _L3
        Exception exception;
        exception;
        throw exception;
        mSipManager.close(s);
        if (mSipSharedPreferences.isPrimaryAccount(s))
            mSipManager.open(sipprofile1);
        if (true) goto _L3; else goto _L4
_L4:
        if (true) goto _L1; else goto _L5
_L5:
    }

    private SipProfile updateAutoRegistrationFlag(SipProfile sipprofile, boolean flag)
    {
        SipProfile sipprofile1 = (new android.net.sip.SipProfile.Builder(sipprofile)).setAutoRegistration(flag).build();
        try
        {
            mProfileDb.deleteProfile(sipprofile);
            mProfileDb.saveProfile(sipprofile1);
        }
        catch (IOException ioexception)
        {
            Xlog.e("Settings/SipCallSetting", "updateAutoRegistrationFlag error", ioexception);
            return sipprofile1;
        }
        return sipprofile1;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (PhoneUtils.isVoipSupported())
        {
            mSipManager = SipManager.newInstance(this);
            mCallManager = CallManager.getInstance();
            mSipSharedPreferences = new SipSharedPreferences(this);
            addPreferencesFromResource(0x7f06001f);
            mButtonSipCallOptions = (CheckBoxPreference)findPreference("open_sip_call_option_key");
            mButtonSipCallOptions.setOnPreferenceClickListener(this);
            mListSipCallOptions = getSipCallOptionPreference();
            mAccountPreference = findPreference("sip_account_settings_key");
            mProfileDb = new SipProfileDb(this);
            if (CallSettings.isMultipleSim())
            {
                getPreferenceScreen().removePreference(mListSipCallOptions);
                mListSipCallOptions = null;
            } else
            {
                mListSipCallOptions.setOnPreferenceChangeListener(this);
                mListSipCallOptions.setValueIndex(mListSipCallOptions.findIndexOfValue(mSipSharedPreferences.getSipCallOption()));
                mListSipCallOptions.setSummary(mListSipCallOptions.getEntry());
            }
        }
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
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
        if (preference == mListSipCallOptions)
            handleSipCallOptionsChange(obj);
        return true;
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mButtonSipCallOptions)
        {
            final int intEnable;
            if (mButtonSipCallOptions.isChecked())
                intEnable = 1;
            else
                intEnable = 0;
            android.provider.Settings.System.putInt(PhoneGlobals.getInstance().getContentResolver(), "enable_internet_call_value", intEnable);
            (new Thread(new Runnable() {

                final SipCallSetting this$0;
                final int val$intEnable;

                public void run()
                {
                    boolean flag = true;
                    SipCallSetting sipcallsetting = SipCallSetting.this;
                    if (intEnable != flag)
                        flag = false;
                    sipcallsetting.handleSipReceiveCallsOption(flag);
                }

            
            {
                this$0 = SipCallSetting.this;
                intEnable = i;
                super();
            }
            }
)).start();
            if (intEnable == 1)
            {
                mAccountPreference.setEnabled(true);
                if (mListSipCallOptions != null)
                    mListSipCallOptions.setEnabled(true);
            } else
            {
                if (CallSettings.isMultipleSim())
                    checkAndSetDefaultSim();
                mAccountPreference.setEnabled(false);
                if (mListSipCallOptions != null)
                {
                    mListSipCallOptions.setEnabled(false);
                    return false;
                }
            }
        }
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        int i = android.provider.Settings.System.getInt(PhoneGlobals.getInstance().getContentResolver(), "enable_internet_call_value", 0);
        if (mCallManager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            mAccountPreference.setEnabled(false);
            mButtonSipCallOptions.setEnabled(false);
            if (mListSipCallOptions != null)
                mListSipCallOptions.setEnabled(false);
        } else
        {
            Preference preference = mAccountPreference;
            boolean flag;
            if (i == 1)
                flag = true;
            else
                flag = false;
            preference.setEnabled(flag);
            mButtonSipCallOptions.setEnabled(true);
            if (mListSipCallOptions != null)
            {
                ListPreference listpreference = mListSipCallOptions;
                boolean flag1;
                if (i == 1)
                    flag1 = true;
                else
                    flag1 = false;
                listpreference.setEnabled(flag1);
            }
        }
        if (i == 1 && !mButtonSipCallOptions.isChecked())
            mButtonSipCallOptions.setChecked(true);
        else
        if (i == 0 && mButtonSipCallOptions.isChecked())
        {
            mButtonSipCallOptions.setChecked(false);
            return;
        }
    }

}
