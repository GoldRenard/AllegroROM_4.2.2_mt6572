// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.media.AudioManager;
import android.media.RingtoneManager;
import android.os.*;
import android.preference.*;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.android.settings.bluetooth.DockEventReceiver;
import java.util.List;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, Utils

public class SoundSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final int DIALOG_NOT_DOCKED = 1;
    private static final int FALLBACK_EMERGENCY_TONE_VALUE = 0;
    private static final String KEY_CATEGORY_CALLS = "category_calls_and_notification";
    private static final String KEY_DOCK_AUDIO_MEDIA_ENABLED = "dock_audio_media_enabled";
    private static final String KEY_DOCK_AUDIO_SETTINGS = "dock_audio";
    private static final String KEY_DOCK_CATEGORY = "dock_category";
    private static final String KEY_DOCK_SOUNDS = "dock_sounds";
    private static final String KEY_DTMF_TONE = "dtmf_tone";
    private static final String KEY_EMERGENCY_TONE = "emergency_tone";
    private static final String KEY_HAPTIC_FEEDBACK = "haptic_feedback";
    private static final String KEY_LOCK_SOUNDS = "lock_sounds";
    private static final String KEY_MUSICFX = "musicfx";
    private static final String KEY_NOTIFICATION_SOUND = "notification_sound";
    private static final String KEY_RINGTONE = "ringtone";
    private static final String KEY_RING_VOLUME = "ring_volume";
    private static final String KEY_SOUND_EFFECTS = "sound_effects";
    private static final String KEY_SOUND_SETTINGS = "sound_settings";
    private static final String KEY_VIBRATE = "vibrate_when_ringing";
    private static final int MSG_UPDATE_NOTIFICATION_SUMMARY = 2;
    private static final int MSG_UPDATE_RINGTONE_SUMMARY = 1;
    private static final String NEED_VOICE_CAPABILITY[] = {
        "ringtone", "dtmf_tone", "category_calls_and_notification", "emergency_tone"
    };
    private static final String TAG = "SoundSettings";
    private AudioManager mAudioManager;
    private CheckBoxPreference mDockAudioMediaEnabled;
    private Preference mDockAudioSettings;
    private Intent mDockIntent;
    private CheckBoxPreference mDockSounds;
    private CheckBoxPreference mDtmfTone;
    private Handler mHandler;
    private CheckBoxPreference mHapticFeedback;
    private CheckBoxPreference mLockSounds;
    private Preference mMusicFx;
    private Preference mNotificationPreference;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final SoundSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.DOCK_EVENT"))
                handleDockChange(intent);
        }

            
            {
                this$0 = SoundSettings.this;
                super();
            }
    }
;
    private Runnable mRingtoneLookupRunnable;
    private Preference mRingtonePreference;
    private CheckBoxPreference mSoundEffects;
    private PreferenceGroup mSoundSettings;
    private CheckBoxPreference mVibrateWhenRinging;

    public SoundSettings()
    {
        mHandler = new Handler() {

            final SoundSettings this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2: // '\002'
                    mNotificationPreference.setSummary((CharSequence)message.obj);
                    return;

                case 1: // '\001'
                    mRingtonePreference.setSummary((CharSequence)message.obj);
                    return;
                }
            }

            
            {
                this$0 = SoundSettings.this;
                super();
            }
        }
;
    }

    private Dialog createUndockedMessage()
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        builder.setTitle(0x7f0b0506);
        builder.setMessage(0x7f0b0507);
        builder.setPositiveButton(0x104000a, null);
        return builder.create();
    }

    private void handleDockChange(Intent intent)
    {
label0:
        {
label1:
            {
                boolean flag = true;
                if (mDockAudioSettings != null)
                {
                    int i = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
                    boolean flag1;
                    if (intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE") != null)
                        flag1 = flag;
                    else
                        flag1 = false;
                    mDockIntent = intent;
                    if (i == 0)
                        break label0;
                    ContentResolver contentresolver;
                    CheckBoxPreference checkboxpreference;
                    try
                    {
                        removeDialog(1);
                    }
                    catch (IllegalArgumentException illegalargumentexception) { }
                    if (!flag1)
                        break label1;
                    mDockAudioSettings.setEnabled(flag);
                }
                return;
            }
            if (i == 3)
            {
                contentresolver = getContentResolver();
                mDockAudioSettings.setEnabled(flag);
                if (android.provider.Settings.Global.getInt(contentresolver, "dock_audio_media_enabled", -1) == -1)
                    android.provider.Settings.Global.putInt(contentresolver, "dock_audio_media_enabled", 0);
                mDockAudioMediaEnabled = (CheckBoxPreference)findPreference("dock_audio_media_enabled");
                mDockAudioMediaEnabled.setPersistent(false);
                checkboxpreference = mDockAudioMediaEnabled;
                if (android.provider.Settings.Global.getInt(contentresolver, "dock_audio_media_enabled", 0) == 0)
                    flag = false;
                checkboxpreference.setChecked(flag);
                return;
            } else
            {
                mDockAudioSettings.setEnabled(false);
                return;
            }
        }
        mDockAudioSettings.setEnabled(false);
    }

    private void initDockSettings()
    {
        ContentResolver contentresolver = getContentResolver();
        if (needsDockSettings())
        {
            mDockSounds = (CheckBoxPreference)findPreference("dock_sounds");
            mDockSounds.setPersistent(false);
            CheckBoxPreference checkboxpreference = mDockSounds;
            boolean flag;
            if (android.provider.Settings.Global.getInt(contentresolver, "dock_sounds_enabled", 0) != 0)
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
            mDockAudioSettings = findPreference("dock_audio");
            mDockAudioSettings.setEnabled(false);
            return;
        } else
        {
            getPreferenceScreen().removePreference(findPreference("dock_category"));
            getPreferenceScreen().removePreference(findPreference("dock_audio"));
            getPreferenceScreen().removePreference(findPreference("dock_sounds"));
            android.provider.Settings.Global.putInt(contentresolver, "dock_audio_media_enabled", 1);
            return;
        }
    }

    private void lookupRingtoneNames()
    {
        (new Thread(mRingtoneLookupRunnable)).start();
    }

    private boolean needsDockSettings()
    {
        return getResources().getBoolean(0x7f090000);
    }

    private void updateRingtoneName(int i, Preference preference, int j)
    {
        if (preference != null) goto _L2; else goto _L1
_L1:
        Activity activity;
        return;
_L2:
        if ((activity = getActivity()) == null) goto _L1; else goto _L3
_L3:
        android.net.Uri uri;
        String s;
        uri = RingtoneManager.getActualDefaultRingtoneUri(activity, i);
        s = activity.getString(0x1040406);
        if (uri != null) goto _L5; else goto _L4
_L4:
        s = activity.getString(0x1040404);
_L7:
        mHandler.sendMessage(mHandler.obtainMessage(j, s));
        return;
_L5:
        Cursor cursor = activity.getContentResolver().query(uri, new String[] {
            "title"
        }, null, null, null);
        if (cursor != null)
            try
            {
                if (cursor.moveToFirst())
                    s = cursor.getString(0);
                cursor.close();
            }
            catch (SQLiteException sqliteexception) { }
        if (true) goto _L7; else goto _L6
_L6:
    }

    protected int getHelpResource()
    {
        return 0x7f0b092e;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        ContentResolver contentresolver = getContentResolver();
        int i = TelephonyManager.getDefault().getCurrentPhoneType();
        mAudioManager = (AudioManager)getSystemService("audio");
        addPreferencesFromResource(0x7f050038);
        if (2 != i)
            getPreferenceScreen().removePreference(findPreference("emergency_tone"));
        if (!getResources().getBoolean(0x7f090001))
            findPreference("ring_volume").setDependency(null);
        mVibrateWhenRinging = (CheckBoxPreference)findPreference("vibrate_when_ringing");
        mVibrateWhenRinging.setPersistent(false);
        CheckBoxPreference checkboxpreference = mVibrateWhenRinging;
        boolean flag;
        if (android.provider.Settings.System.getInt(contentresolver, "vibrate_when_ringing", 0) != 0)
            flag = true;
        else
            flag = false;
        checkboxpreference.setChecked(flag);
        mDtmfTone = (CheckBoxPreference)findPreference("dtmf_tone");
        mDtmfTone.setPersistent(false);
        CheckBoxPreference checkboxpreference1 = mDtmfTone;
        boolean flag1;
        if (android.provider.Settings.System.getInt(contentresolver, "dtmf_tone", 1) != 0)
            flag1 = true;
        else
            flag1 = false;
        checkboxpreference1.setChecked(flag1);
        mSoundEffects = (CheckBoxPreference)findPreference("sound_effects");
        mSoundEffects.setPersistent(false);
        CheckBoxPreference checkboxpreference2 = mSoundEffects;
        boolean flag2;
        if (android.provider.Settings.System.getInt(contentresolver, "sound_effects_enabled", 1) != 0)
            flag2 = true;
        else
            flag2 = false;
        checkboxpreference2.setChecked(flag2);
        mHapticFeedback = (CheckBoxPreference)findPreference("haptic_feedback");
        mHapticFeedback.setPersistent(false);
        CheckBoxPreference checkboxpreference3 = mHapticFeedback;
        boolean flag3;
        if (android.provider.Settings.System.getInt(contentresolver, "haptic_feedback_enabled", 1) != 0)
            flag3 = true;
        else
            flag3 = false;
        checkboxpreference3.setChecked(flag3);
        mLockSounds = (CheckBoxPreference)findPreference("lock_sounds");
        mLockSounds.setPersistent(false);
        CheckBoxPreference checkboxpreference4 = mLockSounds;
        boolean flag4;
        if (android.provider.Settings.System.getInt(contentresolver, "lockscreen_sounds_enabled", 1) != 0)
            flag4 = true;
        else
            flag4 = false;
        checkboxpreference4.setChecked(flag4);
        mRingtonePreference = findPreference("ringtone");
        mNotificationPreference = findPreference("notification_sound");
        Vibrator vibrator = (Vibrator)getSystemService("vibrator");
        if (vibrator == null || !vibrator.hasVibrator())
        {
            removePreference("vibrate_when_ringing");
            removePreference("haptic_feedback");
        }
        if (!Utils.isVoiceCapable(getActivity()))
            removePreference("vibrate_when_ringing");
        if (2 == i)
        {
            ListPreference listpreference = (ListPreference)findPreference("emergency_tone");
            listpreference.setValue(String.valueOf(android.provider.Settings.Global.getInt(contentresolver, "emergency_tone", 0)));
            listpreference.setOnPreferenceChangeListener(this);
        }
        mSoundSettings = (PreferenceGroup)findPreference("sound_settings");
        mMusicFx = mSoundSettings.findPreference("musicfx");
        Intent intent = new Intent("android.media.action.DISPLAY_AUDIO_EFFECT_CONTROL_PANEL");
        if (getPackageManager().queryIntentActivities(intent, 512).size() <= 2)
            mSoundSettings.removePreference(mMusicFx);
        if (!Utils.isVoiceCapable(getActivity()))
        {
            String as[] = NEED_VOICE_CAPABILITY;
            int j = as.length;
            for (int k = 0; k < j; k++)
            {
                Preference preference = findPreference(as[k]);
                if (preference != null)
                    getPreferenceScreen().removePreference(preference);
            }

        }
        mRingtoneLookupRunnable = new Runnable() {

            final SoundSettings this$0;

            public void run()
            {
                if (mRingtonePreference != null)
                    updateRingtoneName(1, mRingtonePreference, 1);
                if (mNotificationPreference != null)
                    updateRingtoneName(2, mNotificationPreference, 2);
            }

            
            {
                this$0 = SoundSettings.this;
                super();
            }
        }
;
        initDockSettings();
    }

    public Dialog onCreateDialog(int i)
    {
        if (i == 1)
            return createUndockedMessage();
        else
            return null;
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if ("emergency_tone".equals(preference.getKey()))
            try
            {
                int i = Integer.parseInt((String)obj);
                android.provider.Settings.Global.putInt(getContentResolver(), "emergency_tone", i);
            }
            catch (NumberFormatException numberformatexception)
            {
                Log.e("SoundSettings", "could not persist emergency tone setting", numberformatexception);
            }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag;
label0:
        {
            if (preference == mVibrateWhenRinging)
            {
                ContentResolver contentresolver6 = getContentResolver();
                boolean flag9 = mVibrateWhenRinging.isChecked();
                int i2 = 0;
                if (flag9)
                    i2 = 1;
                android.provider.Settings.System.putInt(contentresolver6, "vibrate_when_ringing", i2);
            } else
            if (preference == mDtmfTone)
            {
                ContentResolver contentresolver5 = getContentResolver();
                boolean flag8 = mDtmfTone.isChecked();
                int l1 = 0;
                if (flag8)
                    l1 = 1;
                android.provider.Settings.System.putInt(contentresolver5, "dtmf_tone", l1);
            } else
            if (preference == mSoundEffects)
            {
                if (mSoundEffects.isChecked())
                    mAudioManager.loadSoundEffects();
                else
                    mAudioManager.unloadSoundEffects();
                ContentResolver contentresolver4 = getContentResolver();
                boolean flag7 = mSoundEffects.isChecked();
                int k1 = 0;
                if (flag7)
                    k1 = 1;
                android.provider.Settings.System.putInt(contentresolver4, "sound_effects_enabled", k1);
            } else
            if (preference == mHapticFeedback)
            {
                ContentResolver contentresolver3 = getContentResolver();
                boolean flag6 = mHapticFeedback.isChecked();
                int j1 = 0;
                if (flag6)
                    j1 = 1;
                android.provider.Settings.System.putInt(contentresolver3, "haptic_feedback_enabled", j1);
            } else
            if (preference == mLockSounds)
            {
                ContentResolver contentresolver2 = getContentResolver();
                boolean flag5 = mLockSounds.isChecked();
                int i1 = 0;
                if (flag5)
                    i1 = 1;
                android.provider.Settings.System.putInt(contentresolver2, "lockscreen_sounds_enabled", i1);
            } else
            {
                Preference preference1 = mMusicFx;
                flag = false;
                if (preference == preference1)
                    break label0;
                if (preference == mDockAudioSettings)
                {
                    int k;
                    if (mDockIntent != null)
                        k = mDockIntent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
                    else
                        k = 0;
                    if (k == 0)
                    {
                        showDialog(1);
                    } else
                    {
                        boolean flag3;
                        if (mDockIntent.getParcelableExtra("android.bluetooth.device.extra.DEVICE") != null)
                            flag3 = true;
                        else
                            flag3 = false;
                        if (flag3)
                        {
                            Intent intent = new Intent(mDockIntent);
                            intent.setAction("com.android.settings.bluetooth.action.DOCK_SHOW_UI");
                            intent.setClass(getActivity(), com/android/settings/bluetooth/DockEventReceiver);
                            getActivity().sendBroadcast(intent);
                        } else
                        {
                            PreferenceScreen preferencescreen1 = (PreferenceScreen)mDockAudioSettings;
                            Bundle bundle = preferencescreen1.getExtras();
                            int l = android.provider.Settings.Global.getInt(getContentResolver(), "dock_audio_media_enabled", 0);
                            boolean flag4 = false;
                            if (l == 1)
                                flag4 = true;
                            bundle.putBoolean("checked", flag4);
                            super.onPreferenceTreeClick(preferencescreen1, preferencescreen1);
                        }
                    }
                } else
                if (preference == mDockSounds)
                {
                    ContentResolver contentresolver1 = getContentResolver();
                    boolean flag2 = mDockSounds.isChecked();
                    int j = 0;
                    if (flag2)
                        j = 1;
                    android.provider.Settings.Global.putInt(contentresolver1, "dock_sounds_enabled", j);
                } else
                if (preference == mDockAudioMediaEnabled)
                {
                    ContentResolver contentresolver = getContentResolver();
                    boolean flag1 = mDockAudioMediaEnabled.isChecked();
                    int i = 0;
                    if (flag1)
                        i = 1;
                    android.provider.Settings.Global.putInt(contentresolver, "dock_audio_media_enabled", i);
                }
            }
            flag = true;
        }
        return flag;
    }

    public void onResume()
    {
        super.onResume();
        lookupRingtoneNames();
        IntentFilter intentfilter = new IntentFilter("android.intent.action.DOCK_EVENT");
        getActivity().registerReceiver(mReceiver, intentfilter);
    }





}
