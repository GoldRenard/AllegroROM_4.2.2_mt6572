// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.tts;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TtsEngines;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Checkable;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings.tts:
//            TtsEnginePreference

public class TextToSpeechSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, android.preference.Preference.OnPreferenceClickListener, TtsEnginePreference.RadioButtonGroupState
{

    private static final boolean DBG = true;
    private static final int GET_SAMPLE_TEXT = 1983;
    private static final String KEY_DEFAULT_RATE = "tts_default_rate";
    private static final String KEY_ENGINE_PREFERENCE_SECTION = "tts_engine_preference_section";
    private static final String KEY_PLAY_EXAMPLE = "tts_play_example";
    private static final String TAG = "TextToSpeechSettings";
    private static final int VOICE_DATA_INTEGRITY_CHECK = 1977;
    private Checkable mCurrentChecked;
    private String mCurrentEngine;
    private int mDefaultRate;
    private ListPreference mDefaultRatePref;
    private PreferenceCategory mEnginePreferenceCategory;
    private TtsEngines mEnginesHelper;
    private final android.speech.tts.TextToSpeech.OnInitListener mInitListener = new android.speech.tts.TextToSpeech.OnInitListener() {

        final TextToSpeechSettings this$0;

        public void onInit(int i)
        {
            onInitEngine(i);
        }

            
            {
                this$0 = TextToSpeechSettings.this;
                super();
            }
    }
;
    private Preference mPlayExample;
    private String mPreviousEngine;
    private TextToSpeech mTts;
    private final android.speech.tts.TextToSpeech.OnInitListener mUpdateListener = new android.speech.tts.TextToSpeech.OnInitListener() {

        final TextToSpeechSettings this$0;

        public void onInit(int i)
        {
            onUpdateEngine(i);
        }

            
            {
                this$0 = TextToSpeechSettings.this;
                super();
            }
    }
;

    public TextToSpeechSettings()
    {
        mDefaultRate = 100;
        mTts = null;
        mEnginesHelper = null;
    }

    private void checkVoiceData(String s)
    {
        Intent intent = new Intent("android.speech.tts.engine.CHECK_TTS_DATA");
        intent.setPackage(s);
        try
        {
            Log.d("TextToSpeechSettings", (new StringBuilder()).append("Updating engine: Checking voice data: ").append(intent.toUri(0)).toString());
            startActivityForResult(intent, 1977);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("TextToSpeechSettings", (new StringBuilder()).append("Failed to check TTS data, no activity found for ").append(intent).append(")").toString());
        }
    }

    private void displayDataAlert(final String key)
    {
        Log.i("TextToSpeechSettings", (new StringBuilder()).append("Displaying data alert for :").append(key).toString());
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        builder.setTitle(0x1040014);
        builder.setIconAttribute(0x1010355);
        Activity activity = getActivity();
        Object aobj[] = new Object[1];
        aobj[0] = mEnginesHelper.getEngineInfo(key).label;
        builder.setMessage(activity.getString(0x7f0b07b1, aobj));
        builder.setCancelable(true);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final TextToSpeechSettings this$0;
            final String val$key;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                updateDefaultEngine(key);
            }

            
            {
                this$0 = TextToSpeechSettings.this;
                key = s;
                super();
            }
        }
);
        builder.setNegativeButton(0x1040000, null);
        builder.create().show();
    }

    private String getDefaultSampleString()
    {
        if (mTts != null && mTts.getLanguage() != null)
        {
            String s = mTts.getLanguage().getISO3Language();
            String as[] = getActivity().getResources().getStringArray(0x7f07000e);
            String as1[] = getActivity().getResources().getStringArray(0x7f07000f);
            for (int i = 0; i < as.length; i++)
                if (as1[i].equals(s))
                    return as[i];

        }
        return null;
    }

    private void getSampleText()
    {
        String s = mTts.getCurrentEngine();
        if (TextUtils.isEmpty(s))
            s = mTts.getDefaultEngine();
        Locale locale = mTts.getLanguage();
        Intent intent = new Intent("android.speech.tts.engine.GET_SAMPLE_TEXT");
        if (locale != null)
        {
            intent.putExtra("language", locale.getLanguage());
            intent.putExtra("country", locale.getCountry());
            intent.putExtra("variant", locale.getVariant());
        }
        intent.setPackage(s);
        try
        {
            Log.d("TextToSpeechSettings", (new StringBuilder()).append("Getting sample text: ").append(intent.toUri(0)).toString());
            startActivityForResult(intent, 1983);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("TextToSpeechSettings", (new StringBuilder()).append("Failed to get sample text, no activity found for ").append(intent).append(")").toString());
        }
    }

    private void initSettings()
    {
        android.content.ContentResolver contentresolver = getContentResolver();
        try
        {
            mDefaultRate = android.provider.Settings.Secure.getInt(contentresolver, "tts_default_rate");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            mDefaultRate = 100;
        }
        mDefaultRatePref.setValue(String.valueOf(mDefaultRate));
        mDefaultRatePref.setOnPreferenceChangeListener(this);
        mCurrentEngine = mTts.getCurrentEngine();
        if (getActivity() instanceof PreferenceActivity)
        {
            PreferenceActivity preferenceactivity = (PreferenceActivity)getActivity();
            mEnginePreferenceCategory.removeAll();
            TtsEnginePreference ttsenginepreference;
            for (Iterator iterator = mEnginesHelper.getEngines().iterator(); iterator.hasNext(); mEnginePreferenceCategory.addPreference(ttsenginepreference))
            {
                android.speech.tts.TextToSpeech.EngineInfo engineinfo = (android.speech.tts.TextToSpeech.EngineInfo)iterator.next();
                ttsenginepreference = new TtsEnginePreference(getActivity(), engineinfo, this, preferenceactivity);
            }

        } else
        {
            throw new IllegalStateException("TextToSpeechSettings used outside a PreferenceActivity");
        }
        checkVoiceData(mCurrentEngine);
    }

    private void onSampleTextReceived(int i, Intent intent)
    {
        String s = getDefaultSampleString();
        if (i == 0 && intent != null)
        {
            if (intent != null && intent.getStringExtra("sampleText") != null)
                s = intent.getStringExtra("sampleText");
            Log.d("TextToSpeechSettings", (new StringBuilder()).append("Got sample text: ").append(s).toString());
        } else
        {
            Log.d("TextToSpeechSettings", (new StringBuilder()).append("Using default sample text :").append(s).toString());
        }
        if (s != null && mTts != null)
        {
            mTts.speak(s, 0, null);
            return;
        } else
        {
            Log.e("TextToSpeechSettings", "Did not have a sample string for the requested language");
            return;
        }
    }

    private void onVoiceDataIntegrityCheckDone(Intent intent)
    {
        String s = mTts.getCurrentEngine();
        if (s == null)
        {
            Log.e("TextToSpeechSettings", "Voice data check complete, but no engine bound");
            return;
        }
        if (intent == null)
        {
            Log.e("TextToSpeechSettings", (new StringBuilder()).append("Engine failed voice data integrity check (null return)").append(mTts.getCurrentEngine()).toString());
            return;
        }
        android.provider.Settings.Secure.putString(getContentResolver(), "tts_default_synth", s);
        int i = mEnginePreferenceCategory.getPreferenceCount();
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    Preference preference = mEnginePreferenceCategory.getPreference(j);
                    if (!(preference instanceof TtsEnginePreference))
                        break label0;
                    TtsEnginePreference ttsenginepreference = (TtsEnginePreference)preference;
                    if (!ttsenginepreference.getKey().equals(s))
                        break label0;
                    ttsenginepreference.setVoiceDataDetails(intent);
                }
                updateWidgetState(true);
                return;
            }
            j++;
        } while (true);
    }

    private boolean shouldDisplayDataAlert(String s)
    {
        return !mEnginesHelper.getEngineInfo(s).system;
    }

    private void updateDefaultEngine(String s)
    {
        Log.d("TextToSpeechSettings", (new StringBuilder()).append("Updating default synth to : ").append(s).toString());
        updateWidgetState(false);
        mPreviousEngine = mTts.getCurrentEngine();
        if (mTts != null)
            try
            {
                mTts.shutdown();
                mTts = null;
            }
            catch (Exception exception)
            {
                Log.e("TextToSpeechSettings", (new StringBuilder()).append("Error shutting down TTS engine").append(exception).toString());
            }
        Log.d("TextToSpeechSettings", (new StringBuilder()).append("Updating engine : Attempting to connect to engine: ").append(s).toString());
        mTts = new TextToSpeech(getActivity().getApplicationContext(), mUpdateListener, s);
    }

    private void updateWidgetState(boolean flag)
    {
        mPlayExample.setEnabled(flag);
        mDefaultRatePref.setEnabled(flag);
    }

    public Checkable getCurrentChecked()
    {
        return mCurrentChecked;
    }

    public String getCurrentKey()
    {
        return mCurrentEngine;
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 1983)
            onSampleTextReceived(j, intent);
        else
        if (i == 1977)
        {
            onVoiceDataIntegrityCheckDone(intent);
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050041);
        getActivity().setVolumeControlStream(3);
        mPlayExample = findPreference("tts_play_example");
        mPlayExample.setOnPreferenceClickListener(this);
        mEnginePreferenceCategory = (PreferenceCategory)findPreference("tts_engine_preference_section");
        mDefaultRatePref = (ListPreference)findPreference("tts_default_rate");
        mTts = new TextToSpeech(getActivity().getApplicationContext(), mInitListener);
        mEnginesHelper = new TtsEngines(getActivity().getApplicationContext());
        initSettings();
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mTts != null)
        {
            mTts.shutdown();
            mTts = null;
        }
    }

    public void onInitEngine(int i)
    {
        if (i == 0)
        {
            updateWidgetState(true);
            Log.d("TextToSpeechSettings", "TTS engine for settings screen initialized.");
            return;
        } else
        {
            Log.d("TextToSpeechSettings", "TTS engine for settings screen failed to initialize successfully.");
            updateWidgetState(false);
            return;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if ("tts_default_rate".equals(preference.getKey()))
        {
            mDefaultRate = Integer.parseInt((String)obj);
            try
            {
                android.provider.Settings.Secure.putInt(getContentResolver(), "tts_default_rate", mDefaultRate);
                if (mTts != null)
                    mTts.setSpeechRate((float)mDefaultRate / 100F);
                Log.d("TextToSpeechSettings", (new StringBuilder()).append("TTS default rate changed, now ").append(mDefaultRate).toString());
            }
            catch (NumberFormatException numberformatexception)
            {
                Log.e("TextToSpeechSettings", "could not persist default TTS rate setting", numberformatexception);
            }
        }
        return true;
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mPlayExample)
        {
            getSampleText();
            return true;
        } else
        {
            return false;
        }
    }

    public void onUpdateEngine(int i)
    {
        if (i == 0)
        {
            Log.d("TextToSpeechSettings", (new StringBuilder()).append("Updating engine: Successfully bound to the engine: ").append(mTts.getCurrentEngine()).toString());
            checkVoiceData(mTts.getCurrentEngine());
            return;
        }
        Log.d("TextToSpeechSettings", "Updating engine: Failed to bind to engine, reverting.");
        if (mPreviousEngine != null)
            mTts = new TextToSpeech(getActivity().getApplicationContext(), mInitListener, mPreviousEngine);
        mPreviousEngine = null;
    }

    public void setCurrentChecked(Checkable checkable)
    {
        mCurrentChecked = checkable;
    }

    public void setCurrentKey(String s)
    {
        Xlog.d("TextToSpeechSettings", (new StringBuilder()).append("setCurrentKey--->> ").append(s).toString());
        mCurrentEngine = s;
        if (shouldDisplayDataAlert(mCurrentEngine))
        {
            displayDataAlert(mCurrentEngine);
            return;
        } else
        {
            updateDefaultEngine(mCurrentEngine);
            return;
        }
    }

}
