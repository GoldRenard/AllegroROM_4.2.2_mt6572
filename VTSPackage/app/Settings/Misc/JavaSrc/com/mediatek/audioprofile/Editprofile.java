// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.audioprofile;

import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.*;
import android.telephony.TelephonyManager;
import android.widget.ListView;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.Observable;
import java.util.Observer;

// Referenced classes of package com.mediatek.audioprofile:
//            RingerVolumePreference, DefaultRingtonePreference, AudioProfileManager

public class Editprofile extends SettingsPreferenceFragment
{

    public static final String KEY_CATEGORY_NOTIFICATION = "notifications";
    public static final String KEY_CATEGORY_RINGTONE = "ringtone";
    public static final String KEY_DTMF_TONE = "audible_touch_tones";
    public static final String KEY_HAPTIC_FEEDBACK = "haptic_feedback";
    public static final String KEY_LOCK_SOUNDS = "screen_lock_sounds";
    public static final String KEY_NOTIFY = "notifications_ringtone";
    public static final String KEY_RINGTONE = "phone_ringtone";
    public static final String KEY_SOUND_EFFECTS = "audible_selection";
    public static final String KEY_VIBRATE = "phone_vibrate";
    public static final String KEY_VIDEO_RINGTONE = "video_call_ringtone";
    public static final String KEY_VOLUME = "ring_volume";
    private static final String TAG = "Settings/EditProfile";
    private ContentQueryMap mContentQueryMap;
    private int mCurOrientation;
    private CheckBoxPreference mDtmfTone;
    private CheckBoxPreference mHapticFeedback;
    private boolean mIsSilentMode;
    private String mKey;
    private CheckBoxPreference mLockSounds;
    private AudioProfileManager mProfileManager;
    private Cursor mSettingsCursor;
    private Observer mSettingsObserver;
    private CheckBoxPreference mSoundEffects;
    private TelephonyManager mTeleManager;
    private CheckBoxPreference mVibrat;
    private RingerVolumePreference mVolumePref;


    private void initPreference()
    {
        PreferenceScreen preferencescreen;
        PreferenceGroup preferencegroup;
label0:
        {
            preferencescreen = getPreferenceScreen();
            mVibrat = (CheckBoxPreference)findPreference("phone_vibrate");
            mDtmfTone = (CheckBoxPreference)findPreference("audible_touch_tones");
            mSoundEffects = (CheckBoxPreference)findPreference("audible_selection");
            mLockSounds = (CheckBoxPreference)findPreference("screen_lock_sounds");
            mHapticFeedback = (CheckBoxPreference)findPreference("haptic_feedback");
            mVolumePref = (RingerVolumePreference)findPreference("ring_volume");
            preferencegroup = (PreferenceGroup)findPreference("ringtone");
            PreferenceGroup preferencegroup1 = (PreferenceGroup)findPreference("notifications");
            DefaultRingtonePreference defaultringtonepreference = (DefaultRingtonePreference)preferencegroup1.findPreference("notifications_ringtone");
            if (mIsSilentMode)
            {
                preferencescreen.removePreference(mDtmfTone);
                preferencescreen.removePreference(mSoundEffects);
                preferencescreen.removePreference(mLockSounds);
                preferencescreen.removePreference(mVolumePref);
                preferencescreen.removePreference(preferencegroup);
                preferencescreen.removePreference(preferencegroup1);
            } else
            {
                if (mVolumePref != null)
                    mVolumePref.setProfile(mKey);
                if (defaultringtonepreference != null)
                {
                    defaultringtonepreference.setStreamType("NOTIFICATION");
                    defaultringtonepreference.setProfile(mKey);
                    defaultringtonepreference.setRingtoneType(2);
                }
                if (!isVoiceCapable())
                    break label0;
                DefaultRingtonePreference defaultringtonepreference1 = (DefaultRingtonePreference)preferencegroup.findPreference("phone_ringtone");
                DefaultRingtonePreference defaultringtonepreference2 = (DefaultRingtonePreference)preferencegroup.findPreference("video_call_ringtone");
                preferencegroup.removePreference(defaultringtonepreference2);
                defaultringtonepreference1.setTitle(0x7f0b04e1);
                defaultringtonepreference1.setSummary(0x7f0b04e2);
                if (defaultringtonepreference1 != null)
                {
                    defaultringtonepreference1.setStreamType("RING");
                    defaultringtonepreference1.setProfile(mKey);
                    defaultringtonepreference1.setRingtoneType(1);
                }
                if (defaultringtonepreference2 != null)
                {
                    defaultringtonepreference2.setStreamType("RING");
                    defaultringtonepreference2.setProfile(mKey);
                    defaultringtonepreference2.setRingtoneType(8);
                    return;
                }
            }
            return;
        }
        if (!isSmsCapable())
            preferencescreen.removePreference(mVibrat);
        preferencescreen.removePreference(mDtmfTone);
        preferencescreen.removePreference(preferencegroup);
    }

    private boolean isSmsCapable()
    {
        return mTeleManager != null && mTeleManager.isSmsCapable();
    }

    private boolean isVoiceCapable()
    {
        return mTeleManager != null && mTeleManager.isVoiceCapable();
    }

    private void updatePreference()
    {
        mVibrat.setChecked(mProfileManager.getVibrationEnabled(mKey));
        mDtmfTone.setChecked(mProfileManager.getDtmfToneEnabled(mKey));
        mSoundEffects.setChecked(mProfileManager.getSoundEffectEnabled(mKey));
        mLockSounds.setChecked(mProfileManager.getLockScreenEnabled(mKey));
        mHapticFeedback.setChecked(mProfileManager.getHapticFeedbackEnabled(mKey));
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        Xlog.d("Settings/EditProfile", (new StringBuilder()).append("onConfigurationChanged: newConfig = ").append(configuration).append(",mCurOrientation = ").append(mCurOrientation).append(",this = ").append(this).toString());
        super.onConfigurationChanged(configuration);
        if (configuration != null && configuration.orientation != mCurOrientation)
            mCurOrientation = configuration.orientation;
        getListView().clearScrapViewsIfNeeded();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050019);
        mTeleManager = (TelephonyManager)getSystemService("phone");
        PreferenceActivity preferenceactivity = (PreferenceActivity)getActivity();
        boolean flag;
        if (!preferenceactivity.onIsHidingHeaders() && preferenceactivity.onIsMultiPane())
            flag = false;
        else
            flag = true;
        Bundle bundle1;
        if (flag)
            bundle1 = preferenceactivity.getIntent().getBundleExtra(":android:show_fragment_args");
        else
            bundle1 = getArguments();
        Xlog.d("Settings/EditProfile", (new StringBuilder()).append("onCreate activity = ").append(preferenceactivity).append(",singlePane = ").append(flag).append(",bundle = ").append(bundle1).append(",this = ").append(this).toString());
        mKey = bundle1.getString("profileKey");
        mProfileManager = (AudioProfileManager)getSystemService("audioprofile");
        mIsSilentMode = AudioProfileManager.getScenario(mKey).equals(AudioProfileManager.Scenario.SILENT);
        mCurOrientation = getResources().getConfiguration().orientation;
        initPreference();
    }

    public void onPause()
    {
        super.onPause();
        Xlog.d("Settings/EditProfile", "onPause");
        if (mVolumePref != null)
        {
            Xlog.d("Settings/EditProfile", "pref is not null");
            mVolumePref.stopPlaying();
            mVolumePref.revertVolume();
        }
        if (mSettingsObserver != null)
            mContentQueryMap.deleteObserver(mSettingsObserver);
        if (mSettingsCursor != null)
        {
            mSettingsCursor.close();
            mSettingsCursor = null;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference.getKey().equals("phone_vibrate"))
        {
            boolean flag = mVibrat.isChecked();
            Xlog.d("Settings/EditProfile", (new StringBuilder()).append("set vibrate").append(flag).toString());
            mProfileManager.setVibrationEnabled(mKey, flag);
        } else
        if (preference.getKey().equals("audible_touch_tones"))
            mProfileManager.setDtmfToneEnabled(mKey, mDtmfTone.isChecked());
        else
        if (preference.getKey().equals("audible_selection"))
            mProfileManager.setSoundEffectEnabled(mKey, mSoundEffects.isChecked());
        else
        if (preference.getKey().equals("screen_lock_sounds"))
            mProfileManager.setLockScreenEnabled(mKey, mLockSounds.isChecked());
        else
        if (preference.getKey().equals("haptic_feedback"))
            mProfileManager.setHapticFeedbackEnabled(mKey, mHapticFeedback.isChecked());
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        updatePreference();
        if (mIsSilentMode && mSettingsObserver == null)
        {
            mSettingsObserver = new Observer() {

                final Editprofile this$0;

                public void update(Observable observable, Object obj)
                {
                    Xlog.d("Settings/EditProfile", "update");
                    if (mVibrat != null)
                    {
                        String s = AudioProfileManager.getVibrationKey(mKey);
                        Xlog.d("Settings/EditProfile", (new StringBuilder()).append("name ").append(s).toString());
                        String s1 = android.provider.Settings.System.getString(getContentResolver(), s);
                        if (s1 != null)
                        {
                            mVibrat.setChecked("true".equals(s1));
                            Xlog.d("Settings/EditProfile", (new StringBuilder()).append("vibrate setting is ").append("true".equals(s1)).toString());
                        }
                    }
                }

            
            {
                this$0 = Editprofile.this;
                super();
            }
            }
;
            mContentQueryMap.addObserver(mSettingsObserver);
        }
    }

    public void onStart()
    {
        super.onStart();
        ContentResolver contentresolver = getContentResolver();
        android.net.Uri uri = android.provider.Settings.System.CONTENT_URI;
        String as[] = new String[1];
        as[0] = AudioProfileManager.getVibrationKey(mKey);
        mSettingsCursor = contentresolver.query(uri, null, "(name=?)", as, null);
        mContentQueryMap = new ContentQueryMap(mSettingsCursor, "name", true, null);
    }



}
