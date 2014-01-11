// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.tts;

import android.app.Activity;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.preference.*;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TtsEngines;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.android.settings.SettingsPreferenceFragment;
import com.google.common.collect.Lists;
import java.util.*;

public class TtsEngineSettingsFragment extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceClickListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final boolean DBG = false;
    private static final String KEY_ENGINE_LOCALE = "tts_default_lang";
    private static final String KEY_ENGINE_SETTINGS = "tts_engine_settings";
    private static final String KEY_INSTALL_DATA = "tts_install_data";
    private static final String TAG = "TtsEngineSettings";
    private static final int VOICE_DATA_INTEGRITY_CHECK = 1977;
    private Intent mEngineSettingsIntent;
    private Preference mEngineSettingsPreference;
    private TtsEngines mEnginesHelper;
    private Preference mInstallVoicesPreference;
    private final BroadcastReceiver mLanguagesChangedReceiver = new BroadcastReceiver() {

        final TtsEngineSettingsFragment this$0;

        public void onReceive(Context context, Intent intent)
        {
            if ("android.speech.tts.engine.TTS_DATA_INSTALLED".equals(intent.getAction()))
                checkTtsData();
        }

            
            {
                this$0 = TtsEngineSettingsFragment.this;
                super();
            }
    }
;
    private ListPreference mLocalePreference;
    private TextToSpeech mTts;
    private final android.speech.tts.TextToSpeech.OnInitListener mTtsInitListener = new android.speech.tts.TextToSpeech.OnInitListener() {

        final TtsEngineSettingsFragment this$0;

        public void onInit(int i)
        {
            if (i != 0)
            {
                finishFragment();
                return;
            } else
            {
                getActivity().runOnUiThread(new Runnable() {

                    final _cls1 this$1;

                    public void run()
                    {
                        mLocalePreference.setEnabled(true);
                    }

            
            {
                this$1 = _cls1.this;
                super();
            }
                }
);
                return;
            }
        }

            
            {
                this$0 = TtsEngineSettingsFragment.this;
                super();
            }
    }
;
    private Intent mVoiceDataDetails;


    private final void checkTtsData()
    {
        Intent intent = new Intent("android.speech.tts.engine.CHECK_TTS_DATA");
        intent.setPackage(getEngineName());
        try
        {
            startActivityForResult(intent, 1977);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("TtsEngineSettings", (new StringBuilder()).append("Failed to check TTS data, no activity found for ").append(intent).append(")").toString());
        }
    }

    private String getEngineLabel()
    {
        return getArguments().getString("label");
    }

    private String getEngineName()
    {
        return getArguments().getString("name");
    }

    private void installVoiceData()
    {
        if (TextUtils.isEmpty(getEngineName()))
            return;
        Intent intent = new Intent("android.speech.tts.engine.INSTALL_TTS_DATA");
        intent.addFlags(0x10000000);
        intent.setPackage(getEngineName());
        try
        {
            Log.v("TtsEngineSettings", (new StringBuilder()).append("Installing voice data: ").append(intent.toUri(0)).toString());
            startActivity(intent);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("TtsEngineSettings", (new StringBuilder()).append("Failed to install TTS data, no acitivty found for ").append(intent).append(")").toString());
        }
    }

    private void updateDefaultLocalePref(ArrayList arraylist)
    {
        String s = mEnginesHelper.getLocalePrefForEngine(getEngineName());
        ArrayList arraylist1 = Lists.newArrayListWithCapacity(arraylist.size());
        for (int i = 0; i < arraylist.size(); i++)
        {
            String as[] = ((String)arraylist.get(i)).split("-");
            Locale locale;
            if (as.length == 1)
                locale = new Locale(as[0]);
            else
            if (as.length == 2)
            {
                locale = new Locale(as[0], as[1]);
            } else
            {
                int i1 = as.length;
                locale = null;
                if (i1 == 3)
                    locale = new Locale(as[0], as[1], as[2]);
            }
            if (locale != null)
                arraylist1.add(new Pair(locale.getDisplayName(), arraylist.get(i)));
        }

        Collections.sort(arraylist1, new Comparator() {

            final TtsEngineSettingsFragment this$0;

            public int compare(Pair pair1, Pair pair2)
            {
                return ((String)pair1.first).compareToIgnoreCase((String)pair2.first);
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((Pair)obj, (Pair)obj1);
            }

            
            {
                this$0 = TtsEngineSettingsFragment.this;
                super();
            }
        }
);
        int j = -1;
        CharSequence acharsequence[] = new CharSequence[arraylist.size()];
        CharSequence acharsequence1[] = new CharSequence[arraylist.size()];
        int k = 0;
        for (Iterator iterator = arraylist1.iterator(); iterator.hasNext();)
        {
            Pair pair = (Pair)iterator.next();
            if (((String)pair.second).equalsIgnoreCase(s))
                j = k;
            acharsequence[k] = (CharSequence)pair.first;
            int l = k + 1;
            acharsequence1[k] = (CharSequence)pair.second;
            k = l;
        }

        mLocalePreference.setEntries(acharsequence);
        mLocalePreference.setEntryValues(acharsequence1);
        if (j > -1)
        {
            mLocalePreference.setValueIndex(j);
            return;
        } else
        {
            mLocalePreference.setValueIndex(0);
            updateLanguageTo((String)arraylist.get(0));
            return;
        }
    }

    private void updateLanguageTo(String s)
    {
        mEnginesHelper.updateLocalePrefForEngine(getEngineName(), s);
        if (getEngineName().equals(mTts.getCurrentEngine()))
        {
            String as[] = TtsEngines.parseLocalePref(s);
            if (as != null)
                mTts.setLanguage(new Locale(as[0], as[1], as[2]));
        }
    }

    private void updateVoiceDetails()
    {
        ArrayList arraylist = mVoiceDataDetails.getStringArrayListExtra("availableVoices");
        ArrayList arraylist1 = mVoiceDataDetails.getStringArrayListExtra("unavailableVoices");
        if (arraylist == null)
        {
            Log.e("TtsEngineSettings", "TTS data check failed (available == null).");
            mLocalePreference.setEnabled(false);
            getPreferenceScreen().removePreference(mLocalePreference);
        } else
        {
            if (arraylist1 != null && arraylist1.size() > 0)
            {
                mInstallVoicesPreference.setEnabled(true);
                getPreferenceScreen().addPreference(mInstallVoicesPreference);
            } else
            {
                getPreferenceScreen().removePreference(mInstallVoicesPreference);
            }
            if (arraylist.size() > 0)
            {
                mLocalePreference.setEnabled(true);
                getPreferenceScreen().addPreference(mLocalePreference);
                updateDefaultLocalePref(arraylist);
            } else
            {
                mLocalePreference.setEnabled(false);
                getPreferenceScreen().removePreference(mLocalePreference);
            }
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("market://search?q=dummy"));
            if (getPackageManager().queryIntentActivities(intent, 0).size() == 0)
            {
                Log.e("TtsEngineSettings", "Google Market is not installed.");
                mEngineSettingsPreference.setEnabled(false);
                mInstallVoicesPreference.setEnabled(false);
                return;
            }
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 1977)
        {
            mVoiceDataDetails = intent;
            updateVoiceDetails();
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050040);
        mEnginesHelper = new TtsEngines(getActivity());
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mLocalePreference = (ListPreference)preferencescreen.findPreference("tts_default_lang");
        mLocalePreference.setOnPreferenceChangeListener(this);
        mEngineSettingsPreference = preferencescreen.findPreference("tts_engine_settings");
        mEngineSettingsPreference.setOnPreferenceClickListener(this);
        mInstallVoicesPreference = preferencescreen.findPreference("tts_install_data");
        mInstallVoicesPreference.setOnPreferenceClickListener(this);
        preferencescreen.removePreference(mInstallVoicesPreference);
        preferencescreen.removePreference(mLocalePreference);
        preferencescreen.setTitle(getEngineLabel());
        preferencescreen.setKey(getEngineName());
        Preference preference = mEngineSettingsPreference;
        Resources resources = getResources();
        Object aobj[] = new Object[1];
        aobj[0] = getEngineLabel();
        preference.setTitle(resources.getString(0x7f0b07b7, aobj));
        mEngineSettingsIntent = mEnginesHelper.getSettingsIntent(getEngineName());
        if (mEngineSettingsIntent == null)
            mEngineSettingsPreference.setEnabled(false);
        mInstallVoicesPreference.setEnabled(false);
        mLocalePreference.setEnabled(false);
        mLocalePreference.setEntries(new CharSequence[0]);
        mLocalePreference.setEntryValues(new CharSequence[0]);
        mVoiceDataDetails = (Intent)getArguments().getParcelable("voices");
        mTts = new TextToSpeech(getActivity().getApplicationContext(), mTtsInitListener, getEngineName());
        checkTtsData();
        getActivity().registerReceiver(mLanguagesChangedReceiver, new IntentFilter("android.speech.tts.engine.TTS_DATA_INSTALLED"));
    }

    public void onDestroy()
    {
        getActivity().unregisterReceiver(mLanguagesChangedReceiver);
        mTts.shutdown();
        super.onDestroy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mLocalePreference)
        {
            updateLanguageTo((String)obj);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mInstallVoicesPreference)
        {
            installVoiceData();
            return true;
        }
        if (preference == mEngineSettingsPreference)
        {
            startActivity(mEngineSettingsIntent);
            return true;
        } else
        {
            return false;
        }
    }


}
