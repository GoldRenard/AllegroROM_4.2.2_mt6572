// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.security.KeyStore;
import android.util.Log;
import android.widget.ListView;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.gemini.SimListEntrance;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, Utils, ChooseLockSettingsHelper

public class SecuritySettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, android.content.DialogInterface.OnClickListener
{

    private static final int CONFIRM_EXISTING_FOR_BIOMETRIC_WEAK_IMPROVE_REQUEST = 124;
    private static final int CONFIRM_EXISTING_FOR_BIOMETRIC_WEAK_LIVELINESS_OFF = 125;
    private static final int DELAY_MILLIS = 500;
    private static final String KEY_BIOMETRIC_WEAK_IMPROVE_MATCHING = "biometric_weak_improve_matching";
    private static final String KEY_BIOMETRIC_WEAK_LIVELINESS = "biometric_weak_liveliness";
    private static final String KEY_CREDENTIALS_MANAGER = "credentials_management";
    private static final String KEY_DEVICE_ADMIN_CATEGORY = "device_admin_category";
    private static final String KEY_LOCK_AFTER_TIMEOUT = "lock_after_timeout";
    private static final String KEY_LOCK_ENABLED = "lockenabled";
    private static final String KEY_OWNER_INFO_SETTINGS = "owner_info_settings";
    private static final String KEY_POWER_INSTANTLY_LOCKS = "power_button_instantly_locks";
    private static final String KEY_RESET_CREDENTIALS = "reset_credentials";
    private static final String KEY_SECURITY_CATEGORY = "security_category";
    private static final String KEY_SHOW_PASSWORD = "show_password";
    private static final String KEY_SIM_LOCK = "sim_lock";
    private static final String KEY_SIM_LOCK_PREF = "sim_lock_pref";
    private static final String KEY_TACTILE_FEEDBACK_ENABLED = "unlock_tactile_feedback";
    private static final String KEY_TOGGLE_INSTALL_APPLICATIONS = "toggle_install_applications";
    private static final String KEY_TOGGLE_VERIFY_APPLICATIONS = "toggle_verify_applications";
    private static final String KEY_UNLOCK_SET_OR_CHANGE = "unlock_set_or_change";
    private static final String KEY_VISIBLE_PATTERN = "visiblepattern";
    private static final String PACKAGE_MIME_TYPE = "application/vnd.android.package-archive";
    private static final int SET_OR_CHANGE_LOCK_METHOD_REQUEST = 123;
    private static final String TAG = "SecuritySettings";
    private CheckBoxPreference mBiometricWeakLiveliness;
    private ChooseLockSettingsHelper mChooseLockSettingsHelper;
    DevicePolicyManager mDPM;
    private boolean mIsPrimary;
    private ListPreference mLockAfter;
    private LockPatternUtils mLockPatternUtils;
    private CheckBoxPreference mPowerButtonInstantlyLocks;
    private Preference mResetCredentials;
    private Handler mScrollHandler;
    private Runnable mScrollRunner;
    private boolean mScrollToUnknownSources;
    private CheckBoxPreference mShowPassword;
    private BroadcastReceiver mSiminfoReceiver;
    private CheckBoxPreference mToggleAppInstallation;
    private CheckBoxPreference mToggleVerifyApps;
    private int mUnknownSourcesPosition;
    private CheckBoxPreference mVisiblePattern;
    private DialogInterface mWarnInstallApps;

    public SecuritySettings()
    {
        mScrollHandler = new Handler();
        mScrollRunner = new Runnable() {

            final SecuritySettings this$0;

            public void run()
            {
                ListView listview = getListView();
                listview.setItemChecked(-1 + mUnknownSourcesPosition, true);
                listview.smoothScrollToPosition(-1 + mUnknownSourcesPosition);
            }

            
            {
                this$0 = SecuritySettings.this;
                super();
            }
        }
;
        mSiminfoReceiver = new BroadcastReceiver() {

            final SecuritySettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                boolean flag = true;
                String s = intent.getAction();
                Log.d("SecuritySettings", (new StringBuilder()).append("receive action=").append(s).toString());
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                {
                    createPreferenceHierarchy();
                    LockPatternUtils lockpatternutils = mChooseLockSettingsHelper.utils();
                    if (mBiometricWeakLiveliness != null)
                        mBiometricWeakLiveliness.setChecked(lockpatternutils.isBiometricWeakLivelinessEnabled());
                    if (mVisiblePattern != null)
                        mVisiblePattern.setChecked(lockpatternutils.isVisiblePatternEnabled());
                    if (mPowerButtonInstantlyLocks != null)
                        mPowerButtonInstantlyLocks.setChecked(lockpatternutils.getPowerButtonInstantlyLocks());
                    if (mShowPassword != null)
                    {
                        CheckBoxPreference checkboxpreference = mShowPassword;
                        boolean flag1;
                        if (android.provider.Settings.System.getInt(getContentResolver(), "show_password", flag) != 0)
                            flag1 = flag;
                        else
                            flag1 = false;
                        checkboxpreference.setChecked(flag1);
                    }
                    android.security.KeyStore.State state = KeyStore.getInstance().state();
                    Xlog.i("SecuritySettings", (new StringBuilder()).append("KeyStore.State on receiver:").append(state).toString());
                    if (mResetCredentials != null)
                    {
                        Preference preference = mResetCredentials;
                        if (state == android.security.KeyStore.State.UNINITIALIZED)
                            flag = false;
                        preference.setEnabled(flag);
                    }
                }
            }

            
            {
                this$0 = SecuritySettings.this;
                super();
            }
        }
;
    }

    private PreferenceScreen createPreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
            preferencescreen.removeAll();
        addPreferencesFromResource(0x7f050025);
        PreferenceScreen preferencescreen1 = getPreferenceScreen();
        int i;
        if (!mLockPatternUtils.isSecure())
        {
            boolean flag1;
            if (((UserManager)getSystemService("user")).getUsers(true).size() == 1)
                flag1 = true;
            else
                flag1 = false;
            if (flag1 && mLockPatternUtils.isLockScreenDisabled())
                i = 0x7f050029;
            else
                i = 0x7f050027;
        } else
        if (mLockPatternUtils.usingBiometricWeak() && mLockPatternUtils.isBiometricWeakInstalled())
            i = 0x7f050026;
        else
        if (mLockPatternUtils.usingVoiceWeak())
            i = 0x7f050030;
        else
            switch (mLockPatternUtils.getKeyguardStoredPasswordQuality())
            {
            case 262144: 
            case 327680: 
            case 393216: 
                i = 0x7f05002b;
                break;

            case 131072: 
                i = 0x7f05002e;
                break;

            case 65536: 
                i = 0x7f05002c;
                break;

            default:
                i = 0;
                break;
            }
        addPreferencesFromResource(i);
        Xlog.d("SecuritySettings", "FeatureOption.MTK_EMMC_SUPPORT=true");
        Xlog.d("SecuritySettings", "FeatureOption.MTK_CACHE_MERGE_SUPPORT=false");
        boolean flag;
        if (UserHandle.myUserId() == 0)
            flag = true;
        else
            flag = false;
        mIsPrimary = flag;
        DevicePolicyManager devicepolicymanager = (DevicePolicyManager)getSystemService("device_policy");
        if (!mIsPrimary)
        {
            Preference preference1 = findPreference("owner_info_settings");
            if (preference1 != null)
                preference1.setTitle(0x7f0b0379);
        }
        if (mIsPrimary)
            switch (devicepolicymanager.getStorageEncryptionStatus())
            {
            case 1: // '\001'
                addPreferencesFromResource(0x7f05002f);
                break;

            case 3: // '\003'
                addPreferencesFromResource(0x7f050028);
                break;
            }
        mLockAfter = (ListPreference)preferencescreen1.findPreference("lock_after_timeout");
        if (mLockAfter != null)
        {
            setupLockAfterPreference();
            updateLockAfterPreferenceSummary();
        }
        mBiometricWeakLiveliness = (CheckBoxPreference)preferencescreen1.findPreference("biometric_weak_liveliness");
        mVisiblePattern = (CheckBoxPreference)preferencescreen1.findPreference("visiblepattern");
        mPowerButtonInstantlyLocks = (CheckBoxPreference)preferencescreen1.findPreference("power_button_instantly_locks");
        if ((i == 0x7f050026 || i == 0x7f050030) && mLockPatternUtils.getKeyguardStoredPasswordQuality() != 0x10000)
        {
            PreferenceGroup preferencegroup1 = (PreferenceGroup)preferencescreen1.findPreference("security_category");
            if (preferencegroup1 != null && mVisiblePattern != null)
                preferencegroup1.removePreference(preferencescreen1.findPreference("visiblepattern"));
        }
        addPreferencesFromResource(0x7f05002a);
        if (!Utils.isWifiOnly(getActivity()))
        {
            if (preferencescreen1.findPreference("sim_lock") != null)
            {
                Preference preference = preferencescreen1.findPreference("sim_lock_pref");
                List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
                int j = list.size();
                if (j == 0)
                {
                    Xlog.d("SecuritySettings", "No sim found");
                    preference.setEnabled(false);
                } else
                if (j == 1)
                {
                    android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)list.get(0);
                    Xlog.d("SecuritySettings", "Only one Sim inserted");
                    if (siminfo != null)
                    {
                        Intent intent = new Intent();
                        intent.setClassName("com.android.settings", "com.android.settings.IccLockSettings");
                        android.provider.Telephony.SIMInfo.getSlotById(getActivity(), siminfo.mSimId);
                        intent.putExtra("slotid", siminfo.mSlot);
                        preference.setIntent(intent);
                    }
                } else
                if (j > 1)
                {
                    Xlog.d("SecuritySettings", "two Sims inserted");
                    preference.getExtras().putInt("type", 0);
                    preference.setFragment(com/mediatek/gemini/SimListEntrance.getName());
                }
            }
        } else
        {
            preferencescreen1.removePreference(preferencescreen1.findPreference("sim_lock"));
        }
        mShowPassword = (CheckBoxPreference)preferencescreen1.findPreference("show_password");
        if (mIsPrimary)
            mResetCredentials = preferencescreen1.findPreference("reset_credentials");
        else
            removePreference("credentials_management");
        mToggleAppInstallation = (CheckBoxPreference)findPreference("toggle_install_applications");
        mToggleAppInstallation.setChecked(isNonMarketAppsAllowed());
        mToggleVerifyApps = (CheckBoxPreference)findPreference("toggle_verify_applications");
        if (mIsPrimary && showVerifierSetting())
            if (isVerifierInstalled())
            {
                mToggleVerifyApps.setChecked(isVerifyAppsEnabled());
                return preferencescreen1;
            } else
            {
                mToggleVerifyApps.setChecked(false);
                mToggleVerifyApps.setEnabled(false);
                return preferencescreen1;
            }
        PreferenceGroup preferencegroup = (PreferenceGroup)preferencescreen1.findPreference("device_admin_category");
        if (preferencegroup != null)
        {
            preferencegroup.removePreference(mToggleVerifyApps);
            return preferencescreen1;
        } else
        {
            mToggleVerifyApps.setEnabled(false);
            return preferencescreen1;
        }
    }

    private void disableUnusableTimeouts(long l)
    {
        CharSequence acharsequence[] = mLockAfter.getEntries();
        CharSequence acharsequence1[] = mLockAfter.getEntryValues();
        ArrayList arraylist = new ArrayList();
        ArrayList arraylist1 = new ArrayList();
        for (int i = 0; i < acharsequence1.length; i++)
            if (Long.valueOf(acharsequence1[i].toString()).longValue() <= l)
            {
                arraylist.add(acharsequence[i]);
                arraylist1.add(acharsequence1[i]);
            }

        if (arraylist.size() != acharsequence.length || arraylist1.size() != acharsequence1.length)
        {
            mLockAfter.setEntries((CharSequence[])arraylist.toArray(new CharSequence[arraylist.size()]));
            mLockAfter.setEntryValues((CharSequence[])arraylist1.toArray(new CharSequence[arraylist1.size()]));
            int j = Integer.valueOf(mLockAfter.getValue()).intValue();
            if ((long)j <= l)
                mLockAfter.setValue(String.valueOf(j));
        }
        ListPreference listpreference = mLockAfter;
        boolean flag;
        if (arraylist.size() > 0)
            flag = true;
        else
            flag = false;
        listpreference.setEnabled(flag);
    }

    private Preference findPreferencePosition(CharSequence charsequence, PreferenceGroup preferencegroup)
    {
        if (charsequence.equals(preferencegroup.getKey()))
            return preferencegroup;
        mUnknownSourcesPosition = 1 + mUnknownSourcesPosition;
        int i = preferencegroup.getPreferenceCount();
        for (int j = 0; j < i; j++)
        {
            Preference preference = preferencegroup.getPreference(j);
            String s = preference.getKey();
            if (s != null && s.equals(charsequence))
                return preference;
            if (preference instanceof PreferenceGroup)
            {
                Preference preference1 = findPreferencePosition(charsequence, (PreferenceGroup)preference);
                if (preference1 != null)
                    return preference1;
            } else
            {
                mUnknownSourcesPosition = 1 + mUnknownSourcesPosition;
            }
        }

        return null;
    }

    private boolean isNonMarketAppsAllowed()
    {
        int i = android.provider.Settings.Global.getInt(getContentResolver(), "install_non_market_apps", 0);
        boolean flag = false;
        if (i > 0)
            flag = true;
        return flag;
    }

    private boolean isToggled(Preference preference)
    {
        return ((CheckBoxPreference)preference).isChecked();
    }

    private boolean isVerifierInstalled()
    {
        PackageManager packagemanager = getPackageManager();
        Intent intent = new Intent("android.intent.action.PACKAGE_NEEDS_VERIFICATION");
        intent.setType("application/vnd.android.package-archive");
        intent.addFlags(1);
        return packagemanager.queryBroadcastReceivers(intent, 0).size() > 0;
    }

    private boolean isVerifyAppsEnabled()
    {
        return android.provider.Settings.Global.getInt(getContentResolver(), "package_verifier_enable", 1) > 0;
    }

    private void setNonMarketAppsAllowed(boolean flag)
    {
        android.content.ContentResolver contentresolver = getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "install_non_market_apps", i);
    }

    private void setupLockAfterPreference()
    {
        long l = android.provider.Settings.Secure.getLong(getContentResolver(), "lock_screen_lock_after_timeout", 5000L);
        mLockAfter.setValue(String.valueOf(l));
        mLockAfter.setOnPreferenceChangeListener(this);
        long l1;
        if (mDPM != null)
            l1 = mDPM.getMaximumTimeToLock(null);
        else
            l1 = 0L;
        long l2 = Math.max(0, android.provider.Settings.System.getInt(getContentResolver(), "screen_off_timeout", 0));
        if (l1 > 0L)
            disableUnusableTimeouts(Math.max(0L, l1 - l2));
    }

    private boolean showVerifierSetting()
    {
        return android.provider.Settings.Global.getInt(getContentResolver(), "verifier_setting_visible", 1) > 0;
    }

    private void updateLockAfterPreferenceSummary()
    {
        long l = android.provider.Settings.Secure.getLong(getContentResolver(), "lock_screen_lock_after_timeout", 5000L);
        CharSequence acharsequence[] = mLockAfter.getEntries();
        CharSequence acharsequence1[] = mLockAfter.getEntryValues();
        int i = 0;
        for (int j = 0; j < acharsequence1.length; j++)
            if (l >= Long.valueOf(acharsequence1[j].toString()).longValue())
                i = j;

        ListPreference listpreference = mLockAfter;
        Object aobj[] = new Object[1];
        aobj[0] = acharsequence[i];
        listpreference.setSummary(getString(0x7f0b0373, aobj));
    }

    private void warnAppInstallation()
    {
        mWarnInstallApps = (new android.app.AlertDialog.Builder(getActivity())).setTitle(getResources().getString(0x7f0b05ab)).setIcon(0x1080027).setMessage(getResources().getString(0x7f0b0630)).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, null).show();
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i == 124 && j == -1)
        {
            startBiometricWeakImprove();
            return;
        }
        if (i == 125 && j == -1)
        {
            mChooseLockSettingsHelper.utils().setBiometricWeakLivelinessEnabled(false);
            return;
        } else
        {
            createPreferenceHierarchy();
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (dialoginterface == mWarnInstallApps && i == -1)
        {
            setNonMarketAppsAllowed(true);
            if (mToggleAppInstallation != null)
                mToggleAppInstallation.setChecked(true);
        }
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        Log.d("SecuritySettings", "onConfigurationChanged");
        super.onConfigurationChanged(configuration);
        getListView().clearScrapViewsIfNeeded();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mLockPatternUtils = new LockPatternUtils(getActivity());
        mDPM = (DevicePolicyManager)getSystemService("device_policy");
        mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
        String s = getActivity().getIntent().getAction();
        if ("android.settings.SECURITY_SETTINGS".equals(s))
            mScrollToUnknownSources = true;
        Xlog.i("SecuritySettings", (new StringBuilder()).append("action :").append(s).toString());
        Xlog.i("SecuritySettings", (new StringBuilder()).append("activity name :").append(getActivity().getComponentName().getClassName()).toString());
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mWarnInstallApps != null)
            mWarnInstallApps.dismiss();
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mSiminfoReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mLockAfter)
        {
            int i = Integer.parseInt((String)obj);
            try
            {
                android.provider.Settings.Secure.putInt(getContentResolver(), "lock_screen_lock_after_timeout", i);
            }
            catch (NumberFormatException numberformatexception)
            {
                Log.e("SecuritySettings", "could not persist lockAfter timeout setting", numberformatexception);
            }
            updateLockAfterPreferenceSummary();
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        String s;
        LockPatternUtils lockpatternutils;
label0:
        {
            s = preference.getKey();
            lockpatternutils = mChooseLockSettingsHelper.utils();
            if ("unlock_set_or_change".equals(s))
                startFragment(this, "com.android.settings.ChooseLockGeneric$ChooseLockGenericFragment", 123, null);
            else
            if ("biometric_weak_improve_matching".equals(s))
            {
                if (!(new ChooseLockSettingsHelper(getActivity(), this)).launchConfirmationActivity(124, null, null))
                {
                    startBiometricWeakImprove();
                    return true;
                }
            } else
            {
                if (!"biometric_weak_liveliness".equals(s))
                    break label0;
                if (isToggled(preference))
                {
                    lockpatternutils.setBiometricWeakLivelinessEnabled(true);
                    return true;
                }
                mBiometricWeakLiveliness.setChecked(true);
                if (!(new ChooseLockSettingsHelper(getActivity(), this)).launchConfirmationActivity(125, null, null))
                {
                    lockpatternutils.setBiometricWeakLivelinessEnabled(false);
                    mBiometricWeakLiveliness.setChecked(false);
                    return true;
                }
            }
            return true;
        }
        if ("lockenabled".equals(s))
        {
            lockpatternutils.setLockPatternEnabled(isToggled(preference));
            return true;
        }
        if ("visiblepattern".equals(s))
        {
            lockpatternutils.setVisiblePatternEnabled(isToggled(preference));
            return true;
        }
        if ("power_button_instantly_locks".equals(s))
        {
            lockpatternutils.setPowerButtonInstantlyLocks(isToggled(preference));
            return true;
        }
        if (preference == mShowPassword)
        {
            android.content.ContentResolver contentresolver1 = getContentResolver();
            boolean flag1 = mShowPassword.isChecked();
            int j = 0;
            if (flag1)
                j = 1;
            android.provider.Settings.System.putInt(contentresolver1, "show_password", j);
            return true;
        }
        if (preference == mToggleAppInstallation)
            if (mToggleAppInstallation.isChecked())
            {
                mToggleAppInstallation.setChecked(false);
                warnAppInstallation();
                return true;
            } else
            {
                setNonMarketAppsAllowed(false);
                return true;
            }
        if ("toggle_verify_applications".equals(s))
        {
            android.content.ContentResolver contentresolver = getContentResolver();
            boolean flag = mToggleVerifyApps.isChecked();
            int i = 0;
            if (flag)
                i = 1;
            android.provider.Settings.Global.putInt(contentresolver, "package_verifier_enable", i);
            return true;
        } else
        {
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
    }

    public void onResume()
    {
        boolean flag = true;
        super.onResume();
        createPreferenceHierarchy();
        if (mScrollToUnknownSources)
        {
            mScrollToUnknownSources = false;
            mUnknownSourcesPosition = 0;
            findPreferencePosition("toggle_install_applications", getPreferenceScreen());
            Xlog.i("SecuritySettings", (new StringBuilder()).append("find position unknown resources: ").append(-1 + mUnknownSourcesPosition).toString());
            mScrollHandler.postDelayed(mScrollRunner, 500L);
        }
        LockPatternUtils lockpatternutils = mChooseLockSettingsHelper.utils();
        if (mBiometricWeakLiveliness != null)
            mBiometricWeakLiveliness.setChecked(lockpatternutils.isBiometricWeakLivelinessEnabled());
        if (mVisiblePattern != null)
            mVisiblePattern.setChecked(lockpatternutils.isVisiblePatternEnabled());
        if (mPowerButtonInstantlyLocks != null)
            mPowerButtonInstantlyLocks.setChecked(lockpatternutils.getPowerButtonInstantlyLocks());
        if (mShowPassword != null)
        {
            CheckBoxPreference checkboxpreference = mShowPassword;
            boolean flag1;
            if (android.provider.Settings.System.getInt(getContentResolver(), "show_password", flag) != 0)
                flag1 = flag;
            else
                flag1 = false;
            checkboxpreference.setChecked(flag1);
        }
        android.security.KeyStore.State state = KeyStore.getInstance().state();
        Xlog.i("SecuritySettings", (new StringBuilder()).append("KeyStore.State on resume:").append(state).toString());
        if (mResetCredentials != null)
        {
            Preference preference = mResetCredentials;
            if (state == android.security.KeyStore.State.UNINITIALIZED)
                flag = false;
            preference.setEnabled(flag);
        }
        getActivity().registerReceiver(mSiminfoReceiver, new IntentFilter("android.intent.action.SIM_INFO_UPDATE"));
    }

    public void startBiometricWeakImprove()
    {
        Intent intent = new Intent();
        intent.setClassName("com.android.facelock", "com.android.facelock.AddToSetup");
        startActivity(intent);
    }








}
