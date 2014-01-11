// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.PendingIntent;
import android.app.admin.DevicePolicyManager;
import android.content.Intent;
import android.os.Bundle;
import android.os.UserManager;
import android.preference.*;
import android.security.KeyStore;
import android.view.*;
import android.widget.ListView;
import com.android.internal.widget.LockPatternUtils;
import java.util.List;
import libcore.util.MutableBoolean;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, ChooseLockSettingsHelper, ChooseLockPassword, ChooseLockPattern

public class ChooseLockGeneric extends PreferenceActivity
{
    public static class ChooseLockGenericFragment extends SettingsPreferenceFragment
    {

        private static final boolean ALWAY_SHOW_TUTORIAL = true;
        private static final String CONFIRM_CREDENTIALS = "confirm_credentials";
        private static final int CONFIRM_EXISTING_REQUEST = 100;
        private static final int FALLBACK_REQUEST = 101;
        private static final String FINISH_PENDING = "finish_pending";
        private static final String KEY_UNLOCK_BACKUP_INFO = "unlock_backup_info";
        private static final String KEY_UNLOCK_SET_BIOMETRIC_WEAK = "unlock_set_biometric_weak";
        private static final String KEY_UNLOCK_SET_NONE = "unlock_set_none";
        private static final String KEY_UNLOCK_SET_OFF = "unlock_set_off";
        private static final String KEY_UNLOCK_SET_PASSWORD = "unlock_set_password";
        private static final String KEY_UNLOCK_SET_PATTERN = "unlock_set_pattern";
        private static final String KEY_UNLOCK_SET_PIN = "unlock_set_pin";
        private static final String KEY_UNLOCK_SET_VOICE_WEAK = "unlock_set_voice_weak";
        public static final String MINIMUM_QUALITY_KEY = "minimum_quality";
        private static final int MIN_PASSWORD_LENGTH = 4;
        private static final String PASSWORD_CONFIRMED = "password_confirmed";
        private static final String WAITING_FOR_CONFIRMATION = "waiting_for_confirmation";
        private ChooseLockSettingsHelper mChooseLockSettingsHelper;
        private DevicePolicyManager mDPM;
        private boolean mFinishPending;
        private KeyStore mKeyStore;
        private boolean mPasswordConfirmed;
        private boolean mWaitingForConfirmation;

        private boolean allowedForFallback(String s)
        {
            return "unlock_backup_info".equals(s) || "unlock_set_pattern".equals(s) || "unlock_set_pin".equals(s);
        }

        private void disableUnusablePreferences(int i, MutableBoolean mutableboolean)
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            boolean flag = getActivity().getIntent().getBooleanExtra("lockscreen.weak_fallback", false);
            boolean flag1 = mChooseLockSettingsHelper.utils().isBiometricWeakInstalled();
            boolean flag2;
            if (((UserManager)getSystemService("user")).getUsers(true).size() == 1)
                flag2 = true;
            else
                flag2 = false;
            for (int j = -1 + preferencescreen.getPreferenceCount(); j >= 0; j--)
            {
                Preference preference = preferencescreen.getPreference(j);
                if (!(preference instanceof PreferenceScreen))
                    continue;
                String s = ((PreferenceScreen)preference).getKey();
                boolean flag3 = true;
                boolean flag4 = true;
                if ("unlock_set_off".equals(s))
                {
                    if (i <= 0)
                        flag3 = true;
                    else
                        flag3 = false;
                    flag4 = flag2;
                } else
                if ("unlock_set_none".equals(s))
                {
                    if (i <= 0)
                        flag3 = true;
                    else
                        flag3 = false;
                } else
                if ("unlock_set_biometric_weak".equals(s))
                {
                    if (i > 32768 && !mutableboolean.value)
                        flag3 = false;
                    else
                        flag3 = true;
                    flag4 = flag1;
                } else
                if ("unlock_set_voice_weak".equals(s))
                {
                    if (i <= 16384)
                        flag3 = true;
                    else
                        flag3 = false;
                    flag4 = true;
                } else
                if ("unlock_set_pattern".equals(s))
                {
                    if (i <= 0x10000)
                        flag3 = true;
                    else
                        flag3 = false;
                } else
                if ("unlock_set_pin".equals(s))
                {
                    if (i <= 0x20000)
                        flag3 = true;
                    else
                        flag3 = false;
                } else
                if ("unlock_set_password".equals(s))
                    if (i <= 0x60000)
                        flag3 = true;
                    else
                        flag3 = false;
                if (flag4 && (!flag || allowedForFallback(s)))
                {
                    if (!flag3)
                    {
                        preference.setSummary(0x7f0b03a5);
                        preference.setEnabled(false);
                    }
                } else
                {
                    preferencescreen.removePreference(preference);
                }
            }

        }

        private Intent getBiometricSensorIntent()
        {
            Intent intent = (new Intent()).setClass(getActivity(), com/android/settings/ChooseLockGeneric);
            intent.putExtra("lockscreen.weak_fallback", true);
            intent.putExtra("lockscreen.weak_fallback_for", "face_unlock");
            intent.putExtra("confirm_credentials", false);
            intent.putExtra(":android:show_fragment_title", 0x7f0b0393);
            Intent intent1 = new Intent();
            intent1.setClassName("com.android.facelock", "com.android.facelock.SetupIntro");
            intent1.putExtra("showTutorial", true);
            intent1.putExtra("PendingIntent", PendingIntent.getActivity(getActivity(), 0, intent, 0));
            return intent1;
        }

        private Intent getVoiceSensorIntent()
        {
            Intent intent = (new Intent()).setClass(getActivity(), com/android/settings/ChooseLockGeneric);
            intent.putExtra("lockscreen.weak_fallback", true);
            intent.putExtra("lockscreen.weak_fallback_for", "voice_unlock");
            intent.putExtra("confirm_credentials", false);
            intent.putExtra(":android:show_fragment_title", 0x7f0b0393);
            Intent intent1 = new Intent();
            intent1.setClassName("com.mediatek.voiceunlock", "com.mediatek.voiceunlock.VoiceUnlock");
            return intent1;
        }

        private void updatePreferencesOrFinish()
        {
            Intent intent = getActivity().getIntent();
            int i = intent.getIntExtra("lockscreen.password_type", -1);
            if (i == -1)
            {
                int j = intent.getIntExtra("minimum_quality", -1);
                MutableBoolean mutableboolean = new MutableBoolean(false);
                int k = upgradeQuality(j, mutableboolean);
                PreferenceScreen preferencescreen = getPreferenceScreen();
                if (preferencescreen != null)
                    preferencescreen.removeAll();
                addPreferencesFromResource(0x7f05002d);
                disableUnusablePreferences(k, mutableboolean);
                return;
            } else
            {
                updateUnlockMethodAndFinish(i, false);
                return;
            }
        }

        private int upgradeQuality(int i, MutableBoolean mutableboolean)
        {
            int j;
label0:
            {
                j = upgradeQualityForKeyStore(upgradeQualityForDPM(i));
                int k = upgradeQualityForEncryption(j);
                if (k > j)
                    if (mutableboolean != null)
                    {
                        boolean flag;
                        if (j <= 32768)
                            flag = true;
                        else
                            flag = false;
                        mutableboolean.value = flag;
                    } else
                    {
                        if (j == 32768)
                            break label0;
                        if (j == 16384)
                            return j;
                    }
                j = k;
            }
            return j;
        }

        private int upgradeQualityForDPM(int i)
        {
            int j = mDPM.getPasswordQuality(null);
            if (i < j)
                i = j;
            return i;
        }

        private int upgradeQualityForEncryption(int i)
        {
            int j = mDPM.getStorageEncryptionStatus();
            boolean flag;
            if (j != 3 && j != 2)
                flag = false;
            else
                flag = true;
            if (flag && i < 0x20000)
                i = 0x20000;
            return i;
        }

        private int upgradeQualityForKeyStore(int i)
        {
            if (!mKeyStore.isEmpty() && i < 0x10000)
                i = 0x10000;
            return i;
        }

        protected int getHelpResource()
        {
            return 0x7f0b0931;
        }

        public void onActivityResult(int i, int j, Intent intent)
        {
            super.onActivityResult(i, j, intent);
            mWaitingForConfirmation = false;
            if (i == 100 && j == -1)
            {
                mPasswordConfirmed = true;
                updatePreferencesOrFinish();
                return;
            }
            if (i == 101)
            {
                mChooseLockSettingsHelper.utils().deleteTempGallery();
                getActivity().setResult(j);
                finish();
                return;
            } else
            {
                getActivity().setResult(0);
                finish();
                return;
            }
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mDPM = (DevicePolicyManager)getSystemService("device_policy");
            mKeyStore = KeyStore.getInstance();
            mChooseLockSettingsHelper = new ChooseLockSettingsHelper(getActivity());
            boolean flag;
            if (!getActivity().getIntent().getBooleanExtra("confirm_credentials", true))
                flag = true;
            else
                flag = false;
            mPasswordConfirmed = flag;
            if (bundle != null)
            {
                mPasswordConfirmed = bundle.getBoolean("password_confirmed");
                mWaitingForConfirmation = bundle.getBoolean("waiting_for_confirmation");
                mFinishPending = bundle.getBoolean("finish_pending");
            }
            if (mPasswordConfirmed)
                updatePreferencesOrFinish();
            else
            if (!mWaitingForConfirmation)
                if (!(new ChooseLockSettingsHelper(getActivity(), this)).launchConfirmationActivity(100, null, null))
                {
                    mPasswordConfirmed = true;
                    updatePreferencesOrFinish();
                    return;
                } else
                {
                    mWaitingForConfirmation = true;
                    return;
                }
        }

        public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
        {
            View view = super.onCreateView(layoutinflater, viewgroup, bundle);
            if (getActivity().getIntent().getBooleanExtra("lockscreen.weak_fallback", false))
            {
                String s = getActivity().getIntent().getStringExtra("lockscreen.weak_fallback_for");
                View view1;
                if (s.equals("face_unlock"))
                {
                    view1 = View.inflate(getActivity(), 0x7f04009f, null);
                } else
                {
                    boolean flag = s.equals("voice_unlock");
                    view1 = null;
                    if (flag)
                        view1 = View.inflate(getActivity(), 0x7f0400a0, null);
                }
                ((ListView)view.findViewById(0x102000a)).addHeaderView(view1, null, false);
            }
            return view;
        }

        public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
        {
            String s = preference.getKey();
            if ("unlock_set_off".equals(s))
            {
                updateUnlockMethodAndFinish(0, true);
                return true;
            }
            if ("unlock_set_none".equals(s))
            {
                updateUnlockMethodAndFinish(0, false);
                return true;
            }
            if ("unlock_set_biometric_weak".equals(s))
            {
                updateUnlockMethodAndFinish(32768, false);
                return true;
            }
            if ("unlock_set_voice_weak".equals(s))
            {
                updateUnlockMethodAndFinish(16384, false);
                return true;
            }
            if ("unlock_set_pattern".equals(s))
            {
                updateUnlockMethodAndFinish(0x10000, false);
                return true;
            }
            if ("unlock_set_pin".equals(s))
            {
                updateUnlockMethodAndFinish(0x20000, false);
                return true;
            }
            if ("unlock_set_password".equals(s))
            {
                updateUnlockMethodAndFinish(0x40000, false);
                return true;
            } else
            {
                return false;
            }
        }

        public void onResume()
        {
            super.onResume();
            if (mFinishPending)
            {
                mFinishPending = false;
                finish();
            }
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            super.onSaveInstanceState(bundle);
            bundle.putBoolean("password_confirmed", mPasswordConfirmed);
            bundle.putBoolean("waiting_for_confirmation", mWaitingForConfirmation);
            bundle.putBoolean("finish_pending", mFinishPending);
        }

        void updateUnlockMethodAndFinish(int i, boolean flag)
        {
            if (!mPasswordConfirmed)
                throw new IllegalStateException("Tried to update password without confirming it");
            boolean flag1 = getActivity().getIntent().getBooleanExtra("lockscreen.weak_fallback", false);
            int j = upgradeQuality(i, null);
            if (j >= 0x20000)
            {
                int k = mDPM.getPasswordMinimumLength(null);
                if (k < 4)
                    k = 4;
                int l = mDPM.getPasswordMaximumLength(j);
                Intent intent3 = (new Intent()).setClass(getActivity(), com/android/settings/ChooseLockPassword);
                intent3.putExtra("lockscreen.password_type", j);
                intent3.putExtra("lockscreen.password_min", k);
                intent3.putExtra("lockscreen.password_max", l);
                intent3.putExtra("confirm_credentials", false);
                intent3.putExtra("lockscreen.weak_fallback", flag1);
                if (flag1)
                {
                    String s3 = getActivity().getIntent().getStringExtra("lockscreen.weak_fallback_for");
                    String s4 = getActivity().getIntent().getStringExtra("settings_command_key");
                    String s5 = getActivity().getIntent().getStringExtra("settings_command_value");
                    intent3.putExtra("settings_command_key", s4);
                    intent3.putExtra("settings_command_value", s5);
                    intent3.putExtra("lockscreen.weak_fallback_for", s3);
                    startActivityForResult(intent3, 101);
                    return;
                } else
                {
                    mFinishPending = true;
                    intent3.addFlags(0x2000000);
                    startActivity(intent3);
                    return;
                }
            }
            if (j == 0x10000)
            {
                Intent intent2 = new Intent(getActivity(), com/android/settings/ChooseLockPattern);
                intent2.putExtra("key_lock_method", "pattern");
                intent2.putExtra("confirm_credentials", false);
                intent2.putExtra("lockscreen.weak_fallback", flag1);
                if (flag1)
                {
                    String s = getActivity().getIntent().getStringExtra("lockscreen.weak_fallback_for");
                    String s1 = getActivity().getIntent().getStringExtra("settings_command_key");
                    String s2 = getActivity().getIntent().getStringExtra("settings_command_value");
                    intent2.putExtra("settings_command_key", s1);
                    intent2.putExtra("settings_command_value", s2);
                    intent2.putExtra("lockscreen.weak_fallback_for", s);
                    startActivityForResult(intent2, 101);
                    return;
                } else
                {
                    mFinishPending = true;
                    intent2.addFlags(0x2000000);
                    startActivity(intent2);
                    return;
                }
            }
            if (j == 32768)
            {
                Intent intent1 = getBiometricSensorIntent();
                mFinishPending = true;
                startActivity(intent1);
                return;
            }
            if (j == 16384)
            {
                Intent intent = getVoiceSensorIntent();
                mFinishPending = true;
                startActivity(intent);
                return;
            }
            if (j == 0)
            {
                mChooseLockSettingsHelper.utils().clearLock(false);
                mChooseLockSettingsHelper.utils().setLockScreenDisabled(flag);
                getActivity().setResult(-1);
                finish();
                return;
            } else
            {
                finish();
                return;
            }
        }

        public ChooseLockGenericFragment()
        {
            mPasswordConfirmed = false;
            mWaitingForConfirmation = false;
            mFinishPending = false;
        }
    }



    public Intent getIntent()
    {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":android:show_fragment", com/android/settings/ChooseLockGeneric$ChooseLockGenericFragment.getName());
        intent.putExtra(":android:no_headers", true);
        return intent;
    }
}
